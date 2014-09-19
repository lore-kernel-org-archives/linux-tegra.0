From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH] clk: tegra: Make clock initialization more robust
Date: Fri, 19 Sep 2014 14:45:25 +0300
Message-ID: <20140919114525.GP26779@tbergstrom-lnx.Nvidia.com>
References: <1410946457-24669-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1410946457-24669-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Mike Turquette <mturquette@linaro.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 17, 2014 at 11:34:17AM +0200, Tomeu Vizoso wrote:
> Don't abort clock initialization if we cannot match an entry in
> tegra_clk_init_table to a valid entry in the clk array.
> 
> Also log a corresponding error message.
> 
> This was discovered when testing a patch that removed the EMC clock from
> tegra124_clks but left a mention in tegra_clk_init_table.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  drivers/clk/tegra/clk.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Looks fine to me. Merged into tegra-clk-next.
