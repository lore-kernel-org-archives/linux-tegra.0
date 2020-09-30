Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDBBC2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:20:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8348A20659
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv9Fa3zq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgI3FUx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI3FUx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:20:53 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB16C061755;
        Tue, 29 Sep 2020 22:20:53 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so590754lfr.4;
        Tue, 29 Sep 2020 22:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/vquZx1A3iluTEUeE59wLilR4MqylWrQ+TBuI0tvfkQ=;
        b=Zv9Fa3zqpk+N0YQ0z9cb0GU+O+b/3HX7q7p7JtJBxw88h1Z3Gh9kNKxU89jNs6Xcwr
         f2hxCnYi8ucVK3VjDxwohagnbSNv2epSHbt3iBVw1nzW/ECu/iUzvD48cF+lG+hz3Fw/
         clukDexDUQNteNUcfXzOFMMtMqxioHuHrXFOlX0+a4FQmn4XV6dVYewKQoPnDAyMayiX
         l00YvljfkiEN5cSh9xyJ0BvbsI4bgc055dCh6xktc1FdXif9hvs1+1rbKPmSHhQBv/yv
         ij4Rb1FibJVjyU4TVML21msMmuKjim+Fedhe/qdDTFbIdt1goIJVysyQZhQCdLdCbFTi
         /pNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/vquZx1A3iluTEUeE59wLilR4MqylWrQ+TBuI0tvfkQ=;
        b=KeOQbSFYOvCyafsNOi6DXadCkwwQkfn17biI/JY0+DIrmPaYCHQO1FHcuGXdi5l3iX
         pMmDiT4ERFtLnFl88MKEpiZPOLKA/VKiMgy+jfcghcS0JlggP/bbgDfVpoJU771bAZep
         GlKfBsCWMI6isS2Zjb0j5bnTELt8kfGvEXT0R+kRnSB5Bn43/1yKhPnX8/+37yunBmGe
         mKH9XxHiGmucjP6PM2vpzRwMMRFx9U8whRjFZ9wT2X7EBFfd1/FXbPXLIgeG+6R7p9lF
         EMJj4BIhXZ6MeR2n6gob66xJ0lxLB+Xp8pPP+b96VVwazQIHQQ98Bn4HZr6SEq2WRrRM
         bcIg==
X-Gm-Message-State: AOAM530p3cabkfc5JaNwkqHrD6aWuHcE7oSWNzIlLXT3fsI4UI4syuKp
        KkA+5AsB/+gOhQqqBd3AazfuwLwDO/0=
X-Google-Smtp-Source: ABdhPJz82QlO70fJl2vNtlSBQ8vbMM7nm+VNivgOHxtah8c167tZ1uRj7xH7oN+Usj5eoVq0Yd2Msw==
X-Received: by 2002:a19:3c8:: with SMTP id 191mr227547lfd.549.1601443251483;
        Tue, 29 Sep 2020 22:20:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id e14sm50128ljp.15.2020.09.29.22.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 22:20:50 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <db183fdf-d566-599a-94ff-cfab0e08aa7a@gmail.com>
Message-ID: <931eb16b-4529-2c20-c696-c57a9138aded@gmail.com>
Date:   Wed, 30 Sep 2020 08:20:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <db183fdf-d566-599a-94ff-cfab0e08aa7a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 08:10, Dmitry Osipenko пишет:
> 30.09.2020 03:30, Nicolin Chen пишет:
>>  static void tegra_smmu_release_device(struct device *dev)
> 
> The tegra_get_memory_controller() uses of_find_device_by_node(), hence
> tegra_smmu_release_device() should put_device(mc) in order to balance
> back the refcounting.
> 

Actually, the put_device(mc) should be right after
tegra_get_memory_controller() in tegra_smmu_probe_device() because SMMU
is a part of MC, hence MC can't just go away.
