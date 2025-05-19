Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3DE1C6FFA
	for <linux-tegra@vger.kernel.org>; Mon, 19 May 2025 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650393; cv=none; b=VghR6UcGSv07sD+AnML5LM3QmTZtxytzxZE4mgq1M+9FwzdXFl3uRYFKRymw01yB1B59DwX7IP4wsTZNCge4Oh6f3nOQfbyaSPI18K7sVDnTD/I5rws4gynzUC38dJNl0c+TqXhCTWt600o1wReDpJrRpjynJIxFGl3qH/yUVrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650393; c=relaxed/simple;
	bh=6T1f1gQ788CwCIndP7K5d2YwrhlQLWj57RrD8MAtP7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUdYDiPG3xD80pKQcsofCh1ZZn98A9LG9PI8C5TYUWUOuX+0W6kvxCxfCGvVQHL/eV+HPdEGhVUqKuoIGKJzZIS6Gxe5tXqmH9GRKEFuq/PaoP4YNv+M97cdP7noHpwZzfmeoRziyfgh7B8YIhydA54HQSDfFphbn/81gb4+pdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sWeoyF8n; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWeoyF8n"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30dfd9e7fa8so5240228a91.2
        for <linux-tegra@vger.kernel.org>; Mon, 19 May 2025 03:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747650392; x=1748255192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=94QENvQ1KWEG5NwI/w4uyuU8E14TEUfGFeGO7c7WDvo=;
        b=sWeoyF8neBCSuvdV+42RbR1GCnL48ocG3rxQtKbvMBbaVZIs2yt6esFFy12BewYbOu
         40eaf2VfRtvXa16PSA7ZKkX6zaMogWpgiwk5vdPP+PR5QI7LdFLrmiGw7EYLDTKeoL7G
         0PcjXVYDwp0Byyditw7zUTIiSnzVy9DX3uLXB0tez8LKgJy3fu8R7oNBIbYuY0KdJhOg
         ag4f/ZNMTrL3HwvX0rYu0+WGJC4mI5v8jY5c1nDChegHsRiN2YeXLvUUixh/eyWZGns1
         XIjK1N+WB3BXKfO7sQzbWi3qvafyHxwVPba7IS5k0Wk+HkiisNxUckwyufDyB3lKI1K8
         LjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650392; x=1748255192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94QENvQ1KWEG5NwI/w4uyuU8E14TEUfGFeGO7c7WDvo=;
        b=OsnyDRL5u7aTvL8JIUbdGj9vB7s27MssIPR2CNl/ujm+lUDD+DDKyhg+1p7MS5RuZL
         ek9dAzZY0pUMMucL4kCpbb2EdW6y02Vb0w+yMGaunGE6GK76aKxg6MwDZHILVTjKZHm/
         WVWRkzerTKeBdnermcuCMKvOC00Lng8VLiHrA/PCcJjExCI0yny79Lxzb4Sy97uxw6hr
         IuWJ6c308js49IN0gi7yBlPYedZ8VDfb74eFWonwADMpYk18rENNRE2Xne85holLjD4P
         sWYhiAszzESDvoBKVKC0ZG0XnTahgZlOBJjB+xFV5Eb6JzMwUxGuS99nqucmKyB+rXiS
         1TBg==
X-Forwarded-Encrypted: i=1; AJvYcCUbahhvFFajDs5vRfdiwD9Bj2BocF/nA7ZwWUwUy2Zcr4rGjETYxCo9v5FR9HUnGtf3rxiOPhz2Rnx1yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsjoorrxZHTDxNPU/gS0Xo/WJatEVsg/mKsgp7nqMNXvUs4rZY
	Z+Rl/fW+htRaKvtFEEFLFZMiagkInfl3DP9MCXGyonDyJSe4DN5KTvwk9uYb06puCicJ++pE8So
	4RHrw
X-Gm-Gg: ASbGncuZMV9mlb51o6yuXunZl93KLBINdNkylGkYqweKFJwlRaE6o0mGAmpP1kbn/tu
	9VOFqsnWGcyftQhA1nYANiobkoMIZSiaJk3LMYCdRIWZC3Jk6NeqStyPLOnjsJeVilRR5srxoqM
	k84hS/PWkC+EXr6eUfdNR3I3FgJ7gB/t7sqpf27EWnA7blU9bOYugQZGDRcTlazszmSLvgy7dZt
	a8mdopqUqHwl2G3zdBz3ECDk9mGP4t/LbKOnogizo0Sw/+a2stBx5tt5Tgh3yX/ihdh8ricIJ6F
	zwMaV7/6ej8GyXqzLDnCBZF7xSz6qamlVWimmptvFigergUCGSsi
X-Google-Smtp-Source: AGHT+IFOX0X2+R42qCuUGR5p/td3W4u1++p+fajp/DYt04hZBSF3cDqdXMoReTclZppoLGO2xeShYQ==
X-Received: by 2002:a17:90b:5710:b0:2ee:9d49:3ae6 with SMTP id 98e67ed59e1d1-30e830fbf1fmr18521513a91.10.1747650381025;
        Mon, 19 May 2025 03:26:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d1d12c7sm6314287a91.0.2025.05.19.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:26:20 -0700 (PDT)
Date: Mon, 19 May 2025 15:56:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: webgeek1234@gmail.com, "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/2] cpufreq: tegra124: Allow building as a module
Message-ID: <20250519102618.4thbahapz3lfmfo5@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-2-d142bcbd0234@gmail.com>
 <da080e61-4e54-4334-a239-1619bf8fea0c@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da080e61-4e54-4334-a239-1619bf8fea0c@nvidia.com>

On 14-05-25, 11:31, Jon Hunter wrote:
> > +static void tegra124_cpufreq_remove(struct platform_device *pdev)
> > +{
> > +	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(&pdev->dev);
> > +
> > +	if (!IS_ERR(priv->cpufreq_dt_pdev)) {
> > +		platform_device_unregister(priv->cpufreq_dt_pdev);
> > +		priv->cpufreq_dt_pdev = ERR_PTR(-ENODEV);
> > +	}
> > +
> > +	clk_put(priv->pllp_clk);
> > +	clk_put(priv->pllx_clk);
> > +	clk_put(priv->dfll_clk);
> > +	clk_put(priv->cpu_clk);
> 
> 
> If we use devm_clk_get() in probe, then we should be able to avoid this.

Not sure if we can do that. The clks belong to the CPU device, while
the devm_* functions are using &pdev->dev. The CPU device never goes
away and so the resources won't get freed if we use devm for the CPU
device.

-- 
viresh
