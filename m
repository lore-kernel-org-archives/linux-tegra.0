From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: How to correctly use spi_slave_tegra
Date: Thu, 15 Nov 2012 18:23:05 -0500
Message-ID: <50A57959.1040208@nvidia.com>
References: <3877625.uASAU6TrGF@number-5> <50A538DA.2010906@wwwdotorg.org> <50A53CB7.1090705@nvidia.com> <2843691.9Zl65ZOxsQ@number-5>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2843691.9Zl65ZOxsQ@number-5>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Federico Vaga <federico.vaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "a.sappia-197Af0g7QoUlk5EcyZIkJQ@public.gmane.org" <a.sappia-197Af0g7QoUlk5EcyZIkJQ@public.gmane.org>, "puria.nafisi-yFROiS3d6cY@public.gmane.org" <puria.nafisi-yFROiS3d6cY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/15/2012 02:41 PM, Federico Vaga wrote:
>> Yes, the above are correct. The way we wrote the driver is that to
>> support the sync and async both.
>> When driver configures spi controller and ready for receive data then
>> the callback from client is called. This callback is registered through
>> spi_tegra_register_callback(). The client code then can inform master in
>> this callback to start transfer through some mechanism i.e. gpio.
> One more question.
>  From the Tegra 2 Manual, SPI slave section, I read (I cannot copy it because
> of DRM and Nvidia legal stuff) that the clock signal *must* has 1 cycle delay
> between each word (or packet in packet mode); but I don't read from the master
> section that the master controller provide 1 cycle delay between each word (or
> packet). If I connect a Tegra 2 SPI Master with a Tegra 2 SPI slave .... it
> works?
>

Aah, it is something written incorrectly. We had internal discussion to 
remove this statement from TRM already. Please ignore the 1 cycle delay 
statement.
