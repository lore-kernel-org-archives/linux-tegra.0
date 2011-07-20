From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] arm/dt: tegra devicetree support
Date: Wed, 20 Jul 2011 12:47:58 -0600
Message-ID: <20110720184758.GG4642@ponder.secretlab.ca>
References: <20110719234158.2779.15394.stgit@ponder>
 <74CDBE0F657A3D45AFBB94109FB122FF049EBDEE27@HQMAIL01.nvidia.com>
 <20110720160355.GB2406@sirena.org.uk>
 <20110720183133.GE4642@ponder.secretlab.ca>
 <74CDBE0F657A3D45AFBB94109FB122FF049EBDEF01@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049EBDEF01-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 20, 2011 at 11:40:28AM -0700, Stephen Warren wrote:
> Grant Likely wrote at Wednesday, July 20, 2011 12:32 PM:
> > The compatible property here definitely represents the hardware
> > because it reflects the sound infrastructure on the harmony board.
> 
> I can see that argument for "nvidia,harmony-sound".
> 
> But "nvidia,tegra-wm8903" is pretty generic; I can certainly see there
> being Tegra 20 systems that use a WM8903 but are so different from either
> Harmony or anything supported by sound/soc/tegra/tegra_wm8903.c that the
> existing driver isn't applicable. And hence, there may be a different
> ASoC driver for such board(s), and hence choosing such a generic name as
> "tegra-wm8903" for Harmony/Seaboard's audio layout seems like it might
> cause problems in the future.
> 
> I'm fine with such a generic name for the platform driver, since that name
> can fairly easily be modified just by editing the driver and the board file.
> But since *.dts files are at least logically separate from the kernel, such
> naming future-proofing is a little more important.

Sure, the tegra-wm8903 property can be dropped.  If we start to see a
really well established pattern of the tegra paired with a wm8903,
then at that point we can define a compatible property for it and
document exactly what it means (document the boundaries and
assumptions that the compatible value requires).

g.
