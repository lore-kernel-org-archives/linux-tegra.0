From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] drm/tegra: Add zpos property for cursor planes
Date: Wed, 17 Jun 2020 18:37:24 +0200
Message-ID: <20200617163724.GA3547875@ulmo>
References: <20200616181449.3147258-1-thierry.reding@gmail.com>
 <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
 <20200617141015.GB3536291@ulmo>
 <cef8e371-03a8-455e-561d-fca9d0b88309@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cef8e371-03a8-455e-561d-fca9d0b88309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 05:20:14PM +0300, Dmitry Osipenko wrote:
> 17.06.2020 17:10, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jun 16, 2020 at 09:39:19PM +0300, Dmitry Osipenko wrote:
> >> 16.06.2020 21:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>
> >>> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> >>> have a zpos property") a warning is emitted if there's a mix of planes
> >>> with and without a zpos property.
> >>>
> >>> On Tegra, cursor planes are always composited on top of all other
> >>> planes, which is why they never had a zpos property attached to them.
> >>> However, since the composition order is fixed, this is trivial to
> >>> remedy by simply attaching an immutable zpos property to them.
> >>>
> >>> v3: do not hardcode zpos for overlay planes used as cursor (Dmitry)
> >>> v2: hardcode cursor plane zpos to 255 instead of 0 (Ville)
> >>>
> >>> Reported-by: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>> ---
> >>>  drivers/gpu/drm/tegra/dc.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> >>> index 83f31c6e891c..04d6848d19fc 100644
> >>> --- a/drivers/gpu/drm/tegra/dc.c
> >>> +++ b/drivers/gpu/drm/tegra/dc.c
> >>> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_cr=
eate(struct drm_device *drm,
> >>>  	}
> >>> =20
> >>>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs=
);
> >>> +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
> >>> =20
> >>>  	return &plane->base;
> >>>  }
> >>>
> >>
> >> Looks nice, thanks! Since you dropped all other zpos changes for other
> >> planes and given that the other planes have 255 for the max zpos, what
> >> about to set the cursor's zpos to 256?
> >=20
> > I'd prefer to have all of the planes' zpos within the same range. By
> > default the other planes will be on the very bottom end of that range
> > and the atomic core will normalize the zpos for all planes anyway, so
> > the cursor plane will end up with a very small normalized zpos in the
> > end.
> >=20
> > The zpos documentation already mentions that the behaviour is undefined
> > if two planes have the same zpos value, so I think userspace is going to
> > know how to set these anyway.
> >=20
> > It might be worth to do a follow-up patch that is smarter about setting
> > the range of valid values. 0-255 is true on later chips where we
> > actually have a proper "layer depth" register field and I wanted this to
> > be uniform across all generations. Other drivers seem to set the upper
> > limit on the zpos range to be equal to the number of planes available,
> > so that there aren't potentially big gaps in the numbering. That said,
> > since the core already normalizes the zpos for us, I don't see a big
> > benefit in explicitly clipping the range.
>=20
> But the cursor plane doesn't use the "layer depth" register, doesn't it?
> So the zpos over 255 shouldn't matter in this case.
>=20
> I know that DRM should normalizes the given zpos, but still it makes me
> a bit uncomfortable knowing that there are the ranges overlap visible to
> userspace :)

Userspace has to be able to deal with this anyway because it can't make
any assumptions about what hardware supports underneath. A cursor on a
different platform may very well be stackable anywhere in the layout so
it must ensure that the cursor always has the highest zpos (provided
that that's what it wants). Immutable 255 basically just says that the
cursor is always going to be at the top. /If/ userspace then decides to
set some other plane's zpos =3D 255, then we're in the "undefined"
behaviour case that the documentation mentions, in which case the
behaviour on Tegra would still be sane in showing the cursor on top.

So I don't think there's really an issue with the overlap.

Thierry

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qRsEACgkQ3SOs138+
s6F/SQ/9FjgGZOAspRcVYP7wA5WZaMEpquc/ibUS8bCVYfIqr8SBd02PZ/n7EoKX
uECe9VEcOEkXHrDt0SIuO7cIZC/YDun16O+sZDvv7sTGOhf8ObmLS5Nvstvs35s2
a8DA/S2EvGZFXJ/NXurj66N71GFTVv+tBTTUSkik2pgYu2wMN2M5TcPW/YOycd4g
X1VZlg78ibN4tAEpRT14u25KILDHaJJSAqIOQiovaeykl/BcsSUS4AgDY8eNN4xN
V8NJaLpPmcceiiKxsMukpszsNqCDteIE5Dqgd7Dcyfgl5N//QL/ZJnzG+jr1JSMN
uKUDB/Py0cPDtHj5+jfEK5NnopHzi3fICJ8LNpwvXsRKMQpAPKvNINXXf/KYEful
WYuBfOfLog3gAWEeWCNjDSWu5U0SPmhMMjobMQIx5jqIqWMkyEQv632ucAd7SMQ/
A3yWQctz9dB61JXxRYPfijpj/9DQa/uh6RFdbUc55dl1zljfgn5eh6gCaXKiS0yu
iqRUrfjU3+n7w2e0bPYEpuKpuIWvTNnq9w84HoJ6rBj+ymvcKsIdi6BcN24iq50T
kh6MQDNDMv3QtmeTsJer+rHQLfaldhywBMWdOuZDi27adKThQnkIiSx7A29d36/n
KISfcBZ1vONIix6uZMLY2kpK94YgZEnFKk/1ic7erzCeLQoLmdU=
=bVhH
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
