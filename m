From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Tegra Note 7 device tree
Date: Fri, 02 May 2014 12:20:44 -0600
Message-ID: <5363E1FC.3080006@wwwdotorg.org>
References: <1399017548-1638-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399017548-1638-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/02/2014 01:59 AM, Alexandre Courbot wrote:
> Tegra Note 7 is a consumer tablet embedding a Tegra 4 SoC with 1GB RAM
> and a 720p panel.
> 
> The following hardware is enabled by this device tree: UART, eMMC, USB
> (needs external power), PMIC, backlight, DSI panel, keys.
> 
> SD card, HDMI, charger, self-powered USB, audio, wifi, bluetooth are not
> yet supported but might be by future patches (likely in that order).
> 
> Touch panel, sensors & cameras will probably never be supported.
> 
> Pinctrl is not set yet, as the bootloader-provided values allow us to
> use the currently supported hardware.
> 
> Initrd addresses are hardcoded to match the static values used by the
> bootloader, since it won't add them for us. All the same, a kernel
> command-line is provided to replace the one passed by the bootloader
> which is filled with garbage.

I've applied this to Tegra's for-3.16/dt branch.
