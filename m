From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 4/5] drm/tegra: Implement VBLANK support
Date: Wed, 30 Jan 2013 13:36:03 +0100
Message-ID: <CAKMK7uHo9inMzKXqpnH9+H7Tm+nnChGUXE+mGA51L0fNrwoX0Q@mail.gmail.com>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
	<1358178932-25505-5-git-send-email-thierry.reding@avionic-design.de>
	<CADWT_cPtdmSF+_ybe70ZY_z5idzr0KQe94r57ok-Hf-V22wixA@mail.gmail.com>
	<20130130083453.GA21322@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130130083453.GA21322-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Jon Mayo <jon-MQ+mZzckBGs@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 30, 2013 at 9:34 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> On Tue, Jan 22, 2013 at 10:21:40AM -0800, Jon Mayo wrote:
>> On Mon, Jan 14, 2013 at 7:55 AM, Thierry Reding
>> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>> > Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
>> > special in this case because it doesn't use the generic IRQ support
>> > provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
>> > interrupt handler for each display controller.
>> >
>> > While at it, clean up the way that interrupts are enabled to ensure
>> > that the VBLANK interrupt only gets enabled when required.
>> >
>> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>> > ---
>>
>> Sorry Thierry, but is this a useful feature? Are applications really
>> making use of it? Because it means that that an IRQ will have to
>> trigger every 16.67ms when it is taken, which means the device can't
>> sleep. (probably OK because it should go back to idle when the app
>> lets go of the vblank). But worse, for one-shot panels there is no
>> continuous vblank. I've been doing weird hacks to run a timer when the
>> smart panel is idle to trick applications into thinking they have a
>> vblank pulse. But really I think the whole feature of a vblank pulse
>> is pretty lame and I wish it would die. Were you going to use it for
>> something specific, or just adding it for completeness?
>
> This is mainly added for completeness. I know that on Tegra we can do a
> lot better by using syncpoints, but applications such as Weston (in
> general applications that use the generic DRM API) rely on this to sync
> rendering with VBLANK.
>
> I don't think there's another way to achieve the same thing. And as you
> already mentioned, this is only enabled when an application actively
> uses it, in which case the device won't sleep anyway.

I think driving animations with the vblank signal is nice, but we
kinda only need that with the pageflip support. Unfortunately the
current drm code is a bit a mess in that area, so pageflips force you
to enable the vblank interrupt for otherwise the timestamp'ed pageflip
completion events won't work.

Recent intel hw has pageflip timestamp registers, so we don't really
need that. And I guess other hw is similar. So we probably should
clean up and untangle the infrastructure a bit around the drm vblank
support code.

Another issue is that the vblank ioctl itself doesn't deal with
modeset crtc ids, so adding a new interface for that would be good.
Otoh most kms clients don't really use it, but only care about
pageflips.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
