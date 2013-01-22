From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: Re: [PATCH v2 4/5] drm/tegra: Implement VBLANK support
Date: Tue, 22 Jan 2013 20:59:14 +0100
Message-ID: <50FEEF92.9060009@tuebingen.mpg.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-5-git-send-email-thierry.reding@avionic-design.de> <50FECE63.7090009@tuebingen.mpg.de> <1358879999.1540.22.camel@tellur> <CADWT_cOjVg9-hB+jWuEUr+Ou-YECBN73WQXNy17qXf3TO1ZjpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADWT_cOjVg9-hB+jWuEUr+Ou-YECBN73WQXNy17qXf3TO1ZjpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mayo <jon-MQ+mZzckBGs@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 22.01.13 19:49, Jon Mayo wrote:
> On Tue, Jan 22, 2013 at 10:39 AM, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:
>> Am Dienstag, den 22.01.2013, 18:37 +0100 schrieb Mario Kleiner:
>>> On 14.01.13 17:05, Thierry Reding wrote:
>>>> Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
>>>> special in this case because it doesn't use the generic IRQ support
>>>> provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
>>>> interrupt handler for each display controller.
>>>>
>>>> While at it, clean up the way that interrupts are enabled to ensure
>>>> that the VBLANK interrupt only gets enabled when required.
>>>>
>>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>>
>>> ... snip ...
>>>
>>>>    struct drm_driver tegra_drm_driver = {
>>>>      .driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM,
>>>>      .load = tegra_drm_load,
>>>> @@ -96,6 +136,10 @@ struct drm_driver tegra_drm_driver = {
>>>>      .open = tegra_drm_open,
>>>>      .lastclose = tegra_drm_lastclose,
>>>>
>>>> +   .get_vblank_counter = drm_vblank_count,
>>>
>>> -> .get_vblank_counter = drm_vblank_count is a no-op.
>>>
>>> .get_vblank_counter() is supposed to return some real hardware vblank
>>> counter value to reinitialize the software vblank counter at vbl irq
>>> enable time. That software counter gets queried via drm_vblank_count().
>>> If you hook this up to drm_vblank_count() it essentially returns a
>>> constant, frozen vblank count, it has the same effect as returning zero
>>> or any other constant value -- You lose all vblank counter increments
>>> during vblank irq off time. The same problem is present in nouveau-kms.
>>>
>>> I think it would be better to either implement a real hw counter query,
>>> or some function with a /* TODO: Implement me properly */ comment which
>>> returns zero, so it is clear something is missing here.
>>>
>> I've looked this up in the TRM a while ago as I know we have the same
>> problem in nouveau, but it seems there is no HW vblank counter on Tegra.
>>
>> Mario, you know a fair bit more about this than I do, what is the
>> preferred way of handling this if we are sure we are not able to
>> implement anything meaningful here? Just return 0?
>>
>> Regards,
>> Lucas
>>
>>
>
> In my branch for the old non-DRM version of the tegra driver, I clock
> gate and power gate display when using a one-shot smart panel. So not
> only are there no more IRQs, but even if Tegra had a hardware vblank
> counter it would also be dead too. (it doesn't have one, but I could
> make the case to add one in the next chip if we could actually make
> use of it, given my previous statement, I don't think it will help)
>
> How badly do people need this feature? Because I really do think smart
> panels are going to been the norm in a few years.

How do smart panels work? Any reference to learn about these?

  A bit off-topic to
> Thierry's submission, but I'd really like to discourage apps from
> relying on this feature, does anyone else agree?

The current swap scheduling is based on having an accurate software 
vblank counter. Atm. that counter is maintained in software, incremented 
during vblank irq. At irq off -> on transition we need a hw counter to 
reinitialize. And there is a timeout between dropping the last reference 
to a counter via drm_vblank_put() and actually disabling the vblank irq. 
If the timeout is long enough and a timing sensitive app is aware that 
vblank counters may be inaccurate/unreliable over long time periods, it 
can work around the problem.

My app, e.g., which is a very timing sensitive scientific application 
toolkit, only assumes that vblank counts are consistent over a short 
period of time. It queries the vblank count and time as a baseline, 
calculates a target vblank count for swap from it and then schedules the 
swap for that target count. If vblank irq's stay active at least between 
the query call and scheduling a swap, all is good, so a timeout to irq 
disable of a couple of video refresh cycles would be safe, even if a 
driver doesn't have a working hw counter.

I think at least some media-players and some of the open source vdpau or 
vaapi implementations and maybe some compositors may rely on this as 
well for audio-video sync etc.

If the vblank disable mechanism is too aggressive in its power saving (= 
too short timeout) or the app is very trusting of the specs being 
robustly implemented it will go wrong.

It's a tradeoff between power-saving and robustness of the implementation.

The other way around this would be to have some new kernel api that 
executes swaps based on a target system time instead of a target vblank 
count. I assume that, e.g., vdpau's presentation api uses time-based 
scheduling for that reason, to avoid dependency on vblank counters.

-mario
