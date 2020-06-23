From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/4] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Tue, 23 Jun 2020 10:36:43 +0200
Message-ID: <20200623083643.GB4098287@ulmo>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-4-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200604234414.21912-4-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2020 at 04:44:13PM -0700, Krishna Reddy wrote:
> Add global/context fault hooks to allow NVIDIA SMMU implementation
> handle faults across multiple SMMUs.
>=20
> Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/iommu/arm-smmu-nvidia.c | 100 ++++++++++++++++++++++++++++++++
>  drivers/iommu/arm-smmu.c        |  11 +++-
>  drivers/iommu/arm-smmu.h        |   3 +
>  3 files changed, 112 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvi=
dia.c
> index dafc293a45217..5999b6a770992 100644
> --- a/drivers/iommu/arm-smmu-nvidia.c
> +++ b/drivers/iommu/arm-smmu-nvidia.c
> @@ -117,6 +117,104 @@ static int nsmmu_reset(struct arm_smmu_device *smmu)
>  	return 0;
>  }
> =20
> +static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> +{
> +	return container_of(dom, struct arm_smmu_domain, domain);
> +}
> +
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
> +static irqreturn_t nsmmu_global_fault(int irq, void *dev)
> +{
> +	int inst;
> +	irqreturn_t irq_ret =3D IRQ_NONE;
> +	struct arm_smmu_device *smmu =3D dev;
> +
> +	for (inst =3D 0; inst < to_nvidia_smmu(smmu)->num_inst; inst++) {
> +		irq_ret =3D nsmmu_global_fault_inst(irq, smmu, inst);
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
> +	if (!(fsr & ARM_SMMU_FSR_FAULT))
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
> +static irqreturn_t nsmmu_context_fault(int irq, void *dev)
> +{
> +	int inst, idx;
> +	irqreturn_t irq_ret =3D IRQ_NONE;
> +	struct iommu_domain *domain =3D dev;
> +	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
> +	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +
> +	for (inst =3D 0; inst < to_nvidia_smmu(smmu)->num_inst; inst++) {
> +		/* Interrupt line shared between all context faults.
> +		 * Check for faults across all contexts.
> +		 */
> +		for (idx =3D 0; idx < smmu->num_context_banks; idx++) {
> +			irq_ret =3D nsmmu_context_fault_bank(irq, smmu,
> +							   idx, inst);
> +
> +			if (irq_ret =3D=3D IRQ_HANDLED)
> +				return irq_ret;
> +		}
> +	}
> +
> +	return irq_ret;
> +}
> +
>  static const struct arm_smmu_impl nvidia_smmu_impl =3D {
>  	.read_reg =3D nsmmu_read_reg,
>  	.write_reg =3D nsmmu_write_reg,
> @@ -124,6 +222,8 @@ static const struct arm_smmu_impl nvidia_smmu_impl =
=3D {
>  	.write_reg64 =3D nsmmu_write_reg64,
>  	.reset =3D nsmmu_reset,
>  	.tlb_sync =3D nsmmu_tlb_sync,
> +	.global_fault =3D nsmmu_global_fault,
> +	.context_fault =3D nsmmu_context_fault,
>  };
> =20
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *sm=
mu)
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 243bc4cb2705b..d720e1e191176 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -673,6 +673,7 @@ static int arm_smmu_init_domain_context(struct iommu_=
domain *domain,
>  	enum io_pgtable_fmt fmt;
>  	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>  	struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> +	irqreturn_t (*context_fault)(int irq, void *dev);
> =20
>  	mutex_lock(&smmu_domain->init_mutex);
>  	if (smmu_domain->smmu)
> @@ -835,7 +836,9 @@ static int arm_smmu_init_domain_context(struct iommu_=
domain *domain,
>  	 * handler seeing a half-initialised domain state.
>  	 */
>  	irq =3D smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
> -	ret =3D devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
> +	context_fault =3D (smmu->impl && smmu->impl->context_fault) ?
> +			 smmu->impl->context_fault : arm_smmu_context_fault;

A simpler way might have been to assign arm_smmu_context_fault to all
implementations. That way we wouldn't have to perform this check here
and instead just always using smmu->impl->context_fault.

> +	ret =3D devm_request_irq(smmu->dev, irq, context_fault,
>  			       IRQF_SHARED, "arm-smmu-context-fault", domain);
>  	if (ret < 0) {
>  		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
> @@ -2107,6 +2110,7 @@ static int arm_smmu_device_probe(struct platform_de=
vice *pdev)
>  	struct arm_smmu_device *smmu;
>  	struct device *dev =3D &pdev->dev;
>  	int num_irqs, i, err;
> +	irqreturn_t (*global_fault)(int irq, void *dev);
> =20
>  	smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>  	if (!smmu) {
> @@ -2193,9 +2197,12 @@ static int arm_smmu_device_probe(struct platform_d=
evice *pdev)
>  		smmu->num_context_irqs =3D smmu->num_context_banks;
>  	}
> =20
> +	global_fault =3D (smmu->impl && smmu->impl->global_fault) ?
> +			smmu->impl->global_fault : arm_smmu_global_fault;
> +

Same as above.

Thierry

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7xvxoACgkQ3SOs138+
s6GqYBAAoTf7KJPieWVcbFJf7WZ37Spi4ElW5TCTmB8w+7Ta0O+QvYzjA6sgPAVH
eRvzY8htDuI8uKWAu4cimQHsyl/oYAXTtEUK15DJVHY9h+VGxtj1hibG+xF2mHMP
5C3ILKj3aG0eHzC4ZuBHjLWerXQca5kIL0RinVwoycUpuofZ89B+Za2S3IfzECoI
HKRB5t5Ewlj2Zj7wbdEzk3ZE55DnN/+ccHlsunrbfdtgqOy9r/tJzXRh0es6fq9E
LvGVgBxEyqWZHqlLgNL/CtJ20N1l/TX35ykmBDAgLlWociDGn192g81igC6/7lm8
3uYQtopzIUyT4BVhJWZafi07qbkQLTa3mFEkfAly525CLAEmoCflS0DfwNKXXW5n
pzxfG61PJwOuEwWoPNmiVixMa4D7akYEk+/XHVxLQ/y/sD4xgWY6atec8SNmMHWj
jTBjqVz/ErxmRXJLpFb42SVdOvo8dDxSypjmiqyAT+MaqhQfRNhRjl/9R1Vz445M
gaogqT8/MNliChyUUBegQsLjvJl6EmeCZnDXWkP5LwCRVML0Nbi9f7uGbtEAt6lP
ImxHKoBo5BQlRjsorsMCWt/KC4w35cxI/SoOSclTJO/T1/nGs0ja2WUUDgU+M8Q7
7PSOGYFJqtG6/lhnqTXl15SvfmUIYrAUxMy1yKbZP1xmOoLPn+c=
=iggw
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
