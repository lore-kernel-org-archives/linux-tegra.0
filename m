Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B90C47094
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 14:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C63EB613F8
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 14:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhFJOZ5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 10:25:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54066 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhFJOZz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 10:25:55 -0400
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lrLbB-0002JM-VU
        for linux-tegra@vger.kernel.org; Thu, 10 Jun 2021 14:23:58 +0000
Received: by mail-wr1-f71.google.com with SMTP id h104-20020adf90710000b029010de8455a3aso960956wrh.12
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 07:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+wqZL59v8SDuZCGAvgfZHpaTUmd/SqDTBj4hRdNKBbo=;
        b=Zk2A50hvYlUK5/8uUCBbKmZFT+vOY4ZW4/kgDVXkQnAvF9Lp+ymbbnff95b25dw+X6
         q3wl0YuvVEdcwbVN1XOpxy+SrkfklsTfCIGfO1N/iSNVnLbkPmpwDRFLgp2FUS3bW5Bp
         0Hj/unzUns8J+9nnOAUiV4vWdtOkxDwEiKq+X6OHWCVg55dq5itkbRV5i+wzyTQn95Gs
         S6HIqP+M2xjBTivRDxbNfatww/qj/j5UKrL/IV/NgbXJmzOplluWsMKTkXLNBhZtjlvt
         fjN+0QU1xsHgDm4LiFbyl+JDL1RpNPxEy7MPb8qXy7Hm0QjQARQAEJNjL/KUH9JgGnYP
         fbxg==
X-Gm-Message-State: AOAM532gbtrSDGpSKpcs0S86A0+pjz2WtUB48SaoSxCSLY0sztqeKhex
        VEqidPuaDlkLvrnlvvYKQ+R9OKoSJWA7T6yBQXMmKlEpXITopFnS3tZzgnTs4gRybZIe+Gw4z2g
        NtB/uyf0KP4vZj8FfEmEsuMta2vDuT0HxQH/hGqJ5
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr5916065wro.164.1623335037656;
        Thu, 10 Jun 2021 07:23:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWLlTc3t66M+OqJpzcEjLbLm8rLUWjRR9mtinW1Hr3buaD1/RibxYzmB57pMJb/ZxfXIgvyQ==
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr5916040wro.164.1623335037448;
        Thu, 10 Jun 2021 07:23:57 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id p5sm3834669wrd.25.2021.06.10.07.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 07:23:56 -0700 (PDT)
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Osipenko <digetx@gmail.com>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
 <20210608120128.GB10174@willie-the-truck> <YL+A+MPjjaa3nSwq@orome.fritz.box>
 <20210608164851.GB10994@willie-the-truck> <YMHZCaRiQNQCSsVr@orome.fritz.box>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8c18edeb-2e3e-9072-6bb4-11637d0ca3e5@canonical.com>
Date:   Thu, 10 Jun 2021 16:23:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMHZCaRiQNQCSsVr@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/06/2021 11:19, Thierry Reding wrote:
> On Tue, Jun 08, 2021 at 05:48:51PM +0100, Will Deacon wrote:
>> On Tue, Jun 08, 2021 at 04:38:48PM +0200, Thierry Reding wrote:
>>> On Tue, Jun 08, 2021 at 01:01:29PM +0100, Will Deacon wrote:
>>>> On Mon, Jun 07, 2021 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
>>>>> This is the pull for you to base further SMMU aptches (prevent early SMMU
>>>>> faults).
>>>>
>>>> This is a tonne of code for me to pull into the SMMU tree given that I only
>>>> want one patch!
>>>>
>>>> Thierry, if I just stick:
>>>>
>>>> https://lore.kernel.org/r/20210603164632.1000458-4-thierry.reding@gmail.com
>>>>
>>>> on its own branch, can you stitch together whatever you need?
>>>
>>> I'm not sure I understand what you're proposing. For reference, here's
>>> the set of patches that I sent out:
>>>
>>>   1. memory: tegra: Implement SID override programming
>>>   2. dt-bindings: arm-smmu: Add Tegra186 compatible string
>>>   3. iommu/arm-smmu: Implement ->probe_finalize()
>>>   4. iommu/arm-smmu: tegra: Detect number of instances at runtime
>>>   5. iommu/arm-smmu: tegra: Implement SID override programming
>>>   6. iommu/arm-smmu: Use Tegra implementation on Tegra186
>>>   7. arm64: tegra: Use correct compatible string for Tegra186 SMMU
>>>   8. arm64: tegra: Hook up memory controller to SMMU on Tegra186
>>>   9. arm64: tegra: Enable SMMU support on Tegra194
>>>
>>> Krzysztof already picked up patch 1 and I was assuming that you'd pick
>>> up 2-6 because they are to the ARM SMMU driver. However, if you're
>>> primarily interested in just patch 3, which is more "core" ARM SMMU than
>>> the rest, which are Tegra-specific, then I suppose what we could do is
>>> for you to give an Acked-by on the rest (2, 4-6) and then Krzysztof or I
>>> can pick them up and take them via ARM SoC, based on the stable branch
>>> from your tree that only has patch 3.
>>
>> I think you previously said that patch 5 depends on patch 1, so I can't
>> take 2-6 without also pulling in the memory controller queue.
>>
>>> Patch 6 touches arm-smmu-impl.c, though it's a two-line change that
>>> touches only the Tegra-specific matching bit in arm_smmu_impl_init(), so
>>> the likelihood of that conflicting with anything else is fairly small.
>>>
>>> Is that what you were proposing?
>>
>> I can queue as much or as little of 2-6 as you like, but I would like to
>> avoid pulling in the memory controller queue into the arm smmu tree. But
>> yes, whichever of those I take, I can put them on a separate branch so
>> that you're not blocked for the later patches.
>>
>> You have a better handle on the dependencies, so please tell me what works
>> for you. I just want to make sure that at least patch 3 lands in my tree,
>> so we don't get late conflicts with other driver changes.
> 
> Yes, if you could pick up patch 3 and send out a link with the stable
> branch, I think Krzysztof or I could pull in that branch and pick up the
> remaining patches. It'd be good if you could also ack the remaining SMMU
> patches so that ARM SoC knows that they've been sanctioned.
> 
> Krzysztof: would you be okay with picking up patches 2 and 4-6 on top of
> your memory branch for v5.14?

You mean the iommu patches? Yes, I can take them and later explain to
Arnd/Olof why they come through me.


Best regards,
Krzysztof
