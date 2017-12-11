From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/tegra: Support disabled CONFIG_PM
Date: Mon, 11 Dec 2017 15:27:27 +0100
Message-ID: <20171211142727.GA19922@ulmo>
References: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx@gmail.com>
 <02bccd8c39c0e7e9d3c6733e238e291e8297c830.1512947732.git.digetx@gmail.com>
 <20171211101343.GG10671@ulmo>
 <f04f7268-bcf8-feab-bded-88a166b3b474@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f04f7268-bcf8-feab-bded-88a166b3b474-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 04:53:56PM +0300, Dmitry Osipenko wrote:
> On 11.12.2017 13:13, Thierry Reding wrote:
> > On Mon, Dec 11, 2017 at 02:19:44AM +0300, Dmitry Osipenko wrote:
> >> Add manual HW power management to drivers probe/remove in order to
> >> not fail in a case of runtime power management being disabled in kernel
> >> config.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  drivers/gpu/drm/tegra/dc.c   | 164 +++++++++++++++++++++++++++-------=
---------
> >>  drivers/gpu/drm/tegra/dsi.c  | 138 +++++++++++++++++++++-------------=
--
> >>  drivers/gpu/drm/tegra/hdmi.c |  90 ++++++++++++++++--------
> >>  drivers/gpu/drm/tegra/sor.c  | 103 +++++++++++++++++----------
> >>  4 files changed, 310 insertions(+), 185 deletions(-)
> >=20
> > I think that's the wrong way around. We unconditionally select PM on
> > 64-bit ARM already, and I think we should do the same on 32-bit ARM.
> > There's really no excuse not to enable runtime PM these days.
>=20
> What is the rational behind enabling PM unconditionally? It is actually a=
 very
> useful debug feature when there is something wrong with the PM. It looks =
like
> Tegra DRM driver is the only driver on Tegra that doesn't work properly w=
ith PM
> being disabled. Please, let's just fix it.

What's useful about disabling PM? The problem with allowing !PM is that
it adds one more combination that needs to be build- and runtime tested.
It also means we need to have extra code in the drivers to enable the
device when runtime PM is disabled. This is all a lot of extra effort
for little to no benefit.

Also, runtime PM is an integral part of mode setting in Tegra DRM, so I
would be suprised if things still work reliably after this patch. RGB,
DSI and HDMI might work properly, but the SOR is unlikely to work after
this because the only way to get it to reliably set a mode is by using
the full runtime suspend/resume cycle.

Thierry

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloulcoACgkQ3SOs138+
s6H06Q/+IuwvBZzom9RPxZ3/ndDFxK4pH4tmL3iKtw75Jw1tmV+nPMz23t2/Y0SN
gc++xGgwAXCM/vJIZTMtu+AtKVKLEuukHSY4Srnt+nKwNSZ89X8JKckPnK7OcJ6C
+6cxBGJde1HSrO90UzYJTsUZQpsgLHo4oPZlz1+N1CSJlI1ZRFxhwMX7Z9hEVzx6
5qCfWT0y+nO52OvJZlvd4xd5MKmZ7ltoJpy3FewzWmGnxUJmjCwuus+ReF6ihBdH
Nd0qi28aCHLTLDLeS4BEpXqMKPrvXWs9k4ZEp6sShZ76zsgdPunBGLDRU/KfIxwT
g+3olDjeZDBtba0Mlgas6F6nmNXKC7MS7VlsEEAm/vZ6CJssQdOO6PArFgA1CiHh
ck4c2ksn6lE6g8LbRFoQaHJ6p8Wd+75PpGmK5/1vTQg1ubqqnzPWQPyq80QhOo2B
MVK4UfmII3gGlTAJVPwcOzpNMpcksD4qPBVsdZn/Tzx70simIlZs0HmXojlahgCn
spv2EvlbJo/GoBm7Av15UE7+SZstXHfeAhNJOsTeePwOk4vm+WT1/LXB3uBabDXO
FyB2y+DXRzHmBR3TqFzwlY1X2paxn2/uVycHGyV3TvNYc/MUT1zEw6snPW0Lox2d
jVsgThdmLVEBaymMPPrqs3m6LUt5xlv9hibnNa/HKaDu1gEZqjI=
=s2Hd
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
