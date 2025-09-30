Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91382F83D4
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759228211; cv=none; b=QXIoqNd5hQXWhltoBg0P95xMBgVyECVIIUyUsPkueDDT8cOKGb6Z054YumzbDGnMR0dPrQqeGufekYGeOaPIjTpqSIGVtBP3ZJiqbEMf3oKJZSAZVzNbfVO/mEMponEdryS5se+0wrDsIxanQr8VGMC75KBgiFuh4akFRvyiDXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759228211; c=relaxed/simple;
	bh=LlAd46X4AMd1hwxDl9JpZBtSvrds+zrXrLm1hCZMZGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpk0fdrHVIPeNBvFI1e2x2oawsjcKGWYaA2z1pruLzepXSkM4z2+ZCvXw4tYbZLh2oZVO041NZXo5MmyV1in7uCVZCFLCVZDocwu8zf6Q9JaRNOGlDGfg71jVGhYse+ckbsQIqDvsplnLemr+MjV2lvy4Z3zdxgpOSy6hDMb1x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qz3uZlMZ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qz3uZlMZ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so4957423a12.0
        for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 03:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759228209; x=1759833009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bti2R28/RAVcQBXOrb8jZ4ikDl7tBOWMDlFZn02oZ4=;
        b=qz3uZlMZevLjFLfnFdPjS7DJyFCcC4z+WUPimXuo8Txym21x+GCXTI6jSzAzhSJs05
         bj4zWMYDpuxSq0z20B0xjz4iwvmJ3vvi2RxQvyWNqHwm4MwYq1Bf1N47Rf9qhf9D4au9
         kcCK5wq7ipecWcP3ZZw/VNwIjprmbIqbYn/eoVnkwKIK2CKk62OSjk2c0PfxJJPNkuTi
         B2NPfix3wcaC3lMK3OskKF0mwPctPFR3wEHDffQGle3cTnWmjkYHn9SOr2exjERnka6b
         2LWH2ybpP1iFRkIfFtl+DSl9iIkUh299cNZviOViPweK9VawxiS9gle4K3Ktds8eiCjk
         KzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759228209; x=1759833009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bti2R28/RAVcQBXOrb8jZ4ikDl7tBOWMDlFZn02oZ4=;
        b=cTkNls1dFg3gKfdlACX1c4zeobG2sUnqupH+P3jJNcBz9t46OP5rwMZOb2v646Tv0b
         JqkARO01CJ5hBQlTEre6VGxKKf4vil4ltvBZu84ZFTrMjNHY2ztjdb6vq4mXFIPvfQNo
         O/6Cl5t5skcUSM0fybtvsV4tn3jZ0H4ZxNLEiM3B1xuMeGn4m1QGhUPSrgBoq8yGKgNK
         eolXu1POTecTMs48LSZkJhC23P/z7DdsGKL0A7T/ny+Y+0A4wv5JYaiGJUCZXVnc5kLN
         vzoWq7R3E+NAwUuZ2jP+g4jQarrHN5Rb17/X1IT++TbyAxxqY0ccJGrTLggeiumxYbNG
         DAxg==
X-Forwarded-Encrypted: i=1; AJvYcCWvwF/LGLsDw9trF0o+VowxP4w68wf/Erwl3uU6g7Ah2iXPZy/+h+8w2Oj65wtgPSvQClmflS74SGor6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXd4sD0/d4+Ikmjw7LLjumyoVz+qz2S+VsrOQgvIUVIn9/tMjF
	bq+a45G6iAVfYJzMRE9EKSntfOcGEZ1JJqgU7q1I9bXOWGSRHpqISNHKWyr1pjBw/aM=
X-Gm-Gg: ASbGnctVCLEBBrPV413h1nLxOS5CLdme0GCgEbBupGbM+REpeVxEdvhxVmWJSdh/VAQ
	nUewFVpnFmFtc4XXV0JMd18570DXipIOYw8jbrDFBo47L8DdlxS04xD/mWAzo+j01YU2AAJExWP
	gjezg314GuzRtQAPY7GXUMPsNj7b5OjkqHoV9fYkr94F9hKW3PG7bHipvV3KRNSCpA48E3TZyT/
	IQUbgMnd207dAl6wCkfCrffR3VUb91Cjn1ogAA/I2vN89dwK1gy0d2Iw/DKvEAvJJRvA9Rw4gVn
	R4s9mOKIkVCd/pFNwMEZL+AG4WMOQfFAz9vpf6YDjpbHFX5kExoFVZxJ1R7cmmxI0djpfXYfy/x
	MhoNdhzks1fYwFNb5Y0REnEPEctMyU8HCr8C0lI776S7F+TupdrMy1HsqvI8Qyg6DDNd1Dg==
X-Google-Smtp-Source: AGHT+IGvSXNfKcREmK5xdLdLGpoBcxZHLK9ma2oRLZHFgufwj2uLeXd8vq5DC3f0IouV+OETawQEFA==
X-Received: by 2002:a17:902:d0c9:b0:24c:da3b:7376 with SMTP id d9443c01a7336-27ed49fb299mr159575375ad.26.1759228209125;
        Tue, 30 Sep 2025 03:30:09 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ad1fd9sm154739555ad.142.2025.09.30.03.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 03:30:08 -0700 (PDT)
Date: Tue, 30 Sep 2025 16:00:06 +0530
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
Subject: Re: [PATCH v2 1/8] cpufreq: tegra186: add OPP support and set
 bandwidth
Message-ID: <20250930103006.octwlx53p2shwq2v@vireshk-i7>
References: <20250909-tegra186-icc-v2-0-09413724e781@gmail.com>
 <20250909-tegra186-icc-v2-1-09413724e781@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-tegra186-icc-v2-1-09413724e781@gmail.com>

On 09-09-25, 01:21, Aaron Kling via B4 Relay wrote:
> +static int tegra_cpufreq_set_bw(struct cpufreq_policy *policy, unsigned long freq_khz)
> +{
> +	struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
> +	struct dev_pm_opp *opp __free(put_opp);

The usage here looks incorrect..

> +	struct device *dev;
> +	int ret;
> +
> +	dev = get_cpu_device(policy->cpu);
> +	if (!dev)
> +		return -ENODEV;

On failure, we would return from here with a garbage `opp` pointer, which the
OPP core may try to free ?

Moving the variable definition here would fix that.

> +
> +	opp = dev_pm_opp_find_freq_exact(dev, freq_khz * HZ_PER_KHZ, true);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	ret = dev_pm_opp_set_opp(dev, opp);
> +	if (ret)
> +		data->icc_dram_bw_scaling = false;
> +
> +	return ret;
> +}

-- 
viresh
