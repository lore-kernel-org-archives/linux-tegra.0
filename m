From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/7] drm/tegra: Implement .mode_set_base()
Date: Mon, 18 Feb 2013 16:40:11 +0800
Message-ID: <5121E8EB.1050102@gmail.com>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de> <1360771506-17849-4-git-send-email-thierry.reding@avionic-design.de> <5121C791.3040903@gmail.com> <20130218064832.GB30856@avionic-0098.mockup.avionic-design.de> <5121D2E2.7080905@gmail.com> <20130218072057.GA31486@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130218072057.GA31486-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/18/2013 03:20 PM, Thierry Reding wrote:
> On Mon, Feb 18, 2013 at 03:06:10PM +0800, Mark Zhang wrote:
>> On 02/18/2013 02:48 PM, Thierry Reding wrote:
>>> On Mon, Feb 18, 2013 at 02:17:53PM +0800, Mark Zhang wrote:
>>>> On 02/14/2013 12:05 AM, Thierry Reding wrote:
>>>>> The sequence for replacing the scanout buffer is much shorter than a
>>>>> full mode change operation so implementing this callback considerably
>>>>> speeds up cases where only a new framebuffer is to be scanned out.
>>>>>
>>>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>>>> ---
>>>>> Changes in v3:
>>>>> - split DC_CMD_STATE_CONTROL writes
>>>>>
>>>>>  drivers/gpu/drm/tegra/dc.c | 31 +++++++++++++++++++++++++++++++
>>>>>  1 file changed, 31 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>>>>> index 8f97b1c..cc4c85e 100644
>>>>> --- a/drivers/gpu/drm/tegra/dc.c
>>>>> +++ b/drivers/gpu/drm/tegra/dc.c
>>>>> @@ -114,6 +114,27 @@ static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_dc *dc)
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> +static int tegra_dc_set_base(struct tegra_dc *dc, int x, int y,
>>>>> +			     struct tegra_framebuffer *fb)
>>>>> +{
>>>>> +	unsigned long value;
>>>>> +
>>>>> +	tegra_dc_writel(dc, WINDOW_A_SELECT, DC_CMD_DISPLAY_WINDOW_HEADER);
>>>>> +
>>>>> +	value = fb->base.offsets[0] + y * fb->base.pitches[0] +
>>>>> +		x * fb->base.bits_per_pixel / 8;
>>>>> +
>>>>> +	tegra_dc_writel(dc, fb->obj->paddr + value, DC_WINBUF_START_ADDR);
>>>>> +
>>>>> +	value = GENERAL_UPDATE | WIN_A_UPDATE;
>>>>> +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
>>>>> +
>>>>> +	value = GENERAL_ACT_REQ | WIN_A_ACT_REQ;
>>>>> +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>
>>>> Again, what do you think about the "line stride" problem I mentioned:
>>>>
>>>> http://lists.freedesktop.org/archives/dri-devel/2013-January/033561.html
>>>>
>>>> Don't get me wrong that I also don't want to add a line stride update
>>>> here because that doesn't make sense. It's just a workaround. But we
>>>> need to find a way to make multi-head page flip working.
>>>
>>> I'm not sure that it's something we need to support. .mode_set_base() is
>>> explicitly used only for cases where the framebuffer configuration
>>> doesn't change. That is, only in cases where the only thing that changes
>>> is the physical address of the framebuffer to be displayed.
>>>
>>> The current case where one framebuffer is used as scanout for both
>>> outputs isn't something that page-flipping can support. Page-flipping is
>>> always per-CRTC because typically each CRTC would run at a different
>>> frequency (or even if both ran at the same frequency the VBLANK is very
>>> unlikely to coincide anyway).
>>>
>>> So an application that wants to support page-flipping on two outputs
>>> also needs to take care to set them up with different framebuffers, in
>>> which case what you're describing here can't really happen.
>>
>> Yes, the userspace application needs to setup different framebuffers for
>> different crtcs. So if LVDS & HDMI are connected, here is what the
>> application does:
>>
>> 1. drm reports that 2 connectors: LVDS & HDMI are present in the system
>> 2. The resolution of them are: 1366x768 & 1080p
>> 3. Userspace application allocates 2 fbs according to the resolution got
>> above.
>> 4. call drmModeSetCrtc to switch the fb shown in LVDS to the new fb we
>> created.
>> 5. At this time, remember the line stride setting in dc which connects
>> with LVDS is calculated according to the 1080p resolution. So finally we
>> got a corrupt display because we're showing a 1366x768 fb but with
>> 1080p's line stride.
> 
> I don't see how the 1080p stride would still be relevant here. Setting
> the LVDS to the new 1366x768 framebuffer should trigger a full modeset
> and therefore set the stride to the value required by the new 1366x768
> framebuffer.
> 

Actually the dc which connects with LVDS doesn't know about 1080p
stuffs. All the video mode infos stored in this dc is still 1366x768(I
just checked the register values on my Tegra 30 cardhu). The dc just
scans 1366 pixels then jump to next line(based on the 1080p line stride
we set) and keep scanning.

So the drm crtc helper(I believe it's function:
drm_crtc_helper_set_config) finds out that video mode is not changed so
a fb_change while not full modeset is triggered.

I started to test this new series patch set just now. I'll let you know
whether the issue I described still exists.

Mark
> Thierry
> 
