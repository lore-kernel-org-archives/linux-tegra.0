From: Mike Turquette <mike.turquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/tegra: Set the dsi lp clk parent and rate
Date: Sat, 27 Sep 2014 13:05:32 -0700
Message-ID: <20140927200532.19023.95967@quantum>
References: <1411156429-19797-1-git-send-email-seanpaul@chromium.org>
 <20140922174652.GP3290@leverpostej> <20140923072204.GJ30514@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140923072204.GJ30514@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2014-09-23 00:22:05)
> On Mon, Sep 22, 2014 at 06:46:52PM +0100, Mark Rutland wrote:
> > On Fri, Sep 19, 2014 at 08:53:48PM +0100, Sean Paul wrote:
> > > Per NVidia, this clock rate should be around 70MHz in
> > > order to properly sample reads on data lane 0. In order
> > > to achieve this rate, we need to reparent the clock from
> > > clk_m which can only achieve 12MHz. Add parent_lp to the
> > > dts bindings and set the parent & rate on init.
> > > 
> > > Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > ---
> > >  .../devicetree/bindings/gpu/nvidia,tegra20-host1x.txt  | 10 ++++++++--
> > >  drivers/gpu/drm/tegra/dsi.c                            | 18 ++++++++++++++++++
> > >  drivers/gpu/drm/tegra/dsi.h                            |  3 +++
> > >  3 files changed, 29 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> > > index b48f4ef..fef2918 100644
> > > --- a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> > > +++ b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> > > @@ -191,6 +191,10 @@ of the following host1x client modules:
> > >    - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
> > >    - nvidia,edid: supplies a binary EDID blob
> > >    - nvidia,panel: phandle of a display panel
> > > +  - clock-names: Can include the following entries:
> > > +    - lp_parent: The parent clock for lp
> > > +  - clocks: Must contain an entry for each optional entry in clock-names.
> > > +    See ../clocks/clock-bindings.txt for details.
> > 
> > Did this driver previously acquire clocks?
> > 
> > What order or names did it expect if so?
> 
> This is badly placed. There are clocks and clock-names properties in a
> "Required properties" section above this hunk which lists all the clocks
> that this module uses. Presumably this was added to the optional section
> because it isn't always needed.
> 
> > >  - sor: serial output resource
> > >  
> > > @@ -360,8 +364,10 @@ Example:
> > >                     compatible = "nvidia,tegra20-dsi";
> > >                     reg = <0x54300000 0x00040000>;
> > >                     clocks = <&tegra_car TEGRA20_CLK_DSI>,
> > > -                            <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
> > > -                   clock-names = "dsi", "parent";
> > > +                            <&tegra_car TEGRA124_CLK_DSIALP>,
> > > +                            <&tegra_car TEGRA20_CLK_PLL_D_OUT0>,
> > > +                            <&tegra_car TEGRA124_CLK_PLL_P>;
> > > +                   clock-names = "dsi", "lp", "parent", "lp_parent";
> > 
> > Please document _all_ the names you expect.
> > 
> > What exactly are these two new clocks?
> 
> "lp" isn't actually new, it's just missing from the example.
> 
> > Is this all the clocks that feed into the DSI block? Are any of these
> > not directly wired to the DSI block?
> > 
> > Why exactly do you need to reparent it to this particular clock, and why
> > do you need a reference here in order to do so, given it presumably
> > doesn't feed directly into the DSI block?
> 
> It seems like the hardware default is to use a parent clock unsuitable
> for the DSI low-power mode, but as discussed elsewhere this should be
> fixed in the clock driver where we already have a way to statically set
> the parent clock at boot time.

The driver fix is perfectly fine, but we also have the
assigned-clock-parent stuff now if you prefer to manage it from DT.

See,

Documentation/devicetree/bindings/clock/clock-bindings.txt
drivers/clk/clk-conf.c

Regards,
Mike

> 
> Thierry
