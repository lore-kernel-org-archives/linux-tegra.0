From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: How to correctly use spi_slave_tegra
Date: Thu, 15 Nov 2012 11:47:54 -0700
Message-ID: <50A538DA.2010906@wwwdotorg.org>
References: <3877625.uASAU6TrGF@number-5>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3877625.uASAU6TrGF@number-5>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Federico Vaga <federico.vaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.sappia-197Af0g7QoUlk5EcyZIkJQ@public.gmane.org, puria.nafisi-yFROiS3d6cY@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/13/2012 01:08 PM, Federico Vaga wrote:
> Hi,
> 
> I'm working on the SPI bus on a Nvidia Tegra 2 system (Toradex Colibri). I'm 
> using kernel 2.6.32 with toradex and nvidia patches.

Laxman, are you able to help with these questions?

That's a very old kernel. I doubt anyone really remembers much about the
NVIDIA custom code we applied to it. Are you sure you have 2.6.32
anyway; the only copy of NVIDIA's 2.6.32-based kernel I have doesn't
include the Tegra SPI slave driver as far as I can tell.

I'd recommend at least upgrading to the most recent NVIDIA downstream
kernel so that people still remember the code.

I should recommend switching to an upstream kernel, but we don't have
any SPI slave driver there at all, nor yet Colibri support, so that
wouldn't be much use, unless you want to upstream the support yourself...

> I need to use one of the Tegra SPI controller in Slave mode. I know that the 
> Linux kernel does not support the Slave mode for SPI controllers, but I see 
> the drivers/spi/spi_slave_tegra.c driver which is not documented and it is not 
> commented, also the author name is missing. The only information available is 
> the Nvidia Copyright 2011.
> 
> Toradex does not tested the spi_slave_tegra and cannot provides an example of 
> driver which use the spi_slave_tegra.
> 
> I read the code and I see that spi_slave_tegra use the SPI framework also if 
> the SPI framework supports only master controller. 
> 
> Anyone ever use the spi_slave_tegra? It works? Can you provide an example?
> 
> As I understand:
> - obviously I must configure SPI before master start communication
> - speed_hz must be the same of the master
> - I must use spi_async (spi_sync can freeze the driver)
> - Only messages with single transfer. If the master sends messages with 
> multiple transfer, I must receive them with a single transfer
> - I have two callback. the message->complete from the SPI framework and the 
> spi_tegra_register_callback from the spi_slave_tegra

From a very very very brief look at ouor android-tegra-nv-3.1 branch,
your understanding sounds at least reasonable even if not correct!
