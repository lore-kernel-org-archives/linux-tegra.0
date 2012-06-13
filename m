From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: build powergate unconditionally
Date: Wed, 13 Jun 2012 10:08:10 -0600
Message-ID: <4FD8BAEA.6070906@wwwdotorg.org>
References: <1339595767-9140-1-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1339595767-9140-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/13/2012 07:55 AM, Wolfram Sang wrote:
> powergate functions are needed for tegra30 as well (see common.c), so
> build it always. Fixes:
> 
> arch/arm/mach-tegra/built-in.o: In function `tegra30_init_early':
> apbio.c:(.init.text+0x78): undefined reference to `tegra_powergate_init'
> 
> (using "allnoconfig" with tegra30 enabled)
> 
> Signed-off-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Thanks, applied.
