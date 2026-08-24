Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB76377EBA
	for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604227; cv=none; b=GToV9swijt0EO9H91FQeWUeOaTlXTUDEv5eTqmbUNSmfjYBNT38vyKUtyfLIti1rn/qkotmTXTpKaPZaSr74FI5ACwMi51WUtOMaB7jwwG//KYwCUQ31b2490l8vIrReIwFglp+NWz7uUYaWYSYh0NbM9uYB2O9oR27S0OAkSTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604227; c=relaxed/simple;
	bh=EVUwDkr+aRcYVofgEibvAtJX7CxRusSErPl1ti71pZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDFyWplcBqSoGvLycpciiL6/diRegRWv60gvto97lTmspX/t5FUs3JQjfCTU5wVND2wTFm74cuMrqhxQdUib/OzwvwYJkdUJ2YjxglXnDV/Pj0hJK0DElCoOLNZ4YEf2gsQvmGgPYAqKBDs5oqregImmXgRNPKjs/9yNxziRB+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMOOR726; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMOOR726"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A841F00A3F
	for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 20:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787604226;
	bh=LEMIXlW7UB4hHdDf5XWpYKY9mKhf7DDvl0I5DYYVcWI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nMOOR726iilXzB8QwTQCM71Ch8G02Vaajd2yCMS4m+O5Esok3z5r0gV3VttHfuCHb
	 4g2AVRstZRMVo0Y6IUYR3j6owkp/ou4a00Y2jiJj33Ircz9/0ZpfuUV/cRNDW+23QA
	 1GluzBOVjcse336a1OdBAHZT0wEvicCM/X7+pFIs19JxWLEeAHFX5XHwBkJOCMnYSD
	 7EecCoxv1MdHvEeVrFiBCP2J2hmtiUbnaXyV6jAhIcHSP+Hj2REll4VSXfnTULnFm4
	 epNc025JmInkZuyFP/+OYoPczOeQmlLrLlbyatcAst3s47t2gWtNNzp5Yr+0MydxwS
	 v3L7qXsOPK1hg==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-459281bc13bso2797058fac.2
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 13:43:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqS1TH2M7evHD8QK9FqClehU0ITEH5SRWVxDsflnkBzaNcrgD5tt1ddv9jN80YfElxM0XMHwDbb/OWYbA==@vger.kernel.org
X-Gm-Message-State: AFuF++neab85OKP6e2PXSg3TwLsiRdL11X2mb5EAIUDaZ4daJFsC+W61
	v9pG4nxXS2Fvq6+gjV7aQ+M5n22Ihi3BpJ5z8zvgjLgw0nHDa66TlBypGENcM8nexGIVKM1nW5R
	sQWEtmzBPxSz5l4wEMwgDXAv6IebbyPw=
X-Received: by 2002:a05:6820:200b:b0:6b0:4fbc:aecf with SMTP id
 006d021491bc7-6b190476525mr1271968eaf.24.1787604225387; Mon, 24 Aug 2026
 13:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <7c480e73222bb51982fb82dc0cc6cd503f2e8b92.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <7c480e73222bb51982fb82dc0cc6cd503f2e8b92.1787239813.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 24 Aug 2026 22:43:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBhKLYHeK8-oHfUO1tEyz4TjwxHJgGYANRgtFunc=AYA@mail.gmail.com>
X-Gm-Features: AcwNN1XWcFJ59Pf1hWO2vZEK8dV4kl2H2cgk-aSr89WZDKQWMFn5rql_SFN6T_E
Message-ID: <CAD++jLkBhKLYHeK8-oHfUO1tEyz4TjwxHJgGYANRgtFunc=AYA@mail.gmail.com>
Subject: Re: [PATCH 40/45] clk: versatile: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 10:53=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
