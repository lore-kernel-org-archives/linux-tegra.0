From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
Date: Fri, 17 Apr 2020 22:41:59 +0300
Message-ID: <0acc35fd-a74b-e726-7a16-55db13265c39@gmail.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-3-digetx@gmail.com>
 <20200417193018.GI5861@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200417193018.GI5861-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Laurent,

17.04.2020 22:30, Laurent Pinchart пишет:
...
>>  #include <drm/drm_atomic.h>
>> +#include <drm/drm_bridge.h>
> 
> You could add a forward declaration of struct drm_bridge instead, that
> can lower the compilation time a little bit.

This include is not only for the struct, but also for the
drm_bridge_attach(). It looks to me that it should be nicer to keep the
include here.

...
>> +	port = of_get_child_by_name(output->of_node, "port");
> 
> Do you need to check for the presence of a port node first ? Can you
> just check the return value of drm_of_find_panel_or_bridge(), and fall
> back to "nvidia,panel" if it returns -ENODEV ?

Without the check, the drm_of_find_panel_or_bridge() prints a very noisy
error message about missing port node for every output that doesn't have
a graph specified in a device-tree (HDMI, DSI and etc).

https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/of/property.c#L621
