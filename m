From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 05/14] staging: media: tegra-vde: Properly mark invalid
 entries
Date: Sat, 18 Aug 2018 15:45:20 +0300
Message-ID: <1655447.DEioCXKPSa@dimapc>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
 <20180813145027.16346-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180813145027.16346-6-thierry.reding@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday, 13 August 2018 17:50:18 MSK Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Entries in the reference picture list are marked as invalid by setting
> the frame ID to 0x3f.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/staging/media/tegra-vde/tegra-vde.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c
> b/drivers/staging/media/tegra-vde/tegra-vde.c index
> 275884e745df..0ce30c7ccb75 100644
> --- a/drivers/staging/media/tegra-vde/tegra-vde.c
> +++ b/drivers/staging/media/tegra-vde/tegra-vde.c
> @@ -296,7 +296,7 @@ static void tegra_vde_setup_iram_tables(struct tegra_vde
> *vde, (frame->flags & FLAG_B_FRAME));
>  		} else {
>  			aux_addr = 0x6ADEAD00;
> -			value = 0;
> +			value = 0x3f;
>  		}
> 
>  		tegra_vde_setup_iram_entry(vde, num_ref_pics, 0, i, value,

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
