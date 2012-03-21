From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Include assembler.h in sleep.S to fix build
 break
Date: Wed, 21 Mar 2012 10:15:49 -0600
Message-ID: <4F69FEB5.2020901@wwwdotorg.org>
References: <1332176863-12537-1-git-send-email-swarren@wwwdotorg.org> <4F677691.8020307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F677691.8020307-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/19/2012 12:10 PM, Rob Herring wrote:
> On 03/19/2012 12:07 PM, Stephen Warren wrote:
>> Commit 6f6f6a7 "ARM: create a common IOMEM definition" moved macro
>> IOMEM(), and requires users to include <asm/assembler.h>. Fix Tegra's
>> sleep.S to do so.
>>
>> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> 
> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Arnd,

Can you pick up this fix directly into arm-soc, or do you want me to
generate a pull request for this kind of thing too?

ARM: tegra: Include assembler.h in sleep.S to fix build break
http://patchwork.ozlabs.org/patch/147587/

The same goes for:

ARM: tegra: Fix device tree AUXDATA for USB/EHCI
http://patchwork.ozlabs.org/patch/147616/

Thanks.
