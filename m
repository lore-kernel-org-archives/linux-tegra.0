From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
Date: Mon, 6 Jul 2020 14:53:15 +0200
Message-ID: <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Qian Cai <cai-J5quhbR+WMc@public.gmane.org>, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Dave Jiang <dave.jiang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 6, 2020 at 1:03 PM Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> While booting qemu_arm64 and qemu_arm with Linux version 5.8.0-rc3-next-20200706
> the kernel panic noticed due to kernel NULL pointer dereference.
>
> metadata:
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git commit: 5680d14d59bddc8bcbc5badf00dbbd4374858497
>   git describe: next-20200706
>   make_kernelversion: 5.8.0-rc3
>   kernel-config:
> https://builds.tuxbuild.com/Glr-Ql1wbp3qN3cnHogyNA/kernel.config
>
> qemu arm64 boot crash log,
>
> [    0.972053] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [    0.975301] Mem abort info:
> [    0.976316]   ESR = 0x96000004
> [    0.977378]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.979363]   SET = 0, FnV = 0
> [    0.980458]   EA = 0, S1PTW = 0
> [    0.981583] Data abort info:
> [    0.982634]   ISV = 0, ISS = 0x00000004
> [    0.984213]   CM = 0, WnR = 0
> [    0.985260] [0000000000000000] user address but active_mm is swapper
> [    0.987600] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    0.989557] Modules linked in:
> [    0.990671] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
> 5.8.0-rc3-next-20200706 #1
> [    0.993711] Hardware name: linux,dummy-virt (DT)
> [    0.995708] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
> [    0.998168] pc : pl011_dma_probe+0x90/0x360

This is the code from you vmlinux file:

ffff8000107233e4:       b90087e2        str     w2, [sp, #132]
ffff8000107233e8:       97fcf14c        bl      ffff80001065f918
<dma_request_chan>
ffff8000107233ec:       aa0003f4        mov     x20, x0
ffff8000107233f0:       b140041f        cmn     x0, #0x1, lsl #12
ffff8000107233f4:       54000488        b.hi    ffff800010723484
<pl011_dma_probe+0x11c>  // b.pmore
ffff8000107233f8:       f9400280        ldr     x0, [x20]
ffff8000107233fc:       f9409c02        ldr     x2, [x0, #312]
ffff800010723400:       b4000082        cbz     x2, ffff800010723410
<pl011_dma_probe+0xa8>

It's the "ldr     x0, [x20]" dereferencing 'chan' in pl011_dma_probe() after
checking it for an error value. However it's a NULL pointer, not an
error pointer, indicating that there is a bug in the dmaengine driver
that you use here, or in the dmaengine core code.

I don't see anything suspicious in dmaengine drivers, but there is a
recent series
from Dave Jiang that might explain it. Could you try reverting  commit
deb9541f5052 ("dmaengine: check device and channel list for empty")?

I think the broken change is this one:

@@ -819,6 +850,11 @@ struct dma_chan *dma_request_chan(struct device
*dev, const char *name)

        /* Try to find the channel via the DMA filter map(s) */
        mutex_lock(&dma_list_mutex);
+       if (list_empty(&dma_device_list)) {
+               mutex_unlock(&dma_list_mutex);
+               return NULL;
+       }
+
        list_for_each_entry_safe(d, _d, &dma_device_list, global_node) {
                dma_cap_mask_t mask;
                const struct dma_slave_map *map = dma_filter_match(d,
name, dev);

which needs to return an error code like -ENODEV instead of NULL. There
may be other changes in the same patch that introduce the same bug
elsewhere.

     Arnd
