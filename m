Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E461E5B65
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748972931; cv=none; b=p0nAcDgR0Rmg/nqV60UobRwGUjE1VCMROh2Weau/1Wxk8GKtPi9+sC+goZbS1uAjYnVBGCM0WnRXHJupL5qhuHG9oRt7QQ1+5q3kkm8MTwj4DLNkUqJSv/1cRMWeI8nfbu75+OdsjXPVJzhgN77Adk7s/JLJMtUdmbq3mXFt4rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748972931; c=relaxed/simple;
	bh=eEBuMoSNI7au+HNe76KotnFGWKYETVSxnFoLxaa7t74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJR+T33+v0fXypW8wptVrlCilzZm7Yp2xVMb/yoiSlo1z2+jfUlFQc1u4sb3mWP68UfcSHKrpK4aQh6NnnOj17yETN8Q3MPTm+lTPNoECj9uSCFITTyZxckErmUOT8GLaNZYKKsIgQ4Hqf2Z+gbIiViIEhHOuiP1fDVZj8BJ5bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=duz1kGW7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="duz1kGW7"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23539a1a421so32529555ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748972929; x=1749577729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZQvVO8nyC+ZKLyjCrtVBxSwB/yFvzMpPXbPJR/HF0A=;
        b=duz1kGW7PAtnkdkfCcjOIelyryshY4G4Jm2w3ktysiA1PSI00KLpQNpyKAJ8/Jg3ls
         byNUdz8Drt00ALRWVJmYZNV1RgK9AYtu1BtOswL6Bq5OlZ6WySPNW5C+bBCaDVR9tJyj
         SlVyrrKyYqaAq6mQpBbUBMDuYNr1Y0KFDG2i5HDmGDSfwilzchLn8mXT3PVkEIr+SOUa
         C3BNkvrbs5f0ycMCsgjEabxFCjW4HD29R35ZCzVXCkJUNxxWz6t0FVfI45fyzgl3IDaK
         twLNFPop8zJa7RIDY1inon6rGtViA5UmlMCDC9VhmrGzhoBH4vloCqHoQXTV1jyziYB8
         dVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748972929; x=1749577729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZQvVO8nyC+ZKLyjCrtVBxSwB/yFvzMpPXbPJR/HF0A=;
        b=XBhV3xfvtXWfNvAqFF5h22WlkaqLO2dGKz5dc58I5z8BllK9WtitdcRdQd7yPb94tv
         5ec36tVAzx2ZFqB+Q3bHkK6Y41G/xxYxP0OweU2SPvB5qXfUNhou1ZzV+CYZMe6dIiJF
         xn+aCPFg0E0Fm4Z1safPg7EFzjTuCyMNyFOAyB60yttBPpMXvWEru3pKmSqxeL6NOO5P
         1u4D1CO09FAx2nd4aUhRSU17y+nYRY56sF3FyPPtH2gLzPR12iXVbHPsP3VoiJGtB2Rl
         /Pe8OKUD+naDiJdaX8Ov8mFKrFdkVAnH+v5rRM9X/jImDRdmOctYTvGawkDZBt1sU/pT
         +gtg==
X-Forwarded-Encrypted: i=1; AJvYcCV2IhhvKxd0/O4dYCb2N2uAofNpH6cKDccbbKDd4n4hP9WPCvLC0SNSw3jr9DgoQJi51+/dqeqNIjlYtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmpqtUHKM9fqd3ha+IWUxe7MEVB8Ga7Tc0iqx2axMIPcEua0iI
	sA2IxfIGvX2+DZSsYlhaP7sV318MkpkT/SN+1z0F4iJZ5N/nWGoG4sCyUzu6icc1uw==
X-Gm-Gg: ASbGncsooYr2CIdLmpBcQSrIJiu5E/3pJIHAEyImWDKxrV/GAyPRgs2XbP74XPAVt/g
	HJsnKdftAb53BSNdso3wSXxjfWmDj4Hxae3JDZC2j1m2xkaoqL/bmuSyBp3rjlpnmY+q/F68kp4
	b0GUpWIoMSJfNI7jFKfUA8Yo5VvFDNRz60nDRSwhznM5R055qgzFc9qBDeYjMrVWL5MHj3ffc22
	vFSZMeJ+Ayzx5jro3yiToMlPdpsMAzBZioaKgXywLIFc82fo8pRBuR/x3RtzpnVvU/27yfngXbU
	vU7GwKIEwpwGkL0wRpqsbBiNWELeDAPkeU7G8uvKp04yittB/ux2s6WDQZTDflR1XhtNsaRlCBN
	ZfJGvom1GhpX3ypZHEiedFedMIE0=
X-Google-Smtp-Source: AGHT+IFw/hM9KjB2+YIvlfPv7TCR6YjgHHZTSPyy4qbS7jSH9/Uc2dPgZocX8nOAauHg/zfpx7Iegw==
X-Received: by 2002:a17:903:234f:b0:234:98eb:8eda with SMTP id d9443c01a7336-2355f762d1amr220323805ad.28.1748972928721;
        Tue, 03 Jun 2025 10:48:48 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc95fcsm89801555ad.11.2025.06.03.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:48:48 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:48:44 -0700
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
Subject: Re: [PATCH v1 1/7] clocksource/drivers/scx200: Add module owner
Message-ID: <aD81fLvQQOBd7cot@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-2-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-2-daniel.lezcano@linaro.org>

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
>  drivers/clocksource/scx200_hrt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/scx200_hrt.c b/drivers/clocksource/scx200_hrt.c
> index c3536fffbe9a..5a99801a1657 100644
> --- a/drivers/clocksource/scx200_hrt.c
> +++ b/drivers/clocksource/scx200_hrt.c
> @@ -52,6 +52,7 @@ static struct clocksource cs_hrt = {
>  	.mask		= CLOCKSOURCE_MASK(32),
>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
>  	/* mult, shift are set based on mhz27 flag */
> +	.owner		= THIS_MODULE,
>  };
>  
>  static int __init init_hrt_clocksource(void)
> -- 
> 2.43.0
> 
