From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V6 00/12] Tegra xHCI support
Date: Wed, 26 Nov 2014 11:31:17 -0800
Message-ID: <CAL1qeaHkJhJ52jxJLic8Ey6TwA2TxLydeV995OA=Mpi8rjgnLA@mail.gmail.com>
References: <1416874644-12070-1-git-send-email-abrestic@chromium.org>
	<CAJe_Zhcz=WOLy0_98xRj6=i2+5MFeXQGPmYJhnpy1NfUEPJ-0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_Zhcz=WOLy0_98xRj6=i2+5MFeXQGPmYJhnpy1NfUEPJ-0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak@codeau>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 25, 2014 at 5:32 AM, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 25 November 2014 at 05:47, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> This series adds support for xHCI on NVIDIA Tegra SoCs.  This includes:
>>  - patches 1, 2, and 3: minor cleanups for mailbox framework and xHCI,
>>  - patches 4 and 5: adding a driver for the mailbox used to communicate
>>    with the xHCI controller's firmware,
>>  - patches 6 and 7: extending the XUSB pad controller driver to support
>>    the USB PHY types (UTMI, HSIC, and USB3),
>>  - patches 8 and 9: adding a xHCI host-controller driver, and
>>  - patches 10, 11, and 12: updating the relevant DT files.
>>
>> The mailbox driver (patch 5) has a compile-time dependency on patch 2 and
>> a run-time dependency on patch 3.  Both the PHY (patch 7) and host (patch 9)
>> drivers have compile-time dependencies on the mailbox driver.  The host
>> driver also has a run-time dependency on patch 1.  Because of this, this
>> entire series should probably go through the Tegra tree.
>>
> Why shouldn't I pick 2 & 3 at least?

I don't see why not.  Because of the PHY API change I'm going to have
to re-spin the series and at this point 3.19 is looking pretty
unlikely.  Maybe we could get a Tegra maintainer's ACK for patches 4
and 5 so that you could take them through your tree as well for 3.19?
(Stephen, Thierry, Alex?)
