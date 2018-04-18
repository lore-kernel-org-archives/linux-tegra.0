From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: drm: tegra: Adding new typedef vm_fault_t
Date: Wed, 18 Apr 2018 10:24:39 +0200
Message-ID: <20180418082439.GA4646@ulmo>
References: <20180417134755.GA30291@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1314658961=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180417134755.GA30291@jordon-HP-15-Notebook-PC>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, willy@infradead.org, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1314658961==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2018 at 07:17:55PM +0530, Souptick Joarder wrote:
> Use new return type vm_fault_t for fault handler. For
> now, this is just documenting that the function returns
> a VM_FAULT value rather than an errno. Once all instances
> are converted, vm_fault_t will become a distinct type.
>=20
> Reference id -> 1c8f422059ae ("mm: change return type to
> vm_fault_t")
>=20
> Previously vm_insert_page() returns err which driver
> mapped into VM_FAULT_* type. The new function=20
> vmf_insert_page() will replace this inefficiency by
> returning VM_FAULT_* type.
>=20
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 49b9bf2..6121493 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -422,14 +422,13 @@ int tegra_bo_dumb_create(struct drm_file *file, str=
uct drm_device *drm,
>  	return 0;
>  }
>=20
> -static int tegra_bo_fault(struct vm_fault *vmf)
> +static vm_fault_t tegra_bo_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma =3D vmf->vma;
>  	struct drm_gem_object *gem =3D vma->vm_private_data;
>  	struct tegra_bo *bo =3D to_tegra_bo(gem);
>  	struct page *page;
>  	pgoff_t offset;
> -	int err;
>=20
>  	if (!bo->pages)
>  		return VM_FAULT_SIGBUS;
> @@ -437,20 +436,7 @@ static int tegra_bo_fault(struct vm_fault *vmf)
>  	offset =3D (vmf->address - vma->vm_start) >> PAGE_SHIFT;
>  	page =3D bo->pages[offset];
>=20
> -	err =3D vm_insert_page(vma, vmf->address, page);
> -	switch (err) {
> -	case -EAGAIN:
> -	case 0:
> -	case -ERESTARTSYS:
> -	case -EINTR:
> -	case -EBUSY:
> -		return VM_FAULT_NOPAGE;
> -
> -	case -ENOMEM:
> -		return VM_FAULT_OOM;
> -	}
> -
> -	return VM_FAULT_SIGBUS;
> +	return vmf_insert_page(vma, vmf->address, page);
>  }

This new function returns VM_FAULT_NOPAGE only for 0 and -EBUSY, whereas
we used to return VM_FAULT_NOPAGE for -EAGAIN, -ERESTARTSYS and -EINTR
as well. Was this previously wrong?

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrXAMQACgkQ3SOs138+
s6H+Iw/+L7jhIyd/NNbJuxvRpWH8R9K98cWBfD2fvAjaNapXrsZx+t1yhKNjZ6+w
3jG8S+RqiMXvt+I6ewOzlZybJ0T6J+HuuAtV816uJT4G76yi8FGlriR2YOMjY/Pe
VyIlvoZ8DcFPfPSkq5ZK3hF61fPdpfUIW2GJJ8Owr5QmNt66Fv0SQ1r4Sjvvraz/
sPQzNTRbfBbvKb9JuCe5VsxGEn3aI10EDzXk0bz/liwpe+YsZ5TeBS3mvvSraYVK
DAao7d4Ax/IAL9E+DymlEDaWwQv3Du6DNs0aatgc4PbPovDW/89oE45svVKq5x9K
GnRxvS1zlRv+hDY1rTw/TEgIAuEVYdaGJj/tTeP3EpJkRtFi7yYEch5gy07+RDaI
uUSCQvGsrpJAo9YdKeer+TsUTvKvD7ZmNi3UQcjrozyZh7tOUSK7BDN6cCsExWPH
hYSeLNhPE1SctteWbeaUd0/YdWBwj0JuL/LRa7+Es1j1PBaUp9I+TzSqLjI4UONg
0Ma7arhxY2z8AAX0KtlHmWawT/Glp2xKEUh1+l7tAA31vkPA3CWt7WJmEm1hZw1X
fHQDt6Ue4AwE8KQ4jZh3SrCDhjS/MO+nj3mJ4ch+7WIMosSPMQRcqFX46D21UBEe
b9DDjWWw5WCTY3hj+3Djugw1JJ3KU6RAaClmbYGz8yH0qjO80ek=
=JPtB
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

--===============1314658961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1314658961==--
