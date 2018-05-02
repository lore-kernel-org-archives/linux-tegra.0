From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/4] pinctrl: tegra20: Provide CDEV1/2 clock muxes
Date: Wed, 2 May 2018 14:32:23 +0200
Message-ID: <CACRpkdYP88CnsqakjcgBfHgjsR2i4jKvY_--Tw+hgZ_EuA+e6Q@mail.gmail.com>
References: <20180426235818.10018-1-digetx@gmail.com> <20180426235818.10018-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426235818.10018-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Marcel Ziswiler <marcel@ziswiler.com>, Marc Dietrich <marvin24@gmx.de>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 27, 2018 at 1:58 AM, Dmitry Osipenko <digetx@gmail.com> wrote:

> Muxing of pins MCLK1/2 determine the muxing of the corresponding clocks.
> Make pinctrl driver to provide clock muxes for the CDEV1/2 pingroups, so
> that main clk-controller driver could get an actual parent clock for the
> CDEV1/2 clocks.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

If this can be applied separately from the other patches, then please
send it separately after fixing Peter's review nits and adding his
review-tag, thanks!

Yours,
Linus Walleij
