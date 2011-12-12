From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v6 10/10] arm/tegra: add support for tegra30 based board
 cardhu
Date: Sun, 11 Dec 2011 16:26:16 -0800
Message-ID: <20111212002616.GB26598@quad.lixom.net>
References: <1323348254-29072-1-git-send-email-pdeschrijver@nvidia.com>
 <1323348254-29072-11-git-send-email-pdeschrijver@nvidia.com>
 <4EE21B67.5040006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EE21B67.5040006-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 09, 2011 at 08:29:59AM -0600, Rob Herring wrote:
> On 12/08/2011 06:43 AM, Peter De Schrijver wrote:
> > Add support for the tegra30 based cardhu development board. Cardhu is a tablet
> > formfactor reference design for tegra30. The patch provides a device tree for
> > the board, updates Makefile.boot to build the dtb, includes the platform in
> > Kconfig and updates board-dt.c.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/tegra-cardhu.dts |   36 ++++++++++++++++++++++++++++++++++++
> >  arch/arm/mach-tegra/Kconfig        |    7 +++++++
> >  arch/arm/mach-tegra/Makefile.boot  |    1 +
> >  arch/arm/mach-tegra/board-dt.c     |    1 +
> >  4 files changed, 45 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/tegra-cardhu.dts
> > 
> > diff --git a/arch/arm/boot/dts/tegra-cardhu.dts b/arch/arm/boot/dts/tegra-cardhu.dts
> > new file mode 100644
> > index 0000000..70c41fc
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/tegra-cardhu.dts
> > @@ -0,0 +1,36 @@
> > +/dts-v1/;
> > +
> > +/include/ "tegra30.dtsi"
> > +
> > +/ {
> > +	model = "NVIDIA Tegra30 Cardhu evaluation board";
> > +	compatible = "nvidia,cardhu", "nvidia,tegra30";
> > +
> > +	memory {
> 
> memory@80000000

If there is only one memory node, then there is no need to specify the unit
address after the name, it's just noise.

> > diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
> > index aad54ca..6bae1bb 100644
> > --- a/arch/arm/mach-tegra/Kconfig
> > +++ b/arch/arm/mach-tegra/Kconfig
> > @@ -91,6 +91,13 @@ config MACH_VENTANA
> >         help
> >           Support for the nVidia Ventana development platform
> >  
> > +config MACH_CARDHU
> > +       bool "Cardhu board"
> > +       depends on ARCH_TEGRA_3x_SOC
> > +       select MACH_TEGRA_DT
> > +       help
> > +         Support for the NVIDIA Cardhu development platform
> > +
> 
> You should not be adding kconfig entries for boards. They should
> eventually go away with DT.

Agreed. On Tegra2 we still want board configs since it allows us to leave out
some of the kernel code that is still per-board (i.e. pinmux tables, etc). Once
that has been moved to device tree we can remove all board kconfig options
there. We might as well not start adding them on T30.

> >  choice
> >          prompt "Low-level debug console UART"
> >          default TEGRA_DEBUG_UART_NONE
> > diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Makefile.boot
> > index cf51a00..7c1110f 100644
> > --- a/arch/arm/mach-tegra/Makefile.boot
> > +++ b/arch/arm/mach-tegra/Makefile.boot
> > @@ -7,3 +7,4 @@ dtb-$(CONFIG_MACH_PAZ00) += tegra-paz00.dtb
> >  dtb-$(CONFIG_MACH_SEABOARD) += tegra-seaboard.dtb
> >  dtb-$(CONFIG_MACH_TRIMSLICE) += tegra-trimslice.dtb
> >  dtb-$(CONFIG_MACH_VENTANA) += tegra-ventana.dtb
> > +dtb-$(CONFIG_MACH_CARDHU) += tegra-cardhu.dtb
> 
> Likewise, this should be more like:
> dtb-$(CONFIG_MACH_TEGRA_DT) += tegra-seaboard.dtb tegra-trimslice.dtb
> tegra-ventana.dtb ...

Actually, the cardhu dts CONFIG_ARCH_TEGRA_3x_SOC, since there will only be DT
boards for that platform.

Moving the others to TEGRA_DT is a later change (see above comments about some
C code still needed).


-Olof
