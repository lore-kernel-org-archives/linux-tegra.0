From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] gpu: host1x: add missing clk_disable_unprepare()
 on error in host1x_probe()
Date: Mon, 28 Oct 2013 09:52:34 +0100
Message-ID: <20131028085233.GB10718@ulmo.nvidia.com>
References: <CAPgLHd_Tw1Os0mT1NgcipJ+fhhbsS+s-Ba-tksUXqFV2cY_ZjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd_Tw1Os0mT1NgcipJ+fhhbsS+s-Ba-tksUXqFV2cY_ZjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 01:37:31PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
>=20
> Add the missing clk_disable_unprepare() before return
> from host1x_probe() in the error handling case.
>=20
> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> ---
>  drivers/gpu/host1x/dev.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSbiXRAAoJEN0jrNd/PrOhCnIP/jRbmza+6bzDhS1AOSUuz8hr
p2HxQSIaq6nQLSScTuAXM72PGbAPLva8qO4bR0yae+SGmLrkmqSBXNljg7gccRCk
PXYgYNfxXLwB8CPYc3rETdWzBbxJHhVlOXEfuAfeffQwA8tqpYJD9DE/MxQA8kBc
Exwc379KHIzQY2tJinzRtLnpIuS5LMG3ffmKvKuo22f+bjW2ADugP6R1YdohJ/jC
AGli79F/07/vLmPZVAHxalCOAPu7gCmYIbbV/Vl+xoN51afJ12FQsDxMKipkblF4
ZTf+XPur8MLipT7lOQzjwiWjNz+xZzXIHDaGVl2VtzImKRMM16Wfha+K0TxoXarL
X1bPbGXYhWpwDT2Y601lmTr019Hb46oUisdejWTmrT/vYE1ReLu/AdRmXCxj6Xjs
t07GYKspYFuqD67mY54fTnEVqY/nmRcH56Mpuv7AbFrXekSuF4P8eXOE5DehNvEq
2ygsaNOqHmc4R/KjyCDmYFGKjqq75MW2l3H9XURsvkdy66s/uozwIXMlTwQGagtF
alLzn+8g41NJT32a9DNrtWQyaq6G5FTA1QIw8M+D38BafkZpSqX5dFMvoybT8JZz
J6h7eeK0+KT2mGuU0LY5sTZxuRt1TvBelinvoS+tKWLH6dN4852ZWZvKG/20z4xN
cML9d+zIta67GNJCmogz
=zJkS
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
