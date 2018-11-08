From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 4/4] thermal: tegra: fix coverity defect
Date: Thu, 8 Nov 2018 13:37:09 +0100
Message-ID: <20181108123709.GC1340@ulmo>
References: <1541410354-19090-1-git-send-email-wni@nvidia.com>
 <1541410354-19090-5-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541410354-19090-5-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 05, 2018 at 05:32:34PM +0800, Wei Ni wrote:
> Fix dereference dev before null check.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soc=
therm.c
> index 3042837364e8..96527df91f2a 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -397,7 +397,7 @@ static int throttrip_program(struct device *dev,
>  			     struct soctherm_throt_cfg *stc,
>  			     int trip_temp)
>  {
> -	struct tegra_soctherm *ts =3D dev_get_drvdata(dev);
> +	struct tegra_soctherm *ts;
>  	int temp, cpu_throt, gpu_throt;
>  	unsigned int throt;
>  	u32 r, reg_off;
> @@ -405,6 +405,8 @@ static int throttrip_program(struct device *dev,
>  	if (!sg || !stc || !stc->init)
>  		return -EINVAL;
> =20
> +	ts =3D dev_get_drvdata(dev);

I think coverity is wrong. How is dev ever going to be NULL in this
case? We allocate all of these struct tegra_thermctl_zone structures in
tegra_soctherm_probe() and assign zone->dev =3D &pdev->dev, which can
never be NULL.

And even if it could, the code would've crashed earlier in
tegra_soctherm_probe() already.

Furthermore, I fail to see how your patch would fix the defect. None of
the checks in the conditional above actually check the dev value.

Thierry

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvkLfIACgkQ3SOs138+
s6GV0hAAq3U+lnQjAdadsYm7y99aeMRdd2rrxMz4BCPwYJDjrBc9hLq5ixywaqQc
d/3qlnYUYb+09tM4pvz2yaRxDJBXtcWr40gkfQcHAzge8btVi1bQ2UEpA+bJdSLu
WoudNUrvmvDJ+NdBJMzPzzkbbi1P97+qALAxQiFUevwD+WfTx2kTWat8MKCY9IFL
vEnFtglnc/KThKxwdQDA2O6DP8b5SeXrsAELObmfQSUY4YawhMeCKZx4L4fnmuRI
zHIitWHM72wAxSoPFclc+/LoQrbHCHtbagQRnuFTpT/0bVa6PjJV9vHoIyJ9MYeN
x5q9Bu14NrC5VXaw8tyFuWAVDn7C1UAwVmYd/z0JRypXs+eM1CSoOzsUliMbPnp9
zSiaTfkEtfC8pFYRLQzuZsUfIbQOVItIwuFScEL15N2EGaAjGW+dD8/l96QF9cT+
a0CmMJFwGIgqL+D7u/IGck0Q6zNrBtxS4v+m1AFb7IveXQiWF8+6YUNbmDnIOsGz
6XitdfoHYqThoKF2/5dpOXgxjNAYc5OR4e9FeJORRTHrsGbSi5rQ0khjkmJ25MlO
PhDBESdFQ6dmnmhnaLDP95K5ZEdw/x6xMEwe+WkQGJm9FJMtIiE81ZSFL+SX5RI6
R4jdOAEzYNvx1afArolXIDfKLtixTPv7eBE43zosvh7gx5Jq0Lw=
=8bf/
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
