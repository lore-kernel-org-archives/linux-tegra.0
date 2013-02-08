From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: Unify tegra{20,30,114}_init_early()
Date: Fri, 8 Feb 2013 09:09:42 +0100
Message-ID: <20130208.100942.592982910310763762.hdoyu@nvidia.com>
References: <1360308574-19658-1-git-send-email-hdoyu@nvidia.com><1360308574-19658-2-git-send-email-hdoyu@nvidia.com><20130208074720.GB21879@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130208074720.GB21879-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Felipe,

Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote @ Fri, 8 Feb 2013 08:47:20 +0100:

> > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
>
> how about using:
>
> #if IS_BUILTIN(CONFIG_ARCH_TEGRA_3x_SOC)
>
> instead ?

Why is IS_BUILTIN() prefered?

> > -void tegra20_hotplug_init(void);
> > -void tegra30_hotplug_init(void);
> > +void tegra20_hotplug_shutdown(void);
> > +void tegra30_hotplug_shutdown(void);
>
> aren't these two called only by tegra_hotplug_init() now ?

Yes

> That means they don't need to be exposed.

tegra{20,30}_hotplug_shutdown are defined in sleep-tegra{20,30}.S and
used in hotplug.c So I think that the above are necessary here.
