From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] clk: tegra: Use definition for pll_u override bit
Date: Wed, 13 Jan 2016 18:10:20 +0100
Message-ID: <20160113171020.GQ2588@ulmo>
References: <1450702592-7755-1-git-send-email-jonathanh@nvidia.com>
 <1450702592-7755-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pwWdILMQNxDD/Cps"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450702592-7755-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--pwWdILMQNxDD/Cps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2015 at 12:56:32PM +0000, Jon Hunter wrote:
> The definition, PLLU_BASE_OVERRIDE, for the pll_u OVERRIDE bit is defined
> but not used and when the OVERRIDE bit is cleared in tegra210_pll_init()
> the code directly uses the bit number. Therefore, use the definition,
> PLLU_BASE_OVERRIDE when clearing the OVERRIDE bit.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied with the now redundant comment removed.

Thanks,
Thierry

--pwWdILMQNxDD/Cps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWloT7AAoJEN0jrNd/PrOh9mEP/A3pwCEICN+5oUq69jGkXd12
D4NEJoMCysg6gDpJnrSOeapvsyw1WUJT2hlaW47PxJIa/f36pKvgnrbuJIQSKnKE
/Em59mf8Zlxe4wanIhMGGhea2gohNXKnaSFkkGuRJLltzoe9xRPdg1qh0maPQV5/
XPK9IoIqz5EKwSu2hZgotBmNZ9K5S1/AzD/LhTiO1uv6XLQaCmTjdxiaqYlF21Is
JynUuInQtWd2jFGZBbIbe8jJz1UEyE1hweFFQQahmV6RXMKGJHHUHD0Q+qf8qS84
cPPMw5l6zgIjy2M+OQskMPmI/mKYfFovVak5pedQHwPGuHMkDYSEjTURp5WjLI0L
LNHerSvZnqjzM4M4TILiyZDLvrjkj0oXQd7+U1ym1NkK47NrILWEaJd/8QJxoFcu
Fb5R6RVtvWbXd8QvjYaihpG5l4lUmpeULLCbCtTiHECB/Rf+Lcdhhnx9RFJOfvvX
QN9E00ovUzy+HIRmD+WGfF1sj4y/5xJy7ygidoI7m5W3XyGZNwJXAL53hfDr3feh
oM8dcNxFK9ZQz7Qz7EE5CF7paXx0wwrqa2m3aGniODqpGiVjOKQMxDzaVDmmSRyZ
ZHyxLwu/ixtmQ5KEPFl2aYtqf1UC8PlF5y4Je513/p8+W0TRpz57bN9fxDoklFm/
PAesiS2VC3EH4ne5IXqw
=juXP
-----END PGP SIGNATURE-----

--pwWdILMQNxDD/Cps--
