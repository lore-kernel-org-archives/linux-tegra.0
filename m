From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/6] i2c: tegra: Add pinctrl support
Date: Thu, 11 Aug 2016 20:31:40 +0530
Message-ID: <57AC9354.1080603@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com> <1470910620-9898-7-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470910620-9898-7-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 11 August 2016 03:47 PM, Jon Hunter wrote:
> On Tegra124/132 the pins for I2C6 are shared with the Display Port AUX
> (DPAUX) channel and on Tegra210 the pins for I2C4 and I2C6 are shared
> with DPAUX1 and DPAUX0, respectively. The multiplexing of the pins is
> handled by a register in the DPAUX and so the Tegra DPAUX driver has
> been updated to register a pinctrl device for managing these pins.
>
> The pins for these particular I2C devices are bound to the I2C device
> prior to probing. However, these I2C devices are in a different power
> partition to the DPAUX devices that own the pins. Hence, it is desirable
> to place the pins in the 'idle' state and allow the DPAUX power
> partition to switch off, when these I2C devices is not in use.
> Therefore, add calls to place the I2C pins in the 'default' and 'idle'
> states when the I2C device is runtime resumed and suspended,
> respectively.
>
> Please note that the pinctrl functions that set the state of the pins
> check to see if the devices has pins associated and will return zero
> if they do not. Therefore, it is safe to call these pinctrl functions
> even for I2C devices that do not have any pins associated.
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
