From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 4/4] Increate USB timeout value
Date: Wed, 9 Mar 2016 10:41:22 -0700
Message-ID: <56E06042.2060604@wwwdotorg.org>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-5-git-send-email-jimmzhang@nvidia.com>
 <56DDD90B.1040802@wwwdotorg.org>
 <973e4d88a8a24062964655a6ec3b2c71@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <973e4d88a8a24062964655a6ec3b2c71-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/08/2016 06:41 PM, Jimmy Zhang wrote:
>
>
>> -----Original Message-----
>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>> Sent: Monday, March 07, 2016 11:40 AM
>> To: Jimmy Zhang
>> Cc: Allen Martin; Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org; linux-
>> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [tegrarcm PATCH v1 4/4] Increate USB timeout value
>>
>> On 03/04/2016 04:44 PM, Jimmy Zhang wrote:
>>> It has been observed that some times USB time out could occure when a
>>> long (3ft) usb cable is connected to recovery mode usb port
>>
>> This explanation makes no sense. 3ft is practically the shortest USB cable
>> anyone would use. Equally, assuming a compliant correctly functioning cable,
>> cable length doesn't affect the time it takes to execute transactions.
>>
>> Is the issue more that if a low quality cable is used, then there are lots of
>> transfer errors, and the time taken for retries is large? If so, there's not much
>> guarantee that a larger timeout would help in general, since there's no
>> guarantee of any upper bound on the time it takes for a packet not to get
>> corrupted in this case. Still, I suppose it's fine to increase the timeout to
>> account for when it accidentally works.
>>
>> In summary: a commit description that more accurately represents the
>> problem being solved is required.
>
> We have seen this problem since T30/T114. Initially we just retried by downloading again. It may work after a few tries. Later, we found a simple solution is replacing with a shorter cable. Then one day, for testing purpose, when the timeout value was replaced with 0, ie, unlimited timeout, all cables work fine. So, it may worth to figure out the root cause.

There's obviously some variability here, since you mention that the 
communication works sometimes and not others.

When you tested the varying cable lengths, did you test at least 10x 
more times than the percentage of times that pass or fail with the 
original cable you used? Without testing a large number of times, you 
don't know if you just got lucky the one time you tried a different 
cable, or whether it really made a statistical difference.

Much more likely is that Tegra itself sometimes takes more time to 
respond, or sometimes receives/sends packets that get corrupted 
somewhere and have to be retried.

BTW, have you tried using Wireshark and usbmon to capture a trace of the 
failures to try and diagnose the issue?

Finally, I'm not objecting to this patch if it does work around the 
problem. All I'm objecting to is blaming the issue on cable length when 
I'm not convinced that's been conclusively proven. A simple message such 
as the following would work:

RCM communication sometimes fails if the USB timeout is short. Increase 
the timeout value to avoid this issue. The exact cause is not yet diagnosed.
