Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1A28750B
	for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759137986; cv=none; b=W9XbI+qZIsuAphuiQCgublXpFF6+LrYvkIL/rR6AQ5o2rFr5gl66aJqDy24wPrOfiZEZzQVSsY2jzYhkVdR62PXBbjHFn5LKmMW5aubkPVgLbtSgGAXA4AQ9NTusOoY7tAkRErnFQhx54EJXDwEfgBoO+ep+1BP0eAfoh6rXmMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759137986; c=relaxed/simple;
	bh=F6QPMSQ0e3v6IYWGpsg1DAlGPrduv5vyeTegzDeIf+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCppf+7ueU+50WUBLvQMihJTQ9YMyd7iakm185ga4RoNGTpCuSYG8j56H+2TdhaqLCPMWdr6M19dcBe5GAOcX2iKXTcPSg4znk4T1GAMa0lQ2tgqDu00cJzlZsjxdYeoiFc9lXiqENYAfh4XCVSQdxMTGmvWew+VwX8Zsf0ECo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GICeAGSD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GICeAGSD"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-782e93932ffso1181044b3a.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759137984; x=1759742784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjBDdW6a6A4A7TeFZHGH031gzicAXAbFO5MjRo8D+ek=;
        b=GICeAGSDCIZr+G8YWm827/UMcEck0c6Xhc0zLQvCsfvCByug0NkDIiTLlgTFuidkrp
         miYr5wvib+HUmQgsfaR8TvgwkkUFjJyBx3vkGccWMdtzfJ3nYSCrCvkopmKM5NXpbAZi
         zjALvleaNxjrVycaqqZlN9Nf7aJbVzRKBjyYKwF+pBxYQgQKlAF4JF+0Yh6PtODv4XNp
         WhFqLItWTuscS5b+gUKlWFdoYczzpv/UsK6hyDn4TQaI17eAORGIQvjAuJl8IAYEFmzH
         OO1IckKb5K9jRFo3fQmfwHlnCU4b5ygbO7AWkNPVcaJQNNpa4TH7YP1fVwNLcFhsVI1v
         sn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759137984; x=1759742784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjBDdW6a6A4A7TeFZHGH031gzicAXAbFO5MjRo8D+ek=;
        b=vAz0kii0m2a7YvtW9EwkUOY4kXtGzG59jNGoyFtU2fDSkiWQpr1oraJqh6Sa8ioBIG
         75NdnH49UqkT0Wf4mDCJAoeSnbWITF5ZX8Ak2hRwK7LyPbhXMPspkPk5XP8IHFJAA+lf
         tFSrHymd/LO9m0h6A4MMRIfyoU4qk1THWjS2B0Oll9ylbyLM44XGGNllf/UQiyvT77fn
         jUKxriMcDj/Ku/tepo/4BsSAi3WzUhsH7vFKWjsVciNJS5b1ehNbaEEKYGp2RWlmPsff
         FRf9sB3bnnP3+QA4LhZGPbwZmKhltURPuR8mDqFZ9055HXv+fSlecmJgQBeZzwO/mIwP
         VzOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDZk+Ej+9lTQeakWZO04LH5fQdCgTcsCF3opmauoDuMJIYd44hNq33B+m7XirXhXp7Y/EcrQCd0iBiTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSE3vlkPT2mOEWsB+a9LFIwVwyj+qzlTvFFl+L0NR2A7MWoL2x
	ASGoK1Ucpr34SjDa4P9SN07yQqM9gM36F/Hf8O50g6F9oq9QVPzTFossPQw48/fFnflnHrt8GBW
	DCZhp
X-Gm-Gg: ASbGncumhKtcHocNNORkPh/QZ8AK0SkRTZW4ahqIFT3HkN+ksGi62Df+YK73yPJBcD0
	3wk4G59Z0p8WUx/GTylP7qfAnHUn6IQ7ElVc3PhrfnO83LuFMNALhul5BskuL67rPtbh+9CHfg1
	LGqXMol26bEZ7jREETyQKO3dD6NJh+CZiAelx6K0b3VLIUr82IM950kBPLfLGNHR4QCIothQi5c
	Iy678PePRoXSSy9wqGGeQZPn2R9qeojstfAc8OF8FQthMZoEoL2teO1eciJurSySVlJca7UV8Iz
	FDS0lHZhRKfNuot3OFE1lR2lxdDABNZMfYoQoizhWLPJarkuVT6ysQ8eUu1spy7XdZfeTyeY9Zr
	IIwp24FO/8iDuxuV4uAW108KNnttAnpRa6LE=
X-Google-Smtp-Source: AGHT+IGusX2FU775hDQyaDVeUQ2fzYFr/WVOzWLXyy7HzrXzVv07AdOmx8KqU7JGAyhS3O+CN7fWhA==
X-Received: by 2002:a05:6a20:394a:b0:264:94:3f5f with SMTP id adf61e73a8af0-2e7c131dbb4mr21160856637.15.1759137984423;
        Mon, 29 Sep 2025 02:26:24 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca29sm10479302b3a.6.2025.09.29.02.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:26:23 -0700 (PDT)
Date: Mon, 29 Sep 2025 14:56:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <luceoscutum@gmail.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Thierry Reding <treding@nvidia.com>, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 0/2] cpufreq: tegra186: Fix initialization and scaling
Message-ID: <20250929092621.zvodzktgw7ok3rin@vireshk-i7>
References: <20250828-tegra186-cpufreq-fixes-v3-0-23a7341db254@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-tegra186-cpufreq-fixes-v3-0-23a7341db254@gmail.com>

On 28-08-25, 21:48, Aaron Kling via B4 Relay wrote:
> This series fixes an issue with shared policy per cluster not scaling
> all cpus and with some cores being initialized by the subsystem.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v3:
> - Use more clearly named variables in patch 2
> - In patch 2, fail probe if no cpu rates reported by bpmp
> - Link to v2: https://lore.kernel.org/r/20250828-tegra186-cpufreq-fixes-v2-0-fcffe4de1e15@gmail.com
> 
> Changes in v2:
> - Set max freq instead of base freq in patch 2
> - Link to v1: https://lore.kernel.org/r/20250826-tegra186-cpufreq-fixes-v1-0-97f98d3e0adb@gmail.com
> 
> ---
> Aaron Kling (2):
>       cpufreq: tegra186: Set target frequency for all cpus in policy
>       cpufreq: tegra186: Initialize all cores to max frequencies
> 
>  drivers/cpufreq/tegra186-cpufreq.c | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)

Applied. Thanks.

-- 
viresh
