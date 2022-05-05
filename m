Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7A5C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  5 May 2022 12:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378325AbiEENB0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 May 2022 09:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378330AbiEENBY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 May 2022 09:01:24 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E1853E25
        for <linux-tegra@vger.kernel.org>; Thu,  5 May 2022 05:57:43 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y3so8514179ejo.12
        for <linux-tegra@vger.kernel.org>; Thu, 05 May 2022 05:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RybWbrXcj8zBS10i0C/9NHfeL8tGwcNcqo6inv4EpAI=;
        b=d7ws1vmB8TNasv2lYZpKICd2vTQXUueLbTwFXYGVqHpQ8H7SyvH2fl6/g62DCgDWaA
         fRW66tJ5nWbqkYv2F+uwnoUBQ0VhC7V40TrefZW2K7wY5hhgHFI0bMpqYtJsxDlk/IP8
         AQFbrHBEVLvgQHq3gyz3ga5LiF8TDzDBKFzBq/3CLCP+nEXz1UNTy7EM8Pj2M6D7/bXx
         rVmyxES41BJeedBgaQs82ycRHSuZpGNQHb+HIHtYs19eNWBu0xI6aA5uVIsoFPKxMdhv
         jcdEBeWv/1d59lQKC+eLFIb73JCKOYx1yiBelaxx/HkTPjtP+53zYjRczjThZJQLBaYP
         beUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RybWbrXcj8zBS10i0C/9NHfeL8tGwcNcqo6inv4EpAI=;
        b=ZiPUiUhjcwK3eDdCPQoAbc6G61Fb9H0n7uKZwbh1tJpS6TxWovx3BepDWlr3HXuzr/
         rJW6Rp+37yEI38L0czBUUnYm+7KzFvd53J+KsKLKhG8cd8YuQJJ9tc5UUOrQJKYov7p+
         S0VAAfiVMZSwdmC7PhZeHkmK4gS3Bx6iFYKzosWKSUvlUfCckq9hzl55pAnc8/Wee42m
         hYH+c1BL7FlueqDwFVukqSBrahmbqZ+nWVTJ2tL6dvjbVLf0elsqJOfFxujPpb9NWEjr
         YaWM9gkYsmSKsWCNJVZMrazDxK2IHimrn7Xf6O7LUzRxZxvs8NAoxOYTm2kDlFpvy+xt
         kJ/A==
X-Gm-Message-State: AOAM532OZFJLY3CFOxynQqXca4PYgm2SrQJub2BHXO6hie1EeRovBwjV
        G9TWR+MC3SKLc4RSY8luyHgHIQ6rQ33ii3HbJMiNLZhrqMtrMg==
X-Google-Smtp-Source: ABdhPJzm7DvuddhoB6IlDfOb7PG3Zm7dp7T7j+cXQJ/VMgHGfFkalZ86UDm1bktcuRSPyzrSERhqQrQnGfs2PDceCNc=
X-Received: by 2002:a17:907:3e28:b0:6f4:3900:78f8 with SMTP id
 hp40-20020a1709073e2800b006f4390078f8mr21669903ejc.736.1651755462487; Thu, 05
 May 2022 05:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220504144406.36744-1-jonathanh@nvidia.com> <CAMRc=MeXUN6P8kWxB75GsXdKD7Owz9mX5HpgfQoMGeJh-z3=Rw@mail.gmail.com>
 <6629e06d06f647923c04502ce3133f76@kernel.org>
In-Reply-To: <6629e06d06f647923c04502ce3133f76@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 14:57:31 +0200
Message-ID: <CAMRc=Me=10YmTMQVWtBe6gUQxUSAL9fe_X7qq_F-mFGbWvrGtw@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: max77620: Make the irqchip immutable
To:     Marc Zyngier <maz@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, May 5, 2022 at 2:54 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2022-05-05 13:42, Bartosz Golaszewski wrote:
> > On Wed, May 4, 2022 at 4:44 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> >>
> >> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> >> immutable") added a warning to indicate if the gpiolib is altering the
> >> internals of irqchips. Following this change the following warning is
> >> now observed for the max77620 gpio driver ...
> >>
> >>  WARNING KERN gpio gpiochip0: (max77620-gpio): not an immutable chip,
> >>         please consider fixing it!
> >>
> >> Fix the above warning by making the max77620 gpio driver immutable.
> >>
> >> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >> ---
> >
> > Queued for fixes, thanks!
>
> You mean fixes for *5.19*, right?
>

Of course I did. 100%. And I'll stick to this version. :)

(Thanks for the heads-up!)

Bart
