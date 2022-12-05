Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BFAC4321E
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Dec 2022 15:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiLEPSB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Dec 2022 10:18:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbiLEPR7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Dec 2022 10:17:59 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21310B84A
        for <linux-tegra@vger.kernel.org>; Mon,  5 Dec 2022 07:17:58 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id f16so2235484ljc.8
        for <linux-tegra@vger.kernel.org>; Mon, 05 Dec 2022 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tubnq3Lb1VVWqLrhjxAXy/EV/eNx6+cm8xh6RrNzzTM=;
        b=AIqfGwx71gO9vLfBYjXxUMedb1KiG2HcnbySTeVyFNkdrqm8R/q3bAmVtiE5e60CZD
         XoCsOQnTeTO+JJrXz5TfPqzGSiaCdlVb5BRFShvlZhVsgTpbNmbF6bqv/FP/UPPXFRXU
         WPydXGV2z2bawxqjAGyoAaQUAdYybDPyf210uMSFDVTf/zOspHXc9GAHCeFhl6r+kNFU
         +6cWu+DrfJQiUaaUQ3bs7PZeQWf0X4UlhiHKkU15yVojPN6mRWhavScbZCCPAr2DZucN
         Kct+cf6ygsaSMG2MoCWMSeTNM8QmP/hp/zFZQJbsgmsjCqCOlbHfVpe000NAM6eTbxkk
         LMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tubnq3Lb1VVWqLrhjxAXy/EV/eNx6+cm8xh6RrNzzTM=;
        b=SXz0tavelRwbPNs2Ku+wV6j+gy1mQemgfI45v8don8vcXOugrWueaH/qBdrvwFoyco
         HhhEHtDyGGFdgZJTs0zKjTlXKG2P50/rC4qG+QLWM3bu9di1ZvtLA/broEu3z+bJsckK
         na4dFQLo+qdxqK6GZc/OuVyT3qigyA6f45NhW5msOicgo4TncmTH5kq4SbBI1jIK3QZh
         58gzfre0fgfyRuCtqDo99GxO4P0xSGMqZjoxWkGYEJnyBW7+cYMzAQFR5aDnCThzMVCe
         a7GzjPI+x/Uyy3+VvPAPznRB4rKXv0yCeXreiBHfUaMcUrEVWjcBJ6lCBjSscgz+V/Vw
         tTkQ==
X-Gm-Message-State: ANoB5pnvqMnI7zDbzAWmaVZcEYG6zFpsVpT3jgu7JrdeinggTQOJoLFa
        TkOW8p3cI+QLEfccJu3PBJSSsQ==
X-Google-Smtp-Source: AA0mqf7AXb6jmtQHyKyaAg541NUdZ6ve9Xm0GWLbAM0+giRLqWCe+D+MTsptwcE1Dlw0gletu1rDVg==
X-Received: by 2002:a2e:b5d5:0:b0:27a:37c:cd59 with SMTP id g21-20020a2eb5d5000000b0027a037ccd59mr1038330ljn.157.1670253476392;
        Mon, 05 Dec 2022 07:17:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x3-20020a056512130300b004b551cdfe13sm1350223lfu.279.2022.12.05.07.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 07:17:55 -0800 (PST)
Message-ID: <da51f5db-b697-47f1-208f-e710e491299e@linaro.org>
Date:   Mon, 5 Dec 2022 16:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 5/9] media: dt-bindings: chrontel,ch7322: reference common
 CEC properties
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-amlogic@lists.infradead.org, Joe Tessler <jrt@google.com>,
        Jeff Chase <jnchase@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
 <20221204182908.138910-5-krzysztof.kozlowski@linaro.org>
 <167025248440.1785019.8058849269946787324.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167025248440.1785019.8058849269946787324.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 05/12/2022 16:07, Rob Herring wrote:
> 
> On Sun, 04 Dec 2022 19:29:04 +0100, Krzysztof Kozlowski wrote:
>> Reference common HDMI CEC adapter properties to simplify the binding and
>> have only one place of definition for common properties.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/media/i2c/chrontel,ch7322.yaml   | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.example.dtb: ch7322@75: $nodename:0: 'ch7322@75' does not match 

I'll fix it.

Best regards,
Krzysztof

