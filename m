From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Fix wrong value written to PLLE_AUX
Date: Fri, 16 May 2014 16:31:11 +0200
Message-ID: <20140516143110.GA28338@ulmo>
References: <1400248220-16025-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400248220-16025-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2014 at 04:50:20PM +0300, Tuomas Tynkkynen wrote:
> The value written to PLLE_AUX was incorrect due to a wrong variable
> being used.
>=20
> Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   This fix is required for the (upcoming) SATA support.
>  drivers/clk/tegra/clk-pll.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Mike, Peter, it might be good to have this go into 3.16 as a
prerequisite for the upcoming SATA driver (which presumably won't be
ready until 3.17, but in that case it would be good to have this
prerequisite merged already).

Thierry

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdiEuAAoJEN0jrNd/PrOhM6AQAKrWkHgUrAkNklVW/pGxauVk
CMaw+mBnaeaBiNfpmli0c8h6b5O+Tq/71d98lKmLmcrrgXLy2q0T5n24XGyVFunJ
pr/mCx1GIpvqTU8t4W8kYaJHowMFrR8l9z156g2TxYe3vlT8/WeMnuMrQZY3YyTM
W7b46jYz8MTMPjv6XZFjiHOhI1rUwq+QNHKaLRKeGKwixPI2QCt31doQ22/IEz+v
ElCw/YxFzu5jxN10ey3WBgtOPt938fezfZIo+Qn6NCgdlGU1DLOnnT5roDDjlb8A
z+0RoX2MdYsIHZt8SnBr3d9Hdi7h/MTBtbhVpiY8vFBfkleexh/UvhYcWzgxudhm
IxSpXO6gZYWXL17hYPdZeUyt7AUeEyP0uqF77C1QtYJmIcpTb426Cup00e3vJoix
WMp1vSV5BvTJR6prBdzVSM1IyG83vFmxxIgWslHrdkQwIkobo9sh1fFq59TB7MRf
y+49t0al9kU4LIkpPZhkd384vhiQTHmCSm0NyZHpfImUecQfCo6DJ5XNHQi09xYY
SbAOYUSZfBiX0lDooqTSNJso0wOHFnTCVP71dFoPmYFebQE2x+U6OX3ORcIbMfEJ
mD9jYl0czxmefra4r8i4WP1KYkYw4cE0XhDDtjG/o/mjO/Vpsu8SZ7qdpV5pOOYb
xhbFLPLGv04Zv+L6cxiA
=bFZi
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
