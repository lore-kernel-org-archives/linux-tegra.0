Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8B82581
	for <linux-tegra@vger.kernel.org>; Fri,  2 May 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177792; cv=none; b=TIlLEfQpsnek1cbdwDM0g7BB3YBdgRIoq/qE81aqiEuInx2n7160NserG9X276eM0r6Z2R3fxqqzTVkhp0uYxmi4tUmi+qmDUin6/BjuJWaZoVBzeHHJ0vi1OXnL4fkc3H5OeJf3Y+p7GKFxgvhLxWYOqzQayrdCEtRhPhAjs8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177792; c=relaxed/simple;
	bh=ekJa/d94ESjfMuIQNVaqRWOsDNgRaf36C6VoqCPZFV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kj64vJFD1a3VG32d8zytDdvUvyPG9t0iF8pPqFzw1SbubJ4vfT1hWzPpEs0Wv3wLE4QaxP7b4OsebUf00wEqJHYAIEt/a4libECAePOotqqv5E+wiFii2MlwBYjp3PVtj4RJOJkQpA2SuJXYUtwkHVZuYz0WrJIWepRKaCZA6Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNYaepKS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNYaepKS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1143228f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 02 May 2025 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746177789; x=1746782589; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CaOQHqMDa8OZ46blFqHo7Rw/aRIi/u9Q9Wy1w1jQELI=;
        b=sNYaepKSdKb83a8yXkERuKY/EQ1QRoA15T8YMXgcfz+biHzAxFFRQ+ZTad52Nk7mEX
         wKfsBfkIDRFjiet42P4D/8h5WnWIafypeTCuHXW9RZBppR2n0Lw20I2pWEw5o1wjTuUq
         79VUgNdB/DHkeBDX2cjp94XrjqdOdGM/OC9sPlf+XaEzBFqtnJ1GA5H/8WWyDD/pFLxa
         zgFVMM8hwTqjwrYD1g8kfDde1OSIzzWZmKGVHGaQs196pPJg/EDzg860HrDR1dLr2Psz
         577/OjMCQ3micw+sLeXw+Qdthlxy/VgPOfp9K7ci/PQqhL0CcvccJxw1rO+cHQctICQX
         V9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177789; x=1746782589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaOQHqMDa8OZ46blFqHo7Rw/aRIi/u9Q9Wy1w1jQELI=;
        b=ht8C3hZcHQG4uLEh3ACP6wSqVhWhzdjt5c1i5fH/gB3Zzz8YgqycU/6wllZ87pPW/o
         ZazxJXXELGIIezAfEj1K5oEZeAg/d3TGVbkTwhFgPOgwv/LsKGVsiievjKu4QcdOLSxP
         AO4XObKNSCXrTYBgXBzIbC7fhTehHCevLE/pxrtRiAdLMqrPIho9bjt36z4v2fyRSXbC
         3ixy3P13MLtIA2M0moPLnOuRV5CP6dIcgM2v/9UaIoAIGE7y7i6PGWc7jDnLswwmu5WD
         jeUWo9YEWUOxTxrOx9kYtaDE7tjUGysWmJvGxAnYjLlvq+t0V6g4Z8/6SFYXcbUz5LcC
         SrmA==
X-Forwarded-Encrypted: i=1; AJvYcCXwzO6aDS0vEFM+yOL/npBtCYwZ6AXscfz3RUVxyx/9z6bUg1rlTFn9yF385sC/a0yQOt3qEwiODdsbDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP+jnZ7T1zM2D9wJzcyhj7kpx5wA/3Vy+wRcL5kywtGkCXa+EL
	FSzIH4Z3JoCeOYZmXVOq0iCzmO6diL/nOq0I3dsQTuAR5KH8WudEvztx5GmlZXw=
X-Gm-Gg: ASbGnctWBW/ShPJLSu6UAQIRyQyX+k1BJ8V2aqpNEGdwr3JHFf64vpbpbEfagTdgMsK
	4D8i2fqqImGU0IxIrNqrdewPo1+QVFHbDOYusMrSpWX2cmg4amK1QweZLJHUwWZnCk6xESrGIXn
	3a8Ue/xUJ7gtfDt2bGKzk9mV4/YiEmUNWWUD1eyv++pVUv1TF7R8aDyt9OmzbnKJ5gmL4o/pBr8
	+oa7fIUmfTvpgU/O53qFMOx/kqCwqHQoDkkc8V/VrgnIcRgs68hw8a6Ce8W4pv2k46i3DzE2hro
	6K4DtvrZwvfQHb47/5NRXxmfQc1JnMW0rEGO2Bst49XAfYG2JwWXWmyucWALkI3jQLi1m+gHw36
	Mm/I=
X-Google-Smtp-Source: AGHT+IHZIZQKxokVXfqMkIHYqovCFqCOMp1S59YaL8IoOtnobquxt5VlkTlRg2xMgElyl2ygcoOp2A==
X-Received: by 2002:a5d:64c4:0:b0:39e:e438:8e4b with SMTP id ffacd0b85a97d-3a099af1fbamr1268637f8f.50.1746177789352;
        Fri, 02 May 2025 02:23:09 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b172b3sm1609188f8f.90.2025.05.02.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:23:08 -0700 (PDT)
Date: Fri, 2 May 2025 11:23:07 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
	pohsuns@nvidia.com, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, sumitg@nvidia.com
Subject: Re: [PATCH v7 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Message-ID: <aBSO-wk5WPsWYs-V@mai.linaro.org>
References: <20250502043727.396896-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502043727.396896-1-robelin@nvidia.com>

On Fri, May 02, 2025 at 12:37:24PM +0800, Robert Lin wrote:
> From: robelin <robelin@nvidia.com>
> 
> This set of patches includes a fix for watchdog for it may not bark
> due to self-pinging and adds WDIOC_GETTIMELEFT support.
> 
> --

When sending a new version, could you please Cc: the watchdog maintainers ?

Thanks
  -- Daniel

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

[ ... ]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
