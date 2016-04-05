From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM64: tegra: Add stdout-path for various boards
Date: Tue, 5 Apr 2016 16:05:05 +0200
Message-ID: <20160405140505.GD28814@ulmo.ba.sec>
References: <1455025920-21875-1-git-send-email-jonathanh@nvidia.com>
 <1455025920-21875-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rz+pwK2yUstbofK6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455025920-21875-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2016 at 01:52:00PM +0000, Jon Hunter wrote:
> For Tegra boards, the device-tree alias serial0 is used for the console
> and so add the stdout-path information so that the console no longer
> needs to be passed via the kernel boot parameters.
>=20
> For tegra132-norrin the alias serial0 is not defined and so add this.
>=20
> This has been tested on tegra132-norrin and tegra210-p2371-0000.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 ++++-
>  arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi | 4 ++++
>  2 files changed, 8 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXA8YRAAoJEN0jrNd/PrOh+EYQALxsuJDrbVBgVPeLSn+b6V/5
xYrDyxkHr8MTp3sw2QX6660oKI8oANiQNv4ndCUBlRbG/CoMJZ+skTcIJQ7+d0n4
49rko/2IggXjGTTfYhQ74BQS4teCMywo3XtScnVO/x05Mlv2dsJ+uWFONiE87ixk
IokySIfZwDLkWbi0KEM7SIjA1B+DbVsBOy0zBmci/TiHR4HGzJg+15n2Kzix1eAc
S9npDOogjP+mGSXFZ60l3MK1eOY3Y79RW0H0sJsKoHNX1CUaxBZRUwnXRce4rpF+
MRTT8/jPyFHZcNlnJa5owKWdn/OeBCYr0h/DGlx2MucVXBG4ukRBJ5hK5pwlOJIx
S+PET4XYhZiXQmQ5u4JIUrzR8hBBM3HE9uXG5O49Sq9y6k4m94nPwzDevYQtm2zf
N6p/whAtDZ6/mKXe/1+v0G7TSM9J+1k/B4qeGrirAxOm+s9hG4qMbOHAjEYmg8Uf
poaLOE2GReaV2LrKa0NrCJUXqZ5FYauVRv2DBS8gybFbD/eNy3BnJyeNcs0m1da5
GnvrgAytPhayx2nQLIloJam2ckZuj4dOxgtXpus6NMiQqHdWGGlE0QEDtiPIfn7J
RooGI2sgtv1vUFSsLro+8sMRWjbvcp1+MdOiMjy+lO6XNjaf+0c+OAJmz8Jsr4Fp
/pO/6CZXlyRQTVL58d1A
=hT56
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--
