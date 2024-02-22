Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05562C6B3
	for <linux-tegra@vger.kernel.org>; Thu, 22 Feb 2024 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592150; cv=none; b=GsmYbHa/GWQJjrPRxMpmrZTMnFo0Jb7VHNIeug7WvEG7mzQEOuJAlqp/bAhWfjFbCnLcvUzLKu9dMR255O/VNwri5g4LctbcF/FyVBwriQCJBKtsK8eAtCmzj8jRTEYzF0IN1RIuC4OTptTQ+sXWJf5Z/6Oa3x9nco8X3EfxOsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592150; c=relaxed/simple;
	bh=Dwj+8J/R3sGP30CAKNlbBpnBrE4ULHBSoY3LYa0Cyrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dD77Xh1ele7Xvi68kCPtStwpTfyR0oy1XFlwkloeqHBL9WtY3EchCm+lTaoywu6kfG28RhMenDUOcWaZmopIHQ+Sdx1Kd7V9cO9tQcMbLcNF84ZM+gPo6W6EqontWorpNBZ1w+ZsmV/RgvY75QAVGspMyqtcaOSuNlTvHtaB2ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbAJ8Rok; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbAJ8Rok"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5648d92919dso2313476a12.1
        for <linux-tegra@vger.kernel.org>; Thu, 22 Feb 2024 00:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708592145; x=1709196945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vptKAuVJcNoqlTfbOGtNnUalp3TlZ+METKiePtclfZM=;
        b=PbAJ8RokoNRV8saT1Ze14aPO5hGQmYV2k7+/JDY9GCr7Uc+ehcI78/B22Jvt96fLs5
         ug7QnrGr/kRlTX/cdO8D0K8KSr/9f4HKrPK/DSq91CMEU3fInTX9BDAS1NWQGeJCW1dy
         zxSUmxJ6pJ8l4kDkX7HcRbQerYe+XGvwgbch97aC5cFyHZM5CbZAcx2QQImsyvPPzW5E
         3QS6AEodaNeJKBPSeQYP0a6zHShH0kzNrwIm1C4jLdvT/j1p/QXBy9GSFrCooSWBUiuC
         8IMTLu3cIvsoXhHfusC7cR26IA5vh94z9GLKxFm02QD3KIhz18Ydg3LeZA0YffdiH3Mc
         uIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592145; x=1709196945;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vptKAuVJcNoqlTfbOGtNnUalp3TlZ+METKiePtclfZM=;
        b=AytWLPSn2ECBViGj+MWd4D6N5gYawvXrSfHpNLPpzrbZNBbZyLSfWotNo7e8StxaK8
         j4uAa1AKiXM9yvMSCGeMLgtbXvaOhkSIhGTpKx1Yax8YjKZFuEUcHXYnGk0SPQVe7g4H
         PJYDQvAULwqmHI/r6BGNz0sbSGIUzRsCMbex08GX/Ea/LCKHP4iPebIUEJGivC9sGyoL
         kibbqaIfnA47TPc797WOx/P5wAT8O3evt2pH0sHWdjAlhYrlFkzBYLQL9oDWV98/Bcs3
         7DUVxeykV3n5HHGoMaHrdTpc1A/9sXKWriv9tKuzP+hfzuEomLg6VYEEoYpLKrzEtZ/I
         YAFA==
X-Gm-Message-State: AOJu0YzxUwouifD6hokqrlgQD7zfvrEuzjhD7ZtDZka7jOrYqQJEoDId
	F5sp6TLXcThne1SpcrMAz7XA8XOtGrIMFHYYcqjYBqnHZ3869YoNMQRAP/A6aoNNzW5XYlhwxjo
	bEgE=
X-Google-Smtp-Source: AGHT+IG587MKZ815QUtlqsQ5DaQcBsZaRTcfVv5WCGjyp0Jru51WhQP/fVE1RK3+9zYajFHcHV824A==
X-Received: by 2002:aa7:cfd2:0:b0:564:5297:4fbc with SMTP id r18-20020aa7cfd2000000b0056452974fbcmr8594447edy.16.1708592145000;
        Thu, 22 Feb 2024 00:55:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7dcd6000000b00563918a48cfsm5325808edu.40.2024.02.22.00.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:55:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
In-Reply-To: <20240220124430.19072-1-jonathanh@nvidia.com>
References: <20240220124430.19072-1-jonathanh@nvidia.com>
Subject: Re: [PATCH V2 1/3] memory: tegra: Correct DLA client names
Message-Id: <170859214396.12531.12574758730919602397.b4-ty@linaro.org>
Date: Thu, 22 Feb 2024 09:55:43 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Tue, 20 Feb 2024 12:44:28 +0000, Jon Hunter wrote:
> Some of the names for the Tegra234 DLA clients are not unique and do not
> align with the name of the client ID definitions. Therefore, it is not
> possible to determine the exact DLA client from messages that print the
> client name. Fix this by correcting the DLA memory client names for
> Tegra234 to align with the name of the corresponding memory client ID.
> 
> Note that although the client names are also used by the interconnect
> framework, interconnect support for the DLA clients has not been added
> and so this issue does not impact the interconnect support.
> 
> [...]

Applied, thanks!

[1/3] memory: tegra: Correct DLA client names
      https://git.kernel.org/krzk/linux-mem-ctrl/c/51d915cbeef4c7a154f5d810b1e10d8125f2b0cc
[2/3] memory: tegra: Add BPMP and ICC info for DLA clients
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6a598c6c08dc6f34235ee6ee246962ccb14a47c3
[3/3] memory: tegra: Fix indentation
      https://git.kernel.org/krzk/linux-mem-ctrl/c/ae1e06fb62c3a0fbcc7c58f45cf1a19641272799

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

