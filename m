From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V7 4/9] mfd: Add binding document for NVIDIA Tegra XUSB
Date: Wed, 29 Apr 2015 19:34:29 +0100
Message-ID: <20150429183429.GB9169@x1>
References: <1430174242-29465-1-git-send-email-abrestic@chromium.org>
 <1430174242-29465-5-git-send-email-abrestic@chromium.org>
 <20150429092545.GR9169@x1>
 <CAL1qeaFh5go_K0GnGXxU7KqjcgCm2kpUL5mVgGSYosPoXAXgpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaFh5go_K0GnGXxU7KqjcgCm2kpUL5mVgGSYosPoXAXgpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 29 Apr 2015, Andrew Bresticker wrote:

> Lee,
>=20
> On Wed, Apr 29, 2015 at 2:25 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
> > On Mon, 27 Apr 2015, Andrew Bresticker wrote:
> >
> >> Add a binding document for the XUSB host complex on NVIDIA Tegra12=
4
> >> and later SoCs.  The XUSB host complex includes a mailbox for
> >> communication with the XUSB micro-controller and an xHCI host-cont=
roller.
> >>
> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> >> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> >> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >> New for v7.
> >> ---
> >>  .../bindings/mfd/nvidia,tegra124-xusb.txt          | 46 +++++++++=
+++++++++++++
> >>  1 file changed, 46 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,t=
egra124-xusb.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,tegra124=
-xusb.txt b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.=
txt
> >> new file mode 100644
> >> index 0000000..6a46680
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.t=
xt
> >> @@ -0,0 +1,46 @@
> >> +NVIDIA Tegra XUSB host copmlex
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +The XUSB host complex on Tegra124 and later SoCs contains an xHCI=
 host
> >> +controller and a mailbox for communication with the XUSB micro-co=
ntroller.
> >> +
> >> +Required properties:
> >> +--------------------
> >> + - compatible: For Tegra124, must contain "nvidia,tegra124-xusb".
> >> +   Otherwise, must contain '"nvidia,<chip>-xusb", "nvidia,tegra12=
4-xusb"'
> >> +   where <chip> is tegra132.
> >
> > Okay.  Why?
>=20
> Why what?  This is the convention used for Tegra bindings and is also
> documented in Documentation/devicetree/bindings/submitting-patches.tx=
t.
> See nvidia,tegra114-spi.txt and nvidia,tegra20-i2c.txt for other
> examples of this.

It seems strange to me that you'd mention two specific chips in one
compatible string.  What's the purpose of that?

> >> + - reg: Must contain register base and length for each register s=
et listed
> >> +   in reg-names.
> >
> > You've mentioned 2 of the cells, what about the remaining 2?
>=20
> The example given was for Tegra124, where there are two address cells
> and two size cells.

I don't get that.  How does that work?

> >> + - reg-names: Must include the following entries:
> >> +   - xhci
> >> +   - fpci
> >> +   - ipfs
> >> + - interrupts: Must contain an interrupt for each entry in interr=
upt-names.
> >> + - interrupt-names: Must include the following entries:
> >> +   - host
> >> +   - smi
> >> +   - pme
> >> +
> >> +Example:
> >> +--------
> >> +     usb@0,70090000 {
> >> +             compatible =3D "nvidia,tegra124-xusb";
> >> +             reg =3D <0x0 0x70090000 0x0 0x8000>,
> >> +                   <0x0 0x70098000 0x0 0x1000>,
> >> +                   <0x0 0x70099000 0x0 0x1000>;
> >> +             reg-names =3D "xhci", "fpci", "ipfs";
> >> +             interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> >> +                          <GIC_SPI 40 IRQ_TYPE_LEVEL_HGIH>,
> >> +                          <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> >> +             interrupt-names =3D "host", "smi", "pme";
> >
> > Are these resources used by both children?
>=20
> Only the FPCI register set is shared.
>=20
> > If not, place them into the children and ioremap() them from the
> > associated child drivers.
>=20
> Ok.

Great.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
