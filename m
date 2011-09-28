From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 0/4] arm/tegra: Convert gpio & pinmux to platform devices
Date: Tue, 27 Sep 2011 20:56:02 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173955572E@HQMAIL01.nvidia.com>
References: <1316725567-17881-1-git-send-email-swarren@nvidia.com>
 <201109231848.52318.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201109231848.52318.arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Arnd Bergmann wrote at Friday, September 23, 2011 10:49 AM:
> On Thursday 22 September 2011, Stephen Warren wrote:
> >
> > This series converts the Tegra GPIO and pinmux drivers to be regular
> > platform devices.
> 
> Looks good overall.

Thanks.

> > The series is extracted from an earlier series I posted that augmented
> > these drivers to initialize HW state from the device-tree. I'm holding
> > off on that aspect of the changes, since it's not entirely clear to me
> > whether the new pinmux API should drive the initial pinmux state setup
> > via "system hog" definitions, or whether pinmux drivers should indeed
> > do their own thing.
> 
> I think at least you should try to do an ioremap of the pinmux register
> area in the pinmux probe function and make sure that it's called early
> enough, if at all possible.
> 
> Right now, there is an empty probe() function, which is a bit silly,
> and the pg_readl()/pg_writel() functions use hardcoded register
> addresses.

For GPIO, calling ioremap() should be pretty easy.

For pinmux, there are complications: The pinmux HW doesn't have a dedicated
address range, but rather the registers are somewhat scattered in groups
throughout the "APB_MISC" address range. APB_MISC also includes strapping,
JTAG configuration, and USB PHY registers, all of which exist between the
various groups of pinmux registers. On Tegra30, there's slightly less of
this, yet in turn this means that the number of chunks of address space used
by the pinmux module differs from Tegra20.

Right now, the pinmux driver data tables (which define the set of pin groups
known to the pinmux driver) all store register addresses as offsets from the
base of this APB_MISC region for simplicity.

What are your thoughts here; should I go ahead and update the pinmux driver
to ioremap() each of these chunks individually, and update the data tables
to be a tuple (chunk ID, offset_from_chunk), or leave things as is?

Thanks.

-- 
nvpublic
