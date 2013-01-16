From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Wed, 16 Jan 2013 10:43:15 +0100
Message-ID: <CAKMK7uEV_w5rfoUv3xdTdYra+UOCnirf5GUK+2L2pxifUxFVmw@mail.gmail.com>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
	<1358178932-25505-6-git-send-email-thierry.reding@avionic-design.de>
	<CAKMK7uFMa-QwyZJo6QaxAAbpGeNvoNp_T19wF_uA1hr1d2KHog@mail.gmail.com>
	<20130115201705.GA25976@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130115201705.GA25976-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 15, 2013 at 9:17 PM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> On Tue, Jan 15, 2013 at 06:53:19PM +0100, Daniel Vetter wrote:
>> On Mon, Jan 14, 2013 at 4:55 PM, Thierry Reding
>> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>> > +static void tegra_drm_preclose(struct drm_device *drm, struct drm_file *file)
>> > +{
>> > +       struct drm_crtc *crtc;
>> > +
>> > +       list_for_each_entry(crtc, &drm->mode_config.crtc_list, head)
>> > +               tegra_dc_cancel_page_flip(crtc, file);
>> > +}
>> > +
>>
>> Why that? If userspace dies while a flip is outstanding, it's imo ok
>> to execute it - otherwise there might be an accounting mismatch if the
>> hw still scans out the old fb, but drm believes the new one is used.
>> Or do I miss something?
>
> I looked at the shmobile driver for inspiration and they do this as
> well. Doing so seemed reasonable since there'd be no file to deliver the
> event to.

Hm, is the code in drm_events_release not good enough? And if it's
buggy, we need to fix it. Also adding Laurent to figure out why he
added that code in shmob ...

>> The reason I've skimmed through the patches is to check for
>> implications with my modeset locking rework. Review on that would be
>> highly appreciated ...
>
> I'm not sure how suited I am for review given my limited experience, but
> I'll see if I can make some time to take a look.

The commit message should nicely explain why I've picked the design
and the various implications for drivers. So just checking whether
anything collides with your upcoming stuff would be good ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
