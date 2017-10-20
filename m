From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] clk: tegra: Use readl_relaxed_poll_timeout_atomic in
 tegra210_clock_init
Date: Fri, 20 Oct 2017 13:38:57 +0200
Message-ID: <20171020113857.GA8628@ulmo>
References: <1505502613-11801-1-git-send-email-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505502613-11801-1-git-send-email-nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2017 at 12:10:13PM -0700, Nicolin Chen wrote:
> Below is the call trace of tegra210_init_pllu() function:
>   start_kernel()
>   -> time_init()
>   --> of_clk_init()
>   ---> tegra210_clock_init()
>   ----> tegra210_pll_init()
>   -----> tegra210_init_pllu()
>=20
> Because the preemption is disabled in the start_kernel before calling
> time_init, tegra210_init_pllu is actually in an atomic context while
> it includes a readl_relaxed_poll_timeout that might sleep.
>=20
> So this patch just changes this readl_relaxed_poll_timeout() to its
> atomic version.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changelog
> v2:
>  * Corrected a typo in the commit log
>  * Added Peter's Acked-by.
>=20
>  drivers/clk/tegra/clk-tegra210.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnp4E4ACgkQ3SOs138+
s6EAUA//Uf5PEt/fopIegHAJu7He2iVriXbOacqocWsCA+a5ej9QddUNEG2emQ1L
OYt3lRh7mOgtnWzLBejnUmbsM5lFfCvMxBvQrbMGdY17iSZ9yg8YDDG/DCxJd9xL
5jVK1OdG6G/OG9Mv/VUAWysLPs4ugyQrezEp1yH8YCI9eDx+ucdpAIhzylILFk7R
EN6TVjS76r3tVeYRhM45Q3ykGCnqG6BxsTGecDGX3Y5d6xMFfHbUkBosaDLgT+E5
qxnXNCZ6eVqBFBFS5JFCSWGg5r1MKHPuy2KGIXpA/MSrHyUKmhQAulY55qXHNOZ/
sV9z2ZwpB+vpQb6/3d4GyUMAxNTBDO6Z11jVLtUqwPoeREutY87ri701OYuO4p+7
4/8XtOl08ZTmivJDHX7a4BQgIob4lIYN+hfz9LSL8WhXiO8rlf3ZzZhHfG31U1Ll
DwDl2Z0Vf8Px05gYOVlIt2+s9udhxpU3duvUYRFkTOJ6J0MDVbqu8Exw/zUNUgFz
Mws/1K25MtSMMqwWxbTZF+32fVD8iLTFicQPfhiJY7s0cCD9uxoJrs5TIcXZUZCz
zVCl41KBUNHn4ioUbNxO5t3A+Gy6IpTr3/6sTNCmXr49ZLm6b2BvO5y4ceiXyCqx
57D71fp49mDKfYHbwNQVo+Dq1n8I+geAOGuLVv3QodC09zgn74k=
=8n1M
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
