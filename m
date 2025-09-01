Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FAF23185E
	for <linux-tegra@vger.kernel.org>; Mon,  1 Sep 2025 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756706007; cv=none; b=rUYyf3RfJw+RAToRuqE2XjfhBSRiOCFDa5bsvsgRKHd31o9RPRpwxjlEElieu1F9l1iMFb9AfHKX0ZVY0jNgS4E4nlU+YAdWyyGiNmdVjimIdhLtU43Or8FypXnIlmMROk7/r+bcKZsBVuVIR8Mwbnec/fPRWY4o5DjzhmDU2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756706007; c=relaxed/simple;
	bh=Nsght4cGx/+ntVQvlD2lz5IACumOFJYEicjOB1fyoho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm9ApbxMy1UHzfeIkj6Qh+X7qF7gSA4Vo3z5Om9NlTNWH5jL0fyAtSi3c4R3drDHngandrdWI+jyXUgEBTaaX2UrvMGcKCkZKau3yazjZHzzvlJ3kf5HDf7gSF9bK7UEy1BI227inwEc3V0PnnJRiyNuuCPp8JJ0o8NzegoFDmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xsABkEUN; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xsABkEUN"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4cf40cd0d1so2209402a12.0
        for <linux-tegra@vger.kernel.org>; Sun, 31 Aug 2025 22:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756706005; x=1757310805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGP46XmM9/Lz93NQbCSlhH30hVvpx/MQhMKzh3a8Erk=;
        b=xsABkEUNYYgjmY1qQeuvmDNj4osewIhfnKb650+Gjh+s9ShO/e98oCMv2kBe1cEYeu
         4DCBK5Ioo9jCvqvGdnOLMwDYvR8uFzeHfuBe0vs8UjiZWjHSdkn1iKiMDAs9nncl9r3K
         oKDmUaWTfe9AXtYPtE0wsvN7vW0qKw2sE/oddXf/KavDHEnqVtiWlYFFujXQhfy0VM+t
         6zVdSr22P/5Ubg58agKWNMdLiOP0+grngIU2fT7ke1PJApzwblKkXSOXnirlAdmLMrJo
         0fL0ry47z4Plbd2cQq3eC6mxe7qC5fT1GKtLUjEbV60TtZHNmsWUExZ4OxVsJjRfKUjV
         IXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756706005; x=1757310805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGP46XmM9/Lz93NQbCSlhH30hVvpx/MQhMKzh3a8Erk=;
        b=tBwCu2/dbiGWaaPHUA2A1XvcbwVLsTysiXiaBTeMsnhj7Uw0gKh3N2pawwwaGQm//Q
         cRadDL27KrI8I3uPHRreyniPiKixRpVFXLHZGHhaqcMPD130lCL1POqlj3qj/xTRT9Ov
         8e85Io/eW5JwktTY3p19ohgsWkurecWz/HpH3FY0Bppkmfa7iuUC95rv4qvcPX+uE45o
         RUAzdrtu/Ry6N4UQCjxZULqAqRz/IJZS2d+u87ho6r4nav3f/uPOw1pjrPlRvBMmZRHW
         wOKzzzO08mcpDt0yV7p+SA/HyJt0UjmQaDZKIFA9vOPL1dw6Kt+e/y585rD6xErAoUF0
         Bxww==
X-Forwarded-Encrypted: i=1; AJvYcCW5O+vCpWZhoYJLzQ38ACrSjvGv45SJIyOyrzfXUowQBOpV/5Ndh1q1j30dLwyQoMTBQMGCPI1n/7ARFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3C/kpKc5I6kWZJyzjaRO7LmCfNpXvf5vz9ITnkK8BH5wmXUUC
	73EbgitcuFQ93m4FNPMJwN4vLwfjloimGv7ej22OLtq/pwOaHE4Un2Q1I2lo5xACjMg=
X-Gm-Gg: ASbGncv9bcic2CJcC8HNU+SlGufvg/WUsb/w95aYf0RAE8oOgvTDwIEl31sk4KWH8cA
	U5kfNF+1ig4pY7AtwWEM/Y3lyORK13lJ7/nWcL+bu4soJ8NmB8Cm2zcOdjj+NMZs0B7Su4u4pqa
	yqgo5MpPlwAv1dm+qWCU9rZEqmsMZGq5VKRInPgYgmDb4O+tyvsJZwdlJm2Z7aVDKa6EKA0VljP
	QVJiXTUE9q/dd8TbYqgPl60iWwr6dBXRZNbuDReo5VADeuMpjuZeufQ49t40rDNGtxqir14KrbB
	Afujn1hypiY76R6ar1lHFvykfzTt+zi13pLk/rVx3fgx0Wn1+6Tr+ssyvSKNhg7Ut5YcouzMY1M
	rbOyMb43FDdje0eUEfmXwA3sf
X-Google-Smtp-Source: AGHT+IG85eZ1lUcTTphENraaKb78QPO6bGNPiW2YjQsGdyD1VV5pliNBYpWBff3QdMACMqlnvbtkVg==
X-Received: by 2002:a17:90b:528f:b0:327:e970:4a0d with SMTP id 98e67ed59e1d1-328156c9515mr7841003a91.21.1756706005079;
        Sun, 31 Aug 2025 22:53:25 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327f5bbd749sm8668289a91.0.2025.08.31.22.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 22:53:24 -0700 (PDT)
Date: Mon, 1 Sep 2025 11:23:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/8] cpufreq: tegra186: add OPP support and set bandwidth
Message-ID: <20250901055322.eorgaa3sycydjrrj@vireshk-i7>
References: <20250831-tegra186-icc-v1-0-607ddc53b507@gmail.com>
 <20250831-tegra186-icc-v1-3-607ddc53b507@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831-tegra186-icc-v1-3-607ddc53b507@gmail.com>

On 31-08-25, 22:33, Aaron Kling via B4 Relay wrote:
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index bd94beebc4cc2fe6870e13ca55343cedb9729e99..f0abb44e2ed00a301161565e4c4f62cfed4a5814 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -18,6 +18,7 @@
>  #define EDVD_CORE_VOLT_FREQ_F_SHIFT	0
>  #define EDVD_CORE_VOLT_FREQ_F_MASK	0xffff
>  #define EDVD_CORE_VOLT_FREQ_V_SHIFT	16
> +#define KHZ				1000

Can reuse:

include/linux/units.h:#define HZ_PER_KHZ                1000UL

> +static int tegra_cpufreq_set_bw(struct cpufreq_policy *policy, unsigned long freq_khz)
> +{
> +	struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
> +	struct dev_pm_opp *opp;
> +	struct device *dev;
> +	int ret;
> +
> +	dev = get_cpu_device(policy->cpu);
> +	if (!dev)
> +		return -ENODEV;
> +
> +	opp = dev_pm_opp_find_freq_exact(dev, freq_khz * KHZ, true);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	ret = dev_pm_opp_set_opp(dev, opp);

Won't it be easier to use dev_pm_opp_set_rate() instead ?

> +	if (ret)
> +		data->icc_dram_bw_scaling = false;
> +
> +	dev_pm_opp_put(opp);

The OPP core supports scope based cleanup helpers now, maybe use them
to remove all these put calls.

> +	return ret;
> +}
> +
> +static int tegra_cpufreq_init_cpufreq_table(struct cpufreq_policy *policy,
> +					    struct cpufreq_frequency_table *bpmp_lut,
> +					    struct cpufreq_frequency_table **opp_table)
> +{
> +	struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
> +	struct cpufreq_frequency_table *freq_table = NULL;
> +	struct cpufreq_frequency_table *pos;
> +	struct device *cpu_dev;
> +	struct dev_pm_opp *opp;
> +	unsigned long rate;
> +	int ret, max_opps;
> +	int j = 0;
> +
> +	cpu_dev = get_cpu_device(policy->cpu);
> +	if (!cpu_dev) {
> +		pr_err("%s: failed to get cpu%d device\n", __func__, policy->cpu);
> +		return -ENODEV;
> +	}
> +
> +	/* Initialize OPP table mentioned in operating-points-v2 property in DT */
> +	ret = dev_pm_opp_of_add_table_indexed(cpu_dev, 0);
> +	if (!ret) {

If you handle the error case here, then the below can move out of the
if/else block.

> +		max_opps = dev_pm_opp_get_opp_count(cpu_dev);
> +		if (max_opps <= 0) {
> +			dev_err(cpu_dev, "Failed to add OPPs\n");
> +			return max_opps;
> +		}
> +
> +		/* Disable all opps and cross-validate against LUT later */
> +		for (rate = 0; ; rate++) {

Maybe using while(1) would be more readable ?

> +			opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
> +			if (IS_ERR(opp))
> +				break;
> +
> +			dev_pm_opp_put(opp);
> +			dev_pm_opp_disable(cpu_dev, rate);
> +		}
> +	} else {
> +		dev_err(cpu_dev, "Invalid or empty opp table in device tree\n");
> +		data->icc_dram_bw_scaling = false;
> +		return ret;
> +	}
> +
> +	freq_table = kcalloc((max_opps + 1), sizeof(*freq_table), GFP_KERNEL);
> +	if (!freq_table)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Cross check the frequencies from BPMP-FW LUT against the OPP's present in DT.
> +	 * Enable only those DT OPP's which are present in LUT also.
> +	 */
> +	cpufreq_for_each_valid_entry(pos, bpmp_lut) {
> +		opp = dev_pm_opp_find_freq_exact(cpu_dev, pos->frequency * KHZ, false);
> +		if (IS_ERR(opp))
> +			continue;
> +
> +		dev_pm_opp_put(opp);
> +
> +		ret = dev_pm_opp_enable(cpu_dev, pos->frequency * KHZ);
> +		if (ret < 0)
> +			return ret;
> +
> +		freq_table[j].driver_data = pos->driver_data;
> +		freq_table[j].frequency = pos->frequency;
> +		j++;
> +	}
> +
> +	freq_table[j].driver_data = pos->driver_data;
> +	freq_table[j].frequency = CPUFREQ_TABLE_END;
> +
> +	*opp_table = &freq_table[0];
> +
> +	dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
> +
> +	tegra_cpufreq_set_bw(policy, freq_table[j - 1].frequency);

Maybe a comment on why exactly you are changing the freq here ?

> +
> +	return ret;
> +}
> +
>  static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
>  {
>  	struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
>  	unsigned int cluster = data->cpus[policy->cpu].bpmp_cluster_id;
> +	struct cpufreq_frequency_table *freq_table;
> +	struct cpufreq_frequency_table *bpmp_lut;
>  	u32 cpu;
> +	int ret;
>  
> -	policy->freq_table = data->clusters[cluster].table;
>  	policy->cpuinfo.transition_latency = 300 * 1000;
>  	policy->driver_data = NULL;
>  
> @@ -85,6 +191,20 @@ static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
>  			cpumask_set_cpu(cpu, policy->cpus);
>  	}
>  
> +	bpmp_lut = data->clusters[cluster].bpmp_lut;
> +
> +	if (data->icc_dram_bw_scaling) {
> +		ret = tegra_cpufreq_init_cpufreq_table(policy, bpmp_lut, &freq_table);
> +		if (!ret) {
> +			policy->freq_table = freq_table;
> +			return 0;
> +		}
> +	}
> +
> +	data->icc_dram_bw_scaling = false;
> +	policy->freq_table = bpmp_lut;
> +	pr_info("OPP tables missing from DT, EMC frequency scaling disabled\n");
> +
>  	return 0;
>  }
>  
> @@ -102,6 +222,10 @@ static int tegra186_cpufreq_set_target(struct cpufreq_policy *policy,
>  		writel(edvd_val, data->regs + edvd_offset);
>  	}
>  
> +	if (data->icc_dram_bw_scaling)
> +		tegra_cpufreq_set_bw(policy, tbl->frequency);
> +
> +
>  	return 0;
>  }
>  
> @@ -136,7 +260,7 @@ static struct cpufreq_driver tegra186_cpufreq_driver = {
>  	.init = tegra186_cpufreq_init,
>  };
>  
> -static struct cpufreq_frequency_table *init_vhint_table(
> +static struct cpufreq_frequency_table *tegra_cpufreq_bpmp_read_lut(
>  	struct platform_device *pdev, struct tegra_bpmp *bpmp,
>  	struct tegra186_cpufreq_cluster *cluster, unsigned int cluster_id,
>  	int *num_rates)
> @@ -231,6 +355,7 @@ static int tegra186_cpufreq_probe(struct platform_device *pdev)
>  {
>  	struct tegra186_cpufreq_data *data;
>  	struct tegra_bpmp *bpmp;
> +	struct device *cpu_dev;
>  	unsigned int i = 0, err, edvd_offset;
>  	int num_rates = 0;
>  	u32 edvd_val, cpu;
> @@ -256,9 +381,9 @@ static int tegra186_cpufreq_probe(struct platform_device *pdev)
>  	for (i = 0; i < TEGRA186_NUM_CLUSTERS; i++) {
>  		struct tegra186_cpufreq_cluster *cluster = &data->clusters[i];
>  
> -		cluster->table = init_vhint_table(pdev, bpmp, cluster, i, &num_rates);
> -		if (IS_ERR(cluster->table)) {
> -			err = PTR_ERR(cluster->table);
> +		cluster->bpmp_lut = tegra_cpufreq_bpmp_read_lut(pdev, bpmp, cluster, i, &num_rates);
> +		if (IS_ERR(cluster->bpmp_lut)) {
> +			err = PTR_ERR(cluster->bpmp_lut);
>  			goto put_bpmp;
>  		} else if (!num_rates) {
>  			err = -EINVAL;
> @@ -267,7 +392,7 @@ static int tegra186_cpufreq_probe(struct platform_device *pdev)
>  
>  		for (cpu = 0; cpu < ARRAY_SIZE(tegra186_cpus); cpu++) {
>  			if (data->cpus[cpu].bpmp_cluster_id == i) {
> -				edvd_val = cluster->table[num_rates - 1].driver_data;
> +				edvd_val = cluster->bpmp_lut[num_rates - 1].driver_data;
>  				edvd_offset = data->cpus[cpu].edvd_offset;
>  				writel(edvd_val, data->regs + edvd_offset);
>  			}
> @@ -276,6 +401,19 @@ static int tegra186_cpufreq_probe(struct platform_device *pdev)
>  
>  	tegra186_cpufreq_driver.driver_data = data;
>  
> +	/* Check for optional OPPv2 and interconnect paths on CPU0 to enable ICC scaling */
> +	cpu_dev = get_cpu_device(0);
> +	if (!cpu_dev) {
> +		err = -EPROBE_DEFER;
> +		goto put_bpmp;
> +	}
> +
> +	if (dev_pm_opp_of_get_opp_desc_node(cpu_dev)) {
> +		err = dev_pm_opp_of_find_icc_paths(cpu_dev, NULL);
> +		if (!err)
> +			data->icc_dram_bw_scaling = true;
> +	}
> +
>  	err = cpufreq_register_driver(&tegra186_cpufreq_driver);
>  
>  put_bpmp:
> 
> -- 
> 2.50.1
> 

-- 
viresh
