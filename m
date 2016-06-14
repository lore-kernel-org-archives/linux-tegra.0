From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Tue, 14 Jun 2016 13:33:01 +0200
Message-ID: <20160614113301.GB30021@ulmo.ba.sec>
References: <1464280891-23036-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464280891-23036-1-git-send-email-rklein@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
List-Id: linux-tegra@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2016 at 12:41:31PM -0400, Rhyland Klein wrote:
> From: Andrew Bresticker <abrestic@chromium.org>
>=20
> Move the UTMIPLL initialization code form clk-tegra<chip>.c files into
> clk-pll.c. UTMIPLL was being configured and set in HW control right
> after registration. However, when the clock init_table is processed and
> child clks of PLLU are enabled, it will call in and enable PLLU as
> well, and initiate SW enabling sequence even though PLLU is already in
> HW control. This leads to getting UTMIPLL stuck with a SEQ_BUSY status.
>=20
> Doing the initialization once during pllu_enable means we configure it
> properly into HW control.
>=20
> A side effect of the commonization/localization of the UTMIPLL init
> code, is that it corrects some errors that were present for earlier
> generations. For instance, in clk-tegra124.c, it used to have:
>=20
> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
>=20
> when the correct shift to use is present in the new version:
>=20
> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
>=20
> which matches the Tegra124 TRM register definition.
>=20
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>=20
> [rklein: Merged in some later fixes for potential deadlocks]
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
> v5:
>  - Initialized flags to 0 to avoid harmless spinlock warnings
>=20
> v4:
>  - Re-added examples in patch description
>=20
> v3:
>  - Flushed out description to describe this patch.
>=20
>  drivers/clk/tegra/clk-pll.c      | 484 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk-tegra114.c | 155 +------------
>  drivers/clk/tegra/clk-tegra124.c | 156 +------------
>  drivers/clk/tegra/clk-tegra210.c | 182 +--------------
>  drivers/clk/tegra/clk-tegra30.c  | 113 +--------
>  drivers/clk/tegra/clk.h          |  17 ++
>  6 files changed, 510 insertions(+), 597 deletions(-)

Applied, thanks.

Thierry

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXX+ttAAoJEN0jrNd/PrOhNDEP/AwhUcJRLncW3fNxoYOYwdt/
Ogfam6N+jS1+5pndvIYDZb8WbgFAQsLg3d7XZOb02KglrXQUaycMCV08F6kIB362
Wp3YMaLwBMqKt9NDEAFtYr1W/vVfUUUS1PJgLXDbcZj6gzfFl/acN8oCpPpGYSU2
J/Fjaka//i8zn4eRGj6Gvh8OZzqb10wgoevj6elWVqoHhMJ2fK8VLa/yvjbcGG6L
WcHgQf15rNUAH/2k5pXKn0nCgD9dL4sqYdJcK5EuWst6SvPwb2kjU+FgwaLY5CB3
RkM/ykMWAmfE+6/WeKySCi1+mcB1BNPBEtRuZ9dMyLQCLSbaATtN3hUTL+kAwejp
pV7A4N0ZjqIDfKubqcoNCqqmN6DNrcah6sfK9x6Y2kXxXG98r6B5V6fn/4cOrN+p
0wZDlrsdyQa1nuCNM3iepFxvlUUr1vqGegeuROttdMbApj/UlGXXm7ulqvzhXJS0
Ocrho/CT16XP3v4gd0c21hJMS4vRedi+iJ53+7MtaOCKp1xn17Sz3ZjOEEEaQ3w0
9W15pqSBOchCF1QM/IAoQgoGnUCGGZDMNB38pCZCvkRI12Gd21kjNsPx7ILFCOts
9weikvyiSc84j6bz2RNDzDXER3Gju7U6DzZJGh2tITumTVWx0anMkMH8NDFu3YUH
+x8CkfemBvGjjWQMTzHf
=po9c
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
