From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH 3/3] clk: tegra-super: Fix sparse warnings for functions
 not declared as static
Date: Mon, 7 Dec 2015 10:51:49 -0500
Message-ID: <5665AB15.80602@nvidia.com>
References: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
 <1449248665-22343-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449248665-22343-3-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 12/4/2015 12:04 PM, Jon Hunter wrote:
> Sparse reports the following warnings for structures and functions that
> should be declared static:
> 
> drivers/clk/tegra/clk-tegra-super-gen4.c:70:35: warning: symbol
>  'tegra_super_gen_info_gen4' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra-super-gen4.c:96:35: warning: symbol
>  'tegra_super_gen_info_gen5' was not declared. Should it be static?
> drivers/clk/tegra/clk-tegra-super-gen4.c:174:13: warning: symbol
>  'tegra_super_clk_init' was not declared. Should it be static?
> 
> Fix this by making the above static.
> 
> Fixes: 88467d220119 ("clk: tegra: Add Super Gen5 Logic")
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-super-gen4.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
...

Acked-by: Rhyland Klein <rklein@nvidia.com>

-- 
nvpublic
