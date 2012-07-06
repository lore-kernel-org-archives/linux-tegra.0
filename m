From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Fri, 06 Jul 2012 13:59:13 -0600
Message-ID: <4FF74391.5040004@wwwdotorg.org>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de> <20120705121506.GA23732@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120705121506.GA23732-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/05/2012 06:15 AM, Thierry Reding wrote:
> Here's a new proposal that should address all issues collected
> during the discussion of the previous one:
> 
> From tegra20.dtsi:
...

At a quick glance, that all seems pretty reasonable now.

> One problem I've come across when trying to get some rudimentary
> code working with this is that there's no longer a device which the
> DRM driver can bind to, because the top-level device (host1x) now
> has a separate driver.

Can't you just have the host1x driver trigger the instantiation of the
DRM driver? In other words, the host1x node is both the plain host1x
driver and the DRM driver. So, after initializing anything for host1x
itself, just end host1x's probe() with something a call to
drm_platform_init(), passing in host1x's own pdev.

After all, it seems like the whole point of representing host1x in the
DT is to expose the graphics HW, so you'd need the DRM device in that
case.
