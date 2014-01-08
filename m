From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Fix Kconfig dependencies
Date: Wed, 8 Jan 2014 15:01:39 +0100
Message-ID: <20140108140137.GA21974@ulmo.nvidia.com>
References: <1388946171-29459-1-git-send-email-linux@roeck-us.net>
 <20140106153945.GA6721@ulmo.nvidia.com>
 <20140106162055.GA18726@roeck-us.net>
 <20140108132924.GA1592@ulmo.nvidia.com>
 <52CD573C.4020501@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52CD573C.4020501-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2014 at 05:48:44AM -0800, Guenter Roeck wrote:
> On 01/08/2014 05:29 AM, Thierry Reding wrote:
> >On Mon, Jan 06, 2014 at 08:20:55AM -0800, Guenter Roeck wrote:
> >>On Mon, Jan 06, 2014 at 04:39:47PM +0100, Thierry Reding wrote:
> >>>On Sun, Jan 05, 2014 at 10:22:51AM -0800, Guenter Roeck wrote:
> >>>>arm:allmodconfig fails to build with several undefined drm and host1x=
 symbols.
> >>>>
> >>>>drivers/gpu/drm/tegra/bus.c:52: undefined reference to `drm_dev_alloc'
> >>>>drivers/gpu/drm/tegra/bus.c:56: undefined reference to `drm_dev_regis=
ter'
> >>>>drivers/gpu/drm/tegra/bus.c:67: undefined reference to `drm_dev_free'
> >>>>drivers/gpu/drm/tegra/bus.c:75: undefined reference to `drm_put_dev'
> >>>>drivers/gpu/drm/tegra/drm.c:445: undefined reference to `host1x_syncp=
t_get_base'
> >>>>drivers/gpu/drm/tegra/drm.c:449: undefined reference to `host1x_syncp=
t_base_id'
> >>>>
> >>>>and so on.
> >>>>
> >>>>This is caused by DRM=3Dm but DRM_TEGRA=3Dy. DRM_TEGRA is bool while =
DRM is
> >>>>tristate. DRM_TEGRA can not be set to tristate because it depends on =
unexported
> >>>>host1x symbols (and possibly others). Fix by updating DRM_TEGRA depen=
dency.
> >>>>
> >>>>Also, the DRM_TEGRA help text states that it can be built as module.
> >>>>Remove that text since it is not (or no longer) correct.
> >>>>
> >>>>Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> >>>>---
> >>>>  drivers/gpu/drm/tegra/Kconfig |    5 +----
> >>>>  1 file changed, 1 insertion(+), 4 deletions(-)
> >>>
> >>>Hi Guenter,
> >>>
> >>>I think this should be fixed in latest next, where it is now possible =
to
> >>>build the Tegra DRM driver as a module. All needed host1x symbols are
> >>>exported as well.
> >>>
> >>>One thing that strikes me as odd, though, is that I've always thought
> >>>Kconfig would warn if a symbol selected as =3Dy depended on a symbol
> >>>selected as =3Dm, precisely because of what you describe above. menuco=
nfig
> >>>complains about it pretty loudly as well.
> >>>
> >>>Oh, but I see that if I change DRM_TEGRA back to be bool, then Kconfig
> >>>doesn't complain anymore, even if DRM_TEGRA=3Dy and DRM=3Dm. Should th=
at
> >>>perhaps be considered a bug?
> >>>
> >>No idea. All I know is that it causes a build failure ;-).
> >>
> >>Anyway, are there plans to push the patches changing DRM_TEGRA to trist=
ate
> >>into 3.13 ? This is one of the reasons for arm:allmodconfig to fail. If=
 there
> >>are no plans to push the patches into 3.13, I think it would make sense
> >>to send my patch to Linus and apply the tristate changes on top of it.
> >
> >The patches to change DRM_TEGRA to tristate are part of what is queued
> >for 3.14. While I agree that having allmodconfig working is a worthwhile
> >goal in itself for build testing, I'm not sure it warrants a patch this
> >late in the release cycle that will cause conflicts during the merge
> >window.
> >
> >It also seems like there are other issues that prevent allmodconfig to
> >build successfully on ARM not all of them being as easy to fix as this
> >one.
> >
>=20
> All other problems are being addressed.

Okay, if this is indeed the only remaining issue then I think it makes
sense indeed to go through the trouble of fixing it right away rather
than waiting for 3.14.

> If arm:allmodconfig is not pursued as buildable, trying to build it is wo=
rthless,
> and I'll drop it from my list of test builds for -stable. Thanks for lett=
ing me know.

Right, I hadn't considered -stable builds and this is an issue that's
new in 3.13, isn't it? In that case, and since this is the only
remaining issue, the above patch:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Dave, since this is a single patch for 3.13 it might be easier for you
to pick it up directly rather than have me send out a pull request.
Either way is fine with me, though.

Thierry

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzVpBAAoJEN0jrNd/PrOhW4oQAKEwaSRshGyiK2MRbn4ZHhB8
KsAIdKNZo5WmWxXz2rZ6GTfI1B8DlrXjE7yypalZac/oZ04ZCAMAMXAgpoiSIzb0
neoZVvm+naO2NSzYNW1+mNDJIkbmaEhcY7Qn7wwG8yL+uJvF2TdMynsZkUT/pMdf
nzEIwe+HE8O1/WUcUWVJz9asu5g9X7CcFTZ9Poh/NEjQLmP1pHORGp8PYSzkTNEi
7GT97xtvDbW72dSIM/DeS6wqTtco8sS7yIfVJumvmvVCB8XjXMPE8OpixWQJvfJc
KcoBC0hx1xAN3c0JjlBeAw85MowTRFKFMs1Lx4y79BbDYhbIpo8D3MXmvwDAqpKr
y+7LrsJCuYgEulsZzpgNPhhKyw0v9OHJxZdqADg5SaYlZkKBTddEEPNMbbzuzmhi
WAsVXNUdfJUvFpEFA0YkXZnP2mXzWMUrq+Ny0fnDpTTyNp9LB3BEL92Lq+YHPo4a
eYuJR4TuAG4ovSbl4thGmtzP2zSOz8536Mh/e6eQn+uY7Uuw+c6OtZAvm0drlWb2
qYCv2vI4ZQ0tDeteP6Aop1Z5sSXmnoOtvBhaRlGYG5ctqxbQ+gjLRHFr/6q1itq4
61e2Vnus4W1qlcfh6fpSjPPOQLovGx9vmlWFbAdFlPJubqskrlSDJ37Eezayi6tj
5FYkUIr/cuLF/GMUJAZW
=oSO/
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
