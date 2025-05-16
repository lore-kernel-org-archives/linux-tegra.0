Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC71218ADE
	for <linux-tegra@vger.kernel.org>; Fri, 16 May 2025 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387261; cv=none; b=imibqSxAyRR00j7aEj8slS1y6ke79i8q3daccC/tv3tdnDkLkmnFixq3YBYCcJlbg76Q+IPfpfpyt9qvFjad3QLJgh6d6w0vFrGhuO8DjrjI33xcAEpNCy5mtXZTafe/VvVYOFqQQkUR39CuH1wrx536mYGN1uyFa1xnaiCtzJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387261; c=relaxed/simple;
	bh=LKnFOUwwXq/9fAvcKvTjoW/6ZFr5JUhO2L711QhoihA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaKAnSkMpceCd0rat0yjANhGXdRNHMIr4CFasqcMcXmCq5S7zbe0N47HCLlqUr+ce+JQksUK9qGdW2xjO1IgHj18/tVcXWH8vzsnQKQQdvdbmr+wwt1AnAx14T55I1ISpkZLOhguG+DvLRV9uP2EYwNdwJstpoZGCc05dMeayFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yt97lc3e; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yt97lc3e"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so13537285e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 May 2025 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747387256; x=1747992056; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oVkdhl0yZ1MFLhzxiopsXMYZ7EZJ0whWLEhnArATGGM=;
        b=yt97lc3e5iz9s7CTwnr5fw38Q04ZN+A9rhPxyeIhYoC1E/Z6M2KlEH0gLtv29oBBDj
         Gv0zvo5yQSvwgBPht518ICoLAM3dP/x9QrstAsaogn+8F9KXqPHKBb7Or1lYlTEwEKFU
         22SvuXQfLDDdYr2pPWrKPsudEk8lwDrmGFgFq+Nrc697Ym2/8kMCKaM09k3q00B6DUIV
         50Y4leJyswQUOe55uu+aKouyephrTKusMS3Rfa5tY663V1BwAJg8Vh2MLkttdpLrJ+qp
         NnNEYot0MFayLff8B5Ws/fpK5FmTwggGs1IcfAh2FTjtrn6RO+dLLRDGtx3MloIBy45k
         3+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747387256; x=1747992056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVkdhl0yZ1MFLhzxiopsXMYZ7EZJ0whWLEhnArATGGM=;
        b=pQxNhnFnUnKYolbkyqunDB84SAJF1ZymHckVvbUaqYmvNMXSd1yVbc+ZTsBYV64O+U
         ZRo3zTrkFBDnBNN8iRyQAbtLRHKOAbYHhH6yCL7a4le5n793szx9QSDRNb8Z/XtsSNNP
         +1TSwMEdV5grXUxscbkv4BjbgnFJ7hrwPtYJzr3LAl3cD23rto7dp7Vdn4/mqxdveU0v
         HJdgioRlWfljKha4HRjJHdxISd5qxvl1qS0LnbMJPMU95K9mDP1bV4xnj/J9W6OHkfPX
         qAAYXQc7j4vEQs3XkEPIXolUfTHGmFSZEY99wItPbe8GBzyRaj1wTafrz0w32yNmTIl4
         lyPg==
X-Forwarded-Encrypted: i=1; AJvYcCXT8Q2zRXBoscEJ4SVDRbZZgMs06/HWSQBhRL6CebIcsVFVasrboLvmdb9VFi4ndiVaIiq0Y3i2n/EBBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBAF/RFRAO9M/ZaWsaKvixDx60G7VeVeCWts9jRkqRtMtmxqB9
	jMZELbClS1NQEI8NS2Flik+nFTtxD5SU4wGtuyJ4fv/n/rRlA5dKT+MV3igheVhR5Dg=
X-Gm-Gg: ASbGncuCqn8Mdp+pxOUbfBMiPsPecOYc2dcJAFICqpZ+YgKseH7C1SThh9BOld7NwEi
	uk/qrIaanTumncVYN2DUR0hkadjOp0qG1u9sG396o7ShGNqASgv0J9V7YwhPcQn57oFiFgjFyhq
	i1sok2x+4shxvrPbtmB5TvvEzT2cS6FjRXxNKbX2DZCC4smUWQY0KUNVMrksGOt+oNeKF7uRfhK
	YcLzZwZSO/5JJfOtAum8WxbxmM7J0iBF8phuxgFDqf8sbPFLk2/NVXRmvVsVrxrSMlqIJEKuApo
	dWMwTFLh4zWXqAWEAKvEzsWF6Krk+PnQ/BsYyY4ah2U74QHKOlvrA4Xv/5Mahv4xZVcXpChtctM
	LM/Q1FWyGUnmLng==
X-Google-Smtp-Source: AGHT+IES3ifXyD0j3PvByP7vCZ00BMKCLJoV59bgFS9BgxMTVRCSsT0jxN+o23wdcE+SKI61YC0zEw==
X-Received: by 2002:a05:600c:34d5:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-442fefd5e7fmr17195875e9.1.1747387256441;
        Fri, 16 May 2025 02:20:56 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d263sm2210297f8f.3.2025.05.16.02.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:20:55 -0700 (PDT)
Date: Fri, 16 May 2025 11:20:54 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] soc: tegra: fuse: add Tegra114 nvmem cells and
 fuse lookups
Message-ID: <aCcDdqXo_d34BHpE@mai.linaro.org>
References: <20250321145326.113211-1-clamor95@gmail.com>
 <20250321145326.113211-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321145326.113211-2-clamor95@gmail.com>

On Fri, Mar 21, 2025 at 04:53:22PM +0200, Svyatoslav Ryhel wrote:
> Add missing Tegra114 nvmem cells and fuse lookups which were added for
> Tegra124+ but omitted for Tegra114.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra30.c | 122 ++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c

Why this code does not end up in a fuse-tegra114.c ? (as there is
speedo-tegra114.c along in the directory) ?

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
