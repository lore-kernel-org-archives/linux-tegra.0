Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D4F309DCB
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772880; cv=none; b=okz7q/396eQ0psz2Z/Gc8gpZj5ZFRsmySIAhweNrK4VnnYCEJi5a0NOdXDy5ONx11EmPKTxDLAJ7HTY+aS8d6Hp+b3iNHDaAMSx7YNWg1uXjNQJvmqfAYT70amVcxb9dhbe3CbpknooDwgRVmICxGWkxz+qG+JNPlIQvGo63QBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772880; c=relaxed/simple;
	bh=PV0nu9hpPV+PdL37EjWKyESOoKW7BglfhP4iUdE0IM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dShOs8d5rJ+tTcrBwtbJnt8h93URjCnt3rRdmNvrMfdia8Olzq8JTuT+V/3EOjM7dOl+OwVD7E5yxZ/8CLVwMrO1uwfKxlexPlpwI/9Jd5ICaVpAddvphfcyYR+h9gjyUI1zfrt5mw0gpgHEYwDeWk1VYM+5UqQdZspHYXTdsOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZOP6MOQ8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZOP6MOQ8"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so2026924b3a.1
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 03:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772877; x=1763377677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=;
        b=ZOP6MOQ8viMXp+whHMIuW+CMg2hu0pQXkgyYI8k3GLd+x8dAKuwj139adqiERa7q2z
         Kx1XSXD0qcGppkvALKE5yvXAy3yWZM+SWUEfT5pM2cvFMjpwgMgJogSVv5JhK/Utpm6N
         3RCqf9kscgsLLaSAkbf1oAoNGVtnVLkoOBn2PxhmoduepLzAFxwNsf+5Z4as3RJHqnQm
         5CcX/esJPeIG/EDFgix2FsucaBn6sdzTcvwlNlyjVuNJTYrSCdtaC8ARSE72pTFyILXi
         ojlsxRFMznyD2xp9VNm8+3mWde8tfTY+bR/UTg2M3N3y3qLxoeUjJQdgQLrndqUpCnZ1
         AS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772877; x=1763377677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=;
        b=JcgnpJSpG4tO3qLci4qppJPS5AV5KCc/DcAKOjxsjU4KAUyf4RyCXHdtooX2b6/Ja7
         WVXh8+C1VD3tPw9c5Fm7dUD8wO9tHmDDV2Djp5A5er1lox8kNBRZtxHDlDOu2cLcCB6u
         8paN7Wm3mAyNzJKyWGrI8ef0XzTRUXrZDTFvvfNFFRxs0yXCONIPxdp2/CUtYFZmfjWv
         kvCvGd3a16W0jcOi55jf6iD9HBPExZdXYXI2mrBUUoeiLUjwEhLNCgOSO9kC/UB2OEaB
         sZd90fYSRs8PfXEsqBgxktnowC7RBzIVU8ckTdhcFR+ezART+eeW8VlNFUGgKT/4YNcQ
         x7Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWQIHg0Hf0lLRwY+fv7uOu40GDkV3tac6I0RO+fRSJyzXxZz3+hCGLRQxn9/0vO/Mz9jRdrPyfJauAiSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlshbeRIHxI/j6NPnyDYB6J0hYPYsGZsGefh/QtkS3LImDws3s
	v8vqfVYcDfO6EXgvEG4sqxzTVjz05RNVsKGnZL+8fXL7xCN5bAT24Dn8dmrbQaWLFdI=
X-Gm-Gg: ASbGncveXuc9rPlF4zcfktsYw8HMh/oOKbCL6K2wM3O+kEbFoaJ7LqJykFOt/mLqKKJ
	XxyvUxWAt8iky+Dj4kWGGtjSv7zkK64p06b1ZSNQ//i41XIoJjbqb+NGl1Y1iYxK37joQHLORez
	+aOLXCWJ2lu/wFosnL/qO+ytZhppEmP1XOhKkSY2a96vb7GSXNckTc+KinE9YqjJFoM03amGaHA
	tInaecQ3srPwt2EERcrzEqurTIOz5/Q099VHOIPwhXCCRn/hagrVCMNksQftNFTHlk9awTafciV
	2RPPJaIG4CIeU47OwuJfc1v3spseYf3dpGp+CWrmI2OONSP7feI2pAVc5b8Huzg+v2jD2Z69HHn
	nwQ0YGwv/FvsMMIlid4qMb6+MBL/j9sGNI4qSpz2Vez4Dc0kaeichC8axU6MO2foEiuYA9pifRT
	75x5hFjlWydiA=
X-Google-Smtp-Source: AGHT+IEI5dvtjpf7UreD77ujcsma8Qc91uG0xXgrZUKvQ1Ri3S/fmPHsBQ3EzHdR5mFgTf1mYnto9Q==
X-Received: by 2002:a05:6a00:1990:b0:7aa:2d04:ccf6 with SMTP id d2e1a72fcca58-7b2232f8c80mr9070041b3a.0.1762772877004;
        Mon, 10 Nov 2025 03:07:57 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c09cd6sm11397368b3a.23.2025.11.10.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:56 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/13] cpufreq: sun50i: Simplify with
 of_machine_device_match()
Message-ID: <awphoxojc3benzdam47mcx7pqty26ohrwpgv46kimg7nl53rqc@szq3aqjqsbrc>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
