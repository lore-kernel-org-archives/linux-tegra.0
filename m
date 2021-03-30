Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07601C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B482A619C5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbhC3P5N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 11:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhC3P4r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 11:56:47 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB7CC061574;
        Tue, 30 Mar 2021 08:56:47 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 15so20522404ljj.0;
        Tue, 30 Mar 2021 08:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1RFM+ZM9KyafZD5tTYDT6to829rHhY1lLnOW+dPv69M=;
        b=DQuPwSVOh4M/7TJnX1PdHYRw9dCsrSnO/KYuVw0WzxkJi1fOT0zLinopvOnB57Axbm
         6CeIY/g2gMsyHTt3OHo0PWIy/EoRU4sKJX40fyoW/scrRmuJ52DYEm+16Nvq2vfDDkc8
         8xHpt33l3BaMB6BZgJqWZAtwjyBNsP2MFO3mAl+B6vZ1Nj8jfL5rUuNHcAu0B5nx4wiH
         /Qdsw5sWVAjDk7IFPaukGZKl8MibgHHWLUO3zqiILzQn3G/hFR14zLK2vkMi9uk9MhlF
         pEiHMemDFAdTjNSvk+Hl0IX+l7cT2YlAtkxocXaUdZ44s6j9Jsyv7TaCGV4zsQB+uZCS
         Fb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1RFM+ZM9KyafZD5tTYDT6to829rHhY1lLnOW+dPv69M=;
        b=hLVzXLTP3/XJawDTmwStnSuT2GBlN9czmdhHalWqsjogVMty0n/oRVDc2ieJ/0U84s
         iLKexCQIMZoPEYXiEAYf8E5BZupysZjm4ITxPEFN5Yv9D8WqWerYGXwCccaWFr3zqZ15
         B32ZsmG6PtIzEEINHE57JDKI+qJQMY3pq7bfsuKlRuEmjoSd8TSPFIEpZO1QtLCe7ppA
         yjq/HNCAli+qRRf/pWl79d4HEAaeuOKN6jB4b8Dg4EEGRyfM/N6878bJs36cIgxrAf7F
         IGxpfPHWh55h89p6c79oxFJIL/8oGjjgHGJ2VN5zgKTI1hqIxC2u9a6ATyQapozwe/7S
         h19Q==
X-Gm-Message-State: AOAM530SNq35Mfwed5FGLl8QQgycFxe6CUApQ7xhqUBXGR6ubWmK0bmX
        +tB2fyTh9Cp2JviMG1N8kAm6T8361DE=
X-Google-Smtp-Source: ABdhPJwsTUHFPHt8oCbr02Icg/z9JCPusTfU+uR/6AH+HSHSDp4oF3Vju5jCqn+Xh/lrmRabABh70g==
X-Received: by 2002:a2e:6e17:: with SMTP id j23mr21299527ljc.209.1617119805594;
        Tue, 30 Mar 2021 08:56:45 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.googlemail.com with ESMTPSA id z9sm204669lfu.274.2021.03.30.08.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 08:56:45 -0700 (PDT)
Subject: Re: [PATCH v1 5/6] dt-bindings: memory: tegra20: emc: Convert to
 schema
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210329194602.17049-1-digetx@gmail.com>
 <20210329194602.17049-6-digetx@gmail.com>
 <7e45375c-3e24-4fc1-5776-190db32681e5@canonical.com>
 <989c3c70-3f0c-abff-ed07-c2dea3b66a2d@gmail.com>
Message-ID: <eb29dd93-214d-ba15-7825-888467bd782b@gmail.com>
Date:   Tue, 30 Mar 2021 18:56:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <989c3c70-3f0c-abff-ed07-c2dea3b66a2d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.03.2021 18:29, Dmitry Osipenko пишет:
> 30.03.2021 11:48, Krzysztof Kozlowski пишет:
>>> +  power-domains:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      Phandle of the SoC "core" power domain.
>> I think the core checks the type, so you only need to limit max items.
>>
> 
> It's a bit confusing that both variants work and it's not apparent what
> variant is better.
> 
> I actually used the max items limit initially and then changed it to
> $ref phandle because it appeared to me that it's a better choice. I'll
> switch back to the limit in v2, thanks.
> 

Although, I'm still not sure what is the best variant. Could you please
clarify why maxItems is better?

Seems the $ref phandle already limits domain items to 1. So I don't
understand what's the difference.
