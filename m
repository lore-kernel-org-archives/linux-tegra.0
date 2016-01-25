From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2 2/9] clk: tegra210: Remove improper flags for
 lock_enable
Date: Mon, 25 Jan 2016 13:34:12 +0100
Message-ID: <20160125123412.GE20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-3-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452799478-14791-3-git-send-email-rklein@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:31PM -0500, Rhyland Klein wrote:
> Most PLL's don't actually have LOCK_ENABLE bits. However, most PLL's
> also had that flag set, which meant that the clk code was trying to
> enable locks, and inadvertantly flipping bits in other fields.
>=20
> For PLLM, ensure the correct register is used for the misc_register.
> PLL_MISC0 contains the EN_LCKDET bit which should be used for enabling
> the lock, and PLLM_MISC1 shouldn't be used at all.
>=20
> Lastly, remove some of the settings which would point to the EN_LCKDET
> bits for some PLLs. There is no need to enable the locks, and that is
> done as part of the set_defaults logic already.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 42 ++++++++++++++--------------------=
------
>  1 file changed, 14 insertions(+), 28 deletions(-)

It seems like this could've been split into several patches given the
three different changes above. However since they all seem to relate to
the lock enable behaviour I've gone and applied this as is.

Thierry

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphZEAAoJEN0jrNd/PrOhppkP/1l+BZDc28KuhziBSZOdb78Z
XPladFFOulXksTGqP9ian9vVpfdcFL9iAS3s+eVF5wDyJwVcjwEAihs2hJKrjogh
WUgIGjUksbg3amFoXDc6MZbGfHp/mZUCDd/qU4/Dk5q5iJugMA2KB8RGmgRXR67v
iSboVwMxEfxf/oAWTBRxNuo/F+9JMqxZ9G8oiBfIiFCocAu+joWzgtfkAgCc8pX4
BrvgWHwkON8TKswiIpFVoYOUGiQww8wAtnCHyGKHAOUgxCMeU6OIQEHpVMaAcdVa
9oejrjbG5laQlpZ/g6qTWZDTwdWmzEWQi0JNbHexWlekE5NT7xrnHDAMIPBGlKi5
zMOabFFv5lRZGc8RYwqY+ugS0SfOvqIs1dzccbC6wxiATRXYGg1X5/MdtVQDnB01
4NniX48fCOzW3rD8bjyiS3oq0wI8nSo0peyuvvAOEln3prM8EtlKkxFuibY7yksf
/11Gu8Rya4OkskwrQsTFfICSWoZpjqFT9bzJFKDHF0ujEKJ7pwf+SHXiX0IbUQUt
rgAwmWzgpuw9ZTohkhSzVycZNNZDrKYSkga1Pb0D5yNk9NkQhD7E99AaW6HOsjPt
zS5x+g0ixnNKfW/nTwCi/blaWKqT9WMZgviEu8sXyPXwpiMWb68r/Mtw4vHqYiz8
h7emxlcvWm+VxjsJ92vP
=a2KY
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
