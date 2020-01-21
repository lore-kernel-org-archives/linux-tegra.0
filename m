From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] serial: 8250_tegra: Create Tegra specific 8250 driver
Date: Tue, 21 Jan 2020 16:41:02 +0100
Message-ID: <20200121154102.GA588392@kroah.com>
References: <20200120160149.29072-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200120160149.29072-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Brasen <jbrasen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 20, 2020 at 04:01:49PM +0000, Jon Hunter wrote:
> diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
> index f16824bbb573..432b47647677 100644
> --- a/drivers/tty/serial/8250/Kconfig
> +++ b/drivers/tty/serial/8250/Kconfig
> @@ -500,6 +500,15 @@ config SERIAL_8250_PXA
>  	  applicable to both devicetree and legacy boards, and early console is
>  	  part of its support.
>  
> +config SERIAL_8250_TEGRA
> +	tristate "8250 support for Tegra serial ports"
> +	default SERIAL_8250
> +	depends on SERIAL_8250
> +	depends on ARCH_TEGRA

No COMPILE_TEST support so we can make sure we don't break the thing
somehow?

thanks,

greg k-h
