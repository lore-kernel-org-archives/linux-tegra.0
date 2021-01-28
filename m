Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B2EC433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 17:32:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22E3464E15
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 17:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbhA1Rb7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jan 2021 12:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233210AbhA1R3d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jan 2021 12:29:33 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25CEC06178C
        for <linux-tegra@vger.kernel.org>; Thu, 28 Jan 2021 09:28:34 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id q201so2609625ybg.8
        for <linux-tegra@vger.kernel.org>; Thu, 28 Jan 2021 09:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7av+qiTQZV3dxo/ylCroa3UeBjeWliUtpULjelR+tk0=;
        b=PBQ47ae/BDuGKLUSFE4EPbMi2nUgEfy/B4Cnh6t2lgzvw67DvVcsW619PyHiHJD62L
         QR2UeujuD2e3TrpS7cAbViol2HVckcv3KVwa3DfjZcwdJ5EeADbrWzMYMymOZzAvXXEj
         8zn6EbEDsSCLwFHikU8W/XXnvWInIaIuvqmd5fFHCkIo6H9Fy/5omZZU3fXuH/wFMRcu
         RW1ed4hdtRHzsVq1kYzmh9EOQfpE9suNAiDQ5tNIozpYAm6egMruUw8mgCAcOm37rpwG
         9Ckaz9OrW5PQyEzn5X06QtA1IU+LgtKIdOM3Td4DTli1DUP/kqCvso2ppObFTSpD+CHU
         VAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7av+qiTQZV3dxo/ylCroa3UeBjeWliUtpULjelR+tk0=;
        b=QQtPpWCsFx3NaFVKLRA64p1CjO1JFjY8RHM95IYAKcH93qjR/jcyey8hHPAf0wtgN3
         7mQkIiC38a/rRVZC81TKLpg4Nf/IBQ56koUcjnM08B0SHQHaNzoCpt323W0gW6DWux/s
         2bu2pvQg+DqECF4ifNhWmUCmntHCJYzsTpgGlzRpm5krvhiqSH9lLCoFyVqBTInR5SlW
         g/xGO14QpPv3+Ohz1AllevtZ5ZpvScbXWzRyxJUk9GwLjocTchNhDXAlHUw7HSd6zfpR
         G6fFXjkevUVs6JNE6ZjF79E4/PBYAOUKrDyxctwpXxmi4DCnZ2T5pvp17ZojPHtKMmZ7
         NVPA==
X-Gm-Message-State: AOAM532pJCsHilGOvCPh1fUgDWo3s+VUVmA6n6eDpSGuOBTSMbSjlqfh
        tCF/ABFnfzQzhJJbAAxobqkgbGaNkeKjQJAoSXceeQ==
X-Google-Smtp-Source: ABdhPJzYQqVUv4lbnOV7+/PB0jFXXhvYgwy7D/kI18VsW42oFthpR2s6n2HsVqw8nB2k1NPKfgbHpDk12IdZnpRXuc8=
X-Received: by 2002:a25:718b:: with SMTP id m133mr374069ybc.412.1611854913851;
 Thu, 28 Jan 2021 09:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <56f7d032-ba5a-a8c7-23de-2969d98c527e@nvidia.com> <CAGETcx9FAAa+gUOTJX76DGGOAE4g3cTbZhwNQ-pLioYzg=fTOw@mail.gmail.com>
 <17939709-f6f4-fa9c-836f-9779081c4087@nvidia.com> <CAGETcx_1x7LFprsEM+-X8Y42-sbajBav5Bik4U=s4Z5XCSZtUg@mail.gmail.com>
 <e11bc6a2-ec9d-ea3b-71f7-13c9f764bbfc@nvidia.com> <6a43e209-1d2d-b10a-4564-0289d54135d3@nvidia.com>
In-Reply-To: <6a43e209-1d2d-b10a-4564-0289d54135d3@nvidia.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 28 Jan 2021 09:27:57 -0800
Message-ID: <CAGETcx89jzFPD-op7xKgooHDtHjOWufQsKQaP6ijP-hDPGPCEw@mail.gmail.com>
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

Hi Jon,

>
> Have you had chance to look at this further?

No, I feel like I'm just spending all my "upstream time" just
replying to email :)

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

Yeah I knew calling this function (where device_bind_driver() was
called) would take away the warning, but I first want to understand
why the caller wasn't going through the typical device/driver probe
path before I started adding more of the typical device/driver probe
path code in. I don't want to add in code they might have been
explicitly trying to avoid.

Also, once you do this, you'll need the reverse of this (deleting
links/unsetting state change) somewhere.

Also, device_bind_driver() is used in a bunch of places. Need to check
if it's right to call device_links_check_suppliers() in those
instances.

Feel free to look at those items above. I'll try to get to this once I
take care of the "my device is not working!" issues.

Thanks,
Saravana

>         ret = driver_sysfs_add(dev);
>         if (!ret)
>                 driver_bound(dev);
>
