Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E054C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Nov 2021 10:01:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6707363217
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Nov 2021 10:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233609AbhKPKEM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Nov 2021 05:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233228AbhKPKEJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Nov 2021 05:04:09 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779B7C061570;
        Tue, 16 Nov 2021 02:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HqEM3DCxCc7EYy87yoH2Qfr/sJ9yOX855tzSUgvk9+E=; b=XvlB7UUpzDJsMbwOIwmxYeh0dv
        ilZ9VhOMQ5CFY4tnDutP00Kw0ggTC5QEo2qsluT5MVDcZgWeYQpAAGai01aO93Ah/ColkfEzmsSvL
        eE7qM2y/wcvKjb9OLvkIgTQGRFXhvmsTF52PK2hE45wHfQIw2U36JvRcncStfj819bpSw39yEN/Ts
        K8vzAPT8a3yy1yh48W6yqsaDzjaM02E2KB9U6Gl7xSZqXHsQEkl489YL0K522dG5RqoUe6h1T3+Mc
        UUEsaW7gdOvcf7+gMy6USURlvD8zSZGhd9QvDW1Iex/CQe2d29jgLwCDGWUB3/OTuEtyZnmxxi2dM
        sOtl85zg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1mmvH0-0004do-4u; Tue, 16 Nov 2021 12:01:06 +0200
Subject: Re: [PATCH] drm/tegra: remove no need NULL check before kfree
To:     Bernard Zhao <bernard@vivo.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211116015513.27147-1-bernard@vivo.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <053718d8-0436-97c2-694d-510415dfbc12@kapsi.fi>
Date:   Tue, 16 Nov 2021 12:01:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211116015513.27147-1-bernard@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/16/21 3:55 AM, Bernard Zhao wrote:
> This change is to cleanup the code a bit.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>   drivers/gpu/drm/tegra/submit.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
> index 776f825df52f..c2fc9677742e 100644
> --- a/drivers/gpu/drm/tegra/submit.c
> +++ b/drivers/gpu/drm/tegra/submit.c
> @@ -608,12 +608,10 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
>   	if (job_data && job_data->used_mappings) {
>   		for (i = 0; i < job_data->num_used_mappings; i++)
>   			tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
> -
> -		kfree(job_data->used_mappings);
>   	}
>   
> -	if (job_data)
> -		kfree(job_data);
> +	kfree(job_data->used_mappings);

Now if job_data == NULL, we dereference a NULL pointer here.

In general I'm not a fan of relying on kfree() etc. being a no-op on 
NULL pointers, since doing so gets rid of visual hints on code paths 
indicating the "liveness" of pointer variables.

However I'll let Thierry/other maintainers decide according to their 
preferences.

Thanks,
Mikko

> +	kfree(job_data);
>   put_bo:
>   	gather_bo_put(&bo->base);
>   unlock:
> 
