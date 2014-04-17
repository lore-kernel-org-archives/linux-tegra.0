From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/tegra: Use standard suffix for hotplug detect
 GPIO property
Date: Thu, 17 Apr 2014 19:25:54 +0200
Message-ID: <1397755554.2148.3.camel@tellur>
References: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397736181-1593-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Donnerstag, den 17.04.2014, 14:02 +0200 schrieb Thierry Reding:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The hotplug detect GPIO in the current bindings use "-gpio" as suffix,
> whereas the standard suffix is the plural: "-gpios". This small series
> replaces this in three steps to preserve bisectability:
> 
>   - Patch 1 adds new nvidia,hpd-gpios properties to existing device tree
>     files while marking existing nvidia,hpd-gpio ones as deprecated.
>   - Patch 2 makes use of the new property name in the driver and updates
>     the device tree bindings.
>   - Patch 3 removes the deprecated properties from device tree files.
> 
> Since this touches both DRM and Tegra trees, I've prepared a stable
> branch[0] that can be pulled into both trees to make the transition
> easier.
> 
What's the real benefit to this series? After all you are breaking
existing devicetrees here, as the driver doesn't continue to recognize
the old name. IMHO adding a missed 's' to the property name isn't enough
reason to do this.

Regards,
Lucas
