From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Kconfig DRM_USB/DRM_UDL, and select vs. depends, and causing Tegra
 USB to be disabled
Date: Tue, 04 Sep 2012 13:19:12 -0600
Message-ID: <50465430.3090806@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

With respect to the following commits:

df0b344 drm/usb: select USB_SUPPORT in Kconfig
8f057d7 gpu/mfd/usb: Fix USB randconfig problems

... which end up with the following in next-20120904:

config DRM_USB
        depends on DRM
        depends on USB_ARCH_HAS_HCD
        select USB
        select USB_SUPPORT

config DRM_UDL
        depends on DRM && EXPERIMENTAL
        depends on USB_ARCH_HAS_HCD
        select DRM_USB

Surely this is backwards; these should be dependencies, not selects? In
other words:

config DRM_USB
        depends on DRM && USB

config DRM_UDL
        depends on DRM && EXPERIMENTAL && USB
        select DRM_USB

or perhaps:

config DRM_USB
        depends on DRM && USB

config DRM_UDL
        depends on DRM && EXPERIMENTAL && DRM_USB

The problem here is that currently, the dependency logic for USB:

config USB
	depends on USB_ARCH_HAS_HCD

... is duplicated into each of DRM_USB and DRM_UDL, thus requiring both
of those to be edited should the dependencies for USB ever change.

The current state of the code also causes some strange problem with
ARM's tegra_defconfig, whereby running "make tegra_defconfig" will
result in USB support fully enabled in .config as expected, yet
subsequently running "make oldconfig" will cause all USB support to be
removed from .config. For some reason, the above DRM logic is causing
CONFIG_USB_ARCH_HAS_HCD not to be selected (perhaps it isn't evaluated
because USB is selected, so there's no need to evaluate USB's
dependencies?). Arguably, this is a deficiency in Tegra's Kconfig, in
that it probably should say:

	select USB_ARCH_HAS_EHCI

not:

	select USB_ARCH_HAS_EHCI if USB_SUPPORT

... but it has contained the latter for quite some time, and it's always
worked before somehow.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
