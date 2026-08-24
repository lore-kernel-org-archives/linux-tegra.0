Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1090138AC9A
	for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604002; cv=none; b=FU6oanGF7+QkE+B8W1rIspOwwdVx0RvE1NHCeWNRBvGJxbkLA8KcK7TbIA9LZYXjoTHt1fnptnRa4Xb33yxT0y6c3UNoSx81VI7CfWyA92Txn5BV8wphiQMi30oXnKDDc8KikgxUfnPXwLEFkFfp8oEsNpL33JwDrAU3s7fhAU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604002; c=relaxed/simple;
	bh=EVUwDkr+aRcYVofgEibvAtJX7CxRusSErPl1ti71pZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWA1si29CBsOYgse18yLMbEPw98A+lRT/Sr0zypgjbTAsazyDAA//uFqObjucetD7w7PyTlw60MSuBp+cjuIh5++622LNlE2Hz1gEhts2V7DX5RCcif0NmDJSy6kRXdvAtmJHiMJY+98WpWSUT5Yu8awFdjKiG3BcllC1f1OWo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fud7BxQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fud7BxQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E731F0157D
	for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 20:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787603999;
	bh=LEMIXlW7UB4hHdDf5XWpYKY9mKhf7DDvl0I5DYYVcWI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fud7BxQ3mGLqvIlEbg6ad9ks7USWBuldJ1rhesQ/I5Z0P2TbTL/B4yjUjL1TSSrTD
	 v9RK49uFy/MyVlVnS8Z/JZDw9ZTdeNWDOS0e+/wAdfU7LjgosBNO5vMauS2LOkhSwL
	 h9es8uX1/IuSMbLrikq26C8DDQWS9jjYsQIWnhTN/9oY8wwhg8Ib5NngWTfnaG5VPb
	 QNRFXSnXUIyQ729E68Byd/f2DVHD/1gkoUs1R571cy1A1O4+ogllCKGvmvCpO5h+eL
	 qJLr9moIGO2e0IP8EFl/5HO0egD7wqzSaMyNhD5h7CfhF2rFlDdbxcC/fexzhM8k3F
	 Rj5nuaFX6ztWw==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-448cf99c133so125394fac.1
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 13:39:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoDCbqnl3nosfqKhizF0joggJE0jB3yimnDEFUU733IlpWeDlJ/zxtw9eKJltzYWGj6tXMju4Qr06hDZg==@vger.kernel.org
X-Gm-Message-State: AFuF++l25WsonWlHOSjKx3f2EEuL3ZrogvdrrheZp2EIEAx+/mLPwF/x
	zW0uywmAVIlviAnyKRffDtmPHfd9/xSukt5d38+iYqGZFLPeXyYfR16kCLLUhZp0jKRtpeWxg9e
	sS4oQnUcctoiCS5/75HAg1F8amFv5AJE=
X-Received: by 2002:a05:6820:4b83:b0:6b1:779:89f6 with SMTP id
 006d021491bc7-6b18fa810bemr1569885eaf.3.1787603998213; Mon, 24 Aug 2026
 13:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <631df13629bf77d55bda770f94c7b1863690f2e2.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <631df13629bf77d55bda770f94c7b1863690f2e2.1787239813.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 24 Aug 2026 22:39:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQd4ZfKAxzCaOobfQKyYqa3jdaCiPEd8Tp=yyC4YeLuQ@mail.gmail.com>
X-Gm-Features: AcwNN1WWNgSFLas9lNi7aTz9dpo8225CQLxghuyz8Km9gH4_yLCmhqwBO9vh3BQ
Message-ID: <CAD++jLkQd4ZfKAxzCaOobfQKyYqa3jdaCiPEd8Tp=yyC4YeLuQ@mail.gmail.com>
Subject: Re: [PATCH 22/45] clk: nomadik: Make sure clk_init_data is fully initialized
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
