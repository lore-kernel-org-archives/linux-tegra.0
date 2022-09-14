Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E634C6FA82
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Sep 2022 13:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiINNnq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Sep 2022 09:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiINNnp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Sep 2022 09:43:45 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA2436869
        for <linux-tegra@vger.kernel.org>; Wed, 14 Sep 2022 06:43:43 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id y3so34882283ejc.1
        for <linux-tegra@vger.kernel.org>; Wed, 14 Sep 2022 06:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UbxIwKxI44ZUYFrzXMEVDS7APV6/keTlYAsbV46sQRQ=;
        b=DXBjEqme/sm5yIDza0gnUSLZabm3SfQTBmD9ru674awSy2Oll33xPvY+FCF15TUTlQ
         mWaK7jh64Yo/nqbeL+C7f5Qm0nMZoBA+NTURgcXItBzhhmZXK9QdrRt/kCJs36E+dR4+
         CoKCosfTlVKjnnkexE4qDuO83oM7ReGNxKhypiaXzgf58sZePAXrrAZUW/Du0qRewE/r
         mj0cLV0km9O65xnmftS2dlHD45jwDHSNXMcpsf9WAhpDPj7zIqpQngRaQ4bWj54pYuKg
         xN6Y1WZM1HUT6UYHvIY+s9OtBXZIYSkaLTmNu6PTAFUxXehhLE4sYEevhA0ahsvTr9Yh
         a6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UbxIwKxI44ZUYFrzXMEVDS7APV6/keTlYAsbV46sQRQ=;
        b=btuOxiE5I/XhFB7iVbxVK2S5eJui3THEmybrYXhDgU6zayTrzWsHyXKan4YXmcJ4dC
         fBm4wVO8R698cIwDnRW65ZxUEfzOeZTY283PFYQYbvWFvy/RH6ovoRZx7DE937k7nAcb
         1wl93IwcSjovvInO7Fb1/xvdqbv5ggoVhDzMyJeNJC95V29Hm/xdeS1YydP3R2ha3oaN
         B2KOqGFZ4Sn92/Xb6Grt/JRry6hIjYhdAtPGxiWu4LSLsd+D3OK4wxZ815I82omeE5zA
         kSAuWP6mkV1gH9D4kMTsQMUnTNE6lheHKxEPr/SxcnuOaa+QBFBu5qbcflNEc3Im1p2d
         YWew==
X-Gm-Message-State: ACgBeo3R8ZD0GS6IGZkekbv/Abakp189WajZb0ACQMVGZ5PWkrmKnsqJ
        Lxj6x46riCd2Dj7ien1P2/+HSc1YJ8/bRKMfF4XsuA==
X-Google-Smtp-Source: AA6agR4Pwbd8M242EgeY2yL21U+ksFTwSMStaJSUSxC+/NOxWXnGiV2skls/5rlLP99gGsIcM4/4qvFuKls1brp+aQk=
X-Received: by 2002:a17:906:8a5c:b0:77c:9d8:6fbc with SMTP id
 gx28-20020a1709068a5c00b0077c09d86fbcmr12751012ejc.500.1663163022147; Wed, 14
 Sep 2022 06:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220914122110.7246-1-pshete@nvidia.com>
In-Reply-To: <20220914122110.7246-1-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Sep 2022 15:43:31 +0200
Message-ID: <CACRpkdZu_6=ZPrNbWVC9wBH5nZvAXcZmWjGb4FtjVZi6fAW1DA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Check GPIO pin permission before access.
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        smangipudi@nvidia.com, kyarlagadda@nvidia.com,
        Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 14, 2022 at 2:21 PM Prathamesh Shete <pshete@nvidia.com> wrote:

> This change checks if we have the necessary permission to
> access the GPIO. For devices that have support for virtualisation
> we need to check both the TEGRA186_GPIO_VM_REG and the
> TEGRA186_GPIO_SCR_REG registers. For device that do not have
> virtualisation support for GPIOs we only need to check the
> TEGRA186_GPIO_SCR_REG register.
>
> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Instead of doing this check in each and every single gpio callback,
set up the .init_valid_mask on struct gpio_chip, add a for-loop
looping over all GPIOs and fill in the .valid_mask.

This way the gpiolib core will do the check for you.

git grep init_valid_mask for a bunch of examples on how to use this.

Oh I see Thierry already said the same while I was typing :)

Yours,
Linus Walleij
