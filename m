Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7204519C554
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973596; cv=none; b=ruyqlJ/CSiiZiRcnuWv84gyAmIS/GfkcU8ALpsrGM33gAiDLs4Qw5v+8B5012JFysEdJBCykQDPK7o6NCC3gwfxCf/007jGmRNAVGvdem0MOJqSfP3oE5G3Lb/3ToHOD0kJ6QRF5LuVwf92gOO9oE5U8Aloe4IO3SPzFw4UX+Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973596; c=relaxed/simple;
	bh=efXABUpEg2jTeK0lauA4E9OmQhJ6Xv++DX39jwcjhcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOCjGK3k9mL0ujtMKiz/Av9qxVTldHX/pPxmgg+9P61CYjAcQ2uW0Ukv2ogaxHqMJ/6dzmHxsDi5v8BmXcp9URfVUHlLJ5G3i6YReW4u284dImSSy+O0KqviT4VZZIdG6kngpqKMgAeQzOOrbWmWY/EMqsg4maMV7zFmMuZC/+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YBaM8whI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YBaM8whI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso116036b3a.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973595; x=1749578395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYr/06bN4QHJZrZIiya8DeP2xQp31cjUuHO8BvFHhkA=;
        b=YBaM8whIV8/I/+34vZHDrlxCwV2mGs2vrwbuGijUczcssaFLSvYPiFsoqNHMSVK8h7
         Nc4/eebiEyHCq/OIswZW96D/pTfRJLZyhQluBHbbftJwenOSY2oaXKB3DhzV8wL/O8zc
         hN8yZoAdEKsDQAVGt3qXiVqENldPhiHWDrE+qbYIpWRNU6z60DZXGQFf6esvpgpNnG/Q
         AavWd7g+rzn9O/LVBfGW9RXslTzRwcEfowppOHA3i9TFVDpXI3PmfbfvoKL9lqpbvtVL
         KpXEIqXgWlupKP4aVIS0HXBSDk2ZwiFoLN3D4z/opWvQ33+PBlSlSkRGkEwJueTROTpk
         OeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973595; x=1749578395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYr/06bN4QHJZrZIiya8DeP2xQp31cjUuHO8BvFHhkA=;
        b=dDmAhHxkdnK9WQ2AozWdD84YRTBnP+VGPe4xcrDbh4g/DNWus268i1ddPhBp5+stcQ
         ZgmXANn5tnOKpYwRi7vE7a3n7FR9/tEjGxrQ5XdlEDNlYpuzFrtqGZpBixHCapmpNyHC
         /+DNHw2iGHNx7kaa0hKH3YEHMMqGsImVjJ8V8PsQH+Ved5ABxuOyWDm1xiEpwaqYeyfq
         di1N5cPf96ndxr1phHakNCni0fiNWfV0OLlPhuU9MRrBFWTxIdmpl1V1Edhu5JE2YRUd
         lBzBZrFM2KzZCMYsUL37AezLGiYn2INjmJf4CylOp2Mp4gpSOqRioBNg+IWoKU8fGFHp
         yBzg==
X-Forwarded-Encrypted: i=1; AJvYcCXnsyehxfM9C79eqalxWEZ1ghXqDT06LTgPr0rOXy9Kv8Qy5sHGgRVdwzZxnN1FZABsmEEx8ewE6Wg/GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgev4Lr6iwcbsbAG5t/d6cJ1Ho/Vjiw3rFaBJMqoeffFxQnzPY
	ABZDk5npFJBTvtB6Zi8cqHIWLrlwyLIRN+Eyj0EyuLPUIF4+MMGs9gkRWthj/k0uuQ==
X-Gm-Gg: ASbGncv8suiryMCi9uBzdQ1YR2gmAAW4i4I7pf3NicNHr9968JRh3WHBLHPYtz886pq
	nx+xkmNjPN72Tsm9DM8P8vd/ciYc3sQzmm69E1lnqwzhd4idNV2C1xsyAZEHEWY8mFOOi/yhSrl
	9fCTc+b/fvHh70Gc7xEQnCb6eEwq2IWdcEa5EmDWofVx3GRnHOk7F8oK2aZIQ/p9q0GDJhGSiEY
	1vRpJxfC96h2opyLsjo0ecoS8uGEfpdHfb9SmObOlQn16afwgELyPcBKNpPRSzSmpz/MEKbGtR9
	CkPE0ABv/S39K3PPDzPuCQYlU1lgZAJVre32LhriZR8JYVyyiBHmeidyXCUmZ387xvSizSfcQf2
	H7L64QLAtb7AxwcffqrqJn1i/Pp4=
X-Google-Smtp-Source: AGHT+IGjgStLfRgl5mcLbCo1SeqO3sImaOglz5V740eKF1RoVh4hQTng1HI7HfjGR1PadljmDx9/GQ==
X-Received: by 2002:a05:6a00:ccf:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-747fe24f7dfmr4701490b3a.3.1748973594522;
        Tue, 03 Jun 2025 10:59:54 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf703sm9619170b3a.129.2025.06.03.10.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:59:54 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:59:49 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 5/7] clocksource/drivers/stm: Add module owner
Message-ID: <aD84FVFtggGP-FF2@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-6-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-6-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/timer-nxp-stm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
> index d7ccf9001729..bbc40623728f 100644
> --- a/drivers/clocksource/timer-nxp-stm.c
> +++ b/drivers/clocksource/timer-nxp-stm.c
> @@ -201,6 +201,7 @@ static int __init nxp_stm_clocksource_init(struct device *dev, struct stm_timer
>  	stm_timer->cs.resume = nxp_stm_clocksource_resume;
>  	stm_timer->cs.mask = CLOCKSOURCE_MASK(32);
>  	stm_timer->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	stm_timer->cs.owner = THIS_MODULE;
>  
>  	ret = clocksource_register_hz(&stm_timer->cs, stm_timer->rate);
>  	if (ret)
> @@ -314,6 +315,7 @@ static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm
>  	stm_timer->ced.cpumask = cpumask_of(cpu);
>  	stm_timer->ced.rating = 460;
>  	stm_timer->ced.irq = irq;
> +	stm_timer->ced.owner = THIS_MODULE;
>  
>  	per_cpu(stm_timers, cpu) = stm_timer;
>  
> -- 
> 2.43.0
> 
