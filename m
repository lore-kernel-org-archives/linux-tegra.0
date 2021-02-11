Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F537C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Feb 2021 00:03:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56C0264E2E
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Feb 2021 00:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhBKADa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Feb 2021 19:03:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbhBKADZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Feb 2021 19:03:25 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D345CC0613D6
        for <linux-tegra@vger.kernel.org>; Wed, 10 Feb 2021 16:02:44 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id k4so3864007ybp.6
        for <linux-tegra@vger.kernel.org>; Wed, 10 Feb 2021 16:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EgCGCJm5koYnhr/RPPq+n2xYwvOcBkd16wcMopchiKo=;
        b=TAG8NoBLiTimTL7kRP0AsQpH3rdKezMcGidrjW+cis/Dn6ItzXe6guQQq2jHb1qcYu
         o3d40ex2FJP+mZuVIiS3pzkZBnJTNsczlg7mVI30Tto3Gu0bcT3j3P6jOgWdeje2t67p
         WF/QBtyXXuFjHPelyYNPonj4unnRui+4gKu8RQD0+ia0nenm6DSNUKZCFnuF/KKekd07
         W54CxSOcIDiFLkhtJxAdx4wcPAWHSt16tDUKfmz1MHJFCsAevaYgOgsPANA3Ew7dcq5x
         Eh4WiiREkxZN6ml3EJp/OecseDARpeCUyNiS0Qh6/04ivZP9f/vrizw9+qpQToG+ZqhH
         suHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EgCGCJm5koYnhr/RPPq+n2xYwvOcBkd16wcMopchiKo=;
        b=RkRCFXdiebeUVK8GX0uSrbTwDbYMt6adMBS0LbOZxiIRl/sSTr4lzawq1tDhqe/K6l
         tvjUP7v9YeGRN9HsjvGUNlcv/xjAksfJRNlYOCPshJggyJ3G0+Jkc+YjxhFEr7McJIeL
         3bczivFA5F7aUlusns6xPxMX2zv9CXGRFqNPVp+0BbXj9y/C4D2npJ+B2uZoxTp11xg7
         FzswGAWtKIlyMQN/hB9efm0pWW38SGsNXO82O/RFieeL7wUxMqVfwT4RsetXAguOYv59
         8wivTAEo8p8N9tHfQKBLfI4HGT8MbXckYHshW4M+Hd5DF20d45ZpiPvnxaOTSAWjALSe
         Pkeg==
X-Gm-Message-State: AOAM530BtUJiXSlvwpzJQPRAMCTN3M0mvi++dgORiCQDuXvxM+8ERIVG
        UFD/RBRqmE3yw4Dh0ipGt+ra3bU7qPwSVY1ZocH53w==
X-Google-Smtp-Source: ABdhPJw5AlLMwbA5hD7qHn3z6rWV/fIUFYudgqcn9BdEbeS9BxgyVHz3uICezGkmzxhnWTST55sS6PEHN0HfI6Iv0dg=
X-Received: by 2002:a25:af0b:: with SMTP id a11mr7600189ybh.228.1613001763827;
 Wed, 10 Feb 2021 16:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <56f7d032-ba5a-a8c7-23de-2969d98c527e@nvidia.com> <CAGETcx9FAAa+gUOTJX76DGGOAE4g3cTbZhwNQ-pLioYzg=fTOw@mail.gmail.com>
 <17939709-f6f4-fa9c-836f-9779081c4087@nvidia.com> <CAGETcx_1x7LFprsEM+-X8Y42-sbajBav5Bik4U=s4Z5XCSZtUg@mail.gmail.com>
 <e11bc6a2-ec9d-ea3b-71f7-13c9f764bbfc@nvidia.com> <6a43e209-1d2d-b10a-4564-0289d54135d3@nvidia.com>
In-Reply-To: <6a43e209-1d2d-b10a-4564-0289d54135d3@nvidia.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 10 Feb 2021 16:02:07 -0800
Message-ID: <CAGETcx9ZaBLRVPqiSkPf_4Tm5dDLNbLBM2RmHk1jr7yLp_1CCQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Thu, Jan 28, 2021 at 7:03 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 14/01/2021 16:56, Jon Hunter wrote:
> >
> > On 14/01/2021 16:47, Saravana Kannan wrote:
> >
> > ...
> >
> >>> Yes this is the warning shown here [0] and this is coming from
> >>> the 'Generic PHY stmmac-0:00' device.
> >>
> >> Can you print the supplier and consumer device when this warning is
> >> happening and let me know? That'd help too. I'm guessing the phy is
> >> the consumer.
> >
> >
> > Sorry I should have included that. I added a print to dump this on
> > another build but failed to include here.
> >
> > WARNING KERN Generic PHY stmmac-0:00: supplier 2200000.gpio (status 1)
> >
> > The status is the link->status and looks like the supplier is the
> > gpio controller. I have verified that the gpio controller is probed
> > before this successfully.
> >
> >> So the warning itself isn't a problem -- it's not breaking anything or
> >> leaking memory or anything like that. But the device link is jumping
> >> states in an incorrect manner. With enough context of this code (why
> >> the device_bind_driver() is being called directly instead of going
> >> through the normal probe path), it should be easy to fix (I'll just
> >> need to fix up the device link state).
> >
> > Correct, the board seems to boot fine, we just get this warning.
>
>
> Have you had chance to look at this further?

Hi Jon,

I finally got around to looking into this. Here's the email[1] that
describes why it's done this way.

[1] - https://lore.kernel.org/lkml/YCRjmpKjK0pxKTCP@lunn.ch/

>
> The following does appear to avoid the warning, but I am not sure if
> this is the correct thing to do ...
>
> index 9179825ff646..095aba84f7c2 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -456,6 +456,10 @@ int device_bind_driver(struct device *dev)
>  {
>         int ret;
>
> +       ret = device_links_check_suppliers(dev);
> +       if (ret)
> +               return ret;
> +
>         ret = driver_sysfs_add(dev);
>         if (!ret)
>                 driver_bound(dev);

So digging deeper into the usage of device_bind_driver and looking at
[1], it doesn't look like returning an error here is a good option.
When device_bind_driver() is called, the driver's probe function isn't
even called. So, there's no way for the driver to even defer probing
based on any of the suppliers. So, we have a couple of options:

1. Delete all the links to suppliers that haven't bound. We'll still
leave the links to active suppliers alone in case it helps with
suspend/resume correctness.
2. Fix the warning to not warn on suppliers that haven't probed if the
device's driver has no probe function. But this will also need fixing
up the cleanup part when device_release_driver() is called. Also, I'm
not sure if device_bind_driver() is ever called when the driver
actually has a probe() function.

Rafael,

Option 1 above is pretty straightforward.
Option 2 would look something like what's at the end of this email +
caveat about whether the probe check is sufficient.

Do you have a preference between Option 1 vs 2? Or do you have some
other option in mind?

Thanks,
Saravana

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 5481b6940a02..8102b3c48bbc 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1247,7 +1247,8 @@ void device_links_driver_bound(struct device *dev)
                         */
                        device_link_drop_managed(link);
                } else {
-                       WARN_ON(link->status != DL_STATE_CONSUMER_PROBE);
+                       WARN_ON(link->status != DL_STATE_CONSUMER_PROBE &&
+                               dev->driver->probe);
                        WRITE_ONCE(link->status, DL_STATE_ACTIVE);
                }

@@ -1302,7 +1303,8 @@ static void __device_links_no_driver(struct device *dev)
                if (link->supplier->links.status == DL_DEV_DRIVER_BOUND) {
                        WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
                } else {
-                       WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));
+                       WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY) &&
+                               dev->driver->probe);
                        WRITE_ONCE(link->status, DL_STATE_DORMANT);
                }
        }
