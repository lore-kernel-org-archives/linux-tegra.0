From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 05/12] firmware: tegra: Add BPMP support
Date: Mon, 22 Aug 2016 12:56:52 -0600
Message-ID: <866add72-703b-86e1-6e3e-04dbfb872970@wwwdotorg.org>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <2059006.oN1pE0IkCo@wuerfel> <20160822140211.GE17367@ulmo.ba.sec>
 <5669893.Rd6yQObxH6@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5669893.Rd6yQObxH6@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/22/2016 08:42 AM, Arnd Bergmann wrote:
> On Monday, August 22, 2016 4:02:11 PM CEST Thierry Reding wrote:
>> On Mon, Aug 22, 2016 at 03:34:15PM +0200, Arnd Bergmann wrote:
>>> On Friday, August 19, 2016 7:32:26 PM CEST Thierry Reding wrote:
>>>> diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
>>>> new file mode 100644
>>>> index 000000000000..0aaef5960e29
>>>> --- /dev/null
>>>> +++ b/include/soc/tegra/bpmp-abi.h
>>>> +#ifndef _ABI_BPMP_ABI_H_
>>>> +#define _ABI_BPMP_ABI_H_
>>>> +
>>>> +#ifdef LK
>>>> +#include <stdint.h>
>>>> +#endif
>>>> +
>>>> +#ifndef __ABI_PACKED
>>>> +#define __ABI_PACKED __attribute__((packed))
>>>> +#endif
>>>> +
>>>> +#ifdef NO_GCC_EXTENSIONS
>>>> +#define EMPTY char empty;
>>>> +#define EMPTY_ARRAY 1
>>>> +#else
>>>> +#define EMPTY
>>>> +#define EMPTY_ARRAY 0
>>>> +#endif
>>>> +
>>>> +#ifndef __UNION_ANON
>>>> +#define __UNION_ANON
>>>> +#endif
>>>
>>> Maybe keep these all out of the kernel?
>>
>> This was discussed a little in an earlier posting. This header file is
>> maintained by the BPMP firmware team and using it verbatim means little
>> to no effort required to update it.
>
> The usual recommendation is to just use Linux coding style in shared
> files, and possibly add another header that provides the required
> definitions. Otherwise you end up with people randomly cleaning up
> the file later ;-)

That's just going to push the problem into all other operating systems; 
what happens when BSD, Windows, QNX, FreeRTOS, ... import this file and 
attempt to apply the same argument, but want the FW team to use their 
coding style?
