Return-Path: <SRS0=wB+u=CT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFC0C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 16:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E563D2078B
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 16:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6MvUJJg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgIJQ6k (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Sep 2020 12:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbgIJQ5s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 12:57:48 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA4DC061387
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 09:50:35 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id w1so7027703edr.3
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R9d9Rx60Foi0/BrsDzSXOiPP5WvVrCdRd6Xu9trFR2E=;
        b=c6MvUJJgHLohqd6sCdvjEL67IUnru7EDyU1fuIJsmcEpFXU2PKbSnpivLE7Vy84Lj1
         //WCwx9cc78bp0+SVIM/M5J3VwLTDGs2walL0A1NpBtVaZA0Wt+DGyKZN1ykgCSHb6F4
         qb/b2gUJ55PUgd9XKre2KLGkHjfFQEfWx9SuYpsPTja8WhSCb1YXw4AfactMpo/5yZXm
         EVTm72Gl2WlMSWtVz2defawjP0DtQcCJ9z0fjrBqGAYO6ue2qcZufn5MxALFelOskwsC
         xbCwteDty4c/guHSQ/QKn3e4hvJV7BChW6YO5LvPVHoysyXDxaRd+TVgCA1kqdw64pi0
         Fg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R9d9Rx60Foi0/BrsDzSXOiPP5WvVrCdRd6Xu9trFR2E=;
        b=NB4o7Wr9+juJamYPe7Mu5IeYSaf+UBD088TAgFD6DdWsGLA1iPVrGBzuXEbs4l5S6+
         0js0hQgZjpLUZhLig7MDFxgU09KS0l0TWcVfkMMy4DsUyVn0B+t/5Rql2dgskTosQT6Z
         YIZO7JjE1fkMxtX+omII1CCbYJnLBE2oTMRqQIQnY22AHShmD7iPdctis9QWg+f1jso1
         1P9ttQpXqKQsdPR4Hd2RStNueDLZ2ji8/ccjRjmxxTv1C7Pk18c/Tq+J5hIYnIZpGwmH
         Gf30S8UKwa2b02UeR1meCE9lxLzVRP/7h6vAMujc4CGJ+WM286h+V+0I+W10EWripHwa
         nRCw==
X-Gm-Message-State: AOAM533q2HIfB+O+4AsEPu05Pdmph0Hyi0wCx6iFfQzo8G0KctrWCBIv
        A3OTf4L8sQlAHwI5IEyMRqZiSPLLSYaB2wAkOLEsiPMV0DY=
X-Google-Smtp-Source: ABdhPJzxEZrVmfWEEHGt9fNfWIcnKsquICvmDG5dnwmPelHOqihAbIv7KktJt3hKrz/DiyUt9c7wu6v5SigCaez6Ju8=
X-Received: by 2002:a50:9fa1:: with SMTP id c30mr4218663edf.207.1599756633932;
 Thu, 10 Sep 2020 09:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200908150124.31336-1-pgwipeout@gmail.com> <91d24891-6e89-a075-8dd8-d6a55797c3c2@nvidia.com>
In-Reply-To: <91d24891-6e89-a075-8dd8-d6a55797c3c2@nvidia.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Thu, 10 Sep 2020 12:50:06 -0400
Message-ID: <CAMdYzYq+RbU9cwfX26-+JDdqCezQiof8=nXa3GPCqRy+8OPB2w@mail.gmail.com>
Subject: Re: [PATCH] phy: tegra: xusb: fix xusb backwards compatibility
To:     JC Kuo <jckuo@nvidia.com>
Cc:     linux-tegra@vger.kernel.org,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Matias Zuniga <matias.nicolas.zc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 9, 2020 at 10:18 PM JC Kuo <jckuo@nvidia.com> wrote:
>
> Hi Peter,
> Thanks for your patch. If an OTG capable port doesn't have a way to detect its
> initial role based on cable detection, I think it's somehow dangerous to give
> the port to host controller. When the port is enabled for host role, platform
> starts supplying VBUS to the connector. If the connector happens to be connected
> to a host role port which is supplying VBUS as well, there could be some damage
> to the board which doesn't have proper protection.

Thank you for your input.
Unfortunately I see a few issues with this concept.

First, it doesn't address that the patch this fix addresses breaks all
usb for older device trees, which already are implemented with a
stable ABI.
As the mailing list has made abundantly clear, if at all possible we
need to prevent breaking backwards compatibility.
Specifically this breaks Tegra124 devices with mainlined device trees.
It was reported against the tegra124-nyan, but from the looks of it
the following mainlined boards will be affected:
tegra124-apalis
tegra124-apalis-v1.2
tegra124-nyan
tegra124-venice2

Second, from an engineering perspective it doesn't make much sense.
USB operates at 5v, so even if VBUS is enabled and a device is plugged
in that also provides 5v, the total potential will remain the same.
USB-C can drive higher, but only at the request of the controller
chip, which will have protections in place.
There is nothing stopping a user from plugging in a device cable to a
host only port.
There are poorly designed devices such as powered hubs that can back
feed power into the USB port.
Even peripheral ports lacking VBUS can function as host ports with an
external power supply.

Third, and I hate to bring other drivers into this, most drivers have
yet to make usb-role-switch a mandatory flag.
The presence of dr_mode = <otg> alone shows the port is capable of both modes.
The usb-role-switch API is completely new, having only come around in
5.4 with an intel driver.

This patch prevents us from breaking all usb functionality, while
retaining the driver's behavior prior to the patch it addresses.
If you have a better method for accomplishing both goals, I'm happy to
hear any ideas.

>
> Thanks,
> JC
>
> On 9/8/20 11:01 PM, Peter Geis wrote:
> > Prior to implementing role switch support, all enabled ports enumerated
> > as host devices.
> > With role switch support enabled, device trees with otg ports which have
> > not been updated with usb-role-switch support now bail out during
> > enumeration.
> > This disables all xhci ports tied to the affected phy.
> >
> > Retain backwards compatibility by forcing host mode on otg ports which
> > are missing the usb-role-switch flag.
> > Disable ports explicitly defined as peripheral mode that are missing the
> > usb-role-switch flag.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > Reported-by: Matias Zuniga <matias.nicolas.zc@gmail.com>
> >
> > Fixes: e8f7d2f409a1 ("phy: tegra: xusb: Add usb-phy support")
> > ---
> >  drivers/phy/tegra/xusb.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> > index de4a46fe1763..c36dce13e0c6 100644
> > --- a/drivers/phy/tegra/xusb.c
> > +++ b/drivers/phy/tegra/xusb.c
> > @@ -734,10 +734,12 @@ static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
> >                       err = tegra_xusb_setup_usb_role_switch(port);
> >                       if (err < 0)
> >                               return err;
> > +             } else if (usb2->mode == USB_DR_MODE_PERIPHERAL) {
> > +                     dev_err(&port->dev, "mandatory usb-role-switch not found for %s mode, disabling port\n", modes[usb2->mode]);
> > +                     usb2->mode = USB_DR_MODE_UNKNOWN;
> >               } else {
> > -                     dev_err(&port->dev, "usb-role-switch not found for %s mode",
> > -                             modes[usb2->mode]);
> > -                     return -EINVAL;
> > +                     dev_warn(&port->dev, "usb-role-switch not found for %s mode, forcing host\n", modes[usb2->mode]);
> > +                     usb2->mode = USB_DR_MODE_HOST;
> >               }
> >       }
> >
> >
