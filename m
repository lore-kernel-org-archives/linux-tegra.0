From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: delete empty sleep.S
Date: Wed, 03 Oct 2012 09:25:15 -0600
Message-ID: <506C58DB.2020307@wwwdotorg.org>
References: <1349220069-4051-1-git-send-email-swarren@wwwdotorg.org> <1349230006.3783.7.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1349230006.3783.7.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/02/2012 08:06 PM, Joseph Lo wrote:
> On Wed, 2012-10-03 at 07:21 +0800, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> sleep.S doesn't provide anything useful any more; commit b4e395b "ARM:
>> tegra: Remove flow controller programming" removed the last public code
>> here, so that everyting that was left was just macros or #includes.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
> 
> Hi Stephen,
> 
> Just let you know.
> I may update this file later for CPU idle LP2 support. Anyway, it's OK
> to me to re-add this file when introducing CPU idle LP2 support as well.

Wouldn't the code go in sleep-t20.S, sleep-t30.S, or cpuidle.c anyway?

But yes, I think removing the file until there's actually content should
be fine.
