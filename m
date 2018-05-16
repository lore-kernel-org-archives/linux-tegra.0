From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: tegra20: Provide CDEV1/2 clock muxes
Date: Wed, 16 May 2018 14:23:23 +0200
Message-ID: <CACRpkdbykxwHvQgfFnihOHy1hsM7ZWHtCYGCNb49MbNkKWz6Hg@mail.gmail.com>
References: <20180503225537.20748-1-digetx@gmail.com> <20180503225537.20748-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180503225537.20748-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Marcel Ziswiler <marcel@ziswiler.com>, Marc Dietrich <marvin24@gmx.de>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 4, 2018 at 12:55 AM, Dmitry Osipenko <digetx@gmail.com> wrote:

> Muxing of pins MCLK1/2 determine the muxing of the corresponding clocks.
> Make pinctrl driver to provide clock muxes for the CDEV1/2 pingroups, so
> that main clk-controller driver could get an actual parent clock for the
> CDEV1/2 clocks.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Marcel Ziswiler <marcel@ziswiler.com>
> Tested-by: Marcel Ziswiler <marcel@ziswiler.com>
> Tested-by: Marc Dietrich <marvin24@gmx.de>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>
> v2: This patch is factored out from the v1 clk/DT series so that it could be
>     applied separately.

Patch applied unless Stephen W protests.
Please include swarren on future patches to this driver.

Yours,
Linus Walleij
