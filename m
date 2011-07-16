From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: tegra: paz00: enable wifi led
Date: Sat, 16 Jul 2011 18:19:29 +0200
Message-ID: <20110716181929.0dd45ce7@ac100.localdomain>
References: <1310725464-2524-1-git-send-email-marvin24@gmx.de>
	<1310725464-2524-4-git-send-email-marvin24@gmx.de>
	<74CDBE0F657A3D45AFBB94109FB122FF049E834C43@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049E834C43-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Collin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Fri, 15 Jul 2011 10:10:28 -0700
schrieb Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:

> Marc Dietrich wrote at Friday, July 15, 2011 4:24 AM:
> > This adds support for the wifi led. It is automaticly triggered by
> > the rfkill0 event.
> ...
> > +static struct gpio_led gpio_leds[] = {
> > +	{
> > +		.name                   = "wifi-led",
> > +		.default_trigger        = "rfkill0",
> > +		.gpio                   = TEGRA_WIFI_LED,
> > +	},
> > +};
> 
> How does this work given that the previous patch simply exports the
> actual GPIO to user-space, rather than registering it through an
> rfkill driver; Does the WiFi driver itself register directly with the
> rfkill system? 

I don't know the details but the driver seems to register some rfkill
poll routine which reports the hw status back to the mac layer. I guess
from there the rfkill events are distributed. At least the led works
fine here (and acts upon rfkill block). Problem is that the even binds
to the first device registered to if you plug in some other network
device which is registered first, then the led will act upon this one.
Don't know how to bind it to a specific device.

> (what model of device is the AC100's WiFi? I assume it's on USB.)

yes, it's a rt3070 (check the rt2x00 driver).

Marc
