Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830C32C0F6D;
	Fri, 21 Aug 2026 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319071; cv=none; b=YuD/0OrNh/i3J8xnKCT9jAa5rwg7Ax6CzK1AUMUK+ur4gsv+gXMalX+QLgr48gPpnwb9SnUE9+sLWnyNFeJS6n4IPbpJZ6ZAmMI73RE15CCii52kRAERXnUFoDhJJMEgvhOzxzdc6AUty5K01qfBjiziBWrGMKVU6jsoGnP/m3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319071; c=relaxed/simple;
	bh=R5vL96ZPR0G0EN/GrmLL2WqnOuqx3OjeFrZbM2LmI1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLURQ9K696AjeY/gSgAbMFSBk4uVJBK+8u/isJE8oAwh8/pFXSB2CxkgHziWZVRJ9HAWBc6Cw/T4hGVxDEt27zxuoIeC3t0EdlpGFR0dngRcISn2XrXfO9w0JPoLTR+m5BNbzJmT5RdjsLSaMzWksn5idDpcIhW9v63kHnc/ok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwHm1tBF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwHm1tBF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A77E1F00A3A;
	Fri, 21 Aug 2026 13:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787319070;
	bh=Uo/du0VNmVsqMTeIOJgXLNIRsqWuxBkETztHJiXKlH8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QwHm1tBFzOeH4Q0RYUy0xNdqoFrvBjA9HTqq6VmrDUlCgzv+1nCQZ/2uv6cHX6ji8
	 37U+QqRy5UX4cTix0OR322ZtM/qjLHwZvNVdGFWybpV5QKSQd5sQ3TDsLyyX7t22In
	 nplaIC9Cmv5FUehFUuYwLIiVAxWv+IDdAh+zMD/QcRgAXlPEOMmsQf8JWG2rBlwNrV
	 H3LWEJehc9NPBS3W4fPn5M405hnEr6shAga5JXiz6caYsYDqMGgZL8J1AHSmn2WeYU
	 cGvX+q5cSLfWe61Cn842w15VfrXA+2O/Fr9+LgqtwG+YIKSPkGUxYp5BlYHNU1as8r
	 0Lazhv1fc8TCg==
Message-ID: <170920ea-e8d9-46a1-8415-659672bd8de4@kernel.org>
Date: Fri, 21 Aug 2026 08:31:01 -0500
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/45] clk: socfpga: Make sure clk_init_data is fully
 initialized
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Linus Walleij <linusw@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Viresh Kumar <vireshk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <cover.1787239813.git.geert+renesas@glider.be>
 <2d38d78f8d59583e29778bebc65eaab911d8a120.1787239813.git.geert+renesas@glider.be>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <2d38d78f8d59583e29778bebc65eaab911d8a120.1787239813.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/21/26 03:53, Geert Uytterhoeven wrote:
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
> ---
> Compile-tested only.
> ---
>   drivers/clk/socfpga/clk-gate-a10.c   | 2 +-
>   drivers/clk/socfpga/clk-gate-s10.c   | 6 +++---
>   drivers/clk/socfpga/clk-gate.c       | 2 +-
>   drivers/clk/socfpga/clk-periph-a10.c | 2 +-
>   drivers/clk/socfpga/clk-periph-s10.c | 8 ++++----
>   drivers/clk/socfpga/clk-periph.c     | 2 +-
>   drivers/clk/socfpga/clk-pll-a10.c    | 2 +-
>   drivers/clk/socfpga/clk-pll-s10.c    | 8 ++++----
>   drivers/clk/socfpga/clk-pll.c        | 2 +-
>   9 files changed, 17 insertions(+), 17 deletions(-)
> 
Acked-by: Dinh Nguyen <dinguyen@kernel.org>

Thanks,
Dinh
