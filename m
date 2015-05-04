From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 2/9] mailbox: Make mbox_chan_ops const
Date: Mon, 4 May 2015 14:22:41 -0500
Message-ID: <5547C701.8010305@ti.com>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org> <1430761002-9327-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430761002-9327-3-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/04/2015 12:36 PM, Andrew Bresticker wrote:
> The mailbox controller's channel ops ought to be read-only.  Update
> all the mailbox drivers to make their mbox_chan_ops const as well.
> 
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> Cc: Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Thanks, the new patch looks good.

Acked-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>

> ---
> Changes from v7:
>  - Constify all drivers' mbox_chan_ops.
> No changes from v5/v6.
> New for v5.
> ---
>  drivers/mailbox/arm_mhu.c          | 2 +-
>  drivers/mailbox/mailbox-altera.c   | 2 +-
>  drivers/mailbox/omap-mailbox.c     | 2 +-
>  drivers/mailbox/pcc.c              | 2 +-
>  include/linux/mailbox_controller.h | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
> index ac693c6..d9e99f9 100644
> --- a/drivers/mailbox/arm_mhu.c
> +++ b/drivers/mailbox/arm_mhu.c
> @@ -110,7 +110,7 @@ static void mhu_shutdown(struct mbox_chan *chan)
>  	free_irq(mlink->irq, chan);
>  }
>  
> -static struct mbox_chan_ops mhu_ops = {
> +static const struct mbox_chan_ops mhu_ops = {
>  	.send_data = mhu_send_data,
>  	.startup = mhu_startup,
>  	.shutdown = mhu_shutdown,
> diff --git a/drivers/mailbox/mailbox-altera.c b/drivers/mailbox/mailbox-altera.c
> index a266265..bb682c9 100644
> --- a/drivers/mailbox/mailbox-altera.c
> +++ b/drivers/mailbox/mailbox-altera.c
> @@ -285,7 +285,7 @@ static void altera_mbox_shutdown(struct mbox_chan *chan)
>  	}
>  }
>  
> -static struct mbox_chan_ops altera_mbox_ops = {
> +static const struct mbox_chan_ops altera_mbox_ops = {
>  	.send_data = altera_mbox_send_data,
>  	.startup = altera_mbox_startup,
>  	.shutdown = altera_mbox_shutdown,
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
> index 0f332c1..03f8545 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -604,7 +604,7 @@ static int omap_mbox_chan_send_data(struct mbox_chan *chan, void *data)
>  	return ret;
>  }
>  
> -static struct mbox_chan_ops omap_mbox_chan_ops = {
> +static const struct mbox_chan_ops omap_mbox_chan_ops = {
>  	.startup        = omap_mbox_chan_startup,
>  	.send_data      = omap_mbox_chan_send_data,
>  	.shutdown       = omap_mbox_chan_shutdown,
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 7e91d68..26d121d 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -198,7 +198,7 @@ static int pcc_send_data(struct mbox_chan *chan, void *data)
>  	return 0;
>  }
>  
> -static struct mbox_chan_ops pcc_chan_ops = {
> +static const struct mbox_chan_ops pcc_chan_ops = {
>  	.send_data = pcc_send_data,
>  };
>  
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
> index d4cf96f..68c4245 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -72,7 +72,7 @@ struct mbox_chan_ops {
>   */
>  struct mbox_controller {
>  	struct device *dev;
> -	struct mbox_chan_ops *ops;
> +	const struct mbox_chan_ops *ops;
>  	struct mbox_chan *chans;
>  	int num_chans;
>  	bool txdone_irq;
> 
