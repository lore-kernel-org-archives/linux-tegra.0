Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDA43074AA
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772850; cv=none; b=kscwd0eo/tPk4C8o4RP4TuXyjjR0ZiteWvonj5pKR0NUkK2E1iYoCX5L/pTomQoqfMkpEoWnUmWSKJh6xTerKckjkGZy7OErr5VurZQH+CpxqcrlY/TusAItollAchcTjsB6pfmIUTv8ZESV4gIgMB2eSvduRSAHDiXfpmL3F8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772850; c=relaxed/simple;
	bh=P9gC+lGzjtMArrtoyqNulbP4U/Rr/r9sqlbgUdghZh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNY132f8JBz/rmApLYBSPydGMz7jupM1/L4RHhKmh8qXmYy/1+nlTxw/UFaWsA5pSge3mxyEbF3jpCelxLYDk0wNMxY2JRSV+6lKq9mEXfEJllHsNFpaAB57AxYgm9VdclUYN246Sd+gli8+qU1SGloLPEE2+glsa1HsyUOehfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AYl3H+E6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AYl3H+E6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aad4823079so2536625b3a.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 03:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772848; x=1763377648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=AYl3H+E6yMrrrrIq0CYTN5ssxJXa2EHFHx+ESaNyCZaBPjsB5yBPVFN07QC3IfzdZv
         fc/RFcb0W0kPOxXNr6K5+PF1zTjSKLkWduJKAEoZbbzN8eyDl5LZenrQzhU1BXYrv2r3
         gu/00GVcSMvK5lyVdh1b9K/GsBNFyLrpGLMl8KjaiaJr0Odninhk5h0U9CfHW4Srn6MJ
         luLr6bJBgYPzMCCmO3TNhzq2QD3H6OpURz2oWLGwIKRSeLl6dUKBG/nxfrQz3w1eIma0
         zRxeyvfdSqu1Ab1dPi3Dqln5EiAW4BEOPZvjJd566QxOQSDsUC4XmTTqsZJoO2EFGnJb
         IgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772848; x=1763377648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=oyhImJS0dqW/gZRmpXgVgzw39pl7wnxcdyzbcGC+d/GaGaDpwwV3JFDSYSURPDA5Zi
         HgRgTVFn+O4lZzLLWYaJuA64nRzbWGzVPvOVro+oLZ8QpOZ6GX8mRatjITrQ63yjSmnm
         lMSeH6vW8qSDvrfkXRieSZ0UhgIDpp60vmOoKPiVzelH7tBgWEuDWDjr59J0ePi0JaaM
         LwbM9GF2Xp6yWGN/DGTEiNdPsFq7Bjz1G54aiuGnb+QKZcG4bkM+WdBrDtHkZgqO/Zb8
         QCz66EDdiA9QLfHjtKwROkKGXX1/nTHZv/uUbuuJzWomRKwIFQH4LpnJV31gWLh3sTH/
         mAYw==
X-Forwarded-Encrypted: i=1; AJvYcCVRURYGNj3wLlGkH+O2IwXG6sJTtc0sbRqMGZTB55V6p13txrj9Gw2A+GiIeiX6u2adEgHOIw4pmL0nwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjg3wMXy5S6/pSGjoBOme1tZq2sXbaDJfPN5SIOEnB7vVvGEM2
	BJvHnSfJEjB+Z14bZwWWJwMkr+ELi2BkEYBhR6orligfbsY0tLi5XtIZuk34vPXjsaA=
X-Gm-Gg: ASbGnctWyKCCzpqfseGTKmxYeFiP9OY9Kof5mmoi8ZvXsOVrI49WQ6lg/awDgmC4I94
	U4dbnjFBJDAnJTtCg/D9ok1nbwVUNpxh1W0iaCjrYPIAgk5gGx16XZmmEQWT1xZzcWN4oX3gTAe
	2Y2u9eF4RMN0POo06FGvDMW6Kq2OplPbd1+aSiGyuMMmj6onkn/cakC/39ZCboIDBf1JGkKaF6t
	DPKfgVAzchnl+vAxs+dUfcd0G7A4twxgRIMB00AHP/x1J0vxYomBE1EG439YdYIa4130NXVYslN
	VhZ467c67SSEM5/xLp+SUxjL5NdMXdNGay/xyBbI27/y8mnLDt00p+Ns3sKcz/V9MT6Upu6QK4A
	ZzWX/VdP5eMVccXTmiOOg40LdoWO/EqVlFWeSV5nsWGDIuQpBcewlGGJRufLPs8L3aSzPpsof/c
	q4
X-Google-Smtp-Source: AGHT+IFLmvoREqyCOsxdVYWioPfB8QTyekqamyvK/6SevugbTh8+Sr7Hzt8HMarNXUtUBmALUpoibA==
X-Received: by 2002:a17:903:46c5:b0:295:fbc7:d282 with SMTP id d9443c01a7336-297e566886emr96785235ad.27.1762772847847;
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c8ef47sm143941675ad.74.2025.11.10.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:25 +0530
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
Subject: Re: [PATCH 03/13] cpufreq: mediatek: Simplify with
 of_machine_get_match_data()
Message-ID: <elghyjazfcsbwh4tmyfgfrbstfgpijgmlfu5kytbg7yvjtx2rf@v3riwtqr4itv>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
