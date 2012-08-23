From: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Debugging U-Boot standalone apps on Tegra 2 board
Date: Thu, 23 Aug 2012 18:38:59 +0200
Message-ID: <50365CA3.6000103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi

I'm currently running U-Boot on the Tegra2 Harmony board and I'd 
appreciate some help on how to debug U-Boot standalone applications. I'm 
currently stuck with some nasty bugs and without a debugger it will be 
extremely painful to fix them.

I read that using a JTAG device seems to be the best option. According 
to the technical specs of the Harmony board, JTAG is supported and 
looking at the board, there's apparently a debug port (J10). However, 
this port looks too tiny to be a regular JTAG interface.

Do you have any idea if a JTAG debugger is indeed supported? If so, 
could you please recommend me one that is compatible with this board? 
Otherwise, are you aware of an alternative approach for debugging the 
system?

I really appreciate your help on this. Thanks in advance.

Regards,
--Nuno
