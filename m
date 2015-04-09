From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Remove unused .mode_set and .mode_set_base
 CRTC helpers
Date: Thu, 9 Apr 2015 10:50:31 +0200
Message-ID: <20150409085030.GE12103@ulmo>
References: <1424432636-14762-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1468232.zKj9Pah6Dt@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0099259885=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1468232.zKj9Pah6Dt@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-tegra@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0099259885==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Content-Disposition: inline


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2015 at 04:53:41PM +0300, Laurent Pinchart wrote:
> Hi Thierry,
>=20
> Ping ?

I thought I had already replied to the original post, but apparently I
didn't. I had been carrying that same patch for a while already but had
not sent it to Dave because it didn't seem material for after -rc1. The
patch has gone in for v4.1-rc1 now.

Thanks,
Thierry

> On Friday 20 February 2015 13:43:56 Laurent Pinchart wrote:
> > The two CRTC helper operations are called only for non-atomic mode
> > setting, by either the drm_crtc_helper_set_config() helper or the
> > drm_helper_resume_force_mode() helper. As the driver has switched to
> > atomic mode setting and neither of those helpers is used, the operations
> > are not used anymore. Remove them.
> >=20
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c | 2 --
> >  1 file changed, 2 deletions(-)
> >=20
> > Hi Thierry,
> >=20
> > I stumbled on this while trying to understand the atomic mode setting c=
ode
> > paths. Could you please test the patch ?
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 3aaa84ae2681..4476d6a35a0f 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -1327,9 +1327,7 @@ static void tegra_crtc_atomic_flush(struct drm_cr=
tc
> > *crtc) static const struct drm_crtc_helper_funcs tegra_crtc_helper_func=
s =3D
> > { .disable =3D tegra_crtc_disable,
> >  	.mode_fixup =3D tegra_crtc_mode_fixup,
> > -	.mode_set =3D drm_helper_crtc_mode_set,
> >  	.mode_set_nofb =3D tegra_crtc_mode_set_nofb,
> > -	.mode_set_base =3D drm_helper_crtc_mode_set_base,
> >  	.prepare =3D tegra_crtc_prepare,
> >  	.commit =3D tegra_crtc_commit,
> >  	.atomic_check =3D tegra_crtc_atomic_check,
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
>=20

--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVJj1VAAoJEN0jrNd/PrOh0PIQAIxScMxbNLtdyEhGtih3TzUn
ayA6NoFYj4BRPgWQ4fY+V1v32GTGPO1tpWF7G3/487xcDf2s7n2VT9FUehj6n8F+
sseUNvOVBhYbqvp0HozeYOj7RohxBp7xfaKbibev3Q5rEnbnx5LIWXmNEP7rJEng
mUm+dqjWSpkmP1n8i8BvByoWnm96/3YU9si+jbjUw0jv8dFsBXFCtJlDoTzjhCFI
jbqSJf5uphKEHphCjv8WwPSuZaVqUhz1fOv73t/oXjTVbBnQOGoXATm5OIUt1Wop
qpEpFlLHprkneAWmhMT3XxsjORFOhNcErLc+39wICoYFU8wgzTZIAZ8T2eD5w6+J
dWvvstCs8UnhOsnbY3F3JvWgtitis1EAdIiAC2OUvzxvQPJOCK3iu3z+gK8PkP8j
WzlvzFgblwrfbDlAtypoSfyg7WmtOxEsuxGuB+BI33BylWS2aNjt1qlZsItRGIHj
zjgf6X2COBu+gevEe+v+GVb/3kehlMZ/2c2gia21k75gcSY3E442QSVKgK3i6a/r
/ruCiTAU5dWBCeUyqnjtwe1umWHkKdaFSjeqs9usA2JB4HEAS9taEiH20Fp89e+X
0fSu8JftXu31aWAiLyFhC93KAY/z6poyuG8VuX9u2YJrYxEqd14J54OrM154Okol
c8ykuFve3z8eAiVTU+IM
=HRZd
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--

--===============0099259885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0099259885==--
