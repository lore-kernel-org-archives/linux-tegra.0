From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/tegra: Add device-tree support for TrimSlice board
Date: Mon, 24 Oct 2011 21:10:21 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173E1B4171@HQMAIL01.nvidia.com>
References: <1319450467-11819-1-git-send-email-swarren@nvidia.com>
 <5320972.AGvAdFqRz5@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5320972.AGvAdFqRz5@ax5200p>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Monday, October 24, 2011 3:28 PM:
> On Monday 24 October 2011 12:01:07 Stephen Warren wrote:
> > * Add device-tree file for TrimSlice
> > * Add that to the list of .dts files to build
> > * Update board-dt.c to recognize TrimSlice board name
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/tegra-trimslice.dts |   38
> > +++++++++++++++++++++++++++++++++ arch/arm/mach-tegra/Makefile.boot     |
> >  1 +
> >  arch/arm/mach-tegra/board-dt.c        |    3 ++
> >  3 files changed, 42 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/tegra-trimslice.dts
> 
> doesn't this also require to add something like
> 
> obj-${CONFIG_MACH_TEGRA_DT} += board-trimslice-pinmux.o
> 
> to the Makefile?

Yes, definitely. I've fixed this up locally; I hope to repost soon.

> And how is the binary device tree generated? I cannot find the proper CONFIG so
> that Makefile.boot is executed.

make dtbs
(this relies on having built dtc, which happens only by "make" not e.g.
"make zImage" IIRC)

-- 
nvpublic
