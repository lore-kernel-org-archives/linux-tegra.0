From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] drm: do not use device name as a format string
Date: Mon, 7 Dec 2015 12:46:52 +0100
Message-ID: <20151207114652.GC10243@phenom.ffwll.local>
References: <1447869498-13277-1-git-send-email-nicolas.iooss_linux@m4x.org>
 <5662B24E.4090202@m4x.org>
 <20151206093559.GT10243@phenom.ffwll.local>
 <56640B00.7040100@m4x.org>
 <20151207074312.GU10243@phenom.ffwll.local>
 <874mfuzite.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <874mfuzite.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>, Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 07, 2015 at 11:53:01AM +0200, Jani Nikula wrote:
> On Mon, 07 Dec 2015, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
> > On Sun, Dec 06, 2015 at 11:16:32AM +0100, Nicolas Iooss wrote:
> >> On 12/06/2015 10:35 AM, Daniel Vetter wrote:
> >> >> On 11/18/2015 06:58 PM, Nicolas Iooss wrote:
> >> >>> drm_dev_set_unique() formats its parameter using kvasprintf() but many
> >> >>> of its callers directly pass dev_name(dev) as printf format string,
> >> >>> without any format parameter.  This can cause some issues when the
> >> >>> device name contains '%' characters.
> >> >>>
> >> >>> To avoid any potential issue, always use "%s" when using
> >> >>> drm_dev_set_unique() with dev_name().
> >> > 
> >> > Not sure this is worth it really, normally people don't place % characters
> >> > into their device names, ever. And if they do it'll blow up. There's also
> >> > no security issue here since userspace can't set this name.
> >> > 
> >> > If the maintainers of the affected drivers don't want this I won't merge
> >> > this patch.
> >> 
> >> Actually I had the same opinion before I began to add __printf
> >> attributes and "%s" in several places in the kernel to make
> >> -Wformat-security useful.  This led me to discover some funny issues
> >> like the one fixed by commit 3958b79266b1 ("configfs: fix kernel
> >> infoleak through user-controlled format string",
> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3958b79266b14729edd61daf9dfb84de45f4ec6d
> >> ).  The patch I sent is in fact a very small step towards making
> >> -Wformat-security useful again to detect "real" issues.
> >> 
> >> Of course, if you do not feel it is worth it and believe that dev_name
> >> is fully controlled by trusted sources which will never introduce any %
> >> character, I understand your will of not merging my patch.
> >
> > Ah, that's the context I was missing, that really should be in the commit
> > message. If this is part of an overall effort to enable something useful
> > it makes more sense to get it in.
> >
> > On the patch itself it feels rather funny to do a "%s", str); combo, maybe
> > we should have a drm_dev_set_unique_static instead? Including kerneldoc
> > explaining why there's too.
> 
> No caller of drm_dev_set_unique() actually uses the formatting for
> anything... so you'd end up with drm_dev_set_unique_static() and an
> orphaned drm_dev_set_unique()...

Ok, then I guess we can just ditch the printf stuff from set_unique.
Nicolas, you're up for that?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
