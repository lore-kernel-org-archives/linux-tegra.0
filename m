From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: dsi: Add suspend/resume support
Date: Fri, 19 Dec 2014 16:30:53 +0100
Message-ID: <20141219153051.GA5046@ulmo.nvidia.com>
References: <1418020850-7664-1-git-send-email-markz@nvidia.com>
 <CAOw6vbKegB8cgmqgRit+XdvYNtdEXy3Pcv5=1bYSCJv4v1F2AQ@mail.gmail.com>
 <5487AB39.1050706@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5487AB39.1050706-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2014 at 10:08:57AM +0800, Mark Zhang wrote:
> On 12/10/2014 03:29 AM, Sean Paul wrote:
> > On Sun, Dec 7, 2014 at 10:40 PM, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
[...]
> >>
> >>         err =3D clk_set_rate(dsi->clk_parent, plld);
> >>         if (err < 0) {
> [...]
> >> +
> >> +       drm_modeset_lock_all(tegra->drm);
> >> +       list_for_each_entry(connector, &tegra->drm->mode_config.connec=
tor_list,
> >> +                           head) {
> >> +               if (connector->funcs->dpms)
> >> +                       connector->funcs->dpms(connector, connector->d=
pms);
> >> +       }
> >> +       drm_modeset_unlock_all(tegra->drm);
> >> +
> >> +       drm_helper_resume_force_mode(tegra->drm);
> >> +
> >> +       return 0;
> >> +}
> >> +#endif
> >=20
> > So this is the tricky chunk, it definitely does not belong here. I
> > think it makes most sense for this to live in drm.c, however
> > host1x_driver doesn't have suspend/resume hooks.
> >=20
>=20
> Agree. drm.c is the best place for putting this.
>=20
> > I suspect the correct thing to do here is to add them to
> > host1x_driver, but I'm not sure how much effort is involved in doing
> > that.
> >=20
>=20
> I thought about this before. If we do it in host1x driver, IIUC, it
> means that when host1x starts suspending, it will suspend all host1x
> client devices, right? Honestly I feel this is not a good thing despite
> I can't tell what's the problem in this right now...

I've just sent out patches for review that add the missing
infrastructure to properly do suspend/resume. The idea behind this is
that the DRM host1x device's ->pm_ops are responsible for dealing with
the suspend/resume at a subsystem level (call connectors' ->dpms()
callbacks, etc.) whereas more fine-grained suspend/resume can further be
done in the ->pm_ops of the individual subdevices. The infrastructure
makes sure that these get called in the right order.

Thierry

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUlESrAAoJEN0jrNd/PrOhn8AQAJ40QmbuFlOyDC/nAwcngQbT
5N022Dz019tonxIrPDYLNgNKX9EqasGV3aTEqb8woewg2IYQxMB1A3sReSOa/jqR
+0NnQdi2lZWLuN5wMSWADjkNMHhD41GQNHDlAz6Xi+gDdiCL/AROaiLmlZiII4ah
lUA0kCuUUpfshcV8nlCXps8hnuWm8klHvG344xKiDV5GKO21HSqiihqq8PgelFNI
cVTPqCtXUdFUpvvZzKBpwgOtswFS9Rht6tGqmCCYkyvCcV9v0fx5wqAjCo1rA0xr
/31w0fftem19WTpnuvfPOD6YqebXsupiaBQ5zkpGVjtSe65Bj26fuGc6tkkz9esJ
qF9k4rYcbxazw7w3fpRobxDdicFKR/+y+PakA8YJ0RGCRZiW31DydaSynAMsP9Ah
zMGRRqDm2aJxct5xg4KhOSDoM5EWO01CA3S6oyCxfpZwepHzqgIikedJo61DXUYJ
DVThZ1nQrrOxyiEU5a+W3G1pvHcJEzP+m6rnXMd6Piqq/NFeuJ4U1S8q7GAXNFlj
eNmrsbypjzfKd7RrPdoPYJwAhWtjj72uoNsg2LfKtbCkf+tObHm6IChGnHQFMOQ7
2hyuLje1RCu8fDZhRGmtYODjwCQlQZDvXBbw27pvprKlCKz2On5Xv6bOEUnUzR+U
3A5iIvHjxFdYKfrlqEAS
=9VxR
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
