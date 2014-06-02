From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] arm: tegra: initial support for apalis t30
Date: Mon, 02 Jun 2014 22:24:41 +0200
Message-ID: <538CDD89.6080605@ziswiler.com>
References: <c5522b0efcbfc7690dcde6aaf78b9dd568f99604.1401665237.git.marcel@ziswiler.com> <b470c9c8631a6ef021d140192eb07006de3cfd93.1401665237.git.marcel@ziswiler.com> <538CA749.3010106@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538CA749.3010106-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/02/2014 06:33 PM, Stephen Warren wrote:
> I vaguely recall people speaking out against including "spidev" devices
> in DT because they don't represent actual HW, but rather a way to
> request that the SPI bus be exposed to user-space, which is a pure SW
> issue. Wouldn't it be better if the spidev interface worked like
> I2C_CHARDEV, where fake devices weren't actually required?

Well, there is one important difference. While I2C indeed does not have 
any further hardware dependency apart from the clock (SCL) and data 
(SDA) lines SPI actually requires dedicated hardware chip-select lines 
as well. But I guess NVIDIA has been rather ignorant about any of this 
in the past...
