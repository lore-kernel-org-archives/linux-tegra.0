From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: config: enable SERIAL_TEGRA
Date: Wed, 16 Jan 2013 10:57:30 -0700
Message-ID: <50F6EA0A.4080904@wwwdotorg.org>
References: <1358341572-8154-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358341572-8154-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/16/2013 06:06 AM, Laxman Dewangan wrote:
> Enable high speed serial driver for tegra platform.

Thanks, I've applied patch 1 to Tegra's for-3.9/defconfig branch and
patch 2 to Tegra's for-3.9/dt branch.

Just as an FYI, the dt branch is merged into my for-next branch, and
sent upstream, before the defconfig branch, so your patch order was
reversed relative to that, but it's not an issue here.

Question: How do I test this; do I just fire up bluez(?) and point it at
the UARTC serial port, or is there more to it?
