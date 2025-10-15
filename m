Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD032D8795
	for <linux-tegra@vger.kernel.org>; Wed, 15 Oct 2025 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760516452; cv=none; b=C1lAZj/t97mre4t0prYw2pcsSqCKBrtqXe6nZUi3OvlI8Ve6pZsb8+eQzLWEWlyjlYM6DoyPAcdfEyT6ZgmVn68fsa2gbbc4Hl8ZrtgNdhQt5lx++8T4CadC4d11w6a8y9nRgRz71/mDpzrTQy5CRMetS8TK7Uvoo4VeVkHbIzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760516452; c=relaxed/simple;
	bh=gdBDLPt4sGdp4vau56vsKCZGKHYOD8ibbTQ+im2l4Ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fac+KNh6eGC16FtDDqW4PoM6byl6NpDlQoZYIM8ewfOEP/BUUFCAnpb1IOqIckJw2bEU+gjJ7+iP3GaVI9NNLLMsOsX6nsZXq+v56wrAJcWqQwtnAsrPWuRE4dBDdYLzqDm06OPIR1d0NCOuaEEuLaG3mKvrIZ2+aGHz8mGzaJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JOfLyAd5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JOfLyAd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760516449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=;
	b=JOfLyAd5BIsXGsx9Oz7hu9boXLH2G0GAoB0pGg+5hMITbciLUmHJ/pwTqK7nKg5VLJ8CVz
	GN2unXteq7eMZjrO5FgTys+huHsyPcDK8tBtP21nKcN5v33oRKZnVBZKTTZlET/6ooe6Y0
	9HL6RXykMK5POxtcNcfVVI8x6vvLa1c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-gzHmvPztNfezCSBVjxhDKw-1; Wed, 15 Oct 2025 04:20:47 -0400
X-MC-Unique: gzHmvPztNfezCSBVjxhDKw-1
X-Mimecast-MFC-AGG-ID: gzHmvPztNfezCSBVjxhDKw_1760516447
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e509374dcso27314325e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 15 Oct 2025 01:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760516446; x=1761121246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=;
        b=K8k3sj/+alfd5VK1vj7aVxvZ6CF2rO0mE1UhS/ny+FstP9tpDD2m3xKenE/6oo+lSB
         BvhHNkoS3YMeKR2NHDFbXTIVz65t3kF44ioFphQV787SZpFQYjSkbdgWuGEoLyqkMFVS
         XzCwXa7ZSPOUI7hUPTIAaLUi/g+TtDXmuHX0tCJIFCR0B/Hy8MnkFa0nVkb6EbPF+Lgv
         FudRrM6/72PuClXSDRtY2w/ktcEDkGP36tVWYXY++KtgC4h9d4RQsDnjT3mGX0oBPvU2
         IPj98XDjzpzPXpImUcc1tYN+gB1GOmXXcyDe3nOT5sQ+hA2IK1leoDxgcFZW+oBF5UsX
         QXWA==
X-Forwarded-Encrypted: i=1; AJvYcCWDO4gZ02YUDEeavbBsHLQpQLYgk97MSQQK4HELC/UEUIF2MCBRi8slsyItuOPDFD/TfDINbvDpdp2SlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/1PBz0GkJ3c0vYRtSiArB2GO07Zam8PaZ3n98llAX/3ffWq6
	gWQrFJ04zXt7rkNoqD3uHOK4pdhLC1UFp7B7QMZE5adaskYj7mOQSHO7c6GLeQBTvj/as0XhlBn
	DFpIc02VWxoNk5VkbZda2KNA6GDl+NLzyfiidhomLrP5h/RIz5GZRKJjG2Xj9oIpE
X-Gm-Gg: ASbGncu+jlO1YOlzNQIMNINJM48nI7PtjsZnpOS/QDETlulovERthYyVA10Drmh9Yzp
	QG/1KGY6QpSJbRKzMHC1uFQ1PT+Rdrp2FwMuYTRssWn025iif4S/Tw33V688DyWjB5RBGk7eNWe
	MCtw61tfJ/tNiqPPaW7+DZ+fmKhKrZaevmuA6p2grjvxbXM7RptDrKSjyR+9qeXt5DtN6BThuO5
	wif8iTxoVGfZNgEbmTsjT5gzHdbObHrmw8u5GwNtt83p6yN/UoOdMgEOoU9wO1vXzIDkqIDiIkS
	VMtuZFwDzbn7Vr32285t5FKOpNLTBs52vIBuVRPREfCk0hXN+HkPmE7BAndgjG5pJYOxvDClXtg
	0W1mE
X-Received: by 2002:a05:600d:41c4:b0:471:7a:791a with SMTP id 5b1f17b1804b1-471007a7a96mr9522835e9.7.1760516446522;
        Wed, 15 Oct 2025 01:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKG0piBaN7As1r+PD/K5QtUV2Z28HHZlEUD35iBfCWvoyf69YaDGLCaS5NwDRxAhyjJ4bu3g==
X-Received: by 2002:a05:600d:41c4:b0:471:7a:791a with SMTP id 5b1f17b1804b1-471007a7a96mr9522475e9.7.1760516446097;
        Wed, 15 Oct 2025 01:20:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9absm327503135e9.2.2025.10.15.01.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:20:45 -0700 (PDT)
Message-ID: <c85d528c-6787-4023-8883-3519b7498627@redhat.com>
Date: Wed, 15 Oct 2025 10:20:42 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/client: Do not free client memory by default
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-5-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2025 15:16, Thomas Zimmermann wrote:
> Make no assumption on the allocation of the client's memory. For
> example, amdgpu stores a client within another data structures,
> where it cannot be freed by itself.
> 
> The correct place to free the client's memory is the client's free
> callback. All existing clients implement this.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_client_event.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
> index c83196ad8b59..f36fe0392ce6 100644
> --- a/drivers/gpu/drm/drm_client_event.c
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -39,12 +39,13 @@ void drm_client_dev_unregister(struct drm_device *dev)
>   	mutex_lock(&dev->clientlist_mutex);
>   	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
>   		list_del(&client->list);
> -		if (client->funcs && client->funcs->unregister) {
> +		/*
> +		 * Unregistering consumes and frees the client.
> +		 */
> +		if (client->funcs && client->funcs->unregister)
>   			client->funcs->unregister(client);
> -		} else {
> +		else
>   			drm_client_release(client);
> -			kfree(client);
> -		}
>   	}
>   	mutex_unlock(&dev->clientlist_mutex);
>   }

