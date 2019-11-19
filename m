From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 10/17] clk: tegra: Remove tegra_pmc_clk_init along with
 clk ids
Date: Tue, 19 Nov 2019 22:33:16 +0300
Message-ID: <c61ad48b-1975-e6b6-2618-b52c7fe3d4c4@gmail.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
 <1574146234-3871-11-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1574146234-3871-11-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.11.2019 09:50, Sowjanya Komatineni пишет:
> Current Tegra clock driver registers PMC clocks clk_out_1, clk_out_2,
> clk_out_3 and blink output in tegra_pmc_init() which does direct Tegra
> PMC access during clk_ops and these PMC register read and write access
> will not happen when PMC is in secure mode.
> 
> Any direct PMC register access from non-secure world will not go
> through and all the PMC clocks and blink control are done in Tegra PMC
> driver with PMC as clock provider.
> 
> This patch removes tegra_pmc_clk_init along with corresponding clk ids
> from Tegra clock driver.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/Makefile       |  1 -
>  drivers/clk/tegra/clk-id.h       |  7 -------
>  drivers/clk/tegra/clk-tegra114.c | 33 ------------------------------
>  drivers/clk/tegra/clk-tegra124.c | 44 +++++-----------------------------------
>  drivers/clk/tegra/clk-tegra20.c  | 24 ----------------------
>  drivers/clk/tegra/clk-tegra210.c | 32 -----------------------------
>  drivers/clk/tegra/clk-tegra30.c  | 32 -----------------------------
>  drivers/clk/tegra/clk.h          |  1 -
>  8 files changed, 5 insertions(+), 169 deletions(-)
> 
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index df966ca06788..1f7c30f87ece 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -12,7 +12,6 @@ obj-y					+= clk-sdmmc-mux.o
>  obj-y					+= clk-super.o
>  obj-y					+= clk-tegra-audio.o
>  obj-y					+= clk-tegra-periph.o
> -obj-y					+= clk-tegra-pmc.o
>  obj-y					+= clk-tegra-fixed.o
>  obj-y					+= clk-tegra-super-gen4.o
>  obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o

Why clk-tegra-pmc.c itself isn't removed?

[snip]
