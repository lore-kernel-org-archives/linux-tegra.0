From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 1/4] i2c: Add irq_gpio field to struct i2c_client.
Date: Fri, 2 Sep 2011 18:05:27 +0200
Message-ID: <201109021805.27569.arnd@arndb.de>
References: <1314895964-15964-1-git-send-email-swarren@nvidia.com> <4E60985B.6010901@cam.ac.uk> <74CDBE0F657A3D45AFBB94109FB122FF04B327A55D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04B327A55D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 02 September 2011, Stephen Warren wrote:
> The idea was specifically to replace the need to call irq_to_gpio(i2c->irq).
> If we did just rename it plain "gpio" and allow it to be used for anything,
> then that does indeed start looking more like device-specific platform data.
> 
> I guess it sounds like consensus is to go that way. It does seem like that
> will end up creating a bunch more device-specific platform-data files though.
> I wonder if adding IORESOURCE_GPIO would make sense so this could be handled
> in a generic way without custom platform data types?

Interesting point. That's probably best for Grant to comment on, because
it depends on the long-term direction he wants to take with this.

I suppose that an IORESOURCE_GPIO makes a lot of sense if we expect
to keep having a flat system-wide gpio number space in the long run,
similar to irq numbers.

It would not fit well if we expect gpio numbers to be local to
a gpio controller, with no unique global identifier for them, similar
to how dma channels in the dma-engine subsystem are handled.

	Arnd
