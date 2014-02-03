From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1] ARM: tegra: add nvidia,wdt-timer-id optional property
Date: Mon, 03 Feb 2014 14:26:44 -0700
Message-ID: <52F00994.7080701@wwwdotorg.org>
References: <1391204811-6293-1-git-send-email-achew@nvidia.com> <20140203171053.GA28338@e106331-lin.cambridge.arm.com> <643E69AA4436674C8F39DCC2C05F763863199852CA@HQMAIL03.nvidia.com> <52F005A0.4080807@wwwdotorg.org> <643E69AA4436674C8F39DCC2C05F7638631998538B@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F7638631998538B-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "katierh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <katierh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/03/2014 02:16 PM, Andrew Chew wrote:
>> On 02/03/2014 11:59 AM, Andrew Chew wrote:
>>>> On Fri, Jan 31, 2014 at 09:46:51PM +0000, Andrew Chew wrote:
>>>>> This optional property can be used to specify which timers are to be
>>>>> used for hardware watchdog timeouts (via a tegra wdt driver).
>>>>
>>>> Is there any reason that a particular timer should be used?
>>>
>>> I worry about colliding with other timer allocations, and wanted to be
>>> flexible in this regard.
>>
>> Are the other timer allocations represented in DT, or simply made by or hard-
>> coded in the driver? If the former, this property seems like a good equivalent
>> of any existing allocations. If the latter, can't the driver just allocate or hard-
>> code the allocation in the same way as any existing allocations?
> 
> From what I've seen, timer allocations are just hard-coded into whatever driver.
> I didn't think this was a particularly good idea, since when writing other drivers
> that for some reason need a timer, the author has to be aware of allocations
> made in other, barely related drivers.

I'm not sure that they would; why wouldn't the timer driver register the
various timers with standard Linux APIs which the clients talk to, thus
avoiding the clients having any knowledge at all of which channels are
used for what.

If you're talking about the watchdog driver, then can't we just create a
shared header file that the clocksource and watchdog drivers both
include, which defines the timer ID allocations?
