From: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Date: Tue, 4 Feb 2020 09:35:30 -0500
Message-ID: <CAMdYzYo8Vgw8h=LtfLnQNF4j-rVzgKJTp1hCyf7BFKrdhAhAHQ@mail.gmail.com>
References: <20200127023548.27107-1-pgwipeout@gmail.com> <20200131052716.GA30672@b29397-desktop>
 <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ@mail.gmail.com>
 <20200201061330.GA9178@b29397-desktop> <CAMdYzYrbvsTunwxJLcC_-ZhczsQfyDLOjTnZ+eorb325qO-QhA@mail.gmail.com>
 <20200204074419.GA6681@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200204074419.GA6681@b29397-desktop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 4, 2020 at 2:44 AM Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org> wrote:
>
> On 20-02-03 12:22:37, Peter Geis wrote:
> > > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > index 0c9911d44ee5..5d85363ad0f4 100644
> > > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > @@ -95,6 +95,7 @@ static int tegra_udc_probe(struct platform_device *pdev)
> > >         udc->data.flags = soc->flags;
> > >         udc->data.usb_phy = udc->phy;
> > >         udc->data.capoffset = DEF_CAPOFFSET;
> > > +       udc->data.dr_mode = USB_DR_MODE_PERIPHERAL;
> > >
> > >         udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
> > >                                       pdev->num_resources, &udc->data);
> >
> > I do not wish to set the dr_mode manually, since this could break
> > things on devices I do not own.
> > Future work is needed to address the tegra_udc capabilities, as well
> > as fully correct the hang issue.
> > This patch merely aims to fix a corner case.
> >
> > >
> > > > They also seem to be missing the extcon phandle, which means automatic
> > > > mode switching is not possible?
> > > >
> > > > >
> > > > > But one thing I could not understand, if the driver doesn't support
> > > > > dual-role, how could you do manual role switch?
> > > >
> > > > Manual role switching is conducted via debugfs,
> > > > /sys/kernel/debug/usb/ci_hdrc.0/role
> > > >
> > > > >
> > > > > >
> > > > > > Detect this state by checking for the extcon phandle when dual role mode
> > > > > > is set to otg.
> > > > > > If it doesn't exist request the driver to only enable manual role
> > > > > > switching.
> > > > > >
> > > > > > Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
> > > > > > Signed-off-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > > ---
> > > > > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
> > > > > >  1 file changed, 7 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > > > index 7455df0ede49..2f6f6ce3e8f5 100644
> > > > > > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > > > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > > > @@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_device *pdev)
> > > > > >       udc->data.usb_phy = udc->phy;
> > > > > >       udc->data.capoffset = DEF_CAPOFFSET;
> > > > > >
> > > > > > +     /* check the dual mode and warn about bad configurations */
> > > > > > +     if (usb_get_dr_mode(&pdev->dev) == USB_DR_MODE_OTG &&
> > > > > > +        !of_property_read_bool(pdev->dev.of_node, "extcon")) {
> > > > > > +             dev_warn(&pdev->dev, "no extcon registered, otg unavailable");
> > > > > > +             udc->data.flags |= CI_HDRC_DUAL_ROLE_NOT_OTG;
> > > > > > +     }
> > > > > > +
> > > > >
> > > > > The CI_HDRC_DUAL_ROLE_NOT_OTG flag may not be suitable here, please see
> > > > > comments for it.
> > > >
> > > > I've dug around the various mailing lists and I fail to find any
> > > > reference to why this is not a valid use case.
> > > > The commit message specifically references dual role capable devices
> > > > without proper otg implementations, such as missing the otgsc
> > > > register.
> > > >
> > > > My current use case is the Ouya, which deadlocks the kernel durning
> > > > probe if the otg capable usb controller is set to dr_mode=otg.
> > > > It works with this flag set.
> > > > Unfortunately there isn't a property for dr_mode set to non_otg_dr_mode.
> > > >
> > > > I found a post stating that the driver blindly touches registers in
> > > > otg mode, which leads to the deadlock if those registers are read only
> > > > or non-existent,
> > > > Eventually someone should look into why this deadlock occurs and make
> > > > a proper fix that applies to all users.
> > > > Unfortunately I do not have the knowledge yet to accomplish this task.
> > > >
> > > > With some simple modifications to the tegra_udc driver it is possible
> > > > to get host mode working, vice using the tegra-ehci driver.
> > > > At this point role switch works
> > > >
> > > > I also managed to move all of the functionality of the tegra-ehci
> > > > driver into the tegra-udc driver.
> > > > Unfortunately it doesn't behave correctly under some cases, so I never
> > > > submitted it.
> > > >
> > > > Do you have a recommendation for handling this?
> > >
> > > If you would like adding host function in chipidea driver for tegra, and
> > > want dual-role switch to work, first, you may need to know which
> > > dual-role switch you need:
> > > - Through controller's id and vbus pins
> > > - Through extcon, eg,GPIO.
> > > - Through usb-role-switch class, eg, Type-C controller
> > > - Through sysfs, /sys/bus/platform/devices/ci_hdrc.0/role
> > >
> > > The first three are automatically switch, the last one is manually.
> > > Current chipidea core should support all above switches, maybe there are
> > > some limitations for them, the fixes are welcome.
> >
> > AFAIK reading through the comments, the chipidea driver intended to
> > exclusively use extcon for automatic role switching, please correct me
> > if I'm wrong here.
>
> No, extcon is supported.
>
> > USB-C support is not a likely scenario, as currently the chipidea
> > driver only supports usb 2.0.
>
> USB-C is a connector, not related to USB HW revision. For USB 2.0
> USB-C solution, there is no SS TX/RX connected on connector.
>
> >
> > >
> > > Second, you may check if touch otgsc will hang or deadlock the system.
> > > If you can't touch otgsc when portsc.phcd = 0, you may need the flag
> > > CI_HDRC_DUAL_ROLE_NOT_OTG, afaik, few SoCs can't touch otgsc if it
> > > supports dual-role.
> >
> > I added some traces to the driver, and it doesn't actually appear to
> > be a register read/write that is breaking things. (Not directly
> > anyways).
> > The hang occurs after it enumerates the usb gadgets and hub.
> > Still trying to track down exactly where the hang occurs.
> >
>
> Try to see if it is related to runtime power management.

That's it!
There doesn't appear to be a method to disable PM inside the chipidea driver.
Do you have a suggestion on how to do it, aside from the global method?

>
> --
>
> Thanks,
> Peter Chen
