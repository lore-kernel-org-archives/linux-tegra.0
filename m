From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 4/6] ARM: firmware: add prepare_idle() operation
Date: Fri, 14 Feb 2014 11:42:50 +0100
Message-ID: <52FDF32A.1040809@samsung.com>
References: <1391747706-1847-1-git-send-email-acourbot@nvidia.com>
 <1391747706-1847-5-git-send-email-acourbot@nvidia.com>
 <52FCA5FC.80504@samsung.com> <52FDA6B4.6070404@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <52FDA6B4.6070404-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.02.2014 06:16, Alexandre Courbot wrote:
> On 02/13/2014 08:01 PM, Tomasz Figa wrote:
>> Hi Alexandre,
>>
>> On 07.02.2014 05:35, Alexandre Courbot wrote:
>>> Some firmwares do not put the CPU into idle mode themselves, but still
>>> need to be informed that the CPU is about to enter idle mode before this
>>> happens. Add a prepare_idle() operation to the firmware_ops structure to
>>> handle such cases.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>    arch/arm/include/asm/firmware.h | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>
>> I wonder if .do_idle() couldn't simply return an appropriate error code
>> to let the upper layer know that it should proceed with normal CPU idle
>> activation, while still letting the firmware know that the CPU is going
>> to idle.
>
> In our particular case I agree it would be enough to use do_idle() to
> let the firmware know about the operation and have it return -ENOSYS so
> the kernel actually performs it. I'm afraid this might not fulfill all
> needs though (e.g. one can imagine a firmware where the OS needs to take
> action between the notification and the actual shutdown), and as Stephen
> pointed out that would make the name of the function ambiguous at best.
> I'd rather keep it the current way for clarity.
>

OK. I'm not strongly against this, just wanted some more thought on 
this, so please move on.

Best regards,
Tomasz
