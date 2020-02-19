From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH for 5.6 v2] tty: serial: tegra: Handle RX transfer in PIO
 mode if DMA wasn't started
Date: Wed, 19 Feb 2020 14:38:12 +0000
Message-ID: <01397ba1-a738-257a-adb1-84cdcba68a57@nvidia.com>
References: <20200209164415.9632-1-digetx@gmail.com>
 <15b01f79-007d-09bb-03be-050c009ceff6@suse.cz>
 <4d9a2352-6daa-4dcc-376b-175b1398ff6a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4d9a2352-6daa-4dcc-376b-175b1398ff6a@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jiri Slaby <jslaby@suse.cz>, Laxman Dewangan <ldewangan@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 19/02/2020 12:25, Dmitry Osipenko wrote:
> 17.02.2020 10:37, Jiri Slaby =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 09. 02. 20, 17:44, Dmitry Osipenko wrote:
>>> It is possible to get an instant RX timeout or end-of-transfer interrup=
t
>>> before RX DMA was started, if transaction is less than 16 bytes. Transf=
er
>>> should be handled in PIO mode in this case because DMA can't handle it.
>>> This patch brings back the original behaviour of the driver that was
>>> changed by accident by a previous commit, it fixes occasional Bluetooth=
 HW
>>> initialization failures which I started to notice recently.
>>>
>>> Fixes: d5e3fadb7012 ("tty: serial: tegra: Activate RX DMA transfer by r=
equest")
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>
>>> Changelog:
>>>
>>> v2: - Corrected commit's title by adding the accidentally missed "tegra=
: "
>>>       to the prefix.
>>>
>>>  drivers/tty/serial/serial-tegra.c | 35 ++++++++++++++-----------------
>>>  1 file changed, 16 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/ser=
ial-tegra.c
>>> index 33034b852a51..8de8bac9c6c7 100644
>>> --- a/drivers/tty/serial/serial-tegra.c
>>> +++ b/drivers/tty/serial/serial-tegra.c
>>> @@ -692,11 +692,22 @@ static void tegra_uart_copy_rx_to_tty(struct tegr=
a_uart_port *tup,
>>>  				   count, DMA_TO_DEVICE);
>>>  }
>>> =20
>>> +static void do_handle_rx_pio(struct tegra_uart_port *tup)
>>> +{
>>> +	struct tty_struct *tty =3D tty_port_tty_get(&tup->uport.state->port);
>>> +	struct tty_port *port =3D &tup->uport.state->port;
>>> +
>>> +	tegra_uart_handle_rx_pio(tup, port);
>>> +	if (tty) {
>>
>> What's the tty good for here, actually?
>>
>>> +		tty_flip_buffer_push(port);
>>> +		tty_kref_put(tty);
>>> +	}
>>> +}
>=20
> I'm not really a TTY expert..
>=20
> Jon, maybe you have any clue whether TTY could disappear while port is
> opened?

Nothing specific that I am aware of. The function tty_kref_get() appears
to check that the tty pointer is valid and so it would seem logical to
check here as well. But happy to be corrected :-)

Jon

--=20
nvpublic
