From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] Warning that occured while compiling the nvec in
 3.19.0-rc5+ is fixed
Date: Sat, 31 Jan 2015 08:29:13 -0800
Message-ID: <20150131162913.GA23688@kroah.com>
References: <1422705282-17374-1-git-send-email-varsharamt91@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422705282-17374-1-git-send-email-varsharamt91-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: varsharamt <varsharamt91-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org, marvin24-Mmb7MZpHnFY@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Jan 31, 2015 at 05:24:42PM +0530, varsharamt wrote:
> The task was to fix  a warning which was shown while compiling a driver
> called NVEC. I wrote a brief description about how to enable support for
> a nVidya complaint embedded controller.

This makes no sense, what "task"?

> Signed-off-by:Varsha Ram T<varsharamt91-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Please use proper spaces.

Also, this doesn't match your From: line.  And, is this the name you use
to sign legal documents?


> ---
>  drivers/staging/nvec/Kconfig | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/nvec/Kconfig b/drivers/staging/nvec/Kconfig
> index 9475e20..a65ad4c 100644
> --- a/drivers/staging/nvec/Kconfig
> +++ b/drivers/staging/nvec/Kconfig
> @@ -3,33 +3,33 @@ config MFD_NVEC
>  	depends on I2C && GPIOLIB && ARCH_TEGRA
>  	select MFD_CORE
>  	help
> -	    Say Y here to enable support for a nVidia compliant embedded
> -	    controller.
> +	Say Y to enable support for a nVidia complaint embedded controller.
> +	nVidia complaint embedded controller is used to communicate with EC.
> +	This is done through I2C bus.
> +	The request to the EC can be initiated by triggering a gpio line.
> +	The gpio line is a generic pin on integrated circuit whose input or output pin can be controlled by the user at run time.


There's no way this is correct, look at how long your line is.

>  
>  config KEYBOARD_NVEC
>  	tristate "Keyboard on nVidia compliant EC"
>  	depends on MFD_NVEC && INPUT
>  	help
> -	  Say Y here to enable support for a keyboard connected to
> -	  a nVidia compliant embedded controller.
> +	Say Y here to enable support for a keyboard connected to a nVidia compliant embedded controller.

Why did you change these lines and the rest of the lines in this patch?

thanks,

greg k-h
