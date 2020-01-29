From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3] serial: 8250_tegra: Create Tegra specific 8250 driver
Date: Wed, 29 Jan 2020 22:04:01 +0300
Message-ID: <45ac5b66-e09a-e328-6ebf-3fbbe97b7873@gmail.com>
References: <20200129132817.26343-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <20200129132817.26343-1-jonathanh@nvidia.com>
Content-Language: en-US
Sender: linux-serial-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jeff Brasen <jbrasen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

29.01.2020 16:28, Jon Hunter пишет:
...
> +#ifdef CONFIG_PM_SLEEP
> +static int tegra_uart_suspend(struct device *dev)
> +{

Nit: the ifdef'ing in the code could be avoided by using the
__maybe_unused attribute.
