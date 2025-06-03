Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5442C326F
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973693; cv=none; b=O2a7Mnp9KZDoFDqguL8lgo+qxPjgbbyj/4RcKZYvTVfPm0fjx9Ius8xhZvvpjLGZXZWcYxsr3iH4GyK0z0fFD050A+A08zbyAuI8QbizKTRwuGCPjNFp+TScbT7AR4Llbvz8xF1KsD6bMZjrkqsxEb+ExTD8FWVFVuPdjRaRghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973693; c=relaxed/simple;
	bh=2dyMbRz1h7s7edNrWCTXDbYuBWjwzW91GnsgeY0rtXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQtMYZ8zg1rVUYgdbK9ELsmkfvfLkh0K+hj37nmy/+50b1N80Azeo+33LReQfpq03IV1ZWELY+UcuIssZ+lVePoAYLO++H17jJ+sgy00h7HnGZfFXwstrJBRrL0gYO1ZzhnC0Px9T2skSkh+x3L61FcXT5jFtsk0Zr9kb4NG9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M9sg7lLP; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M9sg7lLP"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-312116d75a6so4948330a91.3
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973691; x=1749578491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=;
        b=M9sg7lLPk1EeherbHWIWt8jSEd1Iqy2v8XSxNICn72cIQDij7UlXQbLLzjGtkYPLdz
         ePJEiyIpForhngS3UGLObw2qCENh9/V5HAhV8HFAjv/HYQgcVYPguKDby1nIcoq4zLmx
         gMfjjrXRZkk9ZK67g07jrHyggnTcHtf6UZM6SnUWy7yvwncFMcXfkIPY1wn1ttjibkOG
         7rmOXE/rAhdgpvsN3Mr+NtoGRUxsbTD0djzgl3xrLvfdh9BogOMi9eDichX0dS5yuTKX
         gouv6iIY/4MNHy2vp5Nf5Raf9vgZCqU6Vm4NrcvyRQtcA8rfJwVwdVmFxkJPIZNzx7Vl
         K87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973691; x=1749578491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=;
        b=gGF/ksBpVQP77ZBWMfyLS7keWzpBVIIaJDAxCAGZtSAP9MF+FN0NGdkLds8yNMr6fU
         PrrHvIEhabWNc7fPA2Qg9exMaVvP/jJgVgenYOI9PlPbxDwgest+Ty7gDsXmsjkHl/TG
         MfHXepqc2T3tVnElSxKNNWA+tKTYJMTJlbHCK23oa7xIAQt782M/KCXbLemK9DJ1T1aV
         q7XUjKa6PxymmieazH73dsKXRAmlYBTrMXlIwCUORz75JO+U66rCpNfohjX8jRKzNuL0
         ++OUG0OYyQzHZvsm1tiV4g7w77QrWi6ulqNfWhETCc+W4E3w8XdfemAV/sMC/maaqGeW
         JJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP7SlfniLsmJxMob5lds3Nvt+9kuH3J3RzICaBfMw+sq4jMnQ3OYhDD+znVwVNbncXBXGRaAvUOU1OLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyltXyfTVrGciJdvAibSISM1QzEUwOklasHQ428b16iraVccC4o
	zUTbHVDuoYSyXTE9YZTG+WBehoZdTf5O7CXQUD5karPLuWbEsREM74iQ+rGXYGZXvA==
X-Gm-Gg: ASbGncv7SGbLQlSjudz32+Y2BUdsJgkl6djHvRgXyU+7wWZWmQEPnzrieI4SX0jRn8y
	m2diGX6GUugt4HMlGdp1dXSLFgpjOq5fl7o0xxbYDOyOkKjHSSDxUz2qndl/5bXjx7sxuhM6zVR
	lrd4Sz2txxUSMCxkNuyMmd+XuWxNEd4RnOIdkndiI19xL3J/O6qQOyc4EeMSPNRZ/mOcmlOeSVz
	eQWpylYbSBi4tFyFXuwNwN9Y9YJnQ3Zn7fgMDdCRo0sWRgVvS1BjClEoEPwNev+54O4wqKsqbzk
	5/FDFOyFaHafTS0xA6Ag/kS1JrsdMCLw0z4Z1VhtixLkOCuy69Ap/4NMjXnX3170EkoVnBN1YeO
	8qj7ffEm0LyfyNxN48EKZZRAX26E=
X-Google-Smtp-Source: AGHT+IGJVe96mQDhzEhZqYJnC27O9vMFUAoTp1xS/H2NANso8WpCr6YJ9fd9Q8qaZg1NI2W+7g1xJw==
X-Received: by 2002:a17:90b:3f10:b0:312:f263:954a with SMTP id 98e67ed59e1d1-3130ccaa125mr73097a91.5.1748973691331;
        Tue, 03 Jun 2025 11:01:31 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e29f899sm7572695a91.6.2025.06.03.11.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:01:30 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:01:27 -0700
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
Subject: Re: [PATCH v1 7/7] time: Export symbol for sched_clock register
 function
Message-ID: <aD84d4WArf_terBP@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-8-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The timer drivers could be converted into modules. The different
> functions to register the clocksource or the clockevent are already
> exporting their symbols for modules but the sched_clock_register()
> function is missing.
> 
> Export the symbols so the drivers using this function can be converted
> into modules.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  kernel/time/sched_clock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
> index cc15fe293719..cc1afec306b3 100644
> --- a/kernel/time/sched_clock.c
> +++ b/kernel/time/sched_clock.c
> @@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
>  	return HRTIMER_RESTART;
>  }
>  
> -void __init
> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  {
>  	u64 res, wrap, new_mask, new_epoch, cyc, ns;
>  	u32 new_mult, new_shift;
> @@ -247,6 +246,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  
>  	pr_debug("Registered %pS as sched_clock source\n", read);
>  }
> +EXPORT_SYMBOL_GPL(sched_clock_register);
>  
>  void __init generic_sched_clock_init(void)
>  {
> -- 
> 2.43.0
> 
