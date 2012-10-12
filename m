From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Fri, 12 Oct 2012 15:17:04 -0600
Message-ID: <507888D0.1090103@wwwdotorg.org>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de> <50775803.1010209@wwwdotorg.org> <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121012050957.GA29881-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/11/2012 11:09 PM, Thierry Reding wrote:
> On Thu, Oct 11, 2012 at 05:36:35PM -0600, Stephen Warren wrote:
>> On 10/11/2012 02:07 PM, Thierry Reding wrote:
>>> Hi,
>>> 
>>> I've finally managed to get HDMI working on Tegra20.
>>> Unfortunately the xf86-video-modesetting driver doesn't work on
>>> top of it yet, but I think that's a different error somewhere
>>> else and I'm still trying to figure out what exactly is going
>>> wrong. However, a framebuffer console can be run on top of it,
>>> as does a small test program that I've written for testing.
>> 
>> I should start out by saying that this is all very excellent
>> news! Thanks so much for your hard work on tegra-drm.
>> 
>> I have managed to get Harmony HDMI working, mostly just by
>> copying the obvious device tree entries from
>> tegra20-trimslice.dts. This didn't quite work immediately though,
>> and while debugging this I found a few issues...
...
>> The code in clock.c uses lots of clk_get_sys() calls with
>> hard-coded clock names. We really should be using the common
>> clock DT bindings for this instead of hard-coding names. This is
>> especially true since the names differ on different SoCs, so
>> there's a ton of of_device_is_compatible(output->dev->of_node,
>> "nvidia,tegra30-hdmi") in this code.
> 
> I don't quite see how that is supposed to work. Wouldn't that mean
> that we needed to setup various entries in the clock tables to be
> able to look the clocks up by generic names? Like pll_d would need
> to be the "parent" clock of "tegra-hdmi" or similar. In that case
> we could call clk_get(hdmi->dev, "parent") instead. Is that what
> you had in mind?

There are two ways this could work:

1)

All clocks needed could be represented in the node of that device (or
perhaps in the DC node?) For example, perhaps hdmi might contain:

clocks = <&car TEGRA_CLK_PLL_D>
         <&car TEGRA_CLK_PLL_D_OUT_0>
         <&car TEGRA_CLK_HDMI>
         ...;
clock-names = "pll_d", "pll_d_out_0", "hdmi", ...;

That should work (I think) with pretty much no modification to the
current code, other than calling clk_get(dev, "hdmi") rather than
clk_get_sys(NULL, "hdmi").

However, I'm not sure this is the best way or not; this still requires
the HDMI driver to implement all the clocking policy (e.g. is the HDMI
clock a child of PLL_D, PLL_C, PLL_P, ... and what rate should the
parent PLL be set to, etc.)

For example, what if the clock frequency HDMI needs can be generated
by PLL_C, so we make PLL_C the parent of HDMI (so as to save power by
not running PLL_D, or to use PLL_D for a second display head), then
something else comes along and /has/ to use PLL_C. If the two childs'
frequency requirements are the same, everything is fine. If the two
child's frequency requirements are not compatible, we might need to
spin up PLL_D and reparent HDMI onto it. More complex scenarios are
possible where PLL_C needs to be reprogrammed, yet can be in a way
that supports both HDMI and some other requirement, so we only need to
temporarily move HDMI onto PLL_D, then reprogram PLL_C, then move HDMI
back to it and spin PLL_D down. All these decisions should be made
centrally in the Tegra clock driver, or at least some kind of
centralized policy management point, and not by the HDMI driver:

2)

The HDMI device node only knows about the clocks used directly by the
HDMI module:

clocks = <&car TEGRA_CLK_HDMI>;
clock-names = "hdmi";

(note: that's just an example; I don't know off the top of my head
exactly which clocks that module consumes directly)

Then, the HDMI driver will simply perform a single clk = clk_get(dev,
"hdmi"), and later call clk_set_rate(clk, rate) as appropriate. All
the policy decisions then get made internally to the Tegra clock
driver (since it's a central nexus for all clock outputs from the
Clock And Reset controller (CAR).

A similar question exists for audio too. Currently, our audio drivers
do something similar to what tegra-drm is doing; (1) above. However, I
have a feeling we may want to convert audio over to model (2) above too.

Oh, and the cpufreq driver has a similar for centralized policy, since
at 216MHz the CPU clocks are derived from one PLL, but for anything
faster we use PLL_X to generate them. Right now, this is implemented
in the cpufreq driver, but again should really be centrally managed.
