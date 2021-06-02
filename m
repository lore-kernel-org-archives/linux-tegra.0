Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CA8C47083
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 14:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 348AE613BF
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 14:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhFBO77 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 10:59:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59078 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhFBO75 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 10:59:57 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1loSJx-0006CF-Bj
        for linux-tegra@vger.kernel.org; Wed, 02 Jun 2021 14:58:13 +0000
Received: by mail-ed1-f72.google.com with SMTP id y7-20020aa7ce870000b029038fd7cdcf3bso1564298edv.15
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 07:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=752p4tr8om9PZTkMN+y5OaTny2tseRBiO4Qw5qPX/uc=;
        b=m1p1EMy89DJ0HQX8C7nHBLbheBYv9GFziEPBb/00wm3OAz/Pi9ORUMMhq2rkP4Fbwd
         NM8L3ljPRMudiV+sJX5arWUgRL4ytu8fGhMZF9kLfokK2tZZzexN8yny1GZF62Fztb+1
         DKlF0Ep0EMasDf2KqIA/5z6hz34cFhwOFFl+INqdt8zCsapFJ4VtSn2+MGrE3LmTGGHF
         4ruYt9SIT4IA/vXTvfwJ/1+8N65hIll85qagBqaRnJlE7aOORcSE/KEsyM9iclT+WQ1E
         3XeQqDTprJVkFLAWneXFTSiWASTnVMuXgqJh7G80A5QSzfHiA9vyTBAaclIPS6IqDLWZ
         P8ng==
X-Gm-Message-State: AOAM5319oyYQ7eOAAoDHOg5DxD7JT5ICCgESNjAZwkzax+KBXoOLSE60
        aXXupbJXS7i5b5wwp7rJiHaRNxngtwwLB6t9DIIwfabDLrGike/yKkZwcM+8sCSvvSEEEW3ERcC
        y6TgPI9KMT8+1uLEdbdCu1eFq3SDM107gGhCoijPO
X-Received: by 2002:a17:906:c0da:: with SMTP id bn26mr34977227ejb.437.1622645892872;
        Wed, 02 Jun 2021 07:58:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkFWWKXUi9uF3fTYTqDvU90HNZjSch1pOOs5UUihZd7KkSvKKBSG8U5eE+iM6V9QT5ZvntNg==
X-Received: by 2002:a17:906:c0da:: with SMTP id bn26mr34977219ejb.437.1622645892708;
        Wed, 02 Jun 2021 07:58:12 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id u15sm115179edy.29.2021.06.02.07.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 07:58:12 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] arm64: tegra: Prevent early SMMU faults
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
 <8c70f82f-0db9-2312-7fc4-c079899c25a0@canonical.com>
 <YLdGwD0dxfER4USn@orome.fritz.box>
 <e2341ca1-7b6d-cc19-8c43-1ada0b1f5601@canonical.com>
 <20210602114049.GF30593@willie-the-truck> <YLeclZlP8l3dMX4o@orome.fritz.box>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <cc37b000-74f9-696a-e7f6-964b8f948743@canonical.com>
Date:   Wed, 2 Jun 2021 16:58:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLeclZlP8l3dMX4o@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/06/2021 16:58, Thierry Reding wrote:
> On Wed, Jun 02, 2021 at 12:40:49PM +0100, Will Deacon wrote:
>> On Wed, Jun 02, 2021 at 12:44:58PM +0200, Krzysztof Kozlowski wrote:
>>> On 02/06/2021 10:52, Thierry Reding wrote:
>>>> On Wed, Jun 02, 2021 at 09:35:13AM +0200, Krzysztof Kozlowski wrote:
>>>>> On 02/06/2021 09:33, Krzysztof Kozlowski wrote:
>>>>>> On 01/06/2021 20:08, Thierry Reding wrote:
>>>>>>> On Tue, Jun 01, 2021 at 01:26:46PM +0100, Will Deacon wrote:
>>>>>>>> On Fri, May 28, 2021 at 07:05:28PM +0200, Thierry Reding wrote:
>>>>>>>>> On Tue, Apr 20, 2021 at 07:26:09PM +0200, Thierry Reding wrote:
>>>>>>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>>>>>>
>>>>>>>> Probably best if I queue 3-6 on a separate branch once you send a v3,
>>>>>>>> then Krzysztof can pull that in if he needs it.
>>>>>>>
>>>>>>> Patch 5 has a build-time dependency on patch 1, so they need to go in
>>>>>>> together. The reason why I suggested Krzysztof pick these up is because
>>>>>>> there is a restructuring series that this depends on, which will go into
>>>>>>> Krzysztof's tree. So in order to pull in 3-6, you'd get a bunch of other
>>>>>>> and mostly unrelated stuff as well.
>>>>>>
>>>>>> I missed that part... what other series are needed for this one? Except
>>>>>> Dmitry's power management set I do not have anything in my sight for
>>>>>> Tegras memory controllers.
>>>>>>
>>>>>> Anyway, I can take the memory bits and provide a stable tag with these.
>>>>>> Recently there was quite a lot work around Tegra memory controllers, so
>>>>>> this makes especially sense if new patches appear.
>>>>>
>>>>> OK, I think I have now the patchset you talked about - "memory: tegra:
>>>>> Driver unification" v2, right?
>>>>
>>>> Yes, that's the one. That series is fairly self-contained, but Dmitry's
>>>> power management set has dependencies that pull in the regulator, clock
>>>> and ARM SoC trees.
>>>>
>>>> I did a test merge of the driver unification series with a branch that
>>>> has Dmitry's patches and all the dependencies and there are no conflicts
>>>> so that, fortunately, doesn't further complicates things.
>>>>
>>>> Do you want me to send you a pull request with Dmitry's memory
>>>> controller changes? You could then apply the unification series on top,
>>>> which should allow this SMMU series to apply cleanly on top of that.
>>>
>>> Makes sense and it looks quite bulletproof for future changes. Let's do
>>> like this. I will apply your patch 1/10 from this v2 on top of it and
>>> driver unification later.
>>
>> Okey doke. Thierry -- please let me know which patches I can queue. Having
>> the SMMU driver changes in the IOMMU tree really helps in case of conflicts
>> with other SMMU changes. As I say, I can put stuff on a separate branch for
>> you if it helps.
> 
> Given that the SMMU patches have a build-time dependency on the first
> patch in the series, and the series depends on the unification series, I
> think Krzysztof would have to pull the memory controller branch that I
> have with Dmitry's work, apply the unification series on top and then
> take patch 1 of this series on top of that. That's the state that you'd
> have to pull into the SMMU tree to get the right dependencies.
> 
> The SMMU pieces are the leaf of the dependency tree, so technically no
> separate branch is needed, because I don't think anybody would have to
> pull from it. However, a separate branch might make it easier to back
> any of this work out if we have to.
> 
> Krzysztof, I do plan on sending out a v3 of the unification series to
> address the two cleanups that Dmitry and you have pointed out. After
> that I can send out v3 of this series to fix the ordering issue that
> Krishna had mentioned. After all of those are applied, would you be able
> to provide a stable branch for Will's SMMU tree?

Yes, I will provide a stable branch/tag.

Best regards,
Krzysztof
