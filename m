From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH for 5.6 v2] tty: serial: tegra: Handle RX transfer in PIO
 mode if DMA wasn't started
Date: Wed, 19 Feb 2020 15:25:47 +0300
Message-ID: <4d9a2352-6daa-4dcc-376b-175b1398ff6a@gmail.com>
References: <20200209164415.9632-1-digetx@gmail.com>
 <15b01f79-007d-09bb-03be-050c009ceff6@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <15b01f79-007d-09bb-03be-050c009ceff6-AlSwsSmVLrQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

17.02.2020 10:37, Jiri Slaby пишет:
> On 09. 02. 20, 17:44, Dmitry Osipenko wrote:
>> It is possible to get an instant RX timeout or end-of-transfer interrupt
>> before RX DMA was started, if transaction is less than 16 bytes. Transfer
>> should be handled in PIO mode in this case because DMA can't handle it.
>> This patch brings back the original behaviour of the driver that was
>> changed by accident by a previous commit, it fixes occasional Bluetooth HW
>> initialization failures which I started to notice recently.
>>
>> Fixes: d5e3fadb7012 ("tty: serial: tegra: Activate RX DMA transfer by request")
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>
>> Changelog:
>>
>> v2: - Corrected commit's title by adding the accidentally missed "tegra: "
>>       to the prefix.
>>
>>  drivers/tty/serial/serial-tegra.c | 35 ++++++++++++++-----------------
>>  1 file changed, 16 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
>> index 33034b852a51..8de8bac9c6c7 100644
>> --- a/drivers/tty/serial/serial-tegra.c
>> +++ b/drivers/tty/serial/serial-tegra.c
>> @@ -692,11 +692,22 @@ static void tegra_uart_copy_rx_to_tty(struct tegra_uart_port *tup,
>>  				   count, DMA_TO_DEVICE);
>>  }
>>  
>> +static void do_handle_rx_pio(struct tegra_uart_port *tup)
>> +{
>> +	struct tty_struct *tty = tty_port_tty_get(&tup->uport.state->port);
>> +	struct tty_port *port = &tup->uport.state->port;
>> +
>> +	tegra_uart_handle_rx_pio(tup, port);
>> +	if (tty) {
> 
> What's the tty good for here, actually?
> 
>> +		tty_flip_buffer_push(port);
>> +		tty_kref_put(tty);
>> +	}
>> +}

I'm not really a TTY expert..

Jon, maybe you have any clue whether TTY could disappear while port is
opened?
