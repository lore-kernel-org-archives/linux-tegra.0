From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Mon, 28 Nov 2016 09:26:32 +0000
Message-ID: <4d255a3e-0816-498c-a280-6d29ca880e13@nvidia.com>
References: <1479976734-30498-1-git-send-email-ldewangan@nvidia.com>
 <1479976734-30498-3-git-send-email-ldewangan@nvidia.com>
 <20161125095744.GB11512@ulmo.ba.sec> <583828D5.5060507@nvidia.com>
 <da7b815c-149c-6baf-6691-a038d3fe54bf@nvidia.com>
 <583879A8.7020401@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <583879A8.7020401-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/11/16 17:49, Laxman Dewangan wrote:
> 
> On Friday 25 November 2016 10:59 PM, Jon Hunter wrote:
>> On 25/11/16 12:04, Laxman Dewangan wrote:
>>> Thanks Thierry for review.
>>>
>>> On Friday 25 November 2016 03:27 PM, Thierry Reding wrote:
>>>> * PGP Signed by an unknown key
>>>>
>>>> On Thu, Nov 24, 2016 at 02:08:54PM +0530, Laxman Dewangan wrote:
>>>>> +      NVIDIA Tegra124/210 SoC has IO pads which supports
>>>>> multi-voltage
>>>>> +      level of interfacing and deep power down mode of IO pads. The
>>>>> +      voltage of IO pads are SW configurable based on IO rail of that
>>>>> +      pads on T210. This driver provides the interface to change
>>>>> IO pad
>>>>> +      voltage and power state via pincontrol interface.
>>>> This has a lot of chip-specific text. Will all of that have to be
>>>> updated if support for new chips is added?
>>> Then saying that Tegra124 and later..
>>> Hoping, people know our chip releasing sequence as numbering are not in
>>> sequence.
>>>
>>>>> +#include <linux/regulator/consumer.h>
>>>>> +#include <soc/tegra/pmc.h>
>>>> Have you considered moving this code into the PMC driver? It seems a
>>>> little over the top to go through all of the platform device creation
>>>> and driver registration dance only to call into a public API later on.
>>> Yes, we had discussion on this and suggestion came to use the pinctrl
>>> framework.
>>> If we do in the pmc driver then we will need lots of DT processing for
>>> getting information from DT which we can directly get from the pinctrl
>>> core framework.
>>> Also client driver may need to have the control dynamically and get the
>>> IO pads from DT. So implementing all in pmc will be huge duplication
>>> over already existing framework.
>> I don't follow. We already did something similar for the Tegra DPAUX
>> driver [0].
>>
>> Cheers
>> Jon
>>
>> [0]
>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/tegra/dpaux.c?id=0751bb5c44fe1aa9494ce259d974c3d249b73a84
>>
> 
> In the above dpaux driver,  you used the pinctrl framework and its core
> functionality for the device tree interfacing and client interfacing.
> 
> The same thing I am saying here, we should not avoid the pinctrl
> framework. The client driver will use the pinctrl framework for the IO
> pad configurations, not direct PMC APIs.

Exactly, so why are you saying that by moving the code into the PMC
driver this will "need lots of DT processing for getting information
from DT"? By moving the code, we are not suggesting we don't use the
pinctrl framework, we are just suggesting we move the code. That's all.

Jon

-- 
nvpublic
