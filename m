From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra1x4: initialize at arch_initcall time
Date: Mon, 13 Jan 2014 10:02:24 +0100
Message-ID: <20140113090223.GA16296@ulmo.nvidia.com>
References: <1389401416-29892-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389401416-29892-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2014 at 04:50:16PM -0800, Andrew Bresticker wrote:
> Many devices rely on pinctrl/pinmux settings being applied
> before probing and some of these may probe before device_initcall
> time (e.g. i2c at subsys_initcall).  Move Tegra1x4 pinctrl driver
> registration to arch_initcall time so that proper pin settings
> can be applied earlier.
>=20
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/pinctrl/pinctrl-tegra114.c | 13 ++++++++++++-
>  drivers/pinctrl/pinctrl-tegra124.c | 13 ++++++++++++-
>  2 files changed, 24 insertions(+), 2 deletions(-)

I wonder if a better approach would be to add pin control and pin mux
settings for devices that explicitly need them to the device tree nodes
of the devices themselves. That way they should be able to use deferred
probing to handle this kind of dependency rather than relying on magic
initcall ordering.

This does make the Tegra114 and Tegra124 drivers consistent with what we
have on Tegra20 an Tegra30, though, so perhaps pinctrl is one of the few
exceptions where initcall ordering would be okay.

Thierry

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS06ufAAoJEN0jrNd/PrOhp6cQAJkQX1cYxYT7Kj3+8fd1QmoP
0YQOwK8XQ96qPrAA+P/C8DDZw/M8UNGaUgG5G07ioUYUQXWr1/RhVBNic+oIn8Ne
11hnf0nyAAzo1Im7r2wCVtgmDWw2Gvos5hc52N0JXaM5oQgVxKo/62g7DOEFfpln
cNom3kNHHiSzbhHgR04utBU5ZHvkFfWqs2jgYhaX8hUg+406WvKIqP8gZJTdczXT
WZtCvMpUIFs+MG3e9SyNW0JijffOLO0093YCAWfH3hjphE5TNCdbuHfSpq4u5fe3
+zs+N9Y5kmMb34mWgSq3wPbZ50nUmni3E4+sdNr2hBgdXdak+Isjanq6Bn4Ztn/p
9OcCllXLeyYXOuLVXynhJ5/LB5N8iMLudBFZ0chx189cSEIGcFl8MsjkVUXMqKcY
V8RYWzxPt0wbyujXn+XszZvFnsQth5AXSFbHNb0F2lCXJfYterpdBOUsfvEEBebY
LGyYtJswxf5fpHalot5OzeDDSYEt8FCr0HDg/CpG7qlb6KyEZHLjVhcCEfv3tnwG
XI6jWLIu2jf8KT3ShlxHPBfjMvVns7Om8b426+sLHUJDD87DN+VNV8d3h1YnjLPV
ThqFazz4aD2iiNtO4jmIPgGNXVe9KGesOopQv7912kTfxdCZqKxSPLWRpCBzOMFF
MIHjeOjFnFlhREhzzQCo
=xBoq
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
