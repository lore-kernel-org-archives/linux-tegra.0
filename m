From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: of: Try to find an I2C adapter matching the parent
Date: Tue, 5 Feb 2019 13:44:44 +0100
Message-ID: <20190205124443.GF1045@kunai>
References: <20190125131142.26837-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0221127097=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190125131142.26837-1-thierry.reding@gmail.com>
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


--===============0221127097==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline


--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 02:11:42PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> If an I2C adapter doesn't match the provided device tree node, also try
> matching the parent's device tree node. This allows finding an adapter
> based on the device node of the parent device that was used to register
> it.
>=20
> This fixes a regression on Tegra124-based Chromebooks (Nyan) where the
> eDP controller registers an I2C adapter that is used to read to EDID.
> After commit 993a815dcbb2 ("dt-bindings: panel: Add missing .txt
> suffix") this stopped working because the I2C adapter could no longer
> be found. The approach in this patch fixes the regression without
> introducing the issues that the above commit solved.
>=20
> Fixes: 17ab7806de0c ("drm: don't link DP aux i2c adapter to the hardware =
device node")
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Removed the duplicated Tested-by and applied to for-next, thanks!

I applied to -next because I want this core change more regression
testing in next. If this goes good, I will do a cleanup series to not
use the of_node of the parent twice.


--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxZhTcACgkQFA3kzBSg
KbY89Q/+ILjrajrZxtCSiotT7pK4eOQvpj0Xy7qx4oE3boyoZu1wXc2mF/vDCRDs
yXc4KK2AP1naZryvB/zsMSwa+id7Hvne+VzZY5VIsl4jxw9IZMuF/hEXqnVQ6AnI
Zs7SfwXwTEmT70a+231k3XsgCTRqtDKHli3mqPfKCBk9MLka+aHTbvNKgMmetLx5
FipesTS8UEM8YsIWrjh4sgxK/pzZaDWrlq5ZOVSQYcdxON2mmWRYcFIMDX0VckHA
Bth/8+Y/VoJI6yxyxQ9b3CalrDhvuOFsagQINa3SLld0TJR8Aa8xTnD4T888Ua4h
39VLJzEvuEGkySbLEJtFUjC3HzfcWB3gCyzSr2eTwMx7dLqz1pB24/FslMgQb3lk
NdBk445Kf0QC9ZjTuvzjvf0wI0Dm/6Pl74QgNmfeyn0MEuqsBrkcy5VwqgV3Hz0E
oJwZ0qfdK28nvjYxASL/7QNIfsRBvOVXUqegprABqkC2RGbZvM2aLv1tiCBExQbs
K5uEV2v6eYUcE4pacQv86fIsHmxuVXCvA4AnyQsBXHBcCtYciZtKEwWSpR/ZG62G
xVif0FxsxJPl4sP43TW4M5QIwiZpbmPkQDYYcCP05kVDYmu3bk2U06QObGVljuop
c8jtFnZ+yhV88SL3QblMjqn4eKuM7hUyoGG1LWASRxVe0o1qzA4=
=J5TL
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--

--===============0221127097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0221127097==--
