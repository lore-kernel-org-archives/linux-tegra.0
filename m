From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra210: Fix default rates for HDA clocks
Date: Wed, 29 May 2019 15:46:25 +0200
Message-ID: <20190529134625.GD17223@ulmo>
References: <1559121501-8566-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559121501-8566-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2019 at 10:18:21AM +0100, Jon Hunter wrote:
> Currently the default clock rates for the HDA and HDA2CODEC_2X clocks
> are both 19.2MHz. However, the default rates for these clocks should
> actually be 51MHz and 48MHz, respectively. Correct the default clock
> rates for these clocks by specifying them in the clock init table for
> Tegra210.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 2 ++
>  1 file changed, 2 insertions(+)

Does this fix anything? Should this be backported to stable releases?

Acked-by: Thierry Reding <treding@nvidia.com>

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzujTEACgkQ3SOs138+
s6Gtwg//ahUkusGdGV9/e18/FFhmcqOEMi+6PyOAh6dfSA2zRMIRKtCr3ZpgLvlC
WHp272SeeDP46I+NVREKSwQ99uwadiWBCDYc3xYyktl7md091y6GIIF6Dc+1ANMG
7Umm65k4mgbpPcMJtaldiXzgKuQClEM6fPikEduCEIjSIhfeODpA8T6sIsML3OuS
q7IM9U6BE9BIjI8+e3mYk51Zw8bol+OxOfT67Iuj4jrugWTz3P8QlzmHRoslEO57
kYx2chG5eslDbE3biqb4x6vCceQIzQL8uXYIfua9hIvq7Vh1f/IzFloICH/3calk
e4+fLed8Ot3gtQVVSyUsMpexVHX5/glIK+YeWVqSdyYE39U1bhaZSjEfylDpY5qR
Wh9YXpQo/p/myv0PLviK2vvaIv/UKrRKwC+4lzNuQej95K3nkEylRJgbOGruj1Iz
69wA9kLe1bHoukNETyMpEHPozJKsdknqzLKsPuZJMW7oZPM+omwCb5mU9plYlF2h
sMxq2Z1/oUWDptGAYHzrP7XQ3ZJQEAOtYz8f4LwEHcPSyFIqtXsOomFfckVEIBDW
Lh3QifHXjlaFjjmL/h5hI2mapMFiTH5shELGaDmyn634mdFbygk8ZaaYzQXlF72O
XR/5Uc2RviTrsJUztyhMN0qWF3SH/uAklsOgkCvRacgoS13hQEs=
=Udg9
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
