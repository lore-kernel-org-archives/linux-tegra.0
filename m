From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 00/13] ARM: tegra: Enable DSI, panel and 3D support
Date: Thu, 17 Oct 2013 11:37:39 -0600
Message-ID: <52602063.30501@wwwdotorg.org>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/15/2013 09:27 AM, Thierry Reding wrote:
> This series enables DSI, HDMI and gr2d support on Dalmore as well as
> panel support for Cardhu and Harmony. gr3d support is also enabled on
> Tegra20 through Tegra114.
> 
> I think I've addressed all comments from the initial version. A more
> notable addition was that of gr3d support and a WIP patch for Tegra114
> powergate support. I wanted to get some feedback on how to continue
> with the powergate patch (array vs. map, see patch for details) before
> finalizing it.

I have applied the following to Tegra's for-3.13/dt:

>   ARM: tegra: Mark Tegra30 display controller compatible with Tegra20
>   ARM: tegra: Add host1x, DC and HDMI to Tegra114 device tree
>   ARM: tegra: Enable HDMI support on Dalmore
>   ARM: tegra: Use symbolic names for gr3d clocks

I would have applied the following as well, but I can't since they
conflict with a patch in the clock tree that renames the GR2D and GR3D
clock #defines:

>   ARM: tegra: Add Tegra114 gr2d support
>   ARM: tegra: Add Tegra114 gr3d support

I didn't aply the following since they all rely on DT bindings thare
aren't yet approved, or enable functionality that doesn't yet work (HDMI
on Cardhu).

>   ARM: tegra: Enable LVDS and HDMI on Cardhu
>   ARM: tegra: Enable LVDS output on Harmony
>   ARM: tegra: Add MIPI calibration DT entries for Tegra114
>   ARM: tegra: Add Tegra114 DSI support
>   ARM: tegra: Enable DSI support on Dalmore
>   ARM: tegra: Enable DRM panel support

This one was replaced by another patch that's already applied:

>   WIP: ARM: tegra: Add Tegra114 powergate support
