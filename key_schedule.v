module key_schedule (input clk,rst,
                     input [0:127]keyin,
                     input [0:3]round_no,
                     output reg [0:127]keyout
                      );

reg [0:31]state0_in;
reg [0:31]state1_in;
reg [0:31]state2_in;
reg [0:31]state3_in,state0_out,state1_out,state2_out,state3_out;

reg [0:31]Rcon;
reg [0:31]temp;

reg [0:2]key_state;
reg b;

reg [0:127]key_for_memory;
wire [0:127]key_for_memory1;

wire [0:127]subbyte0=128'h637c777bf26b6fc53001672bfed7ab76;
wire [0:127]subbyte1=128'hca82c97dfa5947f0add4a2af9ca472c0;
wire [0:127]subbyte2=128'hb7fd9326363ff7cc34a5e5f171d83115;
wire [0:127]subbyte3=128'h04c723c31896059a071280e2eb27b275;
wire [0:127]subbyte4=128'h09832c1a1b6e5aa0523bd6b329e32f84;
wire [0:127]subbyte5=128'h53d100ed20fcb15b6acbbe394a4c58cf;
wire [0:127]subbyte6=128'hd0efaafb434d338545f9027f503c9fa8;
wire [0:127]subbyte7=128'h51a3408f929d38f5bcb6da2110fff3d2;
wire [0:127]subbyte8=128'hcd0c13ec5f974417c4a77e3d645d1973;
wire [0:127]subbyte9=128'h60814fdc222a908846eeb814de5e0bdb;
wire [0:127]subbytea=128'he0323a0a4906245cc2d3ac629195e479;
wire [0:127]subbyteb=128'he7c8376d8dd54ea96c56f4ea657aae08;
wire [0:127]subbytec=128'hba78252e1ca6b4c6e8dd741f4bbd8b8a;
wire [0:127]subbyted=128'h703eb5664803f60e613557b986c11d9e;
wire [0:127]subbytee=128'he1f8981169d98e949b1e87e9ce5528df;
wire [0:127]subbytef=128'h8ca1890dbfe6426841992d0fb054bb16;

function [0:31]subbyte;
  input [0:31]aes_matrix;
  reg [0:7]a; reg [0:3]a1; reg [0:3]a2;
  reg [0:127]b1;
  integer i;
  begin
    for (i=0;i<4;i=i+1)begin
     case (i)
      0: begin
         a=aes_matrix[0:7];  
         a1=a[0:3];
         a2=a[4:7];
         case (a1) //[y2:y3]=[0:3]=a[y2:3]
           0: b1=subbyte0;
           1: b1=subbyte1;
           2: b1=subbyte2;
           3: b1=subbyte3;
           4: b1=subbyte4;
           5: b1=subbyte5;
           6: b1=subbyte6;
           7: b1=subbyte7;
           8: b1=subbyte8;
           9: b1=subbyte9;
           4'ha: b1=subbytea;
           4'hb: b1=subbyteb;
           4'hc: b1=subbytec;
           4'hd: b1=subbyted;
           4'he: b1=subbytee;
           4'hf: b1=subbytef;
         endcase
         case (a2) //[y4:y1]=a[4:7]
           0: subbyte[0:7]=b1[0:7];
           1: subbyte[0:7]=b1[8:15];
           2: subbyte[0:7]=b1[16:23];
           3: subbyte[0:7]=b1[24:31];
           4: subbyte[0:7]=b1[32:39];
           5: subbyte[0:7]=b1[40:47];
           6: subbyte[0:7]=b1[48:55];
           7: subbyte[0:7]=b1[56:63];
           8: subbyte[0:7]=b1[64:71];
           9: subbyte[0:7]=b1[72:79];
           4'ha: subbyte[0:7]=b1[80:87];
           4'hb: subbyte[0:7]=b1[88:95];
           4'hc: subbyte[0:7]=b1[96:103];
           4'hd: subbyte[0:7]=b1[104:111];
           4'he: subbyte[0:7]=b1[112:119];
           4'hf: subbyte[0:7]=b1[120:127];
          endcase
       end
       
       1: begin
         a=aes_matrix[8:15];  
         a1=a[0:3];
         a2=a[4:7];
         case (a1) //[y2:y3]=[0:3]=a[y2:3]
           0: b1=subbyte0;
           1: b1=subbyte1;
           2: b1=subbyte2;
           3: b1=subbyte3;
           4: b1=subbyte4;
           5: b1=subbyte5;
           6: b1=subbyte6;
           7: b1=subbyte7;
           8: b1=subbyte8;
           9: b1=subbyte9;
           4'ha: b1=subbytea;
           4'hb: b1=subbyteb;
           4'hc: b1=subbytec;
           4'hd: b1=subbyted;
           4'he: b1=subbytee;
           4'hf: b1=subbytef;
         endcase
         case (a2) //[y4:y1]=a[4:7]
           0: subbyte[8:15]=b1[0:7];
           1: subbyte[8:15]=b1[8:15];
           2: subbyte[8:15]=b1[16:23];
           3: subbyte[8:15]=b1[24:31];
           4: subbyte[8:15]=b1[32:39];
           5: subbyte[8:15]=b1[40:47];
           6: subbyte[8:15]=b1[48:55];
           7: subbyte[8:15]=b1[56:63];
           8: subbyte[8:15]=b1[64:71];
           9: subbyte[8:15]=b1[72:79];
           4'ha: subbyte[8:15]=b1[80:87];
           4'hb: subbyte[8:15]=b1[88:95];
           4'hc: subbyte[8:15]=b1[96:103];
           4'hd: subbyte[8:15]=b1[104:111];
           4'he: subbyte[8:15]=b1[112:119];
           4'hf: subbyte[8:15]=b1[120:127];
          endcase
        end
        
       2: begin
         a=aes_matrix[16:23];  
         a1=a[0:3];
         a2=a[4:7];
         case (a1) //[y2:y3]=[0:3]=a[y2:3]
           0: b1=subbyte0;
           1: b1=subbyte1;
           2: b1=subbyte2;
           3: b1=subbyte3;
           4: b1=subbyte4;
           5: b1=subbyte5;
           6: b1=subbyte6;
           7: b1=subbyte7;
           8: b1=subbyte8;
           9: b1=subbyte9;
           4'ha: b1=subbytea;
           4'hb: b1=subbyteb;
           4'hc: b1=subbytec;
           4'hd: b1=subbyted;
           4'he: b1=subbytee;
           4'hf: b1=subbytef;
         endcase
         case (a2) //[y4:y1]=a[4:7]
           0: subbyte[16:23]=b1[0:7];
           1: subbyte[16:23]=b1[8:15];
           2: subbyte[16:23]=b1[16:23];
           3: subbyte[16:23]=b1[24:31];
           4: subbyte[16:23]=b1[32:39];
           5: subbyte[16:23]=b1[40:47];
           6: subbyte[16:23]=b1[48:55];
           7: subbyte[16:23]=b1[56:63];
           8: subbyte[16:23]=b1[64:71];
           9: subbyte[16:23]=b1[72:79];
           4'ha: subbyte[16:23]=b1[80:87];
           4'hb: subbyte[16:23]=b1[88:95];
           4'hc: subbyte[16:23]=b1[96:103];
           4'hd: subbyte[16:23]=b1[104:111];
           4'he: subbyte[16:23]=b1[112:119];
           4'hf: subbyte[16:23]=b1[120:127];
          endcase
        end
        
       3: begin
         a=aes_matrix[24:31];  
         a1=a[0:3];
         a2=a[4:7];
         case (a1) //[y2:y3]=[0:3]=a[y2:3]
           0: b1=subbyte0;
           1: b1=subbyte1;
           2: b1=subbyte2;
           3: b1=subbyte3;
           4: b1=subbyte4;
           5: b1=subbyte5;
           6: b1=subbyte6;
           7: b1=subbyte7;
           8: b1=subbyte8;
           9: b1=subbyte9;
           4'ha: b1=subbytea;
           4'hb: b1=subbyteb;
           4'hc: b1=subbytec;
           4'hd: b1=subbyted;
           4'he: b1=subbytee;
           4'hf: b1=subbytef;
         endcase
         case (a2) //[y4:y1]=a[4:7]
           0: subbyte[24:31]=b1[0:7];
           1: subbyte[24:31]=b1[8:15];
           2: subbyte[24:31]=b1[16:23];
           3: subbyte[24:31]=b1[24:31];
           4: subbyte[24:31]=b1[32:39];
           5: subbyte[24:31]=b1[40:47];
           6: subbyte[24:31]=b1[48:55];
           7: subbyte[24:31]=b1[56:63];
           8: subbyte[24:31]=b1[64:71];
           9: subbyte[24:31]=b1[72:79];
           4'ha: subbyte[24:31]=b1[80:87];
           4'hb: subbyte[24:31]=b1[88:95];
           4'hc: subbyte[24:31]=b1[96:103];
           4'hd: subbyte[24:31]=b1[104:111];
           4'he: subbyte[24:31]=b1[112:119];
           4'hf: subbyte[24:31]=b1[120:127];
          endcase
        end
      endcase
      
    end
  end
endfunction

//memory_key l11 (round_no,key_for_memory,key_for_memory1);

always @ (clk,rst) begin
  
  if(rst)begin
    key_state=0;
    
    state0_in[0:7]=keyin[0:7];
    state0_in[8:15]=keyin[8:15];
    state0_in[16:23]=keyin[16:23];
    state0_in[24:31]=keyin[24:31];
	 //$display("state0_in = %h",state0_in);
    
    state1_in[0:7]=keyin[32:39];
    state1_in[8:15]=keyin[40:47];
    state1_in[16:23]=keyin[48:55];
    state1_in[24:31]=keyin[56:63];
	 //$display("state1_in = %h",state1_in);
    
    state2_in[0:7]=keyin[64:71];
    state2_in[8:15]=keyin[72:79];
    state2_in[16:23]=keyin[80:87];
    state2_in[24:31]=keyin[88:95];
	 //$display("state2_in = %h",state2_in);
    
    state3_in[0:7]=keyin[96:103];
    state3_in[8:15]=keyin[104:111];
    state3_in[16:23]=keyin[112:119];
    state3_in[24:31]=keyin[120:127];
	 //$display("state3_in = %h",state3_in);
      
    b=1'b1;
    
    case (round_no)
      0: begin
        Rcon[0:7]=8'h01;
        Rcon[8:15]=8'h00;
        Rcon[16:23]=8'h00;
        Rcon[24:31]=8'h00;
      end
      
      1: begin
        Rcon[0:7]=8'h02;
        Rcon[8:15]=8'h00;
        Rcon[16:23]=8'h00;
        Rcon[24:31]=8'h00;
      end
      
      2: begin
        Rcon[0:7]=8'h04;
        Rcon[8:15]=8'h00;
        Rcon[16:23]=8'h00;
        Rcon[24:31]=8'h00;
      end
      
      3: begin
        Rcon[0:7]=8'h08;
        Rcon[8:15]=8'h00;
        Rcon[16:23]=8'h00;
        Rcon[24:31]=8'h00;
      end
      
      4: begin
        Rcon[0:7]=8'h10;
        Rcon[8:15]=8'h00;
        Rcon[16:23]=8'h00;
        Rcon[24:31]=8'h00;
      end
      
      5: begin
        Rcon[0:7]=8'h20;
        Rcon[8:15]=8'h00;
        Rcon[16:23]=8'h00;
        Rcon[24:31]=8'h00;
      end
      
      6: begin
        Rcon[0:7]=8'h40;
        Rcon[8:15]=8'h00;
        Rcon[16:23]=8'h00;
        Rcon[24:31]=8'h00;
      end
      
      7: begin
        Rcon[0:7]=8'h80;
        Rcon[8:15]=8'h00;
        Rcon[16:23]=8'h00;
        Rcon[24:31]=8'h00;
      end
      
      8: begin
        Rcon[0:7]=8'h1b;
        Rcon[8:15]=8'h00;
        Rcon[16:23]=8'h00;
        Rcon[24:31]=8'h00;
      end
      
      9: begin
        Rcon[0:7]=8'h36;
        Rcon[8:15]=8'h00;
        Rcon[16:23]=8'h00;
        Rcon[24:31]=8'h00;
      end
      
      default: begin
      end
    endcase
  end
  
  else begin
    case (key_state)
      
      0: begin
        //shift row operation of key schedule.
        temp[0:7]=state3_in[0:7];
        state3_in[0:23]=state3_in[8:31];
        state3_in[24:31]=temp[0:7];
		  
		  //$display("state3_in = %h",state3_in);
        
        if(b)begin
          key_state=4'b001;          
        end
        else begin
          key_state=4'b000;
        end
      end
      
      1: begin
        //subbyte operation.
        temp=subbyte(state3_in);
        
		  //$display("temp = %h",temp);
		  
        if(b)begin
          key_state=4'b010;          
        end
        else begin
          key_state=4'b001;
        end
      end
      
      2: begin
        state3_in[0:7]=keyin[96:103];
		  state3_in[8:15]=keyin[104:111];
        state3_in[16:23]=keyin[112:119];
        state3_in[24:31]=keyin[120:127];
        
        state0_out=state0_in ^ temp ^ Rcon;
		  //$display("state0_out = %h",state0_out);
        
        if(b)begin
          key_state=4'b011;          
        end
        else begin
          key_state=4'b010;
        end
      end
      
      3: begin
        state1_out=state1_in ^ state0_out;
		  //$display("state1_out = %h",state1_out);
        
        if(b)begin
          key_state=4'b100;          
        end
        else begin
          key_state=4'b011;
        end
      end
      
      4: begin
        state2_out=state2_in ^ state1_out;
        //$display("state2_out = %h",state2_out);
		  
        if(b)begin
          key_state=4'b101;          
        end
        else begin
          key_state=4'b100;
        end
      end
      
      5: begin
        state3_out=state3_in ^ state2_out;
        //$display("state3_out = %h",state3_out);
		  
        if(b)begin
          key_state=4'b110;          
        end
        else begin
          key_state=4'b101;
        end
      end
      
      6: begin 
        /*keyout[0:7]=state0_out[0:7];
        keyout[32:39]=state0_out[8:15];
        keyout[64:71]=state0_out[16:23];
        keyout[96:103]=state0_out[24:31];
        
        keyout[8:15]=state1_out[0:7];
        keyout[40:47]=state1_out[8:15];
        keyout[72:79]=state1_out[16:23];
        keyout[104:111]=state1_out[24:31];
        
        keyout[16:23]=state2_out[0:7];
        keyout[48:55]=state2_out[8:15];
        keyout[80:87]=state2_out[16:23];
        keyout[112:119]=state2_out[24:31];
        
        keyout[24:31]=state3_out[0:7];
        keyout[56:63]=state3_out[8:15];
        keyout[88:95]=state3_out[16:23];
        keyout[120:127]=state3_out[24:31];*/
		  
		  keyout[0:7]=state0_out[0:7];
        keyout[8:15]=state0_out[8:15];
        keyout[16:23]=state0_out[16:23];
        keyout[24:31]=state0_out[24:31];
        
        keyout[32:39]=state1_out[0:7];
        keyout[40:47]=state1_out[8:15];
        keyout[48:55]=state1_out[16:23];
        keyout[56:63]=state1_out[24:31];
        
        keyout[64:71]=state2_out[0:7];
        keyout[72:79]=state2_out[8:15];
        keyout[80:87]=state2_out[16:23];
        keyout[88:95]=state2_out[24:31];
        
        keyout[96:103]=state3_out[0:7];
        keyout[104:111]=state3_out[8:15];
        keyout[112:119]=state3_out[16:23];
        keyout[120:127]=state3_out[24:31];
		  
		  //memory key
		  key_for_memory[0:7]=state0_out[0:7];
        key_for_memory[8:15]=state0_out[8:15];
        key_for_memory[16:23]=state0_out[16:23];
        key_for_memory[24:31]=state0_out[24:31];
        
        key_for_memory[32:39]=state1_out[0:7];
        key_for_memory[40:47]=state1_out[8:15];
        key_for_memory[48:55]=state1_out[16:23];
        key_for_memory[56:63]=state1_out[24:31];
        
        key_for_memory[64:71]=state2_out[0:7];
        key_for_memory[72:79]=state2_out[8:15];
        key_for_memory[80:87]=state2_out[16:23];
        key_for_memory[88:95]=state2_out[24:31];
        
        key_for_memory[96:103]=state3_out[0:7];
        key_for_memory[104:111]=state3_out[8:15];
        key_for_memory[112:119]=state3_out[16:23];
        key_for_memory[120:127]=state3_out[24:31];
        
        if(b)begin
          key_state=4'b110;          
        end
        else begin
          key_state=4'b110;
        end
        
      end
      
      default: begin
      end
    endcase
  end 
  
end

endmodule
