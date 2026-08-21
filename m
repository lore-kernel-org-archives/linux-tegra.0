Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144FE3C09E3
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 11:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787311621; cv=none; b=Dbl74TzDcY/WA3+YZANRIe4k8259mIk1ffgeNvF5xlU7/3cPrnekPKNhpS99LCCA0kQkoqNoFVSoNE0gqCmPYOcNQh295C7ENVqX/rbwUeMpQpoz2lfjRhnFidJPYk7f5VXuQFFZwSbFtnhQjK28BeJ3MHLWJzBYWufuUcJobnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787311621; c=relaxed/simple;
	bh=qAWvudYMdASPXPfSTaqms42rgycSdo6rtQ42Q6DlQlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDLGtw8AAR44hrSN3aIIykxuJTiSivzyPauWD//bJpU1WoPMLW2HfOvnk/SOdpotw1oWE4TGrrrDBAPzzJ70N9HBlkogoaCIVFJRxCeCkPMpiY7Y49akitYp7VBw5nltNOadTb2JP++Jr/zCwMa8y/7xEDRieHzQfULEthqSZM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lccl7wmm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lccl7wmm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 115C3165C
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 04:26:54 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B4D703F763
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 04:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787311617; bh=qAWvudYMdASPXPfSTaqms42rgycSdo6rtQ42Q6DlQlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lccl7wmmPTsiDOfkgycmLzIh3bszCzAjMteTYUsSkRIRlY/XhORAm6zmhYX4JeOK0
	 m150Yi+cpcWsVVtWec2gD2Tfqbbe3yXIb86KGOm5OeAQ3joc8aNXDAq9T1uQXLNAvp
	 jhOLhz1U02lvHZSoVG/MkZG38XzN0TKJKRPurdbU=
Date: Fri, 21 Aug 2026 12:25:30 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
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
	Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
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
Subject: Re: [PATCH 05/45] clk: cdce925: Make sure clk_init_data is fully
 initialized
Message-ID: <aog1qljZkrxL3nYP@e142607>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <308a33a0e63241d94ee08a08a6de6cffa739556e.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <308a33a0e63241d94ee08a08a6de6cffa739556e.1787239813.git.geert+renesas@glider.be>

On Fri, Aug 21, 2026 at 10:53:15AM +0200, Geert Uytterhoeven wrote:
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

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> Compile-tested only.
> ---
>  drivers/clk/clk-cdce925.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
> index 30d0493c771818ff..4d49cc1659c07be2 100644
> --- a/drivers/clk/clk-cdce925.c
> +++ b/drivers/clk/clk-cdce925.c
> @@ -620,7 +620,7 @@ static int cdce925_probe(struct i2c_client *client)
>  	struct device_node *node = client->dev.of_node;
>  	const char *parent_name;
>  	const char *pll_clk_name[MAX_NUMBER_OF_PLLS] = {NULL,};
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	u32 value;
>  	int i;
>  	int err;
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
