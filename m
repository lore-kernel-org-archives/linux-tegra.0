From: Dave Jiang <dave.jiang@intel.com>
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
Date: Mon, 6 Jul 2020 08:01:03 -0700
Message-ID: <51d6e5bb-3de1-36dc-15a4-c341b23ca8cd@intel.com>
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
 <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-serial@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, Jiri Slaby <jslaby@suse.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, jirislaby@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, ldewangan@nvidia.com, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Qian Cai <cai@lca.pw>, lkft-triage@lists.linaro.org
List-Id: linux-tegra@vger.kernel.org



On 7/6/2020 5:53 AM, Arnd Bergmann wrote:
> On Mon, Jul 6, 2020 at 1:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> While booting qemu_arm64 and qemu_arm with Linux version 5.8.0-rc3-next-20200706
>> the kernel panic noticed due to kernel NULL pointer dereference.
>>
>> metadata:
>>    git branch: master
>>    git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>    git commit: 5680d14d59bddc8bcbc5badf00dbbd4374858497
>>    git describe: next-20200706
>>    make_kernelversion: 5.8.0-rc3
>>    kernel-config:
>> https://builds.tuxbuild.com/Glr-Ql1wbp3qN3cnHogyNA/kernel.config
>>
>> qemu arm64 boot crash log,
>>
>> [    0.972053] Unable to handle kernel NULL pointer dereference at
>> virtual address 0000000000000000
>> [    0.975301] Mem abort info:
>> [    0.976316]   ESR = 0x96000004
>> [    0.977378]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    0.979363]   SET = 0, FnV = 0
>> [    0.980458]   EA = 0, S1PTW = 0
>> [    0.981583] Data abort info:
>> [    0.982634]   ISV = 0, ISS = 0x00000004
>> [    0.984213]   CM = 0, WnR = 0
>> [    0.985260] [0000000000000000] user address but active_mm is swapper
>> [    0.987600] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>> [    0.989557] Modules linked in:
>> [    0.990671] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
>> 5.8.0-rc3-next-20200706 #1
>> [    0.993711] Hardware name: linux,dummy-virt (DT)
>> [    0.995708] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
>> [    0.998168] pc : pl011_dma_probe+0x90/0x360
> 
> This is the code from you vmlinux file:
> 
> ffff8000107233e4:       b90087e2        str     w2, [sp, #132]
> ffff8000107233e8:       97fcf14c        bl      ffff80001065f918
> <dma_request_chan>
> ffff8000107233ec:       aa0003f4        mov     x20, x0
> ffff8000107233f0:       b140041f        cmn     x0, #0x1, lsl #12
> ffff8000107233f4:       54000488        b.hi    ffff800010723484
> <pl011_dma_probe+0x11c>  // b.pmore
> ffff8000107233f8:       f9400280        ldr     x0, [x20]
> ffff8000107233fc:       f9409c02        ldr     x2, [x0, #312]
> ffff800010723400:       b4000082        cbz     x2, ffff800010723410
> <pl011_dma_probe+0xa8>
> 
> It's the "ldr     x0, [x20]" dereferencing 'chan' in pl011_dma_probe() after
> checking it for an error value. However it's a NULL pointer, not an
> error pointer, indicating that there is a bug in the dmaengine driver
> that you use here, or in the dmaengine core code.

Arnd,
I'm looking at the pl001_dma_probe(), I think we could make it more robust if it 
uses IS_ERR_OR_NULL(chan) instead of IS_ERR(). Should I send a patch for it? I 
suppose looking at the comment header for dma_request_chan() it does say return 
chan ptr or error ptr. Sorry I missed that.


Vinod,
It looks like the only fix for dmaengine for the patch is where Arnd pointed out 
as far as I can tell after auditing it. Let me know how you want to handle this. 
Thanks!

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 0d6529eff66f..48e159e83cf5 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -852,7 +852,7 @@ struct dma_chan *dma_request_chan(struct device *dev, const 
char *name)
         mutex_lock(&dma_list_mutex);
         if (list_empty(&dma_device_list)) {
                 mutex_unlock(&dma_list_mutex);
-               return NULL;
+               return ERR_PTR(-ENODEV);
         }

         list_for_each_entry_safe(d, _d, &dma_device_list, global_node) {


> 
> I don't see anything suspicious in dmaengine drivers, but there is a
> recent series
> from Dave Jiang that might explain it. Could you try reverting  commit
> deb9541f5052 ("dmaengine: check device and channel list for empty")?
> 
> I think the broken change is this one:
> 
> @@ -819,6 +850,11 @@ struct dma_chan *dma_request_chan(struct device
> *dev, const char *name)
> 
>          /* Try to find the channel via the DMA filter map(s) */
>          mutex_lock(&dma_list_mutex);
> +       if (list_empty(&dma_device_list)) {
> +               mutex_unlock(&dma_list_mutex);
> +               return NULL;
> +       }
> +
>          list_for_each_entry_safe(d, _d, &dma_device_list, global_node) {
>                  dma_cap_mask_t mask;
>                  const struct dma_slave_map *map = dma_filter_match(d,
> name, dev);
> 
> which needs to return an error code like -ENODEV instead of NULL. There
> may be other changes in the same patch that introduce the same bug
> elsewhere.
> 
>       Arnd
> 
