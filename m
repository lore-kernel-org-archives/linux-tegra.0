From: Dylan Reid <dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: HDMi out on Venice2
Date: Fri, 16 May 2014 18:23:29 -0700
Message-ID: <CAEUnVG6ofybHM-GPMV_eHZLRL31477t-B8eL_G2t67fTWpJiAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 5, 2014 at 7:14 PM, Dylan Reid <dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> On Mon, May 5, 2014 at 1:32 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Mon, May 05, 2014 at 12:07:51PM -0700, Dylan Reid wrote:
>>> Hi Thierry,
>>>
>>> Did you have to make any user-space changes to test the HDMI output on
>>> Venice2?  I've got your recent patch series and see the hdmi device
>>> being probed but I haven't figured out how to get X to use it.  I'm
>>> using the sample rootfs that was posted for the Jetson board.
>>
>> I've used custom userspace, but I would expect regular X to work with
>> the patches as well. The sample rootfs probably comes with only the
>> NVIDIA Tegra X driver installed. Have you tried installing the
>> xf86-video-modesetting driver? That should automatically use the HDMI
>> output if it's connected to a monitor. If not you should still be able
>> to manually configure the outputs using xrandr.
>
> Thanks, I haven't gotten to the point where I can see a screen in
> xrandr yet, I'll try to find some time to dig a little deeper this
> week.
>
>>
>>> My goal is to be able to test the hdmi audio changes on this as well
>>> as our downstream kernel.
>>
>> Note that while there's some code to support HDMI audio, nobody's ever
>> tested this upstream and it's likely not to work. So I think there may
>> be more work required to get that running. I can help out with that,
>> it's been on my list of things to do for a while.
>
> Understood, although what is upstream looks pretty similar to what is
> in our tree so I'm optimistic =)

Sorry I didn't get around to testing this until today.  Luckily it
worked, but I had to make two changes:

1) Make the hdmi entry in the tegra124 dt compatible with tegra114-hdmi.

2) Have driver/gpu/drm/tegra/hdmi.c enable hdmi-supply when enabling
the pll supply, without this DDC doesn't work.

Easy fixes, I'll post patches for these this weekend.

-Dylan

>
>>
>> Thierry
