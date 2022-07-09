Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7D6C433EF
	for <linux-tegra@archiver.kernel.org>; Sat,  9 Jul 2022 23:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiGIXYk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 9 Jul 2022 19:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiGIXYj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 9 Jul 2022 19:24:39 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980A8101E4
        for <linux-tegra@vger.kernel.org>; Sat,  9 Jul 2022 16:24:38 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 75so2023770ybf.4
        for <linux-tegra@vger.kernel.org>; Sat, 09 Jul 2022 16:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HSavKHqOMxyq6s3ViEHF246lp9Yq/M+fNZQ8wkoHIes=;
        b=jC6jxKldqqxB+NjGJ1nA2NuBBQ4aLHPhkjLLN4N8jjNFpQv/r+553oJFJZj3/Elgew
         c8Lr8g+kCbRUVGTZn9z/inkjRUTQC4AZw2kwdlZvDX06DfnwissE1owr0XIdf3kbhysW
         4ufR76bgE6lAGxEVqKLDsYK7J2Y8a/aZKVGmPfBIoCFziGABsYPjCn0Ch8JRXA9HsIO4
         X87vyZEA/2rZEV5Hf7r5ktgosj6XFFkaR4AlWa391lse1znYnno5Nk2YAI5Wr+UkDuqK
         fdUvLgWhWBiiKVDQY8NReitXXNrH3bDnzOUSGYyjzzvKpXwLzPtcLU+YXHRHclkdCMKb
         ba7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HSavKHqOMxyq6s3ViEHF246lp9Yq/M+fNZQ8wkoHIes=;
        b=6EkPYsGnltOstFEuO5Ap/CAthR/qcG9/J9ck46oXHnKcon3b7EEnyh0vYVA/zW3Y2g
         RSy7JI4bw6O6lpz4VRiQbks+TYfeBS8XBfhidZmDh35JTvuLKv4IHAych5DzOV6KGzB9
         xTAamzTARp5jZNNy0My5o3+PK8uy5dRBiNFBaFcE5Sfc3WYWGUdwig0Fo0/icv4KJy0x
         3lz5Qxu6aRq3j+8znae1UcmuDW9mihzyoIwMeZ/r0Lp0tGzIKXW0r6ipVFkAL94Mr1FT
         tCV+wgA6T4OwsfHBHrok2FwsR9gnmvMir/pMUSsgVA/paKoy3MBVd2RHnN5jLJ45v0Z9
         IUgQ==
X-Gm-Message-State: AJIora9jl+8Rv35xrFVwKS4gYEAq+hlvb60YTjeWYCWkzotrKvaWXiEB
        E0wTeElRZJ2hOqoFUQGDL7guVjord0/bBGUdq8QaOg==
X-Google-Smtp-Source: AGRyM1sLqlHqUox1gWV+9ez0TjEG7+Iv3ml/L5445P6HtAIqo7pbNQ5xd2pA4ZEdPCkIEs/seb56VoCgalPMMix6PCo=
X-Received: by 2002:a25:1f57:0:b0:669:b6fa:167e with SMTP id
 f84-20020a251f57000000b00669b6fa167emr11544285ybf.295.1657409077892; Sat, 09
 Jul 2022 16:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220704165802.129717-1-thierry.reding@gmail.com>
In-Reply-To: <20220704165802.129717-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Jul 2022 01:24:26 +0200
Message-ID: <CACRpkdZtqGqhJniehVHEgKGvG8KuiDhyj+mrj2o=n698f83-mg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] pinctrl: tegra: Separate Tegra194 instances
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

On Mon, Jul 4, 2022 at 6:58 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> This patch series changes the pin controller DT description on Tegra194
> in order to properly describe how the hardware works. Currently a
> simplified description is used that merges two pin controller instances
> (called AON and main) into a single DT node. This has some disadvantages
> such as creating a complicated mapping between the pins in those pin
> controllers and the corresponding GPIO controllers (which are already
> separated).
>
> As a prerequisite, the first patch in this series converts the device
> tree bindings to json-schema. A second patch then adds an additional
> compatible string for the AON instance (along with more details about
> each controller's pins) and finally patch 3 converts the driver to
> cope with these changes. A fourth patch makes the corresponding
> changes in the Tegra194 DTS file.
>
> Note that while this changes the DT node in an incompatible way, this
> doesn't have any practical implications for backwards-compatibility. The
> reason for this is that device trees have only reconfigured a very
> narrow subset of pins of the main controller, so the new driver will
> remain backwards-compatible with old device trees.

Works for me, this is much closer to the hardware and therefore
better (fixing a bug in the old bindings essentially).

The whole set:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I can merge patches 1-3 whenever we have Rob's ACK.
I assume you will take patch 4 thru the SoC tree?

Yours,
Linus Walleij
