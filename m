From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: Re: [PATCH 4/5] drm/tegra: Implement VBLANK support
Date: Thu, 31 Jan 2013 03:06:25 +0100
Message-ID: <5109D1A1.9010207@tuebingen.mpg.de>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de> <1358178932-25505-5-git-send-email-thierry.reding@avionic-design.de> <CADWT_cPtdmSF+_ybe70ZY_z5idzr0KQe94r57ok-Hf-V22wixA@mail.gmail.com> <20130130083453.GA21322@avionic-0098.mockup.avionic-design.de> <CAKMK7uHo9inMzKXqpnH9+H7Tm+nnChGUXE+mGA51L0fNrwoX0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKMK7uHo9inMzKXqpnH9+H7Tm+nnChGUXE+mGA51L0fNrwoX0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Mayo <jon-MQ+mZzckBGs@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 30.01.13 13:36, Daniel Vetter wrote:
> On Wed, Jan 30, 2013 at 9:34 AM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>> On Tue, Jan 22, 2013 at 10:21:40AM -0800, Jon Mayo wrote:
>>> On Mon, Jan 14, 2013 at 7:55 AM, Thierry Reding
>>> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>>>> Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
>>>> special in this case because it doesn't use the generic IRQ support
>>>> provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
>>>> interrupt handler for each display controller.
>>>>
>>>> While at it, clean up the way that interrupts are enabled to ensure
>>>> that the VBLANK interrupt only gets enabled when required.
>>>>
>>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>>> ---
>>>
>>> Sorry Thierry, but is this a useful feature? Are applications really
>>> making use of it? Because it means that that an IRQ will have to
>>> trigger every 16.67ms when it is taken, which means the device can't
>>> sleep. (probably OK because it should go back to idle when the app
>>> lets go of the vblank). But worse, for one-shot panels there is no
>>> continuous vblank. I've been doing weird hacks to run a timer when the
>>> smart panel is idle to trick applications into thinking they have a
>>> vblank pulse. But really I think the whole feature of a vblank pulse
>>> is pretty lame and I wish it would die. Were you going to use it for
>>> something specific, or just adding it for completeness?
>>
>> This is mainly added for completeness. I know that on Tegra we can do a
>> lot better by using syncpoints, but applications such as Weston (in
>> general applications that use the generic DRM API) rely on this to sync
>> rendering with VBLANK.
>>
>> I don't think there's another way to achieve the same thing. And as you
>> already mentioned, this is only enabled when an application actively
>> uses it, in which case the device won't sleep anyway.
>
> I think driving animations with the vblank signal is nice, but we
> kinda only need that with the pageflip support. Unfortunately the
> current drm code is a bit a mess in that area, so pageflips force you
> to enable the vblank interrupt for otherwise the timestamp'ed pageflip
> completion events won't work.
>

Extensions like SGI_video_sync, OML_sync_control, INTEL_swap_events 
expose vblank counts and related functionality for synchronizing to the 
vblank and some applications really use and need them in addition to the 
pageflip timestamps, so you need a running reliable vblank counter to 
support these. Some scienctific/medical applications need to also 
synchronize things like audio playback or capture, or triggering of 
special research equipment (fMRI/MEG/EEG brain scanners and recordign 
equipment, eye trackers, TMS brain stimulators etc.) to the vblank of a 
completed or future bufferswap, with sometimes better than 1 msec 
precision, sometimes ahead of the event.

That we can't timestamp non-pageflipped swaps precisely/reliably is a 
limitation, not a feature for such uses.

> Recent intel hw has pageflip timestamp registers, so we don't really
> need that. And I guess other hw is similar. So we probably should
> clean up and untangle the infrastructure a bit around the drm vblank
> support code.

At least AMD hw as of a while ago didn't, older intel hw didn't (afaik), 
and NVidia i don't know. You'd also need hw vblank timestamps and 
counters independent of page-flip completion to not regress existing 
important functionality if you want to get rid of the irq based method.

-mario

>
> Another issue is that the vblank ioctl itself doesn't deal with
> modeset crtc ids, so adding a new interface for that would be good.
> Otoh most kms clients don't really use it, but only care about
> pageflips.
> -Daniel
>
