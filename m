From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Sat, 02 Feb 2013 00:01:22 +0100
Message-ID: <23857788.jLhG4Zemr2@avalon>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de> <20130116100149.GA13628@avionic-0098.adnet.avionic-design.de> <CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 16 January 2013 13:36:17 Daniel Vetter wrote:
> On Wed, Jan 16, 2013 at 11:01 AM, Thierry Reding wrote:
> > drm_events_release() should be enough to clean up the events, but I
> > suspect the reason why Laurent put that code in was that the drm_crtc
> > private data still has a reference to the event and needs to clear it.
> > Otherwise the next page flip won't be scheduled because .page_flip()
> > would return -EBUSY.
> 
> Hm, indeed we seem to have a nice bug in most drivers there :(

That's not the only reason.

drm_events_release() handles vblank events added to the vblank_event_list. 
That list only contains vblank events added by drm_queue_vblank_event(), only 
called by drm_wait_vblank(). Page flip events never get there, so they need to 
be cleaned up manually.

I wrote in the DRM documentation, in the page flipping section,

"FIXME: Could drivers that don't need to wait for rendering to complete just 
add the event to dev->vblank_event_list and let the DRM core handle 
everything, as for "normal" vertical blanking events?"

We should investigate that.

> > However, it seems like {tegra_dc,shmob_drm_crtc}_cancel_page_flip()
> > could both be simplified a lot and just set their event to NULL. Then
> > again, maybe keeping a separate reference isn't all that useful. Maybe
> > the better thing to do here is iterate over the list of pending VBLANK
> > events in *_finish_page_flip() and process each of them? That would
> > allow more than one user-space process to queue page flips.
> 
> I think we need a slightly more generally useful solution, since most
> drivers are currently broken. I've read a bit through the code, but
> short of refcounting drm events and adding event->file_priv checks at
> relevent places I don't see a sane solution ... And even that one is
> rather invasive. Do you have an idea? Imo doing the cleanup in each
> driver will be rather error-prone, and since usually kms clients wait
> for flips to complete, also guaranteed to be little tested.

-- 
Regards,

Laurent Pinchart
