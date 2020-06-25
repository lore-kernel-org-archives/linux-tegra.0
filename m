From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] staging: nvec: changed coding style, line should not end
 with a (
Date: Thu, 25 Jun 2020 16:26:41 +0200
Message-ID: <20200625142641.GA3836036@kroah.com>
References: <20200625135051.msl37vuz5fbgiuz4@pesu-pes-edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200625135051.msl37vuz5fbgiuz4@pesu-pes-edu>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: B K Karthik <bkkarthik-c/eoPpTPil72fBVCVOL8/A@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 25, 2020 at 09:50:51AM -0400, B K Karthik wrote:
> Signed-off-by: B K Karthik <karthik.bk2000-EMRzualFZlQ@public.gmane.org>
> ---
>  drivers/staging/nvec/nvec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 360ec0407740..16afbe1dfdeb 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -382,8 +382,8 @@ static void nvec_request_master(struct work_struct *work)
>  		msg = list_first_entry(&nvec->tx_data, struct nvec_msg, node);
>  		spin_unlock_irqrestore(&nvec->tx_lock, flags);
>  		nvec_gpio_set_value(nvec, 0);
> -		err = wait_for_completion_interruptible_timeout(
> -				&nvec->ec_transfer, msecs_to_jiffies(5000));
> +		err = wait_for_completion_interruptible_timeout(&nvec->ec_transfer,
> +						msecs_to_jiffies(5000));
>  
>  		if (err == 0) {
>  			dev_warn(nvec->dev, "timeout waiting for ec transfer\n");
> -- 
> 2.20.1
> 


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
