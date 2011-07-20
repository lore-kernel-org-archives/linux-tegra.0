From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] arm/dt: tegra devicetree support
Date: Wed, 20 Jul 2011 12:31:33 -0600
Message-ID: <20110720183133.GE4642@ponder.secretlab.ca>
References: <20110719234158.2779.15394.stgit@ponder>
 <74CDBE0F657A3D45AFBB94109FB122FF049EBDEE27@HQMAIL01.nvidia.com>
 <20110720160355.GB2406@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110720160355.GB2406-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 20, 2011 at 05:03:55PM +0100, Mark Brown wrote:
> On Wed, Jul 20, 2011 at 08:37:19AM -0700, Stephen Warren wrote:
> > Grant Likely wrote at Tuesday, July 19, 2011 5:43 PM:
> 
> > > +	sound {
> > > +		compatible = "nvidia,harmony-sound", "nvidia,tegra-wm8903";
> 
> > I thought the sound bindings were still somewhat experimental and not
> > completely agreed upon. One issue I see is that Device Tree is
> > supposed to represent pure HW, rather than driver-required abstractions,
> > and at least the compatible name here is pretty Linux-driver-specific.
> 
> The current decision is that the schematic for embedded audio hardware
> is sufficiently interesting to be considered hardware in its own right
> separately to the chips contained within it.

Correct.  For complex composite devices like audio, it is completely
appropriate to have a root node that represents the entire complex and
how it is wired together.

The compatible property here definitely represents the hardware
because it reflects the sound infrastructure on the harmony board.

g.
