From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 5/5] clk: tegra: divider: Mark Memory Controller clock
 as read-only
Date: Fri, 12 Apr 2019 16:54:01 +0300
Message-ID: <d297dc99-696d-f38a-af3f-d3f082e95d32@gmail.com>
References: <20190411220230.21726-1-digetx@gmail.com>
 <20190411220230.21726-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411220230.21726-6-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.04.2019 1:02, Dmitry Osipenko пишет:
> The Memory Controller clock rate can't be simply changed and nothing in
> kernel need to change the rate, hence let's make the clock read-only.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-divider.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
> index 205fe8ff63f0..f891bbb0d06d 100644
> --- a/drivers/clk/tegra/clk-divider.c
> +++ b/drivers/clk/tegra/clk-divider.c
> @@ -175,6 +175,7 @@ struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
>  				  void __iomem *reg, spinlock_t *lock)
>  {
>  	return clk_register_divider_table(NULL, name, parent_name,
> -					  CLK_IS_CRITICAL, reg, 16, 1, 0,
> -					  mc_div_table, lock);
> +					  CLK_IS_CRITICAL |
> +					  CLK_DIVIDER_READ_ONLY,
> +					  reg, 16, 1, 0, mc_div_table, lock);
>  }
> 

Turned out there is a bug here, the read-only flag is the divider's flag and hence it shall be:

 {
 	return clk_register_divider_table(NULL, name, parent_name,
-					  CLK_IS_CRITICAL |
-					  CLK_DIVIDER_READ_ONLY,
-					  reg, 16, 1, 0, mc_div_table, lock);
+					  CLK_IS_CRITICAL,
+					  reg, 16, 1, CLK_DIVIDER_READ_ONLY,
+					  mc_div_table, lock);
 }

I'll fix it up in v2.
