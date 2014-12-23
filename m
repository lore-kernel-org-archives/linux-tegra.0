From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/5] gpu: host1x: Provide a proper struct bus_type
Date: Tue, 23 Dec 2014 15:30:20 +0800
Message-ID: <54991A0C.4050203@nvidia.com>
References: <1419002698-4963-1-git-send-email-thierry.reding@gmail.com> <1419002698-4963-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419002698-4963-4-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2014 11:24 PM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Previously the struct bus_type exported by the host1x infrastructure was
> only a very basic skeleton. Turn that implementation into a more full-
> fledged bus to support proper probe ordering and power management.
> 
> Note that the bus infrastructure needs to be available before any of the
> drivers can be registered, so the bus needs to be registered before the
> host1x module. Otherwise drivers could be registered before the module
> is loaded and trigger a BUG_ON() in driver_register(). To ensure the bus
> infrastructure is always there, always build the code into the kernel
> when enabled and register it with a postcore initcall.
> 

So this means there is no chance that host1x can be built as a kernel
module, right? I'm fine with that, just asking.

> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
[...]
> diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
> index c1189f004441..a3e667a1b6f5 100644
> --- a/drivers/gpu/host1x/Makefile
> +++ b/drivers/gpu/host1x/Makefile
> @@ -1,5 +1,4 @@
>  host1x-y = \
> -	bus.o \
>  	syncpt.o \
>  	dev.o \
>  	intr.o \
> @@ -13,3 +12,5 @@ host1x-y = \
>  	hw/host1x04.o
>  
>  obj-$(CONFIG_TEGRA_HOST1X) += host1x.o
> +
> +obj-y += bus.o

I didn't get it, why we need to do this?

> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 0b52f0ea8871..28630a5e9397 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -72,13 +72,14 @@ static void host1x_subdev_del(struct host1x_subdev *subdev)
[...]
>  
>  static inline struct host1x_device *to_host1x_device(struct device *dev)
> 

The change looks good to me. Just one thing I feel not comfortable:
"struct host1x_device" is not a real device, it represents the drm
device actually. The real tegra host1x device is represented by "struct
host1x". But the name "host1x_device" makes people confusing, I mean, it
will make people thinking it's the real "tegra host1x" device then bring
the reading difficulty. Why don't we change this to something like
"drm_device" or "tegra_drm_device"?

Mark
