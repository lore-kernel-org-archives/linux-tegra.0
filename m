From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: add Jetson TK1 device tree
Date: Tue, 15 Apr 2014 14:47:29 -0600
Message-ID: <534D9AE1.1010602@wwwdotorg.org>
References: <1395769399-8357-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395769399-8357-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/25/2014 11:43 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Jetson TK1 is an NVIDIA Tegra124 development board, containing Tegra124,
> 2GB RAM, eMMC, SD card, SPI flash, serial port, PCIe Ethernet, HDMI,
> audio, mini PCIe, JTAG, SATA, and an expansion IO connector containing
> GPIOs, I2C, SPI, CSI, eDP, etc.
> 
> The following features work with this device tree: UART, SD card, eMMC,
> SPI flash, USB (full-size jack, and mini-PCIe), audio, AS3722 RTC, system
> power-off, suspend/resume (LP1) with wake via RTC alarm.
> 
> The following features should work with this device tree, but are not
> validated: Expansion I2C, expansion SPI, expansion GPIO, gpio-key for the
> power button.
> 
> The following features are not yet implemented in this device tree: Most
> voltage regulators, expansion UART, HDMI, eDP, PCIe (Ethernet, and mini-
> PCIe connector), CSI, SATA.

I have applied these, patch 1/2 to Tegra's for-3.16/dt branch, and patch
2/2 to Tegra's for-3.16/defconfig branch.
