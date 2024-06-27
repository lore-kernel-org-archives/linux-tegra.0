Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DF417BB7;
	Thu, 27 Jun 2024 05:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719464518; cv=none; b=DSK9ujX4Bk/wWPFVOrThSPA5Th14uz30kBtySvjN8yGBkjanuIUXIv9yX39EZ3y8FamFfcnscxeDscm+SV4uQHQpqaCDoepNRleGrWuwKUFsQfJkXa7AhthwZ+4Yy9Jsa0EPFAxA5T+kvzPnBy9SPySX8FThAKSs4J1hUqNhI4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719464518; c=relaxed/simple;
	bh=neSvzffn7aVOZHHBR80gHa/jIr/IAwkAvGDm0NDaxHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JobiIUyrU+HleA50yw5CClA82/OHUVss98dil3sR5CSNQ91qRVkUf1E+OL3u4HMq+DBL0HEu1nu0HFSZ+0MB5kiQ4ZS41qVdaYS+J0ho7u7StOSLPreRtPNXBQbYpqxgwkxz4VmWVWKi7Y/p7dp9cTWm2AfkLEZIBAV7eV64rB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrs/sFje; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrs/sFje"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ee483284b4so825081fa.1;
        Wed, 26 Jun 2024 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719464515; x=1720069315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UXx9V3mIBIPJ0R/DpHVeLVStS2HGhaz/07TcRzXhw+0=;
        b=mrs/sFjeq8WnmWdNVyKgD+m3wiNOz3Ymtxdwv+n2KUONrq4250lxV/xaQmiEOxjPOH
         hG9BWbpQ7JmVdy74ovvAO38x9iWc3R1VtIWoBPIXDxlfH7wE3qVtzvwv7lN12uSGFFFY
         tW5/K4HfDowNPsdXHBZobHj76QWkDKr2hc6PNXOiGpDHIoWX1S7Wv52B1ucY4+FuhIDg
         S9VzsNh7BwRZo03vn5rV4K2iq+v8r1xW93yxAzNOz8WrWvoGybpIesg55exNFm3Q7bPE
         bvMFyxgoOX1Lc3BECuct/A/LQ7e49YnSFoFwoj+2Tg/gTTgvPaLwzj/u0pvXEEbUlFiz
         d9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719464515; x=1720069315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXx9V3mIBIPJ0R/DpHVeLVStS2HGhaz/07TcRzXhw+0=;
        b=moam+J2J8R2Gm8DoaksBMz3gfkZgq0tprY7koGk22NCkh/vwUa79P5LJedxCXzX+EV
         dfv81COxd1IcvURGUmsBv8fhrqfh5xxjTwcfrYEtxSbIGS9kF5lgY0os0cetAJEgFUKT
         99tUEQ/Z2WTCvSBmTFgrEXB/AKJDMTojapMHtknx7hR2AHcQVeJe/hefca8zHdTVdsHf
         fRJLWMGZF6lKV2YM0WmzxumisUMXAO3Rd5a9VSW43zj+StUiSldGr+/78DkSi5g6Hc7L
         /cYE64SX4JFGSXkur3dTxWWmKqs6vzMxN40BI0auTMtD13E689Kipa/0x4ynS0vmqaJO
         DGcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8Os0BqjXHyRtfmPuvnKatLwxukTTjsWQtfJ9ta0HZ4+MXmDxXKHpT6Gya3zKmS29TOmdhZctVAywm6FrpsCCQUIit5fzPhL0UyYDbO/RmOgAiPrYMc84+QdGKsws40VC1rvZvE7t/V7M=
X-Gm-Message-State: AOJu0YwY7cXSx7Trgnk1ED2p0A6spCKBHyF2xUircoRJqyReDOqs3VbY
	bcrPN2ar36kGQ/jvErIbH5s/1d4orDOis5vglx6PMqahQ8TA07DE
X-Google-Smtp-Source: AGHT+IGRWcJ+EBLHzrnk9cuOes9LkkVCvSwVRl6Ra+CZF/cW8kdVhXyyFt+q8ZeDUjuJjF4rRVvGyQ==
X-Received: by 2002:a05:651c:1986:b0:2ec:5365:34d3 with SMTP id 38308e7fff4ca-2ec560e8d60mr110765591fa.1.1719464512392;
        Wed, 26 Jun 2024 22:01:52 -0700 (PDT)
Received: from [192.168.0.103] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8469016sm46971025e9.41.2024.06.26.22.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 22:01:52 -0700 (PDT)
Message-ID: <3d8b92c4-9562-473a-be47-26785d621cc3@gmail.com>
Date: Thu, 27 Jun 2024 07:01:51 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: nvec: Use x instead of x != NULL to improve
 readability.
To: Tom Mounet <tommounet@gmail.com>, Marc Dietrich <marvin24@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <667c8a0c.050a0220.9e3d5.3b80@mx.google.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <667c8a0c.050a0220.9e3d5.3b80@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/24 23:37, Tom Mounet wrote:
> Issue identified by checkpatch.
> 
> Signed-off-by: Tom Mounet <tommounet@gmail.com>
> ---
>   drivers/staging/nvec/nvec.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e5ca78e57..814eb121c 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>   {
>   	mutex_lock(&nvec->sync_write_mutex);
>   
> -	if (msg != NULL)
> +	if (msg)
>   		*msg = NULL;
>   
>   	nvec->sync_write_pending = (data[1] << 8) + data[0];
> @@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>   
>   	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
>   
> -	if (msg != NULL)
> +	if (msg)
>   		*msg = nvec->last_sync_msg;
>   	else
>   		nvec_msg_free(nvec, nvec->last_sync_msg);

Hi Tom,

please answer the why also in the description.

The change history is missing.

If you send in a third version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
