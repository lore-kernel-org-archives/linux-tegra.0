Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4BAC2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66A3A2074B
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrROXhnN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbgI3Fsx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbgI3Fsw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:48:52 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FDCC061755;
        Tue, 29 Sep 2020 22:48:52 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m5so639610lfp.7;
        Tue, 29 Sep 2020 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sTlqCEGp37rQgxee6pjO54hL90cDz6DxVD42l2S1fWY=;
        b=WrROXhnNJZ43uGT8pW9Rnhr+LT9VvW+DFmVprWAhpR3nZMSv5vu9GOL1Ad0E+G4KL8
         G9Yjr+DlX/OqgZOOgX68ds3hbhEKVwbiI3UWVFx1/Hw2HN1yQMeS4WJ2c/F34LIcg6vc
         iLk25EcYpFZZKVTD1fQC7t2gGywRyzFj9AM29bPoXVn1jrN4dkggBousL1Goo+C626qL
         TzjuwG9rZbs2cFRPa/5hTElwVT+sDSIk2vQb5uyNnhHajwz7IKPw0SLwAC7qxaufOB4G
         hhj7UaY2v597eq8iq+wCCGRMIIeik1G1TK5sc2bmecIU/zv8QQ6nQjM/6Gesup59aA5S
         +NGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sTlqCEGp37rQgxee6pjO54hL90cDz6DxVD42l2S1fWY=;
        b=kG5lMbZ4un+6LR0DgKU/yCJ0rmQc8tElEMjyaasvf7jRY/0XNhS5LjRxdbQpd9kYoZ
         S8pC6ODGSfrAfO1v3z5zw5spcSxr3c1SQiiyQCTjtc6CyEwXOxawvVk3KLVHr5HIEtZn
         YPmb0a1xcbhXrmAv3JdTVnt7OrX+cdC3elI3iKcvVKD2dziMTQaan/c6pK4I+aKyjKbA
         F3/8RsLLAeaiKgY+3no3D5dGljkkEEmLv9+fhabBFrZpFdt2pra7u0onXa1uJmv9fcbl
         C6L5lb8PgHdWyJS087S2onopu1YL4wDeeNAk4T7WGRY9+F3VYw0m4RcOhJPfGO5bhXKR
         Uh6A==
X-Gm-Message-State: AOAM530RWyWLkMoikNRWEQi8nuVVehjXSs9BZvs3GqrjeAxuXmWiZyTd
        xI9PXa10vQujX6Xw3Ujbcchg/nHu1UQ=
X-Google-Smtp-Source: ABdhPJwIHrMGRrOWHIrTo+petVlBtwi5nTRuibwE2GQlD+fqVI+v+lUc38fkumcR4VVvfR5iahMuxg==
X-Received: by 2002:ac2:593b:: with SMTP id v27mr303325lfi.338.1601444930557;
        Tue, 29 Sep 2020 22:48:50 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l188sm63762lfd.127.2020.09.29.22.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 22:48:49 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <03710107-b6ad-5256-4550-09c610d0fded@gmail.com>
 <20200930053930.GD31821@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e5b9f269-3ddd-d4e5-de26-413414c3ccf2@gmail.com>
Date:   Wed, 30 Sep 2020 08:48:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930053930.GD31821@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 08:39, Nicolin Chen пишет:
> On Wed, Sep 30, 2020 at 08:24:02AM +0300, Dmitry Osipenko wrote:
>> 30.09.2020 03:30, Nicolin Chen пишет:
>>> +	/*
>>> +	 * IOMMU core allows -ENODEV return to carry on. So bypass any call
>>> +	 * from bus_set_iommu() during tegra_smmu_probe(), as a device will
>>> +	 * call in again via of_iommu_configure when fwspec is prepared.
>>> +	 */
>>> +	if (!mc->smmu || !fwspec || fwspec->ops != &tegra_smmu_ops)
>>>  		return ERR_PTR(-ENODEV);
>>
>> The !mc->smmu can't be true.
> 
> Are you sure? I have removed the "mc->smmu = smmu" in probe() with
> this change. So the only time "mc->smmu == !NULL" is after probe()
> of SMMU driver is returned. As my comments says, tegra_smmu_probe()
> calls in this function via bus_set_iommu(), so mc->smmu can be NULL
> in this case.
> 

I missed that.
