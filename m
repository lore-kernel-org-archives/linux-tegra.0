From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 0/2] Fix kernel panics with certain I2C tps6* chips
Date: Tue, 18 Jun 2013 17:58:12 +0200
Message-ID: <20130618155812.GB7718@katana>
References: <1371491257-23791-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371491257-23791-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2013 at 08:47:35PM +0300, Tuomas Tynkkynen wrote:
> Hi,
>=20
> Latest linux-next head (next-20130617) seems to have some backwards-incom=
patible
> changes to the i2c core, which breaks the tps* drivers in our boards and =
cause
> panics on boot.

Thanks for pointing out. I am going to revert the commit in hope for a
better solution.

So, this series is not needed.

Regards,

   Wolfram

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRwIOUAAoJEBQN5MwUoCm2KeoP/0SXp2lP5JGUOYMThaNHig6o
CXN11YqjaTxgaWLo51fwlnY9hMVj1vzkh7QTze2hMWbPP3UGAULJOyhL6uMD4kP+
wOVmOrKqKOH0iwWON2gMuZ3CD8zDuh98gEk6GcmYv/fG+4RDZhTKPQSPUjoZ+Pic
A8LRDVfVyw+6YTqrrNQkNHv3D/hBcTTgKate2wTn5pLq0UzXPY0isP3/knIB6HXd
VITlbnwZH55T2N5SiJ9ZSoM2Qas416CXhAKBv0TZjxXRgIyrwjmKbZr60QkSCaX3
dqguGsCJEq9wDJRo9eayT1N4mXA/6xyRq8HNzchha6tvOwgKWyTmipciywREfq1E
ilW6o3jFzMgYCqAtBmT5cmR6Mwgj9MY2gCjfWBsqqIBt3604rGbk+VeQaofAd9lh
q15gUDb+5mBljRmHWkv4c6T7e8QXrk42HY9AcPjvyeHvuh0AKyelRX5Gt+uj8GA5
FGWVBD404yrvY4OSHHHUTw+XhuIdd2GasnFDiJFoMg8lPYvO9YT+sFFx0Hm+tw+u
P1Bst0o01aFmtALbCJZHldjjZTiQPpy+QpodtAm8nr/5oIyUpFKUxbN+DHumILng
BGwoESdqS2+zqN+E/BRqRJitIxCWBs15uzB0Vkf+/AugcsAAGJduYPfqBl9dYPJ9
WQcMNfzGXvyFJ3lznE8D
=vt/X
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
