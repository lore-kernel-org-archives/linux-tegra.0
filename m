Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627C8C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 166B02078A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaXkiD3+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgJEOcf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 10:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgJEOcf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 10:32:35 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71E3C0613CE;
        Mon,  5 Oct 2020 07:32:34 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b12so11129553lfp.9;
        Mon, 05 Oct 2020 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=loMo/vBaR0ebVtd52n0vz8QIt+UFJ3m6njNxfSN30FY=;
        b=RaXkiD3+8iQtkxn387laOJCdWlgZcjMKOYYmyeoG6wTRvohPg3Ui57mkwHuT3qHOox
         c1BlPpidZIFh7efaQ9k4w9VAJQVNpIw7s4EDNUxnO6oO3NOZg2D7XCMwldVdwC//vvGx
         pHs2IVZHLtgKU8vf3UW/LVOEXEIjzqpt1eLcwTpJuPrLsDnCXB7iYVbBqKIYwnKkS+6S
         Snps2eSeIGRtP0aLlGSpcHDUo6dQRLYSTEET2+vNUYA2Ka0d/PyMOyQZ9vtJGLxijRMF
         sz2OgEEbMc2m5ssTVFGvTi7/qFmyF2u3WfjcJ2OzjjII4oRjiaKyZLslrMnrgqlMhCSP
         Vd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=loMo/vBaR0ebVtd52n0vz8QIt+UFJ3m6njNxfSN30FY=;
        b=RZrpEu4tJczWptezoDUycDVu+ivzw8TPSm5hqERyE0QROWDFbHKzCrWBJdfFW84OGu
         wauP8ysVLeGOECdHc4xfXx/BnObzY/lCqoS4uOjubJANNNg2qCggr3HBg8KdLzZGvVdU
         g09MAp7Osl2cHtEIbkrOpkekB0zcfqgei3pP1qvzNliQwkEO0PJnSOZvFW1JB3fg30qI
         HoYRPOgJkIWZ446rKREcYUCTsn1Qiuw89ocTmRDHk4MFAv2uuEBaPadTWraVX59cwdxd
         Q2F6Z72/9T36PKBIQJ5nHxChlYQoyk9xtktw7srgNXCzIKoFJM92ig3XAEHMzFp4zSGq
         bMiw==
X-Gm-Message-State: AOAM531UvOOWgCfx8xSPZaer1/FkT7Um2o9GBlQCpyl1HP2SbJiYxXB2
        2xLeFFg4C516HsnzoctaIRk=
X-Google-Smtp-Source: ABdhPJx0zonlxiya5/I1GCBmZ86vBpsBYOEAOS6LM4KjH5lhKKO9ajyN1QuEqZokClReDcOzIFKPtg==
X-Received: by 2002:ac2:4a88:: with SMTP id l8mr1602652lfp.380.1601908353143;
        Mon, 05 Oct 2020 07:32:33 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id b5sm167827lfa.39.2020.10.05.07.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 07:32:32 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] dt-bindings: ARM: tegra: Add Ouya game console
To:     Peter Geis <pgwipeout@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
 <20201004133114.845230-4-pgwipeout@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1d11f8c5-8113-0d63-04c8-fe3405aefc4b@gmail.com>
Date:   Mon, 5 Oct 2020 17:32:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201004133114.845230-4-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.10.2020 16:31, Peter Geis пишет:
> Add a binding for the Tegra30-based Ouya game console.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
> index e0b3debaee9e..a8bafe68315f 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> @@ -69,6 +69,9 @@ properties:
>            - const: asus,tilapia
>            - const: asus,grouper
>            - const: nvidia,tegra30
> +      - items:
> +          - const: ouya,ouya
> +          - const: nvidia,tegra30
>        - items:
>            - enum:
>                - nvidia,dalmore
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
