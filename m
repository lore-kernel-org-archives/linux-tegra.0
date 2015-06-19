From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] GPU: ipu: fix lockup caused by pending chained
 interrupts
Date: Fri, 19 Jun 2015 16:36:06 +0200
Message-ID: <1434724566.3039.50.camel@pengutronix.de>
References: <E1Z4yzs-0002Rw-4B@rmk-PC.arm.linux.org.uk>
	 <E1Z4zMT-0004Y7-KJ@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1Z4zMT-0004Y7-KJ-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 16.06.2015, 23:29 +0100 schrieb Russell King:
> Even with the oops fixed by a previous patch, the system still fails to
> kexec, due to a stuck chained interrupt locking the system.  We must
> disable the child interrupts prior to setting up the irq chip to ensure
> we don't get stuck here.
> 
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

Applied, thank you.

> Maybe this is all that's really needed... would also be nice if this
> path had an etry in MAINTAINERS...

I'll send a patch to add it to the imx-drm driver section.

regards
Philipp
