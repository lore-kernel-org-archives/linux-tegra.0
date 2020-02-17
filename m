From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH for 5.6 v2] tty: serial: tegra: Handle RX transfer in PIO
 mode if DMA wasn't started
Date: Mon, 17 Feb 2020 08:37:06 +0100
Message-ID: <15b01f79-007d-09bb-03be-050c009ceff6@suse.cz>
References: <20200209164415.9632-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <20200209164415.9632-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-serial-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 09. 02. 20, 17:44, Dmitry Osipenko wrote:
> It is possible to get an instant RX timeout or end-of-transfer interrupt
> before RX DMA was started, if transaction is less than 16 bytes. Transfer
> should be handled in PIO mode in this case because DMA can't handle it.
> This patch brings back the original behaviour of the driver that was
> changed by accident by a previous commit, it fixes occasional Bluetooth HW
> initialization failures which I started to notice recently.
> 
> Fixes: d5e3fadb7012 ("tty: serial: tegra: Activate RX DMA transfer by request")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Changelog:
> 
> v2: - Corrected commit's title by adding the accidentally missed "tegra: "
>       to the prefix.
> 
>  drivers/tty/serial/serial-tegra.c | 35 ++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
> index 33034b852a51..8de8bac9c6c7 100644
> --- a/drivers/tty/serial/serial-tegra.c
> +++ b/drivers/tty/serial/serial-tegra.c
> @@ -692,11 +692,22 @@ static void tegra_uart_copy_rx_to_tty(struct tegra_uart_port *tup,
>  				   count, DMA_TO_DEVICE);
>  }
>  
> +static void do_handle_rx_pio(struct tegra_uart_port *tup)
> +{
> +	struct tty_struct *tty = tty_port_tty_get(&tup->uport.state->port);
> +	struct tty_port *port = &tup->uport.state->port;
> +
> +	tegra_uart_handle_rx_pio(tup, port);
> +	if (tty) {

What's the tty good for here, actually?

> +		tty_flip_buffer_push(port);
> +		tty_kref_put(tty);
> +	}
> +}


thanks,
-- 
js
suse labs
