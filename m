Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E2636A033
	for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584463; cv=none; b=nW8Uo/4Rm502i+KeLGnMh/B6Vj7vVPz7+IEaY4Lr+McnoFGPC1WwHpqBW6+I3mKFd0HzamG1ClPRwJXWvipqe5B38ATO9dtb5jjyBggDkomeO8pEl2sQzTCnVydmJ83KnF6hMcYFie5B8ANqG7+cKOICfXfhoS5/dqXrVehIV7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584463; c=relaxed/simple;
	bh=PMHzlusqnjEcUolJb6Rj0ihhVcm0EmxTzAkLKIuEEmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjEUbvA5mRR0Sbq6IqGohvjAHWL4ZjEArBlWbvY45HktxaOXmaxl1RBDg5XJsRpWL4GVxwTvWbD/JF+yY5b2t5LC5LZ29Rt71O1EsjaZEtq+JBBhaqOYiib4y0ehq2XKc4QY4t4Ho6MW7pg38ZpPLKe1pO35J2dZ3CypqjNd4AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQ1ywwYh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oF6MRzeN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQ1ywwYh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oF6MRzeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
	b=RQ1ywwYhBSzgemMFnvk2LOPOKEsN8G3U041gYQ1gub52vQQf5JXQmWNISH87NWSdr9U59b
	5E96eDnCvOE61vPX7qcjGITu8btjfXfBDaYSloduwbM05tjtDJKEiQz3gJPU9ar9WEc5s6
	6R1b5qs/zj7KBGmuE7LcEWdx0lUo6B4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-4oDskm9MNQ2IilQylKUFhQ-1; Mon, 24 Aug 2026 11:14:18 -0400
X-MC-Unique: 4oDskm9MNQ2IilQylKUFhQ-1
X-Mimecast-MFC-AGG-ID: 4oDskm9MNQ2IilQylKUFhQ_1787584458
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c4da3d504so18776736d6.0
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 08:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584458; x=1788189258; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
        b=oF6MRzeN395dZjNy8pcRfe5CseOWW92MPrDY1ThpTRLMzvYYjy+3PRbvAawPZ1pjT7
         nickfnFlfw7zqdwMreayuFSWA/BdXPnKQ5ur7Vt2LNdGqWec7csfG7C+KW5I5YTTbvnJ
         wnsQo0brNyHpLtnN2NhkhmM7waHE0ALk+ph5o6+IMVKir/hWxQmyrJ3/EU5R/1ksogl/
         zZRGmDxWcU0WEK3Djou89HObMtmnXGU44+jqUqTaYrd3kC9yiwIVlYYDFDIFiZiG5tc0
         li6ZkXoL47J7oMQzXguZWOtZeQzuAKjO2opkYBLpMT+pIRP7RD+MXE0ZE1jZZCp2f/8x
         sSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584458; x=1788189258;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9JEBxETCpjKOyzPxUj8DiK5Y8iV5A7DhykNYlgKppA=;
        b=Ypgq9B/vOIQZ5kAWeucHCKm6WBv+k6EXUhwXfgSje4mvs5kYgnTJCPjgBplO2QsX9f
         Y6fzzh0c1a8kqpz6NJO6ZY24RbDgKHImQeAggXxs87mCXrg3DBs8ziH0Ia48OU2MtwG7
         gC+cFRtO0qs2/FG9+O4i020XL80TJepOG0uzSVabAXbkYLyeReAGl9E/FxGaBvZMAF+5
         o8fZtJ1rOEQt4yl+ST3S7jCbXAmFtyXwPu0Uds2GE41hStxEGMGvddMMjN/VSGauJbQC
         FX5wC4KLL+CgfLvaQS1yM4cfcgSoqs+f+cTLYrLe36VOThmBOoBfbDrttxtHErc6UkAh
         AZiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiomsZDWuI2GUebx5A2aTrnjVUzrC+8Kc8JlhLG9Ol6DHL45dbIcQCyLG8+nBUh/id2Z9q0+fZ6YWTeg==@vger.kernel.org
X-Gm-Message-State: AFuF++kfJG6D/H0Fr0C3dA/0yMQHg9VSYLBnEdT1tlvLJqaWNKUKCfQA
	WFb6eQop3IzwfnGs2wgk9hA1BoPJEtp9YRqRWJtU5ZusggogLEQiSMMDpUxoEp31B6ZBLAYRwtZ
	oe9drVd/QuLNEQwCHIMjPZkBbIheMvgzeMy3vrSb1FpxmjmuJR/jAccqUxdPW8lwF
X-Gm-Gg: AR+sD12ieOlT0hvEUY3q5vS1T8SBXE9szzMTrvfAA8gWgM/XjGN9mITYJoLEaeQ1PMl
	ZU4/ZeX0P2hSvPW/QlwKQQQhFGiXCk+vCziWcMMR90DAwuKvdWPrVyIVwDRf63lVL/62H/8QBUX
	pVqfZnQKIda0Yg/WYskbbctgAy2mTZkX0nq/2XS/PgfHnaMylwYcK4qE8AkZkYrQi7qSQ0pwf0y
	cq1D/3DYN7EvhvZEzSP4U1iXUjIUpauyS1r9PFkbdSVOzw9FurVKTmBN0EfPAVlr672BAS1Ucc0
	AQeIN9kErxxxTG5tHPALFfpiA/QpBmIbsYEU0FcZ6jzDI/jY5wagmWNOLwcuwfDPim9wVF/h6w1
	rqBwvrQAiMjTryqra9G2GOHUkaqBZjx65UYE=
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr260846286d6.4.1787584457440;
        Mon, 24 Aug 2026 08:14:17 -0700 (PDT)
X-Received: by 2002:a05:6214:2a49:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-90c80942e22mr260845166d6.4.1787584456812;
        Mon, 24 Aug 2026 08:14:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a82554sm64013126d6.45.2026.08.24.08.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:14:15 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:14:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
Message-ID: <aoxfwycOmEzLzhEU@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787239813.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the clock subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Thanks for cleaning this all up! For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>

