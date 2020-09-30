Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329B1C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6F4D206F7
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:10:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+eIUnDi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgI3FKL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgI3FKL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:10:11 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76F8C061755;
        Tue, 29 Sep 2020 22:10:10 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v23so466814ljd.1;
        Tue, 29 Sep 2020 22:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+bNH00/3TyfIl7ZmwUbB3/9mSNJL/xs6urc84WGD8GQ=;
        b=G+eIUnDiiFVQqLzVvhzNbtgRd8FBnc+NxeAyEMeLgwyr3gEs/cYEv5/Nr4xHPbeaUH
         R2+9LBdcKv2hwfzKBaeocX1H/DCOXwH0lkIuZmUaPBobHONWj+WEyV0rQY6xvHXpjc68
         Ky0zPRMmYSYRLlw2zXvJbBZjPZdsNWpR8JpeCA2nHzvcChEqV1+BkZI2Dlv3a+3zrekF
         IqBaxtYCYmnwgy84Fy55K72QFMB7DfqVQku9auLfwv2G76FMU/YnbASLCbOEo0cO5ctS
         o4JkTfi2qCiqyHsk2HInQR4mbI2fYRfE0oYBkrJKIM4QWl/jld/n9JgQhf/EVBttuPJK
         6Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+bNH00/3TyfIl7ZmwUbB3/9mSNJL/xs6urc84WGD8GQ=;
        b=YH2WNQ2moD6eNTQvDMIgfL1J4FRgbFoib2M2qY67kKsJUrXSUjedYFCUSNpi5DOdLz
         ziMf9GYep/9f4snoGtZwLvWj8bpwBYQMOrieKgj1sXCKYsXVAIySCHcp5OgjLwE/CnsZ
         b0SFTt0RUMAr9d24vLa+Yxe+zKH8imCnbGzEwk02iDSJO4uKAe9NoSEpmEluwHKuYBL1
         j8MS9pibecZgnDEST7A5YxVYZ6FnrSsrfWJ/IaD66laPCZES81fdhlaT9SZdtVQpcUJS
         +EjjWX7iGOtXrrDn0S2wlSskMXu/Wbk22Bz3HT3QqCrDtjWWFgRnZaWNH08iGMpNM9Mz
         TEYQ==
X-Gm-Message-State: AOAM532KVZ4O32mpvANENUkd/S6jhg6+2WfvEW5AIRuUui3/BLrRe0A2
        NBcTBJSlwSx/ZJ/RhMwMqBAWC22WCVQ=
X-Google-Smtp-Source: ABdhPJyBeiHR9Qc67e7ldwWWy0bPbLVPgS64Y2llKuUrtKUpPvGasO3B2VdR5oOOslPZQ9jKVsvWlw==
X-Received: by 2002:a2e:3304:: with SMTP id d4mr292406ljc.440.1601442609011;
        Tue, 29 Sep 2020 22:10:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id x73sm54949lfa.94.2020.09.29.22.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 22:10:08 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f07d4fcc-ee19-874b-c542-0679660c3549@gmail.com>
Date:   Wed, 30 Sep 2020 08:10:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930003013.31289-4-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 03:30, Nicolin Chen пишет:
> -	group->group = iommu_group_alloc();
> +	group->group = pci ? pci_device_group(dev) : iommu_group_alloc();

This will be nicer to write as:

if (dev_is_pci(dev))
    group->group = pci_device_group(dev);
else
    group->group = generic_device_group(dev);
