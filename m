Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4873523BF9B
	for <linux-tegra@vger.kernel.org>; Fri, 29 Aug 2025 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448998; cv=none; b=Jf08QqwTJlerhTXX7EZMOL8We52tYJnRBsc6JdJ9K6HssI4LH4t+kuxt4+K0kYBKW+i6In1ndysm0ezqakuZfVItKneLl8WLQ2Hjij8408V+qlak31TcCTMQADiV9j9uE2YxyjKOjOsxG/Alkdj50PH32BIYPk60rfi+z+5NGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448998; c=relaxed/simple;
	bh=tGwSjGcSe128TtD7AHOwtP4PhJjbYMmvmFE0Ow3n7qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Myx5ynB26NYAWoq4VNnkhuxeuyplhiN3CG02yDbCWZMfXXCFgX64+SW1ihML7UkGlVamW0lKn/M507MClbU4UGaecUC8MKBq5pT7WXgjNAP1dLbytvkLavFIQqlO88Tn8Zp9R0prlJAxFdbisVQs18sRnzKZW4X4a+r/o9MVu+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DY+dr7/5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DY+dr7/5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2445826fd9dso21220315ad.3
        for <linux-tegra@vger.kernel.org>; Thu, 28 Aug 2025 23:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756448994; x=1757053794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CokGLX1/yeX4DJMWAz1LmKt9I3G7o4FsQeoqSBuvVPY=;
        b=DY+dr7/5AYifsOB2jkD7YJAsc3EkrlaD87ZXXamuk9eRkkMJ9bpnQ9NtXMZ/m51IKQ
         W/hX2Lw6m0Rt0MhX1aPSSTW9JLm86s5TQ2RzZMEmZ6dh+fP2B/0WD9sedlLY6U8vdemg
         vgJUR7AoHH7XBq150ld8OwdWMrwMMWJaGceCKAQYyBPtm8a0Smyv6A0n34uMtGDaORO2
         4mlx/LccHp7VeojfM7fpq5uP73YyvyuPTazRWuYKAV0afPy8ZOr5NJXQbO3+97peg41E
         17fE3BWXly2lo/ybsuFDeSDci0+y8pU02yXE3h2KSXlPDpZfYhFvtBGsh6qu/Oee6ZBB
         Xd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448994; x=1757053794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CokGLX1/yeX4DJMWAz1LmKt9I3G7o4FsQeoqSBuvVPY=;
        b=s9xLV14kDeqaKBXOcVlUeS36G0Ypd85VjmiMAgYEuAK/amvT4adg2+HFUT4gikQ0Os
         zrRJ3Mk0pmqPpPYzelwt99+QgDKRGZ6x9LD+CqarlbeMMWb69haLd9UC5cRfssqbWJGG
         fZLQDk8XUJa3bkSpmgPeyaLJpOpqBPJ+8KP1Cg0HU9Kl68o+/9Z7DXugchrRk9eLMGQA
         JoRjAN+Dj1ljIr4DXUO3CCHLGnVyZrWAOeYfV+zIA4y5rXXeqI0arCCLUc5kkLslctIF
         i0P7fLOQvhma1WLYen7wl7VbMcXqWr9uME7vwMFqXOUcSh5FYZeBzdFQiLZ8ZMaZymDg
         Eeow==
X-Forwarded-Encrypted: i=1; AJvYcCXYKe/FNPHpAymYRxNnFww1wWpt1rbu5fF8h6EDWolsjTR7/+1shEJr/goxPULIHFeoDuvD9D1N5zpQKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxszwVSeCwis0YI5X5RlH1823W520/Ciy4AXFSj7hTT8BVZv2+7
	AP00n5Sg93U3lEI4o/ZZGCzVL/lUorAr0PJFuKK9vFkfi4j327teD2NJhxi4tOTknyg=
X-Gm-Gg: ASbGncsF9/yObr5dFQPF2hroTXWjbQ/Hjswf8oo6Ie88s64EIdvROSv4YQwYfhI0Oe2
	fPWEqs1y7tQkR+OQmJs73y6Zn1LdYzHha0L3vczlLiyMw25CvrcXJ/2Jd7Y45MC/Yg3G/8dqdbO
	R4MQxZ9TSZsaI/8woMGvnWtAmvUHN9V2d/aQwFT2Yx08i+O+pDjIx9f8/THzp7oqv3ywzO4U1fF
	S6cqtGXgskttRsa1g0f+GSaEr88NLljtn9CSlSlzfAQAtM5SYRhNUnU615HM7Iti15Hq4Tg+8y8
	V+q8TaUM+rQiyBjcjv47EJa30tsbEKqdIBpLk3f/loOqI508tNot+QcX73prTb5J1PbHc5jJHmz
	Rjcp/a898Qd6EvJ8nkIJVN/iL
X-Google-Smtp-Source: AGHT+IFbX3s0aoe3pqEivfWfaakWxvchfFFbfgXfyIlcOqslqMMZIBk7FeaK/V2UaSwtVV106XuK4Q==
X-Received: by 2002:a17:902:ec89:b0:245:fa00:6e25 with SMTP id d9443c01a7336-2462ef1ea0bmr386065885ad.28.1756448994426;
        Thu, 28 Aug 2025 23:29:54 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903705be3sm14571325ad.18.2025.08.28.23.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:29:53 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:59:51 +0530
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
Subject: Re: [PATCH v2 11/18] cpufreq: tegra186: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829062951.ximauv2so442q4gv@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-12-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-12-zhangzihuan@kylinos.cn>

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index cbabb726c664..4d71e262a729 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -105,7 +105,7 @@ static unsigned int tegra186_cpufreq_get(unsigned int cpu)
>  {
>  	struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
>  	struct tegra186_cpufreq_cluster *cluster;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  	unsigned int edvd_offset, cluster_id;
>  	u32 ndiv;
>  
> @@ -117,7 +117,6 @@ static unsigned int tegra186_cpufreq_get(unsigned int cpu)
>  	ndiv = readl(data->regs + edvd_offset) & EDVD_CORE_VOLT_FREQ_F_MASK;
>  	cluster_id = data->cpus[policy->cpu].bpmp_cluster_id;
>  	cluster = &data->clusters[cluster_id];
> -	cpufreq_cpu_put(policy);
>  
>  	return (cluster->ref_clk_khz * ndiv) / cluster->div;

Merged with:

diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
index 4d71e262a729..4270686fc3e3 100644
--- a/drivers/cpufreq/tegra186-cpufreq.c
+++ b/drivers/cpufreq/tegra186-cpufreq.c
@@ -103,13 +103,12 @@ static int tegra186_cpufreq_set_target(struct cpufreq_policy *policy,
 
 static unsigned int tegra186_cpufreq_get(unsigned int cpu)
 {
+       struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(cpu);
        struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
        struct tegra186_cpufreq_cluster *cluster;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);
        unsigned int edvd_offset, cluster_id;
        u32 ndiv;
 
-       policy = cpufreq_cpu_get(cpu);
        if (!policy)
                return 0;
 

-- 
viresh
