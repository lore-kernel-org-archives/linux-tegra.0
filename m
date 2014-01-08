From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Fix Kconfig dependencies
Date: Wed, 8 Jan 2014 14:29:28 +0100
Message-ID: <20140108132924.GA1592@ulmo.nvidia.com>
References: <1388946171-29459-1-git-send-email-linux@roeck-us.net>
	<20140106153945.GA6721@ulmo.nvidia.com>
	<20140106162055.GA18726@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1663167635=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140106162055.GA18726@roeck-us.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-tegra@vger.kernel.org, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============1663167635==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 08:20:55AM -0800, Guenter Roeck wrote:
> On Mon, Jan 06, 2014 at 04:39:47PM +0100, Thierry Reding wrote:
> > On Sun, Jan 05, 2014 at 10:22:51AM -0800, Guenter Roeck wrote:
> > > arm:allmodconfig fails to build with several undefined drm and host1x=
 symbols.
> > >=20
> > > drivers/gpu/drm/tegra/bus.c:52: undefined reference to `drm_dev_alloc'
> > > drivers/gpu/drm/tegra/bus.c:56: undefined reference to `drm_dev_regis=
ter'
> > > drivers/gpu/drm/tegra/bus.c:67: undefined reference to `drm_dev_free'
> > > drivers/gpu/drm/tegra/bus.c:75: undefined reference to `drm_put_dev'
> > > drivers/gpu/drm/tegra/drm.c:445: undefined reference to `host1x_syncp=
t_get_base'
> > > drivers/gpu/drm/tegra/drm.c:449: undefined reference to `host1x_syncp=
t_base_id'
> > >=20
> > > and so on.
> > >=20
> > > This is caused by DRM=3Dm but DRM_TEGRA=3Dy. DRM_TEGRA is bool while =
DRM is
> > > tristate. DRM_TEGRA can not be set to tristate because it depends on =
unexported
> > > host1x symbols (and possibly others). Fix by updating DRM_TEGRA depen=
dency.
> > >=20
> > > Also, the DRM_TEGRA help text states that it can be built as module.
> > > Remove that text since it is not (or no longer) correct.
> > >=20
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > > ---
> > >  drivers/gpu/drm/tegra/Kconfig |    5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> >=20
> > Hi Guenter,
> >=20
> > I think this should be fixed in latest next, where it is now possible to
> > build the Tegra DRM driver as a module. All needed host1x symbols are
> > exported as well.
> >=20
> > One thing that strikes me as odd, though, is that I've always thought
> > Kconfig would warn if a symbol selected as =3Dy depended on a symbol
> > selected as =3Dm, precisely because of what you describe above. menucon=
fig
> > complains about it pretty loudly as well.
> >=20
> > Oh, but I see that if I change DRM_TEGRA back to be bool, then Kconfig
> > doesn't complain anymore, even if DRM_TEGRA=3Dy and DRM=3Dm. Should that
> > perhaps be considered a bug?
> >=20
> No idea. All I know is that it causes a build failure ;-).
>=20
> Anyway, are there plans to push the patches changing DRM_TEGRA to tristate
> into 3.13 ? This is one of the reasons for arm:allmodconfig to fail. If t=
here
> are no plans to push the patches into 3.13, I think it would make sense
> to send my patch to Linus and apply the tristate changes on top of it.

The patches to change DRM_TEGRA to tristate are part of what is queued
for 3.14. While I agree that having allmodconfig working is a worthwhile
goal in itself for build testing, I'm not sure it warrants a patch this
late in the release cycle that will cause conflicts during the merge
window.

It also seems like there are other issues that prevent allmodconfig to
build successfully on ARM not all of them being as easy to fix as this
one.

Thierry

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzVK0AAoJEN0jrNd/PrOhuUgP/A4QF8tJe8rnNXSH8SzTdm2l
v/eOHr4gGuqyieLvXVZL2mNAIYNUwqwaa/aCVwCJ20fmpgf5pJwSot+R3H0x1u2h
fUzdB/BBk8f/SKiP2zfNQ5i1+Y7Gt9/CojjRwlrkNqUgdwZ/typG2BAN3OQhg1MO
4GqL9ufUadHdqiSQBNlCkZOh6FHQvUNhSKYy7XEKehaD7qP+wJQycLXmEwE26WOe
HYUc6NrQx5O8WmgebXxzSJB8y79/r8lEgnOywog8HTSkFA+f8X2KdrQYcOf4QwPz
KQhOZrNtXJFSXQ2VGxvbi6Syzw+vFrqy1hFXEz5rvYXTykuoqkygmo1r2Rvpx8X8
Yefl1CS3RgFBG0rBgUyIFRxc87wxzrG9RJD+aCo/Cbhumu47qWck5dwWvdxhHuYw
n8e3QqufQdO3VXz0ycsbxCgLnEXEMltZV2kK35/2ysZ6TFaMxqCVeXdeJbpkYUxl
YpyZneZRIEBtKbWk+HtxN6i8Sa2bu8g/ygszxSx7qAzb3bQCwmkcf5bEsUN4YmO4
PebpLg3Eu++MqbzJ0gy9gRn6s9GmcvogWDnDl6yN8zYD4nmfYfcJm/lD0UmdA2wk
ZPlz31ilN0jn2Ijf87Q3+k2Vzj/KYGL9a5t+b0xV8fTX+E1dobNOBpK7adL3uIKv
RKkx9JPpV/cHUGRLhRxH
=XVAF
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--

--===============1663167635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1663167635==--
