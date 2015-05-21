From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 4/9] mfd: Add binding document for NVIDIA Tegra XUSB
Date: Thu, 21 May 2015 12:12:49 +0200
Message-ID: <20150521101247.GA8073@ulmo.nvidia.com>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
 <1430761002-9327-5-git-send-email-abrestic@chromium.org>
 <20150513143954.GA3394@x1>
 <55544CC5.9050001@nvidia.com>
 <20150514074058.GA22418@x1>
 <CAL1qeaEqNejuGkN-ke11mtWnaaRo+XieCBkQ6+NQ-Afym6uxVA@mail.gmail.com>
 <CAL1qeaHy0h7bXhuLHh4AG2Zfu48JYeawgVo4dp_k4oX8YFw6tA@mail.gmail.com>
 <20150520063551.GD3627@x1>
 <20150520145227.GA3787@ulmo.nvidia.com>
 <20150521084001.GB6310@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150521084001.GB6310@x1>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2015 at 09:40:01AM +0100, Lee Jones wrote:
> On Wed, 20 May 2015, Thierry Reding wrote:
> > On Wed, May 20, 2015 at 07:35:51AM +0100, Lee Jones wrote:
> > > On Tue, 19 May 2015, Andrew Bresticker wrote:
> > > > On Thu, May 14, 2015 at 10:38 AM, Andrew Bresticker
> > > > <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > > > > On Thu, May 14, 2015 at 12:40 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org=
> wrote:
> > > > >> On Thu, 14 May 2015, Jon Hunter wrote:
> > > > >>> On 13/05/15 15:39, Lee Jones wrote:
> > > > >>> > On Mon, 04 May 2015, Andrew Bresticker wrote:
> > > > >>> >
> > > > >>> >> Add a binding document for the XUSB host complex on NVIDIA T=
egra124
> > > > >>> >> and later SoCs.  The XUSB host complex includes a mailbox for
> > > > >>> >> communication with the XUSB micro-controller and an xHCI hos=
t-controller.
> > > > >>> >>
> > > > >>> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > >>> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > >>> >> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > > > >>> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > > >>> >> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > > > >>> >> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > > > >>> >> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > > > >>> >> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > > >>> >> ---
> > > > >>> >> Changes from v7:
> > > > >>> >>  - Move non-shared resources into child nodes.
> > > > >>> >> New for v7.
> > > > >>> >> ---
> > > > >>> >>  .../bindings/mfd/nvidia,tegra124-xusb.txt          | 37 +++=
+++++++++++++++++++
> > > > >>> >>  1 file changed, 37 insertions(+)
> > > > >>> >>  create mode 100644 Documentation/devicetree/bindings/mfd/nv=
idia,tegra124-xusb.txt
> > > > >>> >>
> > > > >>> >> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,te=
gra124-xusb.txt b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xus=
b.txt
> > > > >>> >> new file mode 100644
> > > > >>> >> index 0000000..bc50110
> > > > >>> >> --- /dev/null
> > > > >>> >> +++ b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-=
xusb.txt
> > > > >>> >> @@ -0,0 +1,37 @@
> > > > >>> >> +NVIDIA Tegra XUSB host copmlex
> > > > >>> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>> >> +
> > > > >>> >> +The XUSB host complex on Tegra124 and later SoCs contains a=
n xHCI host
> > > > >>> >> +controller and a mailbox for communication with the XUSB mi=
cro-controller.
> > > > >>> >> +
> > > > >>> >> +Required properties:
> > > > >>> >> +--------------------
> > > > >>> >> + - compatible: For Tegra124, must contain "nvidia,tegra124-=
xusb".
> > > > >>> >> +   Otherwise, must contain '"nvidia,<chip>-xusb", "nvidia,t=
egra124-xusb"'
> > > > >>> >> +   where <chip> is tegra132.
> > > > >>> >> + - reg: Must contain the base and length of the XUSB FPCI r=
egisters.
> > > > >>> >> + - ranges: Bus address mapping for the XUSB block.  Can be =
empty since the
> > > > >>> >> +   mapping is 1:1.
> > > > >>> >> + - #address-cells: Must be 2.
> > > > >>> >> + - #size-cells: Must be 2.
> > > > >>> >> +
> > > > >>> >> +Example:
> > > > >>> >> +--------
> > > > >>> >> +  usb@0,70098000 {
> > > > >>> >> +          compatible =3D "nvidia,tegra124-xusb";
> > > > >>> >> +          reg =3D <0x0 0x70098000 0x0 0x1000>;
> > > > >>> >> +          ranges;
> > > > >>> >> +
> > > > >>> >> +          #address-cells =3D <2>;
> > > > >>> >> +          #size-cells =3D <2>;
> > > > >>> >> +
> > > > >>> >> +          usb-host@0,70090000 {
> > > > >>> >> +                  compatible =3D "nvidia,tegra124-xhci";
> > > > >>> >> +                  ...
> > > > >>> >> +          };
> > > > >>> >> +
> > > > >>> >> +          mailbox {
> > > > >>> >> +                  compatible =3D "nvidia,tegra124-xusb-mbox=
";
> > > > >>> >> +                  ...
> > > > >>> >> +          };
> > > > >>> >
> > > > >>> > This doesn't appear to be a proper MFD.  I would have the USB=
 and
> > > > >>> > Mailbox devices probe seperately and use a phandle to point t=
he USB
> > > > >>> > device to its Mailbox.
> > > > >>> >
> > > > >>> > usb@xyz {
> > > > >>> >     mboxes =3D <&xusb-mailbox, [chan]>;
> > > > >>> > };
> > > > >>> >
> > > > >>>
> > > > >>> I am assuming that Andrew had laid it out like this to reflect =
the hw
> > > > >>> structure. The mailbox and xhci controller are part of the xusb
> > > > >>> sub-system and hence appear as child nodes. My understanding is=
 that for
> > > > >>> device-tree we want the device-tree structure to reflect the ac=
tual hw.
> > > > >>> Is this not the case?
> > > > >>
> > > > >> Yes, the DT files should reflect h/w.  I have requested to see w=
hat
> > > > >> the memory map looks like, so I might provide a more appropriate
> > > > >> solution to accepting a pretty pointless MFD.
> > > > >
> > > > > FWIW, the address map for XUSB looks like this:
> > > > >
> > > > > XUSB_HOST: 0x70090000 - 0x7009a000
> > > > >     xHCI registers: 0x70090000 - 0x70098000
> > > > >     FPCI configuration registers: 0x70098000 - 0x70099000
> > > > >     IPFS configuration registers: 0x70099000 - 0x7009a000
> > > > >
> > > > >> Two solutions spring to mind.  You can either call
> > > > >> of_platform_populate() from the USB driver, as some already do:
> > > > >>
> > > > >>   drivers/usb/dwc3/dwc3-exynos.c:
> > > > >>     ret =3D of_platform_populate(node, NULL, NULL, dev);
> > > > >>   drivers/usb/dwc3/dwc3-keystone.c:
> > > > >>     error =3D of_platform_populate(node, NULL, NULL, dev);
> > > > >>   drivers/usb/dwc3/dwc3-omap.c:
> > > > >>     ret =3D of_platform_populate(node, NULL, NULL, dev);
> > > > >>   drivers/usb/dwc3/dwc3-qcom.c:
> > > > >>     ret =3D of_platform_populate(node, NULL, NULL, qdwc->dev);
> > > > >>   drivers/usb/dwc3/dwc3-st.c:
> > > > >>     ret =3D of_platform_populate(node, NULL, NULL, dev);
> > > > >>   drivers/usb/musb/musb_am335x.c:
> > > > >>     ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, =
&pdev->dev);
> > > > >
> > > > > This still requires a small, separate driver to setup the regmap =
and
> > > > > do of_platform_populate().  The only difference is it lives in
> > > > > drivers/usb/ instead of drivers/mfd/.
> > > > >
> > > > >> Or use the "simple-mfd", which is currently in -next:
> > > > >>
> > > > >>   git show next/master:Documentation/devicetree/bindings/mfd/mfd=
=2Etxt
> > > > >
> > > > > I'm not too opposed to this, but Thierry was when I brought this =
up
> > > > > before.  The issue here is that if we ever have to do something
> > > > > besides setting up a regmap in the MFD, we'd have to change the
> > > > > binding and break DT backwards-compatibility.
> > > >=20
> > > > Any thoughts on this?  A minimal MFD seems to be the best way to
> > > > future-proof this binding/driver should it need to be extended in t=
he
> > > > future.  If this is a firm NAK from you however, I'll need to let
> > > > Jassi now so that he can un-queue the mailbox patches for 4.2....
> > >=20
> > > I was waiting to hear Thierry's thoughts.  However, I am unconvinced
> > > that you need an MFD driver for this and refuse to take a shell (read
> > > "pointless") one on an "if we ever ..." clause.
> > >=20
> > > Will you break backwards capability though?  I'm not sure you will.
> > > Old DTBs will still use 'simple-mfd' and probe the devices in the
> > > normal way.  *If* you introduce an MFD driver at a later date then the
> > > old DTB will miss out the *new* functionality, which is expected and
> > > accepted.
> >=20
> > I'm a little confused by the simple-mfd approach. The only code I see in
> > linux-next for this is a single line that adds the "simple-mfd" string
> > to the OF device ID table in drivers/of/platform.c. As far as I can tell
> > this will merely cause child devices to be created. There won't be a
> > shared regmap and resources won't be set up properly either. Having a
> > proper MFD driver seems to be the only way to achieve what we need.
> >=20
> > The reason why every other simple-mfd users seems to get away with this
> > is because they also match on syscon and that sets up a regmap of its
> > own and the child device drivers use the syscon API to get at it. So I
> > don't see how we can make use of simple-mfd to achieve what we need,
> > unless we essentially copy what syscon does (but do proper resource
> > management while at it).
>=20
> If you have shared resources and your device isn't classed as a syscon
> device then yes, simple-mfd probably isn't suitable for this use-case.
> You might need to go into more detail with regards to "proper resource
> management", as I'm not entirely sure I agree.
>=20
> Still, this doesn't change the fact that, from what I've seen, I still
> don't think you need a dedicated MFD driver.
>=20
> What do you think of:
>=20
> usb-host@0,70090000 {
> 	compatible =3D "nvidia,tegra124-xhci";
> 	reg =3D <0x0 0x70090000 0x0 0x80CF>,
> 	      <0x0 0x70098800 0x0 0x0800>,
> 	      <0x0 0x70099000 0x0 0x1000>;
>=20
> 	/* Something from the datasheet */
> 	reg-names =3D "xhci-before-mbox", "xhci-after-mbox", "ipfs";
>=20
> 	interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> 	ranges;
>=20
> 	xusb_mbox: mailbox {
> 		compatible =3D "nvidia,tegra124-xusb-mbox";
> 		reg =3D <0x0 0x700980e0 0x0 0x13>,
> 		      <0x0 0x70098428 0x0 0x03>;
>=20
> 		/* Something from the datasheet */
> 		reg-names =3D "mbox-one", "mbox-two";
> 		interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> 	};
> };
>=20
> Then hvae the XHCI driver call of_platform_populate() as I proposed
> above?

That's a little bonghits. It requires the drivers to jump through hoops
to properly manage register accesses (needs to differentiate on the base
depending on the register offset). So if you're going to NAK the MFD
approach I'd rather go a completely different route and keep only a top-
level node in DT here.

One of the problems that the MFD design tries to solve is that the XHCI
controller needs a reference to the mailbox and the pad controller for a
PHY. The pad controller at the same time requires a reference to the
mailbox, so we have a circular dependency that we can only resolve by
introducing two separate devices, instantiated by some top-level entity.
For that reason I don't think your proposal is going to work either. The
circular dependency can't be broken because the XHCI driver will not be
able to of_platform_populate() before getting a PHY, and the PHY will
never show up until of_platform_populate() is called.

So if this isn't going to be an MFD, then I think we should simply go
and instantiate platform devices from the XUSB driver directly. The
problem arising from that is that we have no place to put the top-level
driver. We could take it into drivers/soc/tegra, or perhaps even have it
in the XHCI driver.

If we instantiate platform devices we can either set up the resources
such that we don't have to jump through hoops (I think the resource tree
will allow that) or set up a shared regmap. The latter might be the
easier way out, though it'd also be copying much of what MFD does, but
so be it if that's the only way we can get the matter settled.

> > There is also the matter of clocks, resets, power supplies, etc. which
> > simple-mfd can't take into account in its current form. From a hardware
> > point of view, (some of) the clocks and resets are shared by the XHCI
> > and the mailbox blocks, so the device tree node would have to take that
> > into account. And a driver would also have to know which clocks, resets
> > and power supplies to probe and the order in which they need to be
> > enabled. simple-mfd doesn't provide any of that currently, so we'd
> > likely need to hack around that in all sorts of weird ways in the child
> > drivers. It makes much more sense for a top-level MFD driver to set up
> > the shared hardware resources and then instantiate the child devices and
> > let the drivers for those only care about the child-specific resources.
> >=20
> > A catch-all driver will inevitably lead to implementing a midlayer with
> > potentially all sorts of quirks to make it work with the various devices
> > out there.
> >=20
> > A much better implementation, in my opinion, would be to make simple-mfd
> > a subclassable object and then have drivers use a helper library to call
> > code that is common for simple-mfd kinds of devices. Something like this
> > for example:
> >=20
> > 	struct tegra_xusb {
> > 		...
> > 		struct mfd_simple mfd;
> > 		...
> > 	};
> >=20
> > 	static int tegra_xusb_probe(struct platform_device *pdev)
> > 	{
> > 		struct tegra_xusb *xusb;
> > 		...
> > 		err =3D mfd_simple_register(&xusb->mfd);
> > 		...
> > 	}
> >=20
> > Now all these drivers reuse all the code provided by the mfd_simple
> > helper, which will instantiate the children, but it is also very easy to
> > tie in the platform-specific glue (clocks, resets, regulators, ...) via
> > the device-specific drivers.
>=20
> I'm not keen on creating a not-so-simple-mfd driver.  Let's work with
> what we've got for the time being.

What we currently have is not a driver at all, it's merely an alias for
simple-bus.

Thierry

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXa+bAAoJEN0jrNd/PrOhiH0QAKaYgiGzgTqGikdOgi9rOV0w
5a0km2iDveFpz7c6Dxgyb92jZ11EPDHaLaQZF7T0oA1V3c9UL+zPrsmjTX5qRejN
nBduhdtjdJG3Iu7cXvCmbd4bZWTxo6bdb3+nubmtqfiD/s3RRcCQGMH5bfI+WDcG
28ZdnrPBE4pVWfA4nT6Xut2Kux+2DPgl96TPTRistuVCZK9g1JNG7XYKh4yJEvjx
I/DZASVbJYobKA/InAi8ISx8zb/mPFb1tmn2IENncg/l2+rmdpeDQQKjGzisaeVG
s+iQI1nF3fZEub4qj7oYd/A6LJRX8i+cBf72s2t6n8Rxwp+FcDlFD2UeBFwdi6MH
GAHrs5LZjKlgrAQtPPiWzac4jX15QhPvq7DcVE8AsQ1N3bgWkeUXLVvZpRGogHQT
UblqcTVXi4kmNIiHY18E9hhu0rd8P5CmfyW//Vm+QY0EN2uefvpgDMCqzh4x0VTw
rhjxjod7TiUBlgxHcg3m+VF5eQ1LHJW4BpQtVd/dtRMo4GGckMlPkf08P50kg7l7
Wci9z+bQQyGYiSoZ3kQOpc69fbOUxten/KXCQ7JmIGlFXGBYm6tQR1b3e1msNuly
CRHQvO6GR6/wYCpJ8MEeVJuO2qxAZHnntNOrOxd9ZwGSq0uuilewtHdocYILmcRJ
bVXDmLmfKUKeNpg7mUcQ
=hmtQ
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
