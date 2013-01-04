From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 05/11] ARM: dt: tegra30: Add device node for APB MISC
Date: Fri, 4 Jan 2013 09:56:28 +0530
Message-ID: <50E659F4.7020009@nvidia.com>
References: <1356619644-18565-1-git-send-email-pgaikwad@nvidia.com> <1356619644-18565-6-git-send-email-pgaikwad@nvidia.com> <50E4AE19.1060503@wwwdotorg.org> <50E520FC.4070805@nvidia.com> <50E5ADA6.1070904@wwwdotorg.org> <50E634D0.6080702@nvidia.com> <50E6470E.8090206@wwwdotorg.org> <50E64B18.8060806@nvidia.com> <50E653E3.5060901@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E653E3.5060901-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 04 January 2013 09:30 AM, Stephen Warren wrote:
> On 01/03/2013 08:23 PM, Prashant Gaikwad wrote:
>> On Friday 04 January 2013 08:35 AM, Stephen Warren wrote:
>>> On 01/03/2013 06:48 PM, Prashant Gaikwad wrote:
>>>> On Thursday 03 January 2013 09:41 PM, Stephen Warren wrote:
> ...
>>>>> OK. It sounds like we need a true APB MISC driver then, to abstract the
>>>>> differences; the clock driver really shouldn't be touching the APB MISC
>>>>> registers in all likelihood, unless a subset of the sections you
>>>>> mention
>>>>> above are truly dedicated to clock functionality.
>>>> I don't think it is a good idea to create a driver for APB MISC, all
>>>> registers are used by different drivers.
>>> Well, it's even worse to have a bunch of other drivers randomly trample
>>> on a set of registers they don't own.
>>>
>>>> Only chip id revision registers are used in clock driver.
>>> There are already global variables exposed by the Tegra fuse driver; can
>>> you just read those?
>> It is not about variables or some value, we have to read some apb
>> register to flush the write operation in apb bus before we disable
>> peripheral clock.
>> We are using chip id revision register for this purpose.
> Ah. That's definitely not something the clock driver should be doing
> directly. It's probably OK to add a custom Tegra-specific function to
> some file in arch/arm/mach-tegra to implement this. Even better would be
> a full bus driver for the APB bus, but that's probably too much bloat
> for now.

tegra_init_fuse in arch/arm/mach-tegra/fuse.c is already reading chip id 
revision register, so I can implement one function to read this register 
in fuse.c, which will be used by clock driver and tegra_init_fuse.
But then we need to add it to some header file in include/mach or 
include/linux, where? any suggestion?
