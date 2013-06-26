From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/4] usb: host: tegra: Remove direct vbus regulator control
 using GPIOs
Date: Wed, 26 Jun 2013 11:16:15 -0600
Message-ID: <51CB21DF.7060801@wwwdotorg.org>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com> <1372240781-1017-3-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372240781-1017-3-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/26/2013 03:59 AM, Mikko Perttunen wrote:
> The tegra ehci driver has enabled USB vbus regulators directly using
> GPIOs and the device tree attribute nvidia,vbus-gpio. This is ugly
> and causes error messages on boot when both the regulator driver
> and the ehci driver want access to the same GPIO.
> 
> This patch removes this mechanism of vbus control, so that an actual
> regulator interface can be used by the phy layer to control the
> usb vbus regulator.

This should be squashed into patch 1/4. The reason is that if just patch
1/4 is applied, then both ehci-tegra.c's legacy raw GPIO handling and
phy-tegra-usb.c's new regulator-based code will attempt to
gpio_request() the same GPIO, and one will fail, which will likely cause
the driver to fail to probe().
