From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH 2/3] clk: tegra210: Fix sparse warnings for functions not
 declared as static
Date: Mon, 7 Dec 2015 10:51:31 -0500
Message-ID: <5665AB03.3000304@nvidia.com>
References: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
 <1449248665-22343-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1449248665-22343-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 12/4/2015 12:04 PM, Jon Hunter wrote:
> Sparse reports the following warnings for functions in clk-tegra210.c
> that should be declared as static:
> 
> drivers/clk/tegra/clk-tegra210.c:460:6: warning: symbol
>  'tegra210_pllcx_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:485:6: warning: symbol
>  '_pllc_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:490:6: warning: symbol
>  '_pllc2_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:495:6: warning: symbol
>  '_pllc3_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:500:6: warning: symbol
>  '_plla1_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:510:6: warning: symbol
>  'tegra210_plla_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:562:6: warning: symbol
>  'tegra210_plld_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:701:6: warning: symbol
>  'tegra210_plld2_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:709:6: warning: symbol
>  'tegra210_plldp_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:722:6: warning: symbol
>  'tegra210_pllc4_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:731:6: warning: symbol
>  'tegra210_pllre_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:844:6: warning: symbol
>  'tegra210_pllx_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:904:6: warning: symbol
>  'tegra210_pllmb_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:963:6: warning: symbol
>  'tegra210_pllp_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:1025:6: warning: symbol
>  'tegra210_pllu_set_defaults' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra210.c:1215:15: warning: symbol
>  'tegra210_clk_adjust_vco_min' was not declared. Should it be static?
> 
> Fix this by declaring the above as static.
> 
> Fixes: b31eba5ff3f7 ("clk: tegra: Add support for Tegra210 clocks")
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
...

Acked-by: Rhyland Klein <rklein@nvidia.com>

-- 
nvpublic
