Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF01C3C1C
	for <linux-tegra@vger.kernel.org>; Fri, 13 Dec 2024 11:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088212; cv=none; b=db8tFGB1JYWlZS5q31ZjumKbxNO4o/AR4dCatB67x8kCK0kIvLc1Ed9Opk9gbe99XvCoTCmfzV000SSszmDzv5dC1X74rCvL09iyR2x0RgShbKBlysKM1mPnl2kTMZjX6FjuBcx736jPOXMtl7hkns5XpGCaaF/FTzBs8aIl8vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088212; c=relaxed/simple;
	bh=ntPrzCpC78xY4j26XVHR3bpfnCr7yYInt1IayGqko2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=co/7/bJYhj+ubLDlCE05dTnV/A4YRbXEy1MjUzAOi8AKO2K/aOPMJ2m30+f3CLA4iuYDg7pP+SX/cM14vTX0D7Pkhy6bone088OE1GaaOZemzBMKKU3pjDewLb1P3AVFuCOatLxSaReMnRelCJiSYFBb87XOZfr5z1v/SNcUOqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQyAlS8j; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQyAlS8j"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38636875da4so95488f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Dec 2024 03:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734088209; x=1734693009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/nsYgCi6e6qkxZtTE0P0xHTr9/Q2SottdR4aAlyfjB0=;
        b=oQyAlS8jJA5r3TZG2CnXd9i0dmd7PNhOhkKWdEBRKvcXHAvcX3OxlW8jU9AdZH4FCR
         iBWGvSUL8XJgYHvliIBQudpOw6ciufNfw1EPH1jKc4tTfcksSRNwfNQMmdvh9ysIhjQi
         86nGo3jVOHmLrVKV6+qWMjId3ppzU9e7KmB3jGBuUvPcfpmtVDGEEr+6YPMFva81cxzQ
         2jB1GCc2rsZweP2ZKoWAKfO7IEzW7p5lm+pJHfrggvq+UWHLxLdvs64CZX/casGtDsCh
         JFROhwfsG9nrShThgZthkcMDL89x6e/dR2VBqSO1AvVqKMGTsNp4aj7qp9vb1Xmayilz
         lcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088209; x=1734693009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nsYgCi6e6qkxZtTE0P0xHTr9/Q2SottdR4aAlyfjB0=;
        b=UB5o7Dg5TWE2/fVo5AwY6BPou2T5YtBvPRvt5qZnj6M+vzRvQ0zajFEf0OJYY3YY+c
         cMZIE8bwuq7da7mgg3anv4zdC89QbvKotDTFDlpZpDlfjo73gKuAEb1MmRC9LwimSRvx
         TdvipdCOWl6CAyHbQCwg2xyzqWpXEsLujKMAj4VKmh05+gYppEgbGn9J/RMJeiZax+aC
         2P36KmKbRvEHwSm6CSDODlY4MJbHYb9W5AFa96GYDzALjL88isKOUBi5BD9aJX3W6f3x
         OWX8H/3aNF8W1j1uKox3MfHr1E/+wzeimSwQ0NwHNegl4alnuU0qwSkLCS9SDeiWYLKz
         LdAw==
X-Forwarded-Encrypted: i=1; AJvYcCUPm+aR1S6/q3aF4vRU6ZmG73u7CULBo7a5X7/+3cJQjTv44Ya2EOozCSsuK/EtKKTdQqognQscyNoenQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8gcCEssX7CoF8dNCvqlNCOSinXhnWu/z8TkIloixj4/SpJyjp
	rGy8RIrTO9sWhy/w1wcMr31g81N2qOF3DHYzdv8aRwmGjXr8YtG7WB9RakEWNk0=
X-Gm-Gg: ASbGncvc0pmKl0SiS0guvv4BWnxvTElpCeLyOf/sMh72DzNboS6qULT50Yt6hW98wqz
	tI1qi/tlFTGPsgk/drpXQBFHBtUBgZ0wqruTIS+PIwPsdNBsoKU8bxBM5l+qDeBS0gRY+nizPkc
	W+w5RNlpiPr6UyvrULyCcqFOF7BJa5W0Xgda1E2H57Xp7TX0XnxufFbCoBydNqyCg0cRESoROVK
	Bkm7BJAjof4NEEmmeqsmZMT7mr8sIlelbfPCnjmFqAzZsVWOWTAr4OLZpX7whGJP+CjSbF4x88d
X-Google-Smtp-Source: AGHT+IEeyKxYV9Iz769kDqCw+MyFfFsVNrbX8Rk2saxYfrSzOalEB8qoK/qhwbUbGpZ27prI4m1NKw==
X-Received: by 2002:a05:6000:18a5:b0:385:ee59:44f3 with SMTP id ffacd0b85a97d-38880ac6b1amr660170f8f.3.1734088208795;
        Fri, 13 Dec 2024 03:10:08 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c5c98sm6712752f8f.58.2024.12.13.03.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:10:08 -0800 (PST)
Message-ID: <ffd6ec4e-61a6-4713-8be2-20d06ae5b448@linaro.org>
Date: Fri, 13 Dec 2024 12:10:06 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: tegra: fix typo in Tegra234 dce-fabric
 compatible
To: Ivy Huang <yijuh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Brad Griffis <bgriffis@nvidia.com>
Cc: Sumit Gupta <sumitg@nvidia.com>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
 <20241213000305.3533971-2-yijuh@nvidia.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241213000305.3533971-2-yijuh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2024 01:03, Ivy Huang wrote:
> From: Sumit Gupta <sumitg@nvidia.com>
> 
> Fix typo in the compatible string of Tegra234 dce-fabric.

In what way fix? How does it affect users?

Why no fixes tag?

You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.

Best regards,
Krzysztof
