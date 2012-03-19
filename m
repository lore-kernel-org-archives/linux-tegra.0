From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Include assembler.h in sleep.S to fix build
 break
Date: Mon, 19 Mar 2012 10:56:32 -0600
Message-ID: <4F676540.8060903@wwwdotorg.org>
References: <1332175831-5900-1-git-send-email-swarren@wwwdotorg.org> <4F6764B6.6050109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F6764B6.6050109-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/19/2012 10:54 AM, Rob Herring wrote:
> On 03/19/2012 11:50 AM, Stephen Warren wrote:
>> Commit 6f6f6a7 "ARM: create a common IOMEM definition" moved macro
>> IOMEM(), and requires users to include <asm/assembler.h>. Fix Tegra's
>> sleep.S to do so.
>>
>> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> ---
>>  arch/arm/mach-tegra/sleep.S |    3 +++
>>  1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/sleep.S b/arch/arm/mach-tegra/sleep.S
...
>> +#include <asm/assembler.h>
>> +
> 
> Is there some reason you put this before linux/ include?

No. I just misremembered which order linux/ and asm/ should go in. Do
you want me to repost?

>>  #include <linux/linkage.h>
>> +
>>  #include <mach/io.h>
>>  #include <mach/iomap.h>
