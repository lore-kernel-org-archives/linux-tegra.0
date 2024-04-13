Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDAA2C695
	for <linux-tegra@vger.kernel.org>; Sat, 13 Apr 2024 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712995670; cv=none; b=bjtovMwvsubTnIFJiDVhSunEl02GKdawMAvr6xX9YzJnb3a31x+6Xr1pkmyh2U5FU4rO6AuVkyp7hBLqec5eGtoa5aIsV8thMZuj3iZNMHa2yOnR3MTkgajzwRtMU8IvLNji1nbC5mAvsikq4g5OxEP2TmgZ/DvjfiqR8W2dnHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712995670; c=relaxed/simple;
	bh=tt6zkK7YmMeD45G+qXK0Va/Vf/vWlRbMlO+3n/fMV6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MUfZGYYNu+owM1ISGXFr373nkGWpyLEMTzJk08TWoj2+OHLfvMwQqGMmfh9yNVvwGaM3AvdIzjwQzCA2n/YKfResbY9QIxN5iFGZHlNtShmAbuaCu9wdguFz4ev/90gUqWtQ601SRosXf1D0Y8nCWVxFfqU06ELLHv80ebeIx7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eNLbJ2YN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eNLbJ2YN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41802e8db57so7542575e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 13 Apr 2024 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712995667; x=1713600467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q/3tng0VjAStnB/hD45/MS4h2HTxtyck/GpuJ8Rkf1A=;
        b=eNLbJ2YNT5/s58RjDJez+iiX7uMeIzaeh3RTIK5/nOlSJU6ES3J/Wxm+kbWO/l7Wfe
         pOvqbKInwR6mW4sElfMl3K89sF3vYQ3biHrdyKG7tWIfkPcH1k9QXv0b052J3p8Xa0bY
         EXzrZmPBn4V0YwCBQCVZgj3wrZDgbE+T1asDuqMNrvCH2Lm6UXFfXJZM1y9ce5FAnatG
         2f1nP71cbAI49rsi9WQTTsm7T0C4FIuNZKLKU39rhAQHQ/TXXPWiRiLE95vaxOAYdtmp
         XwtO6yPRVMLmNQaM6sjpGCWQlsaxBEg3YkkQkCuun8rXE3inP0HtiQVW595d/qdjXdiV
         3JuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712995667; x=1713600467;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/3tng0VjAStnB/hD45/MS4h2HTxtyck/GpuJ8Rkf1A=;
        b=U6Ym/1SXv1f9/iyJ362/IonMSpK4sxwiDQqdt8A8Vm1IFftIKsM5Xk/XsdsAjTys/O
         uPIey5w3Asq+/1//V7MH+BW9tx01ZcxZLToZP8z8eHS4O6mZkmNfPTkrqwoIIJk++KHD
         qM9C+nlNVr3YCMq6YHykH3d3/9HUKrd5sty0DGfcMr/ZG87/dZkRtzvrdqIFGL1ASMOB
         STXULlca9RVhRn326Jfk7kwzq8WtdrcBQHsDpAo52EU56u6Gi8OSbpQ2kzFJsM4dkI1a
         EHn+EoLv0P9DkLD4oYyx1w8Esu4LeQYYG3kCxYwLy6tzQ6YUz5qe8Q0AMSQ5hwXJoVBZ
         JBEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOgOCJe96jS9MaaoF51XnBpTflLIo3jYGBXamMUP5EcvriknxVJxTlQjSyfrZBfK23mTjz4UxkFzt+vOOadaq2fCqevnxwZ0MbDyI=
X-Gm-Message-State: AOJu0YzHMBrW9D0NZooHrms1/SHC43w6ebl1rKrHYmd96tpBtK1WRDN1
	uOxxEEbaP3EVfypu1uMcpx6RpWAkGYdjrhTsf+y9DCQulp7AEJE0B7qz5m2GESc=
X-Google-Smtp-Source: AGHT+IF17hmVezuOq22/4Svs/+rDoPu/fNBz3ys1LkqoW36Lg9iW3mkGbR4gVRUibRQ9BA3PFxdfIg==
X-Received: by 2002:a05:600c:5493:b0:417:ca54:e9de with SMTP id iv19-20020a05600c549300b00417ca54e9demr4666651wmb.41.1712995666692;
        Sat, 13 Apr 2024 01:07:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c198800b004180c7a06f8sm3360342wmq.16.2024.04.13.01.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Apr 2024 01:07:46 -0700 (PDT)
Message-ID: <54d2d6f5-4628-42d0-aea5-6c1790cf356d@linaro.org>
Date: Sat, 13 Apr 2024 10:07:44 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] memory: tegra: Move compare/update current delay
 values to a function
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org
References: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
 <20240409094632.62916-7-diogo.ivo@tecnico.ulisboa.pt>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240409094632.62916-7-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 11:46, Diogo Ivo wrote:
> Separate the comparison/updating of the measured delay values with the
> values currently programmed into a separate function to simplify the
> code.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 84 +++++++++----------
>  1 file changed, 38 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> index 566e5c65c854..ec2f84758d55 100644
> --- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> +++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> @@ -113,19 +113,35 @@ enum {
>  #define __MOVAVG(timing, dev)                      \
>  	((timing)->ptfv_list[dev])
>  
> +static bool tegra210_emc_compare_update_delay(struct tegra210_emc_timing *timing,
> +					      u32 measured, u32 idx)
> +{
> +	u32 *curr = &timing->current_dram_clktree[idx];
> +	u32 rate_mhz = timing->rate / 1000;
> +	u32 tmdel;
> +
> +	tmdel = abs(*curr - measured);
> +
> +	if (tmdel * 128 * rate_mhz / 1000000 > timing->tree_margin) {
> +		*curr = measured;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
>  {
>  	bool periodic_training_update = type == PERIODIC_TRAINING_UPDATE;
>  	struct tegra210_emc_timing *last = emc->last;
>  	struct tegra210_emc_timing *next = emc->next;
>  	u32 last_timing_rate_mhz = last->rate / 1000;
> -	u32 next_timing_rate_mhz = next->rate / 1000;
>  	bool dvfs_update = type == DVFS_UPDATE;
> -	s32 tdel = 0, tmdel = 0, adel = 0;
>  	bool dvfs_pt1 = type == DVFS_PT1;
>  	u32 temp[2][2], value, udelay;
>  	unsigned long cval = 0;
>  	unsigned int c, d, idx;
> +	bool over = false;
>  
>  	if (dvfs_pt1 || periodic_training_update) {
>  		udelay = tegra210_emc_actual_osc_clocks(last->run_clocks);
> @@ -174,17 +190,9 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
>  			else if (periodic_training_update)
>  				__WEIGHTED_UPDATE_PTFV(idx, cval);
>  
> -			if (dvfs_update || periodic_training_update) {
> -				tdel = next->current_dram_clktree[idx] -
> -						__MOVAVG_AC(next, idx);
> -				tmdel = (tdel < 0) ? -1 * tdel : tdel;
> -				adel = tmdel;
> -
> -				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> -				    next->tree_margin)
> -					next->current_dram_clktree[idx] =
> -						__MOVAVG_AC(next, idx);
> -			}
> +			if (dvfs_update || periodic_training_update)
> +				over |= tegra210_emc_compare_update_delay(next,
> +							__MOVAVG_AC(next, idx), idx);
>  
>  			/* C[c]D[d]U[1] */
>  			idx++;
> @@ -202,35 +210,26 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
>  			else if (periodic_training_update)
>  				__WEIGHTED_UPDATE_PTFV(idx, cval);
>  
> -			if (dvfs_update || periodic_training_update) {
> -				tdel = next->current_dram_clktree[idx] -
> -						__MOVAVG_AC(next, idx);
> -				tmdel = (tdel < 0) ? -1 * tdel : tdel;
> -
> -				if (tmdel > adel)
> -					adel = tmdel;
> -
> -				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> -				    next->tree_margin)
> -					next->current_dram_clktree[idx] =
> -						__MOVAVG_AC(next, idx);
> -			}
> +			if (dvfs_update || periodic_training_update)
> +				over |= tegra210_emc_compare_update_delay(next,
> +							__MOVAVG_AC(next, idx), idx);
>  		}
>  	}
>  
> -	return adel;
> +	return over;

You are now returning always 0 or 1, while previously it was tmdel,
which I suppose is not 0/1.

This looks odd, especially that function prototype did not change.



Best regards,
Krzysztof

