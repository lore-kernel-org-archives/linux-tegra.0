From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] dmaengine: tegra-apb: mark PM functions as
 __maybe_unused
Date: Fri, 20 Mar 2020 16:11:10 +0100
Message-ID: <20200320151110.GC3706404@ulmo>
References: <20200320071337.59756-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200320071337.59756-1-yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 03:13:37PM +0800, YueHaibing wrote:
> When CONFIG_PM is disabled, gcc warning this:
>=20
> drivers/dma/tegra20-apb-dma.c:1587:12: warning: 'tegra_dma_runtime_resume=
' defined but not used [-Wunused-function]
> drivers/dma/tegra20-apb-dma.c:1578:12: warning: 'tegra_dma_runtime_suspen=
d' defined but not used [-Wunused-function]
>=20
> Make it as __maybe_unused to fix the warnings,
> also remove unneeded function declarations.
>=20
> Fixes: ec8a1586780c ("dma: tegra: add dmaengine based dma driver")
> Signed-off-by: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl503Q4ACgkQ3SOs138+
s6G5HA//VBGymZPSAr4/KCkQAWaeqfla9+xr0XFMeT78df0ogJwPDwCa9r+AHPDj
ZplxW9b0SuqpA1+KyQRFqR5MAq3epvDgPKx6gRPxMHbWENnoPg2NrrR79gwHlPUM
D9glmHmhV+JtQ3TWyRqpEGaJwoWe9kCHze7IkIPR4EIV2zIKcYf4Cj3z+brGcu4E
wIEQkLRpvbvsIJ9wv2w2M6/lX0E0qVjCJEhox2kkwucw+DWeC5vzCtBWCp1cF+dc
0t+i5ZxmcNHSw48UItWlaT3jrF6JYyhgvy91XPTwyb+svKbSBR89c5hUObIJ6T3m
tiau23ebzYHgrBodc26Xt/R+APpQQbMriN2AGk9IR4q8UAuC4CntzjQ7ZZa60uA9
IGhNEgTXp99BmXjsKQLoYH9q50xZfmRYQwh42SjFnPpRUGC6o/5/1Uq0KuqC3qBC
6ezFx9qU5WluQqyy3JG1tfyPKBTU2185+eIrvMXFXo/SAUMfWzq8get22A7TY7PT
ZepRAFZ0m2K4zS3Ke4/Aiw3c4OwrSACEMneHl3pctRjN3BnOFTla2EbjlbBxsvs8
WELgeyQhlnwnxb08t3df90L2tlODllK+D+OTEZXwq6A75nYgKsAL2uLZECgO1k+L
GiqR3BstSazfR7ViZi41+GVMBhtqRPYnnu2H1iEizVa69o7WruU=
=Dnsf
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
