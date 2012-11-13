From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: Add NVIDIA Tegra20 support
Date: Tue, 13 Nov 2012 11:05:27 +0100
Message-ID: <20121113100527.GB982@avionic-0098.mockup.avionic-design.de>
References: <1352757358-14001-1-git-send-email-thierry.reding@avionic-design.de>
 <1352757358-14001-2-git-send-email-thierry.reding@avionic-design.de>
 <50A1F3A3.40905@nvidia.com>
 <20121113074822.GA8409@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121113074822.GA8409-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 08:48:22AM +0100, Thierry Reding wrote:
> On Tue, Nov 13, 2012 at 03:15:47PM +0800, Mark Zhang wrote:
> > On 11/13/2012 05:55 AM, Thierry Reding wrote:
[...]
> > > +int tegra_output_init(struct drm_device *drm, struct tegra_output *o=
utput)
> > > +{
> > > +       int connector, encoder, err;
> > > +       enum of_gpio_flags flags;
> > > +       struct device_node *ddc;
> > > +       size_t size;
> > > +
> > > +       if (!output->of_node)
> > > +               output->of_node =3D output->dev->of_node;
> > > +
> > > +       output->edid =3D of_get_property(output->of_node, "nvidia,edi=
d", &size);
> > > +
> > > +       ddc =3D of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus=
", 0);
> > > +       if (ddc) {
> > > +               output->ddc =3D of_find_i2c_adapter_by_node(ddc);
> >=20
> > The i2c adapter may not be ready at this time. For Tegra 2, the I2C bus
> > for HDMI is not dedicated and we need the i2cmux driver loaded before
> > this i2c can be used. It proved that sometimes i2cmux driver loads after
> > drm driver.
> >=20
> > So we need to add some logics to support driver probe deferral here.
> > Anyway, I'm just want you know about this and we can improve this later.
>=20
> Good point. Unfortunately tegra_output_init() isn't always used from
> within .probe(), so it isn't quite easy to handle deferred probe here.
> I'll have to take a look at how to solve this properly.

After a closer look at this I think what should be done here is split up
tegra_output_init() into a tegra_output_parse() that does the DT parsing
and tegra_output_init() that actually initializes the output.

I'll try to implement something like that for the next version.

Thierry

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQohtnAAoJEN0jrNd/PrOhHVIP/2FY1h7O30G9SvHRHDvFXKKm
ZPfCeoSPxyHu+cE4qVNn084NHttrYVuAcn1GUa4WeULVXP6RxGowKX2tAk1Ty/TQ
PHZ9A4i2cQeG8NwP0c14AC1cEfJ0Td5ry0RFdjBWdjXgRS+qXWo1n+Xk+Rpljve9
2Xi650YzOzdie8QIFaR7TkaiHAlkckhdts74oZBdsHAv4D+u1nvdb9UVd8Bx2K8C
kL47mfzHjpFB3s7G17LbBZC8kssxzCpkOGhhGu8t7zHSLHqOcCtGKbxsTcCwiK7L
Usxjb/+B/I59GexjkZ7wsiMiiQyWgjFtxVYfU9mrnQFhGNDo/SLStU8E5xQ8iHGd
u6uYHxCz8OGwjPlwDsb7HIvmCozA/gpBjE69tzV4RDUNyQGReqL/bPIAXxLv1Ti3
4FHhxwaZYPFix42EnQCLMkcaHn20RHwdwvUVPXIrGdWmIbo8SFF0Z+YN3Np8M1St
8OFRr+sSv4AHry/TLXD6AZBWXpJCgaxRiTSpbCPi/ZWoTSbXSlg2AjqgECvXg5XN
m8ZtdBJZ0edlo1fWcWSOXisnLXAnjhqzlSlEirE5s7JNvGDFqJAQSuNrDlEtuGz7
SIeYNmCHwmh2u0oiecf7muH4yKcxE0Gr5P1Av+XzIUlzhnppGWlueYOmrmzBCXXH
l4sgPAqi7NUwr0w+NXZe
=5RWK
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
