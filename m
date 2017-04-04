From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Propagate clk_out_x rate to parent
Date: Tue, 4 Apr 2017 16:02:37 +0200
Message-ID: <20170404140237.GJ843@ulmo.ba.sec>
References: <1490189899-19401-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LG0Ll82vYr46+VA1"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490189899-19401-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Frid <afrid@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--LG0Ll82vYr46+VA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2017 at 03:38:19PM +0200, Peter De Schrijver wrote:
> From: Alex Frid <afrid@nvidia.com>
>=20
> Given that externx can only be used as a parent for clk_out_x, it makes
> sense to propagate requests to make clk_out_x easier to handle.
>=20
> Signed-off-by: Alex Frid <afrid@nvidia.com>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-pmc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to for-4.12/clk, thanks.

Thierry

--LG0Ll82vYr46+VA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjp30ACgkQ3SOs138+
s6FBPw//UO6MIeqZlfrw7RsRHg3Tlhnw16p0VjCtHHHilXvnt/gScqIHVWZKArqQ
MsQxeBt3o5CDdpvKfH5Nc4XX4/WfrdMuYJja7r18c5JKZWQZ5A819AUP74gfExlB
CQAwYKCpvR3rjs9X8CBysi/2ZLPnlj7aiA34sOae+T+N0Z9DgZdBJPSLBJgdSy7O
uF6q8GzyHQDok5vTnbEjSITYAJkLhmea3fkfIzNGPl6BJanD0Eueiy3kCUWa+YW8
Lbqhat/JrCq5t4Je1TO0uSnRkYsNtkz5AiB1vV9Db0ZcmBv/n9GBTFhXEaJHcHF4
PNkTvMJ2bctS0Bar3Yne0GO931EnmD3xRRD63imiMlibU1DmII1BBsSRlSjEj/EM
drZmLqNbG1TRqmrP2tWWe053BgdC3KEh2kAea7RS+tNGrtdTyiV+q2FDE+tM1T0Y
ft1TA7y2MkWzZpI6E1g64y0spueyErCiEMPBaLgaL46TS8I6ugb0C6az9u/qdCTo
LGos3f0FV+EzUFSd2PV73ePJvd9O8koOIgLxFHjI59Eydz+vwZ/xe1IPWB6egZMt
n1vg7TjqfnWYJHZ/EgvbLsV2Fn0rOkTGmk9bvKiWsvq60uFQ+8lJGiC2nujrmIqM
PF2xwuoJIAlcPTIWtxScZI4DZ7eqCoRkc9xap/wEVrLbs90vBJY=
=9vKM
-----END PGP SIGNATURE-----

--LG0Ll82vYr46+VA1--
