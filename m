Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F832C433B4
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Apr 2021 14:48:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE0F861006
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Apr 2021 14:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234029AbhDBOs3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Apr 2021 10:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBOs2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Apr 2021 10:48:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD216C0613E6;
        Fri,  2 Apr 2021 07:48:25 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b4so7902488lfi.6;
        Fri, 02 Apr 2021 07:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yy2uqVjUbahaeJgUjDmmu8U1mBFY9CHqnGFACDwFRI4=;
        b=nHDe7e7FDWFrsJdYaEeFpzBgrWdsSoUKWLbEamFUSz3OkkYh+wu/J8RXuB+lJnEfXL
         +zGc8yQiKJ6OTfq8rYDAege0vLkRusEHki8i72VbkSkuQSv5eeoL/Il9iWNfowbJfO+Q
         8NX8SyHCpFD3KMEGNusBA8tdh47mF5GwTnpyEBi1FiPvHn3Ne6o/YzLXTiJIJsd9m+Ja
         FTgEAiXkZ8L/Twl4lDTgFprpC4CuoJYh6ZHXH55JnBo07KEPFwTOPszxNoK6NMcp5+Ps
         55sbiaMRNbGEsWZxujORnNsEWyc123oaohMQA+dE+/lmccXftzhs2DANJ+fzLfZk2swM
         hHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yy2uqVjUbahaeJgUjDmmu8U1mBFY9CHqnGFACDwFRI4=;
        b=s7GQT32aaAr5kFQzO1e+lAowde8NFXCcfDqBUqe6VRiQ+b4VCbyoD4it8spXMwBoyx
         eCay6vs2IYz3gswtArRdx9riDDiMn3hQRtxh88ZhkB301Ygg1u0SdXsMg6gvuh1xF8xP
         nTO9qV2FoPJxRwnfQwgY/swvHH4N89QwXyuNKMqhSIh2Jw1+3DbbfjaLsSWA3MHX8SDb
         rv1AkFL8hMiCLI+Ggsd/+QB1AiTmuD34yisYfpMeNxcXoGy92yPAhR6SsYllk5N+O1uB
         XiiEaM3JnFxrnp8ct5B8SXnCzUl1lopxls0XT9YjKyp7ax0870wvMMFvRevFnfw0hTax
         tZ4A==
X-Gm-Message-State: AOAM530Ps4Y7lUwm6FObn4p5E1HDeyzeHMNKMkTDM3Vp2441WBvwiACL
        yy0cya3Y5IlwT/pYiKv3056LV2yCaPE=
X-Google-Smtp-Source: ABdhPJzrL3VbaC1N9ngpMB8IGJXnZfJgvhF2LTvf+yLIyloxqWe2E7ls2PaV/gkXkBZ+cuVD+ydC6A==
X-Received: by 2002:ac2:5e9d:: with SMTP id b29mr8966652lfq.31.1617374904071;
        Fri, 02 Apr 2021 07:48:24 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-85.dynamic.spd-mgts.ru. [109.252.193.85])
        by smtp.googlemail.com with ESMTPSA id h3sm919114ljc.67.2021.04.02.07.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 07:48:23 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] NVIDIA Tegra memory improvements
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210330230445.26619-1-digetx@gmail.com>
 <b9bc9700-d3c1-54b4-72a3-ace4c3b9e9ed@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <25acdacd-ace5-f680-cace-f8d8119589ea@gmail.com>
Date:   Fri, 2 Apr 2021 17:47:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b9bc9700-d3c1-54b4-72a3-ace4c3b9e9ed@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.04.2021 20:54, Krzysztof Kozlowski пишет:
> On 31/03/2021 01:04, Dmitry Osipenko wrote:
>> Hi,
>>
>> This series replaces the raw voltage regulator with a power domain that
>> will be managing SoC core voltage. The core power domain patches are still
>> under review, but it's clear at this point that this is the way we will
>> implement the DVFS support.
>>
>> The remaining Tegra20 memory bindings are converted to schema. I also
>> made a small improvement to the memory drivers.
>>
>> Changelog:
>>
>> v2: - Fixed typos in the converted schemas.
>>     - Corrected reg entry of tegra20-mc-gart schema to use fixed number of items.
>>     - Made power-domain to use maxItems instead of $ref phandle in schemas.
>>
>> Dmitry Osipenko (6):
>>   dt-bindings: memory: tegra20: emc: Replace core regulator with power
>>     domain
>>   dt-bindings: memory: tegra30: emc: Replace core regulator with power
>>     domain
>>   dt-bindings: memory: tegra124: emc: Replace core regulator with power
>>     domain
>>   dt-bindings: memory: tegra20: mc: Convert to schema
>>   dt-bindings: memory: tegra20: emc: Convert to schema
>>   memory: tegra: Print out info-level once per driver probe
> 
> Thanks, applied subset - 1-4 and 6. For patch 5/6 I expect v3.

I'll make a v3, thank you.

