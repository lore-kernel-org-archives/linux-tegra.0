From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Date: Thu, 27 Feb 2020 18:57:00 -0800
Message-ID: <20200228025700.GA856087@builder>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20191209150748.2471814-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon 09 Dec 07:07 PST 2019, Thierry Reding wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 

Sorry for the slow response on this, finally got the time to go through
this in detail and try it out on some Qualcomm boards.

> On some platforms, the firmware will setup hardware to read from a given
> region of memory. One such example is a display controller that is
> scanning out a splash screen from physical memory.
> 

This particular use case is the one that we need to figure out for
Qualcomm devices as well; on some devices it's a simple splash screen
(that on many devices can be disabled), but for others we have EFIFB
on the display and no (sane) means to disable this.

> During Linux' boot process, the ARM SMMU will configure all contexts to
> fault by default. This means that memory accesses that happen by an SMMU
> master before its driver has had a chance to properly set up the IOMMU
> will cause a fault. This is especially annoying for something like the
> display controller scanning out a splash screen because the faults will
> result in the display controller getting bogus data (all-ones on Tegra)
> and since it repeatedly scans that framebuffer, it will keep triggering
> such faults and spam the boot log with them.
> 

As my proposed patches indicated, the Qualcomm platform boots with
stream mapping setup for the hardware used by the bootloader, but
relying on the associated context banks not being enabled.

USFCFG in SCR0 is set and any faults resulting of this will trap into
secure world and the device will be reset.

> In order to work around such problems, scan the device tree for IOMMU
> masters and set up a special identity domain that will map 1:1 all of
> the reserved regions associated with them. This happens before the SMMU
> is enabled, so that the mappings are already set up before translations
> begin.
> 
> One thing that was pointed out earlier, and which I don't have a good
> idea on how to solve it, is that the early identity domain is not
> discarded. The assumption is that the standard direct mappings code of
> the IOMMU framework will replace the early identity domain once devices
> are properly attached to domains, but we don't have a good point in time
> when it would be safe to remove the early identity domain.
> 
> One option that I can think of would be to create an early identity
> domain for each master and inherit it when that master is attached to
> the domain later on, but that seems rather complicated from an book-
> keeping point of view and tricky because we need to be careful not to
> map regions twice, etc.
> 

The one concern I ran into with this approach (after resolving below
issues) is that when the display driver probes a new domain will be
created automatically and I get a stream of "Unhandled context fault" in
the log until the driver has mapped the framebuffer in the newly
allocated context.

This is normally not a problem, as we seem to be able to do this
initialization in a few frames, but for the cases where the display
driver probe defer this is a problem.

But at least these devices doesn't reboot, so this is way better than the
current state.

> Any good ideas on how to solve this? It'd also be interesting to see if
> there's a more generic way of doing this. I know that something like
> this isn't necessary on earlier Tegra SoCs with the custom Tegra SMMU
> because translations are only enabled when the devices are attached to a
> domain. I'm not sure about other IOMMUs, but in the absence of a struct
> device, I suspect that we can't really do anything really generic that
> would work across drivers.
> 

As I indicated above I managed to get this working on the boards we have
that uses the arm-smmu driver.

## SDM845
Booting the SDM845 shows the following register stream mapping register
content:
  SMR(0): 0x80080880 S2CR(0): 0x0
  SMR(1): 0x80080c80 S2CR(1): 0x0
  SMR(2): 0x800f00a0 S2CR(2): 0x1
  SMR(3): 0x800f00c0 S2CR(3): 0x1
  SMR(4): 0x800f00e0 S2CR(4): 0x2
  SMR(5): 0x800f0100 S2CR(5): 0x2
  SMR(6): 0x0 S2CR(6): 0x0
  SMR(7): 0x0 S2CR(7): 0x0
  SMR(8): 0x0 S2CR(8): 0x200ff
  SMR(9): 0x0 S2CR(9): 0x200ff
  ...

Here stream 0 and 1 (SID 0x880 and 0xc80) are the display streams, the
remainder are related to storage and USB - which afaict doesn't need to be
maintained.

As the display uses context bank 0, using this as the identity bank results in
a couple of occurrences of:
  Unhandled context fault: fsr=0x402, iova=0x9da00000, fsynr=0x370020, cbfrsynra=0x880, cb=0

Which we survive, but as we reach arm_smmu_device_reset() to flush out the new
stream mapping we start by writing S2CR(0) = 0, then SMR(0) = 0x800810a0. So
until SMR(4) is written we're lacking a valid stream mapping for the display,
and hence if the screen does refresh in during time period the device reboots.


In addition to this, the iommu_iova_to_phys() you perform in the mapping loop
results in a large number of "translation fault!" printouts from
arm_smmu_iova_to_phys_hard().

## SM8150
Boots with the following stream mapping:
  SMR(0): 0x800006a0 S2CR(0): 0x0
  SMR(1): 0x800006c0 S2CR(1): 0x0
  SMR(2): 0x80000300 S2CR(2): 0x1
  SMR(3): 0x84200800 S2CR(3): 0x2
  SMR(4): 0x0 S2CR(4): 0x0
  SMR(5): 0x0 S2CR(5): 0x0
  SMR(6): 0x0 S2CR(6): 0x200ff
  SMR(7): 0x0 S2CR(7): 0x200ff
  ...

Here stream 3 (sid 0x800) is the display stream.

Mapping the various memory regions into the first context works fine, but
unless the display stream happens to be allocated to stream 3 (e.g. it always
ends up in slot 1 with my current DT) the board reboots shortly after we start
writing out the SMRs. I've not yet figured out why the board faults because of
the move to an earlier SMR index. (Perhaps because we clear the previously used
display SMR valid bit?)


## Conclusions
Both of these platforms indicates that moving the stream mapping around is
going to cause issues, so inspired by my proposal I added below snippet right
before the call to arm_smmu_setup_identity(), in order to populate the stream
mapping selection.

	for (i = 0; i < smmu->num_mapping_groups; i++) {
		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
		smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
		smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
		smmu->smrs[i].valid = !!(smr & ARM_SMMU_SMR_VALID);
	}

With this both boards boots fine, but I know Will had reservations wrt trusting
these values. Perhaps we could use the read back values (with some sanity
checking) only for setting up identity mapping?


With this I also tested booting MSM8996 (the db820c board) and except for
spending about 75 seconds printing below error in the kernel log during boot
things seems to be functional.

[   96.670723] arm-smmu b40000.iommu: translation fault!
[   96.675038] arm-smmu b40000.iommu: PAR = 0x300000203


Removing the call to iommu_iova_to_phys() in the mapping loop (as I know
that I don't have any memory regions with multiple clients) solves the
log spamming and all three boards seems to be functional.

Regards,
Bjorn

> Thierry
> 
> Thierry Reding (2):
>   iommu: arm-smmu: Extract arm_smmu_of_parse()
>   iommu: arm-smmu: Add support for early direct mappings
> 
>  drivers/iommu/arm-smmu.c | 195 +++++++++++++++++++++++++++++++++++++--
>  drivers/iommu/arm-smmu.h |   2 +
>  2 files changed, 189 insertions(+), 8 deletions(-)
> 
> -- 
> 2.23.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
