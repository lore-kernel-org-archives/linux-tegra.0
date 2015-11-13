From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: phy: tegra-xusb-padctl: Add Tegra210
 support
Date: Fri, 13 Nov 2015 17:32:39 +0100
Message-ID: <20151113163239.GB7219@ulmo>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
 <1446657109-15568-3-git-send-email-thierry.reding@gmail.com>
 <563A71C7.9030002@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <563A71C7.9030002-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2015 at 01:59:51PM -0700, Stephen Warren wrote:
> On 11/04/2015 10:11 AM, Thierry Reding wrote:
> >From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> >Extend the binding to cover the set of feature found in Tegra210.
>=20
> >diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-pad=
ctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt
>=20
> >+PCIe pad:
> >+---------
> >+
> >+Required properties:
> >+- clocks: Must contain an entry for each entry in clock-names.
> >+- clock-names: Must contain the following entries:
> >+  - "pll": phandle and specifier referring to the PLLE
> >+- resets: Must contain an entry for each entry in reset-names.
> >+- reset-names: Must contain the following entries:
> >+  - "phy": reset for the PCIe UPHY block
>=20
> I don't recall any clocks or resets properties in the pads for Tegra124. =
Do
> we really not need any?

Tegra124 had two instances of what used to be called IOPHY, one for PCIe
and one for SATA. On Tegra210 these have been replaced by two instances
of what's called UPHY. The resets listed in the PCIe and SATA pad nodes
are wired to those UPHY instances, hence why they are new on Tegra210.

For Tegra124 no resets exist for the IOPHY instances.

> >+SATA pad:
> >+---------
> >+
> >+Required properties:
> >+- resets: Must contain an entry for each entry in reset-names.
> >+- reset-names: Must contain the following entries:
> >+  - "phy": reset for the SATA UPHY block
> >+
> >
> >  PHY nodes:
>=20
> Nit: 2 blank lines there.

Those were intentional for additional spacing between sections.

> >+For Tegra210, the list of valid PHY nodes is given below:
> >+- utmi: utmi-0, utmi-1, utmi-2, utmi-3
> >+  - functions: "snps", "xusb", "uart"
> >+- hsic: hsic-0, hsic-1
> >+  - functions: "snps", "xusb"
> >+- pcie: pcie-0, pcie-1, pcie-2, pcie-3, pcie-4, pcie-5, pcie-6
> >+  - functions: "pcie-x1", "usb3-ss", "pcie-x4"
> >+- sata: sata-0
> >+  - functions: "usb3-ss", "sata"
>=20
> usb2-bias also needs to be present.

I'm not sure about this. All of the driver code that I've looked deals
with the usb2-bias pad internally. As far as I can tell, this pad needs
to be configured to whatever any of the other pads is configured for. I
think that means if any of the UTMI pads is configured for XUSB then the
usb2-bias pad must also be configured for XUSB. Which would also imply
that if one of the UTMI pads is configured for XUSB, all of them must be
configured for XUSB.

It's also not a pad in the sense that the others are pads. It doesn't
directly connect anywhere. It's also shared by all the UTMI pads. That
said, there are two registers that allow some of the parameters of the
pad to be set, so perhaps adding the node exclusively for
configurability might make sense.

It wouldn't really be a PHY node, though, so wouldn't fit into the above
group. Perhaps something like the following could be added:

  There is an additional pad that is used to support the bias voltages
  to the USB2/UTMI pads. This is not a PHY that can be consumed by any
  I/O controller, but the device tree node can be used to specify
  parameters needed for the programming of the pad.

I think the function shouldn't necessarily be exposed as a parameter,
because all that would do is add the possibility for a conflicting set
of mux options with the USB2/UTMI pads.

> >+
> >+
> >  Port nodes:
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Nit: 2 blank lines there.
>=20
> >+For Tegra210, the XUSB pad controller exposes the following ports:
> >+- 4x UTMI: utmi-0, utmi-1, utmi-2, utmi-3
> >+- 2x HSIC: hsic-0, hsic-1
> >+- 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
> >+
> >
> >  Examples:
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Nit: 2 blank lines there.

Again, those were intentional for readability. I can remove them if you
don't think they fulfil that purpose.

Thierry

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWRhClAAoJEN0jrNd/PrOhmu8P/1lal/GNHBWzAniaB5usRAOW
OTs5EFuS3nCXtxORd9Tmoa0I402PXg7fCWBO6+zGdNaCHV4/vXVzk0DGZ6U8xUgJ
41R2gZfsrooPXuxutO/tPtjLLA+gLSZBMOYZ17ZDSoYG7PptDDgLwY46PhzAVP7X
NNfMWQWbUgm4p44gfxa08VFcLN/0X+6k/4AHai4o2oPrdpa3ickS0En9Au0m/Gjw
wFeZK9/fE4aO9A1N4jIsi40UdbU3AZm/HiWWi0bpproqaTpjWl6zeEN3jtFo3+0J
idrsekQoKCA0TG778c1QnbNkTStCZvNjDzv+fS/Wqd+RqgrmmDqhN14toGLfGeOG
z9h6odJI/jTTXjp1VJWFE6ZW5Y77Nx1pu5ZLDBBPdiAEhMEZ3SE5fTFG0e5z+z5y
vQlqmIpWG5tIGtlWkBL00+rBJd1JJOKpJa9G60W7DxSIDJjnmqkddgesEpnwIIMG
bbZ0XJneKdNnBgtLk+8KFaJM3fLEDGHlfbJL38wWuI9ddwFH7Poy8A6HJK/NkknX
Im8Af7773ju2fRf0+MnqIB4fw+dlVpyrasjpJiYxMWxkxPpqOcDG7gX78JBSZtHG
v5vb4mkCtfCtyYP/aM3LT3ZaFv5prcDGijLM38I2PT5OPRQfVNakJbGQtDTVIS2u
71FXtUDHKXGfbX9+cemV
=d+xI
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
