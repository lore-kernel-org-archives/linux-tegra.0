Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53382C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 18:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B9F920758
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 18:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqToHEGu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgJBSEK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 14:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBSEK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 14:04:10 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E41C0613D0;
        Fri,  2 Oct 2020 11:04:09 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a15so1916643ljk.2;
        Fri, 02 Oct 2020 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X7scSAYBn2RRuTNSpT50v9O4203tRjoSiVCg2al9x3c=;
        b=PqToHEGu23DgdZ2llKdlNz3ZnXVa4N0F9hZj5tE+Lt9BmBznCQkbGKrS+3ZAgwLiTQ
         z8Uepf2oXiTPK0szzztUkNBiXYQboC/0JTR2l9O9/KyKai1XQMrckYjXo4IQd6opxd08
         F1IZ9UqH/nIj4+Ptb8ZZ8YFHe+qbysgZ0dNBltffrONxrJslUIzC0WZC3PfETDkWQrIO
         8VnHOrzPW4KW7u6iz7VDoOv1mv1bQBAkGSG+81ZufuwpY4TaTbTb+EJhMZBKW46palov
         zip602g9OLFY8lu/hMb6VfhDvn59v8ykZvs85RXKhC373rvz0oyi8KoIz1zHU903VQqt
         NBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X7scSAYBn2RRuTNSpT50v9O4203tRjoSiVCg2al9x3c=;
        b=pJQY7CHw8aX3IcmKWjboS/doZI9mmWONKztCaLbLky0WhALNxavkQmLKbYJ0xbggbJ
         Osf95mtjYpQv6LCgoc0XsZzFdW8e3t9RKBDe+UAhfnzWA2RhQeV4qQ4s5lnXRofDkoJx
         QsaKrSyIm79cWuVxgfANShepZ1V9CIvNyjq0zkho1xJVW6JVj9xRX8FZrbKp5eXLiFda
         HWi9z95htWYZ5TyCmyTrFE3tUfxD/ukiHl8Ihk6rDakTT3p2FxftNOqxW0UQH9Haxhv8
         taUmO/hlwUq/fHWbILrc0HYkdMXiKk466ajHjz8yukdJMy6vikYpBiVrvVWo+rTYCF23
         cb0Q==
X-Gm-Message-State: AOAM530tRUPey1lDp7dGmb5iqkXAexOOOJvmXiUt3sHFu2cUPw6vH09x
        6tFOPwt+PInc5MY+flKtq5NpOvcye0Q=
X-Google-Smtp-Source: ABdhPJzMyBnyO4z0Vl+YiIYyNkKiOVb7lX/eB2stEZmEd3qHRupKVS8BM81+BfaTwu0T6e9Cub4tUw==
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr1087333ljg.278.1601661847827;
        Fri, 02 Oct 2020 11:04:07 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id c22sm454850lff.202.2020.10.02.11.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 11:04:06 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] iommu/tegra-smmu: Add PCI support
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-4-nicoleotsuka@gmail.com>
 <eba0d5ff-dfb2-7c17-50c2-5709c506f62e@gmail.com>
 <20201002174532.GA29706@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6e4e3cb8-a71b-40b4-7ab6-b3f0d2ec6e0c@gmail.com>
Date:   Fri, 2 Oct 2020 21:04:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002174532.GA29706@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 20:45, Nicolin Chen пишет:
> On Fri, Oct 02, 2020 at 05:35:24PM +0300, Dmitry Osipenko wrote:
>> 02.10.2020 09:08, Nicolin Chen пишет:
>>> @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
>>>  	group->smmu = smmu;
>>>  	group->soc = soc;
>>>  
>>> -	group->group = iommu_group_alloc();
>>> +	if (dev_is_pci(dev))
>>> +		group->group = pci_device_group(dev);
>>> +	else
>>> +		group->group = generic_device_group(dev);
>>> +
>>>  	if (IS_ERR(group->group)) {
>>>  		devm_kfree(smmu->dev, group);
>>>  		mutex_unlock(&smmu->lock);
>>> @@ -1069,22 +1074,32 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
>>>  	iommu_device_set_fwnode(&smmu->iommu, dev->fwnode);
>>>  
>>>  	err = iommu_device_register(&smmu->iommu);
>>> -	if (err) {
>>> -		iommu_device_sysfs_remove(&smmu->iommu);
>>> -		return ERR_PTR(err);
>>> -	}
>>> +	if (err)
>>> +		goto err_sysfs;
>>>  
>>>  	err = bus_set_iommu(&platform_bus_type, &tegra_smmu_ops);
>>> -	if (err < 0) {
>>> -		iommu_device_unregister(&smmu->iommu);
>>> -		iommu_device_sysfs_remove(&smmu->iommu);
>>> -		return ERR_PTR(err);
>>> -	}
>>> +	if (err < 0)
>>> +		goto err_unregister;
>>> +
>>> +#ifdef CONFIG_PCI
>>> +	err = bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
>>> +	if (err < 0)
>>> +		goto err_bus_set;
>>> +#endif
>>>  
>>>  	if (IS_ENABLED(CONFIG_DEBUG_FS))
>>>  		tegra_smmu_debugfs_init(smmu);
>>>  
>>>  	return smmu;
>>> +
>>> +err_bus_set: __maybe_unused;
>>
>> __maybe_unused?
> 
> In order to mute a build warning when CONFIG_PCI=n...
> 

okay
