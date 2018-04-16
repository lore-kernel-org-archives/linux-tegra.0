From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/5] clk: Extract OF clock helpers in <linux/of_clk.h>
Date: Mon, 16 Apr 2018 09:05:02 -0700
Message-ID: <152389470206.51482.14969985575347056688@swboyd.mtv.corp.google.com>
References: <1523364701-15383-1-git-send-email-geert+renesas@glider.be>
 <1523364701-15383-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523364701-15383-2-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-tegra@vger.kernel.org

Quoting Geert Uytterhoeven (2018-04-10 05:51:37)
> The use of of_clk_get_parent_{count,name}() and of_clk_init() is not
> limited to clock providers.
> 
> Hence move these helpers into their own header file, so callers that are
> not clock providers no longer have to include <linux/clk-provider.h>.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> 
> I have't added an SPDX-License-Identifier line, as
> <linux/clk-provider.h> also doesn't have one yet.
> 
> Other candidates to be moved here later?
>   - of_clk_get(),
>   - of_clk_get_by_name(),
>   - of_clk_get_from_provider().

The clk_get APIs should stay in the consumer header file (clk.h) because
they're consumer APIs. Sure they have "of" in the name, but whatever.
