From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: correct Colibri T20 regulator settings
Date: Tue, 23 Jul 2013 11:07:37 -0700
Message-ID: <51EEC669.9050703@wwwdotorg.org>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de> <1374442132-24040-5-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374442132-24040-5-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/21/2013 02:28 PM, Lucas Stach wrote:
> Core and CPU voltage settings were a bit on the safe side. The actually
> used chips on the Colibri allow for lower voltages and work just fine
> this way.

That sounds like a non-critical issue. Shouldn't that part be separated
out into a patch for 3.12?

> SM2 is not a the parent of LDO regs, but actually the DDR regulator. The
> Colibri uses a different version of the TPS with other voltage mapping
> tables for SM2, currently we cheat by setting a fake 3,2V which results
> in 1,8V physical.

That's quite unfortunate. Since DT is supposed to be an ABI, the
existing DT should continue to work for arbitrary kernels, and the
modified DT should also work for arbitrary kernels. Clearly that isn't
possible if we start putting incorrect voltage values into the DT. Isn't
there some way to make an isolated fix to the PMIC driver itself so that
it actually programs the HW correctly? Even if that patch is larger than
this patch, it still seems more likely to be acceptable for 3.11.

But is this a regression? If not, how far back in CC: stable should this
change go?
