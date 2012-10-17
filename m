From: Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Tegra DRM with HDMI support (\o/)
Date: Wed, 17 Oct 2012 13:08:24 -0700
Message-ID: <D6C615D3E4730340AE82D5BD856631C0A1DA306B39@HQMAIL02.nvidia.com>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
 <50775803.1010209@wwwdotorg.org>
 <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de>
 <507888D0.1090103@wwwdotorg.org>
 <20121016082827.GI3196@tbergstrom-lnx.Nvidia.com>
 <20121017065547.GE21783@avionic-0098.mockup.avionic-design.de>
 <507ECCCD.7000600@wwwdotorg.org>
 <D6C615D3E4730340AE82D5BD856631C0A1DA306B31@HQMAIL02.nvidia.com>
 <20121017191240.GA22570@avionic-0098.mockup.avionic-design.de>
 <507F0A03.2050008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <507F0A03.2050008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Wednesday, October 17, 2012 12:42 PM
> To: Thierry Reding
> Cc: Jon Mayo; Peter De Schrijver; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Prashant
> Gaikwad; Joseph Lo
> Subject: Re: Tegra DRM with HDMI support (\o/)
> 
> On 10/17/2012 01:12 PM, Thierry Reding wrote:
> > On Wed, Oct 17, 2012 at 11:04:05AM -0700, Jon Mayo wrote:
> >>> -----Original Message----- From: Stephen Warren
> >>> [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org] Sent: Wednesday, October 17,
> >>> 2012 8:21 AM To: Thierry Reding; Jon Mayo Cc: Peter De
> >>> Schrijver; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Prashant Gaikwad;
> >>> Joseph Lo Subject: Re: Tegra DRM with HDMI support (\o/)
> >>>
> >>> On 10/17/2012 12:55 AM, Thierry Reding wrote:
> >>>> On Tue, Oct 16, 2012 at 11:28:27AM +0300, Peter De Schrijver
> >>>> wrote:
> >>>>>>
> >>>>>> There are two ways this could work:
> >>>>>>
> >>>>>> 1)
> >>>>>>
> >>>>>> All clocks needed could be represented in the node of
> >>>>>> that device (or perhaps in the DC node?) For example,
> >>>>>> perhaps hdmi might contain:
> >>>>>>
> >>>>>> clocks = <&car TEGRA_CLK_PLL_D> <&car
> >>>>>> TEGRA_CLK_PLL_D_OUT_0> <&car TEGRA_CLK_HDMI> ...;
> >>>>>> clock-names = "pll_d", "pll_d_out_0", "hdmi", ...;
> >>>>>>
> >>>>>> That should work (I think) with pretty much no
> >>>>>> modification to the current code, other than calling
> >>>>>> clk_get(dev, "hdmi") rather than clk_get_sys(NULL,
> >>>>>> "hdmi").
> >>>>>>
> >>>>>> However, I'm not sure this is the best way or not; this
> >>>>>> still requires the HDMI driver to implement all the
> >>>>>> clocking policy (e.g. is the HDMI clock a child of PLL_D,
> >>>>>> PLL_C, PLL_P, ... and what rate should the parent PLL be
> >>>>>> set to, etc.)
> >>>>>>
> >>
> >> the output setup for HDMI should do setparent on hdmi and dc to
> >> attach the proper pll and setup the divider (the divider is in
> >> the DC HW and not in the clock, one of the unusual cases). A
> >> default policy of always using pll_d2 / pll_d2_out_0 on T30 and
> >> later for HDMI is going to cover every case we have today. Then
> >> we can defer making it a configurable thing until someone
> >> actually needs to do the esoteric configuration.
> >
> > I had been thinking about what Stephen mentioned earlier about
> > sorting out probed modes for which the DC cannot generate an
> > appropriate frequency. That won't work currently because the
> > reparenting is done later than the mode probing. If using pll_d and
> > pll_d2 on Tegra20 and Tegra30 respectively is a safe default we
> > could actually set up the clock at module probe time so it will be
> > properly configured when the modes are probed and a call to
> > clk_round_rate() should be enough to verify that the required
> > frequency can be set.
> >
> >> On T30, HDMI will work with pll_d, but I'm tipping my hand and
> >> telling you that if you always use pll_d2 you won't have to mess
> >> with this code in the next few chips. :)
> >
> > If we make this configurable in the device tree, we could provide
> > both the "hdmi" and "base-clock" clocks, where base-clock defaults
> > to pll_d or pll_d2 depending on the Tegra generation. If some board
> > requires a more exotic setup it can override the clocks in the
> > board DTS.
> 
> I think if the parenting is going to be static, lets not have tegradrm
> do it, but rather encode it into one of
> arch/arm/mach-tegra/{common,board-dt-tegra[23]0}.c. Eventually, we
> wish to replace the clock setup tables in those files with tables in
> device tree, so they can differ easily per-board, which would also
> handle the DSI situation well.
> 

Well it's not entirely static. The clock parent should depend on the output type. rather than on which display controller you are using. Each DC can be configured for various output types. The output types can be represented in device-tree if you wish to have them fixed (I'd interpret it as a default rather than a fixed setting).

T30 and later:
DSIA - pll_d
HDMI - pll_d2
DSIB - pll_d or pll_d2
RGB(lcd/lvds) - pll_p or pll_d

At one time I wanted to just fix pll_d to dc0 and pll_d2 dc1, and may have mentioned this to a few of you before. But now I've learned that fixing plls to DCs isn't the best approach.

Long term I'd like to see DCs that can be switch to different outputs dynamically. Our X driver has the hooks to do this, our hardware can do it and other DRM drivers support this capability.

> If tegradrm does later gain the ability to dynamically fiddle with the
> clock parenting, we can add entries in the (DT) list of clocks that
> the DCs or ORs needs; when just 1 is specified it's e.g. the "hdmi"
> clock and tegradrm never does any reparenting, whereas in the future
> we could allow 3 to be specified; "hdmi", parent-a, parent-b, and
> "unlock" any reparenting support.
> 
> >> for T20, you'll want to use pll_d for HDMI, unless you need DSI,
> >> then you'll have to use pll_c for HDMI. That might be where the
> >> configuration comes in handy. If you want, you can pretend that
> >> DSI-based T20 devices aren't important enough to support now.
> >
> > I think we can safely ignore DSI for now since the driver doesn't
> > support it yet anyway. The driver is just a dummy that doesn't do
> > anything useful right now. But as I mentioned above, it should be
> > straightforward to override the clock setup on a per-board basis.
> 
> We definitely don't want to preclude DSI from working, so we should
> consider it. We do support Whistler upstream, and that has a DSI
> panel, and there were some noises about getting it working sometime.
> 

DSI should work, just not at the same time as HDMI. Getting both to work at the same time is a real pain in the neck. I think it is fair to draw a line in the sand and say, at this time, you cannot operate both DSI and HDMI on a Tegra2 device with this new driver. 

If someone wants to work out some special cases where it does work for a particular product, then great. But I would leave that support out of an upstreamable tegradrm driver.

So a "feature" I would like is that we handle DSI xor HDMI operation. dynamically switching between the two. Either by changing the SOR outputs for an individual DC (and thus only present a single /dev/fbX device). Or have a mechanism that crosses multiple device instances and refuses to allow them to be enabled at the same time. (that's how the Android/L4T driver works, but I don't like that way so much)

> >>>>>> For example, what if the clock frequency HDMI needs can
> >>>>>> be generated by PLL_C, so we make PLL_C the parent of
> >>>>>> HDMI (so as to save power by not running PLL_D, or to use
> >>>>>> PLL_D for a second display head), then something else
> >>>>>> comes along and /has/ to use PLL_C. If the two childs'
> >>>>>> frequency requirements are the same, everything is fine.
> >>>>>> If the two child's frequency requirements are not
> >>>>>> compatible, we might need to spin up PLL_D and reparent
> >>>>>> HDMI onto it. More complex scenarios are possible where
> >>>>>> PLL_C needs to be reprogrammed, yet can be in a way that
> >>>>>> supports both HDMI and some other requirement, so we only
> >>>>>> need to temporarily move HDMI onto PLL_D, then reprogram
> >>>>>> PLL_C, then move HDMI back to it and spin PLL_D down. All
> >>>>>> these decisions should be made centrally in the Tegra
> >>>>>> clock driver, or at least some kind of centralized policy
> >>>>>> management point, and not by the HDMI driver:
> >>>>>>
> >>>>>
> >>>>> This assumes we can glitch free provide a new parent clock
> >>>>> to eg. HDMI, I doubt the hardware can do that.
> >>>>
> >>>> I think for starters it would be enough if the clock code
> >>>> was smart enough to choose an appropriate parent. We could
> >>>> start thinking about power optimizations later. I took a
> >>>> brief look at the current code and it seems like all the
> >>>> information is already there, so we just need an algorithm
> >>>> that figures out the proper parent that can provide the right
> >>>> frequency and select it as parent in clk_set_rate()
> >>>> automatically. Such an algorithm could be as simple as this:
> >>>>
> >>>> if (current parent supports frequency) { set parent frequency
> >>>> } else { foreach (parent clock) { if (clock supports
> >>>> frequency) select as new parent }
> >>>>
> >>
> >>>> if (no parent found) abort }
> >>>>
> >>>> Checking for frequency support of a new parent would also
> >>>> involve checking for conflicts with other children of that
> >>>> clock. For some rudimentary power saving it should be enough
> >>>> to prefer already enabled clocks when looking for a new
> >>>> parent, so that if a compatible match is found no new clocks
> >>>> need to be enabled.
> >>>>
> >>>> Does that sound reasonable?
> >>>
> >>> At a high level it sounds OK to me. I'm sure there are many
> >>> details. Jon Mayo (now CC'd) (and other NVIDIA people already
> >>> CC'd) should chime in with any comments or objections though.
> >>
> >> Why bother trying to do some kind of best fit formula for clock
> >> frequencies? T30 and beyond have two PLLs dedicated to two DCs.
> >>
> >> You will never get a general purpose setup working on T20 if you
> >> have DSI. You can only make DSI and HDMI work together if you
> >> carefully choose what pixelclocks you wish to support on HDMI, as
> >> you will be sharing a clock with other unrelated peripherials. If
> >> you have LVDS panel on your T20 device (harmony and ventana do),
> >> then using pll_p for the LCD and pll_d for HDMI give you the most
> >> flexibility. But you may have to underclock the LCD panel if
> >> pll_p doesn't divide to something optiminal for that panel.
> >
> > Okay, that sounds like a fixed mapping would be a better
> > alternative. It obviously would preclude any of the power-saving
> > that Stephen proposed. However given that it keeps us from trouble
> > further down the road perhaps it really is preferable.
> 
> Considering a system with dual HDMI outputs and no built-in panel, and
> with mode timings on both outputs that could both be derived from a
> single clock, wouldn't using the same PLL for both outputs save power
> since the second PLL can be shut down? I'm not sure how much power
> this would save though; perhaps the power savings of a PLL aren't that
> important vs. the power savings from clock-gating or power-gating the
> logic that's clocked by the PLL.
> 

HDMI/CEA modes can be done by setting one pll to 297MHz. Then each DC can div-by-2 for 148.5MHz (1080p50/60, 720p60-3d, 1080p30-3d-fp, 1080p60-3d-sbs, ..) or div-by-4 for 74.25MHz (720p50/60, ...). Thus allowing you to connect any two HDMI TVs and use only one pll. 

But most systems with two HDMI outputs will be newer tegras with lots of PLLs, so it might not be too worthwhile to consider.

If you want to do VESA modes, you need dedicated PLLs. as they have lots of different unrelated clock rates.

> > Stephen, what do you think?
> 
> Overall though, a static clock setup, at least initially, sounds
> reasonable to me.

Great, if needed, we can extend it later. I'm satisfied this will cover some good use cases, and we can avoid some messy complications.
