From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Tegra pinmux Device Tree support
Date: Tue, 9 Aug 2011 11:34:28 -0600
Message-ID: <20110809173428.GB32195@ponder.secretlab.ca>
References: <74CDBE0F657A3D45AFBB94109FB122FF049F17229E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049F17229E-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "Linus Walleij (linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org)" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 08, 2011 at 02:42:56PM -0700, Stephen Warren wrote:
> Grant, Linus, & all,
> 
> I was thinking of adding some Device Tree support to Tegra's existing
> pinmux driver. This would remove the dependence of mach-tegra/board-dt.c
> on board-{harmony,seaboard}-pinmux.c, and make the DT board stand on its
> own.
> 
> My thoughts were:
> 
> a) Every Tegra board currently has a board-$name-pinmux.c which contains
> a table like:
> 
> static struct tegra_pingroup_config harmony_pinmux[] = {
> 	{TEGRA_PINGROUP_ATA,   TEGRA_MUX_IDE,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
> 
> I'd just move that table into the Device Tree, keeping logically the same
> structure, but just changing the syntax as appropriate for DT.
> 
> (I'm slightly worried that DT wants me to encode all that using an
> unformatted table consistent of integers without any pre-processor macros
> or named constants though...)
> 
> b) I'd probably need to modify the pinmux driver to be a platform device
> in order to simplify integration with DT parsing etc.
> 
> c) I think the DT binding would not be affected by Linus W's work on a
> pinctrl API; I see this table as platform data that sets up the initial
> state of the SoC at boot-time, whereas the pinmux driver is more about
> drivers dynamically altering the pinmux at run-time. Is this a reasonable
> assertion? The alternative would be that once the new pinctrl API is
> available, it would have an associated DT binding that represented this
> data in a completely cross-SoC manner. Hence, any work on Tegra's pinmux
> right now would be throwaway. I'm interested in people's thoughts here.
> 
> Finally, I was thinking that a similar thing could be done for the Tegra
> GPIO driver, to replace gpio_table[] also in board-*-pinmux.c.
> 
> If this isn't useful right now, is there anything else that would help
> out on Tegra?

We talked about this a bit at Linaro connect.  Outside of the more
complex runtime-reconfiguration of pin mux, there is a general need
for arbitrary initialization sequences to registers.  Also, pretty
much exactly what you need for tegra is needed for imx, omap and many
others.  The though was, rather than trying to come up with some kind
of pinmux-specific binding for pin states, which could end up being
very verbose if everything was split out into properties, we could
instead have a binding for register initialization sequences.
Something like this:

	pinmux-initseq = <reg1 value1> <reg1 value2> ...;

And then add some macros for DTC to make it easier to define things
like pinmux setup tables.  Although the binding above is probably too
simple and naive.

g.
