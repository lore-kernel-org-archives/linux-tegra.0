Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BA63A641B;
	Fri, 21 Aug 2026 12:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313692; cv=none; b=iq+KdZUVKb1fDJ31MBtCLvH/pVXvZTqeVUeaVzwSIQV4HWMOPy5xAjwWZwNdh1U1JouAHGLDjKL/jXWFyZgV9LNiq8b6nFtmwDIeXIQ/z+h0juutJcjxW+zO7e63kMciuyr5ynkzIaArL6ma+F4T2VS+s+ZiKmeR0dKeUfNH+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313692; c=relaxed/simple;
	bh=l8B8jrUwtIpdpun0A6Qe16xv/NvpR7D53DSTYbiZ4f0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkGcjP2xsU84eqOUpIbpG3Qjd0UOC85w70JozhkERw/WEP+tX6u5E7m+fYvstccPfYPw2KwZdKVp5bIu4j7qOrV9s/6/ZU7v2aqwu+BUsq+gUvg68pjmQrgsNtUYD3VaXBRQ6awYhKn6QzIwQWlhzxgQjCTrOOyYFUmPYYWrYAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=oPKzPzeT; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=oPKzPzeT; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="oPKzPzeT";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="oPKzPzeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1787313174; bh=l8B8jrUwtIpdpun0A6Qe16xv/NvpR7D53DSTYbiZ4f0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oPKzPzeTto3Rtpjceb9FC+Dvuza3fomwF5mQYCAp+YKs0B/tPC1MS8THVmmrxs6ou
	 zhiaamwhVaKDU7jU5WC1gTjRBzRQhbcACY4ctkYJr6WQjgcTThdl7GQCUPiZ7UqH7g
	 csnjYmgX9WYMTrZ29W734dsp9g33Y9EvhzWyUQ1uIRDQObGY8D1xbj3hedRPFAHoQF
	 U0n9q2y/XGnsZ38tLRDkPYoQO7zr7GLXOdk7I0zy5OppGqqM0BG/JRKMVW1YmJtoNp
	 P+8saJSIi5glthGejj0fJxKtW1i/9gb2SNwscq7IITpJmbx1bAaAsSZSU3WAHWldb2
	 JTVqZ/wxxf+qg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id AC69D82660;
	Fri, 21 Aug 2026 11:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1787313174; bh=l8B8jrUwtIpdpun0A6Qe16xv/NvpR7D53DSTYbiZ4f0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oPKzPzeTto3Rtpjceb9FC+Dvuza3fomwF5mQYCAp+YKs0B/tPC1MS8THVmmrxs6ou
	 zhiaamwhVaKDU7jU5WC1gTjRBzRQhbcACY4ctkYJr6WQjgcTThdl7GQCUPiZ7UqH7g
	 csnjYmgX9WYMTrZ29W734dsp9g33Y9EvhzWyUQ1uIRDQObGY8D1xbj3hedRPFAHoQF
	 U0n9q2y/XGnsZ38tLRDkPYoQO7zr7GLXOdk7I0zy5OppGqqM0BG/JRKMVW1YmJtoNp
	 P+8saJSIi5glthGejj0fJxKtW1i/9gb2SNwscq7IITpJmbx1bAaAsSZSU3WAHWldb2
	 JTVqZ/wxxf+qg==
Message-ID: <9def4b16-50e2-4fe0-918f-d680cb9f075c@mleia.com>
Date: Fri, 21 Aug 2026 14:52:49 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/45] clk: nxp: Make sure clk_init_data is fully
 initialized
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
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
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
 <fa00846b4f9e3b91d3cbcb21cd27be7697b3994e.1787239813.git.geert+renesas@glider.be>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <fa00846b4f9e3b91d3cbcb21cd27be7697b3994e.1787239813.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260821_115254_757194_54D68DD2 
X-CRM114-Status: GOOD (  17.51  )

On 8/21/26 11:53, Geert Uytterhoeven wrote:
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
>   drivers/clk/nxp/clk-lpc18xx-creg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/nxp/clk-lpc18xx-creg.c b/drivers/clk/nxp/clk-lpc18xx-creg.c
> index 3d3982e9c661a5c2..de3c214a80fcf903 100644
> --- a/drivers/clk/nxp/clk-lpc18xx-creg.c
> +++ b/drivers/clk/nxp/clk-lpc18xx-creg.c
> @@ -138,7 +138,7 @@ static struct clk *clk_register_creg_clk(struct device *dev,
>   					 const char **parent_name,
>   					 struct regmap *syscon)
>   {
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>   
>   	init.ops = creg_clk->ops;
>   	init.name = creg_clk->name;

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir
