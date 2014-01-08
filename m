From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Fix Kconfig dependencies
Date: Wed, 8 Jan 2014 21:04:45 +0100
Message-ID: <20140108200444.GC1298@ulmo.nvidia.com>
References: <1388946171-29459-1-git-send-email-linux@roeck-us.net>
 <20140106153945.GA6721@ulmo.nvidia.com>
 <20140106162055.GA18726@roeck-us.net>
 <20140108132924.GA1592@ulmo.nvidia.com>
 <52CD573C.4020501@roeck-us.net>
 <20140108140137.GA21974@ulmo.nvidia.com>
 <20140108162402.GA6928@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140108162402.GA6928-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2014 at 08:24:02AM -0800, Guenter Roeck wrote:
> On Wed, Jan 08, 2014 at 03:01:39PM +0100, Thierry Reding wrote:
> > On Wed, Jan 08, 2014 at 05:48:44AM -0800, Guenter Roeck wrote:
> > > On 01/08/2014 05:29 AM, Thierry Reding wrote:
> > > >On Mon, Jan 06, 2014 at 08:20:55AM -0800, Guenter Roeck wrote:
> > > >>On Mon, Jan 06, 2014 at 04:39:47PM +0100, Thierry Reding wrote:
> > > >>>On Sun, Jan 05, 2014 at 10:22:51AM -0800, Guenter Roeck wrote:
> > > >>>>arm:allmodconfig fails to build with several undefined drm and ho=
st1x symbols.
> > > >>>>
> > > >>>>drivers/gpu/drm/tegra/bus.c:52: undefined reference to `drm_dev_a=
lloc'
> > > >>>>drivers/gpu/drm/tegra/bus.c:56: undefined reference to `drm_dev_r=
egister'
> > > >>>>drivers/gpu/drm/tegra/bus.c:67: undefined reference to `drm_dev_f=
ree'
> > > >>>>drivers/gpu/drm/tegra/bus.c:75: undefined reference to `drm_put_d=
ev'
> > > >>>>drivers/gpu/drm/tegra/drm.c:445: undefined reference to `host1x_s=
yncpt_get_base'
> > > >>>>drivers/gpu/drm/tegra/drm.c:449: undefined reference to `host1x_s=
yncpt_base_id'
> > > >>>>
> > > >>>>and so on.
> > > >>>>
> > > >>>>This is caused by DRM=3Dm but DRM_TEGRA=3Dy. DRM_TEGRA is bool wh=
ile DRM is
> > > >>>>tristate. DRM_TEGRA can not be set to tristate because it depends=
 on unexported
> > > >>>>host1x symbols (and possibly others). Fix by updating DRM_TEGRA d=
ependency.
> > > >>>>
> > > >>>>Also, the DRM_TEGRA help text states that it can be built as modu=
le.
> > > >>>>Remove that text since it is not (or no longer) correct.
> > > >>>>
> > > >>>>Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> > > >>>>---
> > > >>>>  drivers/gpu/drm/tegra/Kconfig |    5 +----
> > > >>>>  1 file changed, 1 insertion(+), 4 deletions(-)
> > > >>>
> > > >>>Hi Guenter,
> > > >>>
> > > >>>I think this should be fixed in latest next, where it is now possi=
ble to
> > > >>>build the Tegra DRM driver as a module. All needed host1x symbols =
are
> > > >>>exported as well.
> > > >>>
> > > >>>One thing that strikes me as odd, though, is that I've always thou=
ght
> > > >>>Kconfig would warn if a symbol selected as =3Dy depended on a symb=
ol
> > > >>>selected as =3Dm, precisely because of what you describe above. me=
nuconfig
> > > >>>complains about it pretty loudly as well.
> > > >>>
> > > >>>Oh, but I see that if I change DRM_TEGRA back to be bool, then Kco=
nfig
> > > >>>doesn't complain anymore, even if DRM_TEGRA=3Dy and DRM=3Dm. Shoul=
d that
> > > >>>perhaps be considered a bug?
> > > >>>
> > > >>No idea. All I know is that it causes a build failure ;-).
> > > >>
> > > >>Anyway, are there plans to push the patches changing DRM_TEGRA to t=
ristate
> > > >>into 3.13 ? This is one of the reasons for arm:allmodconfig to fail=
=2E If there
> > > >>are no plans to push the patches into 3.13, I think it would make s=
ense
> > > >>to send my patch to Linus and apply the tristate changes on top of =
it.
> > > >
> > > >The patches to change DRM_TEGRA to tristate are part of what is queu=
ed
> > > >for 3.14. While I agree that having allmodconfig working is a worthw=
hile
> > > >goal in itself for build testing, I'm not sure it warrants a patch t=
his
> > > >late in the release cycle that will cause conflicts during the merge
> > > >window.
> > > >
> > > >It also seems like there are other issues that prevent allmodconfig =
to
> > > >build successfully on ARM not all of them being as easy to fix as th=
is
> > > >one.
> > > >
> > >=20
> > > All other problems are being addressed.
> >=20
> > Okay, if this is indeed the only remaining issue then I think it makes
> > sense indeed to go through the trouble of fixing it right away rather
> > than waiting for 3.14.
> >=20
> > > If arm:allmodconfig is not pursued as buildable, trying to build it i=
s worthless,
> > > and I'll drop it from my list of test builds for -stable. Thanks for =
letting me know.
> >=20
> > Right, I hadn't considered -stable builds and this is an issue that's
> > new in 3.13, isn't it? In that case, and since this is the only
> > remaining issue, the above patch:
> >=20
> > Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Dave, since this is a single patch for 3.13 it might be easier for you
> > to pick it up directly rather than have me send out a pull request.
> > Either way is fine with me, though.
> >=20
>=20
> For now I have dropped arm:allmodconfig from my list of build tests and r=
eplaced
> it with a number of additional individual target builds. As I had this or
> similar discussions ever since I started testing -stable builds, my concl=
usion
> is that the arm community isn't much interested in keeping arm:allmodconf=
ig
> buildable. If that ever changes, I'll be happy to add it back in.

I can't speak for the community as a whole, but I'm certainly interested
in having more automated build coverage. Last time I attempted an allmod
build on ARM myself, which must have been at least 3 months ago, there
were quite a few issues and I didn't have the time to fix all of them. I
hadn't realize that things had improved that much recently.

Thierry

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSza9cAAoJEN0jrNd/PrOhTHYP/1VUKoLNIahSilqNanOmUa76
z1WqNuZdusyyAEfn2s5qoqtNXYOq+3DIoWkt8oF72d3scpUHOVoiabpR6CJTfMMZ
2X+iuHTh03VbmRacCxBdLXF3RPPW3SXnDztb/uk8Sjl882epXigVcH9mPY915aDI
dT8WOsDwroawoxAegHiwYoxmk/CBswBL/5jztinua5I/7qSwicw1vvAAkJoEfiA9
y6b6dGKMcf+AHMbVVqfsDLyCulil4Shx/3mzf5j+1pXk4kGUxmqS6cSEwzMw16vq
InmxoiHIOcfAjj+uOq9J+FSD1IKngc4bfKNGxpnB1tO7vAN9QhmqjvKDEcxrvF45
dkc2tpUuqgvJE570ONonEw4ZZxF3lFVUoaeDnAo/2azMA0obFFmu2H3JrsRJ6Ui6
fhfGHY8TJNesz0UtHO4p4QJqK9gbfSbPlFpCxF7J2328NyTrjbiGGWrGeS6hIlGZ
enDqQXbRT/twkqe4Bvag5u0u+eiMrwkkOEIswh07DlBX2SY4wajPYFpMhHCLioxv
oKRtRbdCfb/tqPrFRtgGJ0edq3d7Gy4PBtf0qnKii4Jxo6e9lEpuwdbSKTFNu4FY
PovVySZRrNCW43cMyGJNVTgGop67XJiBzKh986rud/Ki6uXzCM9h5/5Bpub9WXQ1
MPIczMZgzaMIMu5bhmkv
=5r4F
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
