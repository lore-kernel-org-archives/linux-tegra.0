From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: dfll: Fix drvdata overwriting issue
Date: Thu, 19 Oct 2017 10:23:10 +0200
Message-ID: <20171019082310.GC4459@ulmo>
References: <1507849799-4256-1-git-send-email-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507849799-4256-1-git-send-email-nicoleotsuka@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: pdeschrijver@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, jonathanh@nvidia.com, sboyd@codeaurora.org, mturquette@baylibre.com, pgaikwad@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 04:09:59PM -0700, Nicolin Chen wrote:
> Both tegra124-dfll and clk-dfll are using platform_set_drvdata
> to set drvdata of the exact same pdev while they use different
> pointers for the drvdata. Once the drvdata has been overwritten
> by tegra124-dfll, clk-dfll will never get its td pointer as it
> expects.
>=20
> Since tegra124-dfll merely needs its soc pointer in its remove
> function, this patch fixes the bug by removing the overwriting
> in the tegra124-dfll file and letting the tegra_dfll_unregister
> return an soc pointer for it.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>=20
> As I don't have a T124 platform, I can't verify it on a board.
> If someone could provide a Tested-by, it would be very helpful.
> The test could be a simple system suspend/resume that activates
> runtime_suspend/resume() where a platform_get_drvdata() would
> be called. -- Nicolin
>=20
>  drivers/clk/tegra/clk-dfll.c               | 10 +++++-----
>  drivers/clk/tegra/clk-dfll.h               |  2 +-
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 12 +++++-------
>  3 files changed, 11 insertions(+), 13 deletions(-)

Applied, thanks.

Thierry

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnoYO4ACgkQ3SOs138+
s6GazA/+OmV373+YFeBixNv1qvdheW2czQVb52IwKoiBLLPaa5qgD2udrabKfWTi
391b94iDR+coqjGURAsRCKPIJdhrYORdrqYvE7VNi8b1BXrrTWNsR0oQr5F3T0Su
U3uCc51EmMmpARvEkR3/33FLIIdBTkSOHHF/71bWd2c5v9NL+Uni2RFAPeqLPJq0
Bq5QjpE2B/SCKB/wdZ9Uaf5VjCIW+ViRodrzW6V3HMGUbiR2rsnwcCi169U0/706
WwVwqshEAu7blP4sLbd/1Fxk34yh22luObv0IFlUI5H47Gog8HXLCarwtUaUAxzg
MPfV1BxA50G0XdazmJp/BFj99hchqU7cqadHm4rGZ7lO+ZueahuQdHDZ1eBki92H
sxaJn99Nmi81yfYRO7JeOmLeNRjA1KcfnPrBos+gGEDxuihg6M0sdg0oKJp3hOFr
AoduSABWmC5xQTvM/jhFGoA3+1mKjAMueFTWSmp0flRKYZUfkV78WrY80cjzGP5K
Jwsda/0YFPFQgaNsoR25EiweUX67a/nUktDma2JwepPLUbh/nHNxF5/t/EIchE1t
Pwewf95tZJxlYZz1nZRrThgi10ANzJX+HZMoyv61EURSBWGMtdde/XtKbs0kWoRq
HKAhfROz9w8/yVNlaxho+6iM1Vr9cDGsR3Qa5d4ctm1ZtiAJjJc=
=yQYP
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--
