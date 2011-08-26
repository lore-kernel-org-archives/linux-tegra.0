From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 11/13] of: add property iteration helpers
Date: Fri, 26 Aug 2011 08:59:44 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B24A40C8@HQMAIL01.nvidia.com>
References: <1314315824-9687-1-git-send-email-swarren@nvidia.com>
 <1314315824-9687-12-git-send-email-swarren@nvidia.com>
 <20110826092632.GB3926@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110826092632.GB3926-apL1N+EY0C9YtYNIL7UdTEEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Jamie Iles wrote at Friday, August 26, 2011 3:27 AM:
> On Thu, Aug 25, 2011 at 05:43:42PM -0600, Stephen Warren wrote:
> > This patch adds macros for_each_u32_property_value and
> > for_each_string_property_value, which iterate over an array of values
> > within a device-tree property. Usage is for example:
> >
> > struct of_iter_string_prop iter;
> > for_each_string_property_value(iter, np, "pins")
> >         printk("Got value %s\n", iter.value);
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Nicely implemented!

Thanks!

> For the !CONFIG_OF case, I *think* that
> of_iter_u32_prop and of_iter_string_prop can be empty struct's, but I
> wouldn't want to bet money on that!

Empty structs themselves certainly did compile OK, but the code that
uses these macros references iter.value directly, and isn't under #ifdef
CONFIG_OF, so that field has to exist.

I suppose an alternative would be to add an accessor function:

struct of_iter_string_prop iter;
for_each_string_property_value(iter, np, "pins")
        printk("Got value %s\n", of_iter_string_value(iter));

which would return NULL/"" when !CONFIG_OF, and hence allow iter.value
to be removed too. Do you think that's a good approach? It'd be easy to
implement.

-- 
nvpublic
