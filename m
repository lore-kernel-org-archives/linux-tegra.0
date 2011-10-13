From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] spi/tegra: fix compilation error in spi-tegra.c
Date: Thu, 13 Oct 2011 13:27:55 -0600
Message-ID: <20111013192755.GZ18574@ponder.secretlab.ca>
References: <1458857.A6MEb356Lm@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458857.A6MEb356Lm@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 13, 2011 at 11:01:33AM +0200, Marc Dietrich wrote:
> Add #include <linux/module.h> to spi-tegra.c to fix a compilation error
> after the removal of module.h from device.h (in patch: "include: replace 
> linux/module.h with "struct module" wherever possible").
> 
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Applied, thanks

g.

> ---
> 
> Hi Grant,
> 
> this fixes the error below:
> 
>   CC      drivers/spi/spi-tegra.o
> drivers/spi/spi-tegra.c:597: error: expected declaration specifiers or '...' before 
> string constant
> drivers/spi/spi-tegra.c:597: warning: data definition has no type or storage class
> drivers/spi/spi-tegra.c:597: warning: type defaults to 'int' in declaration of 
> 'MODULE_ALIAS'
> drivers/spi/spi-tegra.c:597: warning: function declaration isn't a prototype
> drivers/spi/spi-tegra.c:604: warning: data definition has no type or storage class
> drivers/spi/spi-tegra.c:604: warning: type defaults to 'int' in declaration of 
> 'MODULE_DEVICE_TABLE'
> drivers/spi/spi-tegra.c:604: warning: parameter names (without types) in function 
> declaration
> drivers/spi/spi-tegra.c:612: error: 'THIS_MODULE' undeclared here (not in a function)
> drivers/spi/spi-tegra.c:630: error: expected declaration specifiers or '...' before 
> string constant
> drivers/spi/spi-tegra.c:630: warning: data definition has no type or storage class
> drivers/spi/spi-tegra.c:630: warning: type defaults to 'int' in declaration of 
> 'MODULE_LICENSE'
> drivers/spi/spi-tegra.c:630: warning: function declaration isn't a prototype
> make[2]: *** [drivers/spi/spi-tegra.o] Error 1
> 
> It is against linux-next (for 3.2). Please apply.
> 
> Thanks
> 			Marc
> 
> diff --git a/drivers/spi/spi-tegra.c b/drivers/spi/spi-tegra.c
> index a5a6302..e8cd58f 100644
> --- a/drivers/spi/spi-tegra.c
> +++ b/drivers/spi/spi-tegra.c
> @@ -18,6 +18,7 @@
>   */
>  
>  #include <linux/kernel.h>
> +#include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
