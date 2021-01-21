Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC2AC433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 13:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C49BF23A00
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 13:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730552AbhAUNOM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 08:14:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731521AbhAUNNA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 08:13:00 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E69FC0613D3
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 05:12:20 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id n8so2429858ljg.3
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 05:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=47HDQmqatFJEKXLv4r1tqHnGg1O7gF/kMf8JxqyY3HI=;
        b=B+ofP3N9cw2DRKlNdxTQ0Am4niyM+1VvQaVipuUYDJNl1BN6r57YuCfMkAfRVsN28q
         oihxt7uvf7TlY+yjyh57UPU5tYQAlgX3ei1F/1yIRMvNlPmMjA/c1II9dO2/PVxrklqg
         AN0w0MCJZzaf3si/HIBxibUQc3hdrUFM7b1OZ37lDnFufpg/Pt/9z4xHcgWFPEf/R79i
         iEog+RvVlWuMlW/g4bYKDc4iituhzoLAmvecRs71S2l7yii+S70b2sulEiht14Z45xVJ
         x7OMpyiNZd/yz0rdichaytWAlSAIjdmo+UqDFIfHto6dTp5SDqF1DsE8udHUu1HTHb9g
         bM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=47HDQmqatFJEKXLv4r1tqHnGg1O7gF/kMf8JxqyY3HI=;
        b=g4+CRnIGr0XJ6ml14xcw3mkDHv5pSwZv0LJasZ08Q2CwcA7lgLZwOmOfgwcrStYuge
         KB3OhOkWpy6YaOKv3bFdwh3iXA202u2LLL4A6nwqqbluGXJgA4LJHU596clXZU83fGWs
         zWrHoQeAaiuLrtmoeZUhRrnFV+3BYvnZ0Qd/fPN1TjEeAlfZAwkTEHTGSPZVWy4OmYEI
         eh8LeEhMQyaQ4t//u2A/GaQ3zsbNlsNSfTd0ycoyg1fPvaaKMd/4Z4foR2lcMvhS3He8
         /lwyw3hry0VA0uluiDwGcvVLj5/SzDhmYEQFEsHwm3zqi4PRsqvhlvdiCkg+i26Wb6+8
         MU/Q==
X-Gm-Message-State: AOAM530cqDnvm/r+liu9b8NbCo47i9Zd5mho5xK79OjLD5+XoGqeEymB
        B2hby0ued5VwLKxqtRvM3LV45YpVDKRlwWY/E7nC3w==
X-Google-Smtp-Source: ABdhPJyYLUDoklQU++7GwvgK4FZhhv5diXxOMOA4kImyzoS22TfNc7EWPRXHO/OybdPh/v1SQ5NWE47oJiAfepcUFro=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr6868618ljo.368.1611234738978;
 Thu, 21 Jan 2021 05:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20210120080522.471120-1-saravanak@google.com> <20210120080522.471120-3-saravanak@google.com>
In-Reply-To: <20210120080522.471120-3-saravanak@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 14:12:07 +0100
Message-ID: <CACRpkdYon8jc_Twa83ynGVnWg7mnZ-ix3=mg2xn1XoFQ+Hq-_A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] of: property: Add fw_devlink support for interrupts
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 20, 2021 at 9:05 AM Saravana Kannan <saravanak@google.com> wrote:

> This allows fw_devlink to create device links between consumers of an
> interrupt and the supplier of the interrupt.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Saravana Kannan <saravanak@google.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
