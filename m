From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] clk: tegra30: init PLL_C to sane rate
Date: Fri, 22 Apr 2016 13:52:56 +0200
Message-ID: <20160422115256.GE9047@ulmo.ba.sec>
References: <1456778767-18413-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456778767-18413-1-git-send-email-dev@lynxeye.de>
Sender: linux-clk-owner@vger.kernel.org
To: Lucas Stach <dev@lynxeye.de>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 09:46:06PM +0100, Lucas Stach wrote:
> If the bootloader does not touch PLL_C it will stay in its reset
> state, failing to lock when enabled. This leads to consumers of
> this clock to fail probing. Fix this by always programming the
> PLL with a sane rate, which allows it to lock, at startup.
>=20
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXGhCYAAoJEN0jrNd/PrOhk/sP/in6/uiEWphltc/ty8OlxU5d
NAg6O5vrUjupB8nyoucizdcC7WAtBT0D+m3PXY40w3WM4n4gM41GyhkYWQ29sigM
3YmIevGXu0n46WiEJNYC5b5fKIW2TvkNy1KCgithrsxtAu9DOR7UW7NEJK5+yImI
z8gN1VkMicd0SHYC2Cc+DwJekK0uEe6Ytco2L8Pw8Ia+7s+HwvFN667KZsFscHkP
fvxOJW0b61EcHnyJsD7pKz2g978H5SNzpw0zmXQZNppcSrzNHk9XwBYBuXTidfSM
Bm/aAMmiOpvoLzyPjpgmk7Gzd7SbSVgIwN62z2AB6/MKkZvLPmgubwyJeeVkxL0B
EeBWB6hV9iwMSl95DwiGPGx8shxDPl0FquQlHFUaoViZUKsM8yEZwUSoQ6lxFdtN
BP1DdMcJYJqg8icp5iXH7rFxqjUz0GCnBzQ/pFvKWSISEme4ixVsMyUFXkYVtkRe
7RAubsVV0+o6n3TAS1Xsbmhqpox+HFiWsJXZMn8o7Bl/5gz8PcWmNrdKyOObO6d3
holO+JJ00Cj1nxSgE88DQoyJimtE7b6ux7wJm9JpBj9zokkG2tXgRSweYdrAp4tp
cKpJPBZtm4xoKUkvKvaeLCY+23o58pEwhCQIYn7etUK3p1Mw9NcwyHdOuhSSBXgh
YP6PhXchw0ZBS0ndnZ8v
=zb+A
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--
