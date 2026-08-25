Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3385446830;
	Tue, 25 Aug 2026 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787671809; cv=none; b=mvUxlZndN2ce+I03nQb2UeVzHAPWL7g0jA2r7eJB5b/EfEFDx/VpY89QWx7HZ5DLcCt0kZmEABbkJnnQSdFD1pmQL12s7qkhAprK6T7JThgU5fYBeb5RZ9788O9DMNIzIVg2qBBhHyMz4yhqv4hNkex9YweqhdgdwtOyfcBYKOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787671809; c=relaxed/simple;
	bh=VX1DQGP64sDlFJU6h6WjC9QKWk4R7erwd33lDUygt+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kxFc/DPNrRM7Wa8mdbRkuhZOoPAEndp+VxD4uYZ9f1aUkfLPyiLt+wPhS6IrioKWD/uhUVfOlSnTI8XaWj34fylLhR7r4Su/UG4USTdTTqq808FNFLnXBN1XDj9zu4mXqUXB2l/g3F4b+0zgevjmtWwGjpgKHBbo5CEccHmyWoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Yy9eNa8d; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Yy9eNa8d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rZPvGbvTxuaUieZ0JykzVrZCBZ6diu5+kEagWcP5i6s=; b=Yy9eNa8dOguB5ai5gM8NWsrx/s
	S2pMtHYDnED1hvYB5pxj6+Ad4/4TwBMLiekzdUSvMpDKpHx8BPpPmvVJ/cip7X8H9hfTHeZg450Ac
	2Op9+b8btKUlsb6NhCz7ZVBJEZsw/g05xmeUmxrRYHIzkWgR7QUNJTV7jrb9eXjwXkv34PFL2n521
	y3/OYaJNFUPrMl+YX4jWZiQMiJAl6RKexP5dMehCDrnC/gaxSb8FbDAvrvjhAGY7LElro/LUGP1iU
	8OZbYjEdaR/xakIod2clSq/KckMSPAOYC6Q+7GHQmf84+7SOpT2wUQGbrCqdD8QNr8LOptweM15Jp
	TQq+Evrw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized (part
 two)
Date: Tue, 25 Aug 2026 17:28:37 +0200
Message-ID: <4227750.aeNJFYEL58@diego>
In-Reply-To: <ao2ws3ZA-o8ZVjTh@redhat.com>
References:
 <cover.1787239813.git.geert+renesas@glider.be> <3074509.irdbgypaU6@diego>
 <ao2ws3ZA-o8ZVjTh@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 25. August 2026, 17:11:47 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Brian Masney:
> Hi Heiko,
>=20
> On Mon, Aug 24, 2026 at 11:11:32PM +0200, Heiko St=C3=BCbner wrote:
> > Am Freitag, 21. August 2026, 10:53:10 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Geert Uytterhoeven:
> > > 	Hi all,
> > >=20
> > > The clk_init_data structure contains several mutually-exclusive membe=
rs
> > > for different methods to specify the possible parents of a clock,
> > > prompting drivers to initialize only the members they need.  However,
> > > not initializing all members may cause subtle issues, which are only
> > > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE =
is
> > > enabled.
> > >=20
> > > Hence this series aims to make sure all members are fully initialized,
> > > to avoid such bugs, and to prevent future breakage when converting
> > > drivers to a different method for specifying the parents.
> > >=20
> > > Part One[1] fixed all cases that I identified to be real bugs, in
> > > response to a crash I saw on BeagleBone Black.
> > >=20
> > > This series is the clock subpart of Part Two, which fixes remaining
> > > cases that are currently harmless.  These are still fragile, and may
> > > cause future breakage when converting drivers to a different method f=
or
> > > specifying the parents.
> > >=20
> > > Thanks for your comments!
> >=20
> > I guess more a handling question, how do you expect this series to be
> > applied?
> >=20
> > I.e. each clk-arch-maintainer, or in one big thing by the core clock
> > maintainers? Just wondering if I should pick the Rockchip patch
> > or just let the whole series get applied by the clock maintainers.
>=20
> Before you pick up anything, let's see if Stephen picks up this series
> the next few days before he sends his pull to Linus.
>=20
> Next development cycle, Jerome Brunet and I will be clk co-maintainers
> [1] and will start collecting patches then. If Stephen doesn't pick up
> this whole series this week, then pick up the patch(es) relevant for
> your tree and send Jerome and I pull as usual. That's just in case
> there's other patches that come in during the next development cycle to
> these files and to avoid merge conflicts. I don't have a strong opinion
> about this though, and could be convinced to take the whole series for
> simplicity.

Thanks for the heads up on the maintainer expansion :-) .

At least for me both work - Geert's fixes are for the clock types used
by the Rockchip clock drivers and generally we mostly get new clock trees,
so there shouldn't be any conflicts between this and other new stuff ;-) .


Heiko


> [1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/=
?h=3Dclk-next&id=3D8bc7ceadce1f362a8b0e88075ef3d926b286c01c
>=20
> Brian
>=20
>=20




