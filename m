From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: RE: [PATCH v2 2/3] arm/dt: tegra: add dts file for paz00
Date: Mon, 31 Oct 2011 08:51:43 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173EDAB770@HQMAIL01.nvidia.com>
References: <cover.1319658296.git.marvin24@gmx.de>
 <e528a8eb783ace4729e0c76ca72d500d5281c9af.1319658296.git.marvin24@gmx.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173E1B48D7@HQMAIL01.nvidia.com>
 <3520326.MNh26pzpGT@fb07-iapwap2>
 <74CDBE0F657A3D45AFBB94109FB122FF173EDAB4C7@HQMAIL01.nvidia.com>
 <20111029084330.GW19187@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111029084330.GW19187-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Russell King wrote at Saturday, October 29, 2011 2:44 AM:
> On Fri, Oct 28, 2011 at 09:49:49AM -0700, Stephen Warren wrote:
> > When boards boot from DT, there is no fixup function to override the
> > bootloader's ATAGs. I also see a bunch of code to set up the memory
> > information from DT e.g. setup_machine_fdt()'s call to:
> >
> > 	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
> >
> > ... but I assume that happens before the ATAGs are processed, and the
> > buggy ATAGs end up overriding the information in the DT file.
> 
> As far as the uncompressed kernel is concerned, there is either ATAG
> or DT information, never both.  If the boot loader provides ATAGs and
> the zImage has a DT appended to it, the zImage decompressor merges the
> ATAGs into the appended DT and passes the DT to the kernel.
> 
> So anyone who currently 'fixes' their broken boot loader via the fixup
> function by directly manipulating the ATAGS is going to hit the DT
> image instead.

I believe the PAZ00 fixup function runs on the kernel's internal data-
structures, not the ATAGs directly, so the issue you point out isn't
a problem here:

static void __init tegra_paz00_fixup(struct tag *tags, char **cmdline,
        struct meminfo *mi)
{
        mi->nr_banks = 1;
        mi->bank[0].start = PHYS_OFFSET;
        mi->bank[0].size = 448 * SZ_1M;
}

-- 
nvpublic
