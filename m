Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC341E5219
	for <linux-tegra@vger.kernel.org>; Fri,  1 Aug 2025 17:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754068940; cv=none; b=nZMMEQQSwhlbhJfgMfvJNF9Km0SA8lce9sz2pRSheIl2TFLhb2RH6G6eY+aA+IGgGkzW2V7P2fTp4JtViPih5RLXIejwRmBQEJ8csgnghsCLs/0vVqdy0vs8q6ZGbuTfRLJ5m29t7as+KdWnUOwKJxQjAZ7+reK1y65wTAn8rag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754068940; c=relaxed/simple;
	bh=F4U3zLqHM8NpqW1pxXipEfzZi7+0Ycu/7mQRmHJXjNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jt15EM2zoNDUmJQCBEtaLoOnhZEdl1TIMT0LsU4ebNgfI0fbAg5u5nxA7EZgzrpkRycw1sbuT67i7+OlYnhAjkZ4DPbu7L6Tz46YNkdVJqsVa2DRM5NnaRiuJ5ioy7618XDf36IY6mVDOujE4eyhfj96EsS1q7MNZYdkiwE/3U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h1LrvfmU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h1LrvfmU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4561ca74829so12338845e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 01 Aug 2025 10:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754068937; x=1754673737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3M/PDNKda01rnV3OeJ4NocScrvK7XCljjn5Nn7NUvKM=;
        b=h1LrvfmUw0OzSRB7ak5Wyus2nhqdj3beFoANdHEK0uZycmnGOVSVVJXNMmqaqU22bl
         DFmjBQo5Bc8Q+8YBEuNao6NHaG8eVvLHUTZe8HpuZfUZCzL1Z4PAjumZ5BmvDX3p1hQA
         DPNIzrMHpeeFslE9ri0bFdkM5kSZf90Xpdi8RZmyFyP6l/1oj4h6SQf123y4XHAOnm3D
         LdB2v0AXA/6z0d5MQtxWjACaG+Pt8W5QamRAe0kVfCoBjajHXnTk2HGShraEqlHk+G1k
         sPB7aQ5Im3BxE3IxypSDj+LQi/bKdCc+C07por9MFdL85QUe2zclk33INcvYiGoFCAjw
         EoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754068937; x=1754673737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3M/PDNKda01rnV3OeJ4NocScrvK7XCljjn5Nn7NUvKM=;
        b=QE0zcXgJXiKeod7JARic5QB1j8Gxyvvt1OEiIMi3nafjxprtotQmWC2VbEeQj7C0R0
         zk54SXK+aqJ4D44M0N6DBhJ9BkqSD4kYZOlkT2CGYJ/K/G3t2kRG2qkQHQIyYUnxbaQm
         0YUn12LP9C9EFw1dVyj4wQAhL32muhPPrGPj4AtQzDthjmtz7mML271lrLKunOIc1kuv
         Lqr1iXxrmQGFG/H1boCXECOhlmoJ5BjIlVhkfpSiekJKEbPa9Tc27A/yYks5XzKUevIp
         pirvJA/V7E9nzW8EQch4olM3DlSt1QXOZjTDgMTvrXYBAbSgJKrLeKmSVZhofN9qkTPp
         d/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw4fZhsS6+J2xNvOGitnUqj3q6eH4UIRr0kORl+5dK3tmbhXEEag8YkbCp+88i7lS9ehFmBZAYlA69KA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzow7XASJONUOnavFrp8yB3uCGRt8nhNWASGe0pCQVoQEvmljeJ
	Uoyao0LjlUyiQI21rJ/0JIZyeiNb+ngFZgaPB/5cawWgj+CI6TnWw13TIoq1f9Wgvn4=
X-Gm-Gg: ASbGncuQ3LfHPx0MVN968mKnq8hliJwsyNOLqJ6NsfCRM2JQ6tOvAc7isJThkEjc3dJ
	sQai0Ry8M4hozTwZHHyOxmR95CBwnp36yOk7ZFlCnS6R1e5K2szOTDGwblVOUmu/gqISMS5TfO+
	ZgG5rHmqcvhsYtO1di4xgHMrWhAYtH2mRplHEcPLr8LYgRWx16lrkXDviOuKsg53i1SY3VL1Vkt
	S2ZItYZMW9HwAq2QmpftJpr0gxAIRJR1TEw0406XFIDUSzNIDgiz+saFR3hCvgq4LSbtV+VEzem
	IBvAz3i6GPJ23tJhlgIyaLmQWK+KZgJ9PZO/FQplfLbdNSqI5q2uuw+4uPZ5O00fWS8uYml0CDC
	eBXaFaFY0VYBfrEJq+WnPHPIIMPMbW4SHTWk43je6WG9X5voWY9x/H1on7HxB7g==
X-Google-Smtp-Source: AGHT+IEr7UdyBNz9mF08fNxf3R1Ysej2mqN5c0NMeUJedJILvrCdFfPD3tDpMYty7zL96HPHkqBLJQ==
X-Received: by 2002:a05:600c:1554:b0:456:1611:cea5 with SMTP id 5b1f17b1804b1-458b6b58472mr716105e9.18.1754068936946;
        Fri, 01 Aug 2025 10:22:16 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c453ab0sm6681912f8f.44.2025.08.01.10.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 10:22:16 -0700 (PDT)
Message-ID: <d29b1e05-f783-44ed-a2e3-585a191ec426@linaro.org>
Date: Fri, 1 Aug 2025 19:22:15 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] thermal: tegra: Fix dereference of pointer tz
 before it is null checked
To: Colin Ian King <colin.i.king@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250730135441.2078022-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250730135441.2078022-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/07/2025 15:54, Colin Ian King wrote:
> Currently pointer tz is dereferenced before it is being null checked
> leading to a potential null pointer deferernce issue. Fix this by
> only defererencing it once it has been null checked.

Actually the callback should assume tz is never NULL because the caller 
does:

	ret = tz->ops.set_trip_temp(tz, trip, temp);

So removing the NULL pointer check is safe here.


> Fixes: 6fc2e1a5f98f ("thermal/drivers/tegra: Switch to new of API")
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/thermal/tegra/soctherm.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
> index 53a5c649f4b1..53fa6099b67f 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -585,14 +585,19 @@ static int tsensor_group_thermtrip_get(struct tegra_soctherm *ts, int id)
>   static int tegra_thermctl_set_trip_temp(struct thermal_zone_device *tz,
>   					const struct thermal_trip *trip, int temp)
>   {
> -	struct tegra_thermctl_zone *zone = thermal_zone_device_priv(tz);
> -	struct tegra_soctherm *ts = zone->ts;
> -	const struct tegra_tsensor_group *sg = zone->sg;
> -	struct device *dev = zone->dev;
> +	struct tegra_thermctl_zone *zone;
> +	struct tegra_soctherm *ts;
> +	const struct tegra_tsensor_group *sg;
> +	struct device *dev;
>   
>   	if (!tz)
>   		return -EINVAL;
>   
> +	zone = thermal_zone_device_priv(tz);
> +	ts = zone->ts;
> +	sg = zone->sg;
> +	dev = zone->dev;
> +
>   	if (trip->type == THERMAL_TRIP_CRITICAL) {
>   		/*
>   		 * If thermtrips property is set in DT,


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
