From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 3/4] clk: tegra20: Set correct parents for CDEV1/2 clocks
Date: Tue, 01 May 2018 14:31:16 -0700
Message-ID: <152521027630.138124.3736014507579667653@swboyd.mtv.corp.google.com>
References: <20180426235818.10018-1-digetx@gmail.com>
 <20180426235818.10018-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426235818.10018-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Marc Dietrich <marvin24@gmx.de>, Marcel Ziswiler <marcel@ziswiler.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2018-04-26 16:58:17)
> Parents of CDEV1/2 clocks are determined by muxing of the corresponding
> pins. Pinctrl driver now provides the CDEV1/2 clock muxes and hence
> CDEV1/2 clocks could have correct parents. Set CDEV1/2 parents to the
> corresponding muxes to fix the parents.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
