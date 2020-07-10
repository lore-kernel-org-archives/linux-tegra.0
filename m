From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 15/23] seq_file: switch over direct seq_read method calls
 to seq_read_iter
Date: Fri, 10 Jul 2020 13:55:29 +0100
Message-ID: <5a2a97f1-58b5-8068-3c69-bb06130ffb35@nvidia.com>
References: <20200707174801.4162712-1-hch@lst.de>
 <20200707174801.4162712-16-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200707174801.4162712-16-hch-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Luis Chamberlain <mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Iurii Zaikin <yzaikin-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Christoph,

On 07/07/2020 18:47, Christoph Hellwig wrote:
> Switch over all instances used directly as methods using these sed
> expressions:
> 
> sed -i -e 's/\.read\(\s*=\s*\)seq_read/\.read_iter\1seq_read_iter/g'
> 
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> ---
>  Documentation/filesystems/seq_file.rst        |  2 +-
>  Documentation/process/clang-format.rst        |  4 +-
>  .../it_IT/process/clang-format.rst            |  4 +-
>  arch/arm/mm/ptdump_debugfs.c                  |  2 +-
>  arch/arm64/kvm/vgic/vgic-debug.c              |  2 +-
>  arch/c6x/platforms/pll.c                      |  2 +-
>  arch/mips/cavium-octeon/oct_ilm.c             |  2 +-
>  arch/mips/kernel/segment.c                    |  2 +-
>  arch/mips/ralink/bootrom.c                    |  2 +-
>  arch/powerpc/kvm/book3s_xive_native.c         |  2 +-
>  arch/powerpc/kvm/timing.c                     |  2 +-
>  arch/powerpc/mm/ptdump/bats.c                 |  2 +-
>  arch/powerpc/mm/ptdump/hashpagetable.c        |  2 +-
>  arch/powerpc/mm/ptdump/ptdump.c               |  2 +-
>  arch/powerpc/mm/ptdump/segment_regs.c         |  2 +-
>  arch/powerpc/platforms/cell/spufs/file.c      |  8 ++--
>  arch/powerpc/platforms/pseries/hvCall_inst.c  |  2 +-
>  arch/s390/kernel/diag.c                       |  2 +-
>  arch/s390/mm/dump_pagetables.c                |  2 +-
>  arch/s390/pci/pci_debug.c                     |  2 +-
>  arch/sh/mm/asids-debugfs.c                    |  2 +-
>  arch/sh/mm/cache-debugfs.c                    |  2 +-
>  arch/sh/mm/pmb.c                              |  2 +-
>  arch/sh/mm/tlb-debugfs.c                      |  2 +-
>  arch/x86/kernel/cpu/mce/severity.c            |  2 +-
>  arch/x86/mm/pat/memtype.c                     |  2 +-
>  arch/x86/mm/pat/set_memory.c                  |  2 +-
>  arch/x86/xen/p2m.c                            |  2 +-
>  block/blk-mq-debugfs.c                        |  2 +-
>  drivers/base/power/wakeup.c                   |  2 +-
>  drivers/block/aoe/aoeblk.c                    |  2 +-
>  drivers/block/drbd/drbd_debugfs.c             | 10 ++---
>  drivers/block/nbd.c                           |  4 +-
>  drivers/block/pktcdvd.c                       |  2 +-
>  drivers/block/rsxx/core.c                     |  4 +-
>  drivers/bus/mvebu-mbus.c                      |  4 +-
>  drivers/char/tpm/eventlog/common.c            |  2 +-
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  2 +-
>  .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  2 +-
>  drivers/crypto/amlogic/amlogic-gxl-core.c     |  2 +-
>  drivers/crypto/caam/dpseci-debugfs.c          |  2 +-
>  drivers/crypto/cavium/zip/zip_main.c          |  6 +--
>  drivers/crypto/hisilicon/qm.c                 |  2 +-
>  drivers/crypto/qat/qat_common/adf_cfg.c       |  2 +-
>  .../qat/qat_common/adf_transport_debug.c      |  4 +-
>  drivers/firmware/tegra/bpmp-debugfs.c         |  2 +-
>  drivers/gpio/gpiolib.c                        |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c      |  4 +-
>  .../gpu/drm/arm/display/komeda/komeda_dev.c   |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
>  drivers/gpu/drm/armada/armada_debugfs.c       |  2 +-
>  drivers/gpu/drm/drm_debugfs.c                 |  6 +--
>  drivers/gpu/drm/drm_debugfs_crc.c             |  2 +-
>  drivers/gpu/drm/drm_mipi_dbi.c                |  2 +-
>  .../drm/i915/display/intel_display_debugfs.c  | 16 ++++----
>  drivers/gpu/drm/i915/gt/debugfs_gt.h          |  2 +-
>  drivers/gpu/drm/i915/i915_debugfs_params.c    | 12 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
>  drivers/gpu/drm/msm/msm_debugfs.c             |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c     |  2 +-
>  drivers/gpu/drm/omapdrm/dss/dss.c             |  2 +-
>  drivers/gpu/host1x/debug.c                    |  4 +-
>  drivers/gpu/vga/vga_switcheroo.c              |  2 +-
>  drivers/hid/hid-picolcd_debugfs.c             |  2 +-
>  drivers/hid/hid-wiimote-debug.c               |  2 +-
>  drivers/ide/ide-proc.c                        |  2 +-
>  drivers/infiniband/hw/cxgb4/device.c          |  4 +-
>  drivers/infiniband/hw/qib/qib_debugfs.c       |  2 +-
>  drivers/infiniband/ulp/ipoib/ipoib_fs.c       |  4 +-
>  drivers/md/bcache/closure.c                   |  2 +-
>  drivers/media/cec/core/cec-core.c             |  2 +-
>  drivers/media/pci/saa7164/saa7164-core.c      |  2 +-
>  drivers/memory/emif.c                         |  4 +-
>  drivers/memory/tegra/tegra124-emc.c           |  2 +-
>  drivers/memory/tegra/tegra186-emc.c           |  2 +-
>  drivers/memory/tegra/tegra20-emc.c            |  2 +-
>  drivers/memory/tegra/tegra30-emc.c            |  2 +-
>  drivers/mfd/ab3100-core.c                     |  2 +-
>  drivers/mfd/ab3100-otp.c                      |  2 +-
>  drivers/mfd/ab8500-debugfs.c                  | 14 +++----
>  drivers/mfd/tps65010.c                        |  2 +-
>  drivers/misc/habanalabs/debugfs.c             |  2 +-
>  drivers/mmc/core/mmc_test.c                   |  2 +-
>  drivers/mtd/mtdcore.c                         |  4 +-
>  drivers/mtd/ubi/debug.c                       |  2 +-
>  .../ethernet/chelsio/cxgb4/cxgb4_debugfs.c    | 38 +++++++++----------
>  drivers/net/ethernet/chelsio/cxgb4/l2t.c      |  2 +-
>  .../ethernet/chelsio/cxgb4vf/cxgb4vf_main.c   |  8 ++--
>  .../freescale/dpaa2/dpaa2-eth-debugfs.c       |  6 +--
>  .../net/ethernet/intel/fm10k/fm10k_debugfs.c  |  2 +-
>  .../marvell/octeontx2/af/rvu_debugfs.c        |  2 +-
>  drivers/net/wireless/ath/ath5k/debug.c        |  2 +-
>  drivers/net/wireless/ath/wil6210/debugfs.c    | 14 +++----
>  .../broadcom/brcm80211/brcmsmac/debug.c       |  2 +-
>  .../net/wireless/intel/iwlwifi/fw/debugfs.c   |  2 +-
>  .../net/wireless/intel/iwlwifi/pcie/trans.c   |  2 +-
>  .../wireless/mediatek/mt76/mt7603/debugfs.c   |  2 +-
>  .../wireless/mediatek/mt76/mt7615/debugfs.c   |  2 +-
>  .../wireless/mediatek/mt76/mt76x02_debugfs.c  |  4 +-
>  .../wireless/mediatek/mt76/mt7915/debugfs.c   |  4 +-
>  .../net/wireless/mediatek/mt7601u/debugfs.c   |  4 +-
>  drivers/net/wireless/realtek/rtlwifi/debug.c  |  2 +-
>  drivers/net/wireless/realtek/rtw88/debug.c    |  4 +-
>  drivers/net/wireless/rsi/rsi_91x_debugfs.c    |  4 +-
>  drivers/net/xen-netback/xenbus.c              |  2 +-
>  drivers/nvme/host/fabrics.c                   |  2 +-
>  drivers/pci/controller/pci-tegra.c            |  2 +-
>  drivers/platform/x86/asus-wmi.c               |  2 +-
>  drivers/platform/x86/intel_pmc_core.c         |  2 +-
>  .../platform/x86/intel_telemetry_debugfs.c    |  4 +-
>  drivers/power/supply/da9030_battery.c         |  2 +-
>  drivers/pwm/core.c                            |  2 +-
>  drivers/ras/cec.c                             |  2 +-
>  drivers/ras/debugfs.c                         |  2 +-
>  drivers/s390/block/dasd.c                     |  2 +-
>  drivers/s390/cio/qdio_debug.c                 |  2 +-
>  drivers/scsi/hisi_sas/hisi_sas_main.c         | 32 ++++++++--------
>  drivers/scsi/qedf/qedf_dbg.h                  |  2 +-
>  drivers/scsi/qedi/qedi_dbg.h                  |  2 +-
>  drivers/scsi/qla2xxx/qla_dfs.c                | 12 +++---
>  drivers/scsi/snic/snic_debugfs.c              |  4 +-
>  drivers/sh/intc/virq-debugfs.c                |  2 +-
>  drivers/soc/qcom/cmd-db.c                     |  2 +-
>  drivers/soc/qcom/socinfo.c                    |  4 +-
>  drivers/soc/ti/knav_dma.c                     |  2 +-
>  drivers/soc/ti/knav_qmss_queue.c              |  2 +-
>  .../interface/vchiq_arm/vchiq_debugfs.c       |  4 +-
>  drivers/usb/chipidea/debug.c                  |  4 +-
>  drivers/usb/dwc2/debugfs.c                    |  2 +-
>  drivers/usb/dwc3/debugfs.c                    |  8 ++--
>  drivers/usb/gadget/udc/lpc32xx_udc.c          |  2 +-
>  drivers/usb/gadget/udc/renesas_usb3.c         |  2 +-
>  drivers/usb/host/xhci-debugfs.c               |  6 +--
>  drivers/usb/mtu3/mtu3_debugfs.c               |  8 ++--
>  drivers/usb/musb/musb_debugfs.c               |  4 +-
>  drivers/visorbus/visorbus_main.c              |  2 +-
>  drivers/xen/xenfs/xensyms.c                   |  2 +-
>  fs/debugfs/file.c                             |  4 +-
>  fs/dlm/debug_fs.c                             |  8 ++--
>  fs/gfs2/glock.c                               |  6 +--
>  fs/nfsd/nfs4state.c                           |  4 +-
>  fs/nfsd/nfsctl.c                              | 10 ++---
>  fs/ocfs2/cluster/netdebug.c                   |  6 +--
>  fs/ocfs2/dlm/dlmdebug.c                       |  2 +-
>  fs/ocfs2/dlmglue.c                            |  2 +-
>  fs/openpromfs/inode.c                         |  2 +-
>  fs/orangefs/orangefs-debugfs.c                |  2 +-
>  fs/proc/array.c                               |  2 +-
>  fs/proc/base.c                                | 24 ++++++------
>  fs/proc/fd.c                                  |  2 +-
>  fs/proc/task_mmu.c                            |  8 ++--
>  fs/proc/task_nommu.c                          |  2 +-
>  fs/proc_namespace.c                           |  6 +--
>  include/linux/seq_file.h                      |  4 +-
>  kernel/bpf/inode.c                            |  2 +-
>  kernel/fail_function.c                        |  2 +-
>  kernel/gcov/fs.c                              |  2 +-
>  kernel/irq/debugfs.c                          |  2 +-
>  kernel/kcsan/debugfs.c                        |  2 +-
>  kernel/sched/debug.c                          |  2 +-
>  kernel/time/test_udelay.c                     |  2 +-
>  kernel/trace/ftrace.c                         | 16 ++++----
>  kernel/trace/trace.c                          | 20 +++++-----
>  kernel/trace/trace_dynevent.c                 |  2 +-
>  kernel/trace/trace_events.c                   | 10 ++---
>  kernel/trace/trace_events_hist.c              |  4 +-
>  kernel/trace/trace_events_synth.c             |  2 +-
>  kernel/trace/trace_events_trigger.c           |  2 +-
>  kernel/trace/trace_kprobe.c                   |  4 +-
>  kernel/trace/trace_printk.c                   |  2 +-
>  kernel/trace/trace_stack.c                    |  4 +-
>  kernel/trace/trace_stat.c                     |  2 +-
>  kernel/trace/trace_uprobe.c                   |  4 +-
>  lib/debugobjects.c                            |  2 +-
>  lib/dynamic_debug.c                           |  2 +-
>  lib/error-inject.c                            |  2 +-
>  lib/kunit/debugfs.c                           |  2 +-
>  mm/kmemleak.c                                 |  2 +-
>  net/6lowpan/debugfs.c                         |  2 +-
>  net/batman-adv/debugfs.c                      |  4 +-
>  net/bluetooth/6lowpan.c                       |  2 +-
>  net/hsr/hsr_debugfs.c                         |  2 +-
>  net/l2tp/l2tp_debugfs.c                       |  2 +-
>  net/sunrpc/cache.c                            |  2 +-
>  net/sunrpc/debugfs.c                          |  4 +-
>  net/sunrpc/rpc_pipe.c                         |  2 +-
>  security/apparmor/apparmorfs.c                | 10 ++---
>  security/integrity/ima/ima_fs.c               |  6 +--
>  security/selinux/selinuxfs.c                  |  2 +-
>  security/smack/smackfs.c                      | 20 +++++-----
>  193 files changed, 375 insertions(+), 375 deletions(-)


Following this change, I have noticed that several debugfs entries can
no longer be read on some Tegra platforms. For example ...

$ sudo cat /sys/kernel/debug/usb/xhci/3530000.usb/event-ring/cycle
cat: /sys/kernel/debug/usb/xhci/3530000.usb/event-ring/cycle: Invalid
argument

$ sudo cat /sys/kernel/debug/emc/available_rates


cat: /sys/kernel/debug/emc/available_rates: Invalid argument

$ sudo cat /sys/kernel/debug/bpmp/debug/proc/testint
cat: /sys/kernel/debug/bpmp/debug/proc/testint: Invalid argument

$ sudo cat /sys/kernel/debug/pcie/ports


cat: /sys/kernel/debug/pcie/ports: Invalid argument

I have reverted the above drivers to use seq_read() instead of
seq_read_iter() and they work again. Have you seen any problems with this?

Cheers
Jon

-- 
nvpublic
