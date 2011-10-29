From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: RE: [PATCH v2 2/3] arm/dt: tegra: add dts file for paz00
Date: Sat, 29 Oct 2011 12:44:18 +0100
Message-ID: <20111029114418.GZ19187@n2100.arm.linux.org.uk>
References: <cover.1319658296.git.marvin24@gmx.de> <e528a8eb783ace4729e0c76ca72d500d5281c9af.1319658296.git.marvin24@gmx.de> <74CDBE0F657A3D45AFBB94109FB122FF173E1B48D7@HQMAIL01.nvidia.com> <3520326.MNh26pzpGT@fb07-iapwap2> <74CDBE0F657A3D45AFBB94109FB122FF173EDAB4C7@HQMAIL01.nvidia.com> <20111029084330.GW19187@n2100.arm.linux.org.uk> <20111029110320.GD20132@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111029110320.GD20132-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Oct 29, 2011 at 01:03:20PM +0200, Grant Likely wrote:
> On Sat, Oct 29, 2011 at 09:43:30AM +0100, Russell King - ARM Linux wrote:
> > On Fri, Oct 28, 2011 at 09:49:49AM -0700, Stephen Warren wrote:
> > > When boards boot from DT, there is no fixup function to override the
> > > bootloader's ATAGs. I also see a bunch of code to set up the memory
> > > information from DT e.g. setup_machine_fdt()'s call to:
> > > 
> > > 	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
> > > 
> > > ... but I assume that happens before the ATAGs are processed, and the
> > > buggy ATAGs end up overriding the information in the DT file.
> > 
> > As far as the uncompressed kernel is concerned, there is either ATAG
> > or DT information, never both.  If the boot loader provides ATAGs and
> > the zImage has a DT appended to it, the zImage decompressor merges the
> > ATAGs into the appended DT and passes the DT to the kernel.
> > 
> > So anyone who currently 'fixes' their broken boot loader via the fixup
> > function by directly manipulating the ATAGS is going to hit the DT
> > image instead.
> 
> Ugh.  Not pretty.  A platform could still have board specific fixup
> code that matches on the compatible string that deals with broken
> firmware ATAGs, but I don't think that is what we want to do.

No.  The point I was making is that by the time you get to the fixup
function with a DT or even into the uncompressed kernel, even if the
boot loader provided ATAGs, your ATAGs have long since been obliterated
and are no longer available.
