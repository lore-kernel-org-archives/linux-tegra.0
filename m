From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Tue, 20 May 2014 17:42:23 -0600
Message-ID: <537BE85F.2060906@wwwdotorg.org>
References: <CAEUnVG7+=1ko8NL1Z3ovSpGveUADUidy4sBhU_dTUe1zbe-bMA@mail.gmail.com> <537BCF39.6050909@wwwdotorg.org> <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/20/2014 05:28 PM, Dylan Reid wrote:
> On Tue, May 20, 2014 at 2:55 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 05/20/2014 02:37 PM, Dylan Reid wrote:
>>> On Tue, May 20, 2014 at 11:31 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>>> On 05/20/2014 12:24 PM, Stephen Warren wrote:
>>>>> On 05/19/2014 08:35 PM, Dylan Reid wrote:
>>>>>> Add a device node for the HDA controller found on Tegra124.
>> ...
>>>> Even after fixing that, I can't play audio on Venice2:
>>>>
>>>> root@localhost:~# speaker-test -Dhw:0,3 -c 2
>>>>
>>>> speaker-test 1.0.27.1
>>>>
>>>> Playback device is hw:0,3
>>>> Stream parameters are 48000Hz, S16_LE, 2 channels
>>>> Using 16 octaves of pink noise
>>>> Rate set to 48000Hz (requested 48000Hz)
>>>> Buffer size range from 64 to 16384
>>>> Period size range from 32 to 8192
>>>> Using max buffer size 16384
>>>> Periods = 4
>>>> was set period_size = 4096
>>>> was set buffer_size = 16384
>>>>  0 - Front Left
>>>> Write error: -32,Broken pipe
>>>> Write error: -32,Broken pipe
>>>> Write error: -32,Broken pipe
>>>> ^C 1 - Front Right
>>>> Time per period = 1.799791
>>>>
>>>
>>> Thanks for checking Stephen.  I'll fix the reset name.
>>>
>>> This is the state of the tree I used when I tested on Venice2 just now:
>>> * ae57dbf - (HEAD) ARM: tegra: venice2 - Enable HDA (2 minutes ago)
>>> * 6224524 - ARM: tegra: Add Tegra124 HDA support (2 minutes ago)
>>> * 468ca57 - ALSA: hda - Add driver for Tegra SoC HDA (2 minutes ago)
>>> * 928099e - ALSA: hda/hdmi - Add Nvidia Tegra124 HDMI support (2 minutes ago)
>>> * 701eac4 - clk: tegra124: Enable hda to hdmi clocks (3 minutes ago)
>>
>> Ah, I was missing that clock patch. Hopefully Peter will pick it up for
>> the Tegra clock tree soon.
>>
>> Now I have the same results as Thierry; speaker-test looks like it
>> should be working, yet I don't hear any audio from the monitor. I know
>> the monitor works, since I've used it extensively for testing GeForce
>> GPU HDMI audio.
> 
> Probably a silly question: Is it un-muted?
> amixer -c0 cset name='IEC958 Playback Switch' on

Yes (well I used alsamixer interactively, but it's the same thing, I
believe)
