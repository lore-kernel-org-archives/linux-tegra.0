From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/dt: tegra devicetree support
Date: Wed, 20 Jul 2011 11:33:56 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049EBDEEFA@HQMAIL01.nvidia.com>
References: <20110719234158.2779.15394.stgit@ponder>
 <74CDBE0F657A3D45AFBB94109FB122FF049EBDEE27@HQMAIL01.nvidia.com>
 <20110720182823.GD4642@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110720182823.GD4642-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Grant Likely wrote at Wednesday, July 20, 2011 12:28 PM:
> On Wed, Jul 20, 2011 at 08:37:19AM -0700, Stephen Warren wrote:
> > Grant Likely wrote at Tuesday, July 19, 2011 5:43 PM:
> > > Everything required to populate NVIDIA Tegra devices from the device
> > > tree.  This patch adds a new DT_MACHINE_DESC() which matches against
> > > a tegra20 device tree.  So far it only registers the on-chip devices,
> > > but it will be refined in follow on patches to configure clocks and
> > > pin IO from the device tree also.
...
> > > diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
> >
> > tegra-*.dts don't include status="disable" for all the unused controllers.
> > Should that be added?
> 
> I dropped that pattern since my preference has been to have boards
> explicitly disable unused cores and that has generally been the
> pattern on other DT platforms.

Sorry if I wasn't clear, but what I meant was that the board-specific
files tegra-harmony.dts and tegra-seaboard.dts don't include the status=
"disable" entries for the modules/ports they don't use.

Still, everything probably works OK without that...

-- 
nvpublic
