From: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Fri, 15 Feb 2013 23:34:26 +0100
Message-ID: <511EB7F2.4070603@gmail.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de> <50FE4E4F.6080506@nvidia.com> <50FECBFC.8080307@gmail.com> <20130211090001.GA3423@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130211090001.GA3423-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/11/2013 10:00 AM, Thierry Reding wrote:
> On Tue, Jan 22, 2013 at 06:27:24PM +0100, Mario Kleiner wrote:
>> On 22.01.13 09:31, Terje Bergstr=C3=B6m wrote:
>>> On 14.01.2013 18:06, Thierry Reding wrote:
>>>> +static int tegra_dc_page_flip(struct drm_crtc *crtc, struct drm_f=
ramebuffer *fb,
>>>> +			      struct drm_pending_vblank_event *event)
>>>> +{
>>>> +	struct tegra_framebuffer *newfb =3D to_tegra_fb(fb);
>>>> +	struct tegra_dc *dc =3D to_tegra_dc(crtc);
>>>> +	struct drm_device *drm =3D crtc->dev;
>>>> +	unsigned long flags;
>>>> +
>>>> +	if (dc->event)
>>>> +		return -EBUSY;
>> Hi
>>
>> I haven't read the Tegra programming manual or played with this, so
>> maybe i'm wrong for some reason, but i think there is a race here
>> between actual pageflip completion - latching newfb into the scanout
>> base register and the completion routine that gets called from the
>> vblank irq handler.
>>
>> If this code gets called close to vblank or inside vblank, couldn't
>> it happen that tegra_dc_set_base() programs a pageflip that gets
>> executed immediately - the new fb gets latched into the crtc, but
>> the corresponding vblank irq handler for the vblank of flip
>> completion runs before the "if (event)" block can set dc->event =3D
>> event;? Or vblank irq's are off because drm_vblank_get() is only
>> called at the end of the routine? In both cases the completion
>> routine would miss the correct vblank and only timestamp and emit
>> the completion event 1 vblank after actual flip completion.
>>
>> In that case it would be better to place tegra_dc_set_base() after
>> the "if (event)" block and have some check inside the flip
>> completion routine to make sure the pageflip completion event is
>> only emitted if the scanout is really already latched with the
>> newfb.
> An easier solution might be to expand the scope of the lock a bit to
> encompass the call to tegra_dc_set_base() and extend until the end of
> tegra_dc_page_flip(). That should properly keep the page-flip complet=
ion
> from interfering, right?
>
> 	spin_lock_irqsave(&drm->event_lock, flags);
>
> 	tegra_dc_set_base(dc, 0, 0, newfb);
>
> 	if (event) {
> 		event->pipe =3D dc->pipe;
> 		dc->event =3D event;
> 		drm_vblank_get(drm, dc->pipe);
> 	}
>
> 	spin_unlock_irqrestore(&drm->event_lock, flags);
>
> Thierry
Yes, that would avoid races between page flip ioctl and the irq handler=
=2E=20
But i think the tegra_dc_set_base() should go below the if (event) {}=20
block, before the spin_unlock_irqrestore() so you can be sure that=20
drm_vblank_get() has been called before tegra_dc_set_base() is executed=
=2E=20
Otherwise vblank irq's may be off during the vblank in which the=20
tegra_dc_set_base() takes effect and a flip complete would only get=20
reported one scanout cycle later at the next vblank -> You'd signal a=20
pageflip completion 1 frame too late.

You also still need to check in tegra_dc_finish_page_flip() if the new=20
scanout buffer has really been latched before emitting the flip complet=
e=20
event. Otherwise it could happen that your execution of=20
tegra_dc_page_flip() intersects with the vblank interval and manages to=
=20
queue the event in time, so the finish_page_flip picks it up, but the=20
register programming in tegra_dc_set_base() happened a bit too late, so=
=20
it doesn't get latched in the same vblank but one vblank later --> You'=
d=20
signal pageflip completion 1 frame too early.

I've just downloaded the Tegra-3 TRM and had a quick look. Section=20
20.5.1 "Display shadow registers". As far as i understand, if dc->event=
=20
is pending in tegra_dc_finish_page_flip(), you could read back the=20
ACTIVE copy of DC_WINBUF_START_ADDR by setting READ_MUX properly in=20
DC_CMD_STATE_ACCESS_0, and compare its value against the ARM copy in=20
DC_WINBUF_A_START_ADDR_NS_0. If both values match, the pageflip has=20
happened and the dc->event can be dequeued and emitted.

That assumes that the ARM copy is latched into the ACTIVE copy only at=20
leading edge of vblank. Section 20.5.1 says "...latching happens on the=
=20
next frame boundary after (GENERAL/WIN_A/WIN_B/WIN_C)_ACT_REQ is=20
programmed..." - not totally clear to me if this is the same as start o=
f=20
vblank?

-mario
