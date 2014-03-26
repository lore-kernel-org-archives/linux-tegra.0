From: Alexander Oh <oh_alexander-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: JTAG debugging the linux kernel on tegra3 platforms
Date: Wed, 26 Mar 2014 15:16:29 +0100
Message-ID: <5332E13D.3070907@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi!

I'm currently trying to debug a QuadMo747-X T30. I'm trying to update 
the versions of u-boot and linux kernel. I run into problems while 
booting the kernel (similar to [2], but I'm not sure whats going on yet) 
and was hoping to get some help here about JTAG debuggers.

I've seen that people are already running the flyswatter2 JTAG debuggers 
with the nvidia tegra2 [1]. Is this debugger also working with the 
nvidia tegra3? I found out that James Zhao has been working on OpenOCD 
to get the Tegra3 running. But I could not find any references or 
manuals to get it working. I'm not entirely sure that the debugger is 
compatible with tegra3 processors.

Is anybody here actually using a flyswatter2 debugger with a tegra3 
processor?

Alex

[1]: http://comments.gmane.org/gmane.linux.ports.tegra/6019
[2]: http://www.spinics.net/lists/linux-tegra/msg11085.html
