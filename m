From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/8] clk: tegra: Fix duplicate const for parent names
Date: Thu, 9 Apr 2015 12:00:37 +0200
Message-ID: <20150409100036.GK12103@ulmo>
References: <1428499339-29569-1-git-send-email-k.kozlowski@samsung.com>
 <1428499339-29569-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wRokNccIwvMzawGl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1428499339-29569-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Max Filippov <jcmvbkbc@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Barry Song <baohua@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--wRokNccIwvMzawGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2015 at 03:22:15PM +0200, Krzysztof Kozlowski wrote:
> Replace duplicated const keyword for 'emc_parent_clk_names' with proper
> array of const pointers to const strings.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/clk/tegra/clk-emc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This would probably better go in via the Tegra tree since the patch that
contains this has only made it to linux-next.

Stephen, Mike, any objections to me taking this?

Thierry

> diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
> index 615da43a508d..637798c3cc59 100644
> --- a/drivers/clk/tegra/clk-emc.c
> +++ b/drivers/clk/tegra/clk-emc.c
> @@ -45,7 +45,7 @@
>  #define CLK_SOURCE_EMC_EMC_2X_CLK_SRC(x) (((x) & CLK_SOURCE_EMC_EMC_2X_C=
LK_SRC_MASK) << \
>  					  CLK_SOURCE_EMC_EMC_2X_CLK_SRC_SHIFT)
> =20
> -static const char const *emc_parent_clk_names[] =3D {
> +static const char * const emc_parent_clk_names[] =3D {
>  	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud",
>  	"pll_c2", "pll_c3", "pll_c_ud"
>  };
> --=20
> 1.9.1
>=20

--wRokNccIwvMzawGl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVJk3EAAoJEN0jrNd/PrOhoJIP/RiAAnEq+9OQJRsWFdpaXD5C
l6oF0JWSRtz/0GR1GY9j9XIc3ltRL8ne7pAUxLJlTREApPvY1SIef3yKUnpu2V/G
FD3GnEZjLEcNADA6A2iLUBWHEY4SBCyxFRkUOnS3k6tQWRI4GcBLt9OYdBzDLNnF
NnGTjDmgwa5eHSHA4EDHgWTPoww7txwr1PHsbS5krcDzK0OPDMPDpohUICVBV6hu
86DheNOFaNQWwsLrHrw/1ZbsGzU5VFshkI0hzHnPVSaKE9Un4Pn2MQmaTsJroeff
7ytCTMVZFSQqyXNnpTur9ytSjE6RAa5StWxCHcff/caxa4hbPhgKJoyz7DStVw3g
JZT7PS/HZ82hdVzOvb46MfLUoPYFpFkKGtEBMpKro1kKrGo9SKWE52nC2WisApiu
bIdBHKHKSr7HGtZY43XSbu8kSoMoqJb1xVUdK7Wj2CPmi311hSZ9VnMOYkgAMnsz
hAIDmUSBg9J0o2CTwPYy9dViR6D7HErdIcZcT4bKil20KIQD/OMDHcCrSp2ymZlu
O03+im2s82R6616WySOhqjWpqJeZa3xBHTUctyBLcTe3ROaWzWCugPJXntg/vk1+
JUuAEzXzkpOMUhXA94pjyMl1H3OqL0QOOcK7z3FeyLNTg5kZ+0BnJ0wFpyD1YPdq
n1Z1olBcxmirYFgXGAnJ
=qJFi
-----END PGP SIGNATURE-----

--wRokNccIwvMzawGl--
