From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] staging:iio:magnetometer:ak8975 Don't use irq_to_gpio()
Date: Thu, 1 Sep 2011 13:06:50 +0200
Message-ID: <201109011306.50936.arnd@arndb.de>
References: <1314819657-828-1-git-send-email-swarren@nvidia.com> <643E69AA4436674C8F39DCC2C05F76383CF3C784A3@HQMAIL03.nvidia.com> <4E5F49F4.2080208@cam.ac.uk>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5F49F4.2080208-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Cc: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 01 September 2011, Jonathan Cameron wrote:
> On 08/31/11 20:45, Andrew Chew wrote:
> >> Subject: [PATCH 1/3] staging:iio:magnetometer:ak8975 Don't 
> >> use irq_to_gpio()
> >>
> >> Tegra doesn't have irq_to_gpio() any more, and ak8975 is included in
> >> tegra_defconfig. This causes a build failure. Solve this with 
> >> a heavy-handed
> >> method for now.
> >>
> >> I suspect the long-term solution is to pass both the IRQ and GPIO IDs
> >> to the driver; the GPIO ID coming from either platform data, 
> >> or perhaps
> >> enhancing struct i2c_client to add a gpio field alongside irq.
> >>
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> > 
> > The three patches in this set LGTM.
> > 
> > Acked-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> 
> > 
> 
> Hmm.. I'd like to see some means of passing that in. Perhaps as simple as passing
> a pointer to an int in as platform_data.  Patch to follow.

My feeling is that we should just add another field to
struct i2c_client. There are probably more drivers that
need the same thing, making it appropriate to increase
the size of that struct for everything device instead of
adding platform_data to a subset of the devices.

	Arnd
