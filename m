Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED44146A7B
	for <linux-tegra@vger.kernel.org>; Fri,  3 May 2024 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714720812; cv=none; b=QOemIxJ2janiI1TcGBnpb1cJ3F88UV1Tsi3ShpXB4vVS4o10eVAFAC5VDOc2aFQX9fszV5xVPs9r7S2IIa1YiL50r3iAS54OdOkpd6xMcdpbJVGvG7Fe/5hsZwPP8vz4ssV+/gTFurzVuNPPeQ9ATVGVDxEE9WEvjrXRufHgNbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714720812; c=relaxed/simple;
	bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyuJYHD343vVV1DoJEvZ7QRGA+SFprsrQRPIBCfWt0y4b3OfcBpz1vQCXVe+xwpnzsYoJWgc1/lT8kP5LbgaBWiv/zyO2SKYi5vrkRH+zu3OQiyET0RNFw1NSleO55qW4AmVB4mDsfXaA4NTiXwtqCSnt2lZDXeCNBpqROpn/us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K3NDGRMR; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3NDGRMR"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-de45dba157cso8187915276.3
        for <linux-tegra@vger.kernel.org>; Fri, 03 May 2024 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714720810; x=1715325610; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=;
        b=K3NDGRMRh175rj4pKMzS8Pf/zz8LzbdOk+IvF4C4dlp0pUVg9xsOaKWv6pBo9BkO4o
         /aU+FPMulD6/ni4e916Lmrt/EhYv3VW7EWQCYMv5MCNEJDCiGOw7Omri5Jr2zkotEBnE
         RFRFnzsWPoS3HlN2y5UHdPKGF/cAw8pCUg+IFvTUdgStG+ed6AXYAzm0KY6jSJXd+HRh
         W6tlgTIKg8b+AkMSZ+tEUTsEtrGx+zukPxEta+dKeOdwOfLigEKdEHuB6Fyb+GJYdfxS
         ASjD7VSAeZt/6UMmrxc+DeHAeFveVGJPSRqo7i4hgDRJbo45CeY+QR5AN2PfGp+R/Mcx
         9HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714720810; x=1715325610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=;
        b=Eb9Il9N0wPjkujMtxWz1csayKlzINZukwTJH71WDqtft1nrgMH8VPhcr0+3uoLndKv
         qxazbzbHBAs6SYPsiVsdqf8CiwR5VrQ1UNyjNQN4PR22Tq097qU5peJ5ZygscJm1N5vr
         2cxUXFHliRcF/XzRLfw//E0A81JqV7M3YA0TLtogDvr2WSwwv26cOGS5RnmBzex4TEoP
         RvCCGEZO5wGSjAak3tAiEp0KHF+NzesiKpIHzZhjieVhupkCyHO7OFo20ZjVm80Qy7+Z
         lkvqJJGIUxMhdUOrtq/1n2EuZ7H71n4wYvuBmPhIjrTIRgNC0eTZpTPg0bol8tkmLiRX
         HiLw==
X-Forwarded-Encrypted: i=1; AJvYcCUv6OZ5QlK1p5GQqYY+5gKNT1ZnOBBB8tzx8yI+0uvnMcaPmyxB0T/Qqb983FyyDYrBTYyjJhFQG2KBgDbIHgi/rGw+MVz9OsuY+l0=
X-Gm-Message-State: AOJu0YylAg3P6MeehrdzeTnET8TmQEfwaK4V0RAp83nPUMXy382phqOO
	CVaJ9kWeoSZvtEaSTAr5XQjAALDj3vjB2wkQa3S0pP1EjHI+/lznaBUP0vLnIQbAkdZobPoKirS
	bU/eoEhFmK0ToXO1Hy94RjEC5hxCTFLpIxTWqqA==
X-Google-Smtp-Source: AGHT+IG2e9YB/XnLTQbvqj0kK4ATPxoJ7R6aIP282PPsbZXF297lXvACY/w/LCEjCFtAwBrhBmRU/mc6jno/5QoxHeQ=
X-Received: by 2002:a05:6902:2203:b0:dc2:2b0d:613e with SMTP id
 dm3-20020a056902220300b00dc22b0d613emr2388159ybb.10.1714720809843; Fri, 03
 May 2024 00:20:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
In-Reply-To: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:19:58 +0200
Message-ID: <CACRpkdaRpJw=kHtya2iww7vvm+Bt6-oPMmz-6VzfhZniSoMP3w@mail.gmail.com>
Subject: Re: [PATCH 00/21] pinctrl: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Peng,

thanks for doing this! I am very much in favor of using
scoped management of resources where it makes it easier to
do the right thing.

I agree with Krzysztof's comment that we should avoid scoping
in cases where there is a clear path grab/use/release so the
code is easy to read already as it is. Let's drop those.

I saw there was some patch that was even a fix, perhaps I
should pick that one separately for fixes, but probably it is
non-urgent.

I suppose we will just apply v2 after people had some time to
look at it!

Yours,
Linus Walleij
