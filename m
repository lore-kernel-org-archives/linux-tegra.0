From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 2/7] drm/tegra: Add plane support
Date: Mon, 18 Feb 2013 08:01:19 +0100
Message-ID: <20130218070119.GA31132@avionic-0098.mockup.avionic-design.de>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de>
 <1360771506-17849-3-git-send-email-thierry.reding@avionic-design.de>
 <5121C500.3000000@gmail.com>
 <20130218064002.GA30856@avionic-0098.mockup.avionic-design.de>
 <5121D048.6080202@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5121D048.6080202-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2013 at 02:55:04PM +0800, Mark Zhang wrote:
> On 02/18/2013 02:40 PM, Thierry Reding wrote:
> > On Mon, Feb 18, 2013 at 02:06:56PM +0800, Mark Zhang wrote:
> >> On 02/14/2013 12:05 AM, Thierry Reding wrote:
> >>> Add support for the B and C planes which support RGB and YUV pixel
> >>> formats and can be used as overlays or hardware cursor. Currently
> >>> only 32-bit RGBA pixel formats are advertised.
> >>>
> >>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> >> [...]
> >>> +static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_=
dc *dc)
> >>> +{
> >>> +	unsigned int i;
> >>> +	int err =3D 0;
> >>> +
> >>> +	for (i =3D 0; i < 2; i++) {
> >>> +		struct tegra_plane *plane;
> >>> +
> >>> +		plane =3D devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
> >>
> >> Using "devm_kzalloc" here seems like not a good idea. Everytime plane
> >> disable or crtc disable, we should free "struct tegra_plane" which is
> >> allocated here. But the memory which devm_kzalloc allocates is only
> >> freed when the driver detach. This makes lots of memory can't be
> >> recycled when the plane enable/disable frequently.
> >=20
> > Why would we want to do that? I don't think doing so would even work,
> > since the planes are resources that need to be registered with the DRM
> > core and therefore can't be allocated on-demand.
> >=20
>=20
> I'm wondering if we add power management codes in the future, the
> crtc/plane will be disabled/enabled frequently, e.g: system going to
> suspend state then resume.

In that case it makes even less sense to allocate and deallocate the
plane every time around. However, any optimizations aside, the allocated
memory is passed into the core via drm_plane_init(), which registers
that plane with the given CRTC. So if we deallocate the memory when the
plane when it is disabled, we'd have to make sure to remove it from the
core as well. However that would also mean that it disappears from the
list of planes supported by the CRTC and therefore we wouldn't be able
to use it again.

Thierry

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRIdG/AAoJEN0jrNd/PrOhq0UP/j+XQjVo96FW5FnoQQjE+6Hx
rTRIlkw+8uChUBb1KzDwBgrPUSD13tAyNhn9RDrwC9vPyWY0BAgiMsSckF17beBi
0P4doornSwZU99QgHBlzP8DppDEdps8UNvr45Js0TDm61+XABho/UNsD1oxCX9Ox
LC5JMvZdf8/iID2Z4llsT2kE3mzB6axM6xpFL8/C7MCpZPhkYgXEHY6DKuKpPCV7
QGIUDSag1vp9ZiC+QYzp+TEWECJkm0M8VSXLtSkLhoBvg4MN+TjnXU+EfgwmH133
Mb9bj2ythLpv1Nf7kDGfXefinyFJz16czn9OqhrUP4A9zzS6UKiofn8OvWP/00om
pIc64ZLRLdY/8r2RxzWO7L02AC54HfQ9t3VxlLw5ciO2YyWPIVitdTfQOpYy7yvH
s4hJCYzaFN7HmTer2odqM1FMTOzt/kBDu+xXD+uWFYayqiPbI4ww0bwDXGNze6eD
eJx67jAM05E8tdD9/Wjn6CFV0VrGoHMTz9oTXEvyCUOGPgfcYhPuesl8pwKV8bz3
ewXVmtSxdACUNf+Y2HKuUNhbRFBL1AXIlH38f59BeudreIQ18DDDv9Y82/9cXujU
PaqMg5q3E3mgOFQoJBlAnxXuWszaFas2u34pvBND9VM4O53PuBcDtmK8R/HE+qxe
aEfRCfEtiZ/WPlCIxczK
=cxKy
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
