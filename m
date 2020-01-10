From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 0/2] enable Tegra194 fuse
Date: Fri, 10 Jan 2020 12:08:09 +0100
Message-ID: <20200110110809.GA2233355@ulmo>
References: <20200103083018.10575-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200103083018.10575-1-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2020 at 04:30:16PM +0800, JC Kuo wrote:
> This patch series enables Tegra194 fuse registers access.
>=20
> JC Kuo (2):
>   soc/tegra: fuse: Add Tegra194 support
>   arm64: tegra: Add fuse/apbmisc node on Tegra194
>=20
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 13 +++++++++++
>  drivers/soc/tegra/fuse/fuse-tegra.c      |  3 +++
>  drivers/soc/tegra/fuse/fuse-tegra30.c    | 29 ++++++++++++++++++++++++
>  drivers/soc/tegra/fuse/fuse.h            |  4 ++++
>  drivers/soc/tegra/fuse/tegra-apbmisc.c   |  1 +
>  5 files changed, 50 insertions(+)

Applied, thanks.

Thierry

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YWxYACgkQ3SOs138+
s6EK4BAAtbeDyCnCYBEbKXjx+1prKfhmQ0MbAc7Qr0b2XeX4daJwGCg1rD/lnQhY
dEXWoUm5EwUBaaxzZYAFif9PD1Ks0BE6M6jaBt9PhUIPZnfIsKjDfZJKNrXzTTbA
hCUPJ9LwJdO0tdf99C+GIa9yZRu2ZeJy0qKMHydUwcy4MO2VxIO0+IQelyqB6TOb
o2zzN51jk5Y8smwxBtDTOVIavrsm7k9sUPz+7XryYzqQyeaUPG5rGtoQhpH66isv
U3imJKXmY9O4IV6Z7/3/6jrSHQi2s2+a1OTk87Lv5NHN3WpM20zxDpP4LrZL/nwd
qzQHhabI7ot27cNOpu7YYoAlyrs6Eh3srJMef07qQZ2XiZ2Kkgh18aaFHx7mVJsM
KLM9SQinV4WRS+72hbwOdrYpTC8haumldfPLua09pzfL3rBC3nBFp7B5sQ8rTtmK
3Qrxtvyhv3AOqD4b0qkx3WZaiwtS3sB1RP1yq5iEO8YiNehQh7QV74P/TCz7ZL8K
NcjrQwjnozbACeaPxFRQLl+eYrq3FqoZnwKqB3qLWz1g/VfS6MOLQiUQ2ewdSRrh
7SWs7oRN8o5JotMyEGWlSSa2dr66hZURkqXOEx6tQGS0bQw8NidFJ4E35CaonZbA
IagR/rzfChZLzwP87bbAGCEVYXzI1d+XpiX1tJOcwxyp0SlXcxM=
=HJXW
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
