Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1584C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 20:39:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70B6964FCA
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 20:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbhCJUjK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 15:39:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhCJUiu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 15:38:50 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31376C061574;
        Wed, 10 Mar 2021 12:38:50 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id a17so27406677ljq.2;
        Wed, 10 Mar 2021 12:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EpCYjEARt3GihkppJF00n/fHDaWEnMpZu2zSs93LYdM=;
        b=nwAFR6XeM496vQm0sCt75xBjUOLlwUOt/i3Xde+t3Ki5YXd4OyEKMQqPvqBuW2sw+t
         ewZyRmKQ1m3qdGfzDivjdJrmiFaoqc1qHA1AiTVkr6r8THPGKeMxiSzzjizg8NXLpBqU
         cPOA2Wa1VrfauXsrVTZfDX0sZTqoJjQGOchPfrAtEtU406/fp0g6PEqS+8uUoQu3jNx3
         JNwSf4JYum4uYpS9q+FfiUWvr9ST43EA92tDIhs5tQctdbPZTxulLpfAMsFFGzFhpQG4
         mxoObcgCT9W+jzC0zVobk18fXiTRyGOD7dmYLWJMMXFD3vgnDHjlz5/3H91syoBIfaIh
         Wl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EpCYjEARt3GihkppJF00n/fHDaWEnMpZu2zSs93LYdM=;
        b=jEyqaT4u6aYB0IPmBHLqQ5vlZISgkYRLNTzhz606eguLVJ9FvNJdG7BCGqDGPj/doc
         OHhJ5nySYhMu3enxyN+HHwXpUqMqyszXA5Ts9gr7VhlqCMuXmORH+Hv7dGbiYrHYgl1E
         t2zlONHzSyX83Hyj8X7uP/4RhbZ8MKblRJaeZosmpWT3tZ+a0AlNbZwAadww+y1r3yir
         If8piX0PCqr9gKzHDLgPHWCwysFQxRsvFGA2Q9fafwrcOKxH3yiU5vgvAgtcizcJaBx1
         SFgmVuWE9hqdpECfAzxhdd7ZSUp+knAF1iL2et+srES8l0NEM5B0zLIlixDNBg8tJJIu
         V+Ww==
X-Gm-Message-State: AOAM5304cVSk55xK9Fx6O1UfUVxA3GxprwA6fiGv56bJLr4IydlTBqSA
        3Z5256LzjKoCCsVB+a0G7Qc4m/6PKeU=
X-Google-Smtp-Source: ABdhPJy0ZdpO+I0NMxp3L4J/Y0G4vaPRvjMDY2wWTo9ibfWpApN4a/l8R3EKLG71SP+a0L5qWAZu3w==
X-Received: by 2002:a2e:96d5:: with SMTP id d21mr2810226ljj.148.1615408728426;
        Wed, 10 Mar 2021 12:38:48 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id y10sm113357lfl.240.2021.03.10.12.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 12:38:47 -0800 (PST)
Subject: Re: [PATCH v2] iommu/tegra-smmu: Add pagetable mappings to debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        thierry.reding@gmail.com, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210310033614.16772-1-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cc5dca8f-e9b0-a845-1af4-e762782d5441@gmail.com>
Date:   Wed, 10 Mar 2021 23:38:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210310033614.16772-1-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.03.2021 06:36, Nicolin Chen пишет:
> This patch dumps all active mapping entries from pagetable
> to a debugfs directory named "mappings".
> 
> Ataching an example:
> 
> SWGROUP: hc
> ASID: 0
> reg: 0x250
> PTB_ASID: 0xe0080004
> as->pd_dma: 0x80004000
> {
>         [1023] 0xf0080013 (1)
>         {
>                 PTE RANGE       PHYS           IOVA        SIZE        ATTR
>                 #1023 - #1023   0x122e5e000    0xfffff000  0x1000      0x5
>         }
> }
> Total PDE count: 1
> Total PTE count: 1

Addresses are 32bit on ARM32, please fix the formatting. The phys_addr_t
and dma_addr_t have special printk specifiers [1].

[1]
https://www.kernel.org/doc/html/latest/core-api/printk-formats.html?highlight=printk#physical-address-types-phys-addr-t

as->pd_dma: 0xc026e81b0000026c
{
        [0] 0xf0082848 (1024)
        {
                PTE RANGE       PHYS           IOVA        SIZE
ATTR
                #0    - #15     0xc0f9fc40bfde0000 0x0         0x10000
   0x7
                #16   - #47     0xc0f9fc40bfdc0000 0x10000     0x20000
   0x7
                #48   - #111    0xc0f9fc40bfd80000 0x30000     0x40000
   0x7
                #112  - #239    0xc0f9fc40bfd00000 0x70000     0x80000
   0x7
                #240  - #495    0xc0f9fc40bfc00000 0xf0000     0x100000
   0x7
                #496  - #999    0xc0f9fc40bf400000 0x1f0000    0x1f8000
   0x7
                #1000 - #1000   0xc0f9fc40acc40000 0x3e8000    0x1000
   0x7
                #1001 - #1001   0xc0f9fc40bbb95000 0x3e9000    0x1000
   0x7
                #1002 - #1002   0xc0f9fc40bbb97000 0x3ea000    0x1000
   0x7
                #1003 - #1003   0xc0f9fc40bbb91000 0x3eb000    0x1000
   0x7
                #1004 - #1005   0xc0f9fc40bb455000 0x3ec000    0x2000
   0x7
                #1006 - #1006   0xc0f9fc40bee9c000 0x3ee000    0x1000
   0x7
                #1007 - #1007   0xc0f9fc40bed20000 0x3ef000    0x1000
   0x7
                #1008 - #1008   0xc0f9fc40bbde0000 0x3f0000    0x1000
   0x7
                #1009 - #1009   0xc0f9fc40be465000 0x3f1000    0x1000
   0x7
                #1010 - #1010   0xc0f9fc40bb505000 0x3f2000    0x1000
   0x7
                #1011 - #1011   0xc0f9fc40bdcb9000 0x3f3000    0x1000
   0x7
                #1012 - #1012   0xc0f9fc40bcdf9000 0x3f4000    0x1000
   0x7
                #1013 - #1013   0xc0f9fc40bb6ce000 0x3f5000    0x1000
   0x7
                #1014 - #1014   0xc0f9fc40bcd74000 0x3f6000    0x1000
   0x7
                #1015 - #1015   0xc0f9fc40bd0d0000 0x3f7000    0x1000
   0x7
                #1016 - #1016   0xc0f9fc40bb6c5000 0x3f8000    0x1000
   0x7
                #1017 - #1017   0xc0f9fc40bd121000 0x3f9000    0x1000
   0x7
                #1018 - #1018   0xc0f9fc40bb6df000 0x3fa000    0x1000
   0x7
                #1019 - #1020   0xc0f9fc40bb6e9000 0x3fb000    0x2000
   0x7
                #1021 - #1021   0xc0f9fc40bb713000 0x3fd000    0x1000
   0x7
                #1022 - #1022   0xc0f9fc40bb738000 0x3fe000    0x1000
   0x7
                #1023 - #1023   0xc0f9fc40be444000 0x3ff000    0x1000
   0x7
        }
