Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FDAC41604
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:28:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 655DB206F8
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKVgE5e4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgJCO2A (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 10:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgJCO2A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 10:28:00 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9026CC0613D0;
        Sat,  3 Oct 2020 07:27:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b12so5464395lfp.9;
        Sat, 03 Oct 2020 07:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WcsBuP3zP0tyQaN/LT3trjYTTJjbx6YMciPdXNhaCSc=;
        b=nKVgE5e4W8YLfy5meKUdYu8j+1C+p3kRksSQLxOvu8bVkiWnH9Il35e69GQp7tia9o
         Xg8d5NR8T3ymDHMQzK43jBXe+T+tOBtNKVo7Jp+dgR0804GaXwEBntkEhcxC0BHV50dl
         g/H7yiPT8KWadrr+2KvR+MJQLuTXdbi/7LD7nIa4FVxxY6pQwln0sECcnQPwT9DMtlJh
         3oZJ2mMY2y3yN5xjBGxxUXXJrc2STKAYNSOSDOyWFeh7KJDVNTHwC1xQICyAHY/iuK+P
         cVg4EYC9ZASmiGfde4HUYunWpmkIUazxQjRqf9ZciYCBbCnmvT+3JELvTNqgKSQpyN89
         P3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WcsBuP3zP0tyQaN/LT3trjYTTJjbx6YMciPdXNhaCSc=;
        b=U9R5wwpDIVEHKbThfEhwoFL5tV+nbweFLjhOQrcPEmIOyy+W5/HcSGYPhSFPMG1l2N
         JfhPFzQVHIjSNov72c1jSUQBL/oP1H16cxDJepJMNWAvnYlJO2q0sC8yZlTu5Y43FDVT
         zLbLM3EgmhVag/dbc+MoRCUcsZdhvq3MppLUtzVGa6nZd3KSZaF9SP+u+hB+cYM1Rgcu
         9SD4n4tT8F2KghCGHBLZa7xwdsHf6tQQsM2oWRKimm7G9tDAELEi10rmqtBvBoXUs4bS
         LqUtwIOlfircud2CDAGozjv+6Wf6Ra7rWHyPlWnQuKWB2b+C5fOqJ01/1gGWlU0Hiqb0
         yvag==
X-Gm-Message-State: AOAM530V5uMPjsqETZfctada8ZTh/jAQxeYfOgO8BjY3SDFAknjIWFaO
        D5pnvgn+xf50k4RCKWkJNP0=
X-Google-Smtp-Source: ABdhPJzNCwTkVXy5Gvj9nlcWlPzP08lu7UGmjgsHq9zxLPPHQ2Uyqy1897ulAmyitOucaozbgNvuBA==
X-Received: by 2002:ac2:443a:: with SMTP id w26mr674369lfl.435.1601735277910;
        Sat, 03 Oct 2020 07:27:57 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id p21sm1586032lfo.194.2020.10.03.07.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 07:27:57 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, hch@infradead.org
References: <20200929061325.10197-1-nicoleotsuka@gmail.com>
 <20200929061325.10197-2-nicoleotsuka@gmail.com>
 <35d789ae-7deb-7f8c-0556-98fe73f5999f@gmail.com>
Message-ID: <0cc12c08-e2f2-b915-e7b4-8e2e94ea2ac4@gmail.com>
Date:   Sat, 3 Oct 2020 17:27:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <35d789ae-7deb-7f8c-0556-98fe73f5999f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.09.2020 20:41, Dmitry Osipenko пишет:
> 29.09.2020 09:13, Nicolin Chen пишет:
>> The tegra_smmu_group_get was added to group devices in different
>> SWGROUPs and it'd return a NULL group pointer upon a mismatch at
>> tegra_smmu_find_group(), so for most of clients/devices, it very
>> likely would mismatch and need a fallback generic_device_group().
>>
>> But now tegra_smmu_group_get handles devices in same SWGROUP too,
>> which means that it would allocate a group for every new SWGROUP
>> or would directly return an existing one upon matching a SWGROUP,
>> i.e. any device will go through this function.
>>
>> So possibility of having a NULL group pointer in device_group()
>> is upon failure of either devm_kzalloc() or iommu_group_alloc().
>> In either case, calling generic_device_group() no longer makes a
>> sense. Especially for devm_kzalloc() failing case, it'd cause a
>> problem if it fails at devm_kzalloc() yet succeeds at a fallback
>> generic_device_group(), because it does not create a group->list
>> for other devices to match.
>>
>> This patch simply unwraps the function to clean it up.
>>
>> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
>> ---
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 

Tested-by: Dmitry Osipenko <digetx@gmail.com>
