Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA979C433DB
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:08:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7092864EB7
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhCNPIK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhCNPID (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:08:03 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D4CC061574;
        Sun, 14 Mar 2021 08:08:03 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id r20so13236309ljk.4;
        Sun, 14 Mar 2021 08:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YjwVPGG1TuIQpkOeAPKMAg0iJbl4yQQEvHJkwwGm/zs=;
        b=oOUoZZ/Ftj5AKYuSEuFtvp2R7V9haC6Q6AApMAJ7kT+Ka0WnH+RHT4XBENNPkQACfC
         jQWfSyfSROMGt0hqgDIDlBASdgjvXkJi6xtcn81/7+11aF19fAwsBgWdXFDKC4T+hHW1
         +HLuYw3AG+38L61qb1gvUNT/dInOrD36+oBeIizrJU66Iw2wwJEapodKxmK0vxjAR7yj
         VcD6k1Pgp+Qurp96EWEsZwa269R5Mb4XJ27GYPC4Ix9RVcVXpzRUBTAKN/CbQYfzBLiT
         57w9L51cbBifCKcaVGqxmbFiT8P9wY1ns+UY9y7ZVlKu+iWmnAg59M3MECIfCiTJrZd4
         ndsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YjwVPGG1TuIQpkOeAPKMAg0iJbl4yQQEvHJkwwGm/zs=;
        b=RLI4nEr7TNV+9lIJzFw5LxGA4tZAyZ03Jh5CfXrX/kIQwjTvzNX4UnQmdTHSk2B8oH
         liNwrqTTZ6/MseE9RvW3n4tyje2h0IG4ki8tDdmgIjnxrao0Lm6PM+zqv7wOkMV/m/TO
         tHAHPQbc5kuFLhJpn3aTrnNG9C4yANq7ROp1UtQjfdJ5ZAsd/uhkvQ23gIB/UpIImUyw
         hqLxYnNIX+nG9/n8/f3/x9JqVUrCQK2pSMbHvvEIe6bSCr+0e2bHO+9J/M66BW/3J4bh
         fnupLN+gOIX2z4WT6E+u/gkvitJdPkCBwLKj8lEZ+1O4WXm8CJT1/rznlvYGiNbByC8i
         ZYrQ==
X-Gm-Message-State: AOAM530UdJM+bO4xMoswa97QdqqdH7Cyfq/dvPONdDYX16OOYYX78ZT8
        39GsB3YPxgzxY53tBdSPrTROvyD/D9o=
X-Google-Smtp-Source: ABdhPJzKmUYhZwRbEOYZqjIAuBLd/RAfVxfAYGihj1XoiEQDNo3KThVc2Ppt+njIF0Wld4sCJNcszQ==
X-Received: by 2002:a2e:9bcd:: with SMTP id w13mr8003309ljj.43.1615734481520;
        Sun, 14 Mar 2021 08:08:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id m20sm2635562ljj.93.2021.03.14.08.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 08:08:01 -0700 (PDT)
Subject: Re: [PATCH v3] iommu/tegra-smmu: Add pagetable mappings to debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        thierry.reding@gmail.com, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210314080653.29374-1-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e1d3eef7-3d7e-b26d-79d2-f87969ac11f8@gmail.com>
Date:   Sun, 14 Mar 2021 18:08:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210314080653.29374-1-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.03.2021 11:06, Nicolin Chen пишет:
> +	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
> +		struct page *pt_page;
> +		u32 *addr;
> +		int i;

unsigned int

and then printf specifiers also should be %u
