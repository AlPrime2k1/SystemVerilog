module test_mail();

class mail;
	rand bit[7:0] a=123;
	rand byte b=40;
endclass : mail

class generator;
	mail m_h;
	bit y;
	mailbox #(mail) gen_to_drv;

	function new(mailbox #(mail) gen_to_drv);
		this.gen_to_drv=gen_to_drv;
		//assert(m_h.randomize());
		//$display("MH_gen=%p",m_h);
	endfunction : new

	task run();
		repeat(10) begin
			m_h=new();
			assert(m_h.randomize());
			//gen_to_drv.put(m_h);
			y=gen_to_drv.try_put(m_h);
			$display("GENERATOR %p: y %0d",m_h,y);
			/*
			if(y)
				$display("SUCCESS in putting in");
			else
				$display("FAIL in put");
			*/
		end
		$display("-=-=-=-=-=-=-=-=-=-==-=-=-");
		$display("COUNT:%0d",gen_to_drv.num());
		$display("-=-=-=-=-=-=-=-=-=-==-=-=-");
	endtask : run
endclass : generator

class driver;
	mail m_h;//=new();
	bit y;
	mailbox #(mail) gen_to_drv;

	function new(mailbox #(mail) gen_to_drv);
		this.gen_to_drv=gen_to_drv;
		//assert(m_h.randomize());
		//$display("MH_drv=%p",m_h);
	endfunction : new

	task run();
		repeat(10) begin
			m_h=new();
			assert(m_h.randomize());
			//gen_to_drv.get(m_h);
			y=gen_to_drv.try_get(m_h);
			$display("DRIVER %p: y %0d",m_h,y);
			/*
			if(y)
				$display("SUCCESS in getting back");
			else
				$display("FAIL in get");
			*/
		end
	endtask : run

endclass : driver

mailbox #(mail) gen_to_drv=new();
generator gen1=new(gen_to_drv);
driver drv1=new(gen_to_drv);

initial begin
gen1.run();
drv1.run();
end
endmodule : test_mail