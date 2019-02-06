From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: of: Try to find an I2C adapter matching the parent
Date: Wed, 6 Feb 2019 10:38:51 +0100
Message-ID: <20190206093851.5sxretbl7ajizi5f@ninjato>
References: <20190125131142.26837-1-thierry.reding@gmail.com>
 <20190205124443.GF1045@kunai>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0561211638=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190205124443.GF1045@kunai>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Tristan Bastian <tristan-c.bastian@gmx.de>, Vlado Plaga <rechner@vlado-do.de>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0561211638==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="znm33lf5tor7xwnk"
Content-Disposition: inline


--znm33lf5tor7xwnk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 01:44:44PM +0100, Wolfram Sang wrote:
> On Fri, Jan 25, 2019 at 02:11:42PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > If an I2C adapter doesn't match the provided device tree node, also try
> > matching the parent's device tree node. This allows finding an adapter
> > based on the device node of the parent device that was used to register
> > it.
> >=20
> > This fixes a regression on Tegra124-based Chromebooks (Nyan) where the
> > eDP controller registers an I2C adapter that is used to read to EDID.
> > After commit 993a815dcbb2 ("dt-bindings: panel: Add missing .txt
> > suffix") this stopped working because the I2C adapter could no longer
> > be found. The approach in this patch fixes the regression without
> > introducing the issues that the above commit solved.
> >=20
> > Fixes: 17ab7806de0c ("drm: don't link DP aux i2c adapter to the hardwar=
e device node")
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Removed the duplicated Tested-by and applied to for-next, thanks!
>=20
> I applied to -next because I want this core change more regression
> testing in next. If this goes good, I will do a cleanup series to not
> use the of_node of the parent twice.

And there is a regression! Good that I didn't push out before
double-checking. No one noticed that this breaks registering child
devices because of_i2c_register_devices() doesn't have a pointer to work
with anymore?

Removing that patch from the queue.


--znm33lf5tor7xwnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxaqycACgkQFA3kzBSg
KbZxaw//ZROCkZOBaZ/hRoFWpJMOsboSuVPnrBtNgsGQyLGeu1Q2YB3QnJbcoOI+
+1VXHBdYA5d7cGVaE69AdjKI8Mido6oo29t5yVQ/8OgMNCHe9vGl81uJuqiP6jIl
A6GCWacRWTFTzZTLaDjT3q1WBktK6Lm4jRGZsnjdUjSYFi6S+D1dUxbOUBc7+ft3
XEZUi5olbfOTto51iLRhGKzAsQ+10iyB4KDW/Eqo9up66gEcYbblfpEnJF9rPRhZ
kiYJddPTcQ8b1METg63sC8h5JulfDF0Zf33IDQ51pEpdnetPWSI845c6kC0MwClU
uLQyJrj3jMMvi6ub64hsv0Y2kLjGxK16grLVeEPCSnLP1ObrnRg48OGEQd0B3f96
OvRAjJZigxk58hkzj33OIDMfE4BlXFvGQwSMmqxg0vf4mITCkIG6RygSWOMA4Wbo
Lztw0YRNehwAHx7Jg2s8XYFsPk4gPaIMi0/FokCxjcsbYQdLhBjSgHH0O5UDCtgS
n1LQHnY+Waa7Ia8BssUPkF9v7rmxO9Cl8BQnRMtYfrL+NUP+jtSzQ6dO3cTBJA1M
4bMRK+t9wCjsN5gy1Q6zzuGvqbidIc5vTFyQVN2l4IWPC65u9dVEdN7Ru1CWT+JE
65VegNWSYh27rSuOwMfT4+ZtMWtkha0cq/t6flIoZUblmWbqlaA=
=P0RV
-----END PGP SIGNATURE-----

--znm33lf5tor7xwnk--

--===============0561211638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0561211638==--
