Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC55C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:58:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37D2A206B8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:58:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1lY6Z8k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgI3F6x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI3F6x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:58:53 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C62C061755;
        Tue, 29 Sep 2020 22:58:53 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b19so510043lji.11;
        Tue, 29 Sep 2020 22:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A07jU2fqPNriE7JlbjVVJctTqDJScAFyMSa09/qBUv0=;
        b=L1lY6Z8k4TVVtEgLMsoRnQXR4YsDfmlHB7D63jhrEfmJTuOGZYR3VKgVhu5m+GYfVa
         craHGNpoduK/2toDTG2Tvtjecw36hjOeq9gHozp97m+os2x2xfUOnYZObLFQ5W4k3ZnK
         lDI5ihwL3QeonI2bNkFO+2x1jYduhRNDjluYXm8+jo65mORHQXjPgV+SPddWE8vf1wDl
         kn/7hn3TGC53kSpcRUNEHTYBdPHmXDmhuRyCuCEF5wrPewpok5o8Z6Hlk0XVEky3UD5o
         oU8kEL76CjV8jXBovByst13qIn/OQRdRdgb+Dwvo9ByEEcCxU/Iha8f1aI2Kpkpq+d3n
         RzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A07jU2fqPNriE7JlbjVVJctTqDJScAFyMSa09/qBUv0=;
        b=W9p1sXPI2hLfaQXfy6zY+OUtNiMymVHD1K5MUCnMnBqUB6b3MCDUlcUNdHxl8FOQid
         d4kh8IVl3YMcvJPhLMQbOTr34743emOPStjHSyCbObAi3jB7jlSzQCDQmqrxAhP1SQvW
         kuWqK34XgaAv9ZJFfzNTyVO7aaVibrBHNeXRxLG2xE0VTaVyaHvlKou8d8SmAktVoTvH
         YpbfyAe+hiJmtNsgXbYb+EHITmP/e1DWF8smCRD+SYA7hyMJbr2bgTOVliIZrAlxsujb
         nxnAt0DCkEOVH4VHvrjflgrzwJxUqgWVZ0mV3mKie/LsdcIqF4k466TKgBRf/e6TRT4y
         4KVA==
X-Gm-Message-State: AOAM531Tj4+kCql2ICEYxLXOdEdhStIVgOHy8owr5/hgXXhi6HTp7ixG
        P0FSFRdqMt2JXE4u2oLb0hclawF7cjY=
X-Google-Smtp-Source: ABdhPJxYDYoBve1aBYaWHrCG+fPFDN1UNSoZFfHrz97nddxSlqSfsLnEBI8pcwyVntBP7cmj+JFzFw==
X-Received: by 2002:a05:651c:1af:: with SMTP id c15mr363650ljn.347.1601445531354;
        Tue, 29 Sep 2020 22:58:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id p9sm57855ljj.52.2020.09.29.22.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 22:58:50 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
 <f07d4fcc-ee19-874b-c542-0679660c3549@gmail.com>
 <20200930052952.GB31821@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <96e71d38-5888-5b21-f0e1-9e6def50484e@gmail.com>
Date:   Wed, 30 Sep 2020 08:58:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930052952.GB31821@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 08:29, Nicolin Chen пишет:
> Hi Dmitry,
> 
> On Wed, Sep 30, 2020 at 08:10:07AM +0300, Dmitry Osipenko wrote:
>> 30.09.2020 03:30, Nicolin Chen пишет:
>>> -	group->group = iommu_group_alloc();
>>> +	group->group = pci ? pci_device_group(dev) : iommu_group_alloc();
>>
>> This will be nicer to write as:
>>
>> if (dev_is_pci(dev))
>>     group->group = pci_device_group(dev);
>> else
>>     group->group = generic_device_group(dev);
> 
> Why is that nicer? I don't feel mine is hard to read at all...
> 

Previously you said that you're going to add USB support, so I assume
there will be something about USB.

It's also a kinda common style that majority of Tegra drivers use in
upstream kernel. But yours variant is good too if there won't be a need
to change it later on.
