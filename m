Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7694C29B77E;
	Mon, 24 Aug 2026 21:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787605953; cv=none; b=Bgv5FsCXJZ5cggEAymUCKndo799GADJ0nCUzPkljaxhSh0zrok8C9okxmGoG8XB1/R1X3H71mO3HYxAxxtt34CP8igDhhAdP14YtDHKzx+nYu7dNBXkpe0J2azq/9Bb4AdQZ6SostKaOOswdRvFOwF1/PCk9GtdHC1whYAheIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787605953; c=relaxed/simple;
	bh=AuHoPXlOyZ+fYnVf7rl7HDux9O/RnFbE1LPUYnWvKwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3tvx7KoT8L0VLWnx4IYyPb8vNUFEByh8cXVwaadDhwo1sUka0G3RdrfuYje2dKgRweMP9ytokb2DGxHZ6Hc8WsolPtQ0YYqvdwgxcZJExaUYj7mYw8GT4EoEDWoMBoXpi92wkX2MvGeFiCmzmS7RC11H4EhwHBIYlVjLfXpQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DZvpLPEk; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DZvpLPEk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CLZc7r+H5Cm5dsJH9Lph04hMwrcVERgqQMx1P2a2ozo=; b=DZvpLPEk1MtqoBBRVWAtczTzHZ
	QKPiaklbDy8pv/2jqpq0vKmDbMdUwHoxkMYOf8g5FmoJMh1N18o0sV8knS/rWa1e5neTd54CYAYRZ
	T7v5zV9EGYfeiDeiiGaUXM9JULA6IqWwrVes4yMnDNMnvdE93aZlNZHDJFvY7Vmq7I6IRS1oX+aPZ
	pIiQ6Nm6QGQWjb4eps39kwq8kjT5Jtmmod8mdsLvMN1fOpriQ3gcKW3Dl73Hd6H/vUSvrY+d3vhoV
	fwNbK4h5sYQZ1MOo7u/dQRUPF1vruhoIxSaALuV6O1TQD0Jf+ntPiKBH0L9Qo/P/7Sb58ECzxSZhy
	E52PwtTg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
 Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject:
 Re: [PATCH 28/45] clk: rockchip: Make sure clk_init_data is fully initialized
Date: Mon, 24 Aug 2026 23:10:54 +0200
Message-ID: <2765337.tdWV9SEqCh@diego>
In-Reply-To:
 <49127c1f7529acccb17e1408db9f21f6d15aee2b.1787239813.git.geert+renesas@glider.be>
References:
 <cover.1787239813.git.geert+renesas@glider.be>
 <49127c1f7529acccb17e1408db9f21f6d15aee2b.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 21. August 2026, 10:53:38 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Geert Uytterhoeven:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>=20
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


