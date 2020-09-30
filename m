Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19287C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:32:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD3DF2075F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcQzy050"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgI3GcY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 02:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3GcY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 02:32:24 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B27FC061755;
        Tue, 29 Sep 2020 23:32:23 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so750569lfb.6;
        Tue, 29 Sep 2020 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3VXdqYD5mLaS1mNtGut0e8DjZwBTzbu+70S04GgZNgE=;
        b=LcQzy050EZalf2qpmr9trF0VPQjIjWYoZb8sVqO80WQjOpquIS5pk4F54nzBliLaMv
         3olCtvJ+qtiMq9pezX6RxjDsuTt0jn4aKcPqaAIfz3WvylgNEWYdwNepowcRJcXVn6Gs
         Q6w+QQSVi/odYVYafmow53w972C4SVgaiYwGL0zVmg3M7dj1GsuTYaVtzz9aCpmebhU2
         pxf5PDCv+6NznBzQwmvzZFU5VCMDqJmml2TxQOneorLWc853lIclVFbo9dK4EcVydNrc
         VVvPsnVUdlSaSnoaaTvqKGABHmfoHlPGwV+EK0mxWiGmK/uWZt3BVtmfiVout8MD02IN
         6e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3VXdqYD5mLaS1mNtGut0e8DjZwBTzbu+70S04GgZNgE=;
        b=V41BKu+GCf4aNAO840ciQt7dnn2/Dt6dwZdiaGt8dHTql3WlvK8sanm0PXyJ1zz9Ny
         PiAw8IYdqseS2qs8r91jlzPfhfSJhwcuO/RVjlsLpEYXH6VA7JMeiqz0EOLP/NtjV0VF
         lBlK29e1eWOJxNw1u0QTeAx7nnsD4f0pTgreiVu7+G7w/9kNpbYHh9rW7bzWYYVjXNsd
         LZ45sx2CTUxrunjmPHGwNTZn8cHjUe61ALNRqLvLgY4aQ2fQDIViVNl6MkrXTAoRxLiB
         zWS1JY7axP6qXFtaNk12UGE2LF5C4ILkyBi3+0A9pV0FpBoQK0wt+t7AIA5b2bZdwpn/
         5h8w==
X-Gm-Message-State: AOAM533W3nd+iNzttZXie/ydnke5JcvM7k4GjgRtNmaMItDdYiRWKVVt
        0IieMTJiA9xrctmcUYbzp1SEs1WJxjU=
X-Google-Smtp-Source: ABdhPJxtz5X8Ydt5H29th5vtTUu5WnUXnmwg6pfBKoUvhlPcRiWNg7TvK0ExxmdCcyc2hvCHS2q3yQ==
X-Received: by 2002:ac2:5190:: with SMTP id u16mr313979lfi.314.1601447541818;
        Tue, 29 Sep 2020 23:32:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id d24sm76325lfn.140.2020.09.29.23.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 23:32:21 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] memory: tegra: Add helper function
 tegra_get_memory_controller
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-2-nicoleotsuka@gmail.com>
 <93803d8b-9863-e977-fa87-a03e877b095d@gmail.com>
 <20200930054455.GF31821@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2f752179-5ad3-c000-8794-494c79f7b21f@gmail.com>
Date:   Wed, 30 Sep 2020 09:32:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930054455.GF31821@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 08:44, Nicolin Chen пишет:
> On Wed, Sep 30, 2020 at 08:12:10AM +0300, Dmitry Osipenko wrote:
>> 30.09.2020 03:30, Nicolin Chen пишет:
>> ...
>>>  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
>>>  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
>>> +struct tegra_mc *tegra_get_memory_controller(void);
>>>  
>>>  #endif /* __SOC_TEGRA_MC_H__ */
>>>
>>
>> This will conflict with the tegra20-devfreq driver, you should change it
>> as well.
> 
> Will remove that in v3.
> 
> Thanks
> 

Please also consider to add a resource-managed variant, similar to what
I did here:

https://github.com/grate-driver/linux/commit/2105e7664063772d72fefe9696bdab0b688b9de2

I was going to use it in the next iteration of the memory interconnect
series.

But now it also will be good if you could add the devm variant to yours
SMMU patchset since you're already about to touch the tegra20-devfreq
driver. I'll then rebase my patches on top of yours patch.
