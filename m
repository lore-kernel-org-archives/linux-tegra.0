Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7BDC47083
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 07:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A526961376
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 07:35:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbhFBHhK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 03:37:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45518 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbhFBHhE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 03:37:04 -0400
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1loLPG-0002G1-Rc
        for linux-tegra@vger.kernel.org; Wed, 02 Jun 2021 07:35:14 +0000
Received: by mail-wr1-f71.google.com with SMTP id x9-20020a5d49090000b0290118d8746e06so648052wrq.10
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 00:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JvJXLe7wuDMo4dMeJTK8HPwncAx/5KQ4VsWbJ9RYVb4=;
        b=gfwG2rJAMKBcjq5pUQ3w3+XVzNmDp0zJ/Dx2mVeFmb00mTo4tPvrMndHNgADoePbcj
         RjERwhK+XZHLJ6tpLZk2QqKMlCpqkvTMVBwB8IE7EOlJiqtlL4nsrdXgi2vS13vxNTrg
         QZpdJWI8jZpvpVDYhueuz56DyaP32JsMpraSDYYJO+z1MM7/oSW2ZL3j/KojXwkyhdqc
         xuRsu/zwOQQ6MgfC+6bySyLA/dQVjYD+oKioF9LsI+GVbK8zpV+f/2hS96czmUCSmWbF
         c08LbjrsXd/UFnd955uhCrix9zg8EIL+RHJe8FXJ/iXc+lvnuhMqI5nZZ7VGfeSb75fI
         Qlaw==
X-Gm-Message-State: AOAM533ZGe+gdxw80LzXoZOyHrRQXTWwS2UeNKaXf1aou/j2vV2dm/2V
        v96ytdC0nYCFeFn54UyChnNzzu44NwoSP+XOqcjfwSKTHL/oO9LpC5X3UD2Bv8UFGI5OipSvjhn
        L3/5aPpK5GPzvl86pL3kNO5T+JtUMJvKiWOiuKL8N
X-Received: by 2002:adf:e3c1:: with SMTP id k1mr24690730wrm.305.1622619314614;
        Wed, 02 Jun 2021 00:35:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf8k2Z7YB6EATdP0kZ4y/LXCdi7h0gVgiRlY0k3OM3TxL9je0FyaeHuVa+vh7PhXaPmFjJtA==
X-Received: by 2002:adf:e3c1:: with SMTP id k1mr24690721wrm.305.1622619314454;
        Wed, 02 Jun 2021 00:35:14 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id w13sm1785599wmi.4.2021.06.02.00.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 00:35:13 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] arm64: tegra: Prevent early SMMU faults
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
 <YLEi2FonP568wYrE@orome.fritz.box> <20210601122646.GB27832@willie-the-truck>
 <YLZ3qPC8ofjsGkPi@orome.fritz.box>
 <6826d892-d1ac-e3b1-ebee-68392d11d7c5@canonical.com>
Message-ID: <8c70f82f-0db9-2312-7fc4-c079899c25a0@canonical.com>
Date:   Wed, 2 Jun 2021 09:35:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6826d892-d1ac-e3b1-ebee-68392d11d7c5@canonical.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/06/2021 09:33, Krzysztof Kozlowski wrote:
> On 01/06/2021 20:08, Thierry Reding wrote:
>> On Tue, Jun 01, 2021 at 01:26:46PM +0100, Will Deacon wrote:
>>> On Fri, May 28, 2021 at 07:05:28PM +0200, Thierry Reding wrote:
>>>> On Tue, Apr 20, 2021 at 07:26:09PM +0200, Thierry Reding wrote:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>> Probably best if I queue 3-6 on a separate branch once you send a v3,
>>> then Krzysztof can pull that in if he needs it.
>>
>> Patch 5 has a build-time dependency on patch 1, so they need to go in
>> together. The reason why I suggested Krzysztof pick these up is because
>> there is a restructuring series that this depends on, which will go into
>> Krzysztof's tree. So in order to pull in 3-6, you'd get a bunch of other
>> and mostly unrelated stuff as well.
> 
> I missed that part... what other series are needed for this one? Except
> Dmitry's power management set I do not have anything in my sight for
> Tegras memory controllers.
> 
> Anyway, I can take the memory bits and provide a stable tag with these.
> Recently there was quite a lot work around Tegra memory controllers, so
> this makes especially sense if new patches appear.

OK, I think I have now the patchset you talked about - "memory: tegra:
Driver unification" v2, right?


Best regards,
Krzysztof
