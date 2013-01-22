From: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Tue, 22 Jan 2013 18:27:24 +0100
Message-ID: <50FECBFC.8080307@gmail.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de> <50FE4E4F.6080506@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50FE4E4F.6080506-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 22.01.13 09:31, Terje Bergstr=F6m wrote:
> On 14.01.2013 18:06, Thierry Reding wrote:
>> +static int tegra_dc_page_flip(struct drm_crtc *crtc, struct drm_fra=
mebuffer *fb,
>> +			      struct drm_pending_vblank_event *event)
>> +{
>> +	struct tegra_framebuffer *newfb =3D to_tegra_fb(fb);
>> +	struct tegra_dc *dc =3D to_tegra_dc(crtc);
>> +	struct drm_device *drm =3D crtc->dev;
>> +	unsigned long flags;
>> +
>> +	if (dc->event)
>> +		return -EBUSY;

Hi

I haven't read the Tegra programming manual or played with this, so=20
maybe i'm wrong for some reason, but i think there is a race here=20
between actual pageflip completion - latching newfb into the scanout=20
base register and the completion routine that gets called from the=20
vblank irq handler.

If this code gets called close to vblank or inside vblank, couldn't it=20
happen that tegra_dc_set_base() programs a pageflip that gets executed=20
immediately - the new fb gets latched into the crtc, but the=20
corresponding vblank irq handler for the vblank of flip completion runs=
=20
before the "if (event)" block can set dc->event =3D event;? Or vblank=20
irq's are off because drm_vblank_get() is only called at the end of the=
=20
routine? In both cases the completion routine would miss the correct=20
vblank and only timestamp and emit the completion event 1 vblank after=20
actual flip completion.

In that case it would be better to place tegra_dc_set_base() after the=20
"if (event)" block and have some check inside the flip completion=20
routine to make sure the pageflip completion event is only emitted if=20
the scanout is really already latched with the newfb.

thanks,
-mario

>> +
>> +	tegra_dc_set_base(dc, 0, 0, newfb);
>> +
>> +	if (event) {
>> +		event->pipe =3D dc->pipe;
>> +
>> +		spin_lock_irqsave(&drm->event_lock, flags);
>> +		dc->event =3D event;
>> +		spin_unlock_irqrestore(&drm->event_lock, flags);
>> +
>> +		drm_vblank_get(drm, dc->pipe);
>> +	}
>> +
>> +	return 0;
>> +}
>
