From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Unlock top rates for Tegra124 DFLL clock
Date: Tue, 15 Sep 2015 13:08:53 +0200
Message-ID: <20150915110852.GA2983@ulmo.nvidia.com>
References: <1442310915-15475-1-git-send-email-mikko.perttunen@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442310915-15475-1-git-send-email-mikko.perttunen-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2015 at 12:55:15PM +0300, Mikko Perttunen wrote:
> The new determine_rate prototype allows for clock rates exceeding
> 2^31-1 Hz to be used. Switch the DFLL clock to use determine_rate
> instead of round_rate and unlock the top rates supported by the
> Tegra124.
>=20
> Signed-off-by: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-dfll.c | 15 ++++++++-------
>  drivers/clk/tegra/cvb.c      |  7 -------
>  2 files changed, 8 insertions(+), 14 deletions(-)

I've applied this to the for-4.4/clk branch in the Tegra tree.

Thanks,
Thierry

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV9/xBAAoJEN0jrNd/PrOhSoIQAIPm/JKjnp4Hlr9Z9dKXvA89
RtDyRr4fdi0UtIA2VPS1X9n24UEK883vGz4K/kHjfvyJOCWuBKyeZvhgBdYlOEDs
DBDuHv+oxgvFkV5oplo0BwuEMksMjq6iPpF49FrDgoChtbIgmpvrEjeOFL6qS6bm
vsr092mvNrVoacNEoSPsDHgjw5GoNRxthzW8PkEGl9d3LjSRf7i6YVIMSJD/16bv
pvDdZWkBIGmzfNTYZ4MW9hAtmbRqJH74p0EDOeMcWpQ4GYiNLouXQt5IWWBOM3K7
cDn3pXHhv8LdV6Wou/QNRd5TH5zz6HkcsTHBP89TmXczU/Oq1++eBzPnBsYCHpFY
VkcUEQugclin87N88Sd6VP0QHkm0onVP90CyDvYkceg5se0ZKY7V4kUKmzPwAJQ1
fbanMggfXQsRW/nSZck6jTA7rdxG7g7EaRoW8CzYT5xZPZBzzgTNTLhGC4DwQhuu
aeBnyKcVTWvrcJnzFaNTTlWWLDBD8CHaP1FeUElew1xKoTqUn1zN1RcvV4iqfRZa
SZMoYUygWrMoTfJVKuCHTVygPqqNj/bXTR+LzGK8NvYeT0Phhhz/a00YxUoAdJW0
7ZFEwJS5W9EzvU4kAw2zOUZJcKfSjCERP/ZsM9cjVyW/NNBc1WoY2SUDkgTem59N
7cjTaetl65Y2gQENWFac
=q1rV
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
