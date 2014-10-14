From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] clocksource: tegra: Register watchdog device
Date: Tue, 14 Oct 2014 13:00:45 -0600
Message-ID: <543D72DD.4000501@wwwdotorg.org>
References: <1413201922-4210-1-git-send-email-thierry.reding@gmail.com> <1413201922-4210-2-git-send-email-thierry.reding@gmail.com> <543C00E2.2090806@roeck-us.net> <20141014104218.GG18993@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141014104218.GG18993@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/14/2014 04:42 AM, Thierry Reding wrote:
> On Mon, Oct 13, 2014 at 09:42:10AM -0700, Guenter Roeck wrote:
>> On 10/13/2014 05:05 AM, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> The watchdog timer is part of the timer controller block on Tegra. In
>>> order to avoid access to the same registers from two drivers, register
>>> the watchdog device from the clocksource driver.
>>>
>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Does that really make sense ?
>>
>> A couple of callbacks into the clock driver to implement register accesses
>> might be a better approach.
>
> I guess that would be a valid approach as well. It has the downside of
> requiring the addition of at least two globally visible symbols to the
> kernel. It also means that we'd need to somehow pass around a struct
> device for diagnostic messages and so on. Dealing with all of that seems
> like much more of a burden than this.
>
> Also if you look at the diffstat this approach allows us to get rid of
> 80 lines of code. Adding a custom mechanism to share the register space
> would be more likely to result in a positive diffstat.

FWIW, (although I haven't read the patches), the general idea of 
registering a single driver for each HW block makes sense to me. While 
we've split up HW blocks into separate drivers in the past, I think 
that's just made things more complex without much benefit, so I think 
those decisions were a mistake in retrospect. If we do actually need to 
split things up into separate drivers, we should use MFD rather than 
multiple unrelated top-level drivers. That way, we will have a single 
top-level driver that gets instantiated from a single DT node (or 
platform device in a board file or ACPI thing or ...)
