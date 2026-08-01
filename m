Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3202F3C1D73;
	Sat,  1 Aug 2026 21:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618581; cv=none; b=RcFc0Me97dHgwsbcfEY0cs6YjJttVGt343lOM+ei6J3upQw+QGsyjwxicy84mMCWm5+Do2AoY5iKMRLxRfU4pXtAZbSbXnnBFbU1+HZjbNeJWaqIEHnOT1BCZgWcQQnmm6w1Qb+lZSF6L55k9zXrMvs/ZnXvfesUQIip5fcoAdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618581; c=relaxed/simple;
	bh=5sM1xs0sfKD4TGM5Irnf3QPHUB+3BbN18lEhfjT8RSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=t0WWfBRkzsOl+pezJ/i4Ogyb9kpLZ78YHd5TC3LeMdgQjSmashKDSS0jSzUqc7aIhpSsP4ihQiHNohQq5akaQDZHS9B0Nv/zgNhUp8BV+Fk7DHipCPzsABYc+ETwHP3FdRfDP+WfsMgYhqtzgebjpc2Os5ckmAHWDo82iahnGJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cjc3+Gfy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cjc3+Gfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83271F00AC4;
	Sat,  1 Aug 2026 21:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785618579;
	bh=HG9IH65XypfCAd/Nj6Z7NZAQdDapw3NbVOoaxeRscxg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Cjc3+Gfy0Y/N4Bfrfpsi84q8fG+NeA0OGt0vQnwJQqSvnSrOEMnKW7/YsWrRESrtb
	 rPftNeXy3tLj0X5BP4jmuI2QkrdZRPWN6fcbiKNLu42E012z5MGs/siPFUeZUXKwX9
	 fhGVNxecXNOmU97gd+2icWTGHk1wPPYtUd4/ZwhRWsnHiy6zGucuUAKHRKG9p1c7kb
	 AzjjFvJhE7tcqpTssp9MCiaZr7mpe/6JoWLSCYzYMh66x+mRDfo6xooQ+ujwV7jKgJ
	 or9DPGGoj7FT4QIzlIz+wvrQftMLcCAlcXFBXxRml6233VeHfDmXbrmvYqX4PS/aTv
	 amE/VtrmnTryQ==
Message-ID: <d00e0a4f-2065-4f37-b499-c27b6698c897@kernel.org>
Date: Sat, 1 Aug 2026 23:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Dinh Nguyen <dinguyen@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 asahi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.08.26 23:02, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Acked-by: Sven Peter <sven@kernel.org> # for apple dts


Thanks,


Sven

