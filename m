From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: correct Colibri T20 regulator settings
Date: Mon, 29 Jul 2013 00:06:01 +0200
Message-ID: <ff886a20cf4e3e08311c1066d4895433@agner.ch>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
 <1374442132-24040-5-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374442132-24040-5-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

I ran the mainline Kernel the first time on my Colibri T20. I compiled
3.11-rc2 without any patch, but the kernel refused to boot, the boot
process freezed just while probing SM2:
[    0.420075] vdd_sm2,vdd_ddr: 3700 mV

I then applied this patch, but without luck, the freeze happend even
earlier:
[    0.413314] vdd_sm1,vdd_cpu: supplied by vdd_5v0

However, using 3.8 works for me:
[    0.419848] vdd_sm2,vdd_ddr: 3800 mV
[    0.423851] vdd_sm2,vdd_ddr: supplied by vdd_5v0

My Module Version is 1.2a with TPS658643 PMIC on it.


Am 2013-07-21 23:28, schrieb Lucas Stach:
> Core and CPU voltage settings were a bit on the safe side. The actually
> used chips on the Colibri allow for lower voltages and work just fine
> this way.
This voltages seem to work for me too...

 
> SM2 is not a the parent of LDO regs, but actually the DDR regulator. The
> Colibri uses a different version of the TPS with other voltage mapping
> tables for SM2, currently we cheat by setting a fake 3,2V which results
> in 1,8V physical.
I could successfully boot with 1.8V, but with messages complaining that
probe failed... 

--
Stefan
