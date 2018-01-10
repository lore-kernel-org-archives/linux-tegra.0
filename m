From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH v2 1/1] drm/tegra: sor: Fix hang on tegra124 due to
 NULL clk_out
Date: Wed, 10 Jan 2018 13:13:34 +0100
Message-ID: <20180110121334.GA25824@ulmo>
References: <cover.1513768618.git.guillaume.tucker@collabora.com>
 <0f776b7500ee0e74b316b9803803b309779d2ff7.1513768618.git.guillaume.tucker@collabora.com>
 <20171220181520.GA9687@ulmo>
 <d18819df-c91b-c2b5-18f5-12f373ae4956@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1972781397=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <d18819df-c91b-c2b5-18f5-12f373ae4956@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Guillaume Tucker <guillaume.tucker@collabora.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1972781397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2018 at 06:32:11PM +0000, Jon Hunter wrote:
>=20
> On 20/12/17 18:15, Thierry Reding wrote:
> > On Wed, Dec 20, 2017 at 11:32:23AM +0000, Guillaume Tucker wrote:
> >> When neither HDMI nor DP is supported such as on the tegra124, the
> >> sor->clk_out is not initialised and remains NULL.  In this case, the
> >> parent clock can't be assigned to it so revert to the previous
> >> behaviour of assigning it to the main sor->clk instead.
> >>
> >> This fixes a kernel hang on tegra124 and should also affect tegra210
> >> as they both don't support HDMI and DP.  Tested on tegra124 only.
> >>
> >> Fixes: e1335e2f0cfc ("drm/tegra: sor: Reimplement pad clock")
> >> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> >> CC: Thierry Reding <treding@nvidia.com>
> >> ---
> >>  drivers/gpu/drm/tegra/sor.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > How about just the below instead? It's one more line than your patch,
> > but it will automatically handle all occurrences of clk_out properly.
> >=20
> > --- >8 ---
> > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> > index f6313c4d612e..4be9edf9c6fe 100644
> > --- a/drivers/gpu/drm/tegra/sor.c
> > +++ b/drivers/gpu/drm/tegra/sor.c
> > @@ -3047,6 +3047,8 @@ static int tegra_sor_probe(struct platform_device=
 *pdev)
> >                                 name, err);
> >                         goto remove;
> >                 }
> > +       } else {
> > +               sor->clk_out =3D sor->clk;
> >         }
> > =20
> >         sor->clk_parent =3D devm_clk_get(&pdev->dev, "parent");
> > --- >8 ---
> >=20
> > That said, I suspect the SOR might be compatible from a clock point of
> > view with later versions and perhaps we just didn't implement clocks
> > correctly back in the Tegra124 timeframe.
> >=20
> > Maybe Peter knows.
>=20
> So the above change from Thierry works for me and we need this for v4.15
> (otherwise nyan-big does not boot) so you can have my ...
>=20
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
>=20
> However, would be good to have Peter's ACK, especially seeing that
> Tegra210 sor0 does not support HDMI and DP. So we need to make sure this
> is correct for Tegra210 as well (although I have not seen any
> regressions for Tegra210).

There are no Tegra210 boards with eDP or LVDS support, which are the
only setups that are impacted by this.

I've sent out the above as a proper patch. I'll submit this for a late
fixes pull request.

Thierry

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlpWA2sACgkQ3SOs138+
s6FqLw//cKEI38sbWAa8oeOLw430DK+hzEryxetxtIC/fFJfc23+gnZChS13dSa+
eGVILRbzFXynlONhxxwZ8G5N+eb5cMw/rqlic/GK7guTGkXvHYIgoV0/6qlRTsmC
rCz0Sj6Uu943NshDm8+n47+7MXpH9VPhiVWJgoOQkoiEPiMArcNPsguaIrurynIG
vjnRIFJ9iz/34R0In0Y/kYLk6nJUIQXZVrPb+T5SOO2fD+v3fhWLXv6wKciDrkES
C8Bqk86CplFuVpgdODEkS7a5cJaSLCo4mkZg2eLPECgl+WtSH8AKIy/cMKc1jdEo
KlFdhnYXPUPrkISA7E8G48RJKbCw/59TRMnPa0A4uWMYrEyqs7PHf8OX/M13D4aR
DXuw2t+bnVu7A+4L20CP+DlQGKOCeDzf5Yhx2Yls0xyoFu/MDc9ozsmRnCQW9scX
8XVgGByaJZ6DQgGElK45oiI8N8QNub02xNWV/shLRJ1pyUhwgka6rWW7a+OZb91b
iSmjnFQhtPLv+z2+Xswsa98ZIgvCr8ZE5BYZ0ans0xKHeymCT7X+x2LMgZYKaQmn
O1BskxPiwTY1slNxxMxPVvHw3nQNIocfpsCjfKaGddLZYEj3fXFbFejYXFR0/P26
3IfGYugrUEcBZ0kkF++fSXp9qJ9UUMSOEgv0EAP3l7ERN4o4EIk=
=szAm
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--

--===============1972781397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1972781397==--
