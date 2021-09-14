Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C50EC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 19:20:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D7BE61262
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 19:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhINTWF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Sep 2021 15:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234321AbhINTV5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Sep 2021 15:21:57 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A3DC0613D8;
        Tue, 14 Sep 2021 12:20:34 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id p29so603438lfa.11;
        Tue, 14 Sep 2021 12:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sWUveR2st8W0vI/cjNjCZ7SFinSkJr9hz3+NwIh5zpw=;
        b=QK8y3w5xbn/XH3R6Lh0goR3B1q+DKq37YdfrTgzs8oOf1GLlRm2xfOPYfMyZhG3wx4
         O1RuuYiQNIIiCMWRzlpTWPY4Ngq4KW3zJvySWMYGGU42D900bBPxJTkhM0WqyyJksZMM
         UoUkEGgvTRYRS2qvVmR0JB4qwKzxMKZOsUhXPlioGZi1r5AgJ3crLYgH0wRmAHD97pTq
         yHWbUn01auG+e2mMFTej9B0R9POqdEkYQSPNeo2Rs32TD75Kwn3zKqqZJTzh8HVu+EHi
         7azgZjW5KVW5pPHkGk80S54JdZXUCxOTeZgkuGMyibKF1XHik9T4HSnNQr0pLQ9wrJLX
         oYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sWUveR2st8W0vI/cjNjCZ7SFinSkJr9hz3+NwIh5zpw=;
        b=cz1+k7sw+Cr5UaVS+VTxVoXiIHxEObU3tcLbfzXVmmTDIlFPKN8oRyeSOnN8LOSk86
         H7bEYFmIgWknYzkje3fQ/DjAumLWENqTB1rGhUdS91FbQY8b0CXFJQj8u6yMPoRG5voq
         9wnRXIonS/7n6+sc6K8z2Xm1FPUvSXw09pfIL7FE3VHOhXtr83BNmNvPhboQAFJ/PAfO
         pKp7Hlss7p1lMAPrW1Nkry4ONV0NC085/6uth7iZ61MyYY6uZdRGkCFnfyHBLGzOBf95
         MiKa1osi7SoNcXZqjCoSc/rCePlyLYwLnpojP3pXx1hqc0ZC09yIqdz3heWgoT+x8PlU
         1AKw==
X-Gm-Message-State: AOAM533VR8ycVcMyc8/dkYsJItqt8FRJCUAsSUF1WfihNv3drAbJN/2R
        /A/FirpJned6NZG5KK4gLD6kyOIfuH0=
X-Google-Smtp-Source: ABdhPJyY4q+Rms2R5q4yuEjNMcWE8zHzIgYnjvP4+9Cip3MQivqsHDeOuAYhpmFlejWFO+AL7aKTjQ==
X-Received: by 2002:ac2:5e9c:: with SMTP id b28mr14190756lfq.405.1631647232471;
        Tue, 14 Sep 2021 12:20:32 -0700 (PDT)
Received: from [192.168.2.145] (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.googlemail.com with ESMTPSA id p14sm1405436ljj.140.2021.09.14.12.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 12:20:31 -0700 (PDT)
Subject: Re: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to
 debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-7-nicoleotsuka@gmail.com>
 <31501a62-3312-9f04-3bb8-790d0481746c@gmail.com>
 <20210914184933.GA32705@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <25d68aff-323a-df54-45f9-55b22f3089e0@gmail.com>
Date:   Tue, 14 Sep 2021 22:20:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914184933.GA32705@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.09.2021 21:49, Nicolin Chen пишет:
> On Tue, Sep 14, 2021 at 04:29:15PM +0300, Dmitry Osipenko wrote:
>> 14.09.2021 04:38, Nicolin Chen пишет:
>>> +static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned int pt_index)
>>> +{
>>> +	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
>>> +	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
>>> +}
>>
>> We know that IOVA is fixed to u32 for this controller. Can we avoid all
>> these dma_addr_t castings? It should make code cleaner a tad, IMO.
> 
> Tegra210 actually supports 34-bit IOVA...
> 

It doesn't. 34-bit is PA, 32-bit is VA.

Quote from T210 TRM:

"The SMMU is a centralized virtual-to-physical translation for MSS. It
maps a 32-bit virtual address to a 34-bit physical address. If the
client address is 40 bits then bits 39:32 are ignored."

Even if it supported more than 32bit, then the returned ulong is 32bit,
which doesn't make sense.
