From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] iommu/tegra-smmu: Add missing locks around mapping
 operations
Date: Mon, 25 May 2020 10:35:56 +0200
Message-ID: <20200525083556.GA2382769@ulmo>
References: <20200524183755.3774-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200524183755.3774-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2020 at 09:37:55PM +0300, Dmitry Osipenko wrote:
> The mapping operations of the Tegra SMMU driver are subjected to a race
> condition issues because SMMU Address Space isn't allocated and freed
> atomically, while it should be. This patch makes the mapping operations
> atomic, it fixes an accidentally released Host1x Address Space problem
> which happens while running multiple graphics tests in parallel on
> Tegra30, i.e. by having multiple threads racing with each other in the
> Host1x's submission and completion code paths, performing IOVA mappings
> and unmappings in parallel.
>=20
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/iommu/tegra-smmu.c | 43 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 7426b7666e2b..4f956a797838 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  #include <linux/dma-mapping.h>
> =20
>  #include <soc/tegra/ahb.h>
> @@ -49,6 +50,7 @@ struct tegra_smmu_as {
>  	struct iommu_domain domain;
>  	struct tegra_smmu *smmu;
>  	unsigned int use_count;
> +	spinlock_t lock;
>  	u32 *count;
>  	struct page **pts;
>  	struct page *pd;
> @@ -308,6 +310,8 @@ static struct iommu_domain *tegra_smmu_domain_alloc(u=
nsigned type)
>  		return NULL;
>  	}
> =20
> +	spin_lock_init(&as->lock);
> +
>  	/* setup aperture */
>  	as->domain.geometry.aperture_start =3D 0;
>  	as->domain.geometry.aperture_end =3D 0xffffffff;
> @@ -578,7 +582,7 @@ static u32 *as_get_pte(struct tegra_smmu_as *as, dma_=
addr_t iova,
>  		struct page *page;
>  		dma_addr_t dma;
> =20
> -		page =3D alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
> +		page =3D alloc_page(GFP_ATOMIC | __GFP_DMA | __GFP_ZERO);

I'm not sure this is a good idea. My recollection is that GFP_ATOMIC
will allocate from a special reserved region of memory, which may be
easily exhausted.

Is there any reason why we need the spinlock? Can't we use a mutex
instead?

>  		if (!page)
>  			return NULL;
> =20
> @@ -655,8 +659,9 @@ static void tegra_smmu_set_pte(struct tegra_smmu_as *=
as, unsigned long iova,
>  	smmu_flush(smmu);
>  }
> =20
> -static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iov=
a,
> -			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
> +static int
> +tegra_smmu_map_locked(struct iommu_domain *domain, unsigned long iova,
> +		      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)

I think it's more typical to use the _unlocked suffix for functions that
don't take a lock themselves.

>  {
>  	struct tegra_smmu_as *as =3D to_smmu_as(domain);
>  	dma_addr_t pte_dma;
> @@ -685,8 +690,9 @@ static int tegra_smmu_map(struct iommu_domain *domain=
, unsigned long iova,
>  	return 0;
>  }
> =20
> -static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned lon=
g iova,
> -			       size_t size, struct iommu_iotlb_gather *gather)
> +static size_t
> +tegra_smmu_unmap_locked(struct iommu_domain *domain, unsigned long iova,
> +			size_t size, struct iommu_iotlb_gather *gather)
>  {
>  	struct tegra_smmu_as *as =3D to_smmu_as(domain);
>  	dma_addr_t pte_dma;
> @@ -702,6 +708,33 @@ static size_t tegra_smmu_unmap(struct iommu_domain *=
domain, unsigned long iova,
>  	return size;
>  }
> =20
> +static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iov=
a,
> +			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
> +{
> +	struct tegra_smmu_as *as =3D to_smmu_as(domain);
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&as->lock, flags);
> +	ret =3D tegra_smmu_map_locked(domain, iova, paddr, size, prot, gfp);
> +	spin_unlock_irqrestore(&as->lock, flags);
> +
> +	return ret;
> +}
> +
> +static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned lon=
g iova,
> +			       size_t size, struct iommu_iotlb_gather *gather)
> +{
> +	struct tegra_smmu_as *as =3D to_smmu_as(domain);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&as->lock, flags);
> +	size =3D tegra_smmu_unmap_locked(domain, iova, size, gather);
> +	spin_unlock_irqrestore(&as->lock, flags);
> +
> +	return size;
> +}

Why the extra functions here? We never call locked vs. unlocked variants
in the driver and the IOMMU framework only has a single callback, so I
think the locking can just move into the main implementation.

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7Lg2kACgkQ3SOs138+
s6F2gQ//eHJZIvBIrliCm/OVpD0ZDodUlg7jxmVdBBCH8SMkbQPXgQhO5YhpHMRq
LdOAztHnqXwDn+zt+XM3UvMJFoUivCC70GDsOXu9JYRmDMSlH+uE01YGSpC4Rmig
TZ9KDzarm4EDL7dC9XFOEQguI5LGXtcmwct45oDSXZ/28zcTMj0Od6SgazVOuL1i
z+jexSPTCoCtBabxvG4BQoolonhl8xpAG53ijryPJKyID4BH7oc+Q3+vAmc1FJII
iQ67Wi9hhmS9vcqld08KcAspAA6ZAMBHq6dTz/JzptON63FZ80bdmgHUgL6y8szy
Epf4AMWT4xMQCfOk47J1K3XtpEW+ic9guL3J4KL74bFJp89JgOIY8iRtnSyiMu3h
xw6omwr7mDCHt/P5U5W2D7UvvhTxJ6eMh3oHicbJbbbKLzDIkvemNvLpXvCZD2Pl
uOJl6RnGm1/LFyVdBXHt/xzGvw5+hv/tMIDrIc3q+se01IO0zTA31WNB2MxE6jFw
3mbfHV+LQzuXVgQJYzr8qGXLMSuW9E4tdt55bTCK79dDUr5coiczjSkcKMYy2kHA
syrAkY5m54tscMcnwBdIxqw7DVNJSRw54mWs6FO/K+oNNZxuBFPYYfpXQouMh+K/
PPxk8x307iPiOYlvXPF1wS4Za4Zx1vIpfrxvK6h5ddSdFdky9nQ=
=h3MX
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
