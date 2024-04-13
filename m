Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBDE1D551
	for <linux-tegra@vger.kernel.org>; Sat, 13 Apr 2024 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712995725; cv=none; b=duQOY4sjzEycGnCyzOUX/0nnQ4PilE5tvtiIcd3ZIqaYcXaRBJauIHOnWRpnke7vNcl8pt1FkXPl5oy6ryXf7Y1UDQQ4XT/COazzaB1px+8CY9nHN3NcyB+/bYUxj6LAmOn9Xu6TVPbfmR4Yo+4kYnwWZdwW6esyYdKZDyRhlHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712995725; c=relaxed/simple;
	bh=iGuIaCWJV28ftOSqSMHRvUs6RLhEHSuMlyOxvXmLC30=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GmtqjNI/tKhIGHAHIj3y/OwfCVfOUCALbTrGelWQdjrLNkfO73iRygnqP8VNLM7Me2CMcxpiSiuQSnCgFQ2QP4kTKP6lUm9RHhG/5+qC0PdvlKSEto26ZVMnBm2QzJAlMZgcvF6MsfNaB5R9954vjRmEyVm3YUNPf3Jsgu8EeJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JR2ckmYx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JR2ckmYx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-345b857d7adso1139098f8f.1
        for <linux-tegra@vger.kernel.org>; Sat, 13 Apr 2024 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712995722; x=1713600522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7uBpe8YPU3nyYguDDW+pDZvPuvaCkjefaQtko3qFPIc=;
        b=JR2ckmYxVXSx9YfmHo/FazAHDDRxXiJK8aFoHpEiFCpPPLJLJdFAMkerRLuoPTX5BO
         fv57kccTCzySTcJIu0AANm+o8HaQdZ1+R8WHFMsIKLAuwN7mKYFcZLAelzOMe+z8QB95
         D2caubSuZ84aBPQr3n0STziX3QQ1dfEN4Z8kMoz8uDHE6UFTzpQwouECpCqLyMKX2UVS
         3y68NaGVSPQODQVwWRyKfIooJWx28+5xQ23vH5bKyL3V5ddH1wXUhoGnvfg0qIpiGPWc
         2zl89OfYE/GNc97UXnwBCyyWBfH4fkOQeWA5XhUGxHLlZFginFCCDtr6xsr+Jco66TeJ
         rwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712995722; x=1713600522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uBpe8YPU3nyYguDDW+pDZvPuvaCkjefaQtko3qFPIc=;
        b=EIDB4Wej+ElTgrzU/d0i86ppjEGEkudyhTmRt7kFmy4t4rGZwCWoTZFifsXnVHYdCz
         s2DPu2vljEkrwk/SbIHrcPASUPZoU4PxdYmM9LcPS0FMH6pJisIAQinC2qQ3yqiWD5B1
         Q7e/hWG1e08ZaWKuNErDO9CYXITNAJI2LL+jJUJDN9079Okr7z7zSuZ+qNLqqftfEupj
         JiQL/4xzkA1v40L78lG4xzSMhhJDn9kf6Pz6QznuUIlszLVJRchJvtIz4ahGRcREDP35
         YV16YgW/7X3LKcR6x7ZX49d8PV+hX4b4iIXPmLBe3g0oIN+u0fJYyyvBtRfP/i890hME
         Jg8w==
X-Forwarded-Encrypted: i=1; AJvYcCXBccFzp/MlOIxqT2KP612s8246PUfhkrCbRot0uPUxnzJb3RGewbP6bVRcIoyKMEY7jKdznA3IG0zVtBHT6yCOWYmWFq9GgQyRYxA=
X-Gm-Message-State: AOJu0Yz8grsItLFFyaOb7lGoTyG7K8YsfgUMZVcwKC8Y4WaJiWOHRxh4
	Dm545Ku29KJwdMTODi8Cs8KNYKz/rPJqK1GanaC5Rm6lfKsEujWa5YNlHsEoPLb4POcQQrc5/iU
	S
X-Google-Smtp-Source: AGHT+IGlnHHWU/NRq5dJLKPij0OsbUo+2m7Q/Cok23RGmWy/VdEsK1EId8ItKGJKXcoet3Z1yO2gwQ==
X-Received: by 2002:adf:f64a:0:b0:346:bbd8:d512 with SMTP id x10-20020adff64a000000b00346bbd8d512mr3115322wrp.9.1712995721725;
        Sat, 13 Apr 2024 01:08:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id m1-20020adfe941000000b00343f2cca88dsm6007482wrn.76.2024.04.13.01.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Apr 2024 01:08:41 -0700 (PDT)
Message-ID: <5ab028e3-77fa-44ab-a1af-e70ae9d450ea@linaro.org>
Date: Sat, 13 Apr 2024 10:08:40 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] memory: tegra: Rework update_clock_tree_delay()
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org
References: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
 <20240409094632.62916-8-diogo.ivo@tecnico.ulisboa.pt>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240409094632.62916-8-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 11:46, Diogo Ivo wrote:
> Further streamline this function by moving the delay post-processing
> to the callers, leaving it only with the task of returing the measured
> delay values.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 120 +++++++-----------
>  1 file changed, 46 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> index ec2f84758d55..5e2c84fc835c 100644
> --- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> +++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> @@ -105,7 +105,7 @@ enum {
>  			  next->ptfv_list[w])) /			\
>  			(next->ptfv_list[w] + 1);			\
>  									\
> -		emc_dbg(emc, EMA_UPDATES, "%s: (s=%lu) EMA: %u\n",	\
> +		emc_dbg(emc, EMA_UPDATES, "%s: (s=%u) EMA: %u\n",	\

Does not look related.



Best regards,
Krzysztof

