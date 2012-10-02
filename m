From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] staging: nvec: remove include of <mach/iomap.h>
Date: Wed, 03 Oct 2012 00:24:04 +0200
Message-ID: <1842898.gJHmxMDp3W@ax5200p>
References: <1349216336-986-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1349216336-986-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 02 October 2012 16:18:56 Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Nothing from this file is used, and the file will hopefully be deleted
> soon.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Right.

Acked-By: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

> ---
> Greg, if this patch can get into 3.7 (it's late, I know) then that
> would be great. If not, may I please request an ack so I can take the
> change through the Tegra tree in 3.8, since I will probably have cleanup
> patches that depend on this change. Thanks.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/staging/nvec/nvec.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 094fdc3..97cdf08 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -39,7 +39,6 @@
>  #include <linux/workqueue.h>
> 
>  #include <mach/clk.h>
> -#include <mach/iomap.h>
> 
>  #include "nvec.h"
