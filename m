From: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Linux timer interrupts not working when booting in normal-world
Date: Wed, 12 Sep 2012 16:01:45 +0200
Message-ID: <505095C9.5000108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi

I'm currently playing with the TrustZone technology on the Tegra2 
Harmony board, and my goal is to boot Linux not in the secure world (as 
it is in mainstream Linux), but in the normal world. However, in doing 
this, timer interrupts are not being triggered and the system halts 
early in the bootstrap stage. I'd like to ask if anyone could give me a 
hint for why this is happening.

So far I managed to set up the secure world environment so that we can 
invoke secure services through the SMC instruction from the normal 
world. This configuration step is done by u-boot, after which it enters 
normal world and jumps to Linux. To make sure that Linux can handle 
interrupts freely, in this setup phase, I assign the SCR register 0x3 
(EA, FIQ, and IRQ bit are clear, and AW and FW are set).

Assuming that this configuration is correct, one possible explanation 
for the absence of timer interrupts is that the Harmony board may impose 
some restrictions to the timer re-configuration in the normal world. 
Does anyone have an idea if there are such restrictions? If not, is 
there any other explanation for this? Is there some configuration step 
that I'm missing?

Thank you very much in advance!
--Nuno Santos
