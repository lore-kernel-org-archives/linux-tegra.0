From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dmaengine: tegra210-adma: Fix an error handling path in
 'tegra_adma_probe()'
Date: Tue, 19 May 2020 18:25:19 +0200
Message-ID: <20200519162519.GE2113674@ulmo>
References: <20200516214205.276266-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200516214205.276266-1-christophe.jaillet@wanadoo.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ldewangan@nvidia.com, jonathanh@nvidia.com, dan.j.williams@intel.com, vkoul@kernel.org, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2020 at 11:42:05PM +0200, Christophe JAILLET wrote:
> Commit b53611fb1ce9 ("dmaengine: tegra210-adma: Fix crash during probe")
> has moved some code in the probe function and reordered the error handling
> path accordingly.
> However, a goto has been missed.
>=20
> Fix it and goto the right label if 'dma_async_device_register()' fails, so
> that all resources are released.
>=20
> Fixes: b53611fb1ce9 ("dmaengine: tegra210-adma: Fix crash during probe")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/dma/tegra210-adma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7ECG8ACgkQ3SOs138+
s6HyGBAAtqw2Y28Sav7FpIgNdlgPeJGBIZ8WuLD4zojjs15UzXAuuHndZNzOR1xL
dJSZvlK1T2GFmmtHmzjJJUtng+A9GDFJD8J6UeKOdpy6eLlmvtRT6hCueljrJGOb
aKdGNRnFBoDZ/DqBArUILTkTgCdqHY66gacajY7p42DHGr7RxovPr/RNjzblE4Ae
7uA1CEY9Hqs3Xu7P5Aty3UhFh0cubPGCtMRnW9Y9hvyv6XSWIVnzAUwMiPJGBNLg
pn3D9WeK970Ef/QEvkRCWNW4mpM1dfiHmIjbjcFRwn1NvuTI4A1MukWzS3/Qbs9u
SrLIquFBkk+AtGNF5pPW/RmKOFTq+6eDaMEArLVuN6G6MNrS2xCE2mN2hb1arBAH
rV/7Sc+H/FfEWjXtRSnf0JwZmSKB/rObzOyPTAzERwKDNTVU1XDuCWSjlAv9A8e/
7TLFcFueYmMZO48jvdw1NL4u+v2kf0rWWzcyNBVeukTSHrlNvT+jI50fJ9omb0Bp
RqM5CktLjENleIelSb25TSFRjMB27w703QJdRb7Njr/iDw65wrasz+q8dqGCJLJQ
AFqb5peekfnhyQcHiYqd9cU+FYXnk+UJNUv3uh1T+JWZM+ec8NbDJe7v1JpTtWIY
2Yw4rtrkVHfL/mqnKkFzPLziFy72mrh7IQ1bHHx9CyTibg9B0dU=
=TqZK
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--
