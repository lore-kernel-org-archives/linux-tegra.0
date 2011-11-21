From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v1] dts: tegra-ventana: use proper root instead of
 /dev/ram
Date: Sun, 20 Nov 2011 16:49:30 -0800
Message-ID: <20111121004930.GA17338@quad.lixom.net>
References: <1321338087-3662-1-git-send-email-vwadekar@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1740805E1B@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1740805E1B-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 15, 2011 at 11:16:51AM -0800, Stephen Warren wrote:
> Varun Wadekar wrote at Monday, November 14, 2011 11:21 PM:
> > From: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > The root file system on ventana resides on /dev/mmcblk0p1.
> 
> Well, that's entirely up to however the user set up their system, although
> I admit mmcblk0p1 is likely to be the common case; I certainly carry
> basically this patch locally for many boards.
> 
> > Update the dts file to use the proper root instead of /dev/ram.
> > 
> > Signed-off-by: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Of course, perhaps an even better solution is to just remove /chosen from
> all the board .dts files, and stop using CONFIG_APPENDED_DTB since U-boot
> supports FDT, and will update the cmdline with whatever the user chose.
> Still, I think this is probably OK for now.

Actually, removing the default root path is probably a better idea, since it
will vary from installation to installation and doesn't make sense to hard
code.

There's two ways to solve this with u-boot:

* Boot with an u-boot that knows how to pass a device tree (and add the
  bootargs to it before launching the kernel, and do so by either booting
  a fitImage or by loading the device tree explicitly.

* Use the appended-dtb kernel format, and select the ARM_ATAG_DTB_COMPAT
  option. That will mean that the bootargs passed in from atags are moved over
  to the device tree.

So, I would rather see a patch removing the root= argument alltogether.


Thanks!

-Olof
