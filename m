Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129121B21AD
	for <linux-tegra@vger.kernel.org>; Mon, 21 Apr 2025 05:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214361; cv=none; b=KBoxCTMLLD8TAKFhcqj1ixIAmDBDg+BMrW57F8GhIC1zbI1y60vqgcDKpUdaQ9YbExv5KWHLSjzWQi3UgnVhErGIANgTkztmJazqyOT6/Mw9d777l+q8jYrbglBPkfPuBQTZl6Xpdt66z0jglHPCllYfk0zzXVtM8yza9B0ll4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214361; c=relaxed/simple;
	bh=2HE3Fe8IS8uFDje1uEcxrNcaW/qTGc8B5ZKasfwqE2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2VDsCLqZj4a24MQTLFVVtqG2cdbbMrcaCYSEOCY/p7JeeYGuwHBeRz8kanL3lwOheDoJJPEZalQ34TUz3g8hTSPMiiISGzs4uoEcH+QIAfmPzKibVMedHX3y7ha9zWc2kwIII2zPuZwx2pzHdbG6/NpeM9Q/8bh6+XcGwaqndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h4OHjofw; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h4OHjofw"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22c336fcdaaso39584565ad.3
        for <linux-tegra@vger.kernel.org>; Sun, 20 Apr 2025 22:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745214358; x=1745819158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JiF5vLWEUSl9osYTKQPJJdhSYAYke1l1I5dNHOP/gJw=;
        b=h4OHjofwCuvE4SRB0k+9qg1hGYC5F6wSvsGf6Jqn+HG9nS5RdcXIYIi0V2WI6MDy4B
         ITKFwwHo0k836OZj9YbxzqqQM+fgLWQxyLLSsJYRlCC2lttOCd/RX234shkjnG/MNUH1
         gQn9VuJwbmaVPonT8DqOvVGOkrjPh4oSzm6npGT4eUiOc/kBl+Ao+iM3o5x6sfMwSSGR
         lURqiwbUXFuJIun8+kSkju9UcaJ0srX/KrYzdIZXP4r2PC9fGQzMIfuw1kiXZMSQoPoj
         RR7YEXfenD/t1TSIlzX503xX+/wdn7InmdztBeIGs+KGHm9DUeUsHe9fTKb7XrvOvh6/
         SRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745214358; x=1745819158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiF5vLWEUSl9osYTKQPJJdhSYAYke1l1I5dNHOP/gJw=;
        b=mdaUPmD86FD/Kd+lpD5vBxxRTk8WAgEj1D5UCsfWHBYxFfs9bMzGXDtR+vbuVyi1cO
         yYzNA+9yNjx2ozkVVh4xg5Kiu7kS3A2Dyz5CB/8HdbliJ/QvJIfpZpPMAjWFmxxCGxNI
         Xks3MRtwkmmIp5mSuOkDOosDqfMyQa7rqOiMxFL6yInUzbKdBZft5tLpDqX96XFXlB/3
         JjoM68q9YxKA3CAR8peil5IRqi3YWcT0uSyDetaOXEIL/HbsP/1CPYubVgMa2zkvyrpT
         JhRTF4ZGOUnwtAR/6S+BJnOcj8sZSvbamSnfF4HLK90y8BKTYxyzD5z6HLb4pRQwBZvT
         YRrw==
X-Forwarded-Encrypted: i=1; AJvYcCVA5+/N/BhxeVNaW5187Tr09ge5c2bsaebeHy+0mBoQFoplhTs+0500q4BjRSYp+ktROk4iC/fewfYwqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ4eZt+H82mTPGYiWXYS9lP00gwwsZdkxePb5EKKHrjNpO7OVK
	/8PEW9G8Mxccu7/21Vnpk55QFvdLWVsP91QkH2IK0oqbWu8gRkoGx71g8kEmqSA=
X-Gm-Gg: ASbGnctbG6JNENtLUMdw2fLOTh/OOiEaR+qCUEMbWrjQqa9HlSOgH/8sJDYv3wj9A8A
	cvwAlJe0PwSgBTEl3/PzLmzLWTf8xA+T+AjPsGHQqUw2x1Fxjfn5VGXpukFS46YuuygpLhPkmIM
	ypa1oF0uaV2VkvwGjo8C/8sFjrstrvdkcgap5DIGgmLYAQg7N7oG8kNqRfy5Dmu277oJd6+j+eb
	FgtVQRkC4sNt0kyZQd08Hh1TXrQyWY6BEnrY+O6JTWKIMLyZWyREqeDUd/BB0pDSk060YPQQcIE
	L32JzetW0gxPdGUYXuFocc7q+uTr9MrmJFIM/6gCTcnHPaQO/SUt
X-Google-Smtp-Source: AGHT+IGeUEeBb47V0Nh+BOpd5dfBayregAGfFePL9F/iw96tYSPsNEJrFFau88SK8PPVPGJCOb95dA==
X-Received: by 2002:a17:903:2352:b0:227:e74a:a066 with SMTP id d9443c01a7336-22c535c058bmr161892545ad.28.1745214358282;
        Sun, 20 Apr 2025 22:45:58 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaaf2sm57260765ad.13.2025.04.20.22.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:45:57 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:15:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] cpufreq: tegra124: Allow building as a module
Message-ID: <20250421054555.oavale3xjqlrc236@vireshk-i7>
References: <20250420-tegra124-cpufreq-v1-0-0a47fe126091@gmail.com>
 <20250420-tegra124-cpufreq-v1-2-0a47fe126091@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-tegra124-cpufreq-v1-2-0a47fe126091@gmail.com>

On 20-04-25, 15:42, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> This requires a soft dependency on cpufreq-dt as this driver only
> handles power management and cpufreq-dt does the real operations. Other
> than that, this works fine as a module, so allow building as such.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/cpufreq/Kconfig.arm        | 2 +-
>  drivers/cpufreq/tegra124-cpufreq.c | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index 4f9cb943d945c244eb2b29f543d14df6cac4e5d4..625f6fbdaaf5fd774e3b0bb996eb7ce980da41ee 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -238,7 +238,7 @@ config ARM_TEGRA20_CPUFREQ
>  	  This adds the CPUFreq driver support for Tegra20/30 SOCs.
>  
>  config ARM_TEGRA124_CPUFREQ
> -	bool "Tegra124 CPUFreq support"
> +	tristate "Tegra124 CPUFreq support"
>  	depends on ARCH_TEGRA || COMPILE_TEST
>  	depends on CPUFREQ_DT
>  	default y
> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> index 514146d98bca2d8aa59980a14dff3487cd8045f6..9e46b53487fafdc1e9e95e765b9b490d9c95f2c6 100644
> --- a/drivers/cpufreq/tegra124-cpufreq.c
> +++ b/drivers/cpufreq/tegra124-cpufreq.c
> @@ -211,5 +211,7 @@ static int __init tegra_cpufreq_init(void)
>  }
>  module_init(tegra_cpufreq_init);
>  
> +MODULE_SOFTDEP("pre: cpufreq-dt");
>  MODULE_AUTHOR("Tuomas Tynkkynen <ttynkkynen@nvidia.com>");
>  MODULE_DESCRIPTION("cpufreq driver for NVIDIA Tegra124");
> +MODULE_LICENSE("GPL");

Can you try inserting/removing/and inserting the driver again ? I
believe it will lead to some failures as no cleanup is being done by
the driver.

-- 
viresh
