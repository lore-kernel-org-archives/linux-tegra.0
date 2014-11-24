From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: serial: of-serial: fetch line number from DT
Date: Mon, 24 Nov 2014 13:58:24 -0800
Message-ID: <CAOesGMhfAdG0JnPSiw_TW5-dYAnic6ZwWVKFVqB_GBxgDRFuGg@mail.gmail.com>
References: <CAOesGMjzs=dThDv6S8Xvo+ym-XECaQhTQ8NV6t46fQZ1LoJnHw@mail.gmail.com>
	<20141111052407.GB24727@kroah.com>
	<CAOesGMhe8orqL6wSiouQvdM8y4N44p12n7M1opraSkAP=3ZB+A@mail.gmail.com>
	<1416865299.2180.1.camel@lynxeye.de>
	<20141124215725.GA19228@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141124215725.GA19228-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 24, 2014 at 1:57 PM, Greg Kroah-Hartman
<gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Mon, Nov 24, 2014 at 10:41:39PM +0100, Lucas Stach wrote:
>> Hi Greg,
>>
>> Am Dienstag, den 11.11.2014, 08:51 -0800 schrieb Olof Johansson:
>> > On Mon, Nov 10, 2014 at 9:24 PM, Greg Kroah-Hartman
>> > <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
>> > > On Mon, Nov 10, 2014 at 01:34:19PM -0800, Olof Johansson wrote:
>> > >> Greg,
>> > >>
>> > >> This commit:
>> > >>
>> > >> commit 1bd8324535ec1ff44aef55c0e40b9e7d56b310fb
>> > >> Author: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> > >> Date:   Mon Nov 3 23:16:54 2014 +0100
>> > >>
>> > >>     serial: of-serial: fetch line number from DT
>> > >>
>> > >>     The general agreed way to specify a fixed line number
>> > >>     for a serial console is to provide a "serial" alias
>> > >>     in the devicetree. Start parsing this property in
>> > >>     of_serial.
>> > >>
>> > >>     Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> > >>     Signed-off-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
>> > >>
>> > >>
>> > >> Broke a whole lot of tegra boards in last night's -next here. In
>> > >> particular, I've been looking at tegra20-seaboard, which now doesn't
>> > >> boot with console any more.
>> > >>
>> > >> http://arm-soc.lixom.net/bootlogs/next/next-20141110/
>> > >>
>> > >> Unfortunately, tegra has for a long time been specifying the aliases
>> > >> as a fixed 1:1 mapping, but most environments rely on ttyS0 being the
>> > >> first _activated_ serial port. That's obviously going to break things
>> > >> here. :(
>> > >>
>> > >> Greg, can you please revert until we get the tegra-side fixes in for
>> > >> this, or we're in for a pretty lousy time w.r.t. bisecting problems
>> > >> across the two mergepoints?
>> > >>
>> > >> Stephen: I suppose the best way to handle this on tegra is to specify
>> > >> the aliases per-board instead of in the soc dtsi today.
>> > >>
>> > >> Apologies for not replying to the patch directly -- it was only ever
>> > >> posted to linux-serial and I don't seem to be subscribed.
>> > >
>> > > Now reverted, sorry for the problems.
>> >
>> > No worries, it's what linux-next is for. Thanks for the revert!
>> >
>> As 3.18-rc6 now landed the fix to avoid the regression on Tegra would
>> you please consider reapplying this patch?
>
> What patch?  Please resend it, AND, get everyone to agree that it's not
> going to break anything.

I'm OK with it going in now, since as mentioned above the tegra DTS
changes that resolved the issue have gone in as of -rc6.

Lucas, feel free to add my ack when you resend your patch.


-Olof
