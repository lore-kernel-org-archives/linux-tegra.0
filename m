From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: add device tree for SHIELD
Date: Mon, 12 May 2014 10:41:31 -0600
Message-ID: <5370F9BB.9040608@wwwdotorg.org>
References: <1399883209-31169-1-git-send-email-acourbot@nvidia.com> <1399883209-31169-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399883209-31169-3-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/12/2014 02:26 AM, Alexandre Courbot wrote:
> NVIDIA SHIELD is a portable Android console embedded a Tegra 4 SoC with
> 2GB RAM and a 720p panel.
> 
> The following hardware is enabled by this device tree: UART, eMMC, USB
> (needs external power), PMIC, backlight, joystick, SD card, GPIO keys.
> 
> DSI panel, HDMI output, charger, self-powered USB, audio, wifi bluetooth
> are not supported yet but might be by future patches (likely in that
> order).
> 
> Touch panel and sensors will probably never be supported.
> 
> Initrd addresses are hardcoded to match the static values used by the
> bootloader, since it won't add them for us. All the same, a kernel
> command-line is provided to replace the one passed by the
> bootloader which is filled with garbage.
> 
> NVIDIA SHIELD is typically booted with an appended DTB to avoid
> modifications made by the bootloader.

I've applied this one patch to Tegra's for-3.16/dt branch.
