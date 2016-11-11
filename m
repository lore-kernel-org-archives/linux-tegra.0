From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/tegra: Support kernel mappings with IOMMU
Date: Fri, 11 Nov 2016 15:36:41 +0100
Message-ID: <20161111143641.GC4967@ulmo.ba.sec>
References: <20161108175135.32004-1-mperttunen@nvidia.com>
 <20161108175135.32004-3-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161108175135.32004-3-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 07:51:34PM +0200, Mikko Perttunen wrote:
> From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Host1x command buffer patching requires that the buffer object can be
> mapped into kernel address space, however, the recent addition of
> IOMMU did not account to this requirement. Therefore Host1x engines
> cannot be used if IOMMU is enabled.
>=20
> This patch implements kmap, kunmap, mmap and munmap functions to
> host1x bo objects.
>=20
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/gem.c | 34 +++++++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)

Applied with a tiny fixup of the commit message, thanks.

Thierry

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYJdd5AAoJEN0jrNd/PrOhuO4QAIlp1i1yGh0FxB+fOBwKT1CH
+eoNCiNTx2mazY6sMjra4/UjStEr1zMsWaprMZsSQnCNAcWCwtUpoN5mgL9T670T
hMJd8XHGW14c8J+txO8WZzKsqdvJH5UKvOxT87hcMispIIY3DAq/jcWZkc7ufjmr
kI1vxv6ny9C3z/s1gFdax7+xqjko6BEG1juyft/UgKj6wFL1pyMjwAPXzwSbZSiy
LG370Mcdalw6cCjvouLQ+RRQMqjqayGbc76LueBSHJcZQRcTTU9xSrJVZo0uwvY+
BhV/2kKmyEZAzLj3aU6kqG7xH7DrGomOGuuQb9h8oQiVaSZt2cZo3+NDzcmcQzFU
qtxiqpaNvHAQIT+VU9mo0Qr/TAJJ1spww486lDZTMf6cegrynlDqDdFrXtFvibAr
mRK1L0f84fEqqF32f7by30sIZhWHgIWtxvilqaPQtRxv8F8r/70j+j8WiftMrrWf
k1Quu1YvUTbu90UFuWgGEFcrboVXLmMV7OJPqR9tqNFXfgS3uzOt2s6jUZ0XW1Cz
7g0hGBqjTd5lsTGUup3P8p5XAf9ypAwkDFOnOGmmEtbtlyDRiS+GQNB5ur+hCAEL
hRz3Gxygrr0yzOUIQgfbaPMvKGQjVEiNFhGUmwj4/zfeyDcYInUt1Mp+47nTyCdr
KRKzMnZ2MDFLnUAdxkoj
=tI9m
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--
