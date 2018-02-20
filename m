From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2] watchdog: add SPDX identifiers for watchdog subsystem
Date: Tue, 20 Feb 2018 07:13:43 -0800
Message-ID: <48db897e-8a61-a5bc-5a61-56349cafaa10@roeck-us.net>
References: <20180220104542.32286-1-marcus.folkesson@gmail.com>
 <20180220124955.GA17814@sophia> <20180220132103.GD24311@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180220132103.GD24311-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Sylvain Lemieux <slemieux.tyco@gmail.>
List-Id: linux-tegra@vger.kernel.org

On 02/20/2018 05:21 AM, Marcus Folkesson wrote:
> Hello William,
> 
> On Tue, Feb 20, 2018 at 07:49:55AM -0500, William Breathitt Gray wrote:
>> On Tue, Feb 20, 2018 at 11:45:31AM +0100, Marcus Folkesson wrote:
>>> - Add SPDX identifier
>>> - Remove boiler plate license text
>>> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>>>   license
>>>
>>> Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Acked-by: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
>>> Acked-by: Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>
>>> Acked-by: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>> Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>
>>> Notes:
>>>     v2:
>>>     	- Put back removed copyright texts for meson_gxbb_wdt and coh901327_wdt
>>>     	- Change to BSD-3-Clause for meson_gxbb_wdt
>>>     v1: Please have an extra look at meson_gxbb_wdt.c
>>
>> [...]
>>
>>> diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc-c384_wdt.c
>>> index 2170b275ea01..c173b6f5c866 100644
>>> --- a/drivers/watchdog/ebc-c384_wdt.c
>>> +++ b/drivers/watchdog/ebc-c384_wdt.c
>>> @@ -1,15 +1,8 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> /*
>>>   * Watchdog timer driver for the WinSystems EBC-C384
>>>   * Copyright (C) 2016 William Breathitt Gray
>>>   *
>>> - * This program is free software; you can redistribute it and/or modify
>>> - * it under the terms of the GNU General Public License, version 2, as
>>> - * published by the Free Software Foundation.
>>> - *
>>> - * This program is distributed in the hope that it will be useful, but
>>> - * WITHOUT ANY WARRANTY; without even the implied warranty of
>>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>> - * General Public License for more details.
>>>   */
>>> #include <linux/device.h>
>>> #include <linux/dmi.h>
> 
> Thank you for your feedback!
>>
>> I have no problem with adding a SPDX line to the top of this file, but
>> use "SPDX-License-Identifier: GPL-2.0-only" as I was very intentional
>> with the selection of GPL version 2 only when I published this code.
> 
> SPDX-License-Identifier: GPL-2.0
> Is GPL-2.0 only [1], so it respects your choice of license.
> 
>>
>> Furthermore, please do not remove the existing copyright text; although
> 

It is not a matter if you CAN keep a copyright. You MUST NOT remove a copyright.
As long as you do, the series is

Nacked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Guenter

> The copyright text:
> 
>   Copyright (C) 2016 William Breathitt Gray
> 
> Is still in the file.
> 
> 
>> it's just boilerplate for some, I was careful with the selection of
>> these words, and I worry the SPDX line only -- despite its useful
>> conciseness -- may lead to misunderstandings about my intentioned
>> license for this code.
> 
> I'm not sure I understand your concerns here, the SPDX identifier is
> a shorthand for the GPL 2.0 only license. See [1] - Linux kernel licensing rules.
> 
> One of the biggest benefits with SPDX identifier is that it is hard to verify
> boiler plate licenses due to formatting, types, different formulations and so on.
> 
> If still worrying, I think we could keep the license text as
> well.
> 
>>
>> For the time being, I can't Ack this patch with the changes it makes
>> currently:
>>
>>          Nacked-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> William Breathitt Gray
> 
> Please let me know if I got you wrong at some point.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/license-rules.rst
> 
> Best regards
> Marcus Folkesson
> 
