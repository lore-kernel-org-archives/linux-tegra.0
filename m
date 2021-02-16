Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CE3C433E6
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Feb 2021 13:20:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EEEC64E04
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Feb 2021 13:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhBPNU6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Feb 2021 08:20:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhBPNU5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Feb 2021 08:20:57 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF00C061574;
        Tue, 16 Feb 2021 05:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4WFMGKGEd9aFjmEszmfyRopNbN5S6PSwLUZN0PRjA/c=; b=A+1oLG+RbMREw06sgdqK+tzUrE
        3x1LYi0mtj4XmSdE3R/CBDEBSdnxmJuxJEwR/VyONIytfDNGpbqNHz5Wk84Mwk9dISDsB7C4WE8M+
        ifv/vyEqxT8+DH/M1NupZ6Da7bcl0iumhDOHF7lFPxJrK1uPWyDOm4eUuA9W9aRzPEFoFQsqxknyu
        LVltG9bRQswbp7s3eEA2t7BSwZ51+o6uvC1p10e4nScC9r7KHic5FtvhmpKoTyaPwkGpxupvDFAzR
        zohjLzLUojl3mm2XKvv96QMzDqtKNB7tSN/oKIk64g0qbcvafQ4Eu16QeVUWVv5RI7ZSjcwI2hiDP
        vrVa2VSQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1lC0Gw-0004SB-1Q; Tue, 16 Feb 2021 15:20:10 +0200
Subject: Re: [RFC PATCH 1/8] of/device: Allow specifying a custom iommu_spec
 to of_dma_configure
To:     Robin Murphy <robin.murphy@arm.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
        will@kernel.org, robh+dt@kernel.org, frowand.list@gmail.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210208163848.2504291-1-mperttunen@nvidia.com>
 <20210208163848.2504291-2-mperttunen@nvidia.com>
 <1c33f914-9109-42aa-01f3-04e50cf038c6@arm.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <f60ce73c-bcab-53d6-8aa9-f8308d7eb8d7@kapsi.fi>
Date:   Tue, 16 Feb 2021 15:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1c33f914-9109-42aa-01f3-04e50cf038c6@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2/16/21 2:47 PM, Robin Murphy wrote:
> Hi Mikko,
> 
> On 2021-02-08 16:38, Mikko Perttunen wrote:
>> To allow for more customized device tree bindings that point to IOMMUs,
>> allow manual specification of iommu_spec to of_dma_configure.
>>
>> The initial use case for this is with Host1x, where the driver manages
>> a set of device tree-defined IOMMU contexts that are dynamically
>> allocated to various users. These contexts don't correspond to
>> platform devices and are instead attached to dummy devices on a custom
>> software bus.
> 
> I'd suggest taking a closer look at the patches that made this 
> of_dma_configure_id() in the first place, and the corresponding bus code 
> in fsl-mc. At this level, Host1x sounds effectively identical to DPAA2 
> in terms of being a bus of logical devices composed from bits of 
> implicit behind-the-scenes hardware. I mean, compare your series title 
> to the fact that their identifiers are literally named "Isolation 
> Context ID" ;)
> 
> Please just use the existing mechanisms to describe a mapping between 
> Host1x context IDs and SMMU Stream IDs, rather than what looks like a 
> giant hacky mess here.
> 
> (This also reminds me I wanted to rip out all the PCI special-cases and 
> convert pci_dma_configure() over to passing its own IDs too, so thanks 
> for the memory-jog...)

Thanks Robin, not sure how I missed that the first time :) Maybe because 
Host1x doesn't have a concept of its own "IDs" for these per se - the 
hardware just uses stream IDs as is. I would need to count the number of 
mapped IDs from the iommu-map property and introduce some 0..N range of 
IDs at the software level. But maybe that's not too bad if we're able to 
use the existing paths and bindings then.

I'll take a look at switching to iommu-map.

Thanks,
Mikko

> 
> Robin.
> 
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/iommu/of_iommu.c  | 12 ++++++++----
>>   drivers/of/device.c       |  9 +++++----
>>   include/linux/of_device.h | 34 +++++++++++++++++++++++++++-------
>>   include/linux/of_iommu.h  |  6 ++++--
>>   4 files changed, 44 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index e505b9130a1c..3fefa6c63863 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -87,8 +87,7 @@ int of_get_dma_window(struct device_node *dn, const 
>> char *prefix, int index,
>>   }
>>   EXPORT_SYMBOL_GPL(of_get_dma_window);
>> -static int of_iommu_xlate(struct device *dev,
>> -              struct of_phandle_args *iommu_spec)
>> +int of_iommu_xlate(struct device *dev, struct of_phandle_args 
>> *iommu_spec)
>>   {
>>       const struct iommu_ops *ops;
>>       struct fwnode_handle *fwnode = &iommu_spec->np->fwnode;
>> @@ -117,6 +116,7 @@ static int of_iommu_xlate(struct device *dev,
>>       module_put(ops->owner);
>>       return ret;
>>   }
>> +EXPORT_SYMBOL_GPL(of_iommu_xlate);
>>   static int of_iommu_configure_dev_id(struct device_node *master_np,
>>                        struct device *dev,
>> @@ -177,7 +177,8 @@ static int of_iommu_configure_device(struct 
>> device_node *master_np,
>>   const struct iommu_ops *of_iommu_configure(struct device *dev,
>>                          struct device_node *master_np,
>> -                       const u32 *id)
>> +                       const u32 *id,
>> +                       struct of_phandle_args *iommu_spec)
>>   {
>>       const struct iommu_ops *ops = NULL;
>>       struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>> @@ -209,7 +210,10 @@ const struct iommu_ops *of_iommu_configure(struct 
>> device *dev,
>>           err = pci_for_each_dma_alias(to_pci_dev(dev),
>>                            of_pci_iommu_init, &info);
>>       } else {
>> -        err = of_iommu_configure_device(master_np, dev, id);
>> +        if (iommu_spec)
>> +            err = of_iommu_xlate(dev, iommu_spec);
>> +        else
>> +            err = of_iommu_configure_device(master_np, dev, id);
>>           fwspec = dev_iommu_fwspec_get(dev);
>>           if (!err && fwspec)
>> diff --git a/drivers/of/device.c b/drivers/of/device.c
>> index aedfaaafd3e7..84ada2110c5b 100644
>> --- a/drivers/of/device.c
>> +++ b/drivers/of/device.c
>> @@ -88,8 +88,9 @@ int of_device_add(struct platform_device *ofdev)
>>    * can use a platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE 
>> events
>>    * to fix up DMA configuration.
>>    */
>> -int of_dma_configure_id(struct device *dev, struct device_node *np,
>> -            bool force_dma, const u32 *id)
>> +int __of_dma_configure(struct device *dev, struct device_node *np,
>> +            bool force_dma, const u32 *id,
>> +            struct of_phandle_args *iommu_spec)
>>   {
>>       const struct iommu_ops *iommu;
>>       const struct bus_dma_region *map = NULL;
>> @@ -170,7 +171,7 @@ int of_dma_configure_id(struct device *dev, struct 
>> device_node *np,
>>       dev_dbg(dev, "device is%sdma coherent\n",
>>           coherent ? " " : " not ");
>> -    iommu = of_iommu_configure(dev, np, id);
>> +    iommu = of_iommu_configure(dev, np, id, iommu_spec);
>>       if (PTR_ERR(iommu) == -EPROBE_DEFER) {
>>           kfree(map);
>>           return -EPROBE_DEFER;
>> @@ -184,7 +185,7 @@ int of_dma_configure_id(struct device *dev, struct 
>> device_node *np,
>>       dev->dma_range_map = map;
>>       return 0;
>>   }
>> -EXPORT_SYMBOL_GPL(of_dma_configure_id);
>> +EXPORT_SYMBOL_GPL(__of_dma_configure);
>>   int of_device_register(struct platform_device *pdev)
>>   {
>> diff --git a/include/linux/of_device.h b/include/linux/of_device.h
>> index 07ca187fc5e4..40cc3e788cb9 100644
>> --- a/include/linux/of_device.h
>> +++ b/include/linux/of_device.h
>> @@ -55,14 +55,27 @@ static inline struct device_node 
>> *of_cpu_device_node_get(int cpu)
>>       return of_node_get(cpu_dev->of_node);
>>   }
>> -int of_dma_configure_id(struct device *dev,
>> +int __of_dma_configure(struct device *dev,
>>                struct device_node *np,
>> -             bool force_dma, const u32 *id);
>> +             bool force_dma, const u32 *id,
>> +             struct of_phandle_args *iommu_spec);
>>   static inline int of_dma_configure(struct device *dev,
>>                      struct device_node *np,
>>                      bool force_dma)
>>   {
>> -    return of_dma_configure_id(dev, np, force_dma, NULL);
>> +    return __of_dma_configure(dev, np, force_dma, NULL, NULL);
>> +}
>> +static inline int of_dma_configure_id(struct device *dev,
>> +                      struct device_node *np,
>> +                      bool force_dma, const u32 *id)
>> +{
>> +    return __of_dma_configure(dev, np, force_dma, id, NULL);
>> +}
>> +static inline int
>> +of_dma_configure_iommu_spec(struct device *dev, struct device_node *np,
>> +                bool force_dma, struct of_phandle_args *iommu_spec)
>> +{
>> +    return __of_dma_configure(dev, np, force_dma, NULL, iommu_spec);
>>   }
>>   #else /* CONFIG_OF */
>> @@ -112,18 +125,25 @@ static inline struct device_node 
>> *of_cpu_device_node_get(int cpu)
>>       return NULL;
>>   }
>> -static inline int of_dma_configure_id(struct device *dev,
>> +static inline int of_dma_configure(struct device *dev,
>>                      struct device_node *np,
>>                      bool force_dma)
>>   {
>>       return 0;
>>   }
>> -static inline int of_dma_configure(struct device *dev,
>> -                   struct device_node *np,
>> -                   bool force_dma)
>> +
>> +static inline int of_dma_configure_id(struct device *dev,
>> +                      struct device_node *np,
>> +                      bool force_dma, const u32 *id)
>>   {
>>       return 0;
>>   }
>> +
>> +static inline int
>> +of_dma_configure_iommu_spec(struct device *dev, struct device_node *np,
>> +                bool force_dma, struct of_phandle_args *iommu_spec)
>> +{    return 0;
>> +}
>>   #endif /* CONFIG_OF */
>>   #endif /* _LINUX_OF_DEVICE_H */
>> diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
>> index 16f4b3e87f20..e8d1e6d32d77 100644
>> --- a/include/linux/of_iommu.h
>> +++ b/include/linux/of_iommu.h
>> @@ -14,7 +14,8 @@ extern int of_get_dma_window(struct device_node *dn, 
>> const char *prefix,
>>   extern const struct iommu_ops *of_iommu_configure(struct device *dev,
>>                       struct device_node *master_np,
>> -                    const u32 *id);
>> +                    const u32 *id,
>> +                    struct of_phandle_args *iommu_spec);
>>   #else
>> @@ -27,7 +28,8 @@ static inline int of_get_dma_window(struct 
>> device_node *dn, const char *prefix,
>>   static inline const struct iommu_ops *of_iommu_configure(struct 
>> device *dev,
>>                        struct device_node *master_np,
>> -                     const u32 *id)
>> +                     const u32 *id,
>> +                     struct of_phandle_args *iommu_spec);
>>   {
>>       return NULL;
>>   }
>>
