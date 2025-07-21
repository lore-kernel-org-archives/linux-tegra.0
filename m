Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EDD235079
	for <linux-tegra@vger.kernel.org>; Mon, 21 Jul 2025 20:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753129064; cv=none; b=IaIpL/hWq9QdqsNCAV3kDPL7GrWxpG8kfLlNAIH7EP42atXSDUox2FhOx9MLEjd0/vGeyujXXk9Bebsdc40XwdKlBDCyZGL/DFK6WT1EewLLtPDcNDmONlaqlNjRLgRLSHDB1IV+Tscs7pIRZ0i0vJNTUhkORkRhlyxf8mwIYpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753129064; c=relaxed/simple;
	bh=qNMjXYg7gSvi1w4o66Q/qp0UaJ/AUdAOz9hXwpFbNPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IuhJio/PYLVZORZCh8aRAjjf9pgYLnbbyNehGu+gQJzQdnHZnvjOJvyfg7snG3qaAoj98XqdsikaIDN72mdFpdLqUzTduGP3jl2dnRxRs+Rk/voPxPa7LejVyv6blQ5QA0pZk3CMzdQlS7GPpdBV/iTG2E7KS968LWEtxYqDzNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=merfMegC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="merfMegC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a51481a598so2542566f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 21 Jul 2025 13:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753129061; x=1753733861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dM8V1L459ePaBP5oquLpSUwSE8BaJwvLWNciMOJOtaY=;
        b=merfMegCMYwWsN27o6ZvoKAxuiIDUz2j+UCUcAXwR4cjDZzRxEDJXuNcS09EE58Wlx
         rCQ2CjyTmdx6FINi2LCktDlVkhBg4Zhqx26Ph9KeelPhiICTgvckMXLPGGzPMLLTy5dh
         xlhFsq0nJq7x5dHhHotX9tnvk5jBzpR+ubTOAUId1ewM100vMauN/LUJIxo+dSwWmkLl
         ZK/U647XyHymDEKFHOgW0iUl/gWtu+53kCixSGvaBdX9GtRmh/oaKEafGa+oW15I0GfU
         TtWx8KAD7MrLdTTa+G7U/FL6VmAZx1O8OYTkcbmBgUadq7MO/oM86zTmrvNKkjjZiEoY
         bAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753129061; x=1753733861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dM8V1L459ePaBP5oquLpSUwSE8BaJwvLWNciMOJOtaY=;
        b=SuhkG1KQZtvKh8twtA7CyNFF8wjNL5VxMPvN52pQ9dJ9e7pKTHQ4Zik7/rhVDVPDqb
         D/SzVPA5sbdDOa/ceiqEb/cjEL0QPfhHrXMuIFO2UY3Ijutoo9oce1PZEUmpyZExO2P5
         jSH7T/xmaQLXrrE1Ej69UavHWs3V9Rr0l/wTw7Qqt6O59eiSDMX6OfFeeYaWvoD/eBoY
         yXb7LVjN/hhaCudWVO2Q7vio4u0fs38Damy+QizTsVGigbte37CpVLfbIyZpVUhnY2xY
         Tp5RjxwCsv/LiccQUP3gtDXHSsCeIyY7eMnBLNHg3dOz9MuXKlBTszcXA0Rmv0QzxAMJ
         1sNw==
X-Forwarded-Encrypted: i=1; AJvYcCUu5sto5KqtBe0XrLj2AUZiw5Qp7ZEDyokBR0bQoTg0kTaYX0bLY696sBRp4NyTcNJkGm4gavVNnidqxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO3y3zN7J9vPq8/afokVUk76tWRb8AXEwItPflJtaaWYbb5D3W
	Cqo7lUmzRnPvMKcr/NcsMGjF4auDLij2FoICNrKw6Lmea3GHz3GqZ87+pSiIib0YVU0=
X-Gm-Gg: ASbGncsrjeB11EzC5OxYqPoiVfNjvtWP5JSI7O+plu2gioRKrptHuHPkA7a+Dh5RS4E
	CkRzjw2OgWAf1CEXLLk9JbFyFUJnJcWBYrJzCHh0FJ87IceQKopIizgbPS4P7sPi19DtuPYOHMS
	NwItQV+rW1nFOzoP0cJQC2NCJrNP1KLzWpF5NaJbU9feMy31ESDn7u0aUz2zgQpZwH2tPrEdWwO
	qXEx8KgxglLVlhOr3eTU4CUoHO0k4OSzbAbZM/MfUhV3sFhmX2QF2oDDjdlX9AM49IaE/4/r6+m
	NztcgIDF9WcqLzbciUhT1lwlHyFL3HB2/HOW+GQowUtIK9WAR6ZNebMWpx3p7TvSd6JN8GP0QDG
	H6QUBeeVTHIsyFRLPW9YpY/GKsC0YQMyA2GMAowHjaMx1im94DYamz1lx+wik/TaAZJhXXWLo7P
	eaTjc=
X-Google-Smtp-Source: AGHT+IF62Mz23f/3FxKSXRlhY6X69Vv1j/s22nJAkdHPupT9WjDcJMNWjSNh7x1kPOXtrItb7cZ4Dg==
X-Received: by 2002:a5d:64e8:0:b0:3a5:8a68:b839 with SMTP id ffacd0b85a97d-3b60e53ee0amr17139819f8f.45.1753129060690;
        Mon, 21 Jul 2025 13:17:40 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:abd:1f99:991c:5b07:cd28? ([2a0d:e487:135f:abd:1f99:991c:5b07:cd28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca4894asm11444490f8f.49.2025.07.21.13.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 13:17:40 -0700 (PDT)
Message-ID: <8792778e-1fe6-4eff-9328-767ed38a1583@linaro.org>
Date: Mon, 21 Jul 2025 22:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] dt-bindings: thermal: tegra: Document Tegra210B01
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250714-t210b01-v1-0-e3f5f7de5dce@gmail.com>
 <20250714-t210b01-v1-5-e3f5f7de5dce@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250714-t210b01-v1-5-e3f5f7de5dce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/25 06:02, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the compatible string for Tegra210B01 SOC_THERM
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Applied patch 5/17

Thanks

> ---
>   Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
> index 19bb1f324183bb22bc75630798da67fc834920b8..cf47a1f3b3847d4a0371d0bc711638fc5e3b6cd3 100644
> --- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
> +++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
> @@ -21,6 +21,7 @@ properties:
>         - nvidia,tegra124-soctherm
>         - nvidia,tegra132-soctherm
>         - nvidia,tegra210-soctherm
> +      - nvidia,tegra210b01-soctherm
>   
>     reg:
>       maxItems: 2
> @@ -207,6 +208,7 @@ allOf:
>               enum:
>                 - nvidia,tegra124-soctherm
>                 - nvidia,tegra210-soctherm
> +              - nvidia,tegra210b01-soctherm
>       then:
>         properties:
>           reg:
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
