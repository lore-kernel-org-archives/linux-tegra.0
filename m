Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15246C433ED
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Apr 2021 05:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2EC560E0B
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Apr 2021 05:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhD1FpF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Apr 2021 01:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhD1FpE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Apr 2021 01:45:04 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEC4C061574;
        Tue, 27 Apr 2021 22:44:20 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id o16so70849525ljp.3;
        Tue, 27 Apr 2021 22:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1k7FKuylro/MdHin/s1GOW9Q+rY4jUOQaUICOuYPze4=;
        b=cr1aEr2reV8+TrtPnP9Mnhg4n8ByFHpjf9dDcRkPwXhXtZdSWbJzDiax12pxODYJOg
         uyCYmBEueEg9jMtueYcf9bPsQajAst/8aLx2DSEYzaxCtwyDnkgb7t5KOAqHwJy4bQT3
         gFh+lBrp9wqW0aw3SDvRrRzEH/GPk0Oqtt7Hdhv1TDZ85RfHLO/BKrbica1ZRaVmoIrj
         fvw6kvo31LJa+FeT4OLm0//w8Ya3Uxxbgi1q4h0RYTn1VNlW7bnYsrSwA0C0PM0EKeyr
         j79Wm1q7orQo0B1ocb9GSZ4LzE3JFU8xQ8YgQ3vG7zGAmO1Np8JjOzoa84QBo9X9V4AX
         S41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1k7FKuylro/MdHin/s1GOW9Q+rY4jUOQaUICOuYPze4=;
        b=sRg7RH3RKCB+Su9IdgHv+1oNuHq2DdBh0S0ZiDO1JQVRQVZC1oj8fLtWKHikWA8Azw
         mspVnHpDeJScQN5DXWLBj5t2uW/Q4FfDXWJDlzY/FGaaMkfsF1nlkmUveDe0OktzEB73
         3VJLvk4yAmbwatAnNWsJGXdofYaH2Rb+6JIvbYr6evO7Q/S/BEYtmYmDOSgolPfRJLfw
         XODcM3/aWAjzy39SHwe+3PPiW0iNouva+nSY5AILkI2BxoL1KtywbMz9OIgFpgHc8Xod
         9BQFHaMMD8t73jkvn1QgC90DYiwsTFqglBnpppZpQCEIozza4mG8r6potD4cvq58jNcv
         nrEw==
X-Gm-Message-State: AOAM530Mz8q1m8Y0I5vwoPatiuL/uLiciF1kzQGZ3CY+K00Fryyd3NA6
        r+rE4aNDdfOb67MkX5/Pt8LUl7hzYQQ=
X-Google-Smtp-Source: ABdhPJw6Ubpe6Dhe9FfCHgPaKhtZGS31CN0HVNX7YHMMh+X+ehbOWRUAG3ylFlAZBoR7AUi9nS6QBw==
X-Received: by 2002:a2e:1519:: with SMTP id s25mr19542043ljd.277.1619588658721;
        Tue, 27 Apr 2021 22:44:18 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru. [109.252.193.102])
        by smtp.googlemail.com with ESMTPSA id 2sm914499ljf.61.2021.04.27.22.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 22:44:18 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bbcf6dbe-367b-38b2-91bf-9d5f4cd2c57c@gmail.com>
Date:   Wed, 28 Apr 2021 08:44:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BY5PR12MB3764DFDEA8125650799DC76CB3419@BY5PR12MB3764.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

27.04.2021 21:30, Krishna Reddy пишет:
>> Is it always safe to enable SMMU ASID in a middle of a DMA request made by a
>> memory client?
> 
> From MC point of view, It is safe to enable and has been this way from many years in downstream code for display engine.
> It doesn't impact the transactions that have already bypassed SMMU before enabling SMMU ASID. 
> Transactions that are yet to pass SMMU stage would go through SMMU once SMMU ASID is enabled and visible.

Hello,

Thank you for the answer. Could you please give more information about:

1) Are you on software or hardware team, or both?

2) Is SMMU a third party IP or developed in-house?

3) Do you have a direct access to HDL sources? Are you 100% sure that
hardware does what you say?

4) What happens when CPU writes to ASID register? Does SMMU state
machine latch ASID status (making it visible) only at a single "safe" point?
