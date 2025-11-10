Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F263064A3
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 10:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772181; cv=none; b=bOGCYkzeC0NFqpj0BV5sFXy4bmmHIafQ79JCBygofrCIfS+SfCSqsVmxJsgEH7kxzjz9Z7jjKmSDS8W3R1s/aLZRThSg/x/S9K7XEjV2+JhyEHrmtQZmEhQS4eNHjQkyny6mL99EohiAx+FMVIoPczCxXWL5Lk6gtqx8lkKezy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772181; c=relaxed/simple;
	bh=dEl+crxWx0Ue6Eap9IyJQOsh+WWdfuIJZKBgNUUOskU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bK4nsf/JCJ92yZ/jFM1AO29DqaH4Ku5BKGkCUegl5r5e/KJU0I45lbO5szCc4KpesprAT/MhYDQJtBzJYQyaxLqnZI7UBh1enCJk5z093RegeG6VIPeqoOo2qklkYUx9X8xvi8ex9ljSjz2JaeuI8oS3B/nvdepO/YXY5n468sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKaBLUd8; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKaBLUd8"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b679450ecb6so2258515a12.2
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 02:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772178; x=1763376978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HOTgQEUB8GcmpUQcmIkml8fFvXO2yWgEKzXQF7vCTcc=;
        b=gKaBLUd8yrvPVoLyJ80CXi/2i4l/MtEV6mMzBU+Z3JHKX6VOOOfpEhRPfPP8aXEGG2
         TUcf/VMxLyuXljSA+kw8vdEhmUvbjSYf6E7jMeKqHx+HRb9kL7LhIry6g0WMkUFe7x4+
         kRUdnLOR+EjcklQaG5iJ/fCBbmUbZLJy96sQZDrHS/cmCJPfPqJNlZzyt/ytOGIoMISw
         1Lir7UTb14vlK3asD6EnW+PeZmBiZiCNKY6gjsxcrEaX9B6kFcukVIMxH4TqeKLqjyuQ
         uEZNNfA9wkKrK0oKfqqA6g5mOeLXvfHGWgIxeSkkg/qkB+A6ExHOdwDy9v/KaL3/AnNo
         eoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772178; x=1763376978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOTgQEUB8GcmpUQcmIkml8fFvXO2yWgEKzXQF7vCTcc=;
        b=j39/NAw//D9DgaWdk6xZCzS4WKK4RzcUkt0kw24LRwy3w2iL2gN+YwOoUQpwSPKqfk
         H79O2z64rYsifUaTNHsyKtWEyqOiiul1oLODewhxkkbovFZbRi/qqcog5BvIz/EOvMLe
         m7LzbkMEJbWMYVnCtNXBj4Q2EogQNczraW0baqIIH/3/J7vKCmBY2xGyzWheseA5cIx2
         8b5m0snr1pEJ3sS1D0Yj7qxNow2lKtzKSNJO3gMNyVGbh+XogM4m1QAkgafKvT6YWoIA
         APqYNrzQ/RXiUn6aheaVLreqOumRucCQ4/cnbtwCabOCAvKrJNOKp8PJ1rmrXQsydjcD
         PWHg==
X-Forwarded-Encrypted: i=1; AJvYcCVeYEqvbfJMRRh2fwnvMipxVJblE1VrU6fYRs3gxGRXXnXfj1aPzywTmbJuy2YAPSVHDkIfHz6nTv6RhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo7vhYc6Q5J/qDM8uH78XfYNYMnrruU8KFdoECAGXFO4S5VCM7
	5LJx/O0JwG74xVvHKRXJqaRxsTt/zWYZwReOYClrEA+nrK/XrRJ7HOSR0mhSHpW8YbU=
X-Gm-Gg: ASbGncuyuwzZzJ+xXyClsf84zvKJ4CYO8lhs6sPatfTojr2HC8QDewyKNqxtf/3V/C2
	7wplXtQL3dZaOxCFg3jYqnr8/bJLkCUsEu1MtNZFPb2cnu/nCsnBkSK0iqaANhHH5XAZTkowM9O
	0afh1MO78fVttrauXYL2HtBgjZv/GkMQoCIWEKeUs2vy2Qt8oPoCwImoFtEtxD7iVDDIhiVFeXb
	7c8SHVBJ57C+R7G7zYh/lhqn86zt6hCnJmxi/TTLhUoj1TFo9WxyyBOJFG3YRlpjgi7TkQ7Z+lb
	ns9xpH+m3wYPrmbtkhxTFSC4vCBAPLAp7MHt6BcEQXc2/ImXlP0G3ooxOKobnwADm0IeqJn2jor
	YdC3G2pRRagPK9jLSghRssNLSrHzDL//ukIytuNDa+gpo/YSunslNmrgCFfNb4/EHs3GV2pAMJ7
	t5XASM3CUxX0Q=
X-Google-Smtp-Source: AGHT+IELCZjjS9db2GOOi5gG1D3fReIWK6Fsulo/YaMjMnn+TlgjP5Y2DF6HQCR7hzQBYtF9UG4Urg==
X-Received: by 2002:a17:902:d551:b0:27e:ec72:f6d with SMTP id d9443c01a7336-297e53e7af3mr99902655ad.11.1762772178225;
        Mon, 10 Nov 2025 02:56:18 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297fe688c96sm49938925ad.58.2025.11.10.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:56:17 -0800 (PST)
Date: Mon, 10 Nov 2025 16:26:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, lenb@kernel.org, robert.moore@intel.com, 
	corbet@lwn.net, pierre.gondois@arm.com, zhenglifeng1@huawei.com, 
	rdunlap@infradead.org, ray.huang@amd.com, gautham.shenoy@amd.com, 
	mario.limonciello@amd.com, perry.yuan@amd.com, ionela.voinescu@arm.com, 
	zhanjie9@hisilicon.com, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, 
	ksitaraman@nvidia.com, sanjayc@nvidia.com, nhartman@nvidia.com, bbasu@nvidia.com
Subject: Re: [PATCH v4 1/8] cpufreq: CPPC: Add generic helpers for sysfs
 show/store
Message-ID: <s5xt53i6c5wryje5x6zlq75r3lx6nxb7pat6umnghpnldi4p2h@jaeew4iimdd3>
References: <20251105113844.4086250-1-sumitg@nvidia.com>
 <20251105113844.4086250-2-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105113844.4086250-2-sumitg@nvidia.com>

On 05-11-25, 17:08, Sumit Gupta wrote:
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> -static ssize_t show_auto_act_window(struct cpufreq_policy *policy, char *buf)
> +static ssize_t cppc_cpufreq_sysfs_show_u64(unsigned int cpu, int (*get_func)(int, u64 *), char *buf)
>  {
>  	u64 val;
> -	int ret;
> -
> -	ret = cppc_get_auto_act_window(policy->cpu, &val);
> +	int ret = get_func(cpu, &val);

Why no casting required here, when you need it ... 

> -static ssize_t store_auto_act_window(struct cpufreq_policy *policy,
> -				     const char *buf, size_t count)
> +static ssize_t cppc_cpufreq_sysfs_store_u64(unsigned int cpu, int (*set_func)(int, u64),
> +					    const char *buf, size_t count)
>  {
> -	u64 usec;
> +	u64 val;
>  	int ret;
>  
> -	ret = kstrtou64(buf, 0, &usec);
> +	ret = kstrtou64(buf, 0, &val);
>  	if (ret)
>  		return ret;
>  
> -	ret = cppc_set_auto_act_window(policy->cpu, usec);
> -	if (ret)
> -		return ret;
> +	ret = set_func((int)cpu, val);

... here ?

-- 
viresh
