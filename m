Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18368C41604
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8CC020709
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 14:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HK/+xpsb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgJCOOi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 10:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgJCOOi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 10:14:38 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2807CC0613D0;
        Sat,  3 Oct 2020 07:14:36 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l13so491370ljg.10;
        Sat, 03 Oct 2020 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tst9irh6GksvKPw8ga3l4/uVVfdGZqpV7pFfQRzp6+Q=;
        b=HK/+xpsbVETdOQjnTAAmtpWFdXmvr8V2jLEQ0Lo39HgkGbLBTh4Q2SqjFF/QxchbkL
         OLx/PGygV73+elkbNW5MAoSqHjMsP24RY4hSMaUnO1l7PTAE1W3ar3ZSApzU3DBKOzk2
         CWEJINOe5JSmjCBo4QWCOoB1wgaqWWiJAPjf8hCfzk6DPBX4fSQiRniTjYsI3vemtQPN
         p+tbvA7bSCYTYYAeZ3HrC51PEKEe1zsISoWQItHVA1ShX4mbdkDeOUch7yTrXGFQdM/d
         EZXweyqd85+KU8EWWe6X3KTof7iNaRINTxngzxF3/MrF/d2eVYksE641DT2QaU/tLz/Y
         iX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tst9irh6GksvKPw8ga3l4/uVVfdGZqpV7pFfQRzp6+Q=;
        b=M4pnnYDTX7xS7rF7xqqIzP6zlH5K/lKYE84hD+4ECNnx8bjDmLesNg0MYc7XolPmCX
         SKMCnjsaXM6BUzeqGT8d/tnL+9Ca8JzuyUSScReTlBADrR3c+Ckr67HL1I5G5A1L9CAy
         wmrAQiXXKU33nQy1xiqHJWZ9TXvvgoe7CvFEqNGVF5e6IGJoG0cpl2SGtBEjMJqP9WPP
         7qNlxGnl5CmKj0ufbz1ecb9+NL8Xfys7Kui+7O6ewX9v8uU8alAicWRrOrm9ai3siazx
         Dnbj3cdHoFAyLma7wHY3LvOwAu81rRDWyf568xiqS7EUhZykniTqoBq1FJcG3GuMfZ56
         Vm4w==
X-Gm-Message-State: AOAM530flU0gR7jcglh8FuSSM7jp9Rt3L9ypnniw+eL5Q6+kS+t+5dW4
        MrqSWyOICBiwbGhkQOeMNvL0wcghpEY=
X-Google-Smtp-Source: ABdhPJwQeKuHbETMb2aLQTvU1IDeyzqnysdODtX4b9+61V2w1lWG8caqy/R/zMrMjJgZ6/VsW8wPkA==
X-Received: by 2002:a05:651c:1073:: with SMTP id y19mr2080980ljm.57.1601734474241;
        Sat, 03 Oct 2020 07:14:34 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id o15sm1530649lfo.188.2020.10.03.07.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 07:14:33 -0700 (PDT)
Subject: Re: [PATCH v5 1/3] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-2-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <620c9f83-94e8-10c1-67f7-77e57929f46e@gmail.com>
Date:   Sat, 3 Oct 2020 17:14:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201003065947.18671-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.10.2020 09:59, Nicolin Chen пишет:
> In tegra_smmu_(de)attach_dev() functions, we poll DTB for each
> client's iommus property to get swgroup ID in order to prepare
> "as" and enable smmu. Actually tegra_smmu_configure() prepared
> an fwspec for each client, and added to the fwspec all swgroup
> IDs of client DT node in DTB.
> 
> So this patch uses fwspec in tegra_smmu_(de)attach_dev() so as
> to replace the redundant DT polling code.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---

I'm still not highly impressed by seeing the !fwspec check in this
patch. But I'm not a maintainer of the SMMU driver, hence will leave it
up to Thierry and Joerg to decide whether this is good or needs to be
improved.

Otherwise this patch is good to me, thanks. I tested it on Nexus 7,
which is Tegra30.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
