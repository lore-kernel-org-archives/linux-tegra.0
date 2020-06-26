From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 4/4] media: staging: tegra-vde: Power-cycle hardware
 on probe
Date: Fri, 26 Jun 2020 09:48:18 +0200
Message-ID: <20200626074818.GD3109062@ulmo>
References: <20200624150847.22672-1-digetx@gmail.com>
 <20200624150847.22672-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200624150847.22672-5-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 06:08:47PM +0300, Dmitry Osipenko wrote:
> VDE partition is left turned ON after bootloader on most devices, hence
> let's ensure that it's turned OFF in order to lower power leakage while
> hardware is idling by turning it ON and OFF during of the driver's probe.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/medi=
a/tegra-vde/vde.c
> index b64e35b86fb4..3be96c36bf43 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -1068,6 +1068,14 @@ static int tegra_vde_probe(struct platform_device =
*pdev)
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_set_autosuspend_delay(dev, 300);
> =20
> +	/*
> +	 * VDE partition may be left ON after bootloader, hence let's
> +	 * power-cycle it in order to put hardware into a predictable lower
> +	 * power state.
> +	 */
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_put(dev);
> +
>  	return 0;
> =20
>  err_deinit_iommu:

Shouldn't this happen automatically? My understanding is that power
domains are turned on automatically before ->probe() and then unless a
runtime PM reference is taken during ->probe() it will get turned off
again after ->probe()?

Is that not happening? Is auto-suspend perhaps getting in the way
somehow?

Thierry

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl71qEIACgkQ3SOs138+
s6F2BRAAqITs8YO7f90qNTucc+6aVUaPhcOoeLRSA384Hh4M4RfzKwKV1ivLrL4H
VkMWU+BB4N5ABiJxNbLnwuvh6O7y9vg1l7ovi/lg4qHTj96GmdZAuXpEFsqG2VWY
WMUX60Wc3x6vqhJPVnroCRj++WmA74nlzieWnzrR36wF91p7lpisLNjlGY90VrOq
nSatzzNO2Na9BEQnVzGqxYU7OThPB/MHJOviY5X21SXWCluc40tb0Qz4d8pbDUqB
aXQ0uMNrf8kgX0YyARa+R+U8op8R9oRTkgRCf1SHwifbb2dlnjIw2sw27ORyfzr8
h87kcTOlkTZhxehUG7eIHpyIUmgCWpXtBwt+Blww0o28LxW0+yEQHymenMlUNtY6
18mSdMQGO2k6dwgWa2znsETezLrv1lYX2nT6FxZ6niTzYZRPiA2WJ4YTa79h5yDJ
KtbvBz9b2kKzMl6R5084U2P8fh7tZH2oTs3W6n3f/NnA5+eGIBeCKu1wLQrh1M9u
2bTTPOrJOhAQMZiJCq6CJ4Bmr5+X7Cmp5bTkNOiY9lBweTpWcJHAWqgybEHCajEf
0dTnrWm4BVwGmfYUDNsm8rffkO/avUUvYBC21kZr2ATYWkrYQyheooiYC5qNLJFL
lJClO+wrkJuTqWiyB0BdOJ90jHnFMolBZOjTN/Ot7BkPCgWo8uE=
=0TFC
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
