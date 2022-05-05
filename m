Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E31C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  5 May 2022 12:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377375AbiEEMqA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 May 2022 08:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238474AbiEEMp6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 May 2022 08:45:58 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1F35535E
        for <linux-tegra@vger.kernel.org>; Thu,  5 May 2022 05:42:19 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id p18so5053853edr.7
        for <linux-tegra@vger.kernel.org>; Thu, 05 May 2022 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nToHf9Yxrt+r3K1vMdQKligyD+NhWuMXaR0L1laGIcQ=;
        b=MIGeaU48Hxcr0gAk/0JUERKudMJ+2VgGvtXQOyQR2FUEQeC8eFnEf5W06jJVA9iQfU
         +IG5oyZaIHvk1wNlDTpmYhOH8uLeDZPV4etYWxHGMqd7p28h9+iY0E03t+Z58hHrTiHZ
         Gqvid7MFQkRM2KTWd8vs1lxMo6aVE3S83f3+qzfkkL2LzrOwKU/YoJgs49dHnyOt6n2j
         piYz00xlNGfUgi78mOiyQ31sAwWJuqxkjm+KxvB42oQSXZPiFZfrtXhS68YI2hANPBQ9
         cMhT6NwUeHuY62ICFtRx9YBHEpchMriV7lpMAkoiUuZrCsFFtmbFFfH9rVp5pH5VwyeZ
         wWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nToHf9Yxrt+r3K1vMdQKligyD+NhWuMXaR0L1laGIcQ=;
        b=Pw0NH8D/xkZ5b04qGPs18D6gXODrv/p38356ITcka+Ayzq9Vlvly0Ab/OL2IQ4Wd0I
         oYica0bitHFvyZguZdbBTVvGLS+rtjzRp7HizpxyNRmX8Q6sXUdtgU9Wj+wC0U25Z2aZ
         PAtgaTUd98llq0r8/oM5L+Hd7np+5jTtRgYowpst3fMoOvo6CrdtEyf/prVfzgACtBkS
         vy/TZwSVBfcs5OtDu1DIoIYyBFnsNgPcEOTcI8m9OQI5Mg9HaRvcaosjEQnKeE0Smv+9
         Xw490NRHTjz/dakf1nSIoXCOk1nruRT1R4/YYGLvtuu7vV4xdhWC43DZYVNU8jd1DJVR
         yZRg==
X-Gm-Message-State: AOAM531GeiE1vPUKXONYYQHqVt9SaQ4cO8xB9aJgScN/5YcNgtLYs+sM
        X2ot+dT+bGQd7hrGhwdIxH1RoK28IcDjowV/JOZ2Kg==
X-Google-Smtp-Source: ABdhPJy+UBUQ27FMN0Soniwr9i5FVjEAqUBJaKMZp7kF/Zi2oKeANJCiph04E/neh8RBlyNRknfzqdKMu9O4zIR2y1s=
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr29329998edb.288.1651754537667; Thu, 05
 May 2022 05:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220504144406.36744-1-jonathanh@nvidia.com>
In-Reply-To: <20220504144406.36744-1-jonathanh@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 14:42:07 +0200
Message-ID: <CAMRc=MeXUN6P8kWxB75GsXdKD7Owz9mX5HpgfQoMGeJh-z3=Rw@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: max77620: Make the irqchip immutable
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, May 4, 2022 at 4:44 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips. Following this change the following warning is
> now observed for the max77620 gpio driver ...
>
>  WARNING KERN gpio gpiochip0: (max77620-gpio): not an immutable chip,
>         please consider fixing it!
>
> Fix the above warning by making the max77620 gpio driver immutable.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Queued for fixes, thanks!

Bart
