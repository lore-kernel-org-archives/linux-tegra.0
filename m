Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A505DC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 23:34:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7004E64EFD
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 23:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhCPXeO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 19:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhCPXdp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 19:33:45 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A403C06174A;
        Tue, 16 Mar 2021 16:33:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u4so209900lfs.0;
        Tue, 16 Mar 2021 16:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oaA9aMSbFmvtLvb2TvRiLzy5d0VE78dtkAU/7hwZdZE=;
        b=DL3J3Sn0vCyNg6eH5/0Dv4LknSut5bq7vbVeMZq59Uk2TYiGHaJY7Ys+dKqEtErXrj
         3QyMiBAdf37NjnOlgxoy2p/sUeYmI30APuT08xhSVOM7kbpMT9lCUfOdKAMrpT+bSHSY
         m12YV9AxKyBZTJ7ZfHLXvnjv/Ty5IMmYdo510SqS2ODsN7tQQ2ep2sdNUk9kI4jRv+CW
         GsuZ4y1tJrXl/Q0zSAUV98V2ZqEsCq9/t2p6HXGrpl5av4rlGG8hH35CatGmn0mrvLyS
         Jgv3BPZ3OAxP7swnT1QqGkD0nXOD6Ewuf16GndpMwK1D2/LSfkReySpVaRjpCTUiIFGo
         8Meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oaA9aMSbFmvtLvb2TvRiLzy5d0VE78dtkAU/7hwZdZE=;
        b=et1fTkWlnZK3qwDFMcG5j9qA/MFCuzMqdbXg0m9vE77q07DOJJmShi6kXJzjFtovvC
         Q0FUECtPaULaIJa+zs2f6PZ3UYMfg8J9ij2Zw8bjaqlhFTuFrGgl7URvN//hSaBQcC1Z
         OHtX7AHig4dHx1+elKqlLY7J2X6Zd2rKhZXRktq5GVhideisQM1obvhXo1sIuhTo1IsT
         SxkAnr8rWvrrnOZ0/jKdKld66ne5+sVGTwdQFL2EJbenAuaZYThKW4twH8Tn61dnEUr6
         3t1IZ6NZB5LScjPV9NiuiL/vegULCw128BuSsV6aNBFdXIQonUEhA1wpXHoFmilxsuY9
         E9lg==
X-Gm-Message-State: AOAM5324ogV7sirXmWXwrk+pqaAvOObkcrkRzLtAOcL0tYHc2Pm7UxS5
        u4Dqs/AIqa7nYRapy0JQNOiOrgHJNXg=
X-Google-Smtp-Source: ABdhPJzvYBL68SGctS5ttbA+a6ftGWGtijNx5S78m8tgSBk/V8Ex98dn8GUgmTKHaNuU45wX8YyjvA==
X-Received: by 2002:ac2:47e5:: with SMTP id b5mr640818lfp.476.1615937622918;
        Tue, 16 Mar 2021 16:33:42 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id m19sm828337ljb.10.2021.03.16.16.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 16:33:42 -0700 (PDT)
Subject: Re: [PATCH v5] iommu/tegra-smmu: Add pagetable mappings to debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        thierry.reding@gmail.com, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210315203631.24990-1-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <432fa6a4-23d3-7572-276b-0ee31ff22762@gmail.com>
Date:   Wed, 17 Mar 2021 02:33:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315203631.24990-1-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.03.2021 23:36, Nicolin Chen пишет:
> +static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned int pt_index)
> +{
> +	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
> +	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
> +}

Looking at this again, I'm now wondering whether will be better to
replace dma_addr_t with u32 everywhere since SMMU only supports 32bits
for IOVA.
