From: Federico Vaga <federico.vaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: How to correctly use spi_slave_tegra
Date: Thu, 15 Nov 2012 20:10:21 +0100
Message-ID: <2060607.hJW5X3vV4O@number-5>
References: <3877625.uASAU6TrGF@number-5> <50A538DA.2010906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50A538DA.2010906-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.sappia-197Af0g7QoUlk5EcyZIkJQ@public.gmane.org, puria.nafisi-yFROiS3d6cY@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> That's a very old kernel. I doubt anyone really remembers much about the
> NVIDIA custom code we applied to it. Are you sure you have 2.6.32
> anyway; the only copy of NVIDIA's 2.6.32-based kernel I have doesn't
> include the Tegra SPI slave driver as far as I can tell.

Probably we can work with 3.1. But the question it is the same because both 
spi_slave_tegra drivers have few difference

> I'd recommend at least upgrading to the most recent NVIDIA downstream
> kernel so that people still remember the code.

Assuming that spi_slave_tegra is working perfectly. Nobody developed something 
with it?

> I should recommend switching to an upstream kernel, but we don't have
> any SPI slave driver there at all, nor yet Colibri support, so that
> wouldn't be much use, unless you want to upstream the support yourself...

I think that it is not acceptable for upstream because spi_slave_tegra is 
using the SPI framework in the "wrong" way, because the SPI framework support 
only master controller. We should think about extending the SPI framework for 
slave support (maybe it is an easy job, I don't know). But if it is an 
unwanted features it could be an useless work. We want to use (try) the 
controller in the slave mode due to special condition on our hardware. If we 
can use the master mode we are happier :)

> > As I understand:
> > - obviously I must configure SPI before master start communication
> > - speed_hz must be the same of the master
> > - I must use spi_async (spi_sync can freeze the driver)
> > - Only messages with single transfer. If the master sends messages with
> > multiple transfer, I must receive them with a single transfer
> > - I have two callback. the message->complete from the SPI framework and
> > the
> > spi_tegra_register_callback from the spi_slave_tegra
> 
> From a very very very brief look at ouor android-tegra-nv-3.1 branch,
> your understanding sounds at least reasonable even if not correct!

I will update you when I can test on hardware

-- 
Federico Vaga
