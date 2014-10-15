From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/2] clocksource: tegra: Register watchdog device
Date: Wed, 15 Oct 2014 06:25:39 -0700
Message-ID: <543E75D3.5010907@roeck-us.net>
References: <1413201922-4210-1-git-send-email-thierry.reding@gmail.com> <1413201922-4210-2-git-send-email-thierry.reding@gmail.com> <543C00E2.2090806@roeck-us.net> <20141014104218.GG18993@ulmo> <543D72DD.4000501@wwwdotorg.org> <20141015080425.GB12807@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141015080425.GB12807@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/15/2014 01:04 AM, Thierry Reding wrote:
> On Tue, Oct 14, 2014 at 01:00:45PM -0600, Stephen Warren wrote:
>> On 10/14/2014 04:42 AM, Thierry Reding wrote:
>>> On Mon, Oct 13, 2014 at 09:42:10AM -0700, Guenter Roeck wrote:
>>>> On 10/13/2014 05:05 AM, Thierry Reding wrote:
>>>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>
>>>>> The watchdog timer is part of the timer controller block on Tegra. In
>>>>> order to avoid access to the same registers from two drivers, register
>>>>> the watchdog device from the clocksource driver.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> Does that really make sense ?
>>>>
>>>> A couple of callbacks into the clock driver to implement register accesses
>>>> might be a better approach.
>>>
>>> I guess that would be a valid approach as well. It has the downside of
>>> requiring the addition of at least two globally visible symbols to the
>>> kernel. It also means that we'd need to somehow pass around a struct
>>> device for diagnostic messages and so on. Dealing with all of that seems
>>> like much more of a burden than this.
>>>
>>> Also if you look at the diffstat this approach allows us to get rid of
>>> 80 lines of code. Adding a custom mechanism to share the register space
>>> would be more likely to result in a positive diffstat.
>>
>> FWIW, (although I haven't read the patches), the general idea of registering
>> a single driver for each HW block makes sense to me. While we've split up HW
>> blocks into separate drivers in the past, I think that's just made things
>> more complex without much benefit, so I think those decisions were a mistake
>> in retrospect. If we do actually need to split things up into separate
>> drivers, we should use MFD rather than multiple unrelated top-level drivers.
>> That way, we will have a single top-level driver that gets instantiated from
>> a single DT node (or platform device in a board file or ACPI thing or ...)
>
> MFD isn't fundamentally different from what Guenter proposed. While it
> gives us a framework to work with rather than having to roll our own, it
> comes with its own set of problems. One of the bigger problems that I
> can imagine is that if we rigorously apply this split to every device
> that exposes more than one subsystem interface, drivers/mfd is going to
> explode.
>
> Obviously the downside of exposing multiple interfaces in one driver is
> that we spread drivers all over the kernel, so it becomes harder to deal
> with API changes and such. On the other hand we do have good tools
> available for that (coccinelle) and we already have that situation right
> now at least for things that are in drivers/staging.
>
> One other problem with having one driver expose multiple interfaces is
> how to choose which tree to merge it through. Often I guess the logical
> choice would be the primary functionality of the block. Usually this
> would be the one that occupies the majority of the code. One recent
> example is a display controller that contains registers to control a PWM
> output typically used for backlight.
>

It is always a trade-off. Upside of using the same driver for multiple
functions is that it reduces code size, as you point out (though most of it
is boilerplate). Downside is that it takes visibility away from the subsystem
maintainer, and will result in the maintainer not reviewing related code changes.
Worst case that can result in non-working code, as I have seen multiple times
with hwmon driver registrations from outside the hwmon subsystem.

Ultimately the question for me is how much the actual code is intertwined
with the other code in the driver. If there is little interaction,
I prefer a separate driver. If the code is heavily intertwined, ie if there
lots of calls from one block to the other, I prefer one driver. I tend
to use mfd if a piece of hardware has clearly separate functional blocks.

It is really a case-by-case call. In the given case, I would either leave
things alone (didn't hurt us so far) or at best to use exported function
calls, as I suggested earlier.

Guenter
