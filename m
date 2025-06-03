Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F3B1E7C02
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 17:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973322; cv=none; b=ck0vYh3SWGlqSweEzXQ+jrBXllOc81pUareFqMz20pj7Ds4lgd1AYJKcCuNeNZOxRHD4AEg+GjYY03AisblHgvD9dk3uW3rDCU8iZ509ZR27KpHUZ0YkXByVhQKPV3JYmtwh6vbEP+BvXkrnQluQJCV0NlEI5aJG4ztQ7X4f0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973322; c=relaxed/simple;
	bh=Zynt2xYe4yLXyl+ZNUkX5fnAcUYRdDyO5jFQWOfl0z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLxqI1aly0nLBdj9SXbHfNzFMV7uHvxuGXdVuLSWAcBeremwyCuRzVtO0MEfvfC59aJ7yMWep56NQSxxMR5mOJH/JrzAt1+18XazGtOb5BLILl3R4il18fOup15Y5D7Wq04uMNSzfgFwFoW2ooxMHgNl/Jfwu/Ycc5nzUobzYUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uai4lAgN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uai4lAgN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23526264386so42508135ad.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973319; x=1749578119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=;
        b=Uai4lAgNjGyKwfWkEPE2cR3ZTrsSVshwOqYsCF+PlZ2RqV2VP+FoWgmCmEIFuYnu2b
         aF9c+OQGaqOPbQb403yHwjMECDOzH9FOrxUm2dCBb3Yy2ncGOGbkKeDThJt2ouE35BOm
         C20LcYOxWlIKeU2m7j8paCifnMt6xe+UbAD+nuO9dkyrVN8pl//y8rNrzIhWKQWOXSdk
         njYQkkSvd6wAEYXn4TUTN+77V7oaaHk1pKTTyE1BUdO02cOVySY93zsUEkGeLeFwDgbO
         HUOaVi+H437sW9/LPjODC7iJh1yUDHaapqDRTkJVb67wlYu3RCBMbHbzsCXW6TI92ZUI
         0kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973319; x=1749578119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=;
        b=NlJyAzL07RL4Zj5/y24m5Cbpx6d+e1AmUkqrl/9zitoo9CQamF3z2/F6azRtBH5x17
         KM2lKZTdG8phbiW7lGsFE9vOIj4tvZTNysk8+f4JLFBVffUAOjjJ3vZk6gxXvbQ2G7tl
         m1TvrUABDyH+bBIlcfih2ieIJMiIHIDIU/8D+9b8JV4e9ICTAkAd5liUzOjuLcJ9gNOJ
         dQ9CpRgW2HeRiKQkJoM66Dd/r5uEi/rwRGAU8jHl3mX/6Y+tU3JJQs2N6NTik92Tl7j/
         jDPVUUP152x1OKVwdSTFHU4jtMfg1UIiOk5ZDYRFJcn6qirUQp+ct89XMZLThd09uo6b
         qb5w==
X-Forwarded-Encrypted: i=1; AJvYcCV3LEy943LRuUJ1h5hlZwERRgDkSytBt7XPIAcJiYnQkVekAc+ve73lrcqDvr6l9Ni7eSRdCFRBfI/5fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy+5Xp8kwaL7RtcrIUi57V1llBspn4w6jBy2JhLtJJgeaath2n
	FYRtQn+GsE8X/AiPoayXh3gUITzR7LYR0XM6N2Qfnn2Cts7mc/7mhrYpMPlHG7NUqA==
X-Gm-Gg: ASbGnctGqFrr67t/pKU49/5OzTtW3pjhYyP0MBVWwzGhOSjQzOw+Sm53aplaULbcvak
	3cxCOIJropBqldUWTrQI8Ol0IhfAvYo1OXrRDaL5wDFioLHA/S+r9GjFKoS0/qigtCGROUq9CBD
	91+H6doOIHyl3uSJ2yr7bp+Fu2xA0myPBJvouRJYea/yteMArCh3tYwLIAUbdZms3uVFn6CWvrM
	n9nUWo1rrMq4Y2ZveMF1OlOXF0Gcw+sPfjaZOssP+QDG/j5DqTys3h1TlnQK0pSfM3y9UgKXFNA
	4oAddrTmgsmv/ReFZh0zX/BPCMA0DKlGUEcZzSjMK6sWcVDHmBfYcHWNnGoMNqsaO+vYMav+kgu
	Eqf4R5d16gtHFCv1xEY+MMGrQAqM=
X-Google-Smtp-Source: AGHT+IEL8qWQXsZH17HCYlbbIw9UGPDhlEkxpYMP6+pX9reecYXFMezlkTqgJADRlqe4EFkksHLW1w==
X-Received: by 2002:a17:903:b50:b0:235:779:ede3 with SMTP id d9443c01a7336-2355f9ef557mr237428345ad.41.1748973318650;
        Tue, 03 Jun 2025 10:55:18 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14bcfsm90207425ad.236.2025.06.03.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:55:18 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:55:14 -0700
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
Subject: Re: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
Message-ID: <aD83ArjAx463xOx2@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-4-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-4-daniel.lezcano@linaro.org>

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
>  drivers/clocksource/timer-sun5i.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
> index 6b48a9006444..f827d3f98f60 100644
> --- a/drivers/clocksource/timer-sun5i.c
> +++ b/drivers/clocksource/timer-sun5i.c
> @@ -185,6 +185,7 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
>  	cs->clksrc.read = sun5i_clksrc_read;
>  	cs->clksrc.mask = CLOCKSOURCE_MASK(32);
>  	cs->clksrc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	cs->clksrc.owner = THIS_MODULE;
>  
>  	ret = clocksource_register_hz(&cs->clksrc, rate);
>  	if (ret) {
> @@ -214,6 +215,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
>  	ce->clkevt.rating = 340;
>  	ce->clkevt.irq = irq;
>  	ce->clkevt.cpumask = cpu_possible_mask;
> +	ce->clkevt.owner = THIS_MODULE;
>  
>  	/* Enable timer0 interrupt */
>  	val = readl(base + TIMER_IRQ_EN_REG);
> -- 
> 2.43.0
> 
