From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: Unify tegra{20,30,114}_init_early()
Date: Sat, 9 Feb 2013 12:18:41 +0000
Message-ID: <201302091218.41699.arnd@arndb.de>
References: <1360308574-19658-1-git-send-email-hdoyu@nvidia.com> <20130208074720.GB21879@arwen.pp.htv.fi> <20130208.100942.592982910310763762.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130208.100942.592982910310763762.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 08 February 2013, Hiroshi Doyu wrote:
> > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> >
> > how about using:
> >
> > #if IS_BUILTIN(CONFIG_ARCH_TEGRA_3x_SOC)
> >
> > instead ?
> 
> Why is IS_BUILTIN() prefered?
> 

Inside of a function, if(IS_ENABLED(CONFIG_FOO)) or the respective IS_BUILTIN is
preferred over #ifdef because it provides better compile coverage and better
readability. Also, IS_ENABLED() is nice when you want to check if something
is builtin or module, without having to write a complex expression.

If you just replace the #ifdef with #if IS_BUILTIN as Felipe suggested, I see
no real benefit, but it would be nice to write this as


void __init tegra_hotplug_init(void)
{
	if (!IS_ENABLED(CONFIG_HOTPLUG_CPU))
		return;
	
	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)) && tegra_chip_id == TEGRA20)
		tegra_hotplug_shutdown = tegra20_hotplug_shutdown;
	if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC)) && tegra_chip_id == TEGRA30)
		tegra_hotplug_shutdown = tegra30_hotplug_shutdown;
}

which completely avoids all preprocessor conditionals and replaces them
with compile-time choices based on constant expressions to eliminate the
code paths for disabled platforms.

	Arnd
