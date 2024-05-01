Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A9253E35
	for <linux-tegra@vger.kernel.org>; Wed,  1 May 2024 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714560276; cv=none; b=p6ynuS1qETlDRQE9l41iekZPjxQvu6N0eBadyLw+p69SVkth8HKYPfYFGujBrb/7iHR9pz+TLDDqBAF0qjFY4rO69SKrvWwSQjUOX4kQVaGGZRtrNAzqlikdNA2feqPgDU1lphEe+EAlAmtlD99yFZKCpu6Om2vSIsHMUZ3rSMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714560276; c=relaxed/simple;
	bh=EtIeXovXD9D36tFVtGrfH4wjM2xSaB1ioYhBAs/xH6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQBf3iy2saldTtqSxPjLrk2NGnZQiZtt1PAfctcqqhz4d4XXx/dy2YbY81AFK+isEgJRg5Z/oME7pg14xSPTZZRooWXOwUkERNVcsqWxrmUC+6T+VNLLnRxCMwqhMZBI9b6o8P/5i2KMoN13G7wnQvbfyLKb54ghV/fSQcv6N08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MlwGIw+f; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MlwGIw+f"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-34db48cbe78so588918f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 01 May 2024 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714560273; x=1715165073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYmuLFK3BGv9NhdBLgDNFCQmHdP6DRQ3PI9eDeKznd4=;
        b=MlwGIw+fwF9bgea49Qq6BRSZl5Pp4nLMNQa8ksdm8/fY1DM+ZGXC/wIOfVcd3m5Xax
         /nz4kPl1y0IPuPxbm3ZsBk6QVMIOo/ixGXT3g2R/IwazoRde6oKujp2FF7PnYV3ZG6tN
         hM0r3YA9MoQFbc1zbYi6m/KoP6BiJBJxsvhO8Nj2fDYgUfq9Yb2SMxjvC62bHGH+7ODm
         czTHB0P1ixfn1nn+IUGhZkzC9ZszsXCgZtSLjW5REIkkTP5w9P3zucbE3AnY61Do/KfV
         XirQl3Tzf0h/BT9QG0ANJHHjGCqlD6J4Avt7/effqStnFLyCuehnq/91ZXXY+DwM1DGK
         /wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714560273; x=1715165073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYmuLFK3BGv9NhdBLgDNFCQmHdP6DRQ3PI9eDeKznd4=;
        b=Dr2uf8sOZwCZsppUjDwFB9YfwUuue2VaV/rOF68OBTjbyXm1FAmsRKcpeLQGp4xySo
         aEGIC4NGA+4pL01BeKegfjViM+kEyLZTxhwjInoSiCVu6hQ0eJgn3CpNL+y3IaAy21X9
         PjeKXIBh+iCdazR+aPRpoCQbowumF2X0NHkCm/htwYvdo/e4ZDfktv2+95bHNw4Hz9m9
         rxzmrzpTDCSbMIDh5v0XAtaxHVn7+NAC5RGefTQIElEZFqLJY6SMuRyXJ+IFJufdjFv3
         jQV8iOTcqfQ9GjquEvtGtN7ENXiuT1f1/njQFTWSa8MM9NOEgEzwGDNlI9VrOhTekI96
         m+qw==
X-Forwarded-Encrypted: i=1; AJvYcCXeCERoRtemiggF67chn6irxzbr2nKaw7vRtwYcxrm9O6cL23Kqgd84kfMKrm3zPcgsl3TPEwey1QDmhy9XXO92fwS4+EjBK1nMvek=
X-Gm-Message-State: AOJu0Yz55GVqwQztNEqJbIi4D/FHuFR5Dc+zAS+D7/KOHo6R/UIP49yA
	lSRYhgJh5qkhEy0oB4fHu2AgRyRIWFGRJgexdDM8w/1iHzQNusZLPwA+DJy1yPI=
X-Google-Smtp-Source: AGHT+IGkxuY4dhK1o59E+WzYjdOhu0VVa0wkXzXcFXoTG3txAyFGqsjz9Wd91uyD57Er84He7gVn7w==
X-Received: by 2002:a05:6000:128a:b0:34c:c9dc:ccc5 with SMTP id f10-20020a056000128a00b0034cc9dcccc5mr1636807wrx.28.1714560272686;
        Wed, 01 May 2024 03:44:32 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d64c1000000b0034d24477662sm3562035wri.8.2024.05.01.03.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 03:44:32 -0700 (PDT)
Message-ID: <e4703eb2-dda5-41b1-bd47-8dd4d15dfb9f@linaro.org>
Date: Wed, 1 May 2024 11:44:28 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: Add/fix /memory node unit-addresses
To: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Robert Richter <rric@kernel.org>,
 Chanho Min <chanho.min@lge.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20240430191856.874600-2-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240430191856.874600-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2024 20:18, Rob Herring (Arm) wrote:
> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> @@ -16,7 +16,7 @@ chosen {
>   		stdout-path = "serial0";
>   	};
>   
> -	memory {
> +	memory@40000000 {
>   		device_type = "memory";
>   		reg = <0x0 0x40000000 0x0 0x20000000>;
>   	};

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
