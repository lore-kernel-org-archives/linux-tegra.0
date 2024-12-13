Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9673F1CCEF6
	for <linux-tegra@vger.kernel.org>; Fri, 13 Dec 2024 11:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088269; cv=none; b=RpLyFGNY1nwd7+T8Dh3wgv6vVdAbS+j5GpR3M6AJIm8PofZW1ny6DuNXyUpHv4sMAy2CpQg1Ksi9mB2VVwSNHca/1wXfRqDIxFrjTpslS0u9AcwOQnJSf+X/KuCO0fHg2XQ/0gtNLvmtRyOhTtiHdD61oMnQWbNHM4tevHCoCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088269; c=relaxed/simple;
	bh=sEq/4/+mWVVsscdN35vcbTmE9ZR+8pw7out/EOz+SXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9OwIcagn5DGVc5/STmYddu2Sd6aqanHVE/zbGNRyBB1x20fFHzKQi0Xn5aC1ntIXGLq0bRlOlYhRW5QoTPYCWV8LAFkFi3/gAZcin4iRpLOjDafCP/f5MGcrxaka4dgfYgchWWqvhp/hbPcWLsCYTmxPVHeUYq7xoWWYRaw9XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xt4zScni; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xt4zScni"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so2110215e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 13 Dec 2024 03:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734088266; x=1734693066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ftTcqME+5edDCL49fhDBbDNlmCUYxzXTj2YtEy7JWb4=;
        b=xt4zScniBo2vIKQUaDmiby257wD0gVsNd9hQxJOwMW3+oidLRxLVAajKi7V+xaguUq
         rKcxaUEFC8+BFibMyKY6hjJ3LXnJJ0e8URoaNDxsqxpundynMOt4Fufpys6dLdBnb+FW
         E85Z90hZ0Gh4vaeGfc6OfF2vmpACiFEl3q8O0tWUAlZAgUgCtqmIURQBj68nbwnESKOA
         +feETb0MxS07ipwXutVpLY0WwBlLWVi2s1EnQbFBztBNs7GRdPyWF7qqqnZ8C5DvB/tS
         2dTiIP8Tlbs1rnq+M2M+L7XaBcoK9/T04VIdyrqC8WXYscnJPf5byTxyTwbCW0DKWnm9
         19Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088266; x=1734693066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftTcqME+5edDCL49fhDBbDNlmCUYxzXTj2YtEy7JWb4=;
        b=jyAtsMNf0NzzPpNZihaY+x4hEjqh6QZIviC2ES6ytpxaHWqo3/6SV0p7EHPQat5sow
         d4vgoufNr2XKu80IUummb+E+IVdQcT49+JiUmsBGESpt4pwWWt55qVueKMP6xf7CI1uS
         iwq+7udDwBvi32bu2ttlizsB5Pou27lLrxSMWy//6ATmUFM7kMkSO5Eh3msf1YOCGVCl
         BIDnkxHFhelsnB+Zq5XW4qKc0ZMBoPLEYFYv4ENpuxUVCLwcEiy7GrFyYF+upo0Qw+i7
         aCLAG/8jWM+jkaxqL0+ZZh/U5XpxnSFhSKvODO1lB0jXVPhN8txlOUv6nlRwlrEMPw68
         BfKA==
X-Forwarded-Encrypted: i=1; AJvYcCXEX1MFQouA8BMpYqL2Qp6QiszJYP2cP8uM0o1O2j4nFYWwlVAIbM4L8NAKzD2AKENGJ7fX9BtUK0VeRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXriGYntCMbASNwEZ3vqnXsTBx0kfX+GitXSAnXS7C80MeZsMa
	nAenHRx0Gf/dHoNZlSk0+5GZvMeuZyELjAKn9XJYKQW+hdEl+hrqHhYvimXZAkc=
X-Gm-Gg: ASbGnctBsBjgPjaKdcOSMPZkEkVa2buGCFPEgjssvNhzPaotadX7oUGX+xrUa2bvCpw
	LIgz3oKAVxO4ZuITaTD1DZKgfZKohETPf3c/2Nw/kJAx94e8LbEpL5/r7jqLtcvKQYyawYoVHY/
	PG81V00i7RjebjJlhsrLhooU03oLjr48kuchXg1OrwL/B6LA0w6cp764iCKj46R2jhczj/szkkA
	8eeffyChOtBrb6m7sI2Yr1DVfj9KhCWfkEqjK+i6KBZJTfWwjEgOwbiqnjf1/bAM8B521N2vBAX
X-Google-Smtp-Source: AGHT+IFyiF1YQIhU5o9ZNFX3dIdgreb6Nvi1ivk4mtUR1kDhA/SPpOCeTsPnnpL78Ymr3hgnBqWieA==
X-Received: by 2002:a05:600c:4fc5:b0:434:ff85:dd77 with SMTP id 5b1f17b1804b1-4362aa3a62dmr6402505e9.3.1734088266027;
        Fri, 13 Dec 2024 03:11:06 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625553208sm45488485e9.9.2024.12.13.03.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:11:05 -0800 (PST)
Message-ID: <827f4554-d6c6-49e8-a578-da7329a0f247@linaro.org>
Date: Fri, 13 Dec 2024 12:11:04 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: tegra: fix typo in Tegra234 dce-fabric
 compatible
To: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>
Cc: Ivy Huang <yijuh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, Brad Griffis <bgriffis@nvidia.com>,
 Sumit Gupta <sumitg@nvidia.com>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
 <20241213000305.3533971-2-yijuh@nvidia.com>
 <dd45836a-a4f4-4383-8ade-d81c1b11c660@nvidia.com>
 <jr6zj5znqckjg7hxgekn2vtculqu5lluf3tnsrxdgpgxgloqyn@epkjmqd2yqim>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <jr6zj5znqckjg7hxgekn2vtculqu5lluf3tnsrxdgpgxgloqyn@epkjmqd2yqim>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2024 11:22, Thierry Reding wrote:
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> index 984c85eab41a..d08faf6bb505 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> @@ -3995,7 +3995,7 @@
>>>   		};
>>>   		dce-fabric@de00000 {
>>> -			compatible = "nvidia,tegra234-sce-fabric";
>>> +			compatible = "nvidia,tegra234-dce-fabric";
>>>   			reg = <0x0 0xde00000 0x0 0x40000>;
>>>   			interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>;
>>>   			status = "okay";
>>
>>
>> LGTM! However, we are missing a 'Fixes' tag. We should add the following
>> above the 'signed-off-by'.
>>
>> Fixes: 302e154000ec ("arm64: tegra: Add node for CBB 2.0 on Tegra234")
>>
>> Thierry, do you want to apply the fixes tag when merging? Could also be a
>> candidate for stable.
> 
> Yeah, I can add the fixes tag, no need to resend. That should also take
> care of it getting picked up into stable automatically.

No, this changed some days ago. If this is a real fix which should go to
stable, then with proper explanation what is the bug and how it affects
users, you need cc-stable tag.

Best regards,
Krzysztof
