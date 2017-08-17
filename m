From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] firmware: tegra: set drvdata earlier
Date: Thu, 17 Aug 2017 13:08:32 +0200
Message-ID: <20170817110832.GB18789@ulmo>
References: <1502963351-2855-1-git-send-email-talho@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1502963351-2855-1-git-send-email-talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2017 at 12:49:11PM +0300, Timo Alho wrote:
> Subdevices of bpmp, such as bpmp-i2c, require the bpmp device's
> drvdata to be set during their probe. Currently this is not always the
> case. Fix this by calling platform_set_drvdata() earlier during bpmp's
> probe.
>=20
> Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/firmware/tegra/bpmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-4.14/firmware, thanks.

Thierry

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVeS0ACgkQ3SOs138+
s6GSJxAAifdgInEUL6AivSQ3TumSjKLdxFfy8fDCmuvNK2chT3Llna4vTiSsUSmm
dr7MATn5vcmyMaH58WF5WYbdilmr1jDurEX/+hLElLDRQOJC6iGh/RuuqjAwvV1y
ae/z7sQtcioC34mP05nLK17qWBj/IUkaQJ09qrlY2HaLCMY2yzT86AtzfMLS7045
XGZ+X33hf+Wt0DX3YakXXd/TslDXAVrTDe2FyH0IGMnJNbM5KYDrZA7H8qbHafGl
c7OThC4Rg/4/jOP9YPZ8EegcdXZM8pr+14NSek3U97r7AEUO9YPLF+bA0j72nO/k
4LdL65cvJbWlGzSE6lZpymvZVvEug0z1vIwk3wr+JQnhEJuGd0SB/bhIBZazIGMJ
oXFgXEU/DurgBv4+bktGwgjC+9CxU5kBSJdbpYCpUz5576SWnwn5w4MAsRFoxw75
JAay5sXdCkILQLETglT/4mlaHjdBrbuM7t+uyzK6ibnvRUhmS90On7zdoolvWPXa
xqY5+2P6V0dyS/xBbhIneZ9noeFfY6NrmSXPJGOkWnGUtYRR+lYN+TzVilUW0cVo
zAqYWsNYEgajza9KeasXOEg7NgL69Zwkic/MoIQxoDBU4J+mUAwnyzfctXoZSM8G
XgT7mWdLyHt0qFhWNo28e5IQ3l0B59N4uwwbLy7sBZs7Qd8MXAY=
=Jupm
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
