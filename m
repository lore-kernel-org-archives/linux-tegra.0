From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/3] ARM: tegra: paz00: enable wifi led
Date: Fri, 15 Jul 2011 10:10:28 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049E834C43@HQMAIL01.nvidia.com>
References: <1310725464-2524-1-git-send-email-marvin24@gmx.de>
 <1310725464-2524-4-git-send-email-marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1310725464-2524-4-git-send-email-marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Collin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Marc Dietrich wrote at Friday, July 15, 2011 4:24 AM:
> This adds support for the wifi led. It is automaticly triggered by
> the rfkill0 event.
...
> +static struct gpio_led gpio_leds[] = {
> +	{
> +		.name                   = "wifi-led",
> +		.default_trigger        = "rfkill0",
> +		.gpio                   = TEGRA_WIFI_LED,
> +	},
> +};

How does this work given that the previous patch simply exports the actual
GPIO to user-space, rather than registering it through an rfkill driver;
Does the WiFi driver itself register directly with the rfkill system? 

(what model of device is the AC100's WiFi? I assume it's on USB.)

-- 
nvpublic
