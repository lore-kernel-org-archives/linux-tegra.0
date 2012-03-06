From: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
Subject: Re: [PATCH/RFC 2/2] arm/tegra: add timeout to PCIe PLL lock
 detection loop
Date: Wed, 7 Mar 2012 00:15:38 +0400
Message-ID: <20120306201538.GA14350@rainbow>
References: <1331023544-6439-1-git-send-email-mad_soft@inbox.ru>
 <1331023544-6439-3-git-send-email-mad_soft@inbox.ru>
 <4F56424A.3020305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F56424A.3020305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09:58 Tue 06 Mar     , Stephen Warren wrote:
> On 03/06/2012 01:45 AM, Dmitry Artamonow wrote:
> > Tegra PCIe driver waits for PLL to lock using busy loop.
> > If PLL fails to lock for some reason, this leads to silent lockup
> > while booting (as PCIe code is not modular).
> > 
> > Fix by adding timeout, so if PLL doesn't lock in a couple
> > of seconds, just PCIe driver fails and machine continues to boot.
> > 
> > Signed-off-by: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
> 
> That seems reasonable. So once the mdelay discussion is resolved,
> 
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> 
> Any idea why the PLL doesn't lock sometimes?


Please dismiss this patch - I forgot to turn 'return' to 'return 0' at
the end of the function, while converting it's type from void to int,
and it causes driver to fail always now. I'll send updated version shortly.

Also I've managed to get another Harmony board today, and it doesn't have
problems with PLL locking (PLL locks on it in about 2ms), so probably the
issue I've seen is caused by some hardware fault on the first board,
or is specific to some particular revision of the board and/or Tegra2 chip.

I'll do more testing tomorrow and re-spin the patches.
-- 
Best regards,
Dmitry "MAD" Artamonow
