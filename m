From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: media: tegra-vde: Remove variable
Date: Thu, 30 May 2019 13:46:38 -0700
Message-ID: <20190530204638.GA4784@kroah.com>
References: <20190530204439.29830-1-nishkadg.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190530204439.29830-1-nishkadg.linux@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc: digetx@gmail.com, mchehab@kernel.org, thierry.reding@gmail.com, jonathan@nvidia.com, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 31, 2019 at 02:14:39AM +0530, Nishka Dasgupta wrote:
> Remove unnecessary variable iram_tables and use its value directly.
> Issue found using Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/tegra-vde.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
> index a5020dbf6eef..3205973218e4 100644
> --- a/drivers/staging/media/tegra-vde/tegra-vde.c
> +++ b/drivers/staging/media/tegra-vde/tegra-vde.c
> @@ -273,12 +273,10 @@ static void tegra_vde_setup_iram_entry(struct tegra_vde *vde,
>  				       unsigned int row,
>  				       u32 value1, u32 value2)
>  {
> -	u32 *iram_tables = vde->iram;
> -
>  	trace_vde_setup_iram_entry(table, row, value1, value2);
>  
> -	iram_tables[0x20 * table + row * 2] = value1;
> -	iram_tables[0x20 * table + row * 2 + 1] = value2;
> +	vde->iram[0x20 * table + row * 2] = value1;
> +	vde->iram[0x20 * table + row * 2 + 1] = value2;

Ick, no, why?  why why why?

You keep sending these patches, please take a bit of time to think about
what you are doing and see if the change actually makes sense.

Again, here, no, it does not.

greg k-h
