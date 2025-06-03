Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20241DEFC5
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 18:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973868; cv=none; b=MjzOQqIDW+ZQoWgAheGZhqr1k0Xk7XNFPhBXfIVvYTL1RzRXmPrCF5ink9Kv+vkYPjSF0dqI/tWVvONjpRe+bu3Xw/2x66ZtBhD5pQKrOfgKnvcwGrd0Fe451I5Z7/2YaRqjI4drnx8JHNXqiRp5+GD4MDd+w7k+Wl8VQM60kQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973868; c=relaxed/simple;
	bh=o3opKOrfcTuzr4DqAqhaR8sfzX3Hm8/ZaGQ2oWe0ido=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxNY6CUYFouIgz8FcCuepwkugedN3+idMzfeQYRQe37jKwjWSdT/5J9kH2yavdAGwt6/IlEuFWR+6robPHRlnfnspjU8C8FnIFVvT6GfpDbbjMr6B5Axn3AaRRXXIUDTMH6bDmPT3PKzpty5dxbgY4SrvjJII8fB2rZvllmqX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1ujjswy3; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1ujjswy3"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso6924324b3a.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973866; x=1749578666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KYrpDXZnKMDiJldti/dMMJILacoHM1+V5NOSlkoGpIs=;
        b=1ujjswy3WpTlRHrnN5iBJN8JHL8nXTHGC+2Ilp+o/ai1WypKzLpa0HXYFoscXwtxzi
         ulOf22ptziR6TbYOCMDYMVc7j+EvxcRX78EPUNSAiDayxY8SehgZ3uFS1+kdlueeV2kH
         C5WW1q0JziRX/UfOTr/IiPffriZ0YMBXoP169BSajqL9FW517rClLQY/7i1hrZoe+yjg
         LZZ3C7LoQocAogY8oLuP4bRdb2+/C+4VJQO0oNbn3wumxxvQ2/e1ZMyo4kJM0rjzTQ5q
         f7qPRwLnLDCcjLStkWwiDGCjH10rEk9WsP9clU4HU2JsSzOMZMEA9u9SFb4pk7kggQrD
         1qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973866; x=1749578666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYrpDXZnKMDiJldti/dMMJILacoHM1+V5NOSlkoGpIs=;
        b=ZmjIQ93N/T9A7Hj7Pn2tO4G3K1h8rL8/n1XLx/JhWuVywbFxPS3ZhFEEws/0BbQiiR
         /NO/bkqHsQEoPhcAalAsZ2+DIfl8DOdQJ++Fxi/ppjI3PHQx+mIWUnzn6+cjY7Npf/lh
         tVej3bSr2crxKCbFIqEDW/1GXmOMIiokniyv8yvhBYazVT1OkdnXpq/jXDsOXIfpaBOx
         ayuEMbZQVpT10qqly0aBJ0uU2Z4XWXD5O9rv6I/9tGgj2KN4EwiWZjCPlweNNrRR1U0b
         sLZFZ2sAk+PfdUz1eIdPoKdMG7l0NfTB4Uf9OuwGAYtbw28HPW5I8u18XljSuqyP7clC
         EPRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe4jBnAGIGfs/boHNLs9rpB6eR+D64xYoZDNU/nOPJSqc8qTZL1G+p5qJxMO2jRQjsgaL0RyJkRCTXGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw89a7F4IIE8wLSgXDAmRF/RVcjprOJ+B+sbhhAx2c0nqX3lS54
	L3iHfEKg/KuvA1U22bQyuXEQZgdz0ckhjDghM//udWs90e2NKMrKBaiMbByDAYgdaw==
X-Gm-Gg: ASbGncv18wWAfPE6Ff5ZT09silAfU2oX2AeCGmyhvsH61TOPLXdWRV/P8JySB1mzjr9
	QEM1PTY8ECGsSmysTf+xz7IWnw5Oy85R4TCuz1tFllFUD9E8/I8/PJcRqSIsTCGKen9g0295dq7
	KUaUTWVBhLpHbDVS0VjPB1IEjNrF/J6iKxaaZ7J3Q8moR4TL5KQc5WTXlKQNK5VqJfweOwCvq+6
	A63IZE1SI5FJMIsckpUoV3wWh6+UXPAszhUX3ioy6JRZ8HMme74xITMB7CpDOM+ZIVaKjMw3Z3L
	83NfjkfNJfDaMpUpJ/Ify6e7iPTfD9CG3dJfs/rOMIuLyVrDmRTzg3S8ZRPeCGKjMboihY6Xd8R
	2+G/QaM535lKEsh9MSqQSHCE1yb4=
X-Google-Smtp-Source: AGHT+IH7hVHc0tlAgXxgFaCxYRaYIJQ3DQ+FY7DmQvhi6XPfShjmFssaz9Z/mtpKobWUSTQxJxN8MQ==
X-Received: by 2002:a05:6a20:e68c:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-21ad98b31f0mr31767222637.35.1748973865748;
        Tue, 03 Jun 2025 11:04:25 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe966d4sm9999195b3a.11.2025.06.03.11.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:04:25 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:04:21 -0700
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
Subject: Re: [PATCH v1 0/7] Setting the scene to convert the timers into
 modules
Message-ID: <aD85JdXveNWlWDn4@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The timer drivers are all compiled-in. The initial pre-requisite is to
> have them available as soon as possible in the boot process. While
> this statement made sense a long time ago, the platforms have today
> multiple timers for different purposes along with architected timers
> which are initialized very early. For example, a timer can be used as
> a backup timer when the local timers are belonging to a power domain
> which is shutted down, or used a watchdog timer when the counter are
> shared, or also as a pulse width modulation counter. Another use case
> is the platform user may want to switch to a timer different from the
> architected timers because they have interesting characteristics in
> the context of a dedicated platform (eg. automotive).
> 
> In some existing drivers, there is already the code to load and unload
> a timer driver even if the Kconfig does not allow that. It means, the
> need is there but partially upstream.
> 
> There were multiple attempts to configure the timer drivers into
> modules but it faced the fact that we were unsure if it is correctly
> supported by the time framework.
> 
> After investigating deeper in the core code it appears we have
> everything set for the modularization of the timer drivers.
> 
>  - When a clocksource is registered with a better rating, the current
>    clocksource is swapped with the new one. The userspace allows to
>    change the current clocksource via sysfs
> 
>  - A clocksource can be unregistered
> 
>  - When a clockevent is registered with a better rating, it becomes
>    the active one
> 
>  - A clockevent can not be unregistered
> 
> A timer driver can be loaded later because of all the supported
> above. However unloading is unsupported because a clockevent can not
> be unregistered and that will lead to a crash.
> 
> But if the timer driver has the module owner set, the core framework
> will handle the refcount correctly and will prevent to unload the
> module if a clockevent is registered. All the refcounting is working
> in different use cases.
> 
>  - A clocksource is the current clocksource, the refcount is held
> 
>  - A current clocksource is switched to another one, the refcount is
>    released
> 
>  - A broadcast timer is registered, the refcount is held
> 
>  - A local timer is registered, the refcount is held
> 
> Consequently, it is possible to unload a module which is only used as
> a clocksource. As soon as a clockevent is registered, the refcount is
> held and can not be released thus preventing the module to be
> unloaded.
> 
> That mechanism ensure it is safe to convert the different timer
> drivers into modules.
> 
> This series adds the module owner in the different driver which are
> initialized with the module_platform_driver() function and export the
> symbols for the sched_clock_register() function.
> 

Thanks Daniel for taking the time to dig into this deeper to help identify how
we can safely convert the timer drivers to modules! The series LGTM. I'll go
ahead and address the review comments on my MCT series and rebase it on top of
your patch series.

Thanks,
Will

<cut>
