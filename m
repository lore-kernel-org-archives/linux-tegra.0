From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/tegra: Restore licensing consistency
Date: Wed, 12 Feb 2014 12:22:00 -0700
Message-ID: <52FBC9D8.3090505@wwwdotorg.org>
References: <1392190238-1717-1-git-send-email-treding@nvidia.com> <52FBA581.3000707@wwwdotorg.org> <20140212191340.GB2424@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140212191340.GB2424-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/12/2014 12:13 PM, Thierry Reding wrote:
> On Wed, Feb 12, 2014 at 09:46:57AM -0700, Stephen Warren wrote:
>> On 02/12/2014 12:30 AM, Thierry Reding wrote:
>>> The bulk of the Tegra DRM driver is GPL v2 licensed, but some of the new
>>> subdrivers were licensed under an MIT license. This was simply oversight
>>> on my part.
>>>
>>> One exception to this is the public header file that will eventually be
>>> used within libdrm. Since all the other headers in libdrm use the MIT
>>> license, do the same for Tegra.
>>
>> The series,
>> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> I guess this needs explicit acks from the following people outside
>> NVIDIA who touched these files:?
>>
>> Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org> (dsi.c)
>> Emil Goode <emilgoode-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (tegra_drm.h)
> 
> Does it? Those changes were mostly mechanical in nature, so I'm not sure
> if that qualifies them for having any bearing of the license of the
> file.
> 
> But if you insist I can resend with Wei and Emil on Cc.

Well, it seems simpler if you get an ack; that way it documents the
fact, and avoids any issues in the future, irrespective of whether those
changes convey (c) owderhsip or not.

I'd imagine you don't need a whole resend; just forward the email?
