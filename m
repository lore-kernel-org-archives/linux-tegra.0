From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: tegra: Add INA3221 channel info for Jetson TX2
Date: Tue, 18 Jun 2019 12:57:56 +0200
Message-ID: <20190618105756.GC28892@ulmo>
References: <20190617221659.25366-1-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190617221659.25366-1-nicoleotsuka@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 03:16:59PM -0700, Nicolin Chen wrote:
> There are four INA3221 chips on the Jetson TX2 (p3310 + p2771).
> And each INA3221 chip has three input channels to monitor power.
>=20
> So this patch adds these 12 channels to the DT of Jetson TX2, by
> following the DT binding of INA3221 and official documents from
> https://developer.nvidia.com/embedded/downloads
>=20
> tegra186-p3310:
> https://developer.nvidia.com/embedded/dlc/jetson-tx2-series-modules-oem-p=
roduct-design-guide
>=20
> tegra186-p2771-0000:
> http://developer.nvidia.com/embedded/dlc/jetson-tx1-tx2-developer-kit-car=
rier-board-spec-20180618
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  .../boot/dts/nvidia/tegra186-p2771-0000.dts   | 40 +++++++++++++++++++
>  .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 40 +++++++++++++++++++
>  2 files changed, 80 insertions(+)

Applied, thanks.

Thierry

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Iw7QACgkQ3SOs138+
s6EXmQ/9GZLFKQR0NGbOGAN7fcKrt2ibZoOvzKBBoHjDUnPERTfkFJFPZpr1QiI1
s2lG+C4nzxfhh2VMLBjAB/T4S7icF66zo7azRRhOeWZYYt7yfjv61wn48TOEV0vo
BKWR9NF9f4CUc4bAbMwkD9rGc3FLkvrh63rxPzPCqboY0k0tjz/rss3+DoSYaSY3
C6yu4gej37N/Bj9jFx6l0RKIsiLVErLrnHupqzgKsqNjbaZOIwQgJPvVQFxt7QnA
9ckz2JTV2AEYjsD2EG2rUw3Sy/CeyD7OgpLhWaQ0yaw5XQyyVpuZJvGTYrjgxn1b
lAW+MlmxGBxhrYmOzRhh11FAZwTAtObaLdjGk1jaR25hnw5DYk1ESL8mlTaxUTWA
3ISZU9ADj5x7BHF0M5f/YH0FRg8BdBS0BgDGGiMJNcNk+HNrhODhrEY66vLcTjDZ
Tg7TL9sPnAgeRumKc/xnV4sa1CJ3HLR6GdxxUMgD64OzRH0xKEeSBhzadGenCzyp
x6EYsHAETEc0CER1WzDDgsGEsqxHPegpe8e+eI299Qf7yhBzLA4D43eI7GeCRgQo
Z3yMBrxH8GW6co9v2VTHbDiFuBLjPtiwOSvWw4jHr1HpguVA/6S/wzYAD2tgjPk7
9838K6HJj7rOiC0Ojzn6fGi7XS0nnDWIGnjMpaTuXjKWi++mc/g=
=sXFk
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
