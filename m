From: Alexander Van Brunt <avanbrunt@nvidia.com>
Subject: Re: [PATCH V3] arm64: Don't flush tlb while clearing the accessed bit
Date: Mon, 29 Oct 2018 15:13:08 +0000
Message-ID: <BN7PR12MB2708B742FD3448589AD0F259CFF30@BN7PR12MB2708.namprd12.prod.outlook.com>
References: <1540805158-618-1-git-send-email-amhetre@nvidia.com>,<20181029105515.GD14127@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029105515.GD14127@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Ashish Mhetre <amhetre@nvidia.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sachin Nikam <Snikam@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

>=A0If we roll a TLB invalidation routine without the trailing DSB, what so=
rt of
>=A0performance does that get you?

We have been doing our testing on our Carmel CPUs. Carmel will effectively
ignore a TLB invalidate that doesn't have a DSB (until the invalidate buffe=
r
overflows). So, I expect the performance to be the same as with no TLB
invalidate, but not represent the performance of other ARMv8 CPUs


From: Will Deacon <will.deacon@arm.com>
Sent: Monday, October 29, 2018 3:55 AM
To: Ashish Mhetre
Cc: mark.rutland@arm.com; linux-arm-kernel@lists.infradead.org; linux-tegra=
@vger.kernel.org; Alexander Van Brunt; Sachin Nikam; linux-kernel@vger.kern=
el.org
Subject: Re: [PATCH V3] arm64: Don't flush tlb while clearing the accessed =
bit
=A0=20

On Mon, Oct 29, 2018 at 02:55:58PM +0530, Ashish Mhetre wrote:
> From: Alex Van Brunt <avanbrunt@nvidia.com>
>=20
> Accessed bit is used to age a page and in generic implementation there is
> flush_tlb while clearing the accessed bit.
> Flushing a TLB is overhead on ARM64 as access flag faults don't get
> translation table entries cached into TLB's. Flushing TLB is not necessar=
y
> for this. Clearing the accessed bit without flushing TLB doesn't cause da=
ta
> corruption on ARM64.
> In our case with this patch, speed of reading from fast NVMe/SSD through
> PCIe got improved by 10% ~ 15% and writing got improved by 20% ~ 40%.
> So for performance optimisation don't flush TLB when clearing the accesse=
d
> bit on ARM64.
> x86 made the same optimization even though their TLB invalidate is much
> faster as it doesn't broadcast to other CPUs.

Ok, but they may end up using IPIs so lets avoid these vague performance
claims in the log unless they're backed up with numbers.

> Please refer to:
> 'commit b13b1d2d8692 ("x86/mm: In the PTE swapout page reclaim case clear
> the accessed bit instead of flushing the TLB")'
>=20
> Signed-off-by: Alex Van Brunt <avanbrunt@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>=A0 arch/arm64/include/asm/pgtable.h | 20 ++++++++++++++++++++
>=A0 1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index 2ab2031..080d842 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -652,6 +652,26 @@ static inline int ptep_test_and_clear_young(struct v=
m_area_struct *vma,
>=A0=A0=A0=A0=A0=A0=A0 return __ptep_test_and_clear_young(ptep);
>=A0 }
>=A0=20
> +#define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
> +static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long address, pte_t *ptep)
> +{
> +=A0=A0=A0=A0 /*
> +=A0=A0=A0=A0=A0 * On ARM64 CPUs, clearing the accessed bit without a TLB=
 flush
> +=A0=A0=A0=A0=A0 * doesn't cause data corruption. [ It could cause incorr=
ect
> +=A0=A0=A0=A0=A0 * page aging and the (mistaken) reclaim of hot pages, bu=
t the
> +=A0=A0=A0=A0=A0 * chance of that should be relatively low. ]
> +=A0=A0=A0=A0=A0 *
> +=A0=A0=A0=A0=A0 * So as a performance optimization don't flush the TLB w=
hen
> +=A0=A0=A0=A0=A0 * clearing the accessed bit, it will eventually be flush=
ed by
> +=A0=A0=A0=A0=A0 * a context switch or a VM operation anyway. [ In the ra=
re
> +=A0=A0=A0=A0=A0 * event of it not getting flushed for a long time the de=
lay
> +=A0=A0=A0=A0=A0 * shouldn't really matter because there's no real memory
> +=A0=A0=A0=A0=A0 * pressure for swapout to react to. ]

This is blindly copied from x86 and isn't true for us: we don't invalidate
the TLB on context switch. That means our window for keeping the stale
entries around is potentially much bigger and might not be a great idea.

If we roll a TLB invalidation routine without the trailing DSB, what sort o=
f
performance does that get you?

Will
    =
