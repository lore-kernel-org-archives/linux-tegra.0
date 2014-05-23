From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Fri, 23 May 2014 13:34:11 -0700
Message-ID: <CAEUnVG63BCgpGuo+qcYkvpnVSSguBy9xwSC_AoZqCt1RgBqm7w@mail.gmail.com>
References: <CAEUnVG7+=1ko8NL1Z3ovSpGveUADUidy4sBhU_dTUe1zbe-bMA@mail.gmail.com>
 <537BCF39.6050909@wwwdotorg.org> <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ@mail.gmail.com>
 <20140521205538.GA6237@mithrandir> <CAEUnVG7tDjw_6wHc=FN0KsOKsSS1u8H8SzYdxt9VCwUsARRTeQ@mail.gmail.com>
 <20140522094958.GA11585@ulmo> <CAEUnVG5pNMzDoXGso+UiAWPpD0hNPhBPyGr8KfV587AuU70QPQ@mail.gmail.com>
 <537E39D9.2000304@wwwdotorg.org> <CAEUnVG4UettOj0xDy+f6qEhUbhNs=u-wgyCf_Prsd2JpnmFfLw@mail.gmail.com>
 <CAEUnVG42Fmn4QOu-jObpoyViscmfKn35oDmb=WR8t=X7YVSB=Q@mail.gmail.com> <537F9BEB.5020102@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537F9BEB.5020102-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 23, 2014 at 12:05 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/22/2014 09:55 PM, Dylan Reid wrote:
> ...
>>>>>>>>> On Tue, May 20, 2014 at 2:55 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> ...
>>>>>>>>>> Now I have the same results as Thierry; speaker-test looks like it
>>>>>>>>>> should be working, yet I don't hear any audio from the monitor. I know
>>>>>>>>>> the monitor works, since I've used it extensively for testing GeForce
>>>>>>>>>> GPU HDMI audio.
> ...
>> Took all day, but I did get to try this.
>>
>> on U-Boot commit d7782d0, flashed with Stephen's u-boot flasher from github.
>>
>> And kernel at 81d0207 - ARM: tegra: enable HD-Audio controller in defconfig
>> plus the addition of the hda node "okay"  to the jetson-tk1 DT.
>>
>> I can hear the jetson's audio on the TV.  This is currently a sample
>> size of one TV, I'll set up the Quantum Data tomorrow and check that
>> it works there as well.
>
> I tried that same U-Boot commit (with a few device-mode USB patches on
> top that shouldn't affect anything since I didn't use USB device mode)
> and have the same results.
>
> My monitor is a Dell U2410 with sound bar.
>
> I did notice one strange thing: /proc/asound/card0/eld#3.0 said:
>
> monitor_present         0
> eld_valid               0
>
> This is odd, since ELD information really should be present. Perhaps
> tegradrm simply doesn't have the code to set up an eld yet though?
> Anyway, I thought that in the absence of ELD information, ALSA core fell
> back to allowing arbitrary audio formats to be used in the hope they'd
> work anyway, so perhaps this isn't an issue.

I see the same thing.  I wouldn't be surprised if the ELD isn't yet
configured by tegradrm.

I tried one other monitor that also worked.

I also ran the HDMI audio compliance test suite.  It failed the ACR
(clock regeneration packet) test and the audio packet timing jitter
test, I could see that upsetting some monitors.  It looks like ACR
packets are generated for 44.1 even when playing 48k.  I'm not sure
why the jitter test wouldn't run, the QD didn't give a reason for
failure on that one.
