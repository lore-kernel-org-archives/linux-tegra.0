From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v2 06/13] docs/dt: Document nvidia,tegra20-pinmux binding
Date: Wed, 17 Aug 2011 13:37:25 +0200
Message-ID: <201108171337.26166.arnd@arndb.de>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com> <201108161551.31389.arnd@arndb.de> <74CDBE0F657A3D45AFBB94109FB122FF04AEA2537D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04AEA2537D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 16 August 2011, Stephen Warren wrote:
> Arnd Bergmann wrote at Tuesday, August 16, 2011 7:52 AM:
> > On Monday 15 August 2011, Stephen Warren wrote:
> 
> > The contents of this file seem to be specific to even just one
> > version of the tegra chip, and might be completely different for
> > tegra30 and later, right?
> 
> The general concepts are the same between tegra20 and tegra30.
> 
> Tegra30 has a different set of mux and drive pingroups.
> 
> Tegra30 has more functions that can be assigned to pins.
> 
> Tegra30 has three more options per mux pingroup, although I haven't
> Investigated whether any of those would need to be represented in DT;
> I suspect at least one will, possibly all.

Thanks for the info!
 
> Two things to note about Tegra that might not apply to all SoCs:
> 
> * There are separate groups of pins for Muxing (plus some config) vs.
> drive-strength (and related config). Some SoCs might use the same set
> of groups for both. Perhaps some SoC might even have three or more types
> of groups! I expect this to have some impact on the binding; I created
> explicit mux-groups and drive-groups sub-nodes to represent this.
>
> * Tegra's pinmux apply settings to groups of pins instead of individual
> pins. Some SoCs might allow each setting to be configurable per-pin.
> I don't expect this to have any impact as far as the bindings go though;
> it'll simply impact the names of the available pin "groups"; some SoCs
> will name groups, others pins.

ok, makes sense. So if we want to have a general binding that applies
to all, we really need to cover a lot of different ways to set these up.

> > > +Each mux pin group is represented as a sub-node of the nvidia,mux-groups node.
> > > +The name of the sub-node should be the name of the mux pingroup. The following
> > > +names are valid:
> > > +
> > > +	ata
> > > +	atb
> > > +	atc
> > > +	atd
> > > +	ate
> > > +	cdev1
> > > +	cdev2
> > > ...
> > 
> > I noticed that each board you define has a complete list of these. Would
> > it be possible to move a generic list into a tegra20-pinmux.dtsi file and
> > just override the pins in the per-board .dts file that require some special
> > setup?
> 
> I'm not sure how much commonality there will really be.
> 
> Certainly, many boards are based off our reference designs and so will
> have many similarities that could be shared.
> 
> That said, comparing even tegra-harmony.dts and tegra-seaboard.dts shows
> a lot of differences. It seems a lot less error-prone to just completely
> describe the entire pinmux state in each board's .dts file, rather than
> trying to represent half the information as default in the SoC .dtsi file,
> and just the diff in the board .dts file. I suppose perhaps if we put the
> hardware's own default settings in tegra20.dtsi, that'd make sense, since
> people are presumably reasonably aware of the delta relative to that.
> 
> We'd need to add new properties to override defaults, like:
> 
> nvidia,tristate --> nvidia,drive
> nvidia,pull-*   --> nvidia,no-pull

The split I had in mind is more to the effect that the .dtsi file
describes the set of pins that is there with their names and addresses,
while the board specific file describes how they are set up. Does that
make sense? I think I'm still missing some essential aspect of what the
pinmux code actually does ;-)

I now saw that you have the full description in the
arch/arm/mach-tegra/pinmux-t2-tables.c and arch/arm/mach-tegra/pinmux.c
files, with all the names again, and apparently your patch set leaves
these around. Do you think it's possible to actually move the static
tables from there into the device tree and do the entire setup based
on that?

	Arnd
