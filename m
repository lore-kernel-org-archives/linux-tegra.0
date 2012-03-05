From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T
 kernel_noload
Date: Sun, 4 Mar 2012 20:21:07 -0800
Message-ID: <20120305042107.GA31142@quad.lixom.net>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17BE861683@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BE861683-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 01, 2012 at 09:01:04AM -0800, Stephen Warren wrote:
> Stephen Warren wrote at Tuesday, February 28, 2012 5:03 PM:
> > uImage files typically encode a single absolute load and entry address.
> > This is inconvenient when attempting to share that uImage across multiple
> > SoCs with different physical RAM addresses. Recent versions of mkimage
> > implement a "kernel_noload" image type which encodes no absolute load
> > address, and a relative entry address. This works well for uImage-wrapped
> > ARM zImages, since they are relocatable.
> > 
> > This is enabled by commit b9b50e89d317c58becd0e2d7fac2e21e3a81dd0a
> > "image: Implement IH_TYPE_KERNEL_NOLOAD" in U-Boot.
> 
> So Russell, are you NAKing this patch then?
> 
> If so, I guess I'll just go and add more cruft to my copy-a-kernel-to-
> an-sd-card script. Which is a pity since every other person will have
> to do the same, but oh well.

I'd say send them on to his patch tracker and he can decide from there?

Feel free to add:

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Some people seem to have a bone to pick with u-boot, and apparantly want us to
make it harder to use the kernel with the firmware that is already out there.
I personally disagree, but as you said, I'll just add my own wrapper script if
it comes to it. So will everyone else though, and that just seems wasteful.

There hasn't been much churn lately around boot images (unlike the situation
back 5 years ago in the thread that was referenced earlier in this thread, as
far as I can tell).

So while the churn in this case is compensated by added convenience
and productivity for me personally, it's up to Russell to decide if it
goes in.


-Olof
