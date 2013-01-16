From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Wed, 16 Jan 2013 07:31:25 -0600
Message-ID: <CAF6AEGtPC2NS74jszX6kbcqMmHcd4Fhsk5bVuYjk43gQN1kv+g@mail.gmail.com>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
	<1358178932-25505-6-git-send-email-thierry.reding@avionic-design.de>
	<CAKMK7uFMa-QwyZJo6QaxAAbpGeNvoNp_T19wF_uA1hr1d2KHog@mail.gmail.com>
	<20130115201705.GA25976@avionic-0098.adnet.avionic-design.de>
	<CAKMK7uEV_w5rfoUv3xdTdYra+UOCnirf5GUK+2L2pxifUxFVmw@mail.gmail.com>
	<20130116100149.GA13628@avionic-0098.adnet.avionic-design.de>
	<CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 16, 2013 at 6:36 AM, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
> On Wed, Jan 16, 2013 at 11:01 AM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>> drm_events_release() should be enough to clean up the events, but I
>> suspect the reason why Laurent put that code in was that the drm_crtc
>> private data still has a reference to the event and needs to clear it.
>> Otherwise the next page flip won't be scheduled because .page_flip()
>> would return -EBUSY.
>
> Hm, indeed we seem to have a nice bug in most drivers there :(
>
>> However, it seems like {tegra_dc,shmob_drm_crtc}_cancel_page_flip()
>> could both be simplified a lot and just set their event to NULL. Then
>> again, maybe keeping a separate reference isn't all that useful. Maybe
>> the better thing to do here is iterate over the list of pending VBLANK
>> events in *_finish_page_flip() and process each of them? That would
>> allow more than one user-space process to queue page flips.
>
> I think we need a slightly more generally useful solution, since most
> drivers are currently broken. I've read a bit through the code, but
> short of refcounting drm events and adding event->file_priv checks at
> relevent places I don't see a sane solution ... And even that one is
> rather invasive. Do you have an idea? Imo doing the cleanup in each
> driver will be rather error-prone, and since usually kms clients wait
> for flips to complete, also guaranteed to be little tested.

I suppose we could move the *pending_vblank_event to 'struct
drm_crtc'.. I think probably all/most drivers need the same thing
anyway.  If a driver needs to do something special, it could just
never set crtc->pending_vblank_event and instead do it's own cleanup.

BR,
-R

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
