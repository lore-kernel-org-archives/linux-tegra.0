From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Tue, 16 Oct 2012 11:28:27 +0300
Message-ID: <20121016082827.GI3196@tbergstrom-lnx.Nvidia.com>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
 <50775803.1010209@wwwdotorg.org>
 <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de>
 <507888D0.1090103@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <507888D0.1090103-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> 
> There are two ways this could work:
> 
> 1)
> 
> All clocks needed could be represented in the node of that device (or
> perhaps in the DC node?) For example, perhaps hdmi might contain:
> 
> clocks = <&car TEGRA_CLK_PLL_D>
>          <&car TEGRA_CLK_PLL_D_OUT_0>
>          <&car TEGRA_CLK_HDMI>
>          ...;
> clock-names = "pll_d", "pll_d_out_0", "hdmi", ...;
> 
> That should work (I think) with pretty much no modification to the
> current code, other than calling clk_get(dev, "hdmi") rather than
> clk_get_sys(NULL, "hdmi").
> 
> However, I'm not sure this is the best way or not; this still requires
> the HDMI driver to implement all the clocking policy (e.g. is the HDMI
> clock a child of PLL_D, PLL_C, PLL_P, ... and what rate should the
> parent PLL be set to, etc.)
> 
> For example, what if the clock frequency HDMI needs can be generated
> by PLL_C, so we make PLL_C the parent of HDMI (so as to save power by
> not running PLL_D, or to use PLL_D for a second display head), then
> something else comes along and /has/ to use PLL_C. If the two childs'
> frequency requirements are the same, everything is fine. If the two
> child's frequency requirements are not compatible, we might need to
> spin up PLL_D and reparent HDMI onto it. More complex scenarios are
> possible where PLL_C needs to be reprogrammed, yet can be in a way
> that supports both HDMI and some other requirement, so we only need to
> temporarily move HDMI onto PLL_D, then reprogram PLL_C, then move HDMI
> back to it and spin PLL_D down. All these decisions should be made
> centrally in the Tegra clock driver, or at least some kind of
> centralized policy management point, and not by the HDMI driver:
> 

This assumes we can glitch free provide a new parent clock to eg. HDMI, I
doubt the hardware can do that.

Cheers,

Peter.
