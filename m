From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Date: Sat, 1 Feb 2020 06:13:31 +0000
Message-ID: <20200201061330.GA9178@b29397-desktop>
References: <20200127023548.27107-1-pgwipeout@gmail.com>
 <20200131052716.GA30672@b29397-desktop>
 <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Content-ID: <4CEEBDAF8A417049A2B11C9554834F70-jdb/QiT5osKcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 20-01-31 15:43:24, Peter Geis wrote:
> On Fri, Jan 31, 2020 at 12:27 AM Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org> wrote:
> >
> > On 20-01-26 21:35:48, Peter Geis wrote:
> > > The ci_hdrc_tegra driver does not currently support dual role mode, b=
ut
> > > it does not explicitly prevent its use.
> > > Certain devices support dual role mode, but not automatic role switch=
.
> > > This can cause the device to lock up during initialization of the
> > > driver.
> >
> > If the driver only supports peripheral mode, you could set dr_mode as
> > peripheral-only at glue layer, it would not be override by core.c.
> > See ci_get_platdata.
>=20
> The mode is set via the device tree dr_mode property.
> Even though the current tegra_udc driver does not currently support
> mode switching, board device tree files such as the apalis-eval and
> colibri-eval-v3 have dr_mode set to otg.
>=20

If you would like fixing wrong dts setting issue, you could do below:

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci=
_hdrc_tegra.c
index 0c9911d44ee5..5d85363ad0f4 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -95,6 +95,7 @@ static int tegra_udc_probe(struct platform_device *pdev)
 	udc->data.flags =3D soc->flags;
 	udc->data.usb_phy =3D udc->phy;
 	udc->data.capoffset =3D DEF_CAPOFFSET;
+	udc->data.dr_mode =3D USB_DR_MODE_PERIPHERAL;
=20
 	udc->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
 				      pdev->num_resources, &udc->data);

> They also seem to be missing the extcon phandle, which means automatic
> mode switching is not possible?
>=20
> >
> > But one thing I could not understand, if the driver doesn't support
> > dual-role, how could you do manual role switch?
>=20
> Manual role switching is conducted via debugfs,
> /sys/kernel/debug/usb/ci_hdrc.0/role
>=20
> >
> > >
> > > Detect this state by checking for the extcon phandle when dual role m=
ode
> > > is set to otg.
> > > If it doesn't exist request the driver to only enable manual role
> > > switching.
> > >
> > > Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
> > > Signed-off-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipi=
dea/ci_hdrc_tegra.c
> > > index 7455df0ede49..2f6f6ce3e8f5 100644
> > > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > @@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_device =
*pdev)
> > >       udc->data.usb_phy =3D udc->phy;
> > >       udc->data.capoffset =3D DEF_CAPOFFSET;
> > >
> > > +     /* check the dual mode and warn about bad configurations */
> > > +     if (usb_get_dr_mode(&pdev->dev) =3D=3D USB_DR_MODE_OTG &&
> > > +        !of_property_read_bool(pdev->dev.of_node, "extcon")) {
> > > +             dev_warn(&pdev->dev, "no extcon registered, otg unavail=
able");
> > > +             udc->data.flags |=3D CI_HDRC_DUAL_ROLE_NOT_OTG;
> > > +     }
> > > +
> >
> > The CI_HDRC_DUAL_ROLE_NOT_OTG flag may not be suitable here, please see
> > comments for it.
>=20
> I've dug around the various mailing lists and I fail to find any
> reference to why this is not a valid use case.
> The commit message specifically references dual role capable devices
> without proper otg implementations, such as missing the otgsc
> register.
>=20
> My current use case is the Ouya, which deadlocks the kernel durning
> probe if the otg capable usb controller is set to dr_mode=3Dotg.
> It works with this flag set.
> Unfortunately there isn't a property for dr_mode set to non_otg_dr_mode.
>=20
> I found a post stating that the driver blindly touches registers in
> otg mode, which leads to the deadlock if those registers are read only
> or non-existent,
> Eventually someone should look into why this deadlock occurs and make
> a proper fix that applies to all users.
> Unfortunately I do not have the knowledge yet to accomplish this task.
>=20
> With some simple modifications to the tegra_udc driver it is possible
> to get host mode working, vice using the tegra-ehci driver.
> At this point role switch works
>=20
> I also managed to move all of the functionality of the tegra-ehci
> driver into the tegra-udc driver.
> Unfortunately it doesn't behave correctly under some cases, so I never
> submitted it.
>=20
> Do you have a recommendation for handling this?

If you would like adding host function in chipidea driver for tegra, and
want dual-role switch to work, first, you may need to know which
dual-role switch you need:
- Through controller's id and vbus pins
- Through extcon, eg,GPIO.
- Through usb-role-switch class, eg, Type-C controller
- Through sysfs, /sys/bus/platform/devices/ci_hdrc.0/role

The first three are automatically switch, the last one is manually.
Current chipidea core should support all above switches, maybe there are
some limitations for them, the fixes are welcome.

Second, you may check if touch otgsc will hang or deadlock the system.
If you can't touch otgsc when portsc.phcd =3D 0, you may need the flag
CI_HDRC_DUAL_ROLE_NOT_OTG, afaik, few SoCs can't touch otgsc if it
supports dual-role.

When you add host function, you may set dr_mode as host-only first, it
could make thing easier.

--=20

Thanks,
Peter Chen=
