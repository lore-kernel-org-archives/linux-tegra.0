From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/5] pinctrl: sunxi: Use of_clk_get_parent_count()
 instead of open coding
Date: Thu, 26 Apr 2018 13:57:58 +0200
Message-ID: <CACRpkdYdkb0WRLr55dT1ZbgjCy6d+xj0tbhf6OnXMuM5ktJ9xQ@mail.gmail.com>
References: <1524063005-1716-1-git-send-email-geert+renesas@glider.be> <1524063005-1716-6-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524063005-1716-6-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk <linux-clk@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-tegra@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 18, 2018 at 4:50 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> A new open coder has crept in since 470b73a38470e8ba ("pinctrl: sunxi:
> Use of_clk_get_parent_count() instead of open coding"), replace it.
>
> of_clk_get_parent_count() was moved to <linux/of_clk.h>, so include that
> instead of <linux/clk-provider.h>.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
> This depends on "[PATCH v3 1/5] clk: Extract OF clock helpers in
> <linux/of_clk.h>".
>
> v3:
>   - Add Acked-by,

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please merge this through the clk tree.

Yours,
Linus Walleij
