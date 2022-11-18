Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028F7C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 08:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241365AbiKRICJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 03:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241323AbiKRICD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 03:02:03 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98FC48CF23
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 00:02:02 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id p21so3903638plr.7
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 00:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bifffbLjthsyQVz7raaaU3RAzhugC6m3nHnZyQVgbWk=;
        b=XAX8+PkGu+6HYW0syXQQeiMKXG9hnaZTlTJEpKHAe0/8zbt7bWVTzXPHLDXI9bihrr
         hQtMcTnaxu1Q7XZudcR8KAEOJii+Q3RvgLFkgSMhkVvBxQ7HLy2WiV28VCBEWeJVz21a
         NbHbJ8R7teVAhkIJn7c8ECw00V0+LleZIyjXgJ9ICxstt9dtynqxLt+Y2fPOHKwfTstF
         Gt8KJj7CQFheeRST38mf6npWn0AgOW6Ty1/aTOcbaz5cwbjuLZfaBYNS2RMK5O9N750C
         pGtpQM5THaBF/4cWP0YWEF4knpp8n8UgGoGVX93BBuTfW0SlgsT8Ysj5jim4NVUK4j52
         b6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bifffbLjthsyQVz7raaaU3RAzhugC6m3nHnZyQVgbWk=;
        b=LLQNAwrvdoY1IZIuPCfKF+cZzVHfBE8LzZoEPP2hn2wJPF//ZyZ48NB250JXtm5Tvx
         5udu+3dGV/JppP8rNvU6zNh4TjBHVxZTWej9hsFC2GCHNwzgbjmaV788412MR3Ndbybz
         1nxonLcGzDHlNNzv6ZQitNhMXLCr1rrARdCnIxZd5j9YmvsnKjrCRwwLUis8RtW2pxvV
         X57gFa0wEXbkbBeYUV42TrYvfW0JqXWU1pABqWbXFV4RZmtMFu4fYjJj5yun2L+n+Npd
         JtATSZOwcSNaLgQN0L7eipiL8OfGGw5BmIln3ngvWnjiTXK500ZHLsqKTTGZc/1B7I5Y
         KAnA==
X-Gm-Message-State: ANoB5plnfKXDyGGbSo/4bbISbsBO7rzr1wCkxQns6EAXn+FIXRJJWR7s
        6cdqysb1he4E9Nify99ludOGgXPa+d6yfczSSNN1cA==
X-Google-Smtp-Source: AA0mqf7uIxS1uD0aKZ0+PKLuC65tvNGec6Ak2rcHaY8X8Q5yIKNb+Vht2qiD72nu7B3QLiyaEGzexfyj1KQhqXgGFxQ=
X-Received: by 2002:a17:90a:7804:b0:211:2d90:321 with SMTP id
 w4-20020a17090a780400b002112d900321mr12688080pjk.84.1668758522152; Fri, 18
 Nov 2022 00:02:02 -0800 (PST)
MIME-Version: 1.0
References: <20221117182720.2290761-1-thierry.reding@gmail.com>
 <20221117182720.2290761-4-thierry.reding@gmail.com> <11a4e08b-f176-a39a-365c-278b08fc1bdb@intel.com>
In-Reply-To: <11a4e08b-f176-a39a-365c-278b08fc1bdb@intel.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 18 Nov 2022 09:01:23 +0100
Message-ID: <CAPDyKFoOWuWFUq+yzm-K+9yZZjpky54VdB84ea-nzw5hSrOESQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/6] mmc: sdhci-tegra: Sort includes alphabetically
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-mmc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 18 Nov 2022 at 08:33, Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 17/11/22 20:27, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Sort includes alphabetically to make it easier to add new ones
> > subsequently.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/mmc/host/sdhci-tegra.c | 23 ++++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
>
> 12 insertions and 11 deletions because linux/bitfield.h
> was added.
>
> I am not super enthusiastic about reordering includes.
> I would advise people to text search to find an include
> instead.

Yes, I agree with you. I don't quite see the benefit.

On the other hand, I don't want to waste my time on discussing it (I
just did!?), as it's (currently) not that such a big deal, I think.

[...]

Kind regards
Uffe
