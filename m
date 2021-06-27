Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEB4C49EAB
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 11:38:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64B1A61C3D
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 11:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbhF0Lks (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Jun 2021 07:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbhF0Lks (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Jun 2021 07:40:48 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0F6C061574
        for <linux-tegra@vger.kernel.org>; Sun, 27 Jun 2021 04:38:24 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c11so20358648ljd.6
        for <linux-tegra@vger.kernel.org>; Sun, 27 Jun 2021 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pQxWdYWHvbbp+2LcaBtIbSxJfMMlfDTA83HjiKw1VAs=;
        b=gpCPcR/xeh65GpyTKLghTUCKCBUjZmZjSIw5/3lU3NKaN0qDV3NkoX8cWkQV11nz3B
         40OLGXRRT97wWZApV5ufDcq691C0KWtf1RAgH8XW5aVRZQwl1eeEg0DXS3+W2fAT1X5m
         m+hV9nIbmlXdEFaQN2Ou03/cQE/ayWqb2OdXUvtpJ5TuNplnDcPDJ6QsUknv4ctKXqDq
         t8ivBcrq7AL1Ayxl34OP8qlhlpAvWs65z5y0bsXzRpvk8qH17qOwtOUgp++z/gVLriRV
         u+jxcOzu0P0gL88faPMjewy77CjAJEe6iaBoE4TAU0I2NFbOVcs1TJuDXMsIzmidoOLu
         umAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pQxWdYWHvbbp+2LcaBtIbSxJfMMlfDTA83HjiKw1VAs=;
        b=s6IwaJNX2vBcQhqTp04oXOT+dHmyFtyTQOPGzkVGV0KktOn+p00d3uDyexq+IcjHQR
         lFz9M1KkkLVV7QJs02SrINOHz0M1QNyX7b1FIRC+jpDli49lEFwzcUFA6/9JltkwxQ/F
         w+Z0NDyH3d9lgd8gAc4OMPlfVW6Xg+Q5SrGitNGujuKVSjE4X7DIEL4MWiISKlDBaIOf
         RedWOMiuU1rdyJPOoybWkpHsB0VTpIyGSSGVcqC5XQ3aD5LwBOmIY5XJrEHnZZkZbjqg
         buX1NsQQS5ssj9dMoJsKisDzL28896Re/nv7SWVeLHPiO7MsHH92LxYpIPPR2yVawhU9
         CXSA==
X-Gm-Message-State: AOAM530G9FvgNbYSr+PGeVrL2Zvt4YER6v5RjD5n8Wmsn7fXANpK9QSF
        59L3ohIarDA/osNDiNbzyKh82xAElk1AQttNFUmZYQ==
X-Google-Smtp-Source: ABdhPJz/VCxte05fHrLvpJorkmglZCxD3yh2bBhdMx2Ohc3IjXk204q1B1o2taLMzCkh5u2qTWBzMxJNPZA0eNiYgis=
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr15808817lji.200.1624793900993;
 Sun, 27 Jun 2021 04:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com> <20210625235532.19575-9-dipenp@nvidia.com>
In-Reply-To: <20210625235532.19575-9-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Jun 2021 13:38:10 +0200
Message-ID: <CACRpkdY=b44SLJNobNqfteYyuEcpB+aGZ3xRBwUSG7Yx116YuA@mail.gmail.com>
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:

> This patch adds new clock type for the GPIO controller which can
> timestamp gpio lines using hardware means. To expose such
> functionalities to the userspace, code has been added in this patch
> where during line create call, it checks for new clock type and if
> requested, calls hardware timestamp related API from gpiolib.c.
> During line change event, it retrieves timestamp in nano seconds by
> calling gpiod_get_hw_timestamp API from gpiolib.c. At the line release,
> it disables this functionality by calling gpiod_hw_timestamp_control.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

This looks good to me, pretty much exactly as I imagine it should be
done, and it is also nice that we only implement it
for the v2 UAPI.

Yours,
Linus Walleij
