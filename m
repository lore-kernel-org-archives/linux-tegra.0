From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] memory: tegra: Drop <linux/clk-provider.h>
Date: Thu, 7 May 2020 22:04:10 +0200
Message-ID: <20200507200410.GB2981633@ulmo>
References: <20200506123236.7463-1-geert+renesas@glider.be>
 <20200506123236.7463-3-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200506123236.7463-3-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 02:32:36PM +0200, Geert Uytterhoeven wrote:
> The Tegra EMC scaling support code is not a clock provider, but merely a
> clock consumer, and thus does not need to include
> <linux/clk-provider.h>.
>=20
> Fixes: ec37a9a17afbfad5 ("memory: tegra: Add EMC scaling support code for=
 Tegra210")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/memory/tegra/tegra210-emc-core.c | 1 -
>  drivers/memory/tegra/tegra210-emc.h      | 1 -
>  2 files changed, 2 deletions(-)

Applied to for-5.8/memory, thanks.

Thierry

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl60aboACgkQ3SOs138+
s6EsCQ//fUz2NWTm2ukVFtdianU99A5+5SJwxhJ5j6U6gmB7SXmm7bFY0YT2odot
J0M3Ppj4BKbdO3EZL4bRxKngsHc4TSLTrt2QkyfGu/N2XEHymo2kPDM7P+QSCqxk
LT0w2P4b41h2UF/cuIwx41E6vZcZyCyJpSQyjFI6TwjT2u1BIo6HS6xqld/W/8Dg
MqYgaMxl1HfPCyRI2PmP9gEvMK5dEwFqTUW0hZSAslxi0jA0cJGkpUGbeNcRMTHo
ha/hK4ZzZjb6M7Y7k+Ln8LN7Wr/kFiei5PiY3jRuJhsV2BASXtF5WTbF9xlSlS9D
ROBzxvCpEceNMDyW4EX2wZlvCBekAS5kUKt34zAulEzJq9cGMGUNDK9VbUagUo5f
/5+3nOV1hg7gRedrQH3Gt0wCKqc8CEGsMlz+cAKo8tUc02/Pf9GEvoLHcdsSDZCV
ziT30qXgvVTK2ZYOyqJM04Mt1LJFIDOXBnyrc/vqAn5QItKPMqO1gomV+e5R+fz+
zevHSX8sFSU4z0z6bh43Y5cC+W6F2RijRZ90eVPRjLkxtxS6zAUpnMjl+NH988ZJ
vY3CpjLxMvHFKN6YxGBSHz7/Gvn76YPuyCc5HjBKX7Em5K6/sBqAIc6N/mbliNyw
Q3M3wBrn0bWntsWR+v2VBAxovOjvLJHnaz0+ULNP95w9FXr1SHM=
=jrqz
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
