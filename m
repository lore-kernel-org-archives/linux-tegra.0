From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 17/27] drm/tegra: Add Tegra114 HDMI support
Date: Sat, 12 Oct 2013 13:35:01 +0200
Message-ID: <20131012113500.GE22284@mithrandir>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-18-git-send-email-treding@nvidia.com>
 <52587967.6050806@wwwdotorg.org>
 <52587A16.7050200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52587A16.7050200-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2013 at 04:22:14PM -0600, Stephen Warren wrote:
> On 10/11/2013 04:19 PM, Stephen Warren wrote:
> > On 10/07/2013 02:34 AM, Thierry Reding wrote:
> >> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> Tegra114 TMDS configuration requires a new peak_current field and the
> >> driver current override bit has changed position.
> >=20
> >> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi=
=2Ec
> >=20
> >>  static const struct tmds_config tegra2_tmds_config[] =3D {
> >> @@ -223,6 +224,85 @@ static const struct tmds_config tegra3_tmds_confi=
g[] =3D {
> >=20
> > Not related to this patch, but those should have been named
> > tegra20_tmds_config[] and tegra30_tmds_config[].
>=20
> I see that patch 20 fixes this:-)

I can probably move patch 20 to somewhere earlier in the patch series,
so that these changes are there when Tegra114 support is added.

Thierry

--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSWTPkAAoJEN0jrNd/PrOhueoP/0gCLE9b/DkWJh6tXBubgmVP
9khMgAWX9CNwycuiTvcRHFm+cWEEYNq53JcwFmAQ62yZQZFHwQX6hkTpcqUVMAZp
YtOS/OfYhTxSXfgQO3RPg9akf2ckkH2jqGyvOWotah013IC/nhTP/P8wFcZcokIX
hLiXuhqw4RK8DFdyhQcOHhC35I/d8iK+1HeeccPv3DfvMtofC58r942KEZLjQ5WR
yXFLngaiuU9/KRCv+EvQemJE+YYHD8Yffta+b18eRAPaR7D+5Vo58LSF5Xzce5t1
K3/8bmJ7TS27lEqfYJSY20RIov05KX35MQmVj4Db5y6+TMJr9l3br5yjUpJic/4V
GR9hotNZnpazbcw3WlYZypcL5nRxiFL9aY8P+ZmTmXG19QFcEz2aOHZVZ8qbddyp
0QRxMBVVqMwRbhSdpDqKpWRCNu5zDvZwCIcE3zz4W8B1sOc7025k5Lo/8MpZQOSW
lbwIZvUIX5zHsXtcIqNaAPJ+zT6Fw6buWHCV1Pwp/2GpqqmRod4dWIsqvUzHOOOw
BMlxn7QVO+fdqKqjqCOvvaurn1AZCg5y1XpBqpMjc3NHPEUST7NDilN7JZIZnWe3
Mo51i8SbUGhn8bdhK4sZOskSJYOFqd3jU6KFI1psOYPrs8i97XXZSMIZMyjqyxRR
FGXK8wJPrpsjRXUnwRxG
=bj/3
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
