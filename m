Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552A3313E3D
	for <linux-tegra@vger.kernel.org>; Wed, 15 Oct 2025 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514805; cv=none; b=s+dbxg1UIbMa7QDtTjgJ+oW3MArf2Sy210tDZ5nJhiwYpKfFrGlenvSu0NUJb0AiF03wc0bvSEsfxuVYJUug+6wbBZjNXW5vxsh6Ktyqt86pOxJbZn4a6gUrFojv0iVZnD6zkno0ReRUhojy/NGIVkIDTj5d0H3Ic4EOOyR8kH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514805; c=relaxed/simple;
	bh=/BrnxgRvfxsByTFmhZBOY+/B1WEWcZSF203srsQwXF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLlXaAmjbyO4Aebp77vAmlXELacSoW/I5SUKq/OOlSzvqdNBOG3Lo72nWVLXGOBNyK3nkyYXS01xmc6UIfVnYu9xZxmhxIQ2W6lzUjn/JVWu7mpiSIs7x64wr82CoHszkeZzPSVpxXHdvPaRG5X8oTMdeYzUCQUKJMtw2zF3ndw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YK/ErJOe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YK/ErJOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760514802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
	b=YK/ErJOe4ySVCbEZDx7t4Rrs+YpkmUaM7i5Nz8Y2h+86ClpnfCycAlli2dCvg0nT/gT/JJ
	JBDBMlxp2hivbyqDWvU/75CgrhsccnHK+b3Xj3G3Jc+4XlwhYzO99y2bT356rpLEV9g9et
	FVX3f1NwA3XVu1jQxknmOcCO4r1UFG8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-hHxJ4DPKMjObXE8fSzVJoQ-1; Wed, 15 Oct 2025 03:53:20 -0400
X-MC-Unique: hHxJ4DPKMjObXE8fSzVJoQ-1
X-Mimecast-MFC-AGG-ID: hHxJ4DPKMjObXE8fSzVJoQ_1760514800
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4710055d00bso1802345e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 15 Oct 2025 00:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760514799; x=1761119599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
        b=okHv1nsQyYLldyP/1U6cxzk9A4DddDyqVH2DQpLfcsxyfQ8/7YIQeoEafQpVY1Ktvp
         3Ld4mxF1xc6LepuAiKeWUdNhEQqJLOWqyFzgIsAektlwxqkI0gLOHRvjbee8KD8I8bOF
         egs0VSbFCPljK9vu9wZdkrVHatUTGW03kQC8PGqPMprstadst1UvU/Uhh0zcXoRDTe8s
         z9sdAoiNl+GqULxNRuM0xQJ4QD3E6Ad4IIc0nwEhp9RpGxpe2IytuxI7cQPSCLmSNscs
         oUgw9/Mo+k8BAWjhXr9PEhIkJCJ/PSt2Z1CgvtPWFzGaRwwBS+jZaCDEHqqW60dRzSlN
         /hsw==
X-Forwarded-Encrypted: i=1; AJvYcCUer4crxA9co+75U6eJEarr8w7aD8XlTtCLzHzBZZ/TzIq0lwkpr3SH2Cxfuf2owMHmBD7ueOz4xD44qA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys+c2WkFvtbfkRbRqaJTwmT0bdH436ZiAALi0z1v1hK5H4SUXi
	lVNXHGnNfGwXjPAdLQci84RrMGiw36sP3uI4HDBIrvX22VuDpYKu94vfast6rcDpWctAmSao/0r
	1NQl/YqruTEW8fY+vzn+kV9NCg2gm8d8aDFfpPHXBC2NmgyBrE7WngPn8eLzDSPFZ
X-Gm-Gg: ASbGncsqdYDmjcOBPg8iKpz8441WRs9XnosCFBwtsCFgyOxSE9TtNDJkus+2Lo/xeM6
	7TFsVJ8yN9jPcU1U5j0+bD0d2R1mu1sfuy/kcPy8DxSRXy2GtK8AFoPdnn/uJz2LpCVNIm6sdGf
	NFcopxYRd5Wur2DGU5bKgOTNxMLaGvkLKC1GiA2tnUEGVRdthC2e7yu43HZWoHcLzM27wMCS+6q
	7ioee1saFPnE2cMO9dWns+KdMasAkOlUo1qLvGb8RquShUblyPSqFNAEy+8oZagf/GYSOGZf9SR
	3tYfoWKf22Q7oswDF4ENq3GZ5TpEmOmVZ6W2RKgVuq+rbvEi+TTCpo9EkqHx9M5NshC0car9gpK
	mGDK7
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46fa9b11746mr202661475e9.36.1760514799495;
        Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZf7d9TK63edfjPsh4LrX74Y6wRlhtOgKLsjlyk6mKGtY9U4BbM1bQ2mcLbjosAJUslcGWjg==
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46fa9b11746mr202661265e9.36.1760514799084;
        Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c21805sm14875785e9.10.2025.10.15.00.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:53:18 -0700 (PDT)
Message-ID: <c256b8d9-ec9e-4841-9136-1198ad2d590a@redhat.com>
Date: Wed, 15 Oct 2025 09:53:15 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/log: Add free callback
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-4-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2025 15:16, Thomas Zimmermann wrote:
> Free the client memory in the client free callback. Also move the
> debugging output into the free callback: drm_client_release() puts
> the reference on the DRM device, so pointers to the device should
> be considered dangling afterwards.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 116e0ef9ae5d..470df4148e96 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -293,19 +293,26 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
>   	}
>   }
>   
> -static void drm_log_client_unregister(struct drm_client_dev *client)
> +static void drm_log_client_free(struct drm_client_dev *client)
>   {
>   	struct drm_log *dlog = client_to_drm_log(client);
>   	struct drm_device *dev = client->dev;
>   
> +	kfree(dlog);
> +
> +	drm_dbg(dev, "Unregistered with drm log\n");
> +}
> +
> +static void drm_log_client_unregister(struct drm_client_dev *client)
> +{
> +	struct drm_log *dlog = client_to_drm_log(client);
> +
>   	unregister_console(&dlog->con);
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
>   	mutex_unlock(&dlog->lock);
>   	drm_client_release(client);
> -	kfree(dlog);
> -	drm_dbg(dev, "Unregistered with drm log\n");
>   }
>   
>   static int drm_log_client_hotplug(struct drm_client_dev *client)
> @@ -339,6 +346,7 @@ static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lo
>   
>   static const struct drm_client_funcs drm_log_client_funcs = {
>   	.owner		= THIS_MODULE,
> +	.free		= drm_log_client_free,
>   	.unregister	= drm_log_client_unregister,
>   	.hotplug	= drm_log_client_hotplug,
>   	.suspend	= drm_log_client_suspend,

