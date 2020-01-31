From: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Date: Fri, 31 Jan 2020 15:43:24 -0500
Message-ID: <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ@mail.gmail.com>
References: <20200127023548.27107-1-pgwipeout@gmail.com> <20200131052716.GA30672@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200131052716.GA30672@b29397-desktop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 31, 2020 at 12:27 AM Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org> wrote:
>
> On 20-01-26 21:35:48, Peter Geis wrote:
> > The ci_hdrc_tegra driver does not currently support dual role mode, but
> > it does not explicitly prevent its use.
> > Certain devices support dual role mode, but not automatic role switch.
> > This can cause the device to lock up during initialization of the
> > driver.
>
> If the driver only supports peripheral mode, you could set dr_mode as
> peripheral-only at glue layer, it would not be override by core.c.
> See ci_get_platdata.

The mode is set via the device tree dr_mode property.
Even though the current tegra_udc driver does not currently support
mode switching, board device tree files such as the apalis-eval and
colibri-eval-v3 have dr_mode set to otg.

They also seem to be missing the extcon phandle, which means automatic
mode switching is not possible?

>
> But one thing I could not understand, if the driver doesn't support
> dual-role, how could you do manual role switch?

Manual role switching is conducted via debugfs,
/sys/kernel/debug/usb/ci_hdrc.0/role

>
> >
> > Detect this state by checking for the extcon phandle when dual role mode
> > is set to otg.
> > If it doesn't exist request the driver to only enable manual role
> > switching.
> >
> > Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
> > Signed-off-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > index 7455df0ede49..2f6f6ce3e8f5 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > @@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_device *pdev)
> >       udc->data.usb_phy = udc->phy;
> >       udc->data.capoffset = DEF_CAPOFFSET;
> >
> > +     /* check the dual mode and warn about bad configurations */
> > +     if (usb_get_dr_mode(&pdev->dev) == USB_DR_MODE_OTG &&
> > +        !of_property_read_bool(pdev->dev.of_node, "extcon")) {
> > +             dev_warn(&pdev->dev, "no extcon registered, otg unavailable");
> > +             udc->data.flags |= CI_HDRC_DUAL_ROLE_NOT_OTG;
> > +     }
> > +
>
> The CI_HDRC_DUAL_ROLE_NOT_OTG flag may not be suitable here, please see
> comments for it.

I've dug around the various mailing lists and I fail to find any
reference to why this is not a valid use case.
The commit message specifically references dual role capable devices
without proper otg implementations, such as missing the otgsc
register.

My current use case is the Ouya, which deadlocks the kernel durning
probe if the otg capable usb controller is set to dr_mode=otg.
It works with this flag set.
Unfortunately there isn't a property for dr_mode set to non_otg_dr_mode.

I found a post stating that the driver blindly touches registers in
otg mode, which leads to the deadlock if those registers are read only
or non-existent,
Eventually someone should look into why this deadlock occurs and make
a proper fix that applies to all users.
Unfortunately I do not have the knowledge yet to accomplish this task.

With some simple modifications to the tegra_udc driver it is possible
to get host mode working, vice using the tegra-ehci driver.
At this point role switch works

I also managed to move all of the functionality of the tegra-ehci
driver into the tegra-udc driver.
Unfortunately it doesn't behave correctly under some cases, so I never
submitted it.

Do you have a recommendation for handling this?

>
> >       udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
> >                                     pdev->num_resources, &udc->data);
> >       if (IS_ERR(udc->dev)) {
> > --
> > 2.17.1
> >
>
> --
>
> Thanks,
> Peter Chen
