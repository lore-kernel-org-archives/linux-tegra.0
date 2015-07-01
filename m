From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 12/12] JUST FOR TEST: Add one-shot trigger to update
 display
Date: Wed, 1 Jul 2015 20:51:29 +0800
Message-ID: <5593E251.8090802@nvidia.com>
References: <1435738915-31973-1-git-send-email-markz@nvidia.com> <1435738915-31973-13-git-send-email-markz@nvidia.com> <20150701083617.GF30960@phenom.ffwll.local> <20150701084511.GA24055@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150701084511.GA24055-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/01/2015 04:46 PM, Daniel Vetter wrote:
> On Wed, Jul 01, 2015 at 10:36:17AM +0200, Daniel Vetter wrote:
>> On Wed, Jul 01, 2015 at 04:21:55PM +0800, Mark Zhang wrote:
>>> This HACK adds a workqueue to refresh the display periodically.
>>> This is used just for testing.
>>
>> ->dirty is the drm hook you're looking for, it's meant to flush out any
>> frontbuffer rendering. Generic kms clients using the dumb buffers (e.g.
>> fedora boot splash) use this already.
>>
>> And of course you need to upload a new frame every time an (atomic) flip
>> happens too, but I guess you have that already. No need at all for a
>> periodic upload hack like this.
> 
> btw the nice thing with dirty is that it hands you the exact invalidation
> rectangle, which means you can minimize uploads. For atomic flips we plan
> to have the same, but it's not implemented yet.
> 
> Another problem is that currently the fbdev helper in drm_fb_helper.c
> doesn't support the dirty callback. But there's other drivers which need
> this too (e.g. i915 will gain a dirty callback soon) and qxl has all the
> code implemented already. So the only thing you need to do is move the qxl
> code into drm_fb_helper.c and adapt it to use the dirty callback instead
> of directly calling qxl code. Then you should be all set. Note that simply
> calling ->dirty from fbdev hooks doesn't work since a lot of those hooks
> are called from irq context (cursors and stuff) and hence you need a
> workqueue to do the actual dirty call.
> 

I got it. So this is the kernel part I need. Thanks.

Mark
> Cheers, Daniel
> 
