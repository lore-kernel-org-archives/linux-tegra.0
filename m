From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: Use framebuffer pitch as line stride
Date: Mon, 03 Dec 2012 20:50:03 -0700
Message-ID: <50BD72EB.5010107@wwwdotorg.org>
References: <1353613037-15808-1-git-send-email-thierry.reding@avionic-design.de> <50B3EF29.6000308@wwwdotorg.org> <50B43096.4060302@nvidia.com> <50B503C5.6010208@wwwdotorg.org> <50B53312.7040000@wwwdotorg.org> <50B5B120.1090902@gmail.com> <50BD6753.20404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50BD6753.20404-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/03/2012 08:00 PM, Mark Zhang wrote:
> On 11/28/2012 02:37 PM, Mark Zhang wrote:
>> On 11/28/2012 05:39 AM, Stephen Warren wrote:
>>> On 11/27/2012 11:17 AM, Stephen Warren wrote:
>>>> On 11/26/2012 08:16 PM, Mark Zhang wrote:
>>>>> On 11/27/2012 06:37 AM, Stephen Warren wrote:
>>>>>> On 11/22/2012 12:37 PM, Thierry Reding wrote:
>>>>>>> Instead of using the stride derived from the display mode, use the pitch
>>>>>>> associated with the currently active framebuffer. This fixes a bug where
>>>>>>> the LCD display content would be skewed when enabling HDMI with a video
>>>>>>> mode different from that of the LCD.
>>>>>>
>>>>>> This patch certainly doesn't cause any additional issues for me, so:
>>>>>>
>>>>>> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>>
>>>>>> Howwever, it still doesn't allow both Cardhu's LCD panel and external
>>>>>> HDMI port (1080p) to be active at once. If I boot with both enabled, or
>>>>>> boot with just the LCD enabled and hot-plug HDMI, as soon as both heads
>>>>>> are active, then some kind of display corruption starts; it looks like a
>>>>>> clocking issue or perhaps memory underflow.
>>>>>
>>>>> I haven't observed this issue. What kind of display corruption you mean?
>>>>> Did it recover after some seconds or the display in LVDS panel was
>>>>> always corrupted?
>>>>>
>>>>> During my testing, I connected HDMI while booting cardhu and I can see
>>>>> the LVDS and HDMI working with no corruptions.
>>>>
>>>> For your viewing pleasure (and playing with my new phone) :-)
>>>> http://www.youtube.com/watch?v=ZJxJnONz7DA
>>>>
>>>> The external monitor is 1920x1200 I believe.
>>>
>>> Jon Mayo says the corruption in the video is display (memory fetch)
>>> underflow. Perhaps this is because (IIRC) the BCT I'm using on Cardhu
>>> programs the memory controller at a slow rate, and the bootloader and/or
>>> kernel is supposed to bump up the rate to the max, but that's not
>>> implemented anywhere yet upstream. If you're testing with "fastboot"
>>> instead of U-Boot, that might be re-programming the memory frequencies,
>>> and hence avoiding this.
>>>
>>
>> All right, I just test the framebuffer console and "xinit", I didn't
>> install the whole ubuntu.
>>
>> I'll install the ubuntu in my cardhu and see whether I have this kind of
>> issues.
> 
> Hi swarren, I installed ubuntu 12.04 in l4t and didn't observe the issue
> you described. The display worked with no corruptions. I can show you
> the video if you want.
> 
> What I used for testing is a cardhu board with our downstream U-Boot.
> 
> But the HDMI didn't work. The HDMI monitor showed this: "CANNOT DISPLAY
> THIS VIDEO MODE, CHANGE COMPUTER DISPLAY INPUT TO 1920x1080@60HZ". So
> sounds like the clock setting has some problems... I'll have a look at this.

Oh, I thought I'd followed up on this - Jon Mayo said it was display
underflow due to lack of memory bandwidth. IIRC, this may be due to the
BCT programming the memory controller for conservative settings that
don't require non-default voltages from the PMIC, with the expectation
that the bootloader or kernel will reprogram everything for correct
performance.
