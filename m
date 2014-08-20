From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Wed, 20 Aug 2014 08:40:33 -0700
Message-ID: <CAOesGMjFGabNOk0ODjbDN5aaro5309t02+B+UZoM_+q5VE9Ltw@mail.gmail.com>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org>
	<53EF76CF.9050808@suse.de>
	<53F2255E.7090208@wwwdotorg.org>
	<CAL1qeaH-WfA-DLKwuXA_hBPHYuXksAibLq__zisrT9ALaRGdAw@mail.gmail.com>
	<53F28F90.3000004@wwwdotorg.org>
	<CAOesGMhBdQh_ddycZ-Y5dupR9hW74bogHtG3yyPUJ2tAgWi19A@mail.gmail.com>
	<20140820143201.GA3368@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140820143201.GA3368@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 20, 2014 at 7:32 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Aug 20, 2014 at 06:29:14AM -0700, Olof Johansson wrote:
>> On Mon, Aug 18, 2014 at 4:43 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> [...]
>> > Again, this board *isn't* Nyan, so it should pretend that it is.
>>
>> It is a derivative design of the nyan reference platform, and it is
>> compatible with it. It is perfectly fine to claim to be compatible
>> with it. I'm sorry, but you're just wrong here.
>
> I guess that depends a little on how you define compatibility. I had
> always assumed that the top-level compatible string would be a sort of
> "checksum" over the rest of the content. Which, admittedly, makes it
> kind of redundant. Compatibility could mean a lot of things. Does it
> mean any kernel/DTB compatible with one device could run on any device
> derived from it? Does compatibility mean it needs to provide full
> functionality or is it still compatible if it runs at a reduced feature
> set but doesn't "break" otherwise?

Consider:
        compatible = "foo,x", "foo,y";

My interpretation is:  foo,x is compatible with foo,y if and only if:

foo,x can be driven by the same code as foo,y -- i.e. the driver
doesn't need changes for basic things to work (and nothing should be
broken).

foo,x _can_ be a superset though. It could have features that foo,y
doesn't have, that needs driver changes to take advantage of. But
using the foo,y driver with a foo,x device should give you the foo,y
functionality.

The simple case is where foo,x is more or less identical to foo,y, but
there might be some implementation-specific bugs that makes it useful
to be able to, at some point in the future, tell if you're running on
a foo,x or foo,y device even if the code is identical today.


In this particular case, google,nyan and google,nyan-big are very
similar. There are some differences in panels, etc, but it's described
in the individual device trees already, but things will come up and be
functional even if you boot with the wrong device tree (as far as I
know). Andrew has done that in the past, as far as I know.


-Olof
