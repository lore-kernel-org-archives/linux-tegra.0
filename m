From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v5 2/8] i2c: tegra: Properly disable runtime PM on
 driver's probe error
Date: Wed, 15 Jan 2020 18:34:02 +0100
Message-ID: <20200115173402.GE1239@ninjato>
References: <20200114013442.28448-1-digetx@gmail.com>
 <20200114013442.28448-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200114013442.28448-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 04:34:36AM +0300, Dmitry Osipenko wrote:
> One of the recent Tegra I2C commits made a change that resumes runtime PM
> during driver's probe, but it missed to put the RPM in a case of error.
> Note that it's not correct to use pm_runtime_status_suspended because it
> breaks RPM refcounting.
>=20
> Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v5.4+
> Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied to for-current, thanks!


--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fTQoACgkQFA3kzBSg
KbbSbA/9EJCPHj4C82FpABEiFRRnAK8KEghBTuxYQU2uusd2t0/d0bueNdMMi/g9
LIbCweewEHesSopTrzftHyBLJh3rs5Q9P6DQ6Pk7fhxgAyARm6FmQVk58DYfI48u
Nb22WLWOsyTatQoMHhEJyDDxxW9w2YzrPQiW/vu/XAFAcOmAJ+p0GohnWaJHMsSk
ivAjhvR3AjMpu7lr4Pm3xnSSyozH/XhdWmg7cpVSJNuCGMj0TIg5omRiHpNHnnCh
uDeVPC3IV8/u/JLH+MWX6feDUNaXAv3d8bceHUiLT3chsTDlzQIPeGEBtcUo5QDT
uEQPn4O+oK4xPO7k1+fWo36EYsfWzW/B2DFWYXOmHGk41ho4gOJnopOoRy6MRRnL
NtlDRYmA+d6OMmol7YVTgy5Nv2z6XyY9HpIJWjUQ1q+m6F1qaQH1dUjYM9lBTcX/
yi+0fCTi36Yhsf4bCNK069e3KzdJ/BruACOtILjyhxgbUMEh8RyGwZ9/LLRW1GpV
15+xHHS0RXaAuwW+4EaIVxT9G5j05F656b0QsVdVJqFVNGGuHrWX0VsXAT6Z2bGu
Ckz7yHx3ULVu112OGgFwVG/xMuaF6YdYWM9z0i7Ty5135l7TCtHeiiXWlawqNJnu
WR+y1mn67V+aJoGKjr9lESIpGvclLtNc+FStySTPn/rXGCoin3Q=
=cN7R
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
