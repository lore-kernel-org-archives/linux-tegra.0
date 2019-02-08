From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [REGRESSION] drm/tegra: hdmi: tegra_hdmi_setup_audio: division by
 zero in kernel
Date: Fri, 8 Feb 2019 20:01:03 +0000
Message-ID: <87f8fd40b25e2842b547059a8d28295533e8c09c.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
Content-ID: <9E8F86072EF4274A861A1C5D6550BD19@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Cc: "treding@nvidia.com" <treding@nvidia.com>, "alban.bedel@avionic-design.de" <alban.bedel@avionic-design.de>
List-Id: linux-tegra@vger.kernel.org

Hi there

I just stumbled over this one:

[   31.026220] Division by zero in kernel.
[   31.026238] CPU: 1 PID: 529 Comm: X Not tainted 5.0.0-rc5-next-
20190208-dirty #153
[   31.026244] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[   31.026281] [<c01120cc>] (unwind_backtrace) from [<c010c92c>]
(show_stack+0x10/0x14)
[   31.026301] [<c010c92c>] (show_stack) from [<c0a7c5ac>]
(dump_stack+0xb4/0xc8)
[   31.026317] [<c0a7c5ac>] (dump_stack) from [<c0a7a7e4>]
(Ldiv0+0x8/0x10)
[   31.026337] [<c0a7a7e4>] (Ldiv0) from [<c0588758>]
(tegra_hdmi_setup_audio+0x1ac/0xed0)
[   31.026353] [<c0588758>] (tegra_hdmi_setup_audio) from [<c0589a68>]
(tegra_hdmi_encoder_enable+0x5ec/0x2a20)
[   31.026379] [<c0589a68>] (tegra_hdmi_encoder_enable) from
[<c054415c>] (drm_atomic_helper_commit_modeset_enables+0x10c/0x220)
[   31.026397] [<c054415c>] (drm_atomic_helper_commit_modeset_enables)
from [<c054449c>] (drm_atomic_helper_commit_tail_rpm+0x24/0x6c)
[   31.026412] [<c054449c>] (drm_atomic_helper_commit_tail_rpm) from
[<c054431c>] (commit_tail+0x40/0x6c)
[   31.026427] [<c054431c>] (commit_tail) from [<c054440c>]
(drm_atomic_helper_commit+0xbc/0x128)
[   31.026443] [<c054440c>] (drm_atomic_helper_commit) from
[<c0547260>] (restore_fbdev_mode_atomic+0x160/0x1cc)
[   31.026457] [<c0547260>] (restore_fbdev_mode_atomic) from
[<c0547420>] (drm_fb_helper_pan_display+0xc4/0x1d0)
[   31.026481] [<c0547420>] (drm_fb_helper_pan_display) from
[<c04b0250>] (fb_pan_display+0x9c/0x118)
[   31.026498] [<c04b0250>] (fb_pan_display) from [<c04b0fdc>]
(do_fb_ioctl+0x4b0/0x7cc)
[   31.026514] [<c04b0fdc>] (do_fb_ioctl) from [<c027e688>]
(do_vfs_ioctl+0xac/0x8f8)
[   31.026527] [<c027e688>] (do_vfs_ioctl) from [<c027ef08>]
(ksys_ioctl+0x34/0x60)
[   31.026540] [<c027ef08>] (ksys_ioctl) from [<c0101000>]
(ret_fast_syscall+0x0/0x54)
[   31.026546] Exception stack(0xcba59fa8 to 0xcba59ff0)
[   31.026559] 9fa0:                   001527a8 00152278 0000000a
00004606 00152808 00000000
[   31.026572] 9fc0: 001527a8 00152278 0015b368 00000036 b6f20961
0000000a bedb5dd4 00000000
[   31.026581] 9fe0: b6af7098 bedb5b1c b6af4603 b6cdb67c
[   31.026586] Division by zero in kernel.
[   31.026595] CPU: 1 PID: 529 Comm: X Not tainted 5.0.0-rc5-next-
20190208-dirty #153
[   31.026600] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[   31.026615] [<c01120cc>] (unwind_backtrace) from [<c010c92c>]
(show_stack+0x10/0x14)
[   31.026629] [<c010c92c>] (show_stack) from [<c0a7c5ac>]
(dump_stack+0xb4/0xc8)
[   31.026640] [<c0a7c5ac>] (dump_stack) from [<c0a7a7e4>]
(Ldiv0+0x8/0x10)
[   31.026654] [<c0a7a7e4>] (Ldiv0) from [<c05887ac>]
(tegra_hdmi_setup_audio+0x200/0xed0)
[   31.026667] [<c05887ac>] (tegra_hdmi_setup_audio) from [<c0589a68>]
(tegra_hdmi_encoder_enable+0x5ec/0x2a20)
[   31.026684] [<c0589a68>] (tegra_hdmi_encoder_enable) from
[<c054415c>] (drm_atomic_helper_commit_modeset_enables+0x10c/0x220)
[   31.026700] [<c054415c>] (drm_atomic_helper_commit_modeset_enables)
from [<c054449c>] (drm_atomic_helper_commit_tail_rpm+0x24/0x6c)
[   31.026715] [<c054449c>] (drm_atomic_helper_commit_tail_rpm) from
[<c054431c>] (commit_tail+0x40/0x6c)
[   31.026729] [<c054431c>] (commit_tail) from [<c054440c>]
(drm_atomic_helper_commit+0xbc/0x128)
[   31.026743] [<c054440c>] (drm_atomic_helper_commit) from
[<c0547260>] (restore_fbdev_mode_atomic+0x160/0x1cc)
[   31.026755] [<c0547260>] (restore_fbdev_mode_atomic) from
[<c0547420>] (drm_fb_helper_pan_display+0xc4/0x1d0)
[   31.026770] [<c0547420>] (drm_fb_helper_pan_display) from
[<c04b0250>] (fb_pan_display+0x9c/0x118)
[   31.026785] [<c04b0250>] (fb_pan_display) from [<c04b0fdc>]
(do_fb_ioctl+0x4b0/0x7cc)
[   31.026797] [<c04b0fdc>] (do_fb_ioctl) from [<c027e688>]
(do_vfs_ioctl+0xac/0x8f8)
[   31.026809] [<c027e688>] (do_vfs_ioctl) from [<c027ef08>]
(ksys_ioctl+0x34/0x60)
[   31.026820] [<c027ef08>] (ksys_ioctl) from [<c0101000>]
(ret_fast_syscall+0x0/0x54)
[   31.026826] Exception stack(0xcba59fa8 to 0xcba59ff0)
[   31.026837] 9fa0:                   001527a8 00152278 0000000a
00004606 00152808 00000000
[   31.026850] 9fc0: 001527a8 00152278 0015b368 00000036 b6f20961
0000000a bedb5dd4 00000000
[   31.026859] 9fe0: b6af7098 bedb5b1c b6af4603 b6cdb67c

This has been observed on a Apalis T30 2GB running todays -next.

Anybody knowing what is going on before I dig deeper?

Cheers

Marcel
