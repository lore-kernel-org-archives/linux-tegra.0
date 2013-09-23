From: "Christian Daudt" <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 00/26] ARM: provide common arch init for DT clocks
Date: Mon, 23 Sep 2013 11:41:11 -0700
Message-ID: <52408B47.3080801@broadcom.com>
References: <20130920191613.GA25191@ohporter.com>
 <523EDF16.10102@gmail.com> <52407E2A.7030001@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52407E2A.7030001-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, STEricsson <STEricsson_nomadik_linux-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 13-09-23 10:45 AM, Matt Porter wrote:
> On 09/22/2013 08:14 AM, Sebastian Hesselbarth wrote:
>> On 09/20/2013 09:16 PM, Matt Porter wrote:
>>> On Wed, Sep 18, 2013 at 07:53:33PM +0200, Sebastian Hesselbarth wrote:
>>>> This is a patch set based on an RFC [1][2] sent earlier to provide a
>>>> common
>>>> arch/arm init for DT clock providers. Currently, the call to
>>>> of_clk_init(NULL)
>>>> to initialize DT clock providers is spread among several mach-dirs.
>>>> Since most
>>>> machs require DT clocks initialized before timers, no initcall can be
>>>> used.
>> [...]
>>> Could you pick up the following patch for mach-bcm/ into this series?
>>>
>>> Thanks,
>>> Matt
>>>
>>>  From f65d048b3453447bb3e693cb21701c4d0c6375ed Mon Sep 17 00:00:00 2001
>>> From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Date: Fri, 20 Sep 2013 13:41:06 -0400
>>> Subject: [PATCH] ARM: bcm: Remove custom .time_init hook
>>>
>>> With arch/arm calling of_clk_init(NULL) and clocksource_of_init()
>>> this is no longer needed. The former is useful because we can make
>>> use of dummy fixed clocks for drivers until the bcm281xx common
>>> clock driver is ready.
>>>
>>> Signed-off-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Reviewed-by: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Reviewed-by: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>> As a v2 is required due to calling of_clk_init() breaks non-DT builds,
>> I will include this _if_ Christian actually gives his Acked-By.
>
> Understood. Ccing Christian's new email as it just changed.
Old one still works for this week :)
Acked-by: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

  Thanks,
    csd
