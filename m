From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 15:57:12 +0200
Message-ID: <20120626135712.GB1115@avionic-0098.mockup.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <1340714876.1364.10.camel@antimon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1340714876.1364.10.camel@antimon>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2012 at 02:47:56PM +0200, Lucas Stach wrote:
> Hello Thierry,
>=20
> I still haven't found the time to look at device tree things in detail,
> but still some comments inline. Overall I think the tree looks ok and is
> a great thing to get started.
>=20
> Am Dienstag, den 26.06.2012, 12:55 +0200 schrieb Thierry Reding:
> > Hi,
> >=20
> > while I haven't got much time to work on the actual code right now, I
> > think it might still be useful if we could get the device tree binding
> > to a point where everybody is happy with it. That'll also save me some
> > time once I get to writing the code because I won't have to redo it over
> > again. =3D)
> >=20
> > So here's the current proposal:
> >=20
> > 	host1x {
> > 		compatible =3D "nvidia,tegra20-host1x", "simple-bus";
> > 		reg =3D <0x50000000 0x00024000>;
> > 		interrupts =3D <0 64 0x04   /* cop syncpt */
> > 			      0 65 0x04   /* mpcore syncpt */
> > 			      0 66 0x04   /* cop general */
> > 			      0 67 0x04>; /* mpcore general */
> >=20
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <1>;
> >=20
> > 		ranges =3D <0x54000000 0x54000000 0x04000000>;
> >=20
> > 		status =3D "disabled";
> >=20
> > 		gart =3D <&gart>;
> >=20
> Do we really need this here? IMHO the GART is one kind of a IOMMU
> managing a part of the bus where the host1x driver is hanging of. So I
> can't see why we would need a pointer to the gart dev directly.
> Though I may be off here, as I don't grok everything related to the
> initiation order yet, so please correct me if I'm wrong.

If the information about this can be obtained in another way, then we
certainly don't need this here. Hiroshi already pointed out that this
can be handled by the IOMMU API now (I don't think it did back when I
first wrote the code), so I'm all for stripping unneeded properties from
the binding.

One thing we need to keep in mind here is that the DRM driver is not the
only one needing access to memory. There may be other users (V4L, ...)
that need memory from the same pool. Maybe the memory handling should be
done in the host1x driver instead, and the DRM driver could be one of
many users obtaining buffers from it?

> > 		/* video-encoding/decoding */
> > 		mpe {
> > 			reg =3D <0x54040000 0x00040000>;
> > 			interrupts =3D <0 68 0x04>;
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		/* video input */
> > 		vi {
> > 			reg =3D <0x54080000 0x00040000>;
> > 			interrupts =3D <0 69 0x04>;
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		/* EPP */
> > 		epp {
> > 			reg =3D <0x540c0000 0x00040000>;
> > 			interrupts =3D <0 70 0x04>;
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		/* ISP */
> > 		isp {
> > 			reg =3D <0x54100000 0x00040000>;
> > 			interrupts =3D <0 71 0x04>;
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		/* 2D engine */
> > 		gr2d {
> > 			reg =3D <0x54140000 0x00040000>;
> > 			interrupts =3D <0 72 0x04>;
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		/* 3D engine */
> > 		gr3d {
> > 			reg =3D <0x54180000 0x00040000>;
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		/* display controllers */
> > 		dc1: dc@54200000 {
> > 			compatible =3D "nvidia,tegra20-dc";
> > 			reg =3D <0x54200000 0x00040000>;
> > 			interrupts =3D <0 73 0x04>;
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		dc2: dc@54240000 {
> > 			compatible =3D "nvidia,tegra20-dc";
> > 			reg =3D <0x54240000 0x00040000>;
> > 			interrupts =3D <0 74 0x04>;
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		/* outputs */
> > 		rgb {
> > 			compatible =3D "nvidia,tegra20-rgb";
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		hdmi {
> > 			compatible =3D "nvidia,tegra20-hdmi";
> > 			reg =3D <0x54280000 0x00040000>;
> > 			interrupts =3D <0 75 0x04>;
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		tvo {
> > 			compatible =3D "nvidia,tegra20-tvo";
> > 			reg =3D <0x542c0000 0x00040000>;
> > 			interrupts =3D <0 76 0x04>;
> > 			status =3D "disabled";
> > 		};
> >=20
> > 		dsi {
> > 			compatible =3D "nvidia,tegra20-dsi";
> > 			reg =3D <0x54300000 0x00040000>;
> > 			status =3D "disabled";
> > 		};
> > 	};
> >=20
> > This really isn't anything new but merely brings the Tegra DRM binding
> > in sync with other devices in tegra20.dtsi (disable devices by default,
> > leave out unit addresses for unique nodes). The only actual change is
> > that host1x clients are now children of the host1x node. The children
> > are instantiated by the initial call to of_platform_populate() since the
> > host1x node is also marked compatible with "simple-bus".
> >=20
> We should not rely on OF code doing the instantiation of the children,
> as expressed by Grant Likely. [1]

At the end of that email, Grant specifically mentions that using the
simple-bus is one option to instantiate children. Or to add the bus
compatible (nvidia,tegra20-host1x in our case) to the list of busses
when calling of_platform_populate().

However I think if we have a custom bus_type implementation for host1x
anyway, then it makes sense to instantiate the children from that
instead to allow for easier integration.

Thierry

> > An alternative would be to call of_platform_populate() from the host1x
> > driver. This has the advantage that it could integrate better with the
> > host1x bus implementation that Terje is working on, but it also needs
> > additional code to tear down the devices when the host1x driver is
> > unloaded because a module reload would try to create duplicate devices
> > otherwise.
> >=20
> [snip]
>=20
> [1]
> http://www.mail-archive.com/linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg28044.html
>=20
> Thanks,
> Lucas
>=20
>=20
>=20

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP6b+4AAoJEN0jrNd/PrOhldQQAI/3FVrP66jRq2CXAzeimN6h
Q18IHKSY0zdbqB5JuxuCTzn1yvje2loj1pnmp1SCp/iSjVIP6W0f7Bt+ShvkqeRf
+j12XiUsQjGGAqi8+mOPITrbBwHxvYp2bT1PqHgfpFuGBTTiWFfGepy/Y+mxaa8f
mD0cci/efYTGXXHAG3Iya0wwLSFRVaGJEPxSfN4PQqAv3teVHEmDZrisKAhDq7Tp
7SfreWGu4jRSZrxcqTkrb//m1WdfVD7N/i7+7zlrTVkcdVv17MMnQeS5APQvfNJ/
3sQCYinTKOEkokes+wpoVGbUsyupNZ/W+8mOQghAtYzG9RpeKMCvg9Znsz+20Msy
w4kkiEhwYrQYmmIbNNHAYifJPj36ki8kwvFuSAKVVS6QqiKPUO62vmf7siZiN6oy
Q95L0V45Fu86Lx/FVe/kwoFP1BnikN1ab78oqlRcUrQy6/Lo4Jy7z3hqkIUD5iZm
QwpFtIZnJOe+EOKJd8IwrBg52e6NUngotlIR9ZnGD4dDHc3pLnXtrg6038Z91lhV
errkC1wHL4IfK8GaEIpUXX0+Y7sKc7EY5SIgrKU/c6Ep9qEZe8T3H3yuVbQGk6Wh
uUwwNYpqgbx4Qe4lxUhPJs2+khwUBLBkutL3klaRt9Itq/Tm+PakA7tz3Ch2iVOH
e4dNXEXG8DmKD+GB0dCH
=5Ysu
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
