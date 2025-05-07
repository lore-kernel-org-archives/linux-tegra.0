Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE23D1E3787
	for <linux-tegra@vger.kernel.org>; Wed,  7 May 2025 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603486; cv=none; b=GDwlHE8CpQKkhnKrQPIDfhqxgrak7zkg6aIS/LhKZ3wDIOPGEKg2sdMp60Om7ifaC6Mf2LVbCbnOR2EDItpYLP2n6oqXP4r9t6eUXQoA7QGVrVL2CFlNPXp4gRAFr5FvK9D0I6zFPQWqIF3YWbjUL9xKl70g2BV/z2HtlK7OsMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603486; c=relaxed/simple;
	bh=7npp6hPVQ4yM/96OUj34mNQnuigGDI/MdlJq9LMAeSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRsIvqtv1zkzT3hHoldzX0LQ/rCANYIoBDmV3RZ1APutFNZfbTO2zTN3boQsosKEWO+GFk0A4Ladx8ISOxH+ktoN6+uhky/YbY1oJAw/njeVXFIKCVwa6ECURWTjCx2gKrNgayiQRrGwGLw7hsaYuDfNfBwHhEBKwItA/Tx6+es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXPQi0Os; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXPQi0Os"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so4025142f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 07 May 2025 00:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746603483; x=1747208283; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ku1Cd6liaJS1iLKgaFG0kdzf7HtFlMcgCf1BXc7L4Dk=;
        b=OXPQi0Os+ZfrAqN/E9Klo3GQjvwLQuTZDzVb8EI3I4uSZj7J1SPKTL0JYDbkHbUC42
         l/r/L8V3RLkyV8JaCp7uZ8KSW4a5VKXGUiOEJXIT/gYjgukikaULnOkQqzvdKxesF5+l
         w76eHPB9yS3NsfF7DD1pIU4fmWNNH/f7u01zswWsycSspOplD8tlRzSqqeP1RSQoQeJr
         NjpVAFMgp+Nn2fK8U2pe+lrctQ4E/E57uIAtTO/Qb30FiCwBqVTU/nuW7e4i4i+aSBmG
         awLV94yjBEPS8IcL4nKTAnlrhkTifkLn2AGOawWv1Gxbmd5t897KsN+a/XhVITLAAaK4
         WmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603483; x=1747208283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ku1Cd6liaJS1iLKgaFG0kdzf7HtFlMcgCf1BXc7L4Dk=;
        b=AxmA9s2nbN50Cr43w6sSvf7uLvvajHPeqjiMXPNFSizUlhNvMCM+y9FB1zChHD2M1E
         LCvnLnJz73acSY0Bobh2uOHguBI4eYvr+2XVP91UnIPlcp1LN3ftZxcAgMfZr7W7W2vt
         9k8bqW0B4DVciZKBteoz3BqOGbfYb34AsykwnF6tMxMD5EaXsCle1t08B3MJeW3PIUd0
         bi+j4YV0UHUdFXtVQZn1U1nHWnn6OTVLX8AI0cFklXr5QLrtvq9S+d0ql+52KV5s3KMe
         rTH60V/YmU1KjPWx1iyVfGoXuZU6hUG/DnNjsUecjlajVwfBIU/GRk51ig1Ng2AB1gt3
         Gz3w==
X-Forwarded-Encrypted: i=1; AJvYcCUJCZtgfHYVMpy1pejiW9SC6yk9J6no5VgGOgfR/MHUWIu1ZYwbpJf0WDTHydrm9MUyUNBE+/LdXb8TpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxPQi87yOrxSHQPTB6jEtJdKG6BB26CbP0sKWS/d9gN5HJG/qC
	Bf8/s7feTGuBQgac07rxCBDCxGF7OE3lI0ATbDntKqEtpp/CJfzEcsR5kZo6Rtc=
X-Gm-Gg: ASbGnctPiP9Fpj6sOCvIuq8RSa91bAhgvXQCLo/Gyz84nEyYmTWbaa1rONL2FCwqnhW
	dSPG8PqR8cCl6i41ozNG1noEEJWDfDV0ZkDY0nuDsjYfrWSZGUyd0nUug/pmUgmMA20w8JZeZBS
	a1ndPiVQHCuj/YTfq10HuO+YW+hiJ/3sIQSXbAX9ujjgceKKK87fRXAi72rdRywvbFsQ17vXIKV
	S17h+y9Ukp2Vz4f0atHBU9waP6MTgvd2wtUIWcmEB0s6IodAvZOltmw2AwhBLjhEu63EvTDG0nn
	Hz3d4Ei6reR3P1krKbnD4JfXssZ6VDQLxHrZjjVeyHQUQcIaA1TXSL9Sf/PfxtVXZPslTm+Pm1J
	84/4=
X-Google-Smtp-Source: AGHT+IH2OGqrTp/OeMgPGxQlZfnrGAyad5LXS0wg/MdZb7u/oyAnw+kFBdwrxcGQe3PnVxyYJ6CP0w==
X-Received: by 2002:a05:6000:1448:b0:3a0:b733:f255 with SMTP id ffacd0b85a97d-3a0b733f3d8mr119641f8f.25.1746603482927;
        Wed, 07 May 2025 00:38:02 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bb5sm15753969f8f.7.2025.05.07.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:38:02 -0700 (PDT)
Date: Wed, 7 May 2025 09:38:00 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
	pohsuns@nvidia.com, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, sumitg@nvidia.com,
	linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	linux@roeck-us.net
Subject: Re: [PATCH v8 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Message-ID: <aBsN2Lvx476ZO6Lv@mai.linaro.org>
References: <20250507044311.3751033-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507044311.3751033-1-robelin@nvidia.com>

On Wed, May 07, 2025 at 12:43:08PM +0800, Robert Lin wrote:
> From: robelin <robelin@nvidia.com>
> 
> This set of patches includes a fix for watchdog for it may not bark
> due to self-pinging and adds WDIOC_GETTIMELEFT support.
> 
> --
> V8:
> - Change WARN_ON() to WARN_ON_ONCE() to not spew too many message
> - Use pre-exist DIV_ROUND_CLOSEST_ULL for the same math operation
> 
> V7:
> - Fix formatting
> - Consider overflow and warn if happens
> 
> V6:
> - Fix timeleft value addition using unmatched time unit
> - Use u64 type to maintain the microseconds value in case of overflow
> 
> V5:
> - Print warning message if get unexpected value from the register
> 
> V4:
> - Improve the precision of timeleft value
> - Fix the unused variable warning
> 
> V3:
> - Improve comment description
> - Refactor to fit codeline within 80 columns
> - Remove unused if(0) blocks
> 
> 
> V2:
> - Fix a compilation error, a warning and updates copyright
> --

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
