From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Wed, 17 Oct 2012 07:42:24 +0200
Message-ID: <20121017054224.GA21783@avionic-0098.mockup.avionic-design.de>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
 <1350375538.2332.31.camel@markz-hp6200>
 <507D856C.1070708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <507D856C.1070708-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2012 at 10:03:56AM -0600, Stephen Warren wrote:
> On 10/16/2012 02:18 AM, Mark Zhang wrote:
> > Hi,=20
> >=20
> > I've made this drm driver worked on Tegra 3(LVDS and HDMI both).
> > But the code that Thierry
> > hosts(git://gitorious.org/thierryreding/linux.git) doesn't work
> > directly. If you build and run it, you'll get a white blank screen on
> > Tegra 3. I didn't find the root cause but I think this is not caused by
> > drm driver itself(maybe the PCIE codes?). The main symptom is: some
> > regulators can't be inited all the time. I tried to build drm driver as
> > kernel module, after kernel booted, modprobe the drm driver, and you'll
> > find there are a lot of error prints like this:
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [   21.383529] reg-fixed-voltage 1.regulator: Failed to find supply vin
> > [   21.390299] reg-fixed-voltage 1.regulator: Failed to register
> > regulator: -517
> > [   21.397645] platform 1.regulator: Driver reg-fixed-voltage requests
> > probe deferral
> > [   21.405604] platform 2.regulator: Driver reg-fixed-voltage requests
> > probe deferral
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This is normal; it's probe deferral. You'll find that those regulators
> initialize correctly later. Hopefully tegra-drm handles this correctly,
> and passes that error code through as the result of its probe.

I presume those regulators are for the vdd and pll supplies of the HDMI
output? Those should be properly handled by the tegra_hdmi_probe()
function. Also the way tegra-drm works right now, unless all of the
outputs are registered properly the DRM portion will never even be
initialized.

Thierry

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQfkVAAAoJEN0jrNd/PrOhW/IQAKSqp2MdBDdCvCJfAQsZ+KCQ
BFnUR0WM2/mY3Y7eNunxbTK/WywJvq5AImaUv+EEcGDalTjMlS0gee/rk/CHtxwY
lYS2PAwmhUtnKxHH+BoRkLO+Jy3y0zaxGhR/jAFu4IR32mGiRlyasgmdkWdcuOb0
YzH6AFFPX92YDdfw+8rzUOwqM2d8uzm9O1HWT0wH50+du70IH23gdCO9TPUqqBCI
AauDY4i6O8D9IQxsci+cCuYDAjwdteAXSRez/C+TjQbCZCOyv762Jz2P2eQWdBZw
kN803b2rxANRjRZMHabs2en48omgEux50DaMBS69vVTfdAz8vHs19BH3kmH+eI5V
e4dnzkLmAClccwFJoD7KqkJa15BgL4LWEh+fC5tP+Y0RvHSM8YettFvkbg2qdCe3
QdJS7FkkIz2m+UjpNe58hMukOC925xqIcjFFiO+tyDhset47NkCvWe6fX26lRpO3
sVmBDWoYGmmZ6goy18ZEDF6/oztDEc6LGIigLBNsygRnRGefkYgsyszNTxkN/u54
554FgDIE8xkt6Bc6uFdglmPYOtvhpQp2OQqIzBTPCW8I9FkX37LHMLrac3nUfHaU
FQ0MvskXEfds2vLbnzXIC6vgVgrKmRBFGMHyRiO6b/nLKVNkGZmMauA0c98qb3gt
Kp9eA1ET3xi+lLaRbpMu
=+wZg
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
