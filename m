Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40003466B65
	for <linux-tegra@vger.kernel.org>; Wed,  6 May 2026 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084063; cv=none; b=f8ubzI6Rm1zbi0KvlnRuA0HFiCgi+P6+fNuhwla+8N7bkc/1q+Np/dc/1ApCMvlQyo+ey+cT3JNLmjIbgDZ3ejFmWxbGuiCugckQi6Kx0PdzBtAoWXovQavEheg1S9/RDV/qPZhkFuEWPYuMWH+tceGWjNrVqlxtjPyHxQRhXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084063; c=relaxed/simple;
	bh=T+hwVHoy+/HW70H4b4ny1tz+u9z10JcY5ob6OwvauXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i09QBIsaUcFudWskchTf1axjdDl0rgYoue9bFk+E+o4XsrBwHgorjdFUkYnyPN1ZoWx/Rl4W+7sxO0w3P9ygf271UjJXOYfvdNDnFg3kG8uXOS6cO2t6EuQAXFhySbQqpiFWgu1yb+VUtVZeK7Wddiu3JhDI/86q2Kw+JqrsObM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqAg1DQL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqAg1DQL"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dea72099eso6693687e87.0
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778084056; x=1778688856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QpS9p5To8P4BftdAlsDaBegfX21bw2fBoqWrx1dYiXE=;
        b=oqAg1DQLyT1XmAPaltQ+v5D5NGDIUFmqL8DMIIgdEXMsXXu8D11qsPAtu7mycGuWIN
         u2jGvpcEqLaxG2CqMcsBt6HFrhfmjqQJif2P/CjuB1e2CLyomhLQ58/A/mq3aBtNC0ra
         FjL4kjdxZh9uUrx97XmXVPvgxEb2You1mx9bPwdAekIi8rnbh77547Htce3/Pm+T8af/
         4ArDZwLqL/XaEKpR9AT7GlNzyACVwwrpT49MNaVbgGO2Viku2SMFqhM4OGfTKkd3aAuL
         LMqZdQ0GKmgsiOZszGaknj/YovO8af3f65RcEoq+gAFf8t0gTMSOvEYDv3PX8huWQQdR
         rEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778084056; x=1778688856;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpS9p5To8P4BftdAlsDaBegfX21bw2fBoqWrx1dYiXE=;
        b=J1BqxUlmjnEX8HVRfQ7WpiVXvnC2GUV7ut8yMMJfkvyYPlHEWVagnrlsVWTh5lyrIP
         ntab9jEevPC0wsCKRXNGIbLI35GiCUT9mP2H9uRcauHJoTupkjmm2O9cC7bJ3+YJzWM1
         ZbngichRwv9X5q5nJZxw/cwDWcyTXr7tH1Mf2PvHosxPRFpidBZN8v9pzEHIgxDfel7l
         IfmcWYIRQu5RVGNt8DLcFrsf6OlWdTuAeYiHULdEC9ZXCnUBRZnBIM30KXFtC7velkiI
         bfYIJgAPU8NkmdwrcFkxEt7pFHF7wF41kw1V6raPbdurxZvFgoz4OC0LFrIb2OX6pk3/
         phPw==
X-Forwarded-Encrypted: i=1; AFNElJ8/+/MnHGzWMEp4CURTh0nUUcT4A900bChtFUvVqb4mtq1Bn/f53Xw1KSkbOzsZDM++x+6HDvbX2MMhKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnlvBb6A+0iHwpC6jTeqPgWAxZxE5lZXSWTa1cWLpb/Lz9cEud
	EOVEdVBPCoa6CZCd+mBlvKwCm70QjlKKeXGniqwBTZavA4ONfXYzWgRs
X-Gm-Gg: AeBDiesOJ6LSLNP4tKqoSi87rR88Ez1qvf7wg5xtMR1u1XUeEm+MlC6DyShxZbvvTuC
	Q4y3pDZxik15zcI4aG+TDd7+ZYcjH6tcumtLSjyia1OJZQV67J3wp5UPgDzHXu7xlIrv5LVmc5b
	BwHyzD2BSafmx31DdBgrgUV0xTxQdyW9nZLjhlQOGxWPBwWcSe6OdlxOmQ1rBykDUPzX7tRx+V9
	5MG60/5gXKzeKe8h9t1cdC5e/5vw35bqZ/jkvo9ef+dnc1S9AEz70jiPYhhTDQ1pLsMoOrz7IhC
	0/4Bt0rkk4EWOkoqotdtPL3L+tBfAe58dKV8ngKkbj/c6h0pyq9M2rC5GiiHGn4VG+6a6nJA45w
	tjOFlMg1cl1T941qogzbRhejlYHce7yPqNu4oKz2KVCr1wGFjZAaIkWngLArc3IPet2NfsSreaZ
	nSGEV198CyGPaCgJLU3a615fp9vcTZaWXdF+EN6KX0Xjmrc9c8W4PcgU4AGZ+x5N+2eI0HLfro6
	A==
X-Received: by 2002:a05:6512:308b:b0:5a8:89c5:2c0f with SMTP id 2adb3069b0e04-5a889c52e35mr1306160e87.25.1778084055726;
        Wed, 06 May 2026 09:14:15 -0700 (PDT)
Received: from [192.168.2.20] (109-252-156-195.dynamic.spd-mgts.ru. [109.252.156.195])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa3d540sm3844372e87.17.2026.05.06.09.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:14:14 -0700 (PDT)
Message-ID: <9af23def-ffa7-4f68-8aa1-ab080b6c1c4f@gmail.com>
Date: Wed, 6 May 2026 19:14:07 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: nvidia: tegra-vde: Fix iommu_map_sgtable()
 return value check
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260421-iommu_map_sgtable-return-v1-0-fb484c07d2a1@nvidia.com>
 <20260421-iommu_map_sgtable-return-v1-4-fb484c07d2a1@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Content-Language: en-US
In-Reply-To: <20260421-iommu_map_sgtable-return-v1-4-fb484c07d2a1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

21.04.2026 07:02, Mikko Perttunen пишет:
> Commit "iommu: return full error code from iommu_map_sg[_atomic]()"
> changed iommu_map_sgtable() to return an ssize_t and negative values
> in error cases, rather than a size_t and a zero.
> 
> Update tegra_vde_iommu_map() to correctly check for errors from
> iommu_map_sgtable.
> 
> Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_atomic]()")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/iommu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nvidia/tegra-vde/iommu.c b/drivers/media/platform/nvidia/tegra-vde/iommu.c
> index b1d9d841d944..824d2aa80a43 100644
> --- a/drivers/media/platform/nvidia/tegra-vde/iommu.c
> +++ b/drivers/media/platform/nvidia/tegra-vde/iommu.c
> @@ -25,6 +25,7 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
>  	unsigned long shift;
>  	unsigned long end;
>  	dma_addr_t addr;
> +	ssize_t map_err;
>  
>  	end = vde->domain->geometry.aperture_end;
>  	size = iova_align(&vde->iova, size);
> @@ -36,11 +37,11 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
>  
>  	addr = iova_dma_addr(&vde->iova, iova);
>  
> -	size = iommu_map_sgtable(vde->domain, addr, sgt,
> -				 IOMMU_READ | IOMMU_WRITE);
> -	if (!size) {
> +	map_err = iommu_map_sgtable(vde->domain, addr, sgt,
> +				    IOMMU_READ | IOMMU_WRITE);
> +	if (map_err < 0) {
>  		__free_iova(&vde->iova, iova);
> -		return -ENXIO;
> +		return map_err;
>  	}
>  
>  	*iovap = iova;
> 

Acked-by: Dmitry Osipenko <digetx@gmail.com>
