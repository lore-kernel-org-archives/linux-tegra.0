Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10049C43219
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Nov 2022 13:19:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbiKNNTi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Nov 2022 08:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238010AbiKNNTC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Nov 2022 08:19:02 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DBC1B1F3
        for <linux-tegra@vger.kernel.org>; Mon, 14 Nov 2022 05:18:59 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id f27so28277639eje.1
        for <linux-tegra@vger.kernel.org>; Mon, 14 Nov 2022 05:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RqdOwqN7P+pFrJiM6KNGCU46uVgLUu/+Ya5PrHPuEsI=;
        b=IloJmChvHKtNQjVn5VUm8Qs/O2NJuE8g0+N4NQFZ6rcfk4tPQUP7R/wlc9zgQeuhPP
         NWLeDc0tCQUvrphVytT68Y52+r0tSl0SRau6tJomSflOhu7r4JNCeJIirhVRM8N55rk8
         uMgPyE5TkfhGYNGnCs4HWd3i3Yz6raYt1mVNaXM6rnfS7W0+IG+EWwEJOc3Y0x3gBETj
         bxN0OGhSGUWqUeMKbfwwwOWPnz7/fNkhJ6lBYx7cjlIJRvwux99bo4qZQfCJB7ruSNFZ
         +cUuh9nUcHJ9LAKSNWF+8cEHTBAk0HAegALf5+ufwMWM+Rp2Ool+wz2aEVW7xp+XPgt4
         TXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqdOwqN7P+pFrJiM6KNGCU46uVgLUu/+Ya5PrHPuEsI=;
        b=AdBEVQpl5WSvlS1cbUnhpghzFj7dE76tvkNkBflbL4WvKPTfa6J5sDUbgk3icc+tgJ
         /BgcjWeoH7sgc82VJos/AQ55taQgc2weiDYBzzOoFht/hpIplsejozUdD/TFSFbFKwr3
         HZD0Vhd98MC6pAiZb+C+3qSAxu8JPP/WL/NegwDwKU7ujgxMwv3ZP8TU3IQnse8jjCI/
         D8Q1uy4k0KsyVNQX6fOdGEvj2KY5RU8d+pf/ej1C5Qax27Nwpc2QTJRH2kRs/0qF3Dc7
         5sDJ9VeqHkgoHKxPYuYLHU3A7NAyR87KGTjmYcmphlVgdPEMg6nIqGPVCE5UcxYVf4C+
         NXow==
X-Gm-Message-State: ANoB5pnDSWvODYW8t6t3avI43YGqwPPC4TuifcsmOZ4oXs2DHyXKLc2d
        7bkz1MGSzde5lLgA27QPri3UR5CwmVbYwy+FOaAAzA==
X-Google-Smtp-Source: AA0mqf7Snqu+4eKTHoWKvKfFt+gSamQ3+92SiphWhGdF5GQAYkWrqscIDItRlf9HE7OEQj9nrOW3F5t6RU6uWQ61zmY=
X-Received: by 2002:a17:907:3101:b0:7ad:cda3:93c7 with SMTP id
 wl1-20020a170907310100b007adcda393c7mr10591079ejb.500.1668431937731; Mon, 14
 Nov 2022 05:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20221104142345.1562750-1-thierry.reding@gmail.com>
 <CACRpkdYT0X09bWYg9za8x+3YkcbVmBm8Prb0Fyk2nfi_eanDyw@mail.gmail.com> <Y25oAmZMcfBOCat3@orome>
In-Reply-To: <Y25oAmZMcfBOCat3@orome>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Nov 2022 14:18:46 +0100
Message-ID: <CACRpkdYWXoTquBgCxYE67QOxV=8mnDaumhgGVWJNWGQbFYc2CA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: tegra: Separate Tegra194 instances
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

On Fri, Nov 11, 2022 at 4:19 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> What that also implies is that the pinctrl driver patch is completely
> standalone, so you can apply that whenever you want and I can apply the
> DT patch to the Tegra tree.

OK I applied patch 3/4 "pinctrl: tegra: Separate Tegra194 instances"
to the pinctrl tree for v6.2.

> I can then also pick up the DT bindings
> patches and resolve the conflict there. That is, if you don't mind.

Let's proceed like this.

patches 1, 2, 4 are
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
