From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [RFC PATCH 01/12] drm: Add a new mode flag: DRM_MODE_FLAG_PREFER_ONE_SHOT
Date: Tue, 12 May 2015 13:31:37 +0200
Message-ID: <CAKMK7uGdJthGg43qQ7AXMkmbMbsdhC+D6L+ohrkPreTi9cOXfA@mail.gmail.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
	<1431308311-4470-2-git-send-email-markz@nvidia.com>
	<20150511092743.GO15256@phenom.ffwll.local>
	<1431362096439.71223@nvidia.com>
	<20150512063558.GP15256@phenom.ffwll.local>
	<20150512082300.GA2386@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150512082300.GA2386@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 12, 2015 at 10:23 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, May 12, 2015 at 08:35:58AM +0200, Daniel Vetter wrote:
>> On Mon, May 11, 2015 at 04:34:57PM +0000, Mark Zhang wrote:
>> > I just want to make things easier. If we adding this in panel's meta
>> > data, it will be harder to make crtc gets this, since normally encoder
>> > talks with panel and crtc talks with encoder. But yes, adding this in
>> > panel's metadata makes more sense so if there is a better way to do
>> > that, I'm happy to do the changes.
>>
>> Adding something to the userspace ABI (which you've done here) because the
>> kernel-internals are designed in an awkward way right now is definitely
>> the wrong thing to do. With atomic you can easily add a bool
>> prefer_oneshot to drm_crtc_state to encode this. But I fear that with the
>> plain crtc helpers this just doesn't work properly. You could add a
>> driver-private internal in drm_display_mode->private_flags, but that might
>> clash with drivers existing use of this field.
>>
>> In any way, this is definitely not something to add to uapi headers. Hence
>> Nacked-by: me.
>
> Are there use-cases where one-shot mode is worse than continuous mode?
> I'm thinking games that run at full FPS and such. If so, exposing this
> to userspace is perhaps not a bad idea, albeit not via a mode flag. If
> userspace had a way to set the preference, it could do so depending on
> use-case.

If you have a case with jitter when the pageflips run at not-quite
60fps (just an example) then I think the kernel should cope with that
by disabling oneshot mode on its own. At least that's what i915 does.
Different story once we'll get variable refresh-rate support, but I
think that's an entirely different beast.

Also we don't need this as a mode flag, an atomic prop seems better
suited. Especially since the atomic prop avoids the mode_changed logic
of the helpers (which we want, no need to flicker when updating such a
hint), wheres anything that changes the mode will force a full modeset
by default.

Also if you expose this to userspace, you need userspace to use it
before merging.

drm_display_mode->private_flags still looks like the most suitable place.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
