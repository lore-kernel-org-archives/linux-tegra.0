From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add "nor-jedec" flash compatible binding
Date: Fri, 08 May 2015 10:00:12 -0600
Message-ID: <554CDD8C.7050000@wwwdotorg.org>
References: <1431066098-19821-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431066098-19821-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/08/2015 12:21 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
> Starting with commits
> 8ff16cf ("Documentation: devicetree: m25p80: add "nor-jedec" binding"=
)
> 1103b85 ("mtd: m25p80: bind to "nor-jedec" ID, for auto-detection")
> we have "nor-jedec" binding indicating support for JEDEC identificati=
on.

The documentation looks quite incomplete. "nor-jedec" sounds like it's=20
intended to be something generic. As such, it should be documented in=20
e.g. Documentation/devicetree/bindings/mtd/nor-jedec.txt, not buried in=
=20
one particular flash device's binding. If it's not intended to be=20
generic, why isn't the existing "winbond,w25q32dw" enough?

Equally, "nor-jedec" doesn't sound like the right name. It doesn't=20
differentiate between SPI and parallel NOR flash, which presumably need=
=20
different compatible values, since the programming model is quite=20
different, and the compatible value is supposed to define/imply the=20
SW-visible programming model.
