Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F22113DBB1
	for <linux-tegra@vger.kernel.org>; Wed,  3 Jul 2024 12:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720009278; cv=none; b=SDWD5yIHg5P9fcXTD//c30pk8pmyTn6zcw/WfOonr7d/yQA6EsB09Ww+u9o/1GOpuq9sHhu1Z5NorQTH7avEIpD2Wet2MPtXd4iUSeDXUuCc7h34BOqdQNJJe3CzRAIA9AD/k7PNEWkrnjDM/PvcpjkylSUUgaIwsVgbsuRLCQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720009278; c=relaxed/simple;
	bh=cubV7PSPhJbJ+Qx4nqp+Dd4OkcCI8xjyljP7mHG1qOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyk5S8oezhbjbqbi3pZkYUHuSgj6lWc/bWmvVqenxHZfv/uI01Y8DpLB4oPq9PeOLGaCUoHb0qHnQydo/qdSwzOPErv8EVz1NOGIrQ+r4tvt++CLI9xlXoW/lmo/r9FjPe2aHD5bD2AMA28AIyZ05Ihx4/rK+rmFd5BaXYLU2ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEy79cb8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEy79cb8"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e764bb3fbso7142415e87.3
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jul 2024 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720009273; x=1720614073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+m8M3n1qsYckd6mSAf4YNSgVy1Uh2copyKJHcyhOiQ4=;
        b=hEy79cb8yCJ8LpfHgReutG402o3o3xLWz7STVx0R/B3rn65FjszZrjBQxYYH3MrhTE
         DQhYL/cXr7YJ6HOicYRPOEu1X7fR3qYTDxEMWg/Er2X2Ob59fqs24HQiHNBLyP/rnjPt
         l0kCQk9Rl2UtTp4wn4/AAoJNth0A1gayb2k8W7JhFus7uoivwhOMaaeF2J3m2b4R58NY
         rnWDwkUxkWij2fN4xabWLO8ff5qLOMZEvDFlir+T4A4DtlVFvkEslEvumD9Vljre0s3i
         yJeDMj9yfHLdbcXSB0KzPGUKBGOpc8hCHTz0hqwZB6yKnS5q64Ib4Y6DXZnwemvHgNgZ
         rX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720009273; x=1720614073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+m8M3n1qsYckd6mSAf4YNSgVy1Uh2copyKJHcyhOiQ4=;
        b=F1VFWTOVJogfC57vZ5YrNpYPM0TZ56c1cTxxkAM8luDLHGuXW1Yyz0OnawI7jRLNIF
         QRLTm6snnni7RzwnXGJuEwvLJwDj+5dCuUZqmwZo5x3q0lxby30IljyEuRXxgZWAlKLn
         uWHlPAqr2XodVKlySc7jM63P1m61qyyuZktRG/BtZ1faX5SE3Kgct+hDW5kF9ziLzgzk
         SEx52eBx/1gu50p3vASrVTaeduVz65Q3uf0iEa9vjbLzUjab0qumYxgv33WZ0rfZ8L7f
         6U0xZ6hrPAN9fJ6ier4OhXL7x15Hr1bkhxRJbnFLwslFwIYvCKdPfYQIjTS/ysMpzzEq
         oU1w==
X-Forwarded-Encrypted: i=1; AJvYcCWuAsJ/CiKb6+XrWe5gqhEzLQKMdD+KRxBAy1wSQTiqeUc3ETOYDwgzjLeYO+rfCfN1GL+9j9j44u6lHbSYnCKsfEpRxBX6MTskjr4=
X-Gm-Message-State: AOJu0Ywy1dLgfxaXWzllwpBUWASsPvtYIJSlBDLg4U1sJAGLcgz6cIl4
	0pajC77WNqgq4g65+Fm04EfH5Gao5DFqdlmd/0HW9Wx7fgyzhcAVsft6x8wYCrk=
X-Google-Smtp-Source: AGHT+IGoCrWnpI4H3vkYZIW4U5GwbaIxS3AV0bKKM6IK+U0+ym4oAlShp5iDrd+SuM0Al6aqGSLjKA==
X-Received: by 2002:a05:6512:3988:b0:52c:f2e0:db23 with SMTP id 2adb3069b0e04-52e826886a0mr8508503e87.40.1720009272232;
        Wed, 03 Jul 2024 05:21:12 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4256b0c19eesm243158405e9.45.2024.07.03.05.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 05:21:11 -0700 (PDT)
Message-ID: <47440afc-1b76-4dff-8c72-427103d7184a@linaro.org>
Date: Wed, 3 Jul 2024 14:21:10 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND][PATCH v1 4/5] thermal: imx: Drop critical trip check
 from imx_set_trip_temp()
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux PM <linux-pm@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-wireless@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <1890956.tdWV9SEqCh@rjwysocki.net>
 <2272035.iZASKD2KPV@rjwysocki.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <2272035.iZASKD2KPV@rjwysocki.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/07/2024 16:43, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Because the IMX thermal driver does not flag its critical trip as
> writable, imx_set_trip_temp() will never be invoked for it and so the
> critical trip check can be dropped from there.

And as a rule of thumb, we should not allow writing the critical trip 
point temperature in the thermal core code.

> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>   drivers/thermal/imx_thermal.c |    9 ---------
>   1 file changed, 9 deletions(-)
> 
> Index: linux-pm/drivers/thermal/imx_thermal.c
> ===================================================================
> --- linux-pm.orig/drivers/thermal/imx_thermal.c
> +++ linux-pm/drivers/thermal/imx_thermal.c
> @@ -335,21 +335,12 @@ static int imx_set_trip_temp(struct ther
>   			     int temp)
>   {
>   	struct imx_thermal_data *data = thermal_zone_device_priv(tz);
> -	struct thermal_trip trip;
>   	int ret;
>   
>   	ret = pm_runtime_resume_and_get(data->dev);
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = __thermal_zone_get_trip(tz, trip_id, &trip);
> -	if (ret)
> -		return ret;
> -
> -	/* do not allow changing critical threshold */
> -	if (trip.type == THERMAL_TRIP_CRITICAL)
> -		return -EPERM;
> -
>   	/* do not allow passive to be set higher than critical */
>   	if (temp < 0 || temp > trips[IMX_TRIP_CRITICAL].temperature)
>   		return -EINVAL;
> 
> 
> 

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

