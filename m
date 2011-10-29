From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: RE: [PATCH v2 2/3] arm/dt: tegra: add dts file for paz00
Date: Sat, 29 Oct 2011 13:03:20 +0200
Message-ID: <20111029110320.GD20132@ponder.secretlab.ca>
References: <cover.1319658296.git.marvin24@gmx.de>
	<e528a8eb783ace4729e0c76ca72d500d5281c9af.1319658296.git.marvin24@gmx.de>
	<74CDBE0F657A3D45AFBB94109FB122FF173E1B48D7@HQMAIL01.nvidia.com>
	<3520326.MNh26pzpGT@fb07-iapwap2>
	<74CDBE0F657A3D45AFBB94109FB122FF173EDAB4C7@HQMAIL01.nvidia.com>
	<20111029084330.GW19187@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20111029084330.GW19187@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Warren <swarren@nvidia.com>, Marc Dietrich <marvin24@gmx.de>, Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Oct 29, 2011 at 09:43:30AM +0100, Russell King - ARM Linux wrote:
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

Ugh.  Not pretty.  A platform could still have board specific fixup
code that matches on the compatible string that deals with broken
firmware ATAGs, but I don't think that is what we want to do.

We could handle it by filling the .dts file with an empty 'reg'
property for memory, and only push in the legacy ATAG data if reg is
indeed empty.  That gives the option of overriding ATAGs if the DT
already specifies memory.  Need to think about this more.

g.
