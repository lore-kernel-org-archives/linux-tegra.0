From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Thu, 22 May 2014 10:48:47 -0700
Message-ID: <CAEUnVG5pNMzDoXGso+UiAWPpD0hNPhBPyGr8KfV587AuU70QPQ@mail.gmail.com>
References: <CAEUnVG7+=1ko8NL1Z3ovSpGveUADUidy4sBhU_dTUe1zbe-bMA@mail.gmail.com>
 <537BCF39.6050909@wwwdotorg.org> <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ@mail.gmail.com>
 <20140521205538.GA6237@mithrandir> <CAEUnVG7tDjw_6wHc=FN0KsOKsSS1u8H8SzYdxt9VCwUsARRTeQ@mail.gmail.com>
 <20140522094958.GA11585@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140522094958.GA11585@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 22, 2014 at 2:50 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, May 21, 2014 at 02:10:09PM -0700, Dylan Reid wrote:
>> On Wed, May 21, 2014 at 1:55 PM, Thierry Reding
>> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > On Tue, May 20, 2014 at 04:28:45PM -0700, Dylan Reid wrote:
>> >> On Tue, May 20, 2014 at 2:55 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> >> > On 05/20/2014 02:37 PM, Dylan Reid wrote:
>> >> >> On Tue, May 20, 2014 at 11:31 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> >> >>> On 05/20/2014 12:24 PM, Stephen Warren wrote:
>> >> >>>> On 05/19/2014 08:35 PM, Dylan Reid wrote:
>> >> >>>>> Add a device node for the HDA controller found on Tegra124.
>> >> > ...
>> >> >>> Even after fixing that, I can't play audio on Venice2:
>> >> >>>
>> >> >>> root@localhost:~# speaker-test -Dhw:0,3 -c 2
>> >> >>>
>> >> >>> speaker-test 1.0.27.1
>> >> >>>
>> >> >>> Playback device is hw:0,3
>> >> >>> Stream parameters are 48000Hz, S16_LE, 2 channels
>> >> >>> Using 16 octaves of pink noise
>> >> >>> Rate set to 48000Hz (requested 48000Hz)
>> >> >>> Buffer size range from 64 to 16384
>> >> >>> Period size range from 32 to 8192
>> >> >>> Using max buffer size 16384
>> >> >>> Periods = 4
>> >> >>> was set period_size = 4096
>> >> >>> was set buffer_size = 16384
>> >> >>>  0 - Front Left
>> >> >>> Write error: -32,Broken pipe
>> >> >>> Write error: -32,Broken pipe
>> >> >>> Write error: -32,Broken pipe
>> >> >>> ^C 1 - Front Right
>> >> >>> Time per period = 1.799791
>> >> >>>
>> >> >>
>> >> >> Thanks for checking Stephen.  I'll fix the reset name.
>> >> >>
>> >> >> This is the state of the tree I used when I tested on Venice2 just now:
>> >> >> * ae57dbf - (HEAD) ARM: tegra: venice2 - Enable HDA (2 minutes ago)
>> >> >> * 6224524 - ARM: tegra: Add Tegra124 HDA support (2 minutes ago)
>> >> >> * 468ca57 - ALSA: hda - Add driver for Tegra SoC HDA (2 minutes ago)
>> >> >> * 928099e - ALSA: hda/hdmi - Add Nvidia Tegra124 HDMI support (2 minutes ago)
>> >> >> * 701eac4 - clk: tegra124: Enable hda to hdmi clocks (3 minutes ago)
>> >> >
>> >> > Ah, I was missing that clock patch. Hopefully Peter will pick it up for
>> >> > the Tegra clock tree soon.
>> >> >
>> >> > Now I have the same results as Thierry; speaker-test looks like it
>> >> > should be working, yet I don't hear any audio from the monitor. I know
>> >> > the monitor works, since I've used it extensively for testing GeForce
>> >> > GPU HDMI audio.
>> >>
>> >> Probably a silly question: Is it un-muted?
>> >> amixer -c0 cset name='IEC958 Playback Switch' on
>> >
>> > Dylan, can you provide more detail about the setup that you're running?
>> > There have been similar issues in the past where a driver would work if
>> > it was run on an identical upstream kernel but with a different version
>> > of the bootloader (or a different bootloader altogether). Can you give
>> > further details about your setup? Also perhaps providing a dmesg log or
>> > the clock tree from /sys/kernel/debug/clk/clk_summary could help
>> > determine the diff between a working and a non-working setup.
>>
>> Sure.  I'm running this u-boot:
>> https://chromium.googlesource.com/chromiumos/third_party/u-boot
>> on commit ddde3e9 of the chromeos-v2013.06 branch.
>>
>> I haven't had a chance to flash swarren's u-boot yet it's been one of
>> those days...
>>
>> I attached dmesg and clk_summary.
>>
>> I don't have many modifications to the ubuntu-core rootfs.
>>
>> Thanks for looking at this,
>
> Also perhaps you can share any change to tegra_defconfig that you have
> for this. Perhaps Stephen and I are simply missing some required option
> to make it work.

Sure, here is the diff from linux-next's tegra defconfig.  Still on
the tree mentioned above.

--- .config     2014-05-22 10:47:15.048673228 -0700
+++ /tmp/tegra_hda.config   2014-05-22 10:47:08.118588548 -0700
@@ -2395,6 +2395,8 @@
 CONFIG_SND_VERBOSE_PROCFS=y
 # CONFIG_SND_VERBOSE_PRINTK is not set
 # CONFIG_SND_DEBUG is not set
+CONFIG_SND_VMASTER=y
+CONFIG_SND_KCTL_JACK=y
 # CONFIG_SND_RAWMIDI_SEQ is not set
 # CONFIG_SND_OPL3_LIB_SEQ is not set
 # CONFIG_SND_OPL4_LIB_SEQ is not set
@@ -2468,8 +2470,28 @@
 #
 # HD-Audio
 #
+CONFIG_SND_HDA=y
 # CONFIG_SND_HDA_INTEL is not set
-# CONFIG_SND_HDA_TEGRA is not set
+CONFIG_SND_HDA_TEGRA=y
+CONFIG_SND_HDA_PREALLOC_SIZE=64
+# CONFIG_SND_HDA_HWDEP is not set
+# CONFIG_SND_HDA_RECONFIG is not set
+# CONFIG_SND_HDA_INPUT_BEEP is not set
+# CONFIG_SND_HDA_INPUT_JACK is not set
+# CONFIG_SND_HDA_PATCH_LOADER is not set
+# CONFIG_SND_HDA_CODEC_REALTEK is not set
+# CONFIG_SND_HDA_CODEC_ANALOG is not set
+# CONFIG_SND_HDA_CODEC_SIGMATEL is not set
+# CONFIG_SND_HDA_CODEC_VIA is not set
+CONFIG_SND_HDA_CODEC_HDMI=y
+# CONFIG_SND_HDA_CODEC_CIRRUS is not set
+# CONFIG_SND_HDA_CODEC_CONEXANT is not set
+# CONFIG_SND_HDA_CODEC_CA0110 is not set
+# CONFIG_SND_HDA_CODEC_CA0132 is not set
+# CONFIG_SND_HDA_CODEC_CMEDIA is not set
+# CONFIG_SND_HDA_CODEC_SI3054 is not set
+# CONFIG_SND_HDA_GENERIC is not set
+CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
 # CONFIG_SND_ARM is not set
 # CONFIG_SND_SPI is not set
 # CONFIG_SND_USB is not set


>
> Thierry
