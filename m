From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/2] ARM: tegra: readd gpio-ranges properties
Date: Wed, 01 Aug 2018 23:51:29 +0300
Message-ID: <2326493.bQHeyqsldt@dimapc>
References: <20180726154025.13173-1-stefan@agner.ch> <20180726154025.13173-2-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726154025.13173-2-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, thierry.reding@gmail.com, jonathanh@nvidia.com, linus.walleij@linaro.org, pdeschrijver@nvidia.co, marcel.ziswiler@toradex.com
Cc: keescook@chromium.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thursday, 26 July 2018 18:40:25 MSK Stefan Agner wrote:
> The properties have been commented out to prevent a regression a
> while ago. The first regression should be resolved by
> commit 44af7927316e ("spi: Map SPI OF client IRQ at probe time").
> 
> The second regression is probably addressed by
> commit 494fd7b7ad10 ("PM / core: fix deferred probe breaking suspend resume
> order") and/or maybe others. Readd the gpio-ranges properties to see
> whether regressions still get reported.
> 
> This reverts commit 4f1d841475e1f6e9e32496dda11215db56f4ea73
> ("ARM: tegra: Comment out gpio-ranges properties").
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---

Unfortunately the second regression hasn't been addressed yet, this patch 
still breaks wake-up using GPIO key. BTW, better to spell "readd" as "re-add".
