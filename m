From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH] staging: nvec: Fix usleep_range is preferred over udelay
Date: Wed, 29 Nov 2017 18:07:53 +0200
Message-ID: <78551ca3-9ebe-3010-f856-46026f9ce9a3@kapsi.fi>
References: <20171129160002.GA26462@josharch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171129160002.GA26462@josharch>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Abraham <j.abraham1776-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, marvin24-Mmb7MZpHnFY@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/29/2017 06:00 PM, Joshua Abraham wrote:
> Signed-off-by: Joshua Abraham <j.abraham1776-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This patch fixes the issue:
> 
> CHECK: usleep_range is preferred over udelay; see
> Documentation/timers/timers-howto.txt
> 
> ---
>   drivers/staging/nvec/nvec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 4ff8f47385da..2a01ef4b54ff 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -631,7 +631,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>   		break;
>   	case 2:		/* first byte after command */
>   		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -			udelay(33);
> +			usleep_range(30, 35);
>   			if (nvec->rx->data[0] != 0x01) {
>   				dev_err(nvec->dev,
>   					"Read without prior read command\n");
> 

This is incorrect, as this function is an interrupt handler and we 
cannot sleep in interrupt context.

Cheers,
Mikko
