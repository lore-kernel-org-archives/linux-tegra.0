From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/7] usb: phy: tegra: get ULPI reset GPIO info using DT.
Date: Tue, 19 Mar 2013 14:03:55 -0600
Message-ID: <5148C4AB.1070502@wwwdotorg.org>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com> <1363609781-4045-6-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363609781-4045-6-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 06:29 AM, Venu Byravarasu wrote:
> As GPIO information is avail through DT, used it to get Tegra ULPI
> reset GPIO number. Added a new member to tegra_usb_phy structure to
> store this number.

> diff --git a/drivers/usb/phy/tegra_usb_phy.c b/drivers/usb/phy/tegra_usb_phy.c

> -	gpio_direction_output(config->reset_gpio, 0);
> +	gpio_direction_output(phy->reset_gpio, 0);
>  	msleep(5);
> -	gpio_direction_output(config->reset_gpio, 1);
> +	gpio_direction_output(phy->reset_gpio, 1);

That implies that the PHY reset signal is active-low. This should be
represented in the GPIO flags in the device tree. In other words,
instead of e.g.:

nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */

you want:

nvidia,phy-reset-gpio = <&gpio 169 1>; /* gpio PV1 */

Flag 1 means active-low. See
Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt. This is
a bug in the current device tree content, although it has no effect
since no code currently uses the GPIO flags from DT. I suggest creating
a separate patch to fix this, and inserting it between patch 1 and 2 of
the series.
