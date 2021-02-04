Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F94C433DB
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 04:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4CDE64F4A
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 04:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhBDEKE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 23:10:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbhBDEKD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 23:10:03 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DEDDC0613ED
        for <linux-tegra@vger.kernel.org>; Wed,  3 Feb 2021 20:09:23 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id i30so2162828ota.6
        for <linux-tegra@vger.kernel.org>; Wed, 03 Feb 2021 20:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/aRsTf5r3vSnsChGjvywC+Rom9SLmJFnNQZY7Xwx4AI=;
        b=bKpJK55OP76JeJW0uaw1nOMSa3+jWZRrjnZvyMmllRNGFr91Q1AJLLm9Q+V1wxEaYT
         uLXaaaA2j7ks0baGuJYcT7CKh1Mw9TikKYk5qskkmP3ZNYGJMvJ4dCt8++7ac/n8VLLm
         6Nk2N2EJnLhnTI3AA0HQYZiHqfMM9OkPEvfZekfdIN3U/YhRZujRvL6MbhoJ8T8vdhx+
         Lbw35y6mWowovPGZE7Br2T/kuJnkB+eqoVQUd2xRlKPw2dww4YWP0mEapMGlokt7gDqY
         dSFofes+H2Tg7qYP1keHm49EpQVj87s+fB5aoFGIxzqgnmo1Evxhrx4EwtCKm/SoQuK/
         k7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/aRsTf5r3vSnsChGjvywC+Rom9SLmJFnNQZY7Xwx4AI=;
        b=iWyPZI5syIs/hIz5uhKV/tNIjeDvDq2a6cBBBjX4iON1pdslK2JqEgWd222zlMdOfU
         qOqLLsSjBncSCsuHR+LMErI8MbOtESBKfl3CeKs2taiC6iuuoXbMtdjc1dgO4uTrhJ8E
         agrhjdzuf3owdfx35qeDWOLn3P0z/FCVm5X6uYVd+hUI3Ei8asOjQujO74bgUiyx+GrU
         srRzkXiwbRcBdVM74jyxaKRPmwlgtRfKHHKd+Xz2lcpfm2wNc16uGlxDa58MuF1/89ls
         Woj3OokeHUsh7hLx16Bcj83C29wIB7msdBwUJNB5psjSji0QxrsCUYJdkIUs1G/2TbLQ
         cUYg==
X-Gm-Message-State: AOAM531zMVNJA4rOmrdfMB/Bd+Uvd9VEtsSmtts6keHsft2S1SNXRmIi
        x7Ljf06DIOGuWVLVbKmk79KeIXnSwM1U5pxHEq68Ow==
X-Google-Smtp-Source: ABdhPJztfbblDWJAum0rp2kx4kxYhaBZ/GB/+ARxgQUfogt2/BIgaLUBWRGQB4yqZy5S64oLU9+m7vICK8xHFUU22I4=
X-Received: by 2002:a9d:4544:: with SMTP id p4mr4171854oti.368.1612411762147;
 Wed, 03 Feb 2021 20:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20201201213019.1558738-1-furquan@google.com> <e77e0569-568a-f7fb-9f0d-e64943b467f0@gmail.com>
 <CAJZ5v0jhniqG43F6hCqXdxQiQZRc67GdkdP0BXcRut=P7k7BVQ@mail.gmail.com>
 <X/2fzghPXnuDNBPU@kroah.com> <CAEGmHFEpPTuRuWFt0ba022BmGfaDmSTAgEApW9EzAa5CitmtbA@mail.gmail.com>
 <b4a931cf-5974-64d0-fdf2-693e418f3110@gmail.com> <CAAd53p6PtdCRe50PFdn35S1mXHBACKUpmVVcE2qfZgVT3MKj5Q@mail.gmail.com>
In-Reply-To: <CAAd53p6PtdCRe50PFdn35S1mXHBACKUpmVVcE2qfZgVT3MKj5Q@mail.gmail.com>
From:   Furquan Shaikh <furquan@google.com>
Date:   Wed, 3 Feb 2021 20:09:05 -0800
Message-ID: <CAEGmHFG-XXfhcO2ZJU0HwSmTAsYC-04F6by5td3+Ax4GbYLy+g@mail.gmail.com>
Subject: Re: [PATCH] drivers: core: Detach device from power domain on shutdown
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Feb 3, 2021 at 6:37 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Hi Furquan,
>
> On Wed, Jan 13, 2021 at 10:31 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> [snipped]
> > Thank you all for addressing this problem!
>
> Are you still working on the alternate solution?

Yes, it is in my pipeline, but I have been distracted because of some
other high priority tasks. I plan to push something for review in ~3-4
weeks.

> This patch can
> address S5 power consumption issue for some laptops:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1912935
>
> Kai-Heng
