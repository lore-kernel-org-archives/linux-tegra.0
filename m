From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] staging:iio:magnetometer:ak8975 Don't use irq_to_gpio()
Date: Thu, 1 Sep 2011 18:20:25 +0200
Message-ID: <201109011820.25307.arnd@arndb.de>
References: <1314819657-828-1-git-send-email-swarren@nvidia.com> <201109011306.50936.arnd@arndb.de> <74CDBE0F657A3D45AFBB94109FB122FF04B327A2A4@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04B327A2A4-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 01 September 2011, Stephen Warren wrote:
> One question: When we add this field, how do drivers tell whether a value
> of 0 is an uninitialized field, or a legitimate GPIO value of 0? Should we
> add a flag to indicate validity, or just work hard to not enable driver-
> side code to use this value until we've fixed up all places that instantiate
> the driver to initialize the field to some invalid value like -1?

I think it's enough to coordinate the driver with the initialization of the
i2c data. If a driver requires a GPIO number, it can assume that it's valid.
Drivers that don't need one don't care. If it's an optional feature, you
might want to either use platform_data after all, or use different identifiers
for devices that have a gpio vs. those that have none -- in effect those are
different types of devices handled by the same driver.

	Arnd
