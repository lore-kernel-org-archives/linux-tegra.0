From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Fix error handling
Date: Thu, 15 Jun 2017 14:07:24 +0200
Message-ID: <20170615120724.GA30056@ulmo>
References: <20170410202922.17665-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170410202922.17665-1-christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2017 at 10:29:22PM +0200, Christophe JAILLET wrote:
> If 'devm_reset_control_get' returns an error, then we erroneously return
> success because error code is taken from 'host->clk' instead of=20
> 'host->rst'.
>=20
> Fixes: b386c6b73ac6 ("gpu: host1x: Support module reset")
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
> ---
>  drivers/gpu/host1x/dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to drm-misc-fixes, thanks.

Thierry

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAllCeHkACgkQ3SOs138+
s6H6Vw/9FV1MDmcHsT4wsziUxklh7XLsxfcnRcOA7yaIBIaEydwjsK8d/LIJc0j7
Yyd/JW9KlL/nnO782fXo1e2gStc1P2Iy0GIxM0Lt7bgDFiRUTQIL7Ovq+4zPDOZH
ZwnqG9LPEh9hsm3zf1lKFv8m+7JgKFAbcaK0Mq4Duls0yyJKjk+uR53M23j74sVE
h0fmQsoP0uUSAgugItWVhc9qTGTzVWGVM/5jRB/FoeWXRjRdiNVSqMFTz3OSw5Jf
T0cwQQi5yxGfU2Q/2sqjBVDK3pobJ1UcPVv3BkkiKlg4c4hSKBpZwnVsjQE7CHCM
j6/tQ1sEIm1iaBVF0HE17XJ16l8EoEHfLiVae3Ap3ywHURSXmSKIRQBvUW7IDYG6
uNrDbMLz1pMO+JccOpAduXsngw5JSAgIMQ7LjqKpDACGifsQ9DbIiG4XAMPDjtOG
nzSuWBO3GMhXlfHA1NTMSmBDiE+hHpagIdLQMFJMK6RmC86PaVpqGq33ixaoykBx
za7D0Z1B0/xO+bErGWbQ/yBZLVNYKiE66oJnvQO7Yq/r880EPLH+FoCtMXrIgEKI
Zboglj4CV+NbzvEzqsZ4z+AQmG3h7CYTY6Xstcu8OO8oZGzVkbU8gHoR0ZrdwmxF
am2U4WYU5v/vB80fDxxfn9RWPqAAz+2pW7Us7wmZyjzKylrECTw=
=JseM
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
