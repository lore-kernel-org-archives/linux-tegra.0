From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: nyan: Mark all USB ports as host
Date: Mon, 7 Nov 2016 14:28:54 +0100
Message-ID: <20161107132854.GF12559@ulmo.ba.sec>
References: <20160918102852.6593-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160918102852.6593-1-contact@paulk.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <contact@paulk.fr>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 12:28:52PM +0200, Paul Kocialkowski wrote:
> Nyan boards only have host USB ports (2 external, 1 internal), there is
> no OTG-enabled connector.
>=20
> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> ---
>  arch/arm/boot/dts/tegra124-nyan.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Where is this information coming from? I don't have one of the Nyans
myself, but one of the Tegra132 devices I have, which I think was
derived from one of the Nyans uses one of the external host ports as
forced recovery port, for which it would need OTG.

I suspect that the way to get U-Boot onto the Nyans is via tegrarcm?
In that case I think one of the ports must be OTG.

Thierry

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIIGWAAoJEN0jrNd/PrOhP2sQAI3VoZBocPUHZfvOs60T1MbP
aVilqurAEvEU80VHkSkjMXdEoANnNkH6ZUd6L4aTGbIGO3z+o9Y12UYrfkjlgult
DiXvWiY4XbiLNpnqAUDyl763zIZkDrq1LXSgioJrUbIBLW0PhtWUp64B0FgmgGrU
bxRTrjuayyCSLI5JEzE7YBCfTenFiM/wMuHbRgbHoOAIS99lqW3w8OSD/o7SVlA8
Xg/wZAIxkSYSnAl8JshCbLc2wnraqMhlBa3H+TYtTePog2FV05UBZKbP+xasDFB0
dLiRG+GIUiYLphPzQu8QDxe6O5vCRPDsElpq0w6T9sL/OGep2cjxAvPvOHLFaLO9
RHH58QOwzDUW+FQtyB0v/8fBOaL+6HOGk98YPsm628MK71UhrykRhks8Qj3JB5aH
lg347UU0zcC+KhIrdnAQkfl+jdAKcZEXRQTyvm7vEzfgHmf3TbZYxcYSmXv+fLjR
LRVCtWz3xW/mWsd/eGx0WV9kghUfaKjK+96mXaXx6dWx3LNsud5Xe9T64mI0dT3H
RpCbOWREN/itlVtQ8fWotJIDyeEhjI4twlE9V+9bJ7qfCL5CnrQhS6kaoxghavMT
LsFi7Rw6EGVbUDRy675RQ8jxwL5yVhzLkotpU7w9p65MeZ9X6JNAtKKX4BTt9Maq
0NbTTs6bUasTbA9kzEBE
=UwW1
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--
