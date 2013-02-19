From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Broken build due to 6aed8ec "drm: review locking for drm_fb_helper_restore_fbdev_mode"
Date: Tue, 19 Feb 2013 12:29:38 -0700
Message-ID: <5123D2A2.5050301@wwwdotorg.org>
References: <5123BADC.2050807@wwwdotorg.org> <CAKMK7uG=x4ESF_uVUwvK+0kzvsXEgZBtM9Z6_Qrm6keSasoCbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKMK7uG=x4ESF_uVUwvK+0kzvsXEgZBtM9Z6_Qrm6keSasoCbA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/19/2013 11:56 AM, Daniel Vetter wrote:
> On Tue, Feb 19, 2013 at 6:48 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> Daniel,
>>
>> Commit 6aed8ec "drm: review locking for
>> drm_fb_helper_restore_fbdev_mode" (now in next-20130218 and later)
>> causes build failures for tegra_defconfig. The issue is this part of the
>> patch:
> 
> You need to yell at Dave Airlie:
> 
> https://patchwork.kernel.org/patch/2162391/

Ah, thanks, that solves it.

I guess that was too new for Google to find, and I'm not on dri-devel so
it wasn't in my mailbox.
