Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AF91F5434
	for <linux-tegra@vger.kernel.org>; Fri, 29 Aug 2025 05:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756445957; cv=none; b=vEKHKcyC0C2YP7QocmAVJjzPPV/X6GGrOCK/Ahpr78sdFRsj2W2cBiG4PJJ6KRNf8GZbtKzO+KoLtoe+TBWeYWetxSl5tXa4dCL8fIQtACc9deuaRPgzQ48eAJn7riQaJ6/369alR9CU91IefIr9iSReVdANpsfRbNrlfz349R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756445957; c=relaxed/simple;
	bh=dBEimnyqFErvRDaw6n29Zwqdf1lNF2xCJ+zGmMqLgvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U765ptXsvhcaTKzYFAlYubpseBDuPGrR9xPLL8O+3lRFs/cn3DHToWLkm+cmeQ3QIB/nITAntDQybhk/WQjNXMUvuwUWdQmdAtXIl1JdZlbTQsX8yBC7RX864bp+40MVQZf5Mhe0vPIzTdseXKpMz7tWM/p+jHP5SS3tOCJbRRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hj6cmJL0; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hj6cmJL0"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-327b657924dso1169754a91.0
        for <linux-tegra@vger.kernel.org>; Thu, 28 Aug 2025 22:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756445954; x=1757050754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3XBNZun+DsWEuFjpuYogmLUWGnvKNXpUg6KanJ2bj/Q=;
        b=Hj6cmJL0o65D4jSVKTCop8q9jjPVpuVMtdw9hYW8Ph5XWjRS//PNmeIxoWBdVW9Jv4
         /Xb90mE4UKkDq3wSRaOvmi6YFd+8TPr5ks0O6/dBgqy52Xiz3bvpd9YbQnk7A4DtWiuz
         iRrOUqgrU/hJzyE1VEIlVkTpLSnq/5ht0lO5JyO0Ctl8qnOPW9Je91zW2B6cpHBg6js1
         VTuWfuDyYyFbajMvq6I/CudkidUcWBPnT0P4BNyMlqRspbHcENEUGoC8dytemgSVUngW
         7QSQSDT2j06bfgrZmbFpoz9xl40HypYhMemk9wewECi5RPf/PxUdTh3Ufd+KmV2JwRLi
         XPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756445954; x=1757050754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XBNZun+DsWEuFjpuYogmLUWGnvKNXpUg6KanJ2bj/Q=;
        b=StrXssh7lNbc8NtZQ0zC7C/RkLoDNVbJbsIlhjns/YxNfcZAftR3VqQ4uSIudmglrc
         zXI5ThpGtnDoBvj04iuLwByvABmdloEDgOhrzAMFnn2x3RQHISsCByxh/GHNm6ilLXjY
         uf/TaSDdrxvFf4ijnVUDKqGBFdMzevG7Tu+nd94uxihxp3D6GKT88KZdOjvI4AJKsb5l
         6Wy//p7tQd+Ip/Z5Htzxcc3dZXJV9xOTqxfP47jb+tBQMG32HfY4qZ5EjhlA09OtxoJL
         /au2kBA6Ih6V6mxxQocJSVMAeq4lSdx7RmFVI7sqf4NbVZFGMd+VK9oTz0+aF/04Jl45
         gF8w==
X-Forwarded-Encrypted: i=1; AJvYcCUHQXUH/mV04pTERpd5RRzKFw9cVidedJjA58zjUASYuGZ3mqM8tfwkWOuy/B3DKpeEETLQiJYw2InV7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUq0Nyb32WaeQilAQkmcpAUP5Ckn2LpuAPNiqSBUIViCVqr+px
	3ERsgDn0IGcCD/XkLUcCYwaKqmzWh+DZsbE5D00om+ry+5umx3vzU7wwxp4XD/vLR74=
X-Gm-Gg: ASbGncvUEHEL/RA7nUqHRwwT0nhQvcGn4wCyxX1r5wfVbmjm4ZgHBFrJDTQZYUKJ+Ul
	io9yDQP93sHWirm2MG4VM93IgpgMb0wGp253zDrZGow25/D9l9zdJ4AHwu/hVFBasuX6K4yWjgD
	mJVK25A8GxQK11Wcb2vT5Ulhgi95LHglvL9V+l4GwavYnqZNPXfUQ8DWXV+NTmHjxq6cfFP1Pu/
	yKqLWCdgvZfGT/6cPmp8IuE+0i7+pRv5aKsBo1M5oukOG2186wKBTMoBa0r+OjGqujuY/XHfsIj
	2mCuC3CGE8D6CcRFUVPmruLSNjNag4YD0ydRwtvr+gKQLXc9aSP2+v6EDj60vVsaVqtsgT0jVrC
	ybSNDUci1+6oYzg9ie3+1OXqDU2Nj5Tl8qNg=
X-Google-Smtp-Source: AGHT+IF2FBDuAslWQRB95r2d29vZcZOpSZcreczLMQg0tt9Qhwo66M6nj6sHGldIm2UhdvS/fRstfQ==
X-Received: by 2002:a17:90b:2e8c:b0:327:e34e:eb15 with SMTP id 98e67ed59e1d1-327e34eed3cmr2048590a91.2.1756445954282;
        Thu, 28 Aug 2025 22:39:14 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d8f66f16sm1493229a91.0.2025.08.28.22.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:39:13 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:09:11 +0530
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
Subject: Re: [PATCH v3 2/2] cpufreq: tegra186: Initialize all cores to max
 frequencies
Message-ID: <20250829053911.pzrkfvzes3bsrvtm@vireshk-i7>
References: <20250828-tegra186-cpufreq-fixes-v3-0-23a7341db254@gmail.com>
 <20250828-tegra186-cpufreq-fixes-v3-2-23a7341db254@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-tegra186-cpufreq-fixes-v3-2-23a7341db254@gmail.com>

On 28-08-25, 21:48, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> During initialization, the EDVD_COREx_VOLT_FREQ registers for some cores
> are still at reset values and not reflecting the actual frequency. This
> causes get calls to fail. Set all cores to their respective max
> frequency during probe to initialize the registers to working values.
> 
> Suggested-by: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index 6c394b429b6182faffabf222e5af501393dbbba9..bd94beebc4cc2fe6870e13ca55343cedb9729e99 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -138,13 +138,14 @@ static struct cpufreq_driver tegra186_cpufreq_driver = {
>  
>  static struct cpufreq_frequency_table *init_vhint_table(
>  	struct platform_device *pdev, struct tegra_bpmp *bpmp,
> -	struct tegra186_cpufreq_cluster *cluster, unsigned int cluster_id)
> +	struct tegra186_cpufreq_cluster *cluster, unsigned int cluster_id,
> +	int *num_rates)
>  {
>  	struct cpufreq_frequency_table *table;
>  	struct mrq_cpu_vhint_request req;
>  	struct tegra_bpmp_message msg;
>  	struct cpu_vhint_data *data;
> -	int err, i, j, num_rates = 0;
> +	int err, i, j;
>  	dma_addr_t phys;
>  	void *virt;
>  
> @@ -174,6 +175,7 @@ static struct cpufreq_frequency_table *init_vhint_table(
>  		goto free;
>  	}
>  
> +	*num_rates = 0;
>  	for (i = data->vfloor; i <= data->vceil; i++) {
>  		u16 ndiv = data->ndiv[i];
>  
> @@ -184,10 +186,10 @@ static struct cpufreq_frequency_table *init_vhint_table(
>  		if (i > 0 && ndiv == data->ndiv[i - 1])
>  			continue;
>  
> -		num_rates++;
> +		(*num_rates)++;
>  	}
>  
> -	table = devm_kcalloc(&pdev->dev, num_rates + 1, sizeof(*table),
> +	table = devm_kcalloc(&pdev->dev, *num_rates + 1, sizeof(*table),
>  			     GFP_KERNEL);
>  	if (!table) {
>  		table = ERR_PTR(-ENOMEM);
> @@ -229,7 +231,9 @@ static int tegra186_cpufreq_probe(struct platform_device *pdev)
>  {
>  	struct tegra186_cpufreq_data *data;
>  	struct tegra_bpmp *bpmp;
> -	unsigned int i = 0, err;
> +	unsigned int i = 0, err, edvd_offset;
> +	int num_rates = 0;

You don't need to initialize this AFAICT.

> +	u32 edvd_val, cpu;
>  
>  	data = devm_kzalloc(&pdev->dev,
>  			    struct_size(data, clusters, TEGRA186_NUM_CLUSTERS),
> @@ -252,10 +256,21 @@ static int tegra186_cpufreq_probe(struct platform_device *pdev)
>  	for (i = 0; i < TEGRA186_NUM_CLUSTERS; i++) {
>  		struct tegra186_cpufreq_cluster *cluster = &data->clusters[i];
>  
> -		cluster->table = init_vhint_table(pdev, bpmp, cluster, i);
> +		cluster->table = init_vhint_table(pdev, bpmp, cluster, i, &num_rates);
>  		if (IS_ERR(cluster->table)) {
>  			err = PTR_ERR(cluster->table);
>  			goto put_bpmp;
> +		} else if (!num_rates) {
> +			err = -EINVAL;
> +			goto put_bpmp;
> +		}
> +
> +		for (cpu = 0; cpu < ARRAY_SIZE(tegra186_cpus); cpu++) {
> +			if (data->cpus[cpu].bpmp_cluster_id == i) {
> +				edvd_val = cluster->table[num_rates - 1].driver_data;
> +				edvd_offset = data->cpus[cpu].edvd_offset;
> +				writel(edvd_val, data->regs + edvd_offset);
> +			}
>  		}
>  	}
>  
> 
> -- 
> 2.50.1
> 

-- 
viresh
