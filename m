From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: dts: add aliases and DMA requestor for serial
 controller
Date: Thu, 20 Dec 2012 11:45:30 +0530
Message-ID: <50D2AD02.6060101@nvidia.com>
References: <1355898671-3960-1-git-send-email-ldewangan@nvidia.com> <50D1F2CB.3090206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D1F2CB.3090206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 19 December 2012 10:30 PM, Stephen Warren wrote:
> On 12/18/2012 11:31 PM, Laxman Dewangan wrote:
>> Add APB DMA requestor and serial aliases for serial controller.
>> There will be two serial driver i.e. 8250 based simple serial driver
>> and APB DMA based serial driver for higher baudrate and performace.
>>
>> The simple serial driver get enabled with compatible nvidia,tegra20-uart
>> and APB DMA based driver will get enabled with compatible
>> nvidia,tegra20-hsuart.
> This patch seems to do two things:
>
> 1) Add a comment describing how to select the basic or DMA-based driver.
> I can see why this is useful.
>
> 2) Add aliases for the serial ports. I have no idea why this is useful.

Serial aliases are added because we want to get the port number like 
/dev/ttyTHS0,  /d/ttyTHS2 etc. The uarta should be /dev/ttyTHS0 and 
uartc should be /dev/ttyTHS2. The port number can be found using aliases 
and of_alias_get_id() in driver file:

port_number = of_alias_get_id(np, "serial");
