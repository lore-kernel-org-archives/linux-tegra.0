Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0203074AF
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772837; cv=none; b=Xf9YjQ25nTgV0BrjJQVaQEdEk/SoLt1B0IaqloJgJ3FccZtNV8NOQ9T9o2yZAmVUeETY20Q6X4pSZrBU2ABR0NsMIR+3g0+WEy0DtRl4UyIoeuUImw7dOBzkx9qPw6RuziKyxIuW4ehVwydqHr4cS2msBCu/qIJAp7TwmaAFOk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772837; c=relaxed/simple;
	bh=y9Rc2TSg2Orx+cZa9j2QdmCSgqy1wVj5vvqljCG9AMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2Uifnwfu8w0zpgR+0VNu1PrZjz0uEIU6h9X4MwtXNW9voo+qEdhOARQraARidV18R8DHlBqjfcelUnqcyjR+a+wHnHZP/KwLHNv4NwFL6GEkJDI++m7YyyCRwvEIZ/KATTR8gvKhJ5isW1HBou6pUgfq7h441kBQghIfaZqZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pITaHv7F; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pITaHv7F"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so2283044b3a.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 03:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772834; x=1763377634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=pITaHv7FQd7Ixj+gmMcfdIpoCp452jsxe5wrcUQnPkmqLdRptFvnTrXkBLEmj1B3dY
         8T9yTfQcHwQlEDmQgVFb+uYgN8AiJAeC2iB59o3D9AY8ZwfpNMKDvxDxp2L+iYYepaGE
         7G+M4Fq0mSIte22N7kwZJot8nVqApdjdpAdrW+WeZ4TqOvNVJ978ZtDu6PIfo/s2Sbqp
         vOuOTn/MdTjzOK+VLNxHxn5KGFq2MprbrWECDW0RGd9RTHUTbAUm8rCmmaCJC9v3mKJK
         d8BJB9xKbSsLq5nXQEyu3sl6CEJpSZMvKsMe+ej0jRPga47fzdAS8+Vz7WyPiWkCzn2x
         CAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772834; x=1763377634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=CsMPpFJVudQBzF+G+Iejpn8l9HiCQIIlMtCkv8Ex2oVkpWlmdb2DsYtQWeMJn5StFc
         h2maA6YzO5ocVzytXERFiHB0bBXbtagUt6UGDKmEwzdyLuwJ+5oFXoq64zW/pByoLIU6
         trv5HMyfXsJq9wbJCfpFezzL0uShtJE0JT6wf2edZGTBdLL5sBUQ/CaPIJaqLa/gX0FY
         gJC2ka4FeJRMmsHkhLtCQLfaLSn02DfMo+I618QCUYpd349T6kU1M34ub1TRKPgArAMQ
         eSOQZup+dJRMZwrEAiQ6be3YPWfbMhaqw0/3DDzCTtGiIk3iwuuxrpZDGsKYYjE7/k+9
         4UYg==
X-Forwarded-Encrypted: i=1; AJvYcCWz40LTYNzcfxTzPGiAudmf16xS+h1EQTXSKR7f/Wz+cbG6ShsOKoVgjPcpGMMX8KQX0t+NA6w/P5BXyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGWB7agLKd7iXbyBvltYmISE23KQEAa1pAMC0OnleClyZO7Upu
	WYm68zmQasfaTj28UBhDEYSlwht2O3i512ykqHeM9CVH/j56hBkv4kXpChF6aC/7SSE=
X-Gm-Gg: ASbGncsI1Ae/wAw/0lmXAYttOfuGm26ehQM4MN3vHSTLgdSWTUJpDObTu1j36ZOatuG
	c/iBPMOOB6ZYc+bRUjwWcExDvZraRsVhGy4AaZqSoJ+FM+73HbIseid4o8RscezwcG0j6yPyn75
	jB7szPUg8TXXZUd2jVNhuduC6E2VjSiaXMPZRUN9R2meGtB+T0oVi+tIiNV912zVdP3L6W/K1kM
	IXXx69dQs411Z9MhzEow4UYvJusHznquju01mWlEo8mdj+S2PBbVsTi5MkIxmQsp5bdiQ4vhj2R
	CGdh15qiOQISa0OsyX65KH5A7oj/Z7IMuVWz00JZb9YlqKzxVpHxy2dRYO1SWvsWIzZHOU31zeG
	pJGL4Mcl/j5UjQdKedps9E9C87A00X+JgfmMuPHjOI2iX/DarZiNNcBpnENBD2bdigDeY7+ZBkD
	8LrI6GazAjB2Y=
X-Google-Smtp-Source: AGHT+IEEBmMVZO0k0MIdHGG3oOt1wzE07GZr0Rosgte3T2/mK8NYjyyq/dXAAAQzolcEZu8MEC+rkQ==
X-Received: by 2002:a05:6a20:12c1:b0:350:d523:80a4 with SMTP id adf61e73a8af0-353a314ff11mr11044525637.28.1762772834004;
        Mon, 10 Nov 2025 03:07:14 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953cf79sm11625705b3a.3.2025.11.10.03.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:13 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 02/13] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
Message-ID: <qg6xxh3vwbfnl3z6otlr2bue2paig7w3agbpbauuzmppiof3q5@e4xjlcfu43cw>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
