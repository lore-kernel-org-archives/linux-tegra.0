From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: How to correctly use spi_slave_tegra
Date: Thu, 15 Nov 2012 14:04:23 -0500
Message-ID: <50A53CB7.1090705@nvidia.com>
References: <3877625.uASAU6TrGF@number-5> <50A538DA.2010906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50A538DA.2010906-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Federico Vaga <federico.vaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "a.sappia-197Af0g7QoUlk5EcyZIkJQ@public.gmane.org" <a.sappia-197Af0g7QoUlk5EcyZIkJQ@public.gmane.org>, "puria.nafisi-yFROiS3d6cY@public.gmane.org" <puria.nafisi-yFROiS3d6cY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/15/2012 01:47 PM, Stephen Warren wrote:
> On 11/13/2012 01:08 PM, Federico Vaga wrote:
>> Hi,
>>
>> I'm working on the SPI bus on a Nvidia Tegra 2 system (Toradex Colibri). I'm
>> using kernel 2.6.32 with toradex and nvidia patches.
> Laxman, are you able to help with these questions?
We have the driver from K2.6.39, K3.1 and K3.4.
I suggest to use the driver from k2.6.39 rather than K2.3.36 version.

>> As I understand:
>> - obviously I must configure SPI before master start communication
>> - speed_hz must be the same of the master
>> - I must use spi_async (spi_sync can freeze the driver)
>> - Only messages with single transfer. If the master sends messages with
>> multiple transfer, I must receive them with a single transfer
>> - I have two callback. the message->complete from the SPI framework and the
>> spi_tegra_register_callback from the spi_slave_tegra
>  From a very very very brief look at ouor android-tegra-nv-3.1 branch,
> your understanding sounds at least reasonable even if not correct!
>

Yes, the above are correct. The way we wrote the driver is that to 
support the sync and async both.
When driver configures spi controller and ready for receive data then 
the callback from client is called. This callback is registered through 
spi_tegra_register_callback(). The client code then can inform master in 
this callback to start transfer through some mechanism i.e. gpio.
