Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F36B1E7C0B
	for <linux-tegra@vger.kernel.org>; Mon,  3 Mar 2025 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996190; cv=none; b=n4Z0n+lSkrXOJnzMLyNu5dD/DMoEoNL8+kmRDQktTDaGsJ53yReOvKe/uS2f57ageJr3r8wO4dcrXdI66t1zhnoiUnG0zFB8Kt7sl55u4GeGjwb0YYKeF9z3aFf9zIlrD3mYPx3D9eAzx5nd+nek614NdWlch8tWRvhtco0Ki1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996190; c=relaxed/simple;
	bh=rxcijywZ3cJkNWyQcn7loTIiEZGWFkiZzNbQUTznWBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMA9VQUwy2wlYHaBrVgnti1Oz9JSxLI7atLLe/hMzZwjzsi1fiK0fuBzqTJVRJUkAkZXAH1hvXpQ83wz2QlSYSpUpMqLlpg8eCkdD2RY0u0xXuKc7Qn0dpW3EinrLr3wFbdxego11c9ot/cOTcckn3CIdhLvgiW7qV/1flCzm1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eRszQY0p; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eRszQY0p"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fecba90cc3so4629409a91.2
        for <linux-tegra@vger.kernel.org>; Mon, 03 Mar 2025 02:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740996188; x=1741600988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=11+AHdr6AYKpXcHhMVfNk2znRJeJwmBOEUdkFwvIoso=;
        b=eRszQY0pHS0XN/mruGO1bTKca76khctckWo4KaTe9sj8/pd03H5iJsFCUbjMGUAyAm
         k14Cm2ZUTz1E00YPQP96s4xHXs36dG+pq9zCYsIj00OHD1D9AWkgrr/I0EOZ2LSXEtO/
         4LBglnqGxXqbC/cMKjA8wI2NykCqu3i8R2AJ539LDjHKBWNSVk1n7g7VpZaggH5jEDlz
         JjJpVdLsdc4gPhknVuJftnimR027mDoGAG91U2EEVRnaJ1J8oT4m5A5IlgNPOutEHoUO
         cMjomNLPbhyYPuOi7yJtNxQMzvG4Kd2ElDkJeE8DQbzEm6abj4lGuDNns++CCzeB3Vcd
         XhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740996188; x=1741600988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11+AHdr6AYKpXcHhMVfNk2znRJeJwmBOEUdkFwvIoso=;
        b=elN8hqky58KBnuE09V0XaE6JDQ2HG0I8w54PRlZEf6psNlOHLE60moLDh9wm0aplzT
         5OpqC2E9jiRlUKWyNA6lmfGJC+jEr7mEdAJUo5V5qgUvCtnfTuUeL5hSrA9h6FG8e3ka
         Ap1354o9GjKV53TcDYbpjbJgwhfhwN/mby+3VU5K6H+uF4L3SC52FAK3BKNRGIC7BVu0
         Cj2W9ADV2fJQHtshA934dGP/XXcpbT7K6Vd8BJJeT3vcmFl0XqNbIuMkw2ZLUiBMk2S1
         RP4tVWU3sLfGo9OPKzUfA5IUHe3IWmPG6MLTV3u9/sCgOgFs/BMx6eRyTmygMDJtK/R7
         zE+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4eXtAbAS4VqQcjSnJivyAWlzIXDZdLNxgGXgsR/G6rcmyA+U4HJkHVFZyEP+tA38yquV+ZNSQ5TghJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkMsqGF4xQTa3d65Yc1OQV8EV2wnoZUIaV3vSQvu4PLa1YxMu
	cVJ+yg+hiJn7HXwt4CZ6w/4OFrkLP3QnG4pYPuVPyYDBegJrCNYyPy/Uz8PV6qc=
X-Gm-Gg: ASbGnctdyVU5sQSZy7htfYLfVuoNW2JVIUiO3f4dJP+k32ZgiYpFEWFdskj9GH1ZixM
	hHTuuyfSYgukqIqJv1sG8UVWUxoJmHmSjYat+ueuSfjTg1/zH3JWjsuca7/lHm/BLS7HJb9BqRI
	SARY9w1Y6c2EJENSb1cCnHUNroLY22b2XoIswJGGriJNnsIzA5r+OZZfss+C4w5IN2CiowJgjLg
	oOBnHcDLE1DKdUOxHLhxzMZmHc0b/LKnWk/ljADuVz2DtmsXYbP2pyWRgE38q3vZvJ1xaTsOaZy
	rxHp4eMSVEhlaXssKemcdMzJem7gXGTSM8nT/irujA6Ygw==
X-Google-Smtp-Source: AGHT+IFJJ6O+Z6xQfN+8w8WzdswNxQSptrdoUx3ci2Ig09T5uOxOLT5TSvhtHvygzyM9QwBXAbOgtQ==
X-Received: by 2002:a17:90b:3c06:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-2febab2eaafmr20196910a91.2.1740996188522;
        Mon, 03 Mar 2025 02:03:08 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f15dsm10764987a91.44.2025.03.03.02.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:03:08 -0800 (PST)
Date: Mon, 3 Mar 2025 15:33:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <luceoscutum@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra186: Share policy per cluster
Message-ID: <20250303100306.rwaosbumr7omcqce@vireshk-i7>
References: <20250216160806.391566-1-webgeek1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216160806.391566-1-webgeek1234@gmail.com>

On 16-02-25, 10:08, Aaron Kling wrote:
> This functionally brings tegra186 in line with tegra210 and tegra194,
> sharing a cpufreq policy between all cores in a cluster.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index c7761eb99f3cc..c832a1270e688 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -73,11 +73,18 @@ static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
>  {
>  	struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
>  	unsigned int cluster = data->cpus[policy->cpu].bpmp_cluster_id;
> +	u32 cpu;
>  
>  	policy->freq_table = data->clusters[cluster].table;
>  	policy->cpuinfo.transition_latency = 300 * 1000;
>  	policy->driver_data = NULL;
>  
> +	/* set same policy for all cpus in a cluster */
> +	for (cpu = 0; cpu < (sizeof(tegra186_cpus)/sizeof(struct tegra186_cpufreq_cpu)); cpu++) {
> +		if (data->cpus[cpu].bpmp_cluster_id == cluster)
> +			cpumask_set_cpu(cpu, policy->cpus);
> +	}
> +
>  	return 0;
>  }

Thierry / Jonathan,

Any inputs on this ?

-- 
viresh
