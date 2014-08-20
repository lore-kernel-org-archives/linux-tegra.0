From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Wed, 20 Aug 2014 10:25:34 -0700
Message-ID: <CAL1qeaFvpnu=4ShKp1i1pm6XGjjnquE3jheXZBqdS7OSXFEBNQ@mail.gmail.com>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org>
	<53EF76CF.9050808@suse.de>
	<53F2255E.7090208@wwwdotorg.org>
	<CAL1qeaH-WfA-DLKwuXA_hBPHYuXksAibLq__zisrT9ALaRGdAw@mail.gmail.com>
	<53F28F90.3000004@wwwdotorg.org>
	<CAL1qeaFnfLDOXq07fY4xLfdRpG8FQ63ya+-0Hk+ewA1wXkLOLw@mail.gmail.com>
	<53F3C5FD.4050808@wwwdotorg.org>
	<CAOesGMhDe0zFYkUWqBOTunK76wccdKOQ8b+EFAzeTr+oOUQyWA@mail.gmail.com>
	<20140820152507.GA3427@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140820152507.GA3427@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> It's been a long time since I've used FIT, but I seem to remember that
> it was simply a device tree-based description of a file format. As such
> couldn't you add an additional property to the configuration entry that
> the bootloader could match on? That would avoid the need to parse an
> embedded device tree and it might be useful to keep variants for the
> same board in the same FIT image.

Yes, I suppose something like that would be possible, however it's not
just depthcharge that matches to configurations based on the
compatible string within the configuration's FDT blob, this is the
convention U-Boot uses as well when booting FIT images.

> Perhaps you can explain a little more what the use-cases are. For
> example how are people suppose to run an upstream kernel on one of these
> Chromebooks?

There are a few ways you could run an upstream kernel:

1) Building your own verified-boot-wrapped FIT image and replacing the
existing one using tools found in the ChromiumOS tree [0].  This is
the workflow must of our developers use when working on product
kernels, but could just as easily be done with an upstream kernel.

2) Using U-Boot, either through the built-in legacy mode payload
(Ctrl-L at the developer screen) or by replacing the vboot-wrapped FIT
image with one that has U-Boot as a payload rather than a kernel [1].

3) If you're willing to flash your own firmware to the device, you can
build netboot-enabled firmware form the ChromiumOS tree that will load
a FIT image over the network.  This is the most flexible, as it
doesn't require the root device to be partitioned in any particular
way and allows you to boot non-ChromeOS distributions (e.g. Ubuntu).
This is what Dylan and I usually do when working on upstream kernels.

> How does dual-booting work?

You could dual-boot with the legacy-mode U-Boot, described above.

> Does the user get a menu to choose a configuration they want to boot if
> multiple entries are compatible with the detected board?

IIRC depthcharge will just pick the first one if there are multiple
exact matches.

[0] http://www.chromium.org/chromium-os/how-tos-and-troubleshooting/kernel-faq#TOC-How-to-quickly-test-kernel-modifications-the-fast-way-
[1] http://www.chromium.org/chromium-os/u-boot-porting-guide/using-nv-u-boot-on-the-samsung-arm-chromebook#TOC-Installing-nv-U-Boot-chained-U-Boot-method-
