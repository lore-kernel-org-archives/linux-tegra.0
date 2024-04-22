Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5E64C624
	for <linux-tegra@vger.kernel.org>; Mon, 22 Apr 2024 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713769335; cv=none; b=pjZdGAKTHnfvOLQ79cGnwuT+1BTqxlKR3Yz0+Q3Wv8uB4G3GJiJyQFEOrQ7Byj/UpgrwY6PkWU+0J/VaqvXWcT1BqCSr7a7VZqxMUopIdqJjy0U0X1Q1Of+Uv64YJ/femZOe6Q7ZwXrg50qB0RjWRKM4Ynt3Gd2zoMyajjSTxII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713769335; c=relaxed/simple;
	bh=sr0A5lK/J4pYfLl6WcKf1lvO/yAkrGBILYjuZv3tgSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qoEQPBTUv+PPMvc1v+gxYuqxv8784BWsV0tgyWCacVGDjVIAnqAuUeKHg1cIRwPXAdC51dyxKlGr9EiEY3XAcJUjpZYWwYE98ReeiUnZIlTu3x9cLmIwu4JwdFIfVuADk0yb68cZ8NRzibS+CN6z6pvRCDcMyrqep3H3OXqQhDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qShNoMCI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qShNoMCI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41a4f291f60so4560795e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 22 Apr 2024 00:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713769331; x=1714374131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Szqd9INUiCylFL5h53cR+1N9ETyglCpe53AW9Bz4Nb0=;
        b=qShNoMCI7MIbckC/GoPuPW3DAmaXYZbIterhBaf7APluwV/JRIT+rsu6cxbLM1IGZe
         rmm9ywE2W/00yRVuGguTzgyvj0nCpwQJsottzb6Hdi+Nj1deyINEds06awc2sSCs8vK+
         Gix4SsE+ntAvzid6cuKX9EPWkOSwXeMQGalVAztPYv+bBlOSfEPQZYfghINuZqgCEv4X
         K4ONriCJfbn75vcjj7aDX/0y4fZcSzYNna9cFSKWeaF5Ts3aubC74wjhG4+LyCbHddTM
         H4rRie1WqhIgbSOk/pQ15LXEhucWEw5piRWhUPFUq3j1PLS7sHU/H+7fhATcC0XpotZS
         mw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713769331; x=1714374131;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Szqd9INUiCylFL5h53cR+1N9ETyglCpe53AW9Bz4Nb0=;
        b=I9S2CN8n4Rr5MJMMRbPnFBVHGZ6eN+tZWOwTTS15Tbp5YrWqk9jsbQAM21fSJeoo9o
         /ZsyX1qb1Dc0FwZn5doXBkzpUP05uOTV+nj0GMMlJNP8CnZx9tL6uIHsUb1qorm1eCkz
         Gc1fgVEg1vFunvGMaHR6V7VwQ8IVwWlDXOgdEitAz0wqIq9yrz+tpNGrpwn7HTiwx67h
         QAA6jIJOmGQEKdLx0llRSmL2F+/Ku8pKIUk6VAFfJR9Td9jjWNkYLJ41k0VoII09o3p9
         X4J+9zi51xxVrBn05i24iYv9v6mp2+bkqPMwNsgyaWW3P1T6GfYAafHHCtAilMHGDeYr
         A+1g==
X-Forwarded-Encrypted: i=1; AJvYcCVdVhnqZFC8Gs3ChOSKJDxn9Hj7qAAvLaUZoE9shnOs4XDMKndU/RcbWtVraE6X1oLos+ux3zH9+l/QPDrxRTDk8LkBJH+NivUlK6w=
X-Gm-Message-State: AOJu0YxG8KMjL3A8MPBGiCV/RS/YbJ4joLviY/S/4pOg1IHykCekNXUm
	sOkp851I9NKJNYXpxWXgM95gIuqO8AdAfvpVXliukFbxl9h9eraUpG5th385O94=
X-Google-Smtp-Source: AGHT+IH4LaMivLlxwVs3BA2QVYB9ssTGntKr5AvuZMVTUWk8nBMJavHVtB6J29PeKwobXgooPCJcCg==
X-Received: by 2002:a05:600c:4754:b0:418:58ac:7477 with SMTP id w20-20020a05600c475400b0041858ac7477mr6069816wmo.30.1713769331501;
        Mon, 22 Apr 2024 00:02:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id p18-20020a05600c1d9200b0041a3c0ee713sm3739297wms.39.2024.04.22.00.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 00:02:10 -0700 (PDT)
Message-ID: <d26f9661-3e50-4a72-9097-fe63a27503f1@linaro.org>
Date: Mon, 22 Apr 2024 09:02:08 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 1/2] dt-bindings: make sid and broadcast reg optional
To: Sumit Gupta <sumitg@nvidia.com>, robh@kernel.org, conor+dt@kernel.org,
 maz@kernel.org, mark.rutland@arm.com, treding@nvidia.com,
 jonathanh@nvidia.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, amhetre@nvidia.com, bbasu@nvidia.com
References: <20240412130540.28447-1-sumitg@nvidia.com>
 <20240412130540.28447-2-sumitg@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240412130540.28447-2-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/04/2024 15:05, Sumit Gupta wrote:
> MC SID and Broadbast channel register access is restricted for Guest VM.

Broadcast

> Make both the regions as optional for SoC's from Tegra186 onwards.

onward?

> Tegra MC driver will skip access to the restricted registers from Guest
> if the respective regions are not present in the memory-controller node
> of Guest DT.
> 
> Suggested-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  .../nvidia,tegra186-mc.yaml                   | 95 ++++++++++---------
>  1 file changed, 49 insertions(+), 46 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> index 935d63d181d9..e0bd013ecca3 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> @@ -34,11 +34,11 @@ properties:
>            - nvidia,tegra234-mc
>  
>    reg:
> -    minItems: 6
> +    minItems: 4
>      maxItems: 18
>  
>    reg-names:
> -    minItems: 6
> +    minItems: 4
>      maxItems: 18
>  
>    interrupts:
> @@ -151,12 +151,13 @@ allOf:
>  
>          reg-names:
>            items:
> -            - const: sid
> -            - const: broadcast
> -            - const: ch0
> -            - const: ch1
> -            - const: ch2
> -            - const: ch3
> +            enum:
> +              - sid
> +              - broadcast
> +              - ch0
> +              - ch1
> +              - ch2
> +              - ch3

I understand why sid and broadcast are becoming optional, but why order
of the rest is now fully flexible?

This does not even make sid/broadcast optional, but ch0!

Best regards,
Krzysztof

