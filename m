From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH 06/13] mailbox: hi3660: convert to
 devm_platform_ioremap_resource
Date: Mon, 30 Dec 2019 09:04:55 +0800
Message-ID: <20191230010455.GC4552@leoy-ThinkPad-X240s>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-6-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191228183538.26189-6-tiny.windzz@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com, linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com, jassisinghbrar@gmail.com, jonathanh@nvidia.com, agross@kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-msm@vger.kernel.org, alexandre.torgue@st.com, rjui@broadcom.com, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, lftan@altera.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, nios2-dev@lists.rocketboards.org, nsaenzjulienne@suse.de
List-Id: linux-tegra@vger.kernel.org

On Sat, Dec 28, 2019 at 06:35:31PM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Reviewed-by: Leo Yan <leo.yan@linaro.org>

> ---
>  drivers/mailbox/hi3660-mailbox.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
> index 53f4bc2488c5..97e2c4ed807d 100644
> --- a/drivers/mailbox/hi3660-mailbox.c
> +++ b/drivers/mailbox/hi3660-mailbox.c
> @@ -240,7 +240,6 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct hi3660_mbox *mbox;
>  	struct mbox_chan *chan;
> -	struct resource *res;
>  	unsigned long ch;
>  	int err;
>  
> @@ -248,8 +247,7 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
>  	if (!mbox)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	mbox->base = devm_ioremap_resource(dev, res);
> +	mbox->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mbox->base))
>  		return PTR_ERR(mbox->base);
>  
> -- 
> 2.17.1
> 
