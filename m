From: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/5] drm/tegra: Implement VBLANK support
Date: Tue, 22 Jan 2013 20:20:33 +0100
Message-ID: <50FEE681.7020208@gmail.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-5-git-send-email-thierry.reding@avionic-design.de> <50FECE63.7090009@tuebingen.mpg.de> <1358879999.1540.22.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358879999.1540.22.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 22.01.13 19:39, Lucas Stach wrote:
> Am Dienstag, den 22.01.2013, 18:37 +0100 schrieb Mario Kleiner:
>> On 14.01.13 17:05, Thierry Reding wrote:
>>> Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
>>> special in this case because it doesn't use the generic IRQ support
>>> provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
>>> interrupt handler for each display controller.
>>>
>>> While at it, clean up the way that interrupts are enabled to ensure
>>> that the VBLANK interrupt only gets enabled when required.
>>>
>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>
>> ... snip ...
>>
>>>    struct drm_driver tegra_drm_driver = {
>>>    	.driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM,
>>>    	.load = tegra_drm_load,
>>> @@ -96,6 +136,10 @@ struct drm_driver tegra_drm_driver = {
>>>    	.open = tegra_drm_open,
>>>    	.lastclose = tegra_drm_lastclose,
>>>
>>> +	.get_vblank_counter = drm_vblank_count,
>>
>> -> .get_vblank_counter = drm_vblank_count is a no-op.
>>
>> .get_vblank_counter() is supposed to return some real hardware vblank
>> counter value to reinitialize the software vblank counter at vbl irq
>> enable time. That software counter gets queried via drm_vblank_count().
>> If you hook this up to drm_vblank_count() it essentially returns a
>> constant, frozen vblank count, it has the same effect as returning zero
>> or any other constant value -- You lose all vblank counter increments
>> during vblank irq off time. The same problem is present in nouveau-kms.
>>
>> I think it would be better to either implement a real hw counter query,
>> or some function with a /* TODO: Implement me properly */ comment which
>> returns zero, so it is clear something is missing here.
>>
> I've looked this up in the TRM a while ago as I know we have the same
> problem in nouveau, but it seems there is no HW vblank counter on Tegra.
>
> Mario, you know a fair bit more about this than I do, what is the
> preferred way of handling this if we are sure we are not able to
> implement anything meaningful here? Just return 0?
>

I think 0 would be better, just to make it clear to readers of the 
source code that this function is basically unimplemented. For 
correctness it doesn't matter what you return, drm_vblank_count() is ok 
as well.

If we wanted, we could probably implement a good enough emulated 
hw-vblank counter, at least on nouveau? If there is some on-chip clock 
register that is driven by the same hardware oscillator as the crtc's so 
it doesn't drift, we could store the clock time in the vblank_disable() 
hook, and some measured duration of a video refresh, wrt. that clock. 
Then in .get_vblank_counter() calculate how many vblanks have elapsed 
from (current_clock_time - vblank_off_clock_time) / frame_duration and 
increment our own private software vblank counter. Something along that 
line...

-mario
