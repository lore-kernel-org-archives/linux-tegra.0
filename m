From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 3/5] soc: rockchip: power-domain: Use
 of_clk_get_parent_count() instead of open coding
Date: Wed, 02 May 2018 08:38:46 -0700
Message-ID: <152527552692.138124.9472680209483820124@swboyd.mtv.corp.google.com>
References: <1524063005-1716-1-git-send-email-geert+renesas@glider.be>
 <1524063005-1716-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524063005-1716-4-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-tegra@vger.kernel.org

Quoting Geert Uytterhoeven (2018-04-18 07:50:03)
> As of_clk_get_parent_count() returns zero on failure, while
> of_count_phandle_with_args() might return a negative error code, this
> also fixes the issue of possibly using a negative number in the
> allocation below.
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---

Applied to clk-next
