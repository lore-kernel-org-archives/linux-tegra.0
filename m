Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBE723BF83
	for <linux-tegra@vger.kernel.org>; Fri, 29 Aug 2025 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448789; cv=none; b=HG/+uKV0TYzqWFYBF+VmaPpzBJE855eb5gxQOGEAi6qWLS/g1axskwK34iS3EZKmhe5CnvXerWK8PyeGeikdqkanQYBZF67lG0Wp5OFDohYtsurlyEIG40/P+1my5v6dOQaHIxkpkw10WNXOT76TPEpdnEu8n5Z19fPzjEeU0iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448789; c=relaxed/simple;
	bh=fAwq717gxOG/gzksvHcfVeqsyH5k6BHHvFVv/kB6CwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzQYy8dSwQsk+R7T1wPAm+5+GDN7KYjaxFPw8BKkV/dTFgDzzTyXGXfr8ZxGhPjsH/5g0x9dKRamTY7qyE8h2zH9YZyuq2Ujis2XwA3lmdNKGU1ESMaw0w2WX1IDI4kzasVTy+oLONgQVn60cfR1caDf1dKFv75BzY8cErfrq4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tRxUklAE; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRxUklAE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso1322160a91.1
        for <linux-tegra@vger.kernel.org>; Thu, 28 Aug 2025 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756448787; x=1757053587; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
        b=tRxUklAEuzasI1s6Lx3jlhz8OcQE+0enb6h0YDY5HN2tcCHLotxk3ezgMcqrkt3Knk
         awzj2x6qCHsapRtXpBizhUz/o+aTOuw+Lhri5MMTlXuwQeMbaIfE4FQ/ErAIk1xDMN99
         BKAvR4KmbqeteBgOpx8B5F6mC4+9BN6gVvuvTyjeumqUOlLnaB9tTwTNEsYnCASWeh81
         rqcMxpcOjttiJDuNQ58rSn1WG9GF49dFTULEtamhoAp9q1G4xOTYsVdHB7FW5Jswf5bM
         6m7I7xNOtFa1txrICmEztSRnWOwZCC2/zHc34Bk0svK6asUIm9/dET3VBtZ9uDN96ZJ5
         bWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448787; x=1757053587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
        b=uz7sqELJAs0mV56pf0NgjLxEgZ4xstbLXioy8qjFMJsaSL6gaP0nDJgh8izvdLj1hX
         TORVUn+3aB+GcZANF9sW4tKcFYr2RPgTiV1y+z7eWhsvBu+GQ1cj+uDmx9m9F781sepZ
         4Hi9uBrDfcqbUBQyUK+gsBYRXQ9AcHoOumjtApUc9GpG0Ar58p3szSYAvG68B50L22Sw
         2/uC6plb/ubAF0FXjYzSrikbt9FuY+hqTMrk3S3MSZGm0Sk2z4vSJEwNlw4oWKKXuVNH
         LF9A+n2uknVCIO1aq7qbBWkTgw+8gavdu9MzuQZCgvUPPu47Zv0AJhJMQUEbyLPvbJRi
         KioQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGoRZXMzdNo0eVMQe+peHVz6IPSwD2E80lXzH35vzlpvi7MG5K9LGV/EfzzNJxbQZbu4WfeaikOCGCnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFc0xL7SVM4E7Nbmz5QPj+LxSVtLPFnoygmQ6Mg5ignELnOnh
	pZvLFqf4xrRfIdweG7433GwGI0e5crXlnP9mLVYjjEkAMCCtAK3j9jo5Akz2RIbG4w4=
X-Gm-Gg: ASbGncvnofL2oDzey2/mMmalGF/RiC9X4w5vDmPOqN2RRg5odBRSxxyXcc/iSr9Fgkh
	EQeKsLSoepP5pmrOPyTUKhB+9wT6SkBcRJx3zXSnXKW6QhDWMCHOwjOYm+ws/5O3vrP/C2sy1gJ
	R9RXQN9xhVWSyhAhqorDD88epKafp67rN9yNG1aZo3vEdytFUeoKd0pSrj37P/dFg8vwYXs+kLL
	1AOEIPZ24JeQDIg4aHO79qGKzE0GNjgz/Veu8FAXwR7zV5KGXuFiPGrVYbcKSKjCtzsqeidvfHv
	O1dWF9iY/pbYvFrE45E85tUZBx1rsqRRQRgAGE21f+bV2eBgZxMwRc8n4/Pa+Z8TJ5Po0uGYKnP
	iBx4M+RqlJkPPUuI3EeI80gmR
X-Google-Smtp-Source: AGHT+IFHYb22k9tJefksk8Ol8WzLcbkUpFNWBPL7w5JQ2Y92t38N6cXrTs0utCYM4huh3xQWCdkxbA==
X-Received: by 2002:a17:90b:57ce:b0:31f:210e:e34a with SMTP id 98e67ed59e1d1-32515eacfddmr32147827a91.8.1756448787009;
        Thu, 28 Aug 2025 23:26:27 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd4bd6sm6984417a91.15.2025.08.28.23.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:26:26 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:56:24 +0530
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
Subject: Re: [PATCH v2 04/18] cpufreq: brcmstb-avs-cpufreq: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829062624.jalqqsigs7hanf7i@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
 <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
 <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>

On 29-08-25, 14:16, Zihuan Zhang wrote:
> Thanks for applying the patch!
> 
> I’ve been thinking further — instead of using __free directly, maybe we
> could introduce a small macro wrapper around it to make the release scope
> more controllable and consistent.
> 
> Link:
> https://lore.kernel.org/all/6174bcc8-30f5-479b-bac6-f42eb1232b4d@kylinos.cn/
> 
> Do you think this would be a better approach, or should we just stick with
> the current use of __free?

Lets keep it simple for now and use __free directly. And keep this
similar with other parts of the kernel.

-- 
viresh
