Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88D5C4708F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 14:57:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2DD8613B4
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 14:57:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhFBO7K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 10:59:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59037 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhFBO7J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 10:59:09 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1loSJB-00064E-Jv
        for linux-tegra@vger.kernel.org; Wed, 02 Jun 2021 14:57:25 +0000
Received: by mail-ed1-f70.google.com with SMTP id f12-20020a056402150cb029038fdcfb6ea2so1560318edw.14
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 07:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5UZTctpyMU1tqV2bWypkWi0vBIdQnzmdQjPZbkJkFxI=;
        b=dDZrJ7nKQMwH+WYVKgpcC26hGomgM6YTiwbPa7sMDVOBLKKJocckM5qj6leFmhV0e6
         eRwk7GIoSBQgilwMUutQYxA3NIqYkbJ6kJ9Qm0xM/szO78rK8BQYRNnkxQ2o+3EgciWT
         QUXQAv9uvwxnyJiB2Pn9aUCq5NNs85fsqgiaMttHpKyXBH6xEb7SKb3d7kxT4gFqC6gA
         72I37upqMYzgbssimhY16jGTd9B25/KdJ9kI/BTaTmew0WzBhLj47MZ2D8OFNKCMXol8
         RIrGxAbawAI9ZHteG1/nwnMtQruAjs/C6DSwoFQBznmvzOoKSOfFGUW+Jwhj6npDsI/H
         /VIA==
X-Gm-Message-State: AOAM5321BgiqDGjHLmQZrt6RxJ4gAiV3E+2QwgEdUholtstcj4vJ7TNC
        btexl2/MErDtYt72ccLVOGOSgpjucrQ8AqZmjdtw18XQQyDjce8EUdVynzYjyWejmq0wVuf1id1
        hAVPZo3pengW2Yq0XJNU1zHmrjTX5EiNCxgTkQhXe
X-Received: by 2002:aa7:db90:: with SMTP id u16mr38474947edt.106.1622645845373;
        Wed, 02 Jun 2021 07:57:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ4i0LSt+XF3nCHErp4gakUgDnSABZ0NbDv6a/+Sefs1zN5Oq3E+RJsFlG2lB5k+sufWAKwg==
X-Received: by 2002:aa7:db90:: with SMTP id u16mr38474927edt.106.1622645845191;
        Wed, 02 Jun 2021 07:57:25 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id f7sm131546ejz.95.2021.06.02.07.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 07:57:24 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] arm64: tegra: Prevent early SMMU faults
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
 <YLebbQZlROtSq124@orome.fritz.box>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6cc79313-30b9-8223-b346-931ceea301d6@canonical.com>
Date:   Wed, 2 Jun 2021 16:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLebbQZlROtSq124@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/06/2021 16:53, Thierry Reding wrote:
> On Wed, Jun 02, 2021 at 12:44:58PM +0200, Krzysztof Kozlowski wrote:
>> On 02/06/2021 10:52, Thierry Reding wrote:
>>> On Wed, Jun 02, 2021 at 09:35:13AM +0200, Krzysztof Kozlowski wrote:
>>>> On 02/06/2021 09:33, Krzysztof Kozlowski wrote:
>>>>> On 01/06/2021 20:08, Thierry Reding wrote:
>>>>>> On Tue, Jun 01, 2021 at 01:26:46PM +0100, Will Deacon wrote:
>>>>>>> On Fri, May 28, 2021 at 07:05:28PM +0200, Thierry Reding wrote:
>>>>>>>> On Tue, Apr 20, 2021 at 07:26:09PM +0200, Thierry Reding wrote:
>>>>>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>>>>>
>>>>>>> Probably best if I queue 3-6 on a separate branch once you send a v3,
>>>>>>> then Krzysztof can pull that in if he needs it.
>>>>>>
>>>>>> Patch 5 has a build-time dependency on patch 1, so they need to go in
>>>>>> together. The reason why I suggested Krzysztof pick these up is because
>>>>>> there is a restructuring series that this depends on, which will go into
>>>>>> Krzysztof's tree. So in order to pull in 3-6, you'd get a bunch of other
>>>>>> and mostly unrelated stuff as well.
>>>>>
>>>>> I missed that part... what other series are needed for this one? Except
>>>>> Dmitry's power management set I do not have anything in my sight for
>>>>> Tegras memory controllers.
>>>>>
>>>>> Anyway, I can take the memory bits and provide a stable tag with these.
>>>>> Recently there was quite a lot work around Tegra memory controllers, so
>>>>> this makes especially sense if new patches appear.
>>>>
>>>> OK, I think I have now the patchset you talked about - "memory: tegra:
>>>> Driver unification" v2, right?
>>>
>>> Yes, that's the one. That series is fairly self-contained, but Dmitry's
>>> power management set has dependencies that pull in the regulator, clock
>>> and ARM SoC trees.
>>>
>>> I did a test merge of the driver unification series with a branch that
>>> has Dmitry's patches and all the dependencies and there are no conflicts
>>> so that, fortunately, doesn't further complicates things.
>>>
>>> Do you want me to send you a pull request with Dmitry's memory
>>> controller changes? You could then apply the unification series on top,
>>> which should allow this SMMU series to apply cleanly on top of that.
>>
>> Makes sense and it looks quite bulletproof for future changes. Let's do
>> like this. I will apply your patch 1/10 from this v2 on top of it and
>> driver unification later.
> 
> The SMMU series here depends on the unification series, so the
> unification series needs to go first. It'd be a fair bit of work to
> reverse that because the ->probe_device() callback implemented by the
> first patch of this SMMU series is part of the tegra_mc_ops structure
> that's introduced in the unification series.

Right, you already wrote it in the first email in this thread, I just
reversed words in my head... Then as you wrote - take Dmitry's changes
and share them via pull to me. I'll put on top the unification series,
then #1 from this SMMU series and finally I'll provide a pull request
for Will so his SMMU can go on.

Best regards,
Krzysztof
