From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] arm/dt: tegra devicetree support
Date: Wed, 20 Jul 2011 12:28:23 -0600
Message-ID: <20110720182823.GD4642@ponder.secretlab.ca>
References: <20110719234158.2779.15394.stgit@ponder>
 <74CDBE0F657A3D45AFBB94109FB122FF049EBDEE27@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049EBDEE27-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 20, 2011 at 08:37:19AM -0700, Stephen Warren wrote:
> Grant Likely wrote at Tuesday, July 19, 2011 5:43 PM:
> > Everything required to populate NVIDIA Tegra devices from the device
> > tree.  This patch adds a new DT_MACHINE_DESC() which matches against
> > a tegra20 device tree.  So far it only registers the on-chip devices,
> > but it will be refined in follow on patches to configure clocks and
> > pin IO from the device tree also.
> > 
> > Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Oops, I merged patches, but missed some attribution.  This patch is
is also composed of work from John Bonesio and Stephen Warren.

> > ---
> > 
> > Hi all,
> > 
> > Similar to the versatile patch I just posted, this is certainly not
> > complete board support, but it is enough to be useful.  I'd like to
> > merge this for v3.1.  It should not break any existing board support.
> 
> > diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
> 
> tegra-*.dts don't include status="disable" for all the unused controllers.
> Should that be added?

I dropped that pattern since my preference has been to have boards
explicitly disable unused cores and that has generally been the
pattern on other DT platforms.

> 
> > +	sound {
> > +		compatible = "nvidia,harmony-sound", "nvidia,tegra-wm8903";
> 
> I thought the sound bindings were still somewhat experimental and not
> completely agreed upon. One issue I see is that Device Tree is
> supposed to represent pure HW, rather than driver-required abstractions,
> and at least the compatible name here is pretty Linux-driver-specific.
> 
> I think there are some devices missing from the DT file for audio too,
> e.g. the ALSA "PCM" (DMA) driver.
> 
> Also, the bindings for this aren't documented IIRC.
> 
> I'd suggest dropping the audio part of the DT file until the audio side
> is more mature.

Yes, I'll drop the audio bits from this patch. I had taken John's dts
file which includes the work he's performed on the audio.  Actually, I
haven't looked critically at this .dts, so there is probably a lot of
cruft that should be tightened up.

> > +		spkr-en-gpios = <&codec 2 0>;
> 
> Should that be "gpio" not "gpios", since there is only one?

Originally I though about that, but for consistency I think it is
better to have all gpio properties use a "gpios" suffix instead of a
mixture of "-gpio" and "-gpios".

> > +		hp-det-gpios = <&gpio 178 0>;
> > +		int-mic-en-gpios = <&gpio 184 0>;
> > +		ext-mic-en-gpios = <&gpio 185 0>;
> > +	};
> 
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> ...
> > +/ {
> ...
> > +	amba {
> > +		compatible = "simple-bus";
> ...
> > +		intc: interrupt-controller@50041000 {
> ...
> > +		};
> > +	};
> ...
> > +	i2c@7000c000 {
> 
> I've always wondered why all the devices aren't included inside the amba
> node. Or put another way, if the devices are outside the amba node, why
> not move everything outside the amba node and remove the amba node?

It is sometimes convenient to have all the SoC devices contained in a
collection node, such as if there is shared clock or power management
contect, but it is certainly not required.  It is probabaly best if the
hierarchy reflects the actual bus layout of the SoC instead of an
anonymous "soc" or "amba" node.

> > diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
> > index 823c703..6d3d695 100644
> > --- a/arch/arm/mach-tegra/Makefile
> > +++ b/arch/arm/mach-tegra/Makefile
> > @@ -30,5 +30,8 @@ obj-${CONFIG_MACH_PAZ00}		+= board-paz00-pinmux.o
> >  obj-${CONFIG_MACH_SEABOARD}             += board-seaboard.o
> >  obj-${CONFIG_MACH_SEABOARD}             += board-seaboard-pinmux.o
> > 
> > +obj-${CONFIG_MACH_TEGRA_DT}             += board-dt.o
> > +obj-${CONFIG_MACH_TEGRA_DT}             += board-harmony-pinmux.o
> 
> You need board-seaboard-pinmux.o here too.

Yes.  Actually, what I really need is a better way to handle pinmux,
and it isn't very sane to have board-*-pinmux.o added multiple times
to obj-y.  I'll tidy this up.

> 
> > diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
> ...
> > +static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
> > +	/* name		parent		rate		enabled */
> > +	{ "uartd",	"pll_p",	216000000,	true },
> > +	{ NULL,		NULL,		0,		0},
> > +};
> 
> For audio to work, you'll need more clock entries here currently; another
> reason I suggested to simply drop the audio stuff for now to keep things
> simple.

I've split the audio changes into a separate patch since that work
isn't complete yet.

> 
> > +static void __init tegra_dt_init(void)
> ...
> > +	if (of_machine_is_compatible("nvidia,harmony"))
> > +		harmony_pinmux_init();
> > +	else if (of_machine_is_compatible("nvidia,seaboard"))
> > +		seaboard_pinmux_init();
> 
> else error, or at least warn?

Yeah, at least until I can remove this ugly hunk entirely.

g.
