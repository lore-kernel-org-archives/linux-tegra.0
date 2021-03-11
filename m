Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BABC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 12:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E2EC64DCC
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 12:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbhCKMGd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 07:06:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbhCKMG3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 07:06:29 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6248C061574;
        Thu, 11 Mar 2021 04:06:28 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id k9so39327034lfo.12;
        Thu, 11 Mar 2021 04:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cz3qHn16lIPc6Bvf+yNu/XUkZnLJ8XOdvMZnsOmsGnY=;
        b=a8DPjScMZmz1pro+pLVDtwvqiGnZRmG6Xms7jxGZ2yv19dDL5etamVTUAwCE5aE5UB
         WbfnH6YY/EmKPQsJERMn1xtj0OSb//1hnrbLkefJhRdxD9GN/kVO0V4Jsl4c0Vwghv6I
         g7yYUiaAR9RYkkfJBYpTqBxIDtyeyH5u7v3TR9HbmJbqo+FxEQMpJuZy629zbUSOO1jV
         xMgr+qePicNIjbQWe1AqK/OplgsPrJUH5ywEeTL23vD/12wK7vtTHnCVnJiMkHygNpHS
         fRP/TajOeAjwmbeayCi1L85VH8A56VRc27jaTd8TSw/Adpz3OWDLIttY8iFBzhudfEAr
         0pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cz3qHn16lIPc6Bvf+yNu/XUkZnLJ8XOdvMZnsOmsGnY=;
        b=FqUIR1Zrsdmz1FWqex8kXk0b40t+NqpevMYE1ttl3GgDSierKrAdSGW0pbfbT0jSOC
         38fU25X2PWAY3XIVHDS31YyoEs8IHU0xQjA7AbudHJXW2nOsotjB+n1o6JHngN/BZjwx
         ul8b5quEr2j5W7CcqKhuchQsYfUwe8B+m75+97//MePB7z3v++yk23D3lGQF6WjOXIbh
         +Fk0YlA6+hmJtxhQ0f9J9e1uezvTAtJi23tZruP2f0N5vB+xcPVttTh5RcSiBqnplHob
         YzIcb2z7QQuUz2Ta+c/Yusct0HfEf0jmGoD3vV2Ff+s2K8UfMlZM+xg9/wfrQHjknGX4
         F5ZA==
X-Gm-Message-State: AOAM531A80Tqz9jrQmS05zQTNgbtwpLmW5KY4p5c7BO6xUuZoet6oSfc
        LqmT9goHIUfuDrjVxU78aQQKrxGri/A=
X-Google-Smtp-Source: ABdhPJz5kk96u5mzTVzWD+Rqjk1vE/7c+3MwUfCcYcQA+Y7MilwieSJz6w4fEDuz7IuHKIpk6czCaQ==
X-Received: by 2002:a19:22d6:: with SMTP id i205mr2097509lfi.352.1615464387156;
        Thu, 11 Mar 2021 04:06:27 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id g6sm759501lfh.232.2021.03.11.04.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 04:06:26 -0800 (PST)
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        guillaume.tucker@collabora.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
 <a8a7a0af-895f-9d79-410d-5dd03ebbd6dd@gmail.com>
 <7714f272-3862-84ac-306d-86363a1c4880@gmail.com>
 <20210310221707.GB10431@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8c2f5d94-8835-9994-21aa-660df29d383c@gmail.com>
Date:   Thu, 11 Mar 2021 15:06:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210310221707.GB10431@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.03.2021 01:17, Nicolin Chen пишет:
> On Wed, Mar 10, 2021 at 11:22:57PM +0300, Dmitry Osipenko wrote:
>> 10.03.2021 22:13, Dmitry Osipenko пишет:
>>> I found that this patch introduced a serious regression on Tegra30 using
>>> today's linux-next. Tegra30 has two 3d h/w blocks connected in SLI and
>>> only one of the blocks is now attached to IOMMU domain, meaning that GPU
>>> is unusable now. All 3d, 2d and display devices share the same "DRM"
>>> group on Tegra30.
>>>
>>> Nicolin, please let me know if have any suggestions. I may take a closer
>>> look a day later, for now I'll just revert this patch locally. Thanks in
>>> advance.
>>>
>>
>> Actually, this was easy to fix:
>>
>> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
>> index 97eb62f667d2..639d5ceab60b 100644
>> --- a/drivers/iommu/tegra-smmu.c
>> +++ b/drivers/iommu/tegra-smmu.c
>> @@ -853,8 +853,6 @@ static struct iommu_device
>> *tegra_smmu_probe_device(struct device *dev)
>>
>>  			if (err < 0)
>>  				return ERR_PTR(err);
>> -
>> -			break;
> 
> Hmm..I don't understand why this "break" causes problems on Tegra30.
> The older versions that used _find()+configure() had it also, e.g.:
> https://elixir.bootlin.com/linux/v5.9.16/source/drivers/iommu/tegra-smmu.c#L760
> 
> Dmitry, do you have any idea?
> 

The older variant of tegra_smmu_attach_dev() didn't use fwspec [1], that
makes the difference. In other words, the older variant of
tegra_smmu_probe_device() was already buggy, but the bug was masked by
the tegra_smmu_attach_dev() that didn't use the fwspec.

[1]
https://elixir.bootlin.com/linux/v5.10.22/source/drivers/iommu/tegra-smmu.c#L476
