From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: add EMC clock scaling API
Date: Mon, 17 Dec 2012 14:57:24 -0700
Message-ID: <50CF9544.2090108@wwwdotorg.org>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de>  <1355516086-11116-2-git-send-email-dev@lynxeye.de>  <50CF8D51.6020208@wwwdotorg.org> <1355780639.1490.22.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355780639.1490.22.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/17/2012 02:43 PM, Lucas Stach wrote:
> Am Montag, den 17.12.2012, 14:23 -0700 schrieb Stephen Warren:
>> On 12/14/2012 01:14 PM, Lucas Stach wrote:
>>> This allows memory clients to collaboratively control the EMC
>>> performance.
>>> Each client may set its performance demands. EMC driver then tries to
>>> find a DRAM performance level which is able to statisfy all those
>>> demands.

>>> +static void tegra_emc_scale_clock(void)
>>
>>> +	clock_rate = bandwidth_floor >> 2; /* 4byte/clock */
>>
>> That assumes a 32-bit SDRAM interface. I'm sure that won't always be
>> true. Perhaps we should invent a #define for this so it stands out
>> slightly more if/when this needs to change later.
>>
> Hm, maybe we can add a DT property within the EMC node for this.

I expect you can derive the memory bus width from a combination of the
HW version and current register settings.
