From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: Unify tegra{20,30,114}_init_early()
Date: Mon, 11 Feb 2013 05:18:40 +0100
Message-ID: <20130211.061840.516448986332629268.hdoyu@nvidia.com>
References: <2499199.srlLvkihNZ@ax5200p><51180121.6040803@wwwdotorg.org><1828614.u7HcYf891a@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1828614.u7HcYf891a@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "marvin24-Mmb7MZpHnFY@public.gmane.org" <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Marc,

Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote @ Sun, 10 Feb 2013 22:16:14 +0100:

> ah, ok - I just skipped the "also" in your sentence above. But still, the 
> #ifdefs look strange to me and save only a few byte of code. Just me few 
> cents.

What about the following as Arnd suggested[1]?

void __init tegra_hotplug_init(void)
{
	if (!IS_ENABLED(CONFIG_HOTPLUG_CPU))
	   return;
	   
	   if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)) && tegra_chip_id == TEGRA20)
	      tegra_hotplug_shutdown = tegra20_hotplug_shutdown;
	      if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC)) && tegra_chip_id == TEGRA30)
	      	 tegra_hotplug_shutdown = tegra30_hotplug_shutdown;
}

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/148632.html
