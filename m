From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: drop explicit selection of HAVE_CLK and CLKDEV_LOOKUP
Date: Fri, 27 Sep 2013 14:44:55 +0200
Message-ID: <CACRpkdZOSn0UuZkz2ZsKeG8u0j216BfrkUmO0Za74AYNKFNiiQ@mail.gmail.com>
References: <1380044515-3173-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1380044515-3173-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-omap-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Tony Lindgren <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Dinh Nguyen <dinguyen@altera.com>, Viresh Kumar <viresh.linux@gmail.com>, Shiraz Hashim <shiraz.hashim@st.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Tony Prisk <linux@prisktech.co.nz>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Nicolas Pitre <nico@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, spear-devel <spear-devel@list.st.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 24, 2013 at 7:41 PM, Uwe Kleine-K=F6nig
<u.kleine-koenig@pengutronix.de> wrote:

> CLKDEV_LOOKUP selects HAVE_CLK and COMMON_CLK selects CLKDEV_LOOKUP. =
So
> all symbols that select at least two of these symbols can be simplifi=
ed.
>
> For imx, omap2 and ux500 some rearrangements were necessary before th=
e
> simplification.
>
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

>  arch/arm/mach-u300/Kconfig     |  1 -
>  arch/arm/mach-ux500/Kconfig    | 29 ++++++++++++-----------------

I am worried that the ux500 stuff may conflict with other stuff destine=
d
for the ARM SoC tree, so if you coordinate with the ARM SoC folks:
Acked-by: Linus Walleij <linus.walleij@linaro.org> for these two.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-omap" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
