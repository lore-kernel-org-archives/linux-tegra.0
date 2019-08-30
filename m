From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/7] iommu/arm-smmu: Add tlb_sync implementation hook
Date: Fri, 30 Aug 2019 13:14:46 +0200
Message-ID: <20190830111446.GC23902@ulmo>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-4-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5484413533326776479=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567118827-26358-4-git-send-email-vdumpa@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krishna Reddy <vdumpa@nvidia.com>
Cc: snikam@nvidia.com, thomasz@nvidia.com, jtukkinen@nvidia.com, mperttunen@nvidia.com, praithatha@nvidia.com, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, talho@nvidia.com, olof@lixom.net, yhsu@nvidia.com, linux-tegra@vger.kernel.org, treding@nvidia.com, avanbrunt@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============5484413533326776479==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 03:47:03PM -0700, Krishna Reddy wrote:
> tlb_sync hook allows nvidia smmu handle tlb sync
> across multiple SMMUs as necessary.
>=20
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>  drivers/iommu/arm-smmu-nvidia.c | 32 ++++++++++++++++++++++++++++++++
>  drivers/iommu/arm-smmu.c        |  8 +++++---
>  drivers/iommu/arm-smmu.h        |  4 ++++
>  3 files changed, 41 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvi=
dia.c
> index d93ceda..a429b2c 100644
> --- a/drivers/iommu/arm-smmu-nvidia.c
> +++ b/drivers/iommu/arm-smmu-nvidia.c
> @@ -56,11 +56,43 @@ static void nsmmu_write_reg64(struct arm_smmu_device =
*smmu,
>  		writeq_relaxed(val, nsmmu_page(smmu, i, page) + offset);
>  }
> =20
> +static void nsmmu_tlb_sync_wait(struct arm_smmu_device *smmu, int page,
> +				int sync, int status, int inst)
> +{
> +	u32 reg;
> +	unsigned int spin_cnt, delay;
> +
> +	for (delay =3D 1; delay < TLB_LOOP_TIMEOUT; delay *=3D 2) {
> +		for (spin_cnt =3D TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
> +			reg =3D readl_relaxed(
> +			      nsmmu_page(smmu, inst, page) + status);
> +			if (!(reg & sTLBGSTATUS_GSACTIVE))
> +				return;
> +			cpu_relax();
> +		}
> +		udelay(delay);
> +	}
> +	dev_err_ratelimited(smmu->dev,
> +			    "TLB sync timed out -- SMMU may be deadlocked\n");
> +}
> +
> +static void nsmmu_tlb_sync(struct arm_smmu_device *smmu, int page,
> +			   int sync, int status)
> +{
> +	int i;
> +
> +	arm_smmu_writel(smmu, page, sync, 0);
> +
> +	for (i =3D 0; i < to_nsmmu(smmu)->num_inst; i++)
> +		nsmmu_tlb_sync_wait(smmu, page, sync, status, i);
> +}
> +
>  static const struct arm_smmu_impl nsmmu_impl =3D {
>  	.read_reg =3D nsmmu_read_reg,
>  	.write_reg =3D nsmmu_write_reg,
>  	.read_reg64 =3D nsmmu_read_reg64,
>  	.write_reg64 =3D nsmmu_write_reg64,
> +	.tlb_sync =3D nsmmu_tlb_sync,
>  };
> =20
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *sm=
mu)
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 46e1641..f5454e71 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -52,9 +52,6 @@
>   */
>  #define QCOM_DUMMY_VAL -1
> =20
> -#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
> -#define TLB_SPIN_COUNT			10
> -
>  #define MSI_IOVA_BASE			0x8000000
>  #define MSI_IOVA_LENGTH			0x100000
> =20
> @@ -244,6 +241,11 @@ static void __arm_smmu_tlb_sync(struct arm_smmu_devi=
ce *smmu, int page,
>  	unsigned int spin_cnt, delay;
>  	u32 reg;
> =20
> +	if (smmu->impl->tlb_sync) {
> +		smmu->impl->tlb_sync(smmu, page, sync, status);
> +		return;
> +	}
> +

Wouldn't it work if you replaced all calls of __arm_smmu_tlb_sync() by
smmu->impl->tlb_sync() and assign __arm_smmu_tlb_sync() as default for
devices that don't need to override it? That makes this patch slightly
larger, but it saves us one level of indirection.

> +
>  	arm_smmu_writel(smmu, page, sync, QCOM_DUMMY_VAL);
>  	for (delay =3D 1; delay < TLB_LOOP_TIMEOUT; delay *=3D 2) {
>  		for (spin_cnt =3D TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index 9645bf1..d3217f1 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -207,6 +207,8 @@ enum arm_smmu_cbar_type {
>  /* Maximum number of context banks per SMMU */
>  #define ARM_SMMU_MAX_CBS		128
> =20
> +#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
> +#define TLB_SPIN_COUNT			10
> =20
>  /* Shared driver definitions */
>  enum arm_smmu_arch_version {
> @@ -336,6 +338,8 @@ struct arm_smmu_impl {
>  	int (*cfg_probe)(struct arm_smmu_device *smmu);
>  	int (*reset)(struct arm_smmu_device *smmu);
>  	int (*init_context)(struct arm_smmu_domain *smmu_domain);
> +	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
> +			 int status);

Can't page, sync and status all be unsigned?

Thierry

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1pBSYACgkQ3SOs138+
s6GamhAAm9NP9HwE2om5HwmvNF1hvSJvdYGIs8Hb+6SK7HaysBo/UItRO7PatkiM
I3Dy8/4A8G8usJbwN7+MgFMqLU+aaEA+4iqHdAm8e/4OSZhzjiLu5/hhKAlUgCUn
booaUKUu9PdhunwyuWoS3Baz3pCTjJgGEr4BdtT/DpikFZXLzouG5r+n7bp85B8a
M3n7J3nd/1eWpPUGohLnK74ZE/rtX9p6/s9U6aJE8dwoyIulMGVlW+iV42fEfVCS
FREDgmrVme/6QjpvsHZYNtkUNcwI0DvoTsJrCUnp7m5NCpXkXTZY9YkwcYOAeeAZ
sLQ464W8Fh+s8m0ZyEmOx6TnDClrFzOyyT/CxMB+B0P7Ro/1xvDVEt/UBdsVj6cY
NIw15iqmh6y9OYxQr5xFiHm5VjOnTuKUESkUKTp5TDgoP9aAYNxJM+sOgK++3k2Q
Tw38fWKoLd3Ar6EuvnGbmVXSpqWVmfNxTS8BRUfeLtadXdrMitKO+Qlz5ZTI3GW7
A5RFA+n8dgTNQaOKgm+s1e6lm4EIvb9ifKrDziuHTW1Zvc3JBQUO8zuuctaR6IAl
mS4wyFCLdVWFQiVUM05HxdjxWGu5Dd2ZKStGAkkMt2epWtDV6Hg/WP22D0F+iYHN
4x3H7TF6Qu9D/ZkLt7wt5KjA4v6irlhrb8ZFF/rCTTRAijtUKtg=
=lYk9
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--


--===============5484413533326776479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5484413533326776479==--
