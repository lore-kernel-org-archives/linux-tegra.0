Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B905C433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Apr 2021 12:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA949613FF
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Apr 2021 12:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234147AbhD2Mo3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Apr 2021 08:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233731AbhD2Mo3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Apr 2021 08:44:29 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D259CC06138B;
        Thu, 29 Apr 2021 05:43:42 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id n138so104745025lfa.3;
        Thu, 29 Apr 2021 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PVk9gFFvxbCFJvq/YZ1h5eGtLwfb3YoRJmsi5P9iLGQ=;
        b=V30khvUcy3G7kkRwcPcty+E0gg+up+FNSU+ErmcG5jIB+OgEjb0Xg9xSRVbJOsTfaH
         roMqHqnATraO5DGjYsiUiuScVtAxsEaHPLkNH+Y5vqzFD1GZqPWF+PH6u0TnXAGuIJzT
         608dkIX/0f6dE0jUjTTBonZS2ZVnRuOH0r8Ua+41fW0jmlo1H9zg8VnrjMHwjSlCEe2X
         tYitcBqCEdNuy9KPrBjDBeQ8mNk6lNsIXC697ntk/4UgikkNMHij9hXZvWT6zgjDsKr4
         SINUR9ntBh5EKeSy/yuIP29l7OMmAeXkBcGoHyUjU2h1ewNXNMwfkaY7Nn5lP65cfv94
         MteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PVk9gFFvxbCFJvq/YZ1h5eGtLwfb3YoRJmsi5P9iLGQ=;
        b=dYdMI1cObYPQGbjrpLpg9R0SriHX/C2Yct78LnYDUiyoMr+zPMHQxKvT2okBCoxQgS
         Q06FjDj+PK3vJ90NcbDyjWIq3cH49l5fuHenLjZjL0jhmKZjy08n0eNoRJmp99+VrHPo
         Li+DX8d5PFSM4UhWAbeO6JWbNiWudk+/VwNTrRccS1vRD1mlBXu9f32005iYWTR6Y5FR
         nvW05alS6nLxV9tEUbDMmRsRn1HeI4AjVtx5QhfAYOQE8wqE/sZbi1pzhkg7XUB7aKnf
         bXlt/3E8oXQxylkueFgHpp+UatPS4GvIHnSuJT490a6SxNHr+8RLcL7a+P47MuIGYVbO
         HsDQ==
X-Gm-Message-State: AOAM533ZcnxevzpcmfVZkGZnUL3f/xoVrV6oF6NzYp1OUevfHLiX3Txz
        p7CT+ITfmaExm/5PyVzZYx3K31/nDzo=
X-Google-Smtp-Source: ABdhPJzTUmASQ+X8zCC4YvyqwA/DDAdCGKp2SuYQuR5grWh5yLV0nDvs/9BMEEM1CAb0LKenZPmotQ==
X-Received: by 2002:a05:6512:108c:: with SMTP id j12mr12271573lfg.403.1619700221262;
        Thu, 29 Apr 2021 05:43:41 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru. [109.252.193.102])
        by smtp.googlemail.com with ESMTPSA id a26sm517283ljk.55.2021.04.29.05.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 05:43:40 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] iommu: Support identity mappings of
 reserved-memory regions
To:     Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <869ec3a2-26df-2ce8-bd21-b681d6ef3985@gmail.com>
 <BY5PR12MB3764DFDEA8125650799DC76CB3419@BY5PR12MB3764.namprd12.prod.outlook.com>
 <bbcf6dbe-367b-38b2-91bf-9d5f4cd2c57c@gmail.com>
 <BY5PR12MB3764DC583BC2AFE0CA674DDFB35F9@BY5PR12MB3764.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea07db7b-e932-8d7d-0240-625b6e5aa765@gmail.com>
Date:   Thu, 29 Apr 2021 15:43:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BY5PR12MB3764DC583BC2AFE0CA674DDFB35F9@BY5PR12MB3764.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.04.2021 08:51, Krishna Reddy пишет:
> Hi Dmitry,
> 
>> Thank you for the answer. Could you please give more information about:
>> 1) Are you on software or hardware team, or both?
> 
> I am in the software team and has contributed to initial Tegra SMMU driver in the downstream along with earlier team member Hiroshi Doyu.
> 
>> 2) Is SMMU a third party IP or developed in-house?
> 
> Tegra SMMU is developed in-house. 
> 
>> 3) Do you have a direct access to HDL sources? Are you 100% sure that
>> hardware does what you say?
> 
> It was discussed with Hardware team before and again today as well.
> Enabling ASID for display engine while it continues to access the buffer memory is a safe operation.
> As per HW team, The only side-effect that can happen is additional latency to transaction as SMMU caches get warmed up.
> 
>> 4) What happens when CPU writes to ASID register? Does SMMU state machine
>> latch ASID status (making it visible) only at a single "safe" point?
> 
> MC makes a decision on routing transaction through either SMMU page tables or bypassing based on the ASID register value.  It
> checks the ASID register only once per transaction in the pipeline.

Thank you very much for the clarification.
