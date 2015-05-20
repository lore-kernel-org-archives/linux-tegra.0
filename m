From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 4/9] mfd: Add binding document for NVIDIA Tegra XUSB
Date: Wed, 20 May 2015 16:52:29 +0200
Message-ID: <20150520145227.GA3787@ulmo.nvidia.com>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
 <1430761002-9327-5-git-send-email-abrestic@chromium.org>
 <20150513143954.GA3394@x1>
 <55544CC5.9050001@nvidia.com>
 <20150514074058.GA22418@x1>
 <CAL1qeaEqNejuGkN-ke11mtWnaaRo+XieCBkQ6+NQ-Afym6uxVA@mail.gmail.com>
 <CAL1qeaHy0h7bXhuLHh4AG2Zfu48JYeawgVo4dp_k4oX8YFw6tA@mail.gmail.com>
 <20150520063551.GD3627@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150520063551.GD3627@x1>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2015 at 07:35:51AM +0100, Lee Jones wrote:
> On Tue, 19 May 2015, Andrew Bresticker wrote:
>=20
> > Lee,
> >=20
> > On Thu, May 14, 2015 at 10:38 AM, Andrew Bresticker
> > <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > > On Thu, May 14, 2015 at 12:40 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wr=
ote:
> > >> On Thu, 14 May 2015, Jon Hunter wrote:
> > >>
> > >>> Hi Lee,
> > >>>
> > >>> On 13/05/15 15:39, Lee Jones wrote:
> > >>> > On Mon, 04 May 2015, Andrew Bresticker wrote:
> > >>> >
> > >>> >> Add a binding document for the XUSB host complex on NVIDIA Tegra=
124
> > >>> >> and later SoCs.  The XUSB host complex includes a mailbox for
> > >>> >> communication with the XUSB micro-controller and an xHCI host-co=
ntroller.
> > >>> >>
> > >>> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > >>> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > >>> >> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > >>> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > >>> >> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > >>> >> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > >>> >> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > >>> >> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >>> >> ---
> > >>> >> Changes from v7:
> > >>> >>  - Move non-shared resources into child nodes.
> > >>> >> New for v7.
> > >>> >> ---
> > >>> >>  .../bindings/mfd/nvidia,tegra124-xusb.txt          | 37 +++++++=
+++++++++++++++
> > >>> >>  1 file changed, 37 insertions(+)
> > >>> >>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia=
,tegra124-xusb.txt
> > >>> >>
> > >>> >> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,tegra1=
24-xusb.txt b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt
> > >>> >> new file mode 100644
> > >>> >> index 0000000..bc50110
> > >>> >> --- /dev/null
> > >>> >> +++ b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb=
=2Etxt
> > >>> >> @@ -0,0 +1,37 @@
> > >>> >> +NVIDIA Tegra XUSB host copmlex
> > >>> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>> >> +
> > >>> >> +The XUSB host complex on Tegra124 and later SoCs contains an xH=
CI host
> > >>> >> +controller and a mailbox for communication with the XUSB micro-=
controller.
> > >>> >> +
> > >>> >> +Required properties:
> > >>> >> +--------------------
> > >>> >> + - compatible: For Tegra124, must contain "nvidia,tegra124-xusb=
".
> > >>> >> +   Otherwise, must contain '"nvidia,<chip>-xusb", "nvidia,tegra=
124-xusb"'
> > >>> >> +   where <chip> is tegra132.
> > >>> >> + - reg: Must contain the base and length of the XUSB FPCI regis=
ters.
> > >>> >> + - ranges: Bus address mapping for the XUSB block.  Can be empt=
y since the
> > >>> >> +   mapping is 1:1.
> > >>> >> + - #address-cells: Must be 2.
> > >>> >> + - #size-cells: Must be 2.
> > >>> >> +
> > >>> >> +Example:
> > >>> >> +--------
> > >>> >> +  usb@0,70098000 {
> > >>> >> +          compatible =3D "nvidia,tegra124-xusb";
> > >>> >> +          reg =3D <0x0 0x70098000 0x0 0x1000>;
> > >>> >> +          ranges;
> > >>> >> +
> > >>> >> +          #address-cells =3D <2>;
> > >>> >> +          #size-cells =3D <2>;
> > >>> >> +
> > >>> >> +          usb-host@0,70090000 {
> > >>> >> +                  compatible =3D "nvidia,tegra124-xhci";
> > >>> >> +                  ...
> > >>> >> +          };
> > >>> >> +
> > >>> >> +          mailbox {
> > >>> >> +                  compatible =3D "nvidia,tegra124-xusb-mbox";
> > >>> >> +                  ...
> > >>> >> +          };
> > >>> >
> > >>> > This doesn't appear to be a proper MFD.  I would have the USB and
> > >>> > Mailbox devices probe seperately and use a phandle to point the U=
SB
> > >>> > device to its Mailbox.
> > >>> >
> > >>> > usb@xyz {
> > >>> >     mboxes =3D <&xusb-mailbox, [chan]>;
> > >>> > };
> > >>> >
> > >>>
> > >>> I am assuming that Andrew had laid it out like this to reflect the =
hw
> > >>> structure. The mailbox and xhci controller are part of the xusb
> > >>> sub-system and hence appear as child nodes. My understanding is tha=
t for
> > >>> device-tree we want the device-tree structure to reflect the actual=
 hw.
> > >>> Is this not the case?
> > >>
> > >> Yes, the DT files should reflect h/w.  I have requested to see what
> > >> the memory map looks like, so I might provide a more appropriate
> > >> solution to accepting a pretty pointless MFD.
> > >
> > > FWIW, the address map for XUSB looks like this:
> > >
> > > XUSB_HOST: 0x70090000 - 0x7009a000
> > >     xHCI registers: 0x70090000 - 0x70098000
> > >     FPCI configuration registers: 0x70098000 - 0x70099000
> > >     IPFS configuration registers: 0x70099000 - 0x7009a000
> > >
> > >> Two solutions spring to mind.  You can either call
> > >> of_platform_populate() from the USB driver, as some already do:
> > >>
> > >>   drivers/usb/dwc3/dwc3-exynos.c:
> > >>     ret =3D of_platform_populate(node, NULL, NULL, dev);
> > >>   drivers/usb/dwc3/dwc3-keystone.c:
> > >>     error =3D of_platform_populate(node, NULL, NULL, dev);
> > >>   drivers/usb/dwc3/dwc3-omap.c:
> > >>     ret =3D of_platform_populate(node, NULL, NULL, dev);
> > >>   drivers/usb/dwc3/dwc3-qcom.c:
> > >>     ret =3D of_platform_populate(node, NULL, NULL, qdwc->dev);
> > >>   drivers/usb/dwc3/dwc3-st.c:
> > >>     ret =3D of_platform_populate(node, NULL, NULL, dev);
> > >>   drivers/usb/musb/musb_am335x.c:
> > >>     ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pde=
v->dev);
> > >
> > > This still requires a small, separate driver to setup the regmap and
> > > do of_platform_populate().  The only difference is it lives in
> > > drivers/usb/ instead of drivers/mfd/.
> > >
> > >> Or use the "simple-mfd", which is currently in -next:
> > >>
> > >>   git show next/master:Documentation/devicetree/bindings/mfd/mfd.txt
> > >
> > > I'm not too opposed to this, but Thierry was when I brought this up
> > > before.  The issue here is that if we ever have to do something
> > > besides setting up a regmap in the MFD, we'd have to change the
> > > binding and break DT backwards-compatibility.
> >=20
> > Any thoughts on this?  A minimal MFD seems to be the best way to
> > future-proof this binding/driver should it need to be extended in the
> > future.  If this is a firm NAK from you however, I'll need to let
> > Jassi now so that he can un-queue the mailbox patches for 4.2....
>=20
> I was waiting to hear Thierry's thoughts.  However, I am unconvinced
> that you need an MFD driver for this and refuse to take a shell (read
> "pointless") one on an "if we ever ..." clause.
>=20
> Will you break backwards capability though?  I'm not sure you will.
> Old DTBs will still use 'simple-mfd' and probe the devices in the
> normal way.  *If* you introduce an MFD driver at a later date then the
> old DTB will miss out the *new* functionality, which is expected and
> accepted.

I'm a little confused by the simple-mfd approach. The only code I see in
linux-next for this is a single line that adds the "simple-mfd" string
to the OF device ID table in drivers/of/platform.c. As far as I can tell
this will merely cause child devices to be created. There won't be a
shared regmap and resources won't be set up properly either. Having a
proper MFD driver seems to be the only way to achieve what we need.

The reason why every other simple-mfd users seems to get away with this
is because they also match on syscon and that sets up a regmap of its
own and the child device drivers use the syscon API to get at it. So I
don't see how we can make use of simple-mfd to achieve what we need,
unless we essentially copy what syscon does (but do proper resource
management while at it).

There is also the matter of clocks, resets, power supplies, etc. which
simple-mfd can't take into account in its current form. From a hardware
point of view, (some of) the clocks and resets are shared by the XHCI
and the mailbox blocks, so the device tree node would have to take that
into account. And a driver would also have to know which clocks, resets
and power supplies to probe and the order in which they need to be
enabled. simple-mfd doesn't provide any of that currently, so we'd
likely need to hack around that in all sorts of weird ways in the child
drivers. It makes much more sense for a top-level MFD driver to set up
the shared hardware resources and then instantiate the child devices and
let the drivers for those only care about the child-specific resources.

A catch-all driver will inevitably lead to implementing a midlayer with
potentially all sorts of quirks to make it work with the various devices
out there.

A much better implementation, in my opinion, would be to make simple-mfd
a subclassable object and then have drivers use a helper library to call
code that is common for simple-mfd kinds of devices. Something like this
for example:

	struct tegra_xusb {
		...
		struct mfd_simple mfd;
		...
	};

	static int tegra_xusb_probe(struct platform_device *pdev)
	{
		struct tegra_xusb *xusb;
		...
		err =3D mfd_simple_register(&xusb->mfd);
		...
	}

Now all these drivers reuse all the code provided by the mfd_simple
helper, which will instantiate the children, but it is also very easy to
tie in the platform-specific glue (clocks, resets, regulators, ...) via
the device-specific drivers.

Thierry

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXJ+oAAoJEN0jrNd/PrOh/0cP/1ngOQ+VYu47UtObK6VpfsMu
xf4F0lRiTS+otf+NJmrqKkYawDCfhngWig7pDPY05OGLJJULbsyby/Boy3kdGTLR
Ka/EgdfiNM7zAaqPlu4dOoOMUg+e4Sx7sCVBK6xgOjVWzQwyPvKqhXHJb5dIu9eR
QN4du42HhcXWLcptkdCPIrDSDOc4B4E106zlw+0HG2Xa6Ev6UT+XevslHHfYvcCy
LETt/CGg23rYW7UzobWWgp7dsIMC4F30FrW1ysJPDuYpPKFMnXeNiFoCrqVLR/Mf
duYZ+767UeelnEMUNDxpBB6kfTRKpYdZokWlwdwGhm06NbfyFuK6GtKWSdo7uju9
u2W+q84e/tZ61UTLVqkYJiQkoufQ7dDLi7g1YkHsVx364G96xeYHy0/rHaK+qqds
9/zgCM0GFyM1HgTtqE3IJlpoQvtSBwba206hQjr3IlbgLHs/OmrKpp5E1iCI6gMM
MEpuWY7W5XCXJYEmgSbjCCpQoxGiOJau1PSZhvwPLUHsZJm0B/ilvctAJ9N5EAnW
vgWkl1ToEb5Bw9Xwd/P7myoUCUf1PQJyfvJA09B/UHe212KhPODBRm5IsKDouNzf
yacthOCrQmVl6LJYKX65bPG4WReNNI65J3jqk2HWV5FV98zEkUa5LeYX1uGWI1QC
s6twne1pewVqTVGXfpZy
=Mkk7
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
