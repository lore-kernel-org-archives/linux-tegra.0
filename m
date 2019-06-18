From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 06/17] clk: tegra: pll: save and restore pll context
Date: Tue, 18 Jun 2019 13:45:54 +0200
Message-ID: <20190618114554.GI28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wjoFZxbW4tu+iR6v"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560843991-24123-7-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--wjoFZxbW4tu+iR6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:20AM -0700, Sowjanya Komatineni wrote:
> This patch implements save and restore of pll context.
>=20
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
>=20
> So during suspend entry pll rate is stored and on resume it is
> restored back along with its state.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 115 ++++++++++++++++++++++++++++++++------=
------
>  drivers/clk/tegra/clk.h     |   6 ++-
>  2 files changed, 88 insertions(+), 33 deletions(-)

Nit: s/pll/PLL/ in the commit message, but it's up to Stephen and Mike
how important they consider this to be, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--wjoFZxbW4tu+iR6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0IzvIACgkQ3SOs138+
s6GbwhAAl81K7Fn0u6zVdK0Bb/EEToU7rUYTHyjjoF6pL7asgcFklYoc2+H0zeUr
LQxgQ0QX4OdvjY/JkI7MoSnIMJxOjj8vYNXmavAdgLQWSCDsiNzfjmoFBIA2ZB0W
zXikPpSrpHac3YzW4GwiR5qeFvv5YYA0PmIk9ojBTxb4pSbGIobhdjnAVrskBSp9
5gICaaIOaAo+0YhZWHo2PdyAvOZpgf1KWKMik2RRO9M/LBJxm4v8Q3XC/sm4uko/
95Tl8sFnIoLDZ6ZeOjIxa0YjDQgiVBdDNkPCWPdnzzwm+zIjJPUD7Mpd7si+jRfi
/uNQaBwaL62sgX7pooVeEEIVJIlTcL1nYQNGH0rNzADxfThYGETM+/BTTaJeouJU
iXT0XN9CGcXNlS/+0lShNEvUBmKhksAdOV0r3d+gdk2X++o4bg18oVZ5LeLaxiw9
PKNwQivrb2f7IqPbFDB8vPIaa9JizgXCGw2/NHnuOMU6lW0Ddk3cRx+h6GGW2GnZ
Kp/8GyTKe1eE2o+bnDBlcD5TxuwSk9GIN4T3snFeImmJtHBEA/e2kRMQvtTLoYX9
xXYuNttR+hSoWhxirWHekS7EWpORz1EpxEvgIhztjI5Swz1BEyKHvK7NgEuLlJbE
EnKwcp2Biak3DMMVdZLml8668uzm9i6dvILHYtzgFNw8jJhOKfQ=
=qvUJ
-----END PGP SIGNATURE-----

--wjoFZxbW4tu+iR6v--
