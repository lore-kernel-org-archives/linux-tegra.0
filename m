Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCBB23D2A2
	for <linux-tegra@vger.kernel.org>; Tue, 15 Apr 2025 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698053; cv=none; b=p6MSAmCdwqbfGnMU9P+ZKmVNRpk3yS9/sWmhSNqT0QeIhKI/4xwIvcCdiCe7XT5v35bNs1MEF6s68uSP70JIL0qjKiGKL8t46CJQ1CtI5QOwyQyMHqEn5Tb2zkW5X7ZcxsIDG/8S3+8cZJIWwZ0Zkr9Ms2vHu3bOZPCY0df6FFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698053; c=relaxed/simple;
	bh=Yr8/CO/5lrD/MrKdDsIWubVaHw/mUFm3djrhZkdFkhg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gBXEjlEqBwj62W7LqFZwrU9BB/2+7yoE8s1Hn4cB6CjG0sfTwyW5m4Idf5cMUVQ62+0f8CR0KV/4iRdTGF9Z4fz7oIsaII8CWh6IpLG7/fh9AOXZ1KjJVpzbzLLocvJACByEG+SWK+67rH/DsXKqwwkw+gBLmvDrDC3DqY9LMZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nUylUHYO; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nUylUHYO"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5b736b3fcso716826a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 14 Apr 2025 23:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744698050; x=1745302850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkzlycTSWhUYmFh6lSEJKN483G6fww5F4wymxCLohK4=;
        b=nUylUHYOqRFXiju35blyGm79sBUV3UKbBApKtS26AVPiPyk6x1/qEWVFJ6jVjY/e+z
         zanrRKdES9zeBDrQ7Y448LE6sY6cRFM3lJUy8dovnWh7at/N2wwMd+bdvVehs/7ESqyy
         J7S/79f6dHFlWlpyXekaRBOLuJ2cET9QgUiMQp7zUUWP4VcDh6ihQ2Te4TtF64KrGNbW
         uhZVRdjDheuhqzN5zORMw4K/WevWdKAfO5lHtKZI+wQ0ZuRHa/9ZbLtraeTwlvIsbkkK
         Wu7ZWN6DPstSU6/WoLfWfPX9EOdvu/YFV1AWXAIvFWnEKHhx5PPfyNxQPHruj6aYWf4F
         HLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698050; x=1745302850;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkzlycTSWhUYmFh6lSEJKN483G6fww5F4wymxCLohK4=;
        b=ekSaSZ+GuhIP1knyf+ho4dsyJg63CI5E3v/dYiidSh7PzA/lLTzQnnFJCQKSgg3J3G
         oHXyT7ijR//S2EuOzHIGXC8LnM61mekzxrAzMH3+QU6Lj0tMJqrgqWiUPsQuNP+sqyY1
         GWdxtoV/Xy3ZjqRPAxeYBP+L0NHlB7I5LJXbBsgHPeL/PVxm6Xe829xfwenGPWqCeohF
         3pdq+efiG6tvbMWbkjxo6g02SMZKYNmTt80dr5iVSpe/uFTQyOZLTV839+/dC6BFhZqz
         tT1+S2fXt0niH1pM3S52QsXnVc3RxPNein1Q9L0RZtp6b66utSRmPQMWjHldMdgkt1vW
         I7eg==
X-Forwarded-Encrypted: i=1; AJvYcCWi2YkIpsLdk0TLkzVolZxxkLRRYaj2xOqukEPhSvtAMqneCX9/t61D3K4rCyAGSg+mp77ZhU53Kw160A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+hSXACKfEhqvAxTXh8dRT/TGNuv4GS99+Xo1r5eC9wYACfeD9
	Lv8z6SSfE5wJGCjhYrnq8rYwxiRsNvD9BG119okHwDz4KVfwRVk7NiCJnnPYeVE=
X-Gm-Gg: ASbGnctDQIad8O70xqgPeg28Z+hOVhZrtBmhCc+rEczUaZuDe2szAL29cVudBDg79sn
	+Ez6w08pNjcsE53CxitdbxzVADccXnuEQzJaCiUJnC24V4ApQDYpe3j2+HbsO7xgotj7lsYxN4p
	hqk+D0OudbVnWrnJMRkKyHULwRv8K9WSSh1HGlDfeIRJ6QejHmU78V15vAFTbn9hwL0rr8M2zJL
	3K3swnDg1bObl2sgzEP167amOxraPnF1iCz+d1mTy9ZVONn4BD8Z1UWbv3yCR8NwxflFXFiJ3Fm
	Oa0bWY7ITbk+ypu9QFT5+nqZjGyunFeP4neT0z13e6x3XDP656IJ3WhQZxDf8zvyU8QBAsuZdRh
	8zHU3s1pFynDBtro=
X-Google-Smtp-Source: AGHT+IH5uEHZHf0q3fBMfhb3D5pup7+Ee5MfqdlEewW7DJLDoGW+CYuJRaRH9YD4ei7FrdbwX1nRgQ==
X-Received: by 2002:a17:907:c8a8:b0:aca:bd09:3cf2 with SMTP id a640c23a62f3a-acad36a1dc6mr443491166b.13.1744698050067;
        Mon, 14 Apr 2025 23:20:50 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm1053861866b.98.2025.04.14.23.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:20:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404111703.235455-1-krzysztof.kozlowski@linaro.org>
References: <20250404111703.235455-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] memory: Simplify 'default' choice in Kconfig
Message-Id: <174469804877.15476.8104725489814649152.b4-ty@linaro.org>
Date: Tue, 15 Apr 2025 08:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 04 Apr 2025 13:17:02 +0200, Krzysztof Kozlowski wrote:
> 'default y if FOO' can be written shorter (and it already is in other
> places).
> 
> 

Applied, thanks!

[1/2] memory: Simplify 'default' choice in Kconfig
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0c16b8fdfe0952ce6fb317c27dbd54e214e5ed6d
[2/2] memory: tegra: Do not enable by default during compile testing
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9a4199ae8a041bf75b544c1f46a2ea95417b69de

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

