From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Remove redundant of_dma_configure() call
Date: Wed, 26 Sep 2018 16:10:54 +0200
Message-ID: <20180926141054.GA12980@ulmo>
References: <ce9767cab33346772f76735933dd7896e346b477.1536770777.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1372088688=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ce9767cab33346772f76735933dd7896e346b477.1536770777.git.robin.murphy@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1372088688==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2018 at 05:47:54PM +0100, Robin Murphy wrote:
> Now that the Host1x bus_type implements a .dma_configure callback,
> subdevices should automatically get configured for DMA as their drivers
> bind, so there's no need to also force it at device creation time.
>=20
> CC: Thierry Reding <thierry.reding@gmail.com>
> CC: Mikko Perttunen <cyndis@kapsi.fi>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>=20
> I *believe* my reasoning is correct here, but please shout if it's not.
>=20
>  drivers/gpu/host1x/bus.c | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

Thierry

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurk2wACgkQ3SOs138+
s6GS5A//cBcQ80aet9/QnnQpJ0v3fSzz9GmmGXUuG/2I19AxpNGrcG+x6Rwu0CRg
SoMIYzuyUexM+jrYmfVqoO6E/+UvxcsBE4qHao8fYMAmpX6Gt5b63y2/Vam6B/mW
jZ8Sr0wYbWtALp/2hEVdEUkSnSJC0SKlaXAPg7xuKYZ0ldu040gjTQfzvS4UxA0l
tJLdRSL2FWwwzw0pMvst/9bhVGPXfAZTNOQmlkIjLZ5L7jrRC4Sz7tuNHj6wOMaE
esF9aXyHsdRnj+YkkRIgnwy5dW5R5dW9MvT8v9EWwK3ev8F7c2a3UzpLCXxE64J6
W3O13bLI7crC8VmEId+Mcr86JlIBFOkRTQ+YRYHToAmUlFCIGZyWD7mSAPRbuM8O
1pVUQOfsp8Oxu8KuSoAXJfWn/aALG8OSL/6ym+8Rj9mCbdaq5S7lpyzY3XDVsw+k
IKP5gbXI+bl+yiPKWmcuyFHdFhtln9nVMQz6D6tu8hg681KJwkDiuyLhAX/0EnIs
rltg6yrRPqcOp6px1fiD1mwujtCli4MSrbPEAGPSDIrFmxwLp3P9DOjC6kPo1+DA
lX3AFWZYX/JpTcup6BhVMTxNii+HQEku0nSKzpq7Ss5BHNlLejdKdZj5k04TiJX1
tnQo4ZxqU+47nBzCr8rGiEhb1hBrBl5JHRz2181/kfquHfQhhyo=
=RzAu
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

--===============1372088688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1372088688==--
