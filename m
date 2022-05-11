Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4F2C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 11 May 2022 11:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbiEKLJH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 May 2022 07:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiEKLJG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 May 2022 07:09:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287B6FFA90
        for <linux-tegra@vger.kernel.org>; Wed, 11 May 2022 04:09:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id A7E7B1F44DCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1652267343;
        bh=F9aAPWfKvLN/c3HoUZUVVOQ9jz//gwR/ofGKu2nHses=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=W12X3oJhsrpQE2DhSrbaWvWpfAdag8EHWZTe0B4BjVG5fVofba5zM6AwqURgE2xit
         G9sJQhKpL5Lyo4YWhOxwOG8SRrENRfkKeEihosn8zGLLwzAInYCBTg24pri6K5Wkzm
         ROAc6s6qMvVe35i0rWFGctTEGVUhwszS5KdKNRtZWe7E9AaDTDa/gaiIbsp2T604vi
         lQtYbkGWo0zS/4XtbXV/VbB7Ud2LSjWRexmYPIToQz+WYbzOkE/vFnAUFWc0AHLsUW
         NAPHxYUaNdksd30zWcFIl6/+Xto1CdT5o8GmtPsk9k2BN0C2KpYvYXG1TSVRc+KZj6
         n8r2YQnQOZf1w==
Message-ID: <a0c7e954-ee3f-74fd-cfea-9b6dbce924dc@collabora.com>
Date:   Wed, 11 May 2022 14:08:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/tegra: Stop using iommu_present()
Content-Language: en-US
To:     Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org
References: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
 <add31812-50d5-6cb0-3908-143c523abd37@collabora.com>
 <63c021c4-57de-38fe-e48f-a308088d235b@arm.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <63c021c4-57de-38fe-e48f-a308088d235b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 5/4/22 14:52, Robin Murphy wrote:
> On 2022-05-04 01:52, Dmitry Osipenko wrote:
>> On 4/11/22 16:46, Robin Murphy wrote:
>>> @@ -1092,6 +1092,19 @@ static bool host1x_drm_wants_iommu(struct
>>> host1x_device *dev)
>>>       struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
>>>       struct iommu_domain *domain;
>>>   +    /* For starters, this is moot if no IOMMU is available */
>>> +    if (!device_iommu_mapped(&dev->dev))
>>> +        return false;
>>
>> Unfortunately this returns false on T30 with enabled IOMMU because we
>> don't use IOMMU for Host1x on T30 [1] to optimize performance. We can't
>> change it until we will update drivers to support Host1x-dedicated
>> buffers.
> 
> Huh, so is dev->dev here not the DRM device? If it is, and
> device_iommu_mapped() returns false, then the later iommu_attach_group()
> call is going to fail anyway, so there's not much point allocating a
> domain. If it's not, then what the heck is host1x_drm_wants_iommu()
> actually testing for?

The dev->dev is the host1x device and it's the DRM device.

The iommu_attach_group() is called for the DRM sub-devices (clients in
the Tegra driver), which are the devices sitting on the host1x bus.

There is no single GPU device on Tegra, instead it's composed of
independent GPU engines and display controllers that are connected to
the host1x bus.

Host1x also has channel DMA engines that are used by DRM driver. We
don't have dedicated devices for the host1x DMA, there is single host1x
driver that manages host1x bus and DMA.

-- 
Best regards,
Dmitry
