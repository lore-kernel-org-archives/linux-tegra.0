Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D0C239E8B
	for <linux-tegra@vger.kernel.org>; Fri, 29 Aug 2025 06:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448300; cv=none; b=nRMnhLQpk4l2WjIjHWNh78nLOVfLmP6OSm9Zi2k+qd/MZ16PYv/CuXWyH3W6EVnubvqw4bPTbnj7O+D7Wqg/fqVJDWP8V6X0F6aVnggQeBJ0+5/MaRMmIyeRli7TJLTnvwucxPZGTtBoQvQ/9tEMOwiVq9R/6phcxPOGjPRpytM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448300; c=relaxed/simple;
	bh=qOf1M8CpxrREh2y0SwRzJRtBpqJMEe4p6G3QfMpjhkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiGsonANbMdcLJHmIESh/2QT8+vS8YCPZSE3qbi6gHXip3See0onVUczZ/PONdP07vE1yT/S1tUpF1DftgPTVeTIkeOIeqC0MXtbtDqKFXZkI7h6ZjnpW2UFLMax7KHFPCfqlCDyxjBHfjPUs/QIsFffX3x8nYXBeKtD4IKnfjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bh/5p8+T; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bh/5p8+T"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7720b23a49fso1980930b3a.0
        for <linux-tegra@vger.kernel.org>; Thu, 28 Aug 2025 23:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756448295; x=1757053095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
        b=bh/5p8+TUoz18yVKKu1bFIu5XGn6nO5LQCk7OW2nYNq6bYKfql/5xaCMDiBK5XQvDh
         jmh83zmJwEC+mSGjgJGCoAHbNgN2p3/Y+TQoJFj/iihz1hkXRxDAQfcaU8P5lRAcLqHd
         VZ4Uvl6+VSOZ7y+yksI+08xVTlLuOER6AQjZjXt9A2ZsKqy+y720cVOY2mSxjZ0TdjPW
         l4+SL1YAUZ74BKkuqv9wU/SjI32FPX4J/0YiZ9JMbOT8yy4huPyVBFWk+n/FCzVHDYh/
         DDs71lskDuaiVx1L+wdeqcwxF2lmb9aNuQycPggDRSAHnEYnTZCOCI6p7N2dTjCrE3lQ
         0+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448295; x=1757053095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
        b=JDqgD3DymxOtQhr5FaMo66Lpb9QGvfMkGDB9rTpV70A/7swPDTyty2Zvj9hWOlsMxy
         Zp+Kc++c53qb6O2RNvDTeomb0q68HJ1LXljTUQlEyc5haeTHOjJ0i+7TpLDmbE1bOzhC
         tbYWSfhAKF40mHeD/ZvxTFY2UvHzJzS5h8PEXEY7SQkN+46pY1RI5CEYzzmxShqflzYj
         ibnn3mB0yFaLe1kVtGhVzbQ7HvI0QiVbKkU3zeuVoncbEcALknyZMgmYIUb9DI8k37J6
         B2Uv4H3WzXT9cR+dBcCBfUrjdjC6MyXDahDNxqqhZ0hnkNjTUHP7qvsJjS6pr+8mO1Rl
         +h5w==
X-Forwarded-Encrypted: i=1; AJvYcCX26TKtUkJ3Ge0UvN9CpyZMwXKwimCrMY3Oi/TPv7jQsb2jnqr2ifQeTVtHWaj1HG+pfZQDr5AO8WYLRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xa3fZOPFbqJu+5hxhuF9dALGmKwnbS1/+a+7DtLyKKSpnVFL
	fOlsL3JM6hTrT/FhTxuc3MpB7HGl4Py8q6ZQnAuXrfuSNNo6CdWwDoVTFPs1QvKmGXg=
X-Gm-Gg: ASbGncsPkH/VDKBngNi2e5lM2bScvN9/RWlz/f+KAssZTxrwLv70Bko3qis0fu0YuIJ
	JuwhdoS6gzSzKY67bh1zp8pZZZVdZZdlvwoiHKrJxlszjZje7PC8JV/A0Cq7uATBY37We5CQLKw
	IDVxpDOd1IM0DUisQ5OSy8NEnKJIKirJKJyJrMCCwsZvMOXq0JlE6gKfmlNgCBbUsV1SqrLwXYH
	StVsJtvOLzm0IRDNUxII8hPNnnuvm+oXoAztsQC86UKcgVWhqSzRoMDNwBBHzPbRTSI2ZxyeRTd
	t0VTKnfdLxsiwyZSxdqCMdRtBGlrymV4E11ViKUavRswwB8JLzxL4T+6YPUZ0aNlWqWkw8B9K3m
	iR0033bcOFl1rLdMKRoyaGdjQ6G71iwj56hY=
X-Google-Smtp-Source: AGHT+IEdwrBA8fEPouruiBjmjO1y+VLHrsJ6SO97Twxy5LbO1fb87iKCtpWKSDsewOGX8ikCQhJ2gQ==
X-Received: by 2002:a05:6a00:3907:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-7702faaf2acmr35042659b3a.18.1756448295215;
        Thu, 28 Aug 2025 23:18:15 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1b21sm1307488b3a.69.2025.08.28.23.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:18:14 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:48:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/18] cpufreq: mediatek: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829061812.fziokvashujzbtth@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-9-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-9-zhangzihuan@kylinos.cn>

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index f3f02c4b6888..1fae060e16d9 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -320,7 +320,7 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  	struct dev_pm_opp *new_opp;
>  	struct mtk_cpu_dvfs_info *info;
>  	unsigned long freq, volt;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  	int ret = 0;
>  
>  	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
> @@ -354,11 +354,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  
>  			dev_pm_opp_put(new_opp);
>  			policy = cpufreq_cpu_get(info->opp_cpu);
> -			if (policy) {
> +			if (policy)
>  				cpufreq_driver_target(policy, freq / 1000,
>  						      CPUFREQ_RELATION_L);
> -				cpufreq_cpu_put(policy);
> -			}
>  		}
>  	}

Merged with:

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 1fae060e16d9..fae062a6431f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -320,7 +320,6 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
        struct dev_pm_opp *new_opp;
        struct mtk_cpu_dvfs_info *info;
        unsigned long freq, volt;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);
        int ret = 0;

        info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
@@ -353,7 +352,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
                        }

                        dev_pm_opp_put(new_opp);
-                       policy = cpufreq_cpu_get(info->opp_cpu);
+
+                       struct cpufreq_policy *policy __free(put_cpufreq_policy)
+                               = cpufreq_cpu_get(info->opp_cpu);
                        if (policy)
                                cpufreq_driver_target(policy, freq / 1000,
                                                      CPUFREQ_RELATION_L);

-- 
viresh
