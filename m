From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memory: tegra: Fix an error handling path in
 'tegra186_emc_probe()'
Date: Thu, 7 May 2020 21:27:17 +0200
Message-ID: <20200507192717.GA2905961@ulmo>
References: <20200506200907.195502-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200506200907.195502-1-christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 10:09:07PM +0200, Christophe JAILLET wrote:
> The call to 'tegra_bpmp_get()' must be balanced by a call to
> 'tegra_bpmp_put()' in case of error, as already done in the remove
> function.
>=20
> Add an error handling path and corresponding goto.
>=20
> Fixes: 52d15dd23f0b ("memory: tegra: Support DVFS on Tegra186 and later")
> Signed-off-by: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
> ---
>  drivers/memory/tegra/tegra186-emc.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Applied to for-5.8/memory, thanks.

Thierry

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl60YRIACgkQ3SOs138+
s6E0uhAArwnuPlgr7H/3NTv0vER3Av5CqoabBWqcHkdalDEoowrpcAIKG7Y+J3yp
teJ8yCVlGPVPQp5P3peK+ABdZCVVtLx6FnRfuiIlEFih8xJwfLmUukabewO3+sC6
TE0QZtJl7q4R9aXRHHvi2lv/Wl2X4j7A3ucZEVYcB4fEHI7GCWJaGluR6/B6QRS6
D7ad5FQOPbDKWr7vg8ePm+mfypMs8Fes739f8JDnBCnS9Ol3s6Z83xnBc7BTlcUl
hxqY8YRBbyiyWIjTbo5jjg1UGYdKdt0c42YIvmnMpRfxMpwlyyIYDZDirLGo+cF9
ZjJ4p9cVyTTgL9J3CR4LUA2Klxsa6iaLC2lzZ/bUq4zLzxBtWVQinN2z/j8Lav24
54dW1UqhW7VLFxOWqZNa8X7vHTI7LF/gxiaop6J6o/+vYVpIkwHIftEyJz7Na2VO
rfS5Njj9WgYAlNYP4mq1kZigXZOpW5s8ahOpoVA6q0Qbcas11eR8oU8QvwiYQ4c3
v/tDrG/IqehyIpEdvmz7Xr63j45QQmxWH0hYDd1gBRWCzWfB/dM1e41LQe0sOTes
HhWd0qmmj9Ld0XvnYEZvwRTA0nQkuPAH9pr5PdHedUyB/EpKtOnZYM+VQZ/8JAEA
/5X/ZuRMs5hrKgT8XsVTrtnVo+dMxclmYN7CtSizt4LjMumBIH8=
=jPaV
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
