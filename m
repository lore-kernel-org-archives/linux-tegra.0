Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1603077F25
	for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708089597; cv=none; b=aIoQhzxeSAm3vUofNlBhA/IPBhHxwiziChreVVv6p6RtCme8wd+ost/GJEc12URTn1zL5Ga/d3xdSDzdL1EsAeUDy+fYKbOUCLNR7jIWr5emFzlk6gn6C0uu5XejElBQAllkTuQFPgycCrrr06kQCqSnej6TD6pTn3HLe+k++KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708089597; c=relaxed/simple;
	bh=i8eBqyQ/9oscfbrdNdKSdvR5OiTasOQVaBAg8WONgSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNEEEzeheY0Qh7ORdyJSB4WimcU0b1HCsqMvwUFiYZhEREXFZ04JAdRLps/yOq/Io6H2gnYnkRbZFxTBHKsgcFZNFfqHa9qoNn9Sqjn6AprOuRsLre+ZSqKcPkK92dssNEJF239XdUBVRaudtb/KPm+hApXhydZxxSOySM5yPig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rMCnRPQZ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rMCnRPQZ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51299d29e43so322297e87.2
        for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 05:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708089594; x=1708694394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Is3bKNpFvR0lDz0b4P31kTIBYTglhrvvnN+mPzW5vPI=;
        b=rMCnRPQZ0VGjiRh2ZpDDqs3OJJF07eJkFIEs7C46N7R7/rCVn4z9Tg8Ooz7LpbVGCU
         XOzC85h+FCc1fQhmD54PpwqZYQ45iUsmqr4/u3clvJTKJ6bwORpQX/Os3JuR86zkp9mK
         U8hdtg7NH/ZKm96G2KTYQLFTT+BrFCApRPUwhmKmK75ZEkvIOh94aFOjJQ1NQU0dl4d4
         pczfyJBaJTQBHYU7mXTdVfTOCIU3tJci6EyVhC/OvUwIzKJNh7k9OvS2G6uYo+/7SieI
         /nphhOx9+SXYAN7VXzDpbWdyhGyVdcJ36B1XbIJTmLnS4Qx1xblP2+D8awZGfbtt6K2A
         +YuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708089594; x=1708694394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Is3bKNpFvR0lDz0b4P31kTIBYTglhrvvnN+mPzW5vPI=;
        b=KDqsA4KBGTKNNS7cbUUZM4jtfoSxk4M5u4ZcbrjJtjr6IYNQK4B4a8wTLVFwjLRScw
         L9ArqqLjTtzJSW+1xdEEaYgj7JCM12PKhVkgahNuLuUHfJ90XfRaGCeiao3iFSaLtkab
         rqXN4SgqaPycYhu0Kv4P+kTGmTg43ZsUPXLHOF9hhSnj2mNAgqIabD/rDRAT3U7Wo4gN
         f/8FX/Clt2Q1Seq15CSrfzepNLMaocMv61MKcXn1L9uOCgWtl3SYwViSa0pIm8E66blR
         UKr1nbHeRwz8Cd+rJwLQiZcp/TICKPMvCxzS916KlSXpPP8MYLrXU14l0rjhc2V2Pegg
         5Pbg==
X-Forwarded-Encrypted: i=1; AJvYcCVcq0Xf6QNuue/7mL+ClM9HKJKlAxirKSpb8LRXUY+cbL6s376Gx7xMGjJbN7c9lBqoy3Xi7GQkkVZDPjlyQVIv896/dHGFmWz+hHk=
X-Gm-Message-State: AOJu0YyR6NyW7FWbZfxq8A1En9g+h9JJ4zKNrTTTVw3OmUC5m2fEcUVm
	p+7kxAhodqU87dviOfopW47ZtG4oRL98OBeaW62r2DZTdT8e2viX0PPo9c0I2XM=
X-Google-Smtp-Source: AGHT+IFGUabnstQVRh2TSa61uRKOGLU6s5CxHFMZqiJFUpNB6SWPY9XpYfBYIug/ncXXwpgdrCtnAw==
X-Received: by 2002:a05:6512:344d:b0:511:5012:db7 with SMTP id j13-20020a056512344d00b0051150120db7mr3306528lfr.29.1708089594100;
        Fri, 16 Feb 2024 05:19:54 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id vh2-20020a170907d38200b00a3de6cf49ebsm424848ejc.6.2024.02.16.05.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 05:19:53 -0800 (PST)
Message-ID: <7819c59a-a58d-4c50-bbc7-35b3f803aaae@linaro.org>
Date: Fri, 16 Feb 2024 14:19:52 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: tegra: Add current monitors for Jetson Xavier
Content-Language: en-US
To: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20240216122805.32529-1-jonathanh@nvidia.com>
 <20240216122805.32529-2-jonathanh@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240216122805.32529-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2024 13:28, Jon Hunter wrote:
> Add the INA3221 current monitors that are present on the Jetson AGX
> Xavier and Jetson Xavier NX boards.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 50 +++++++++++++++++++
>  .../arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 27 ++++++++++
>  2 files changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> index 5b59c1986e9b..7c57272af044 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> @@ -53,6 +53,56 @@ memory-controller@2c00000 {
>  			status = "okay";
>  		};
>  
> +		i2c@c240000 {
> +			status = "okay";
> +
> +			ina3221@40 {


power-sensor@

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Best regards,
Krzysztof

