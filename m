From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/4] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Tue, 23 Jun 2020 14:33:39 +0200
Message-ID: <20200623123339.GA696655@ulmo>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-4-vdumpa@nvidia.com>
 <20200623083643.GB4098287@ulmo>
 <2dda4530-39cc-d549-1124-26337dd9afbe@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2dda4530-39cc-d549-1124-26337dd9afbe-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 12:30:16PM +0100, Robin Murphy wrote:
> On 2020-06-23 09:36, Thierry Reding wrote:
> [...]
> > > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > > index 243bc4cb2705b..d720e1e191176 100644
> > > --- a/drivers/iommu/arm-smmu.c
> > > +++ b/drivers/iommu/arm-smmu.c
> > > @@ -673,6 +673,7 @@ static int arm_smmu_init_domain_context(struct io=
mmu_domain *domain,
> > >   	enum io_pgtable_fmt fmt;
> > >   	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
> > >   	struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> > > +	irqreturn_t (*context_fault)(int irq, void *dev);
> > >   	mutex_lock(&smmu_domain->init_mutex);
> > >   	if (smmu_domain->smmu)
> > > @@ -835,7 +836,9 @@ static int arm_smmu_init_domain_context(struct io=
mmu_domain *domain,
> > >   	 * handler seeing a half-initialised domain state.
> > >   	 */
> > >   	irq =3D smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
> > > -	ret =3D devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
> > > +	context_fault =3D (smmu->impl && smmu->impl->context_fault) ?
> > > +			 smmu->impl->context_fault : arm_smmu_context_fault;
> >=20
> > A simpler way might have been to assign arm_smmu_context_fault to all
> > implementations. That way we wouldn't have to perform this check here
> > and instead just always using smmu->impl->context_fault.
>=20
> But smmu->impl can still be NULL...
>=20
> Everything in impl, including the presence of impl itself, is optional, so
> the notion of overriding a default with the same default doesn't really m=
ake
> much sense, and would go against the pattern everywhere else.

True. I had assumed that every implementation would set smmu->impl
anyway, in which case there'd be little reason to use these default
fallbacks since each implementation could simply directly refer to the
exact implementation that it wants.

Perhaps the above could be made a bit more palatable by using a standard
if/else rather than the ternary operator? That would also more closely
match the pattern elsewhere.

Thierry

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7x9p8ACgkQ3SOs138+
s6FZPg/9HSAfgoaJNJaXTtNi/OEDZY+VElZLtUMvcQUqt0cbrIEJaGnYnsoTWi6K
K6p9wrmkmVs6D4yT8I84B+Fe34KFdITXA8NPGPD3g2YFSVCGwr1YzW9gtEwYliG2
c0q9TuA4tr1NF1F1Hy6B2vTgT22UIvXR38IXp9MP+Ti8EoM1VTcQL4S8ABruWT89
rUxYHWxWTOiBx401M2oyQY/ToahL1V/tjnS/muOpqxbAEl41NnHXQfdUcfjytZgg
uKMQZRvNCTufFFI3UWrW9vfimBnZWSTqtVtBC/0/c32e7sJvvf5HHXxaZ8+5roGw
trzSaZg4qbK3jq6TZSO/fIcWqrzdhO9ERBHUZt2MgvzBKAIX6VkRMlyPvoYLrVwv
Tto5T2vkq9XTMZB+vYqHMg54/3zntpoMA7BzHGXFItjebOXlkgCVGbJpDOCrxi2v
YIGPkFmV+RwOjf5oEsBAkQZ82trHmpjXJlu6Qx2IDiQpo9Lg3+YCyDRkFLODlRli
iS0jeeQzD0JoRjm7pnv8Yllop8VfPsYMA9WiURza8DQ6ccf8xFNpzlOB+CIa7zoA
PLUnvNCTsfxN5QzClaQ9mkyKq0YB9WXWgmJ2vaKIWMJp/vJkh9k+ZBfMJd1AgrFo
H12y1uz7qUlU94llCeiaLwgYnh02QiKDjLWT5+gDKhXuHMm5tcs=
=8o7I
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
