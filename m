From: Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T kernel_noload
Date: Wed, 29 Feb 2012 10:33:58 -0800
Message-ID: <4F4E6F96.8080907@am.sony.com>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com> <20120229122942.GF3318@game.jcrosoft.org> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF206A@HQMAIL01.nvidia.com> <20120229181430.GI3318@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120229181430.GI3318-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/29/2012 10:14 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 08:58 Wed 29 Feb     , Stephen Warren wrote:
>> Jean-Christophe PLAGNIOL-VILLARD wrote at Wednesday, February 29, 2012 5:30 AM:
>>> On 17:03 Tue 28 Feb     , Stephen Warren wrote:
>>>> uImage files typically encode a single absolute load and entry address.
>>>> This is inconvenient when attempting to share that uImage across multiple
>>>> SoCs with different physical RAM addresses. Recent versions of mkimage
>>>> implement a "kernel_noload" image type which encodes no absolute load
>>>> address, and a relative entry address. This works well for uImage-wrapped
>>>> ARM zImages, since they are relocatable.
>>>>
>>>> This is enabled by commit b9b50e89d317c58becd0e2d7fac2e21e3a81dd0a
>>>> "image: Implement IH_TYPE_KERNEL_NOLOAD" in U-Boot.
>>>>
>>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>> I assume I should put this into the ARM patch tracker if it's OK?
>>>
>>> Again a new option for uImage no why not just boot the zImage
>>>
>>> in this case the uImage is useless
>>
>> U-Boot doesn't support zImage at present.
>>
>> A patch was posted to support it at least for ARM, but needed a little
>> work before it could be committed.
> Sorry I see no advantage to have the uImage build by the kernel anymore as
> we have a relocatable zImage
> 
> I'll even drop its support

This seems at least premature, and possibly ill-advised in general.
There are lots of U-Boot images out in the field, many of which that
are rarely updated. A lot of workflow will be disrupted unnecessarily
by a change like this.

Could you wait to drop uImage build support in the kernel until
U-Boot supports zImage, and has worked it's way into the field
for a few years?
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
