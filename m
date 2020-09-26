Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BF0C2D0A8
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 21:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92E1A23719
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 21:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vNHTmFzg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgIZViA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 17:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgIZVh7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 17:37:59 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5BCC0613CE;
        Sat, 26 Sep 2020 14:37:59 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m5so6752704lfp.7;
        Sat, 26 Sep 2020 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2O1+q9UmEqA1AfayXwYwEqLOHYTG6dlJa8oak1VIgDg=;
        b=vNHTmFzgH8QnV/FBqlopnm5inoooP9qzVr2IXPxHTgDN2tFGmDFkEMh8hkm1NtKQOx
         qjDI8CZtUreR7RPIXjRH1T7UP+9fsnb2Vt/8WhMl6tDdqjNyHSGOMzSa6nDrznC2v0Qe
         gP6WEJiH3n5APBzpziMK14F1ORCoymwCQCjQZRAMXnYerm9NkGLPFm1Ay5j+nFlRWMdB
         6jtXfs4M3a8b4A7MsnX9zKTzuLsMnPsRvuLaG4YLztx+Tuhqkezwv6Db3trx+pykpnOL
         VdO1c4AfB+EHg5KFGd3RawjL6uYlce1C52KkS7v+8n7mFGrlKSyl+ebVSyUhjB3jSjVJ
         /vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2O1+q9UmEqA1AfayXwYwEqLOHYTG6dlJa8oak1VIgDg=;
        b=WTiNKKT51Y9XVGLdp74X9pnREPtkuXMPMylp0vX5DQgoOPKs+i+yQA2oUeNMzfyDYi
         zQ0XTCe7EWRx0z0yiQw9PhSFlJ+tKdXAd3x0n55g7fbyhMpgMNrwlJUNEfisGcWKeZ4G
         zUKCfKMVnOBUJKydqzXJI39ZMtlziYu3gyMPEOBBOienCBqceC6CK/Z2+fu6VP9CKKEE
         ytVcJZLaOj+dcy7CvIkxzpWyIm93Knw2vcIs2MgVVcT7RovFvJpHUNkrnG6vqExwoH0U
         zYP157GkMgU7KuBJyfy6NIvKSt4GyAe/gHZhijUMck0GR0Yh9d+8NmDSaoZZJLF7FQZn
         0sHg==
X-Gm-Message-State: AOAM531Ht2zZ6xwAsrw6AzN4l2ENyf1OZfihTnhppwNcBDviaXUUmQ0W
        j/XxBzncqPI+qLAhebF/8OE=
X-Google-Smtp-Source: ABdhPJwRrZKVmTy09whw7BIXlDF16kk6a09TKGUIpAzZpY2JnQIP3AhMgrN+BYta2GoMOzzDhdgeQA==
X-Received: by 2002:ac2:5e2e:: with SMTP id o14mr1630604lfg.163.1601156277884;
        Sat, 26 Sep 2020 14:37:57 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id a27sm5424327ljp.7.2020.09.26.14.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 14:37:57 -0700 (PDT)
Subject: Re: [PATCH 5/5] iommu/tegra-smmu: Add pagetable mappings to debugfs
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-6-nicoleotsuka@gmail.com>
 <0451e362-30eb-2ba2-33f1-e9ab3972cada@gmail.com>
Message-ID: <a321fc27-54ba-9ba5-7121-4598a7f94795@gmail.com>
Date:   Sun, 27 Sep 2020 00:37:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0451e362-30eb-2ba2-33f1-e9ab3972cada@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

27.09.2020 00:24, Dmitry Osipenko пишет:
> 26.09.2020 11:07, Nicolin Chen пишет:
> ...
>> +	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
>> +		struct page *pt;
>> +		u32 *addr;
>> +
>> +		if (!as->count[pd_index] || !pd[pd_index])
>> +			continue;
> 
> I guess the idea of this patch is to print out the hardware state, isn't
> it? Hence the as->count shouldn't be checked here.

Perhaps also will be good to check whether the state of
!as->count[pd_index] matches state of !pd[pd_index].

WARN_ON_ONCE(!as->count[pd_index] ^ !pd[pd_index])
