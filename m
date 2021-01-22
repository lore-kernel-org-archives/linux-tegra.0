Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0149FC433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 12:04:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC16A239D1
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 12:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbhAVMD6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 07:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbhAVMDa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 07:03:30 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022FCC061794
        for <linux-tegra@vger.kernel.org>; Fri, 22 Jan 2021 04:02:18 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id r12so7269290ejb.9
        for <linux-tegra@vger.kernel.org>; Fri, 22 Jan 2021 04:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=slHYFFxR9Z+LS4QCDTC1/yAWR1DNMktmjKNs0Jbqoa4=;
        b=XqIjW3c+OgQmTLy890KH8ay1G/1B8eJSSwzK8T47YnvlJ2uhaC5xhG8DASHlyRRx+6
         Qv87iZikSDq6Q2zBxVdcBgOmKsyuxIme/mtAgiSzZsJSRyHqdVCZv+mKgaqw/HrRucOo
         MlzOd3FffMQNwMjKS0zic01y4qVYngNlrBGcZ5amsa8toOiARCoDgGtBLbmRsXewr7X1
         te115otsLSzRtAbG/nZL+3EI33s7mZ70YTkQA3lYDXRHwa8fV6P+gAbptJXds23Gaxd8
         kiaBXXX/joLplm6CrBJXyL1bcyWZgtzRiB27Bk8BN/jE3kbrlhMGOZgCYAEvauOGbQ/j
         xYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=slHYFFxR9Z+LS4QCDTC1/yAWR1DNMktmjKNs0Jbqoa4=;
        b=svyz8Czkv4+76Vw7M8UiNCbSgqVcZNEx+XU6oPIms5dO0psXnAGI8DpiNu4n19tAnE
         jHPPL6/aTnHHk27sh3ZDcdiJifDn1QS+svFKRfmVro/V4hy7NEzQTTdLaJVCrBVo0xnA
         NN07Hl9A3rH80LdDXaZzOY/cKhJLGlUu3E7nY0ENv6bnyFNfaFgAIwhIDAocXvHRVc2l
         +d9fp1opz2xMSMaqY7KC0+O6P36/8qOTclRrmOztiqpDFVr9F1RkEYdAfxaDTiq3MGA0
         y+j3JsOjhoOcQb2kLpYMPNXGCbscm/07ahqFiUWB1lsOGU1dtvNh9wc9kwADpOBMC56B
         5B0w==
X-Gm-Message-State: AOAM530Y+KrryUd3g1QdnMeCTD2kwn/rbij9jdXQQRVpq8gu751RF/LT
        ws5qn23sFswLi/Q/6BUzVA62S1APv3X4m1jrKMpJSw==
X-Google-Smtp-Source: ABdhPJyuXpVTE/3WXs8SQxTM5UHQxMuuzkEY9SwxwGhwXJB3kOm/gXrkhSEd722NuemIo/CF5hmL3CLsY6PmhPlAx9s=
X-Received: by 2002:a17:906:1c4b:: with SMTP id l11mr2785269ejg.155.1611316937572;
 Fri, 22 Jan 2021 04:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20210108092355.19228-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210108092355.19228-1-zhengyongjun3@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 13:02:06 +0100
Message-ID: <CAMpxmJULe5QbvCxPHecDhLjGUs_FX1q_k+TBFuOruWKeKZr7bw@mail.gmail.com>
Subject: Re: [PATCH v2 -next] gpio: tegra186: convert comma to semicolon
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 8, 2021 at 10:23 AM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> Replace a comma between expression statements by a semicolon.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 9500074b1f1b..05974b760796 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -647,7 +647,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>         gpio->gpio.get_direction = tegra186_gpio_get_direction;
>         gpio->gpio.direction_input = tegra186_gpio_direction_input;
>         gpio->gpio.direction_output = tegra186_gpio_direction_output;
> -       gpio->gpio.get = tegra186_gpio_get,
> +       gpio->gpio.get = tegra186_gpio_get;
>         gpio->gpio.set = tegra186_gpio_set;
>         gpio->gpio.set_config = tegra186_gpio_set_config;
>         gpio->gpio.add_pin_ranges = tegra186_gpio_add_pin_ranges;
> --
> 2.22.0
>

Applied, thanks!

Bartosz
