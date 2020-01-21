From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] serial: 8250_tegra: Create Tegra specific 8250 driver
Date: Tue, 21 Jan 2020 19:31:35 +0300
Message-ID: <f02faa4c-5838-15d2-1b76-75c17fcc0d9d@gmail.com>
References: <20200120160149.29072-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200120160149.29072-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Brasen <jbrasen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello Jon,

20.01.2020 19:01, Jon Hunter пишет:

[snip]

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	port->membase = devm_ioremap(&pdev->dev, res->start,
> +				     resource_size(res));

devm_platform_ioremap_resource()

> +	if (!port->membase)
> +		return -ENOMEM;
> +
> +	port->mapbase = res->start;
> +	port->mapsize = resource_size(res);
> +
> +	uart->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);

Why reset is shared? It shall not be shared at least on T20/30/124/210..

[snip]
