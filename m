From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: shut up harmless warning on NOMMU
Date: Wed, 25 Jan 2017 07:52:49 +0100
Message-ID: <20170125065249.GA12584@ulmo.ba.sec>
References: <20170112111425.3228358-1-arnd@arndb.de>
 <20170119110058.GD30182@ulmo.ba.sec>
 <7713814.tr8Zr0Cdrc@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7713814.tr8Zr0Cdrc@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2017 at 04:09:47PM +0100, Arnd Bergmann wrote:
> On Thursday, January 19, 2017 12:00:58 PM CET Thierry Reding wrote:
> > On Thu, Jan 12, 2017 at 12:13:51PM +0100, Arnd Bergmann wrote:
> > > The tegra DRM driver is almost ok without an MMU, but there
> > > is one small warning that I get:
> > >=20
> > > drivers/gpu/drm/tegra/gem.c: In function 'tegra_drm_mmap':
> > > drivers/gpu/drm/tegra/gem.c:508:12: unused variable 'prot'
> > >=20
> > > This marks the variable as __maybe_unused instead.
> > >=20
> > > Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > > ---
> > >  drivers/gpu/drm/tegra/gem.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> > > index 7d853e6b5ff0..63f14b7a59a0 100644
> > > --- a/drivers/gpu/drm/tegra/gem.c
> > > +++ b/drivers/gpu/drm/tegra/gem.c
> > > @@ -505,7 +505,7 @@ int tegra_drm_mmap(struct file *file, struct vm_a=
rea_struct *vma)
> > > =20
> > >  		vma->vm_pgoff =3D vm_pgoff;
> > >  	} else {
> > > -		pgprot_t prot =3D vm_get_page_prot(vma->vm_flags);
> > > +		pgprot_t prot __maybe_unused =3D vm_get_page_prot(vma->vm_flags);
> >=20
> > This seems to me like a suboptimal solution. The reason why this fails
> > is because pgprot_writecombine(prot) for NOMMU translates to __pgprot(0)
> > via a macro. This also means that we need to potentially add a
> > __maybe_unused annotation to every local variable that stores a value
> > that gets passed to pgprot_writecombine().
> >=20
> > There fortunately aren't very many of those cases, but I still think
> > that a better solution would be to turn pgprot_writecombine() into a
> > static inline function, so that the parameter would get silently
> > ignored. Or perhaps if it must remain a macro, then doing the following
> > should still avoid the need to modify every call site:
> >=20
> > 	#define pgprot_writecombine(prot) ({ (void)prot; __pgprot(0); })
> >=20
> > Thierry
> >=20
>=20
> Makes sense. How about this version?
>=20
> 	Arnd
> ---
> From 83af6bc74423c90be7f580a827268b89f94b5c6b Mon Sep 17 00:00:00 2001
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Date: Thu, 19 Jan 2017 16:05:29 +0100
> Subject: [PATCH] ARM: improve NOMMU definition of pgprot_*()
>=20
> The tegra DRM driver produces a harmless warning when built for NOMMU:
>=20
> drivers/gpu/drm/tegra/gem.c: In function 'tegra_drm_mmap':
> drivers/gpu/drm/tegra/gem.c:508:12: unused variable 'prot'
>=20
> This is because pgprot_writecombine() on ARM returns a constant and
> ignores its argument. The version in asm-generic doesn't have that
> problem, so let's use that one instead. We don't actually care
> about the value on NOMMU, and this is consistent with what some
> other architectures do.
>=20
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>=20
> diff --git a/arch/arm/include/asm/pgtable-nommu.h b/arch/arm/include/asm/=
pgtable-nommu.h
> index add094d09e3e..302240c19a5a 100644
> --- a/arch/arm/include/asm/pgtable-nommu.h
> +++ b/arch/arm/include/asm/pgtable-nommu.h
> @@ -63,9 +63,9 @@ typedef pte_t *pte_addr_t;
>  /*
>   * Mark the prot value as uncacheable and unbufferable.
>   */
> -#define pgprot_noncached(prot)	__pgprot(0)
> -#define pgprot_writecombine(prot) __pgprot(0)
> -#define pgprot_dmacoherent(prot) __pgprot(0)
> +#define pgprot_noncached(prot)	(prot)
> +#define pgprot_writecombine(prot) (prot)
> +#define pgprot_dmacoherent(prot) (prot)
> =20
> =20
>  /*
>=20

I remember writing a reply to this, but it seems like I never sent it
out. The above looks good to me:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIS0EACgkQ3SOs138+
s6FgCRAAq1phbR0FTmeIH7RpvnPAqYQuiciBhP+GNV12y1JUpxyL+kBq1rmdRTog
kQCHMrAtuKbGojiwlwNEhR7IFm4nsXbPDMnztxNzdwsTTrzaISdmoqVBNNa9HYOy
gaNBEHeffPh7243AvpzeWYvVhJpyapf7mbYIXPPacyPCj6SLxD5MxqxnvTmHRWO0
2hy3vYTlhlY3Ziemz5qNPxAvEJpyCACamkUgSs1JIyO6Hcv2NBXKiFtdHLjj6n30
0997PFMYHAypF2xEzi2eAo9stPEiN4hwaDHjqJOarWL52PdrOCPgPZ94y/R2+dWY
uIT29Iv+lhEeYn0febKTJIMZMwxDUxPitSzYP5E7OlMUw3ZOsxaBkSWIsdBjTxsp
6JJyP9aVKDlbVzm4RxGCmBsbJ5gqN9uw/KfJrQjFiIf0+bH08MYOSvkC8Vin+LV4
GzZEvY9LTocLA17SgW5THgGZHcBWI1girb+L3zThq/uWnn8LFDRjUMXW4fA8B7ot
jlj2BVeqznbAXiMO4WQQInaboUCehKM6Lmsmz0o/Ny5DBlu4+Hxvl/RhTwuyua22
/lBVF6Hmpbybqr/a+ID/GYiRp3+13TJv3M0C1CcmemaTf1rFvQx6HpdOKcaEqwGc
bxlqWgo41RakR4BdFj/dnzMid1VEigOTYuWihkG419X63PYQXXU=
=2p2Q
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
