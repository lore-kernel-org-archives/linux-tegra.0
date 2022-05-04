Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D88C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  4 May 2022 00:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237629AbiEDA4A (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 May 2022 20:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbiEDAz7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 May 2022 20:55:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5605441311
        for <linux-tegra@vger.kernel.org>; Tue,  3 May 2022 17:52:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id A66401F4433E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651625544;
        bh=VHi2JQXOxZVX+vfNBsGibT8B9KC9CmTcEJVV5seb2ME=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=cD2Qkx0zO0rJEAgHvaTzRnevQaJEOKtssl5WeGvASMCSVt+ZXT/dwV5n0FYs09wyE
         0If1OzaemkXfxr5y+tIhvw4gBcrdmKwbFADP+1C7QHw0ZpZgTJOdHp0XWlKp+6dlGa
         Ed+4aPl9r/96lBfpkmb/TmTK162/Ea8Epc2hkhvYAy9uox3LRLEjVRVryVJWoIrqwa
         65O+CcCk4Mz+wwdjqxfF+objr2GbvTMjV9vQjxsfkSLa41uIRtNtdGSf/K2UGJxIK9
         1LAQ71dWYdau3TRiQmse5AkC6HDRb0qkUVNPaTRTYjJrUI54WJYFGJro4mqK9PkgIp
         cd4q6Y4bYQMSQ==
Message-ID: <add31812-50d5-6cb0-3908-143c523abd37@collabora.com>
Date:   Wed, 4 May 2022 03:52:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/tegra: Stop using iommu_present()
Content-Language: en-US
To:     Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org
References: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/11/22 16:46, Robin Murphy wrote:
> @@ -1092,6 +1092,19 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
>  	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
>  	struct iommu_domain *domain;
>  
> +	/* For starters, this is moot if no IOMMU is available */
> +	if (!device_iommu_mapped(&dev->dev))
> +		return false;

Unfortunately this returns false on T30 with enabled IOMMU because we
don't use IOMMU for Host1x on T30 [1] to optimize performance. We can't
change it until we will update drivers to support Host1x-dedicated buffers.

[1]
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/host1x/dev.c#L258

-- 
Best regards,
Dmitry
