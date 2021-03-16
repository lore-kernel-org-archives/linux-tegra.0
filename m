Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FDEC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 23:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48AF064F90
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 23:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhCPXnY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 19:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhCPXnD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 19:43:03 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71DDEC06174A;
        Tue, 16 Mar 2021 16:43:03 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id f26so925569ljp.8;
        Tue, 16 Mar 2021 16:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jYFeGyHV2zNDVLbB4/9V9Cq/DhTaZRm/v1+BiD8VFOw=;
        b=pNUpWJquTOQ7GETDBARhVTlBvYZv2Ugf0ssuCBNJrHVNUldN7HWfC9c3HLEKrZqUp7
         3WqcHiK53HI/HzDw+ttHJIqIsBGt/9JoRFsni32AWrM1diyNRlPOs8DDgk9EhFi2aOB7
         2IT6ivIlQ6RGScxniU6NBKnLIKHAyJkFfT3ltQ0OFA3SiOvd7s46m52XmeHEZHxVOeTc
         uev4xIbU7Ajc9lLWY2li5KX9bB4q49TxEU1KbPcIYeI8DskKwoN+ti1IZGGndq+lsAVZ
         LUU0NQ89catzxMdN+QYiyKt30a2USwIHp2RpeEA/Njr5EdSDXTmIPgnfPQlcsLkUHHMX
         ZxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jYFeGyHV2zNDVLbB4/9V9Cq/DhTaZRm/v1+BiD8VFOw=;
        b=YJJAz71WiIQ3wlk/paXgPt2/gU7ire7UF6xX3vkJVTEGSbs5EQzv7GyeuRi4jjDL1y
         i2z8grdVUF/kq63TtluV/q1SvjbQQ9uOl18Yb0ZC486s/JJ7eAoiBuaxHTOjBsUtgmnQ
         Si8u3u6dpa6C2Z4NjtokuIKdMYqxNiTUCa6YraiF7iUUqIeAnypgsnUvVu2AOlIKL3af
         lrpS9+AaYhb6DZEqHasTAijn0v1uQayKRWHZfzAKjwTsJ1pCVNaZcoDAMOxLabtsuJ4T
         sI0WXm1gH9Qu/xSIJU6tDUVon0x0PedC/+6eYJz8ZTB67u1uVPHZJwzt+Yy0yhcfdJUc
         iNgw==
X-Gm-Message-State: AOAM531DGQZfXIzLE7YIDc6DChI6IJvLW3fPHcvVaQQ6pbzySZs17whk
        B9ruQPUfEB2KkeeYmD9K7cUUkTnRjMY=
X-Google-Smtp-Source: ABdhPJyTPkrSBR9a2SBJrGXgEoF451Mw3ymhO/O7kZzEk4Swq8DINxPlGHhlhFvHwvHa1KMSWekwCw==
X-Received: by 2002:a2e:b6c6:: with SMTP id m6mr640889ljo.411.1615938181757;
        Tue, 16 Mar 2021 16:43:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id k1sm3207658lfe.208.2021.03.16.16.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 16:43:01 -0700 (PDT)
Subject: Re: [PATCH v5] iommu/tegra-smmu: Add pagetable mappings to debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        thierry.reding@gmail.com, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210315203631.24990-1-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <acad1a15-b4ad-e74e-647e-d50d15d8d3d1@gmail.com>
Date:   Wed, 17 Mar 2021 02:43:00 +0300
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
> +static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
> +{
> +	struct tegra_smmu_group_debug *group_debug = s->private;
> +	const struct tegra_smmu_swgroup *group;
> +	struct tegra_smmu_as *as;
> +	struct tegra_smmu *smmu;
> +	unsigned int pd_index;
> +	unsigned int pt_index;
> +	unsigned long flags;
> +	u64 pte_count = 0;
> +	u32 pde_count = 0;
> +	u32 val, ptb_reg;
> +	u32 *pd;
> +
> +	if (!group_debug || !group_debug->priv || !group_debug->group)
> +		return 0;

I'm also now curious how difficult would be to read out the actual h/w
state, i.e. check whether ASID is enabled and then dynamically map the
pointed pages instead of using pages allocated by driver. This will show
us the real h/w state. For example this may show mappings left after
bootloader or after reboot/kexec, which could be handy to see.
