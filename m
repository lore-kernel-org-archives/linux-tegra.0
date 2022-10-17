Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CE5C4332F
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Oct 2022 09:31:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbiJQJb0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Oct 2022 05:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiJQJbZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Oct 2022 05:31:25 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B27241D03
        for <linux-tegra@vger.kernel.org>; Mon, 17 Oct 2022 02:31:22 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id r17so23487884eja.7
        for <linux-tegra@vger.kernel.org>; Mon, 17 Oct 2022 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7XLVcLpyTW3hYyAvbDI66HfSdH+CV6t1oRyHuEEVL8k=;
        b=WzrhIQONV2yqOXtsG3DhCRSqwLdBFRuisyqA4vmLTYFWYfYQAf1RAasKeyTn5aT8l2
         sHOfEK8NIx54Os01bjJNSrbCP0gudEBObtLOiucvaDzIKrdyPwoVG7XgvdzQbCHhdGW1
         AxXGhqAVfJjuR6ip2EV9KKQKbqXpptmCOdRf0++1kUwWwzNowIqHpd/ZxBHzWiUFXUVn
         bKtTNpq5eugJFTxVawdUcjZ9H2qKl6evtu2EtZ30kwyof0zr53/mmdv0ASvrLZC/VSJ7
         Ly2EKFJ2BB+TCzer8Maa27M8yXAyTBpmyz/Os7ffQu9s++pXpGyaf259huuzllavotly
         rH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XLVcLpyTW3hYyAvbDI66HfSdH+CV6t1oRyHuEEVL8k=;
        b=YbD5cDaczCtmCSCG0ybsdQGIToXdCDBTpekelGwgEU7oSKXJE8llTEga8XkooRmqVn
         nblHnXO//VTmz+ReA62vO+8i+UT4zRRGc1uVESZWrpVIqtljFeUoKeOYSajLw/vEYBJl
         KBgooK36pi36ySP7RKyEjKC7Qy9PIEh13VHtiID9zTxvyZsOFN6ASSh39p2mp22MSLjv
         6q7UwnIDdxBWpwLJ6XaGGUuiyG/TLlLMDas3OYc+owF810mB9g7+3A1N3tW8VsUTxnP0
         8fN6knqIX0oemavJFQLt2ALnzkukctgj0K30MHGKMdYEhGH5en9kKY/PUUFfZMqaamV/
         iJUw==
X-Gm-Message-State: ACrzQf1UOt17JLoFqRjY4yh2BRYrprzL37voNXpE7dBgVrnTZt0CnRuZ
        nTIIzo0w1HdohDn5xANYgFMDXpJkQ8oxoq7EU6g8jQ==
X-Google-Smtp-Source: AMsMyM6G1c3vhghVFZehisdpRiti+VaiidpH6kvYQnFU0ch7LzevazRYQ+FcrpSkkJTAnVXaQKPR+32adlK8NBMWywM=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr7488608ejc.690.1665999081191; Mon, 17
 Oct 2022 02:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <Yz62XmiH8YG3Dtsf@orome> <20221007055936.5446-1-pshete@nvidia.com>
In-Reply-To: <20221007055936.5446-1-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:31:09 +0200
Message-ID: <CACRpkdYkJdZ67kyTnDg3xFzO8MJhC0nHK98O+KJwCLBqV_5f-Q@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: tegra186: Check GPIO pin permission before access.
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     thierry.reding@gmail.com, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com, kyarlagadda@nvidia.com,
        Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 7, 2022 at 7:59 AM Prathamesh Shete <pshete@nvidia.com> wrote:

> This change checks if we have the necessary permission to
> access the GPIO. For devices that have support for virtualisation
> we need to check both the TEGRA186_GPIO_VM_REG and the
> TEGRA186_GPIO_SCR_REG registers. For device that do not have
> virtualisation support for GPIOs we only need to check the
> TEGRA186_GPIO_SCR_REG register.
>
> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Very nice patch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
