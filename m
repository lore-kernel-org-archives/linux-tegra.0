Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B0E17836D
	for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2024 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719397343; cv=none; b=cdFH1p7MfhQ2Aut+5V8kxfp2yfx4FaDV+GlEPS7+Feh+17pn989CZWuvJ2iwEKotPRIHoSD8jyUtqHhs80CAve8oulEsuZZ9qezCTLa6BkYYzTZ+5HESotl62/PyyHSYyDsNBGKretUc1h/x4axvd8GiVKKmCmyucu6kSj95Wg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719397343; c=relaxed/simple;
	bh=Gb6GkB0E2bOBZHPXzucf1AgqftAhJz2niE865GOBzqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ve9JACu5Fxfy6xmurAG75hs8gXxWzxWdr/l3C/KmdcFzZ01z35l/xlhrb/7eLx0ibLYJxrUtBZ/NkXWKUrkm4hjTrTe/nG3sY5Saw8L417k9Ksqi/lFE/0lGqy9PICNi8DwRYhpsOks2K9/egSN0vyqcIXgBo2DhAonpYQU99gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qhAj6opC; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qhAj6opC"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ec52fbb50aso50370061fa.3
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2024 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719397340; x=1720002140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQQUVeIK7k0d9MgtOJcxNr56RS5eoBT5sfu3gWH8b0g=;
        b=qhAj6opCTXIbTmipQKSqhmb288FxS9I80PEbTvkBC9rtNNHmUwTBzVRMEW3iIbJ2Dx
         WunP63fQbXp81ceWYbZbfIgPlZYGjjBYSi+LPgyPtdDvxc//hQpvtl+10nrBQOGRkYiv
         VPA/BsE1P6IcFKybQ+IFqlR3KodcuHTO5d25eVdjQXCkb7WHqetahyS38J6Dh7CpJTPN
         5zWN0AzZxVHCuNDnGtynxD6SfPJ0JQzwMwEC53S0aLa+WJMqHp7TwJuq06V4yChR+Dhv
         CiPrOGnlw7eaet4vcwtIETxso6mwxUBwHF7nX8N+ANajsMqsaR7u/LlyS8/XSOoAjaah
         oTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719397340; x=1720002140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQQUVeIK7k0d9MgtOJcxNr56RS5eoBT5sfu3gWH8b0g=;
        b=nGTDA8y6nroGeyqYrViwV7y6u+Tl0HDJIzHFCRLMgJe3LzFwmWHSMAeOOAig6+x3Bq
         jRIR1SI7IN0xG+uaeNyk0cI7nYA9JvmTRaQdNo96buCzAkm8GkOxSC8ZLdzpcZLOV+oS
         eA7CKLC1cnlRtIX+IpscsiFHDUnD/7eWIEiXNVrA8POaslMByxVzFvLXRF8ECUbxuBVe
         310r2Lt5IeqgUhLhSlFswNC2M9YjRYubRpyTNchPGF8am4mJzZPuGov0K63kzZXz+ubq
         cyNSbWlDuQjq/UouW8pbznomwOEYQaUH6j47Ea6vZyT9jgpY+itNnHLjL/tgLQ1DGBAY
         FpOw==
X-Forwarded-Encrypted: i=1; AJvYcCWfByZKfMETkTpXJqzS+nhve1VE09wNmjSRQeaBZ87QnIy2AmBNc2qTzVQ2iTRN8Qk7neMnqO2n4ClhVzo1/zle1+c4Yzhp4mO1bn4=
X-Gm-Message-State: AOJu0YwimPVxwO4QO/3nt2bPL5KRNymSOcMPhBhrIt735WA/1Q9QWO+S
	JRw+dDONf77Qcaq6GTTjc1qXYzWRs40PsmxdbVrOdLhrLzqsWG7Noim3oSuBLWk=
X-Google-Smtp-Source: AGHT+IF66geCJ+IDyk7DWlk8gVgabzMqbrOvnz5dxF4G+PQuP7P1Yu2mU/puCcrZCVWhA+b+phfFGg==
X-Received: by 2002:a19:6b03:0:b0:52c:dba6:b4c8 with SMTP id 2adb3069b0e04-52ce183265emr8209671e87.13.1719397340267;
        Wed, 26 Jun 2024 03:22:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8245e87sm20498075e9.9.2024.06.26.03.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:22:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Tony Lindgren <tony@atomide.com>, 
 Stephen Warren <swarren@wwwdotorg.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com>
Subject: Re: (subset) [PATCH v2 20/20] pinctrl: samsung: Use scope based
 of_node_put() cleanups
Message-Id: <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 12:22:17 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Sat, 04 May 2024 21:20:18 +0800, Peng Fan (OSS) wrote:
> Use scope based of_node_put() cleanup to simplify code.
> 
> 

Applied, thanks!

[20/20] pinctrl: samsung: Use scope based of_node_put() cleanups
        https://git.kernel.org/pinctrl/samsung/c/707807f4c1128e39442519e849e4ce0b7c29b110

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

