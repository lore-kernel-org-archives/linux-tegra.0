Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECED8C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:26:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B78B7619A7
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:26:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhC3P0V (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 11:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbhC3PZy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 11:25:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211B5C061574;
        Tue, 30 Mar 2021 08:25:54 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g8so24383215lfv.12;
        Tue, 30 Mar 2021 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K9oKxgqvv2xwBau1Hqc1C0nc0W0/3k1X3AJJxJXNHlw=;
        b=riZgh56pSBWEI2KlhVFzOKqtIakRUv2TiK+4mA4ddeHBQWM17GSYZ8RcReJ267vN6V
         UoaQUVVb4KjKKNazm1oCpcaFaEQ9ifXInEW6OYJrz8QRVhiNIB18hWTc91WauH4ug6kT
         utS0lRG20DY4HgcQrqk9WYA8i6TIutOQMoXU167fROrUIzUtvN019aaNkSwbOnVFavsW
         0AxbrZPUqYPQJYbxlKB1c/pdoKAmxkiMmbYmLNqpd4G06n/pvMfXLsLRO+fieNwBQwgK
         a//sg2JYTPpE1+fZlcDRKF4twphtGhxru2sIQnpu4mIgzQ7mJHZdCBBGt9jJzBvWsUId
         WZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K9oKxgqvv2xwBau1Hqc1C0nc0W0/3k1X3AJJxJXNHlw=;
        b=LjNW4xBbnfKpi4giDkCVw+c9MO3kbiATpUbs7vaf0ksFhJLeojgWFROLYQ9oG7L2od
         /+Fqos3RZV9GdiIFZig6lDeK0xc6FKEB/H7dzGP6zHLDFRbc/1CClPJz/9MOVFNyVils
         o4wCH8SSMyGKGhB4rUDdwVVwWhHdoI6Lf4c6bQXVYC3Voe8egrKg1FNJyUAMXckfYGI2
         PTon2h1O9YxEUkJUhJw3b5XvM7GHNOPiVCAizVTzdsW3I8+HvUiH1yzARYqBxCiq4zd0
         BoJPdDPI3fzlBLUKQ9GJllSyxwk8OCvbfjA5ztnimTW4lNRllxg3qoNFyYhbuV5Xj4im
         ZmXw==
X-Gm-Message-State: AOAM533Yus32Fz43hJF3N45FYwgYf+un2qWOf+s5cZcaJ8B5hkOj3XR8
        Y2TRis/HdM+vRO+Ctgwqz5lXWRsjL7w=
X-Google-Smtp-Source: ABdhPJxCUFN6zd35wS+i0XgOlbBP3JG3hD1SrZ/qjhEk4br+UaZhUqcu0/+HyiFLlOP0eUATWhPtxQ==
X-Received: by 2002:a19:c3ca:: with SMTP id t193mr20087984lff.331.1617117952541;
        Tue, 30 Mar 2021 08:25:52 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id c12sm2199353lfb.284.2021.03.30.08.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 08:25:52 -0700 (PDT)
Subject: Re: [PATCH v1 4/6] dt-bindings: memory: tegra20: mc: Convert to
 schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210329194602.17049-1-digetx@gmail.com>
 <20210329194602.17049-5-digetx@gmail.com>
 <01daabba-9023-8d78-9386-99b974d46faf@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b638a15f-c824-0b00-bc9a-25759512b7db@gmail.com>
Date:   Tue, 30 Mar 2021 18:25:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <01daabba-9023-8d78-9386-99b974d46faf@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.03.2021 11:37, Krzysztof Kozlowski пишет:
>> +properties:
>> +  compatible:
>> +    const: nvidia,tegra20-mc-gart
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
> I think you always need two regs, don't you? If so, then better to use
> "description" like in
> Documentation/devicetree/bindings/example-schema.yaml to describe which
> set is for which range/purpose.

I did this because the original example from the txt binding was failing
with:

Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.example.dt.yaml:
memory-controller@7000f000: reg: [[1879109632, 1024, 1476395008,
33554432]] is too short

But then I just corrected the example and forgot to change the reg
entry. I'll fix it in v2, thanks.
