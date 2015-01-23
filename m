From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 02/36] drm/plane: Make ->atomic_update() mandatory
Date: Fri, 23 Jan 2015 10:18:57 +0100
Message-ID: <20150123091856.GA3835@ulmo>
References: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
 <1421750935-4023-3-git-send-email-thierry.reding@gmail.com>
 <CAF6AEGvObX_YBvw7f+SytnBokpdQopom-sWGoxaPG2k+g1YjTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0577471110=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAF6AEGvObX_YBvw7f+SytnBokpdQopom-sWGoxaPG2k+g1YjTA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============0577471110==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 08:51:15AM -0500, Rob Clark wrote:
> On Tue, Jan 20, 2015 at 5:48 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > There is no use-case where it would be useful for drivers not to
> > implement this function and the transitional plane helpers already
> > require drivers to provide an implementation.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index d467185f7942..010661f23035 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1108,7 +1108,7 @@ void drm_atomic_helper_commit_planes(struct drm_d=
evice *dev,
> >
> >                 funcs =3D plane->helper_private;
> >
> > -               if (!funcs || !funcs->atomic_update)
> > +               if (!funcs)
>=20
> maybe WARN_ON() here.. or drm_universal_plane_init(), or somewhere,
> for missing mandatory fxns would be a nice thing to avoid explosions
> under console_lock for first modeset?

WARN_ON() here isn't going to do you any good under console_lock and
may drivers use drm_universal_plane_init() without having converted to
atomic mode-setting.

Adding a comment to kerneldoc that it's mandatory is probably the best
we can do here.

Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUwhIAAAoJEN0jrNd/PrOhWyoQALgplJMyYsD6PWby0qAET1Bw
/JZ4OUaOyPuhmNiiSjdm7wuBBr+stM++OfNcIO5RgT1gORlg9zkqytnV+81xZ6zh
WNewyY92QaNH+sOZfMthWpaho224cyvTzlV5sFya4vtQBTmh7Vk4tT5vUpPAGvtv
TJnc9WCwdRmNVU8wRqaQOItTsTY9umlE6YBxUxd1xZW5zaND86ElFDTQNycpFaY6
zGx6HBh0abycWjRi2RslhTua7EKsdoUBuJAJRIj5ILbZHxCotxckgbaDxd70wMTz
YSXV9YWEfc/IlG8eh+2fiOJldivmCe9VVcl2WnnnoHMbqM/8iaEYuSIBKcIsN6vM
tuQEo/7PsIolngupp6WmWLaFXA0IQG6FM4CbEIytbyMCpZ5N+vIZS35iUkRzI1Mp
ItB8ugFKCmRS0p0cyGlPGMo49zcgf4fK4w7lbA0rej/RPuSfxomYid7SISCKLsH/
R1/Dvfv/L0DOj3wROgvtVNlMh0Mfr2+NWdvGckq6uv930KhMajAq1mu1/d4X/nWA
rwLC8fgNqOXjI42Fs2ndFY9dSgcciX8jmDKTuY7ZR/UtsqoUx5iMJN7s/xifK3za
CykvrM1YhO/+mATup55QlnuNEFOBgVxBNjtN0t8yyVWUB3DackeIBSrdMwBORQns
+0YSIQoh+p3X1dc0NRJ+
=snr2
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

--===============0577471110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0577471110==--
