From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM64: tegra: Add support for Google Pixel C
Date: Thu, 7 Jan 2016 13:19:44 +0000
Message-ID: <568E65F0.2070201@nvidia.com>
References: <1452073222-2956-1-git-send-email-jonathanh@nvidia.com>
 <20160106094616.GA563@leverpostej> <568D0D70.4020309@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <568D0D70.4020309-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 06/01/16 12:49, Jon Hunter wrote: 
> On 06/01/16 09:46, Mark Rutland wrote:
>> Hi,
>>
>> On Wed, Jan 06, 2016 at 09:40:22AM +0000, Jon Hunter wrote:
>>> Add initial device-tree support for Google Pixel C (a.k.a. Smaug) based
>>> upon Tegra210 SoC with 3 GiB of LPDDR4 RAM.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  arch/arm64/boot/dts/nvidia/Makefile           |  1 +
>>>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 42 +++++++++++++++++++++++++++
>>>  2 files changed, 43 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts

[snip]

>>> +
>>> +	chosen {
>>> +		bootargs = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x70006000";
>>> +	};
>>
>> Use stdout-path.
> 
> Ok.

Adding Arnd.

Hmmm ... well apparently stdout-path does not work for tegra and in
order to make this work I had to do the following ...


[PATCH] serial: 8250: of: Add earlycon support for Tegra

Currently, early console support only works for Tegra when the serial
port information is passed via the earlycon boot parameter. If the
serial port information is specified via device-tree using the
"stdout-path" then the early console does not work because:

1. The tegra serial ports compatibility parameter does not match any
   of the supported serial drivers for early console.
2. The of_setup_earlycon() function assumes that serial port registers
   are byte aligned and for tegra they are 32-bit aligned.

Add an early console setup function for tegra so that the early console
can be specified via the device-tree "stdout-path" variable.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/tty/serial/8250/8250_of.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index 33021c1f7d55..98adf83e83c2 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -44,6 +44,16 @@ void tegra_serial_handle_break(struct uart_port *p)
 		udelay(1);
 	} while (1);
 }
+
+int __init tegra_earlycon_setup(struct earlycon_device *device,
+				const char *options)
+{
+	device->port.iotype = UPIO_MEM32;
+	device->port.regshift = 2;
+
+	return early_serial8250_setup(device, options);
+}
+OF_EARLYCON_DECLARE(tegra20_uart, "nvidia,tegra20-uart", tegra_earlycon_setup);
 #else
 static inline void tegra_serial_handle_break(struct uart_port *port)
 {


Arnd, does the above look ok, or should there be a generic
early_serial8250x32_setup() somewhere?

Cheers
Jon
