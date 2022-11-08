Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C695DC43217
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Nov 2022 14:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235155AbiKHOMH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Nov 2022 09:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbiKHOLp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Nov 2022 09:11:45 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3449D121254
        for <linux-tegra@vger.kernel.org>; Tue,  8 Nov 2022 06:11:23 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id m22so1706082eji.10
        for <linux-tegra@vger.kernel.org>; Tue, 08 Nov 2022 06:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GL2VB6yiqlJd7PXl9jCnnQ5NQhRNVLQL22XW+04witg=;
        b=Hhzk8FopA98HaJrgwoizCtMQjYbKieZLMyCwD4Px4prPzIh0xGexW33aaq/j+JippB
         cqlKGLoDi1XLjx+IY/su4mqqiHWvQUn+7tIVIJpEfiMquxhwIgRmC6N5SNcWnRVbdNtM
         YqocapQY/un37wC8kJ/7a0MLAYUePF1vbV8ex4L8Iifyb07W16xzVj2vo1LoYLVFUy8N
         aqdEWC1LNRy/bl5J7tZLgNbI7e8kqA4LHWdgOgQvzCSwe24kskKnAt7bt3IM1TdsdXyO
         zuAVijftra0VXnB2A5j20mQhvzZMmjKJrg1kYqt9t3FKqqZ2I58VGv1kCgZ2SCIAeVEg
         lwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GL2VB6yiqlJd7PXl9jCnnQ5NQhRNVLQL22XW+04witg=;
        b=In4epSalqktZtjmE9kWsvjBiTyCIavzPbbNDoWtYcuXAMDTc8plKZIsYSkQ8vci+VU
         PvNJYisXHPa9+VHRNlBNUfVQ0/C8IZF4NqzcyXgqs1Xq4tleJw60d7teO7Ohg2Lh2npg
         BL2qEg4v9br4aD96536KrAXb2UzfsaswpOU8c9BZO8ZTEqX1JLh2juLnv3CwfMaDTvm5
         YkDLkXXwMEeXCPx/Xl5L/GuTxmn7bTSKd7hiFVw3rzlb+kwsXH7QE9mn69g2QzX89qiz
         4dNIBHfSquXy2/PHS9VDc9d1rRgNsBbgQeFtVbRsTIuTIjGCLWUCo/1Yf3lH8HbIpDV+
         l8Xg==
X-Gm-Message-State: ACrzQf3GxWqTyYdzoYSxtjhlegnkueBfKbCEiNRxXlQKKqrEOKFmGIYp
        8+G8mv7aYMsVd/5fldscwL7o7AWznmRzsUwd2XD8Eg==
X-Google-Smtp-Source: AMsMyM7J3Sd4gnDvu8zGm0CMMNKR4LFB/CGFMpK5G/rfqAvubgf422+2XMl7L688bBueJ+zjJiz/yGcF4N7ozpUkS1c=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr54232684ejw.203.1667916681564; Tue, 08
 Nov 2022 06:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20221104142345.1562750-1-thierry.reding@gmail.com> <20221104142345.1562750-5-thierry.reding@gmail.com>
In-Reply-To: <20221104142345.1562750-5-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 15:11:10 +0100
Message-ID: <CACRpkdbegcxckaYA5h0VKQonK72srZWDZYynHhUKSTHngWGHWA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: tegra: Separate AON pinmux from main pinmux
 on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 4, 2022 at 3:23 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The registers for the AON pinmux reside in a partition different from
> the registers for the main pinmux. Instead of treating them as one and
> the same device, split them up so that they are each their own devices.
> Also add gpio-ranges properties to the corresponding GPIO controllers
> such that the pinmux and GPIO controllers can be paired up properly.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Is this one of those few cases where this patch should also be
applied to the pin control tree to keep things coherent for e.g.
git bisect?

Normally I would ask for this to be queued in the SoC tree separately.

Yours,
Linus Walleij
