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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD93C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 07:31:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB1462076E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 07:31:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fan3qd6T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgI3Hbl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 03:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgI3Hbk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 03:31:40 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DABAC061755;
        Wed, 30 Sep 2020 00:31:39 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b22so892150lfs.13;
        Wed, 30 Sep 2020 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SGO2NZQ83mZVSNOizDUSniAn+rBNIh90Przur6itDd8=;
        b=Fan3qd6TBFqgoYlbCgxq0HtITaSK4cpNUMlfGMYYKjbDmxl0TkLyPLN2/vE8s6eq3S
         Vt18W2ziFdKm6w5eDliw9VY+x4t5Wx69zEMPX6V6XoTMcAFKQ3GffIt6Dtku32O1SkQw
         91mYdUvIww+E63p2SWh9CU4ZGt8q2JD/3c5Er6UNnSTNvAPmlJu+9o/HEi+MymPUKlXs
         LGEKj3votjVHLNZ2agZ/xnMMlG14ch92/p8PnN9f0PFcbl/2kJTiHRyHmliAc5V3ZM3X
         bZ9xUtW0HcAHOi/ZQ69j4GD08yRJz0HVWrsVR/u5kQ5eIEfpJT1nGnVjfguSeopXXF05
         n3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SGO2NZQ83mZVSNOizDUSniAn+rBNIh90Przur6itDd8=;
        b=RQfBxjCAjpnTOBfpfDDK5U/DTNPXU5Kf8qdEWOSaWWIJ5LhRsEeVY+97H6Fr340Aed
         ZVzMj4Ip8juBp+DDpndmZJ+9SEY8mokbVuvo52byGIoRgFcI7/hg/0P3AfFmLZjBw5aw
         Ksed0X5e9X6nPVHjhm2sejFhlkG8nPJMbLW+mDxBH8lhtnr8FIO4/UniwJuz/9E0VwnY
         BuYtvx1uFQ52uPEj3H8hfxrn4m+2WQkE9axjF0avfY5XFzlwu7uOMYlFZ0AeAmLYlmJt
         1QAzMnUOzqmg48enNOyMRcanyvvsE6YVEiVuY5yz+DBj3I0BbFzkD9rJrrLNDMOQ7bYN
         6NNw==
X-Gm-Message-State: AOAM532FftpF24+KcY0c90upkf0i3C2IkOvDS6zTHiuj8k5bSubENerQ
        w79tkrp4KEZG4WFYhO3tT4cpLYXwWMA=
X-Google-Smtp-Source: ABdhPJyQqUXR6tmLauIulzo2x4C8Vf0e5lddBc1ZH/i32Csp4UkDO+xG7Ug15AKoPIN4RwmY0CgLgA==
X-Received: by 2002:a19:402:: with SMTP id 2mr397312lfe.279.1601451097259;
        Wed, 30 Sep 2020 00:31:37 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id h124sm90415lfd.151.2020.09.30.00.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 00:31:36 -0700 (PDT)
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
 <2f752179-5ad3-c000-8794-494c79f7b21f@gmail.com>
 <20200930063820.GD16460@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a613dac4-1a7e-54b3-02da-4aedc673ecfb@gmail.com>
Date:   Wed, 30 Sep 2020 10:31:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930063820.GD16460@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 09:38, Nicolin Chen пишет:
> On Wed, Sep 30, 2020 at 09:32:20AM +0300, Dmitry Osipenko wrote:
>> 30.09.2020 08:44, Nicolin Chen пишет:
>>> On Wed, Sep 30, 2020 at 08:12:10AM +0300, Dmitry Osipenko wrote:
>>>> 30.09.2020 03:30, Nicolin Chen пишет:
>>>> ...
>>>>>  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
>>>>>  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
>>>>> +struct tegra_mc *tegra_get_memory_controller(void);
>>>>>  
>>>>>  #endif /* __SOC_TEGRA_MC_H__ */
>>>>>
>>>>
>>>> This will conflict with the tegra20-devfreq driver, you should change it
>>>> as well.
>>>
>>> Will remove that in v3.
>>>
>>> Thanks
>>>
>>
>> Please also consider to add a resource-managed variant, similar to what
>> I did here:
>>
>> https://github.com/grate-driver/linux/commit/2105e7664063772d72fefe9696bdab0b688b9de2
>>
>> I was going to use it in the next iteration of the memory interconnect
>> series.
>>
>> But now it also will be good if you could add the devm variant to yours
>> SMMU patchset since you're already about to touch the tegra20-devfreq
>> driver. I'll then rebase my patches on top of yours patch.
> 
> Just saw this reply. Yea, I think this'd be better. Thanks
> 

Please don't forget to add a stub for !MC as well since devfreq drivers
use COMPILE_TEST and don't directly depend on the MC driver.
