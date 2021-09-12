Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE30C433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DC4560F58
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbhILSZ7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Sep 2021 14:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235178AbhILSZ5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Sep 2021 14:25:57 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F920C06175F;
        Sun, 12 Sep 2021 11:24:42 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id l10so16097186lfg.4;
        Sun, 12 Sep 2021 11:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sSJiwiefMGSC5Z903M7p9yGlcz6Z8+abc5bbf5DYRws=;
        b=Jst/6K3F4jrXChj/HyFb7xZKwGlEW+54IN4BNHevhgyiD81wCP3F7K2svCE6mxhwvi
         UMdOSAkFv720Ci46u3jKXsCoJRVFZEhpYEvm45zedRj4JwzPrleuKhQrR/q6rs+hMdxX
         WkT2VMkEsLvYJrdVUJh66vbCYzNuXaAbODZ98zI/Amppzr7wGHCgNASHFdT87vsnx/HZ
         HgDvJ/V0BtNVpe+Hps0Hedcj05y0GQoB9ov/78h7J/xXckgcZwD/636jr1d9P0mhsIC3
         YIQj0FiH5CrZQ/+LdXN2bAeckZMfjA9Ttdnwz5CTEA9OYviR45E9E3W4+gd5VGEVulsb
         97Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sSJiwiefMGSC5Z903M7p9yGlcz6Z8+abc5bbf5DYRws=;
        b=4Fae8zfEJ0ydFV09ZXtAYWSxM/yLoMaS+3z2EYFY4TQ00/p4hPKpQ/aP4eZu6pIydi
         b+JItH2DiGpUXurQVUWXF4RiP0mrzqNMat2VpU5PHxEJwewh2o2BpMMZfZDhaunrtDPd
         FD8uolSEHT+3cbv1kUUR0840PvIIOQ11KPV702f7yzyCYsOcVVb0d8eJU0SgDgzn2T0C
         gNTeiOYXMJE3VV5uXEaQC+LGmJE0b5n6vH53JYWXuloOIC86g/p56HadEjvSBHnosDvG
         BwlVQAfl8pHIQ1bmZK908318Vvv+osqyqlFYbCpTRsa8UiFxB1l2H31YExb6NN/fChtu
         Xxww==
X-Gm-Message-State: AOAM5316/mBtAp1K5FJz8xEEWKww/oLbDFn7ydXrb06X5cTQodYoFNI/
        5c4aHTw5qqeamJtPXhdVbaqZl9BBk0I=
X-Google-Smtp-Source: ABdhPJxBWTDnKHJ7g/xRzkClUfVHHZlSKFVX3H7pGUJbfD/sEEavn1wrT1f80WCNv1wdZmJQFyNWEQ==
X-Received: by 2002:ac2:4146:: with SMTP id c6mr6176505lfi.305.1631471080688;
        Sun, 12 Sep 2021 11:24:40 -0700 (PDT)
Received: from [192.168.2.145] (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.googlemail.com with ESMTPSA id r13sm645063ljh.61.2021.09.12.11.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 11:24:40 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: arm: Fix Toradex compatible typo
To:     David Heidelberg <david@ixit.cz>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210912165120.188490-1-david@ixit.cz>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0519e76d-aebc-e937-0607-2ef93974ce3a@gmail.com>
Date:   Sun, 12 Sep 2021 21:24:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912165120.188490-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.09.2021 19:51, David Heidelberg пишет:
> Fixes: f4d1577e9bc6 ("dt-bindings: arm: Convert Tegra board/soc bindings to json-schema")

'Fixes' is a tag, not a commit description. Each patch should have a
proper description. In this case it may be:

"Fix board compatible typo reported by dtbs_check."

> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
> index b9f75e20fef5..b2a645740ffe 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> @@ -54,7 +54,7 @@ properties:
>            - const: toradex,apalis_t30
>            - const: nvidia,tegra30
>        - items:
> -          - const: toradex,apalis_t30-eval-v1.1
> +          - const: toradex,apalis_t30-v1.1-eval
>            - const: toradex,apalis_t30-eval
>            - const: toradex,apalis_t30-v1.1
>            - const: toradex,apalis_t30
> 

