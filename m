From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Boot hang due to "pipe: fold file_operations instances in one"
 in next-20130408
Date: Mon, 08 Apr 2013 15:36:06 -0600
Message-ID: <51633846.2040305@wwwdotorg.org>
References: <5163346B.5090602@wwwdotorg.org> <20130408212249.GT4068@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130408212249.GT4068-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/08/2013 03:22 PM, Al Viro wrote:
> On Mon, Apr 08, 2013 at 03:19:39PM -0600, Stephen Warren wrote:
>> Al,
>>
>> I'm seeing a boot hang on Tegra in next-20130408. Even sysrq on the
>> serial console doesn't work, yet I think cpuidle is still running since
>> the LED that shows CPU power is flickering.
>>
>> git bisect points at commit 9984d73 "pipe: fold file_operations
>> instances in one". Reverting
>> the-merge-of-the-branch-that-contains-this-patch from next-20130408
>> certainly solves the problem; reverting just that one patch is a bit
>> painful since it's in the middle of a bunch of other cleanup.
>>
>> Do you have any idea what might be wrong? I can't see anything obvious
>> in the patch.
> 
> What userland do you have?

It's Ubuntu 12.04.01 for ARM (armhf), with quite a few updates not
installed.
