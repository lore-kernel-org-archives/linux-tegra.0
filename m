Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B339EC433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 16:53:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8667A23B40
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 16:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbhANQxX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Jan 2021 11:53:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbhANQxU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Jan 2021 11:53:20 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7037CC061575
        for <linux-tegra@vger.kernel.org>; Thu, 14 Jan 2021 08:52:40 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id u18so137365ybu.12
        for <linux-tegra@vger.kernel.org>; Thu, 14 Jan 2021 08:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=27zQ/ygWyI21K284m8AlMgtMN5IZhUfhEaSCqrYdflI=;
        b=oH+Ce7c5Z3Znqj06jKHUPZ9wRz8ggvZv9xbX/3pFgJ+2ehWcXAStBc4zknfFxnXQ2x
         53FjliXq4ddpT7ijHY7MPmHt9/aUUyNp+vJahAUBi6kxB7tcPUKSf9fxQcoFDY5ynpty
         Quvb92PRZTLucq7jTQujKT8Hl+oU0D9PkeMSfrdhBIJJcSCWaqtWk1IfAkzzaOWjEBf8
         oHxkSZDO3EbygW+H9xpAIwsWnzsfGmd7kRAfTW1BVg9NtFIgHDU6D9M8ATMKTENzv6TO
         1qdYlR0f3J+knnRc/0zYajGTHGomDLSfO6ZrOhuUWwTM0dlqL9Ujb+9BXxaW/kO+MJB6
         XtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=27zQ/ygWyI21K284m8AlMgtMN5IZhUfhEaSCqrYdflI=;
        b=pCjlxD0czTis6HBcBi7CzT3XhKd0pT+/pHucHy6xfO4cEh1D7Fx6mCAY6McUF+dgcE
         nBYzqDuUEDVtRDUrry0zS6NPCyTRDwqEkPL0Xl3c5LOFb23d0QOv6+G46bSlRYlFXNSr
         8HOfVkFi4w//cQUXjI/dZ0YXUd1+IzGolYdl0YoPCfi1KIZ/KbgqM+PGBwdo4gT+Aw7e
         0GqqnFV9qAkOYZXP27G0SfGr1eD8auSHgApAgTjp7nBDJy79F9LLRY37KTalG7E9Euxr
         xZnbKM5pBXuBWod4KsVrrtltgf6ryBM2X1lkVI8AmreEgPjfZ5GtQDy+PG7WpG88z6Cy
         p2Og==
X-Gm-Message-State: AOAM531VpuBkEO9ctr/8pWaYkOG4Qn5N6bli8+ctNPNG3BsW9MTZeErJ
        hvGSZIupR8gNHcTWbPwDtclvWuuAd1E7+yXajoWs/bnVv3uhnQ==
X-Google-Smtp-Source: ABdhPJykSjRF4+IjWbKmRHChAN1ZDS4CaoJZna4MlKg2SaTwQ5sQNN+g8QyPWBMQ079xfpzD1jByBsYGpfkNvAJeGHA=
X-Received: by 2002:a25:77d4:: with SMTP id s203mr5790072ybc.32.1610643159431;
 Thu, 14 Jan 2021 08:52:39 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <X/dpkgTnUk+inKHK@kroah.com> <e28e1f38d87c12a3c714a6573beba6e1@kernel.org>
 <ba2fcbfb-d714-2f73-3bd0-962f49363b62@nvidia.com> <CAGETcx8pdPnH1ndOCoi7Qyz8DDshCfMTzDLQM=oEaCjyds9reA@mail.gmail.com>
 <17703ac8-2238-0b64-3c98-ddadc7ae8a36@nvidia.com> <CAGETcx-=y4Ps41Lb0b_MTCbNTC_ah0cJTmPP+GajywFBc7kEfw@mail.gmail.com>
 <f0240065-a4a0-d985-a696-eba4d42ea580@nvidia.com>
In-Reply-To: <f0240065-a4a0-d985-a696-eba4d42ea580@nvidia.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 14 Jan 2021 08:52:03 -0800
Message-ID: <CAGETcx_QmbOcof5T8Wo_zFXKB+qswPN3Cbwz5a6A+m+VrnWg0A@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jan 14, 2021 at 8:48 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 14/01/2021 16:40, Saravana Kannan wrote:
> > On Thu, Jan 14, 2021 at 3:35 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> >>
> >>
> >> On 13/01/2021 21:29, Saravana Kannan wrote:
> >>
> >> ...
> >>
> >>>> I am seeing the same problem on Tegra30 Cardhu A04 where several regulators
> >>>> are continuously deferred and prevents the board from booting ...
> >>>>
> >>>> [    2.518334] platform panel: probe deferral - supplier regulator@11 not ready
> >>>>
> >>>> [    2.525503] platform regulator@1: probe deferral - supplier 4-002d not ready
> >>>>
> >>>> [    2.533141] platform regulator@3: probe deferral - supplier regulator@101 not ready
> >>>>
> >>>> [    2.540856] platform regulator@5: probe deferral - supplier regulator@101 not ready
> >>>>
> >>>> [    2.548589] platform regulator@6: probe deferral - supplier regulator@101 not ready
> >>>>
> >>>> [    2.556316] platform regulator@7: probe deferral - supplier regulator@101 not ready
> >>>>
> >>>> [    2.564041] platform regulator@8: probe deferral - supplier regulator@101 not ready
> >>>>
> >>>> [    2.571743] platform regulator@9: probe deferral - supplier regulator@101 not ready
> >>>>
> >>>> [    2.579463] platform regulator@10: probe deferral - supplier regulator@101 not ready
> >>>>
> >>>> [    2.587273] platform regulator@11: probe deferral - supplier regulator@101 not ready
> >>>>
> >>>> [    2.595088] platform regulator@12: probe deferral - supplier regulator@104 not ready
> >>>>
> >>>> [    2.603837] platform regulator@102: probe deferral - supplier regulator@104 not ready
> >>>>
> >>>> [    2.611726] platform regulator@103: probe deferral - supplier regulator@104 not ready
> >>>>
> >>>> [    2.620137] platform 3000.pcie: probe deferral - supplier regulator@5 not ready
> >>>
> >>> Looks like this is not the whole log? Do you see any "wait for
> >>> supplier" logs? That's what all these boot issues should boil down to.
> >>> And as usual, pointer to DT for this board please.
> >>
> >> Ah yes I see ...
> >>
> >>  platform regulator@1: probe deferral - wait for supplier tps65911@2d
> >
> > Do you mind sharing the full log please? It's hard to tell you
> > anything useful with bits and pieces of logs.
> >
> >> Yes the device-tree for this board can be found here [0]. Looks like
> >> there is a circular dependency between the vddctrl_reg and vddcore_reg.
> >> This is part of coupled regulators which have a two-way linkage [1]. So
> >> this change appears to conflict with this.
> >
> > fw_devlink doesn't track "regulator-coupled-with". So that's probably
> > not it. Also, this patch series was made to handle simple cycles
> > properly. It'll functionally disable the device links it created when
> > it comes to probe ordering. Only two overlapping cycles might cause
> > issues -- and even that, not all the time. So yeah, full log please.
>
>
> No problem. Please find attached.

Thanks! I think you forgot to enable those logs though. Also, while
you are at it, maybe enable the logs in device_link_add() too please?

-Saravana

>
> Cheers
> Jon
>
>
> --
> nvpublic
