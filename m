From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Fix Kconfig dependencies
Date: Mon, 6 Jan 2014 16:39:47 +0100
Message-ID: <20140106153945.GA6721@ulmo.nvidia.com>
References: <1388946171-29459-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1388946171-29459-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 05, 2014 at 10:22:51AM -0800, Guenter Roeck wrote:
> arm:allmodconfig fails to build with several undefined drm and host1x sym=
bols.
>=20
> drivers/gpu/drm/tegra/bus.c:52: undefined reference to `drm_dev_alloc'
> drivers/gpu/drm/tegra/bus.c:56: undefined reference to `drm_dev_register'
> drivers/gpu/drm/tegra/bus.c:67: undefined reference to `drm_dev_free'
> drivers/gpu/drm/tegra/bus.c:75: undefined reference to `drm_put_dev'
> drivers/gpu/drm/tegra/drm.c:445: undefined reference to `host1x_syncpt_ge=
t_base'
> drivers/gpu/drm/tegra/drm.c:449: undefined reference to `host1x_syncpt_ba=
se_id'
>=20
> and so on.
>=20
> This is caused by DRM=3Dm but DRM_TEGRA=3Dy. DRM_TEGRA is bool while DRM =
is
> tristate. DRM_TEGRA can not be set to tristate because it depends on unex=
ported
> host1x symbols (and possibly others). Fix by updating DRM_TEGRA dependenc=
y.
>=20
> Also, the DRM_TEGRA help text states that it can be built as module.
> Remove that text since it is not (or no longer) correct.
>=20
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/Kconfig |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Hi Guenter,

I think this should be fixed in latest next, where it is now possible to
build the Tegra DRM driver as a module. All needed host1x symbols are
exported as well.

One thing that strikes me as odd, though, is that I've always thought
Kconfig would warn if a symbol selected as =3Dy depended on a symbol
selected as =3Dm, precisely because of what you describe above. menuconfig
complains about it pretty loudly as well.

Oh, but I see that if I change DRM_TEGRA back to be bool, then Kconfig
doesn't complain anymore, even if DRM_TEGRA=3Dy and DRM=3Dm. Should that
perhaps be considered a bug?

Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSys5BAAoJEN0jrNd/PrOhVxgP/3FUf2TCbDqWr3MG9jtY7CC6
XaP7h6zv/0CPAcDrSecWHAXmEbbqtMlQQNBucqDI0ETmMpRNwdlulvHRD0aI1KfS
D9l8cLHh4gNkc/mrfWW6IzqYUSNZZtC+FxlKmZ4ahSHn7fdEVDq382egdrimPI1L
LD2hUF91SohA2uqWcrVgsucP/vl4xE4XGg17zbvQ2V715MSV82/xwW5aZyEoTOQA
hw/Txz2k9NveehMKLNFAlRr97LpVgGvlKhd7HLH7A5sNDMlqjqTcYalUR4jLxtLs
YavGyWzexvaP08oWnRaYcWt/c+tz25rIHrMnJLv8LO04BifxUxARzQ9juBAE5Aix
GnvthiZmOE5MKNMtX+x+bES6HiQOhcZ2/iuQ6ZgDDJLEQ6eMFS1X6hlJ6ET9EcJG
6hvOgct8xyCbjcuqH356GRr9tSCKImSA3vI65qi0jC9IA2Y0GGJE48wpSYQ6GpB3
yDacvoepTG+DaH/AFhC9nFi8tuJW7nrkYXx70oXgkN+7fkLm8equqxjbrK9S4yXC
aMi8NIe7150PWkoWUvLg0w9eCNurSd455pJ+RzTAuZ93PUXFGXwFnkv/Cecyvv2N
b1s6HearRJRdWGyQDPYu8va1egCYQ9ZsZw+Z3Ps2zTmp6SaFRDy1hXKhPWXZeuUi
+4PdD8U0TTuimVSFuuUH
=SDdE
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
