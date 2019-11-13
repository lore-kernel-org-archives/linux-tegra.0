From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] clk: tegra: clk-dfll: Fix to remove
 pm_runtime_irq_safe
Date: Wed, 13 Nov 2019 19:22:39 +0300
Message-ID: <353b9aef-3bcc-65d2-a942-91d6710b89ca@gmail.com>
References: <1573575426-31314-1-git-send-email-skomatineni@nvidia.com>
 <1573575426-31314-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1573575426-31314-2-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, sboyd@kernel.org, mturquette@baylibre.com, pgaikwad@nvidia.com
Cc: pdeschrijver@nvidia.com, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.11.2019 19:17, Sowjanya Komatineni пишет:
> pm_runtime_irq_safe is not needed as interrupts are allowed during
> suspend and resume. This was added mistakenly during dfll suspend
> and resume support patch.
> 
> This patch includes fix to remove pm_runtime_irq_safe.
> 
> Also updated description of dfll_suspend argument.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index c051d92c2bbf..cfbaa90c7adb 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -1487,7 +1487,6 @@ static int dfll_init(struct tegra_dfll *td)
>  	td->last_unrounded_rate = 0;
>  
>  	pm_runtime_enable(td->dev);
> -	pm_runtime_irq_safe(td->dev);
>  	pm_runtime_get_sync(td->dev);
>  
>  	dfll_set_mode(td, DFLL_DISABLED);
> @@ -1516,7 +1515,7 @@ static int dfll_init(struct tegra_dfll *td)
>  
>  /**
>   * tegra_dfll_suspend - check DFLL is disabled
> - * @dev: DFLL device *
> + * @dev: DFLL instance
>   *
>   * DFLL clock should be disabled by the CPUFreq driver. So, make
>   * sure it is disabled and disable all clocks needed by the DFLL.
> 

Hello Sowjanya,

It should be better to have the commit's title saying something more
generic like "Clean up code" or to have two separate patches because
this patch does two things that are unrelated to each other in
accordance to the title and this is a bit confusing at first glance.
Although, that's not a big deal for a trivial patch like this and it
should be fine as is (IMO). Please take into account in the future
patches that both commit's title and description should be accurate.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
