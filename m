Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77174291C37
	for <linux-tegra@vger.kernel.org>; Tue, 24 Jun 2025 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775546; cv=none; b=V/cXkGx1l93PsfvtOHHgQOhj002Zevc98ny0mKP+QPxq8RCw2Bc3PlLYi+wqi+h1EG0EmPyI4k6jBwX5viez5Zq4QiuKjKoLE5w2DmyDgAPFt7dcds9+c6DXoi5oR72H6ZcJuk6f6JRf6VqjzqCAtqiUN+ad03X/xViYM9uZz2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775546; c=relaxed/simple;
	bh=/n7FMNMINwO4mp0WyIHGBmD2FtlJIjDt+/3cn/GQT88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjDItbsunBbk9IgMNHlACJU882pxoqZ5bwRYQtoxk3pNmR5/hPchcPc/HOaL6hz03dkMLBmzf7NPUgdrD0jwKaSZxkNKwfdApRwfuW79+IYJTz3cqI+y7PZPRJGAR39IC31MegY4G3EzeKvRe61laaBx0ThMvFogWCxP3R1S+vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DMmufwzr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMmufwzr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453749af004so3182005e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Jun 2025 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750775543; x=1751380343; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smIRAyIvWrWgWNT4Occwud1SoHjbpdF912MDUcyeXtU=;
        b=DMmufwzr2r8y0AA1nLFo/nDOAwwNVSjhbMiW7aiI7fYH7eDwSljfyUAaMemawNNJQb
         bQgqaHPinoVe39sPKwfvoXw3yZkEhYWw+6wv1VRPS1U2X9NoOXgcbF6lSnkToh2fZy/g
         lvrJwCl6X+3y4xFTpnz23soQVl8P1uyrb0NSO7JtLsahRpbprCbjtTGBF3UrRMJ+FOg7
         bfwhuI1VOelqCogt3KMP4ObMOA4wlYPhSbkflBNjDgfaZH3T/W3PpRTZtmriWk8hbc2i
         9Sv1b4iucgj7bGIA0+my5HAzSL/VAWqiXqs+9gwvSFAR9N7sKSxsVFnCDAyIe0lzyGUU
         X6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775543; x=1751380343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smIRAyIvWrWgWNT4Occwud1SoHjbpdF912MDUcyeXtU=;
        b=otgyOd7qtLX1aOQf/ZY5L6Lqvridtkh5UeYTqoTT0/gjPnoznIwHRAKkb9uMkhxzwI
         9iZL47vs2eKyKMV+9EoP7HSzGRkhPtVookgSH0LdkX0XW5Qszp0wc40rgEXUj4espuz3
         ob4GtioQkujUhwoC1VzT/e/YtxBheBqzeoaw24AS2aQrK1dAW+P8mjFKlmPaubd50u95
         4NQkVQp9f1Xxfc9dE/5V09OLBGtKz8ulR3LhcIJk61Fjb/WoeeutTjcDJP5qpFNEP1h4
         S4XgGHcpxS6WoM4q2vjreElrUFINpErRlJ6nKBKFhoE5wb+8rQGCgDWTW5YOhXlDs9/8
         2oZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtfuYGrHTklcwANigVQYRSzG1DwJn1V6LBwQ8Bld4kI0ly3U8muPcWf6Ro523RseA1ZnpvBZ9qeIdj5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWGf9xvwW41u1lkJZc1LGjK3t5UQkXn2hjLswM0JU+T4iQhiIa
	Knfd1vqema7b3miVGwnRQmExikx+8OHp/FiVYvXPOA3glPqAN4j/pWI+RB6V5MOueNc=
X-Gm-Gg: ASbGnctle13NQy4idC4y7+cDm27o4GXZ1TRLv4sBf0fS6vUm9ZLlSkmSBRoKt/8bs+t
	Nz+HcRP1CKbX1pOnRdMqBrfx5Wt+wc+0/K0FYz7OMXFOoWCo1KKo4aCykswzdltYpvZmhCNri92
	48IgN4hBVE682J36vB53Y1pTwr7fV0iHfNd0IDUTaejiHWZQht1E2cTbOn0b+ph4Q7+xXZYY1Yq
	Q8YZHLrKCXcBUyTjwMUavv5PWZTJGAVMZLeYGMQ+7xpkfl5pfb66XPSDpSRlxaD/KL2Q/UAOPMJ
	H0Hu35GMITFlytM6ocMriUXz5xdh4Q1WahubyknIBcLWVk9DLGAr8FRRUubflKv0ssB6JyjyPHN
	WVjY6/JY5FAomfKl9xPWj+ZlV
X-Google-Smtp-Source: AGHT+IETvUDQWVsb/wzbqO2lFNliysTWuRtBcrxUHsrBFmsF2UJ5OYfM8LC1Cq6w+Os/lZA54+A4bw==
X-Received: by 2002:a05:600c:1906:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-453659b8997mr148222785e9.27.1750775542596;
        Tue, 24 Jun 2025 07:32:22 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805cda7sm2123628f8f.26.2025.06.24.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:22 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:32:20 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Pohsun Su <pohsuns@nvidia.com>, Robert Lin <robelin@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] clocksource/drivers/timer-tegra186: Avoid 64-bit
 divide operation
Message-ID: <aFq29Fr5c2TAZOYO@mai.linaro.org>
References: <20250614175556.922159-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250614175556.922159-1-linux@roeck-us.net>

On Sat, Jun 14, 2025 at 10:55:55AM -0700, Guenter Roeck wrote:
> Building the driver on xtensa fails with
> 
> tensa-linux-ld: drivers/clocksource/timer-tegra186.o:
> 	in function `tegra186_timer_remove':
> timer-tegra186.c:(.text+0x350):
> 	undefined reference to `__udivdi3'
> 
> Avoid the problem by rearranging the offending code to avoid the 64-bit
> divide operation.
> 

Hi Guenter,

Arnd posted a version which seems more complete.

https://lore.kernel.org/all/20250620111939.3395525-1-arnd@kernel.org/

> Fixes: 28c842c8b0f5 ("clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support")
> Cc: Pohsun Su <pohsuns@nvidia.com>
> Cc: Robert Lin <robelin@nvidia.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/clocksource/timer-tegra186.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index e5394f98a02e..7b506de65438 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -267,7 +267,7 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
>  	 * counter value to the time of the counter expirations that
>  	 * remain.
>  	 */
> -	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
> +	timeleft += ((u64)wdt->base.timeout * (USEC_PER_SEC / 5)) * (4 - expiration);
>  
>  	/*
>  	 * Convert the current counter value to seconds,
> -- 
> 2.45.2
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
