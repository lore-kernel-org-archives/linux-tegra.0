From: Federico Vaga <federico.vaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: How to correctly use spi_slave_tegra
Date: Thu, 15 Nov 2012 20:41:57 +0100
Message-ID: <2843691.9Zl65ZOxsQ@number-5>
References: <3877625.uASAU6TrGF@number-5> <50A538DA.2010906@wwwdotorg.org> <50A53CB7.1090705@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50A53CB7.1090705-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "a.sappia-197Af0g7QoUlk5EcyZIkJQ@public.gmane.org" <a.sappia-197Af0g7QoUlk5EcyZIkJQ@public.gmane.org>, "puria.nafisi-yFROiS3d6cY@public.gmane.org" <puria.nafisi-yFROiS3d6cY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> Yes, the above are correct. The way we wrote the driver is that to
> support the sync and async both.
> When driver configures spi controller and ready for receive data then
> the callback from client is called. This callback is registered through
> spi_tegra_register_callback(). The client code then can inform master in
> this callback to start transfer through some mechanism i.e. gpio.

One more question.
From the Tegra 2 Manual, SPI slave section, I read (I cannot copy it because 
of DRM and Nvidia legal stuff) that the clock signal *must* has 1 cycle delay 
between each word (or packet in packet mode); but I don't read from the master 
section that the master controller provide 1 cycle delay between each word (or 
packet). If I connect a Tegra 2 SPI Master with a Tegra 2 SPI slave .... it 
works?

Thank you

-- 
Federico Vaga
