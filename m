Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA1AC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Feb 2021 15:14:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DACCA64F4D
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Feb 2021 15:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhBKPKw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Feb 2021 10:10:52 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:41451 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhBKPFR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Feb 2021 10:05:17 -0500
Received: by mail-ot1-f47.google.com with SMTP id s107so5371137otb.8;
        Thu, 11 Feb 2021 07:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=odXzeNpHnFlb3JcqlSWIS6xR43phsZ5nCfEJE1dbmaM=;
        b=lPwbXEJQ9T0KNMnD4Wb82I/XTJOlWPxGmBkmAzhU+LKssIhSdYJIjL6MbLYQ8jBoen
         OokCKBrURiGq0m1xhJ2wMklSfV28Pt7L4XfH/ufbRXWLwT8s6gdObs8ErVNu70ZuUbUE
         l4iKESIcdYNxKVrmHf2hecDupL6w+pCJ89jr9YWy5njbIUvSLP/zp3UR7hgODhYhHla2
         pFIFbgiFEB/Q1uSl0GJcWxnkIZyBva4hB9Hdok2/2bH4taf1Lte5fmkjCOinliDIYIHx
         LbsHzc+fQoTWJkiYnLbgErFYvaeS9ijGfBz8yf9d6keSkxVpkrbtBLQAacxRQd/ufpRx
         svig==
X-Gm-Message-State: AOAM530lsU90nvEJHQI12d5WUdKQ4fDBCexgqI287755L6w92x/WCfGi
        WrKXzk4hmsm9Uvj5s50cyV2h0wLsQvT1QY+meGw=
X-Google-Smtp-Source: ABdhPJyR/OEqpMhycwEfxdCGQ/P9SD37L71sVXqEEmSvBXj8v0/3FfvrYiEEidtvHjAk+baAlYCf4w9Q1P9Zs2JEe/4=
X-Received: by 2002:a05:6830:1481:: with SMTP id s1mr6177129otq.206.1613055834871;
 Thu, 11 Feb 2021 07:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <56f7d032-ba5a-a8c7-23de-2969d98c527e@nvidia.com> <CAGETcx9FAAa+gUOTJX76DGGOAE4g3cTbZhwNQ-pLioYzg=fTOw@mail.gmail.com>
 <17939709-f6f4-fa9c-836f-9779081c4087@nvidia.com> <CAGETcx_1x7LFprsEM+-X8Y42-sbajBav5Bik4U=s4Z5XCSZtUg@mail.gmail.com>
 <e11bc6a2-ec9d-ea3b-71f7-13c9f764bbfc@nvidia.com> <6a43e209-1d2d-b10a-4564-0289d54135d3@nvidia.com>
 <CAGETcx9ZaBLRVPqiSkPf_4Tm5dDLNbLBM2RmHk1jr7yLp_1CCQ@mail.gmail.com>
In-Reply-To: <CAGETcx9ZaBLRVPqiSkPf_4Tm5dDLNbLBM2RmHk1jr7yLp_1CCQ@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 11 Feb 2021 16:03:43 +0100
Message-ID: <CAJZ5v0iv9fRzM8cbGrPhutPNpod-gLWcZ8fWzDpfJ=NUVmm5Og@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 11, 2021 at 1:02 AM Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Jan 28, 2021 at 7:03 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> >
> >
> > On 14/01/2021 16:56, Jon Hunter wrote:
> > >
> > > On 14/01/2021 16:47, Saravana Kannan wrote:
> > >
> > > ...
> > >
> > >>> Yes this is the warning shown here [0] and this is coming from
> > >>> the 'Generic PHY stmmac-0:00' device.
> > >>
> > >> Can you print the supplier and consumer device when this warning is
> > >> happening and let me know? That'd help too. I'm guessing the phy is
> > >> the consumer.
> > >
> > >
> > > Sorry I should have included that. I added a print to dump this on
> > > another build but failed to include here.
> > >
> > > WARNING KERN Generic PHY stmmac-0:00: supplier 2200000.gpio (status 1)
> > >
> > > The status is the link->status and looks like the supplier is the
> > > gpio controller. I have verified that the gpio controller is probed
> > > before this successfully.
> > >
> > >> So the warning itself isn't a problem -- it's not breaking anything or
> > >> leaking memory or anything like that. But the device link is jumping
> > >> states in an incorrect manner. With enough context of this code (why
> > >> the device_bind_driver() is being called directly instead of going
> > >> through the normal probe path), it should be easy to fix (I'll just
> > >> need to fix up the device link state).
> > >
> > > Correct, the board seems to boot fine, we just get this warning.
> >
> >
> > Have you had chance to look at this further?
>
> Hi Jon,
>
> I finally got around to looking into this. Here's the email[1] that
> describes why it's done this way.
>
> [1] - https://lore.kernel.org/lkml/YCRjmpKjK0pxKTCP@lunn.ch/
>
> >
> > The following does appear to avoid the warning, but I am not sure if
> > this is the correct thing to do ...
> >
> > index 9179825ff646..095aba84f7c2 100644
> > --- a/drivers/base/dd.c
> > +++ b/drivers/base/dd.c
> > @@ -456,6 +456,10 @@ int device_bind_driver(struct device *dev)
> >  {
> >         int ret;
> >
> > +       ret = device_links_check_suppliers(dev);
> > +       if (ret)
> > +               return ret;
> > +
> >         ret = driver_sysfs_add(dev);
> >         if (!ret)
> >                 driver_bound(dev);
>
> So digging deeper into the usage of device_bind_driver and looking at
> [1], it doesn't look like returning an error here is a good option.
> When device_bind_driver() is called, the driver's probe function isn't
> even called. So, there's no way for the driver to even defer probing
> based on any of the suppliers. So, we have a couple of options:
>
> 1. Delete all the links to suppliers that haven't bound.

Or maybe convert them to stateless links?  Would that be doable at all?

> We'll still leave the links to active suppliers alone in case it helps with
> suspend/resume correctness.
> 2. Fix the warning to not warn on suppliers that haven't probed if the
> device's driver has no probe function. But this will also need fixing
> up the cleanup part when device_release_driver() is called. Also, I'm
> not sure if device_bind_driver() is ever called when the driver
> actually has a probe() function.
>
> Rafael,
>
> Option 1 above is pretty straightforward.

I would prefer this ->

> Option 2 would look something like what's at the end of this email +
> caveat about whether the probe check is sufficient.

-> because "fix the warning" really means that we haven't got the
device link state machine right and getting it right may imply a major
redesign.

Overall, I'd prefer to take a step back and allow things to stabilize
for a while to let people catch up with this.

> Do you have a preference between Option 1 vs 2? Or do you have some
> other option in mind?
>
> Thanks,
> Saravana
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 5481b6940a02..8102b3c48bbc 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1247,7 +1247,8 @@ void device_links_driver_bound(struct device *dev)
>                          */
>                         device_link_drop_managed(link);
>                 } else {
> -                       WARN_ON(link->status != DL_STATE_CONSUMER_PROBE);
> +                       WARN_ON(link->status != DL_STATE_CONSUMER_PROBE &&
> +                               dev->driver->probe);
>                         WRITE_ONCE(link->status, DL_STATE_ACTIVE);
>                 }
>
> @@ -1302,7 +1303,8 @@ static void __device_links_no_driver(struct device *dev)
>                 if (link->supplier->links.status == DL_DEV_DRIVER_BOUND) {
>                         WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
>                 } else {
> -                       WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));
> +                       WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY) &&
> +                               dev->driver->probe);
>                         WRITE_ONCE(link->status, DL_STATE_DORMANT);
>                 }
>         }
