Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CE537F8B6
	for <linux-tegra@vger.kernel.org>; Thu, 18 Jun 2026 05:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781760523; cv=none; b=JC0lofY9dv3wxGNR0U3xUACaLbxxWqZ5HPZGLl6748zOwMOSXs5MyT5HnzNBA2frK4ZVgYC2I1IL28EJBBJTJeeSL6syj8UZnoIH5HA9hKFgQAZMRlWo9Wa4SLRxya5JliUSK9mqeVxusCFaPhOMOd0PC5m2jws0024KXibIz3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781760523; c=relaxed/simple;
	bh=TgqiDw5b5VQPj2Gfb7xm2gYBgCDZhtqTtCOxTAHstTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gl7DQQRg+N2VYvk+p70u++L7Kfp39F7DXuZuep0B8gmYW1SENKCrL9JXke/h6LGkJkcT+B+Bw8309UznSIS9jfCsMdRHYToFo/Lpr0agHwZP9aIleRL2AoMSmlrlfldfLFlWPS0KNoT+uMQhXkfJCGdbum0CX5M29EpwAYRmnBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRUzUAiH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRUzUAiH"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8424b00710aso324418b3a.0
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jun 2026 22:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781760521; x=1782365321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ7ZXggT1jvOznKKnf3hT4I4MdXGJIQvuFkuvRa45Xo=;
        b=JRUzUAiHNxDBBvyOrXh5a4Xa3O1S32Ie+Tcbymejrg0AHdoyZkTSfaOfQfl0WCmzLz
         T2z90cjHhE8/HxhS3GhqoBDUz2vPXRyNZMStXWfo0yXRNHc0F6DLVL52PlDpi6X+9DVs
         /vCUkYHHq7/TqMwxV6kQAPhTLZ5h5j6e/8+eweKYdS2PyKM0KLq0JaTkjL/hzSEmlcDq
         0kJRw8511dZheFUGsbSzrPr8/D1q6qR/KJu9nPPf77RzLHbeLJUDLBv+jo/R1qp6tnCb
         YTI+zMHEdgqMIa31nWEjHL7T8Eiqbk3UltBGlkBDKKdUEy4gaR5AwrUqUHFjRzQrzPtX
         Xhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781760521; x=1782365321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQ7ZXggT1jvOznKKnf3hT4I4MdXGJIQvuFkuvRa45Xo=;
        b=FYYgCeQAC9yvYqYSDFVrY1i66CWzjvk4FJoo9Jsox1wz48R+AKGnpUdlFnjknO6Ayx
         3fukd10ZJTVWNkM8vqehiSZWKU8wXnULSLlSDwkD7T5Qi6pE1UITHC7eynxAdGQ+6EtD
         kFScvamt7OctdN3D0LT1O4yOf6XNwAHIIBlRCOp4SQXECEmyFmjHADQCruMv73VOKcHE
         Bq3hp+LqTQ2TN96FE/JuTWa7n5CGPXxyfacaSst7fzm+6gg8MviCehVaiWClQ5F5YoGd
         rW6nB0q7cZjJC35X9eLVXK3AgahnfNnbhMwEQndHU2jJO6j3c+FBr05oh7UEqA442HLB
         QmIw==
X-Forwarded-Encrypted: i=1; AFNElJ/guhZbyW7vLdgKn2lZY3P7dy4JUw9U3FESALliuTuBOqXZKO75ZMITeo4FT5hx5UHNJrYSAmF7u3wAzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt04PZeRoM80cuM69BIAiMkX0phgvRjGWchxD0nW63i39djLim
	TrEYUig1lxwCmHh+GXLGfgNsI/9TJTdBdTa0DhRCPwQehrJIdV31HGsOv44VUFzUIdA=
X-Gm-Gg: Acq92OEih9fzaN7/IANBvVwaxce+utCMwkeDTE4HyiGiqP27uypRKcQxfb0AVWzbgP6
	y5lJihw1UIvIepDZSIjrr7HGPVrWSA5IJ6qunGlNERCywI/9F94QrIR4BWDBFoTwmB/GpBpcM3Y
	1DbO0eFfT8gGC5joKr02lL1gF93x+ddPl1OxT1wFbOPwb04lqvDltnFWMKg+rfDL7Tgkf6xp8cd
	q9wwECT/L2O/EztNdzO8bI9F5n0RnozmNBENLqzNdtbTMcsFN1LpxCmGcq7JVeyh8oq2mDr609U
	nOOAr1l14qOUMV4TeQi7C4UZMZw4CSY4Q4ed+6/xTsfwvNHFe19z/HmG2D377L4o4U8jTmuXuPC
	x5xWZZ7vTalqFIQ8lvTUXWiAdkY2GJvASNj22GgcGtRka7m1tZaMIJ6Wg61k3xK+Yd0XQFK8gpG
	MPrmX+zpVdqryM
X-Received: by 2002:a05:6a00:298d:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-8452457b4acmr7514220b3a.38.1781760521287;
        Wed, 17 Jun 2026 22:28:41 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b049120sm17827806b3a.55.2026.06.17.22.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 22:28:40 -0700 (PDT)
Date: Thu, 18 Jun 2026 10:58:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, pierre.gondois@arm.com, ionela.voinescu@arm.com, 
	zhenglifeng1@huawei.com, zhanjie9@hisilicon.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, mario.limonciello@amd.com, 
	linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, 
	ksitaraman@nvidia.com, sanjayc@nvidia.com, mochs@nvidia.com, bbasu@nvidia.com
Subject: Re: [PATCH v4 0/2] cpufreq: CPPC: add autonomous mode boot parameter
 support
Message-ID: <oxw5k2wad4vorehgmrduoxblequy3ynqufwy4sruclnh5d5wrb@awzmfafoucnn>
References: <20260527202550.206828-1-sumitg@nvidia.com>
 <eacc76aa-318c-4b41-b507-e91e322561de@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eacc76aa-318c-4b41-b507-e91e322561de@nvidia.com>

On 16-06-26, 18:22, Sumit Gupta wrote:
> The dependency it was waiting on, the "cpufreq: Set policy->min and
> max as real QoS constraints" series, is now in linux-pm (linux-next).
> I rebased on top and verified autonomous mode works as expected, and
> it applies cleanly on the current linux-next.
> 
> The [1] reference in patch 2/2 points to v2 of that series; the merged
> version is v3 [2].
> 
> If there are no further comments, please consider acking and queuing
> this for the next cycle.

I was waiting for CPPC reviewers to provide some feedback.i

Jie / Lifeng / Pierre ?

-- 
viresh
