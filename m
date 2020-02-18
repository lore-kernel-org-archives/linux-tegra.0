From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH v3 0/7] ASoC: soc-pcm cleanup step2
Date: Tue, 18 Feb 2020 22:14:22 +0300
Message-ID: <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87d0anceze.wl-kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linux-ALSA <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

10.02.2020 06:13, Kuninori Morimoto пишет:
> 
> Hi Mark
> 
> These are v3 of soc-pcm cleanup.
> Original [5/7] [6/7] patch call open / start function for all DAI / component.
> And, it calls close / stop function for all if some of them got error.
> But in such case, error occured DAI / component don't need to call close / stop.
> 
> This issue can be solved if it had flag, and my local tree has such patch.
> But it was planed to post to ML a little later.
> This time, I merged original patch and this new flag patch on [5/7] [6/7].
> 
> These mention that "it is prepare for soc-pcm-open() cleanup".
> But it will be happen later.
> 
> These are based on v5.6-rc1
> 
> Kuninori Morimoto (8):
>   1) ASoC: soc-pcm: add snd_soc_runtime_action()
>   2) ASoC: soc-pcm: adjustment for DAI member 0 reset
>   3) ASoC: soc-pcm: add for_each_dapm_widgets() macro
>   4) ASoC: soc-pcm: don't use bit-OR'ed error
>   5) ASoC: soc-pcm: call snd_soc_dai_startup()/shutdown() once
>   6) ASoC: soc-pcm: call snd_soc_component_open/close() once
>   7) ASoC: soc-pcm: move soc_pcm_close() next to soc_pcm_open()
>   8) ASoC: soc-pcm: tidyup soc_pcm_open() order
> 
>  include/sound/soc-component.h |   7 +-
>  include/sound/soc-dai.h       |   5 +-
>  include/sound/soc-dapm.h      |   5 +
>  sound/soc/soc-component.c     |  35 ++++--
>  sound/soc/soc-dai.c           |  11 +-
>  sound/soc/soc-dapm.c          |   8 +-
>  sound/soc/soc-pcm.c           | 246 +++++++++++++++++++-----------------------
>  7 files changed, 161 insertions(+), 156 deletions(-)
> 

Hello,

I'm observing a NULL dereference on NVIDIA Tegra20/30 once PulseAudio is
loaded.

The offending patch is:

  ASoC: soc-pcm: call snd_soc_component_open/close() once

Please fix, thanks in advance.

[   61.860826] 8<--- cut here ---
[   61.860965] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[   61.861037] pgd = ef2eab54
[   61.861155] [00000000] *pgd=00000000
[   61.861228] Internal error: Oops: 5 [#1] SMP THUMB2
[   61.861298] Modules linked in:
[   61.861427] CPU: 2 PID: 599 Comm: pulseaudio Not tainted
5.6.0-rc2-next-20200218-00168-g1e584fed87b9 #1275
[   61.861546] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[   61.861626] PC is at snd_dmaengine_pcm_close+0x1c/0x3c
[   61.861756] LR is at snd_soc_component_close+0x1d/0x3c
[   61.861823] pc : [<c072a36c>]    lr : [<c0751b51>]    psr: 60000033
[   61.861944] sp : dc01bc88  ip : 00000000  fp : ffffffea
[   61.862013] r10: 00000010  r9 : dd81a840  r8 : de318e00
[   61.862080] r7 : dd81adfc  r6 : 00000000  r5 : 00000003  r4 : 00000000
[   61.862199] r3 : dc19f800  r2 : 00000000  r1 : 00000447  r0 : c0e2f438
[   61.862322] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb
Segment none
[   61.862390] Control: 50c5387d  Table: 9db0c04a  DAC: 00000051
[   61.862510] Process pulseaudio (pid: 599, stack limit = 0xcfc4cd60)
[   61.862576] Stack: (0xdc01bc88 to 0xdc01c000)
[   61.862700] bc80:                   c0756611 de31b60c 00000003
c0751b51 de31b60c c07525ff
...
[   61.865643] bfe0: 00000142 beb9b7e8 b6c35f0d b6bbcd56 00000030
ffffff9c 00000000 00000000
[   61.865773] [<c072a36c>] (snd_dmaengine_pcm_close) from [<c0751b51>]
(snd_soc_component_close+0x1d/0x3c)
[   61.865920] [<c0751b51>] (snd_soc_component_close) from [<c07525ff>]
(soc_pcm_components_close+0x27/0x54)
[   61.865993] [<c07525ff>] (soc_pcm_components_close) from [<c0752c27>]
(soc_pcm_close+0x73/0xf0)
[   61.866130] [<c0752c27>] (soc_pcm_close) from [<c072370d>]
(snd_pcm_release_substream.part.0+0x29/0x6c)
[   61.866258] [<c072370d>] (snd_pcm_release_substream.part.0) from
[<c0723d5f>] (snd_pcm_open_substream+0x5f7/0x638)
[   61.866383] [<c0723d5f>] (snd_pcm_open_substream) from [<c0723e45>]
(snd_pcm_open+0xa5/0x184)
[   61.866510] [<c0723e45>] (snd_pcm_open) from [<c0723f51>]
(snd_pcm_capture_open+0x2d/0x40)
[   61.866589] [<c0723f51>] (snd_pcm_capture_open) from [<c025fb69>]
(chrdev_open+0xa9/0x148)
[   61.866724] [<c025fb69>] (chrdev_open) from [<c02588a5>]
(do_dentry_open+0xd5/0x2e8)
[   61.866855] [<c02588a5>] (do_dentry_open) from [<c0267a8b>]
(path_openat+0x203/0xd44)
[   61.866981] [<c0267a8b>] (path_openat) from [<c02690d5>]
(do_filp_open+0x49/0x90)
[   61.867055] [<c02690d5>] (do_filp_open) from [<c0258e4b>]
(do_sys_openat2+0x1a7/0x210)
[   61.867180] [<c0258e4b>] (do_sys_openat2) from [<c0259ca9>]
(do_sys_open+0x6d/0x98)
[   61.867310] [<c0259ca9>] (do_sys_open) from [<c01011cb>]
(__sys_trace_return+0x1/0x16)
[   61.867377] Exception stack(0xdc01bfa8 to 0xdc01bff0)
[   61.867498] bfa0:                   00000000 b6fac2e0 ffffff9c
beb9b964 00080802 00000000
[   61.867624] bfc0: 00000000 b6fac2e0 ffffffff 00000142 b22f57a8
beb9b840 beb9b964 81204101
[   61.867692] bfe0: 00000142 beb9b7e8 b6c35f0d b6bbcd56
[   61.867819] Code: f2cc 00e2 f8d3 40e0 (6825) f615
[   61.867959] ---[ end trace 335017ef9fedfd8c ]---
