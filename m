From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: serial: of-serial: fetch line number from DT
Date: Mon, 10 Nov 2014 13:34:19 -0800
Message-ID: <CAOesGMjzs=dThDv6S8Xvo+ym-XECaQhTQ8NV6t46fQZ1LoJnHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Greg,

This commit:

commit 1bd8324535ec1ff44aef55c0e40b9e7d56b310fb
Author: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Date:   Mon Nov 3 23:16:54 2014 +0100

    serial: of-serial: fetch line number from DT

    The general agreed way to specify a fixed line number
    for a serial console is to provide a "serial" alias
    in the devicetree. Start parsing this property in
    of_serial.

    Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>


Broke a whole lot of tegra boards in last night's -next here. In
particular, I've been looking at tegra20-seaboard, which now doesn't
boot with console any more.

http://arm-soc.lixom.net/bootlogs/next/next-20141110/

Unfortunately, tegra has for a long time been specifying the aliases
as a fixed 1:1 mapping, but most environments rely on ttyS0 being the
first _activated_ serial port. That's obviously going to break things
here. :(

Greg, can you please revert until we get the tegra-side fixes in for
this, or we're in for a pretty lousy time w.r.t. bisecting problems
across the two mergepoints?

Stephen: I suppose the best way to handle this on tegra is to specify
the aliases per-board instead of in the soc dtsi today.

Apologies for not replying to the patch directly -- it was only ever
posted to linux-serial and I don't seem to be subscribed.


-Olof
