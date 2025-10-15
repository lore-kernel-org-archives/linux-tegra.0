Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06982BDC23
	for <linux-tegra@vger.kernel.org>; Wed, 15 Oct 2025 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514768; cv=none; b=ik7ZcIaViypHtxYQnn50LPQ/WImaWDfaHQbAC9eiEqaXhb838ThePrZ7EJthEl7DQQOttiltUQNGtz8/y8uMOfMVbxyM5KJiwSto8/lp1Y6BOJriBJD9fhltte+X0m8CaA05MybYoO0twFqIhNOYwGRZnchkToRBHzzrgxhW9io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514768; c=relaxed/simple;
	bh=huaoblDaUm5GV/wEEBTTwjtfX01FRyyrQekiwsqg11k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrA7T0gcy+6mOd3NpMEUsNvLp3Yl5v/RIPe9+Hs7t8hEQ4RFJvChAVHCjNYp8vxaygvXxp+/9+sHwImTwT2+nl+b2uJUF7j5oek1US4H4V8+xN1pyh6vQ09FmaQaqdsRmpMizSxhoIYlHGupIdCVn6+zU2Ea2j+frO6AwMvsB2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KU1ZYWOy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KU1ZYWOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760514765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHykXUHzy3P15VrWtRxCqfqVXwzZ2Ylga+RWIrK7dZE=;
	b=KU1ZYWOyDIwp4S0YN5O9G5v4PiTcyS4tN2OQ/zFd0tL87xUu7N5utJO4rRX6rfjM5Tep26
	Bu+ls5UIsYWtXP0m1ccwoy7RBnvhQu42i7X6UWwHXKRfzSKKL01F0/My/kbWlUsQI+uqgl
	mdqwvQiqrlRTGWgul8yBE/ZqBjORHc8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-sUJ57BjXNzSTzLM-LeRkWQ-1; Wed, 15 Oct 2025 03:52:44 -0400
X-MC-Unique: sUJ57BjXNzSTzLM-LeRkWQ-1
X-Mimecast-MFC-AGG-ID: sUJ57BjXNzSTzLM-LeRkWQ_1760514763
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e502a37cdso39291125e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 15 Oct 2025 00:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760514763; x=1761119563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHykXUHzy3P15VrWtRxCqfqVXwzZ2Ylga+RWIrK7dZE=;
        b=jHm4T+OwR023xw8BzBHGP9kIeIZPEOLY4iBGgoUSdJE2VeXRvAH8U7B6SissKxUs/+
         K6X0/3r95VbkFxK0+jO5hwnJ/dzv0nY7CYh41y0DV6R6kKCiGo3uXZYOr/JMgVIUzJGh
         VfykhVCa/TJoz+W4wXGbd/HaZzGriy5lk9+pH6XvJvodyOMfXs/GSplBhSbJlaClDHSD
         1yY63PcaXe7SmycP4A6mcEA38yEUweoBIH1JsaUDao8IoENZ5tuot6yo74C0EAWYEtFd
         LV2CQ3/WoBJ3AjGyXEpdA/EHkuRscCggvpp7z0xyEnO+aPtmHDOjv+SLg+OEiGVvrUzn
         n8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWiGbZq4geVzU7GxWAXEKk/SJtiwlcjM6c3tETqyP9pIwLxDA0Y/3ExcTaUoAoHCMXfZ5BXPQaGHkH+fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKx/+WNFNYhS74Y15b9rwn6WMQAVAkVLnz1mFBdLPAMptykJ/r
	xpqa1ST7RG4d5RI3V3WR3+WpLc2nCTjJuqQkp4vZU5ZCY1USoqz/Rsv/pDUkBYWpNxycEBl4XvU
	8seOKyfChxUdSR67DT/JvwWBkY6h6tX5WLC3e42c7LKyxVkJdMHRDreBqO+bXH11e
X-Gm-Gg: ASbGncsvuRzeYRnPs9mUCZgEtQa03rql+s8vyNEDYneyEREN++6/6kMf+fstQ4d2ocS
	bFLcqgLQmZjtjouWk2sZ6W3+RHN7/1jP6VW5CoYneBW4jc38p5jBq3PLPJEMffjlC0a5QTVhhEO
	2CNzWsE8BNxJMNvUfox72qzNW3MVeprgcLvQ5SGGwWIWZKi7j5l77AsEYWZ/A87yh2vwDwFb0hZ
	h6UxriqNPeVoNdse7IpDTH4+k9jPOdKj1CcoIVXQnDRjKPGlPQxHY7Um1Hm+tGZUvFX5/1H1Yo3
	DXyseTmXze3LyFIYMe9z1yTbK9320Axu+L1LPxZKFkz/TjMThGLBmIgpj3T6dCvMhlArNKQ+Bv3
	vdXfS
X-Received: by 2002:a05:600c:34cc:b0:46e:59dd:1b4d with SMTP id 5b1f17b1804b1-46fa9aa2076mr211303505e9.16.1760514763147;
        Wed, 15 Oct 2025 00:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW2ZDBPJxUfYCX0H6nLEKOLye2i61674dJQY/ZLYYwFVcv5Uohdp1HeQRReQYkGVWqF+Eh1g==
X-Received: by 2002:a05:600c:34cc:b0:46e:59dd:1b4d with SMTP id 5b1f17b1804b1-46fa9aa2076mr211303305e9.16.1760514762767;
        Wed, 15 Oct 2025 00:52:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47106fc97adsm2155395e9.9.2025.10.15.00.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:52:42 -0700 (PDT)
Message-ID: <3d07c6ba-02d6-4d3f-8684-65a41b128539@redhat.com>
Date: Wed, 15 Oct 2025 09:52:36 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/log: Do not hold lock across drm_client_release()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-3-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2025 15:16, Thomas Zimmermann wrote:
> When calling drm_client_release(), the client is already quiescent.
> Internal locks should therefore be dropped before the caller releases
> the client.
> 
> In the case of the DRM log, concurrency originates from the console or
> from client events. The console has been unregistered in the previous
> line. The caller of the unregister callback, drm_log_client_unregister(),
> holds clientlist_mutex from struct drm_device to protect against concurrent
> client events. It is therefore safe to release the client without holding
> locks.

Thanks, I agree, it should be safe to move drm_client_release() after 
the lock.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index d239f1e3c456..116e0ef9ae5d 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -302,8 +302,8 @@ static void drm_log_client_unregister(struct drm_client_dev *client)
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
> -	drm_client_release(client);
>   	mutex_unlock(&dlog->lock);
> +	drm_client_release(client);
>   	kfree(dlog);
>   	drm_dbg(dev, "Unregistered with drm log\n");
>   }

