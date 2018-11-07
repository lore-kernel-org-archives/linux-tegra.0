From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/nouveau: tegra: Initialize mode configuration
Date: Wed, 7 Nov 2018 17:12:27 +0100
Message-ID: <20181107161227.GA6664@ulmo>
References: <20181106162415.3578-1-thierry.reding@gmail.com>
 <20181106164122.GB9144@intel.com> <20181107153409.GA7155@ulmo>
 <CAKb7UvjK5Be7VgcjWi9=DoHcPshN3jUP3044v8sVSDZRmjgd6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1947878648=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvjK5Be7VgcjWi9=DoHcPshN3jUP3044v8sVSDZRmjgd6w@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: linux-tegra@vger.kernel.org, nouveau <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: linux-tegra@vger.kernel.org


--===============1947878648==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 07, 2018 at 10:52:11AM -0500, Ilia Mirkin wrote:
> On Wed, Nov 7, 2018 at 10:34 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Tue, Nov 06, 2018 at 06:41:22PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > On Tue, Nov 06, 2018 at 05:24:15PM +0100, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Irrespective of whether or not the device has any usable outputs, t=
he
> > > > modesetting helpers will try to register all the resources such as =
CRTCs
> > > > and planes. Unfortunately, the helpers rely on drm_mode_config_init=
() to
> > > > properly set up internal data structures. Since the Tegra GPU does =
not
> > > > have a display engine, the Nouveau driver doesn't set this up for T=
egra,
> > > > which results in the following oops on driver probe:
> > >
> > > Remove DRIVER_MODESET ?
> >
> > Yeah, that works as well. Technically I suppose somebody could be
> > instantiating the IP in an SoC and include a display engine, in which
> > case we'd need the DRIVER_MODESET feature again, but I'm not aware of
> > anyone doing that, so it may not be worth planning for that at this
> > point.
>=20
> I thought DRIVER_MODESET was required even for rendernodes. Is that no
> longer the case?

Indeed. Removing the DRIVER_MODESET feature gets the driver to load
properly, but trying to actually use Nouveau (e.g. kmscube) crashes
in other places.

Now that you mention it, I vaguely remember trying to do something
similar a long time ago and I had to split up DRIVER_MODESET into more
fine-grained features (basically DRIVER_MODESET and DRIVER_LEGACY, if
I remember correctly) to avoid crashes. But this must have been three
or four years ago and I can't recall the exact details.

> Note that e.g. GF117 GPUs also don't have a display engine hooked up
> in nouveau (or in hardware).

That's interesting. I think there'd be some symmetric elegance to it if
the PCI driver supported DRIVER_MODESET irrespective of the feature set
of the card and if the platform driver did the same. In the end, this
isn't really a driver-specific feature, but a device-specific feature.
Or to put it another way: the driver inherently supports modesetting
features, irrespective of a device's specific capabilities.

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvjDukACgkQ3SOs138+
s6E+8RAAqeB2WBy0vMJMwcBf6YZmPm6f6we1gcRyoiZ9YpPGwH+pQzAUB4qGW1NO
pb1IIwa92LQt/zn5+bjlkX9jBWzNGQDF354vMruiPlPeO47Ix3dslEAikg6OO9gq
3DtbFzYmNDabk4gmhau/Yf1fr5Se8qTkX9p5L4xDLzRFNgv1EK8HW6jf26yupMYK
oeTs74/bDl4qau0Areh80md/dgZTGN3YdakKxOlH1ea8qFrHw6CuJKhW6PiafPcS
sZKDdlwkBJiBPYmPn9FRTKpXd9Oa8HpYHQqboO6/OFJCP7z1ZmGcrC8QsHgXHt5o
v8qgAzweJtOs+EOSu1QLveBeRt4FI+vq2Ky53bT3ZIos2NNjz2aedNSPmtxczWAx
LPDs/IEWI7ROTQQxQ+Uuah8Aqbvkx/OKg4qhDqtEkeFvCA64sEc2Zi4grt5pZ6yf
fIUElVu3ocxKJxJPlFEJgrkvKfWrNmOqXxnGSkevq87hrjFHhEn0KHg4VfEqee4B
UX53oTGBnamso4BCXUhOuJu9iQol53vKhYYAipF+IV+lGzZE0gTPhYS/kjo5rSbH
G1AZUcbe3cfiOUnQeJ1ip57vnm4zUThABTcTEoE7gGldpORVZ4ABCdfGtpKtb3Q4
+pS+uy1YhafUn7/8Wuo3FPyFDvvpP2SSLVNbaQFn+tW3ZEKE2tY=
=5m+B
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

--===============1947878648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1947878648==--
