From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Subject: Re: [PATCH V2] gpu: host1x: handle the correct # of syncpt regs
Date: Mon, 7 Apr 2014 11:32:45 +0300
Message-ID: <534262AD.2020601@nvidia.com>
References: <1396650665-6992-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1396650665-6992-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On 05.04.2014 01:31, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
> index db9017adfe2b..498b37e39058 100644
> --- a/drivers/gpu/host1x/hw/intr_hw.c
> +++ b/drivers/gpu/host1x/hw/intr_hw.c
> @@ -47,7 +47,7 @@ static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
>  	unsigned long reg;
>  	int i, id;
>  
> -	for (i = 0; i <= BIT_WORD(host->info->nb_pts); i++) {
> +	for (i = 0; i < DIV_ROUND_UP(host->info->nb_pts, 32); i++) {
>  		reg = host1x_sync_readl(host,
>  			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
>  		for_each_set_bit(id, &reg, BITS_PER_LONG) {
> @@ -64,7 +64,7 @@ static void _host1x_intr_disable_all_syncpt_intrs(struct host1x *host)
>  {
>  	u32 i;
>  
> -	for (i = 0; i <= BIT_WORD(host->info->nb_pts); ++i) {
> +	for (i = 0; i < DIV_ROUND_UP(host->info->nb_pts, 32); ++i) {
>  		host1x_sync_writel(host, 0xffffffffu,
>  			HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(i));
>  		host1x_sync_writel(host, 0xffffffffu,
> 

Acked-By: Terje Bergstrom <tbergstrom@nvidia.com>

Terje
