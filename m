From: Federico Vaga <federico.vaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: How to correctly use spi_slave_tegra
Date: Tue, 13 Nov 2012 21:08:34 +0100
Message-ID: <3877625.uASAU6TrGF@number-5>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: a.sappia-197Af0g7QoUlk5EcyZIkJQ@public.gmane.org, puria.nafisi-yFROiS3d6cY@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

I'm working on the SPI bus on a Nvidia Tegra 2 system (Toradex Colibri). I'm 
using kernel 2.6.32 with toradex and nvidia patches.

I need to use one of the Tegra SPI controller in Slave mode. I know that the 
Linux kernel does not support the Slave mode for SPI controllers, but I see 
the drivers/spi/spi_slave_tegra.c driver which is not documented and it is not 
commented, also the author name is missing. The only information available is 
the Nvidia Copyright 2011.

Toradex does not tested the spi_slave_tegra and cannot provides an example of 
driver which use the spi_slave_tegra.

I read the code and I see that spi_slave_tegra use the SPI framework also if 
the SPI framework supports only master controller. 

Anyone ever use the spi_slave_tegra? It works? Can you provide an example?

As I understand:
- obviously I must configure SPI before master start communication
- speed_hz must be the same of the master
- I must use spi_async (spi_sync can freeze the driver)
- Only messages with single transfer. If the master sends messages with 
multiple transfer, I must receive them with a single transfer
- I have two callback. the message->complete from the SPI framework and the 
spi_tegra_register_callback from the spi_slave_tegra

Any suggestions, comments, opinions are welcome.

Thank you for your help.

-- 
Federico Vaga
