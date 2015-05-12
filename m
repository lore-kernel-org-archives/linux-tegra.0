From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 01/12] drm: Add a new mode flag:
 DRM_MODE_FLAG_PREFER_ONE_SHOT
Date: Tue, 12 May 2015 10:23:01 +0200
Message-ID: <20150512082300.GA2386@ulmo>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
 <1431308311-4470-2-git-send-email-markz@nvidia.com>
 <20150511092743.GO15256@phenom.ffwll.local>
 <1431362096439.71223@nvidia.com>
 <20150512063558.GP15256@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1469339123=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150512063558.GP15256@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Mark Zhang <markz@nvidia.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============1469339123==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2015 at 08:35:58AM +0200, Daniel Vetter wrote:
> On Mon, May 11, 2015 at 04:34:57PM +0000, Mark Zhang wrote:
> > I just want to make things easier. If we adding this in panel's meta
> > data, it will be harder to make crtc gets this, since normally encoder
> > talks with panel and crtc talks with encoder. But yes, adding this in
> > panel's metadata makes more sense so if there is a better way to do
> > that, I'm happy to do the changes.
>=20
> Adding something to the userspace ABI (which you've done here) because the
> kernel-internals are designed in an awkward way right now is definitely
> the wrong thing to do. With atomic you can easily add a bool
> prefer_oneshot to drm_crtc_state to encode this. But I fear that with the
> plain crtc helpers this just doesn't work properly. You could add a
> driver-private internal in drm_display_mode->private_flags, but that might
> clash with drivers existing use of this field.
>=20
> In any way, this is definitely not something to add to uapi headers. Hence
> Nacked-by: me.

Are there use-cases where one-shot mode is worse than continuous mode?
I'm thinking games that run at full FPS and such. If so, exposing this
to userspace is perhaps not a bad idea, albeit not via a mode flag. If
userspace had a way to set the preference, it could do so depending on
use-case.

Thierry

> > ________________________________________
> > From: Daniel Vetter <daniel.vetter@ffwll.ch> on behalf of Daniel Vetter=
 <daniel@ffwll.ch>
> > Sent: Monday, May 11, 2015 5:27 PM
> > To: Mark Zhang
> > Cc: thierry.reding@gmail.com; linux-tegra@vger.kernel.org; dri-devel@li=
sts.freedesktop.org
> > Subject: Re: [RFC PATCH 01/12] drm: Add a new mode flag: DRM_MODE_FLAG_=
PREFER_ONE_SHOT
> >=20
> > On Mon, May 11, 2015 at 09:38:20AM +0800, Mark Zhang wrote:
> > > Normally this flag is set by panel driver so that crtc can enable
> > > the "one-shot" mode(not scan frames continuously).
> > >
> > > Signed-off-by: Mark Zhang <markz@nvidia.com>
> > > ---
> > >  include/uapi/drm/drm_mode.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > > index dbeba949462a..5447a338e893 100644
> > > --- a/include/uapi/drm/drm_mode.h
> > > +++ b/include/uapi/drm/drm_mode.h
> > > @@ -72,6 +72,7 @@
> > >  #define  DRM_MODE_FLAG_3D_L_DEPTH_GFX_GFX_DEPTH      (6<<14)
> > >  #define  DRM_MODE_FLAG_3D_TOP_AND_BOTTOM     (7<<14)
> > >  #define  DRM_MODE_FLAG_3D_SIDE_BY_SIDE_HALF  (8<<14)
> > > +#define DRM_MODE_FLAG_PREFER_ONE_SHOT                (1<<19)
> >=20
> > tbh this doesn't sound like a mode flag, but something which should be
> > attached to the drm_panel. Especially since all the single-frame modes =
are
> > highly sink/link specific. Why was this added here instead of to the
> > drm_panel metadata?
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVUbhhAAoJEN0jrNd/PrOh3WQP/A99TQNhXWhfXX+/Ru9ryPwf
70ImVT0gptE3awRZp+0Itqt7STTUZXFe9dNgXo/YusqJfDRwnTexuODQ5/UorjbR
C2M5vIN+7y9kIRI7jwrEZVfOjg3QY4ZrvpqqyFNHq3/LrQV4o9LPE3/Hs+7q3Hn9
h2qUq1AtXUzA0u7vJBdwXTtif3yQYQsgVAPCI/cH5DNxTIAQNiqFq3ysJE+PGHca
BbO5DmBAhkehkZ4p/3HQ+t+Lu7NGM13XK4+qmDjd8cqkXOtnTLwbSyYZcBVD+t2P
qgU0pDB2vcL4tgycFX0s9v0Jr4405uk4sZf16evUSE5PmNfKc6dFq/oxAemz6Jvq
sDQUlG0PwVgdgjOuxzPx/omFM8YFfC1+Wtd9LcVGimrQjsczSzOqaZpvosA71f9n
3dnIz8EOkjRYuFyQhX8RU3noAi4+GbVmmF9oJ1kfTHLHloaCD0rpJQEiSmrN6k7c
cfNXxQ6fa1s54hykFkbXFsetFQNj2sK3wUnFq9oj4VtIMlfv31q2Hga+N5JLBfcQ
JEDewFayJEkMyKBext9gU/q7hXR2Uxm0YpcV/aeDPC/Z01+LSFlFYI1j6Di06jvl
5A0ZRGDc4ED4PQQ1m+9iUOjFYsQ/rbxyLN1aBSM+i4mQKfVF3trxMVelx1XxVq1p
PFnkEwUQS7daax1T0Ex0
=p3dq
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--

--===============1469339123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1469339123==--
