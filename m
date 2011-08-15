From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC PATCH 00/12] arm/tegra: Initialize GPIO & pinmux from DT
Date: Mon, 15 Aug 2011 09:07:16 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA25054@HQMAIL01.nvidia.com>
References: <1313189697-21287-1-git-send-email-swarren@nvidia.com>
 <20110813130858.GC7244@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110813130858.GC7244-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Shawn Guo wrote at Saturday, August 13, 2011 7:09 AM:
> On Fri, Aug 12, 2011 at 04:54:45PM -0600, Stephen Warren wrote:
> > This patch modifies Tegra's device tree support to remove the dependency
> > on harmony_pinmux_init(), thus making it completely board-independent.
> >
> > Some notes:
> >
...
> > * tegra_pinmux_probe_dt() enumerates all legal pingroup names, and searches
> >   for a pinmux controller subnode of that name, then processes each one
> >   that is found. An alternative that some may prefer would be to enumerate
> >   each child node of the pinmux controller, and have each node contain an
> >   explicit pingroup name property instead. Does anyone have any preference
> >   here? I suppose the latter option would obviate the need to add
> >   of_find_child_node_by_name().
>
> I agree with Jamie that the latter option seems better/simper.

OK, I'll flip the iteration around.

...
> >  arch/arm/boot/dts/tegra-harmony.dts          |  479 ++++++++++++++++++++++++++
> >  arch/arm/boot/dts/tegra-seaboard.dts         |  409 ++++++++++++++++++++++
> >  arch/arm/boot/dts/tegra20.dtsi               |    5 +
> >  arch/arm/mach-tegra/Makefile                 |    1 -
> >  arch/arm/mach-tegra/board-dt.c               |   12 +-
> >  arch/arm/mach-tegra/board-harmony-pinmux.c   |    8 +
> >  arch/arm/mach-tegra/board-paz00-pinmux.c     |    8 +
> >  arch/arm/mach-tegra/board-seaboard-pinmux.c  |    9 +-
> >  arch/arm/mach-tegra/board-trimslice-pinmux.c |    7 +
> >  arch/arm/mach-tegra/devices.c                |   10 +
> >  arch/arm/mach-tegra/devices.h                |    2 +
> >  arch/arm/mach-tegra/pinmux.c                 |  136 ++++++++
> >  drivers/gpio/gpio-tegra.c                    |   56 +++-
> >  drivers/of/base.c                            |   18 +
> >  include/linux/of.h                           |    2 +
> >  15 files changed, 1138 insertions(+), 24 deletions(-)
> >
> Generally, you need to document the bindings you come with in
> Documentation/devicetree/bindings/

Uggh. I must have run format-patch on the wrong commit ID; the last thing
I did was to add a couple commits containing the documentation:-( I really
shouldn't try to post patch series last thing on Friday...

-- 
nvpublic
