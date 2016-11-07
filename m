From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 2/6] clk: tegra: add TEGRA30_CLK_NOR to init table
Date: Mon, 7 Nov 2016 12:28:09 +0100
Message-ID: <20161107112809.GB28616@ulmo.ba.sec>
References: <1478507405-13204-1-git-send-email-mirza.krak@gmail.com>
 <1478507405-13204-3-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478507405-13204-3-git-send-email-mirza.krak@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mirza Krak <mirza.krak@gmail.com>
Cc: swarren@wwwdotorg.org, jonathanh@nvidia.com, gnurou@gmail.com, linux@armlinux.org.uk, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 09:30:01AM +0100, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
>=20
> Add TEGRA30_CLK_NOR to init table and set default rate to 127 MHz which
> is max rate.
>=20
> The maximum rate value of 127 MHz is pulled from the downstream L4T
> kernel.
>=20
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>=20
> Changes in v2:
> - no changes
>=20
> Changes in v3:
> - Added comment in commit message where I got the maximum rates from.
>=20
> Changes in V4:
> - no changes
>=20
>  drivers/clk/tegra/clk-tegra30.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIGVJAAoJEN0jrNd/PrOh/doP/2JWIvBlg+DoY2mutjYlqTws
unnwrXkRQAHqoV7wgivdqyTNJxTjkBO7yXOamG1ASGzgZOYUmtoXTe7JRU5GAgzG
61kVpmHjAj8QwfuptuLA/+uDq06ztI7we+5csDOk8HbsD3hjQqTekEGA1U2cYu7s
K2ddJX3WyjpNbzRe2pqU99P1DqoZGYI6qAU88hZ9PSkIMltpseoDKQmr8UnwCclj
CyvsXmQfS3hnC/TVSKw5Sba6Bihhh6DxqxMWQiolRRlu5ZnvmX9uFhQr3bggo/+Z
K2i6mksPnmyOUbByeuNCj+/MUNo356aNc4Gzxr9WYH1/ep8ofLlNInaWVe8/qxJS
cbY8aNDtzQb9g5suwZAboA5C/hTg+xzjrjAtrdHlrYruZz3IylnMTyaXTcta9Rj4
ZitT/W25MaCs2hANh2pqlceP/1BBECmFsY8k8mtqMBg/whG6c9aV/IM/hRGqH1as
CZQjUVgQXCXZLzMlTml3BV1qn5qOHSIUZ6pDsTmotOjKTOo5nysLTjZbVkzdoQqG
1sSkLEoBfXNibwZR/uP0utv1GbN6RLneBxGEVWVGFlw8mA8GqL8S29Zx8yyiCTCd
Q96AHYAXUxJDr+TBgraDpKghO8ybHYgqoo3IyahItmoTyK2XNeV6l0I7Q4pV8ww+
x4bm7Qm0WVUWGs4HELAi
=27av
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
