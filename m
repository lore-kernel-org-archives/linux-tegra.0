From: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 0/2] ARM: tegra: enable GPU DT node
Date: Fri, 24 Jul 2015 14:07:04 +0100
Message-ID: <CALeDE9OJgJqRkkx+G_iOuyYGyxROyLR6LCLQ8aAEJ356DgA3AQ@mail.gmail.com>
References: <1436427181-23904-1-git-send-email-acourbot@nvidia.com>
	<55B0D427.2000704@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B0D427.2000704-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

>> Tegra124 requires the bootloader to perform VPR initialization, othe=
rwise the
>> GPU cannot be used by the system. Since using the GPU without that
>> initialization results in a hang, the GPU DT node is left disabled, =
and it is
>> the task of the bootloader to enable it after ensuring it is safe to=
 use the
>> GPU.
>>
>> VPR init is already performed since patch df3443dfa449, but the devi=
ce tree was
>> left untouched. This patch series performs this last step and prepar=
es the GPU
>> intialization code to receive more code for newer chips.
>
> Tested-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>
> I've tested this patchset on v2015.07 with 4.2.0-rc3-00115-gc5dfd65 -
> with these two patches I get a console login on HDMI again.
>
> However, I'm still having trouble with X11... Should that be working
> with linux.git? (haven't tried linux-next.git yet)

My understanding is that it's not or you need  to use glamour to do
so, wayland in theory should work.

> Among other errors, it seems that nouveau is looking for firmware
> nouveau/nvea_fuc409c and nouveau/fuc409c - who should be providing th=
at?
> It's not in linux-firmware.git [1], and I see no /dev/mmcblk0p* to ch=
eck
> whether the original system has such a file (which I doubt, given the
> nouveau naming). It then falls back to the tegra drm iiuc.

Details of the changes with firmware loading in this patch series
here, likely need the patches, or maybe newer ones for it to work:
http://www.spinics.net/lists/dri-devel/msg84828.html

=46irmware landed upstream here:
https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.gi=
t/commit/?id=3D899ebcb6812681b91cf2dfd390574b478c612442

> With -rc2 I've seen the system freeze, with -rc3 just not behaving as
> expected when starting X (with ssh/serial remaining usable).

Without the above patchset I've seen the lockups too.

Peter
