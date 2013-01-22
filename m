From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: tegra: ensure all provided clock values are valid
 cookies
Date: Tue, 22 Jan 2013 10:29:34 -0800
Message-ID: <20130122182934.24671.1867@quantum>
References: <1358187400-6824-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1358187400-6824-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Quoting Stephen Warren (2013-01-14 10:16:40)
> From: Stephen Warren <swarren@nvidia.com>
> 
> Tegra's clock implementation uses pointers as the clock cookies, and
> hence chooses to make NULL an invalid clock cookie. However, there are
> gaps in the assigned device tree clock IDs, and hence the array mapping
> DT clock ID contains entries with NULL values (uninitialized BSS) unless
> explicit action is taken. This patch enhances the Tegra clock code to
> detect this case and explicitly initialize those lookup table entries to
> an error value. This prevents clk_get() from ever returning NULL. Hence,
> Tegra's clock APIs don't have to check the clock cookie they're passed
> for NULL.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> Mike, this also will need to go through the Tegra tree; just looking for
> any review/ack from you. Thanks.
> 

Stephen,

I think this is a bit strange.  Will you have gaps in the DT clock id's
forever or is this a temporary issue?

Also it is important than any driver using the clock api does not
dereference the struct clk pointer and assume that a NULL clk is
invalid.  I know that this series doesn't imply any such thing but I
wanted to state that anyways.

Also are you planning to roll this into the existing tegra ccf series?

Regards,
Mike

>  drivers/clk/tegra/clk-tegra20.c |    5 ++++-
>  drivers/clk/tegra/clk-tegra30.c |    5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index 5847b5e..e59ac14 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -1243,12 +1243,15 @@ void __init tegra20_clock_init(struct device_node *np)
>         tegra20_audio_clk_init();
>  
>  
> -       for (i = 0; i < ARRAY_SIZE(clks); i++)
> +       for (i = 0; i < ARRAY_SIZE(clks); i++) {
>                 if (IS_ERR(clks[i])) {
>                         pr_err("Tegra20 clk %d: register failed with %ld\n",
>                                i, PTR_ERR(clks[i]));
>                         BUG();
>                 }
> +               if (!clks[i])
> +                       clks[i] = ERR_PTR(-EINVAL);
> +       }
>  
>         tegra_init_dup_clks(tegra_clk_duplicates, clks, clk_max);
>  
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index 987312c..9c0b2ee 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -2022,12 +2022,15 @@ void __init tegra30_clock_init(struct device_node *np)
>         tegra30_audio_clk_init();
>         tegra30_pmc_clk_init();
>  
> -       for (i = 0; i < ARRAY_SIZE(clks); i++)
> +       for (i = 0; i < ARRAY_SIZE(clks); i++) {
>                 if (IS_ERR(clks[i])) {
>                         pr_err("Tegra30 clk %d: register failed with %ld\n",
>                                i, PTR_ERR(clks[i]));
>                         BUG();
>                 }
> +               if (!clks[i])
> +                       clks[i] = ERR_PTR(-EINVAL);
> +       }
>  
>         tegra_init_dup_clks(tegra_clk_duplicates, clks, clk_max);
>  
> -- 
> 1.7.10.4
