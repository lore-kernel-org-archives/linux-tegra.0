From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/3] ARM: Tegra: dt: Fix machine desc to match other
 boards.
Date: Fri, 29 Apr 2011 19:30:08 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B0AF@HQMAIL01.nvidia.com>
References: <1303619404-27604-1-git-send-email-swarren@nvidia.com>
 <1303619404-27604-3-git-send-email-swarren@nvidia.com>
 <20110429233502.GM7497@ponder.secretlab.ca>
 <74CDBE0F657A3D45AFBB94109FB122FF0497F1B0AB@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B0AB-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Sent: Friday, April 29, 2011 7:52 PM:
> To: Grant Likely
> Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: RE: [PATCH 2/3] ARM: Tegra: dt: Fix machine desc to match other
> boards.
> 
> Grant Likely wrote at Friday, April 29, 2011 5:35 PM:
> > On Sat, Apr 23, 2011 at 10:30:03PM -0600, Stephen Warren wrote:
> > > The content of the machine descriptions has be re-organized. Without fixing
> > > the board-dt.c copy, the system will fail to boot (BUG_ON during timer
> > > initialization, which happens before printk is operational, leading to a
> > > silent hang early during kernel boot). Solve this basiclaly by copying the
> > > existing Harmony version over the copy in board-dt.c
> > >
> > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  arch/arm/mach-tegra/board-dt.c |   11 ++++++-----
> > >  1 files changed, 6 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
> > > index 899311b..7b9d469 100644
> > > --- a/arch/arm/mach-tegra/board-dt.c
> > > +++ b/arch/arm/mach-tegra/board-dt.c
> > > @@ -175,10 +175,11 @@ static const char * tegra_dt_board_compat[] = {
> > >  };
> > >
> > >  DT_MACHINE_START(TEGRA_DT, "nVidia Tegra (Flattened Device Tree)")
> > > -	.fixup		= tegra_dt_fixup,
> >
> > I take it that with memory ranges encoded into the device tree this
> > fixup is no longer needed?  I'll drop the tegra_dt_fixup() function
> > from the file too then.
> 
> I actually tested this all on Seaboard not Harmony, and locally modified
> the tegra-harmony.dts to add to the kernel cmdline mem=/nvmem= options
> identical to what we use for Seaboard + ChromeOS. Now I have things
> working, I should probably remove the kernel cmdline mem=/nvmem= options,
> and validate that the dt memory setup is working correctly. I believe the
> fixup function was only there to cater for broken bootloader setups that
> didn't supply the correct mem=/nvmem= on the kernel cmdline, so this
> should all work OK...

I've now tested on Seaboard with the fixup removed as above, no mem= or
nvmem= kernel cmdline options, and hence just the devicetree memory
definitions. Everything looks like it's fine.

-- 
nvpublic
