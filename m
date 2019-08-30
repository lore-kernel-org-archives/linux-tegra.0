From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/7] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Fri, 30 Aug 2019 13:17:07 +0200
Message-ID: <20190830111707.GD23902@ulmo>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-5-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1567118827-26358-5-git-send-email-vdumpa@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Reddy <vdumpa@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, treding@nvidia.com, yhsu@nvidia.com, snikam@nvidia.com, praithatha@nvidia.com, talho@nvidia.com, avanbrunt@nvidia.com, thomasz@nvidia.com, olof@lixom.net, jtukkinen@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 03:47:04PM -0700, Krishna Reddy wrote:
> Add global/context fault hooks to allow Nvidia SMMU implementation
> handle faults across multiple SMMUs.
>=20
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>  drivers/iommu/arm-smmu-nvidia.c | 127 ++++++++++++++++++++++++++++++++++=
++++++
>  drivers/iommu/arm-smmu.c        |   6 ++
>  drivers/iommu/arm-smmu.h        |   4 ++
>  3 files changed, 137 insertions(+)
>=20
> diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvi=
dia.c
> index a429b2c..b2a3c49 100644
> --- a/drivers/iommu/arm-smmu-nvidia.c
> +++ b/drivers/iommu/arm-smmu-nvidia.c
> @@ -14,6 +14,10 @@
> =20
>  #define NUM_SMMU_INSTANCES 3
> =20
> +static irqreturn_t nsmmu_context_fault_inst(int irq,
> +					    struct arm_smmu_device *smmu,
> +					    int idx, int inst);

More of these signed integers that could be unsigned. Also why the need
to predeclare this? Can you not just put the definition of the function
up here?

> +
>  struct nvidia_smmu {
>  	struct arm_smmu_device	smmu;
>  	int			num_inst;
> @@ -87,12 +91,135 @@ static void nsmmu_tlb_sync(struct arm_smmu_device *s=
mmu, int page,
>  		nsmmu_tlb_sync_wait(smmu, page, sync, status, i);
>  }
> =20
> +static irqreturn_t nsmmu_global_fault_inst(int irq,
> +					       struct arm_smmu_device *smmu,
> +					       int inst)
> +{
> +	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
> +
> +	gfsr =3D readl_relaxed(nsmmu_page(smmu, inst, 0) + ARM_SMMU_GR0_sGFSR);
> +	gfsynr0 =3D readl_relaxed(nsmmu_page(smmu, inst, 0) +
> +				ARM_SMMU_GR0_sGFSYNR0);
> +	gfsynr1 =3D readl_relaxed(nsmmu_page(smmu, inst, 0) +
> +				ARM_SMMU_GR0_sGFSYNR1);
> +	gfsynr2 =3D readl_relaxed(nsmmu_page(smmu, inst, 0) +
> +				ARM_SMMU_GR0_sGFSYNR2);
> +
> +	if (!gfsr)
> +		return IRQ_NONE;
> +
> +	dev_err_ratelimited(smmu->dev,
> +		"Unexpected global fault, this could be serious\n");
> +	dev_err_ratelimited(smmu->dev,
> +		"\tGFSR 0x%08x, GFSYNR0 0x%08x, GFSYNR1 0x%08x, GFSYNR2 0x%08x\n",
> +		gfsr, gfsynr0, gfsynr1, gfsynr2);
> +
> +	writel_relaxed(gfsr, nsmmu_page(smmu, inst, 0) + ARM_SMMU_GR0_sGFSR);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t nsmmu_global_fault(int irq, struct arm_smmu_device *s=
mmu)
> +{
> +	int i;
> +	irqreturn_t irq_ret =3D IRQ_NONE;
> +
> +	/* Interrupt line is shared between global and context faults.
> +	 * Check for both type of interrupts on either fault handlers.
> +	 */
> +	for (i =3D 0; i < to_nsmmu(smmu)->num_inst; i++) {
> +		irq_ret =3D nsmmu_context_fault_inst(irq, smmu, 0, i);
> +		if (irq_ret =3D=3D IRQ_HANDLED)
> +			return irq_ret;
> +	}
> +
> +	for (i =3D 0; i < to_nsmmu(smmu)->num_inst; i++) {
> +		irq_ret =3D nsmmu_global_fault_inst(irq, smmu, i);
> +		if (irq_ret =3D=3D IRQ_HANDLED)
> +			return irq_ret;
> +	}
> +
> +	return irq_ret;
> +}
> +
> +static irqreturn_t nsmmu_context_fault_bank(int irq,
> +					    struct arm_smmu_device *smmu,
> +					    int idx, int inst)
> +{
> +	u32 fsr, fsynr, cbfrsynra;
> +	unsigned long iova;
> +
> +	fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> +	if (!(fsr & FSR_FAULT))
> +		return IRQ_NONE;
> +
> +	fsynr =3D readl_relaxed(nsmmu_page(smmu, inst, smmu->numpage + idx) +
> +			      ARM_SMMU_CB_FSYNR0);
> +	iova =3D readq_relaxed(nsmmu_page(smmu, inst, smmu->numpage + idx) +
> +			     ARM_SMMU_CB_FAR);
> +	cbfrsynra =3D readl_relaxed(nsmmu_page(smmu, inst, 1) +
> +				  ARM_SMMU_GR1_CBFRSYNRA(idx));
> +
> +	dev_err_ratelimited(smmu->dev,
> +	"Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsynr=3D0x%x, cbf=
rsynra=3D0x%x, cb=3D%d\n",
> +			    fsr, iova, fsynr, cbfrsynra, idx);
> +
> +	writel_relaxed(fsr, nsmmu_page(smmu, inst, smmu->numpage + idx) +
> +			    ARM_SMMU_CB_FSR);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t nsmmu_context_fault_inst(int irq,
> +					    struct arm_smmu_device *smmu,
> +					    int idx, int inst)
> +{
> +	irqreturn_t irq_ret =3D IRQ_NONE;
> +
> +	/* Interrupt line shared between global and all context faults.
> +	 * Check for faults across all contexts.
> +	 */
> +	for (idx =3D 0; idx < smmu->num_context_banks; idx++) {
> +		irq_ret =3D nsmmu_context_fault_bank(irq, smmu, idx, inst);
> +
> +		if (irq_ret =3D=3D IRQ_HANDLED)
> +			break;
> +	}
> +
> +	return irq_ret;
> +}
> +
> +static irqreturn_t nsmmu_context_fault(int irq,
> +				       struct arm_smmu_device *smmu,
> +				       int cbndx)
> +{
> +	int i;
> +	irqreturn_t irq_ret =3D IRQ_NONE;
> +
> +	/* Interrupt line is shared between global and context faults.
> +	 * Check for both type of interrupts on either fault handlers.
> +	 */
> +	for (i =3D 0; i < to_nsmmu(smmu)->num_inst; i++) {
> +		irq_ret =3D nsmmu_global_fault_inst(irq, smmu, i);
> +		if (irq_ret =3D=3D IRQ_HANDLED)
> +			return irq_ret;
> +	}
> +
> +	for (i =3D 0; i < to_nsmmu(smmu)->num_inst; i++) {
> +		irq_ret =3D nsmmu_context_fault_inst(irq, smmu, cbndx, i);
> +		if (irq_ret =3D=3D IRQ_HANDLED)
> +			return irq_ret;
> +	}
> +
> +	return irq_ret;
> +}
> +
>  static const struct arm_smmu_impl nsmmu_impl =3D {
>  	.read_reg =3D nsmmu_read_reg,
>  	.write_reg =3D nsmmu_write_reg,
>  	.read_reg64 =3D nsmmu_read_reg64,
>  	.write_reg64 =3D nsmmu_write_reg64,
>  	.tlb_sync =3D nsmmu_tlb_sync,
> +	.global_fault =3D nsmmu_global_fault,
> +	.context_fault =3D nsmmu_context_fault,
>  };
> =20
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *sm=
mu)
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index f5454e71..9cc532d 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -454,6 +454,9 @@ static irqreturn_t arm_smmu_context_fault(int irq, vo=
id *dev)
>  	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>  	int idx =3D smmu_domain->cfg.cbndx;
> =20
> +	if (smmu->impl->context_fault)
> +		return smmu->impl->context_fault(irq, smmu, idx);
> +

Same comment here...

>  	fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
>  	if (!(fsr & FSR_FAULT))
>  		return IRQ_NONE;
> @@ -475,6 +478,9 @@ static irqreturn_t arm_smmu_global_fault(int irq, voi=
d *dev)
>  	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
>  	struct arm_smmu_device *smmu =3D dev;
> =20
> +	if (smmu->impl->global_fault)
> +		return smmu->impl->global_fault(irq, smmu);

=2E.. and here about the extra level of indirection.

Thierry

--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1pBbMACgkQ3SOs138+
s6HRnQ//e8kxnSuymTLiHTTs/LjliZ1RW0EOolgORCgheEKYM4ZJ/+SXDsJqFCQu
rpCAaqhEhO3HudPZpttRr7jTSz15Zix7utRiApW3a7IltOLR1c7cgdLUT/+Cvl/F
Q6WDv4KZhN0KNjbEBbAoOy90JfH9qscfWeBmhqPRB1vjtq+PcyBh45444IO/9W3K
dyU0ov+wX6rV3BZf1Djf/UddCGBxkUUN/YYPjZ0+3PrTqMabzIm+mL2Zq9wAelvn
bKgb5vsLC7Dq3kyCjodB/4DJ3N3pwOZoTFIv1FU4fCj5Ynlmsekvge/3b4wiQg/u
Z1KKpfVCSd24M9Hv/OpWXWLRfiNFC5BUndrZMzUWOM9URINCjlVWwvQT5oabxQAP
BXKMN5V4PBgqNMrw54+TFieNAEnKHVUsenLgsElcJte/0Y1K40+YnCSv1hvTryMC
YcGJvhuHzsbTqVoFpEvMGiOcuHjHk8T8NCd3Xcw1XJ5c0cs1pM2jp4J1XNmq0zoi
zc4KlwFHixT/F+mZoH7xIVg8087A0ecRqSq4u2MqSWJ3zASP3VcsLymGsmgxA0pq
wfZ/u69HFJN7lzkeNUrTBIxOJ3QdLrPiNb+DiS5xHePqUbPQVQ6jyLyETK/IX2vy
fsDfXBXDURmGJWIUz7yreL2kuafshxaNrrGitm/iToxPLloRElQ=
=fMVj
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--
