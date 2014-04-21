From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Deprecate nvidia,hpd-gpio property
Date: Mon, 21 Apr 2014 13:43:18 -0600
Message-ID: <535574D6.3010002@wwwdotorg.org>
References: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com> <1397736181-1593-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397736181-1593-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/17/2014 06:02 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Properties referencing GPIOs should use the plural suffix -gpios. This
> convention is encoded in the device tree backend of gpiod_get(), which
> we'll eventually want to migrate to.

Wouldn't it be simpler to fix the GPIO binding documentation and
gpiod_get() code to allow the -gpio suffix in addition to -gpios? It
always struck me as silly that the binding required a plural property
name when only a single entry made sense.

(For something like "clocks", since the property name applies to any
clock, and there certainly can be many clocks, a plural property name
makes sense. However, since each type of GPIO is "foo-gpios" rather than
an "foo" entry in "gpios", that same argument doesn't apply, and a
singular property name seems much more correct).
