From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 15/16] PM / devfreq: tegra: Rename tegra-devfreq.c to
 tegra30-devfreq.c
Date: Tue, 4 Jun 2019 13:23:23 +0200
Message-ID: <20190604112323.GO16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-16-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ctUzwJm0i+kwMBIK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-16-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ctUzwJm0i+kwMBIK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:14AM +0300, Dmitry Osipenko wrote:
> In order to reflect that driver serves NVIDIA Tegra30 and later SoC
> generations, let's rename the driver's source file to "tegra30-devfreq.c".
> This will make driver files to look more consistent after addition of a
> driver for Tegra20.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/Makefile                               | 2 +-
>  drivers/devfreq/{tegra-devfreq.c =3D> tegra30-devfreq.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/devfreq/{tegra-devfreq.c =3D> tegra30-devfreq.c} (100%)
>=20
> diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
> index 32b8d4d3f12c..47e5aeeebfd1 100644
> --- a/drivers/devfreq/Makefile
> +++ b/drivers/devfreq/Makefile
> @@ -10,7 +10,7 @@ obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+=3D governor_passive=
=2Eo
>  # DEVFREQ Drivers
>  obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ)	+=3D exynos-bus.o
>  obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+=3D rk3399_dmc.o
> -obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+=3D tegra-devfreq.o
> +obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+=3D tegra30-devfreq.o

Technically this changes the name of the driver. Sometimes boot or other
scripts rely on those names. Perhaps a better way of keeping backwards-
compatibility would be to do:

	obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+=3D tegra-devfreq.o
	tegra-devfreq-y				+=3D tegra30-devfreq.o

That way you can later on just add the tegra20-devfreq.o to that driver
as well and have them both ship in one .ko.

Thierry
> =20
>  # DEVFREQ Event Drivers
>  obj-$(CONFIG_PM_DEVFREQ_EVENT)		+=3D event/
> diff --git a/drivers/devfreq/tegra-devfreq.c b/drivers/devfreq/tegra30-de=
vfreq.c
> similarity index 100%
> rename from drivers/devfreq/tegra-devfreq.c
> rename to drivers/devfreq/tegra30-devfreq.c
> --=20
> 2.21.0
>=20

--ctUzwJm0i+kwMBIK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2VKsACgkQ3SOs138+
s6Es9A/9Gi8I2G20qIVMJQ9sSA/3ZNS2aM3O4x2G2qQQFvuY81Q1MrPZ4OcGxElj
3I453R13AX/9UUzhKx4AxhjG+C22ZorezLuYM7AEZ6zDQB9vdJydreXBjOc+bpCP
mcUnFTFKzKJxCmyLxRtvGyh4RYwvRLmXHhbt7vOdlXv2wIGr+QanMCCTmEb4IIZF
ORe+lcro244KgDezZKj2L2ejTTVY3BVa2H5afLwxjnNr/mmv7sl2TVA97lOlrKjV
DFXET0ygtakT3UusMXM1dlGMaoG/Kf4iFaKwrNeA2nd4vli01P5ljiNVNZVK01mz
30BrBRZWywxaVwb4K1WJkkErFjjn+vTkIxzj0sVpTEW3Kp3pSjxqBrPULkLFCtxw
ldbvjbNBfVYy00rKffQqpZf+qajSM25n+jePFRWHBcn+VYtkRobpx1xv8jGehQco
I/woAOT7pqmf7bil2dbppIYXLWdFNpIZblLXPsfvDoCsqa0XlUqU91uoi/D7KAF+
ZsK3ypaajkXtaauOD+i4faDsSZ5m6fPBpQ6NAWriDGLHhyS69UNGEBPZxwuIGIa/
5xWn1tSS3jXlWYP4IrMUA+HGw7btVGden1mAZ24rmHT7PeL6qwId5wUjcXGo4kW1
JAQytoZkhY9UOEhkxJFjz8Khy88potwE9rPDs9fvS4T6jVoL4rY=
=bEO/
-----END PGP SIGNATURE-----

--ctUzwJm0i+kwMBIK--
