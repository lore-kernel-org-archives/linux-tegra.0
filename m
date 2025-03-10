Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1686181E
	for <linux-tegra@vger.kernel.org>; Mon, 10 Mar 2025 04:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741581958; cv=none; b=T3VLr79KU2k3vFgM0t+HHB3sZJwdwBiPPDCngPrHK42X5Dd+pvpI/eObuhDJA9WNXIl9ulmHjJAJagvfZbzTePBMsXuO4VJ0j/8MEV7vFI/m2k9+f1zyPaYo9BiJ91DyjIl2ACp3wA4ltjIZA/AwY6JnxVzvbCBae75Ug0u9rHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741581958; c=relaxed/simple;
	bh=JRAD8UOU585xke1ahIH/tODZNm8+Se7tMxj/ziVkiW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLAT1STt5L9dgCtH00zMy043Vh815XPJu0TIVjxVBF3qcgGG6jthDjabRo+IT100bWrX7mL8ym4H9SBz8Gn4JG1WPus36AHKbN+VFTqx4TdeKgScydDPascdoNzZCoUlND/cR1/UX/nIHDYItAYlgzH4di2PHGSafmBtWOgsXG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eQdw9+J4; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eQdw9+J4"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223959039f4so72509475ad.3
        for <linux-tegra@vger.kernel.org>; Sun, 09 Mar 2025 21:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741581956; x=1742186756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kw2OaaNPvchcmlFrqMHD8BuSkIwCc2oB92xYk20lkhY=;
        b=eQdw9+J4SVp0bTmEc7A/xFr694PsUYJ0T27nxhXZUz1hR07pKkUkNCTChl1OYDo61y
         jT+8x5/62CBQw/bVMeq49hlRflKH55IzEcKOkEMmiRxMslpRBol9wd/heQKQf31sBtdd
         Vcd0M5GsZi8MW9OTTqP+iVrodUAwQOGiATGGalyLFcM/bERc80dACIehiZW/7xtJaPb0
         4gp1d5Uo33oP1VC1WUpB74A7emjUuYIB6hjPpTacElOTc27jvU5eV/hTd554N5CEs1+l
         OTlrXrczYlcPZJ5/yR1yct+1Qzmi//YzMVCQg+2frHJBJxQQJa1zeskllTnO0obh2sJT
         pFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741581956; x=1742186756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kw2OaaNPvchcmlFrqMHD8BuSkIwCc2oB92xYk20lkhY=;
        b=veD6qVzCteo3CRnMhGlfaIVKKFbMdhdIG8YwBcWAg+wt3qk/SveUQvtbfRQtZeQA04
         bQaXy6IGm33VSxJkHdHJlf8eJDIK1qy09XPaJ9RJ3OmeYnWjgE/I4VF1JZLvppwO/Q0i
         OqouVhdh0kXfwJiHPm8GqW3WzG/xS4Tr709JQX9Ug+gPnMKLby0914CAdfHUklsYxGvm
         bK1YLmv/JJSge71fNuLhuwqQl32lBnxtQ1gP6bNyavdCwfd+eMjxZn/FY5HdXoptGagA
         yGaooC4r4EfwBk0D0XlUCJudOkGzNgJhWrIYZ+rsF7Fly37avBbQZbFLnvmh5uLRBg1O
         GOsA==
X-Forwarded-Encrypted: i=1; AJvYcCVC4IhQMm98CjJ8K9RPxFsh7vydRvrW/T72JanfaeKLDY5NpzsNV/qqK/XDo56ozPB/8mQd+NaBfdQkIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOD7pgQcehy7BWelWDK0+ffJ6Z0PtiYRoCV6mYIPN7lJZSzXDA
	0pRqUJ8VzSeqhND4L4DbY1Zrrdoxx2qFPTnXyA8lA+HwdzTNuI6uqVlpW+4RQd4=
X-Gm-Gg: ASbGncuTSyeuQsQ0pb1SITvKbp8S9cmG/A4wRJLeox+f3jVXHDp4ldJhs4/yhH0NAKl
	9nJKdyQtXi48ZolVsbewtqWZcY2gWInNThVJOQ9RqjqnkIvClqXvjrXvaDDm6UV+OMqq7DP0067
	JsDXUMYPfrL6cUVBq1HiQWeDa8qEaE9ECtaPbc5WHKaWdRn2mp24ymxmANAZ4U/kYipQ45+cE6x
	cnPQjASiv2MSBg2rnHCAFZM/D+kjTips1OjnWzjT7SYHo3shjYcWVY4FdgvL/7eC4BykOfhOOv+
	H4VcvDi2e3Ct7swiI4xMw0ioe+aCTzDwGc+3XoJ7/SdF7w==
X-Google-Smtp-Source: AGHT+IF5bDU1rFa9VtZpFUs6HfI8CB9JfBOo6glmNRgP0U7OmG53UWM6H0zHVAdiu6JBpq+CGnoHTg==
X-Received: by 2002:a17:903:46c6:b0:220:d257:cdbd with SMTP id d9443c01a7336-22428bf16b4mr222163445ad.48.1741581956321;
        Sun, 09 Mar 2025 21:45:56 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e944csm67848155ad.74.2025.03.09.21.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 21:45:55 -0700 (PDT)
Date: Mon, 10 Mar 2025 10:15:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <luceoscutum@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra186: Share policy per cluster
Message-ID: <20250310044553.zupmsoi4d3errjvs@vireshk-i7>
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

Can't you use ARRAY_SIZE here ?

> +		if (data->cpus[cpu].bpmp_cluster_id == cluster)
> +			cpumask_set_cpu(cpu, policy->cpus);
> +	}
> +
>  	return 0;

-- 
viresh
