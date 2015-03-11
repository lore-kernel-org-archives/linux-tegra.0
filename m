From: Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] pmu/gk20a: PMU boot support.
Date: Wed, 11 Mar 2015 12:03:51 +0530
Message-ID: <1426055631-1166-1-git-send-email-dgoyal@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

It adds PMU boot support.It loads PMU
firmware into PMU falcon.RM/Kernel driver
receives INIT ack (through interrupt mechanism)
from PMU when PMU boots with success.

Signed-off-by: Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/include/nvkm/subdev/pmu.h |   26 +-
 drm/nouveau/nvkm/subdev/pmu/base.c    |  108 ++
 drm/nouveau/nvkm/subdev/pmu/gk20a.c   | 2131 ++++++++++++++++++++++++++++++++-
 drm/nouveau/nvkm/subdev/pmu/gk20a.h   |  369 ++++++
 drm/nouveau/nvkm/subdev/pmu/priv.h    |  264 ++++
 5 files changed, 2884 insertions(+), 14 deletions(-)
 create mode 100644 drm/nouveau/nvkm/subdev/pmu/gk20a.h

diff --git a/drm/nouveau/include/nvkm/subdev/pmu.h b/drm/nouveau/include/nvkm/subdev/pmu.h
index 7b86acc634a0..659b4e0ba02b 100644
--- a/drm/nouveau/include/nvkm/subdev/pmu.h
+++ b/drm/nouveau/include/nvkm/subdev/pmu.h
@@ -1,7 +1,20 @@
 #ifndef __NVKM_PMU_H__
 #define __NVKM_PMU_H__
 #include <core/subdev.h>
+#include <core/device.h>
+#include <subdev/mmu.h>
+#include <linux/debugfs.h>
 
+struct pmu_buf_desc {
+	struct nvkm_gpuobj *pmubufobj;
+	struct nvkm_vma pmubufvma;
+	size_t size;
+};
+struct pmu_priv_vm {
+	struct nvkm_gpuobj *mem;
+	struct nvkm_gpuobj *pgd;
+	struct nvkm_vm *vm;
+};
 struct nvkm_pmu {
 	struct nvkm_subdev base;
 
@@ -20,9 +33,20 @@ struct nvkm_pmu {
 		u32 message;
 		u32 data[2];
 	} recv;
-
+	wait_queue_head_t init_wq;
+	bool gr_initialised;
+	struct dentry *debugfs;
+	struct pmu_buf_desc *pg_buf;
+	struct pmu_priv_vm *pmuvm;
 	int  (*message)(struct nvkm_pmu *, u32[2], u32, u32, u32, u32);
 	void (*pgob)(struct nvkm_pmu *, bool);
+	int (*pmu_mutex_acquire)(struct nvkm_pmu *, u32 id, u32 *token);
+	int (*pmu_mutex_release)(struct nvkm_pmu *, u32 id, u32 *token);
+	int (*pmu_load_norm)(struct nvkm_pmu *pmu, u32 *load);
+	int (*pmu_load_update)(struct nvkm_pmu *pmu);
+	void (*pmu_reset_load_counters)(struct nvkm_pmu *pmu);
+	void (*pmu_get_load_counters)(struct nvkm_pmu *pmu, u32 *busy_cycles,
+		u32 *total_cycles);
 };
 
 static inline struct nvkm_pmu *
diff --git a/drm/nouveau/nvkm/subdev/pmu/base.c b/drm/nouveau/nvkm/subdev/pmu/base.c
index 054b2d2eec35..6afd389b9764 100644
--- a/drm/nouveau/nvkm/subdev/pmu/base.c
+++ b/drm/nouveau/nvkm/subdev/pmu/base.c
@@ -25,6 +25,114 @@
 
 #include <subdev/timer.h>
 
+/* init allocator struct */
+int nvkm_pmu_allocator_init(struct nvkm_pmu_allocator *allocator,
+		const char *name, u32 start, u32 len)
+{
+	memset(allocator, 0, sizeof(struct nvkm_pmu_allocator));
+
+	strncpy(allocator->name, name, 32);
+
+	allocator->base = start;
+	allocator->limit = start + len - 1;
+
+	allocator->bitmap = kcalloc(BITS_TO_LONGS(len), sizeof(long),
+			GFP_KERNEL);
+	if (!allocator->bitmap)
+		return -ENOMEM;
+
+	allocator_dbg(allocator, "%s : base %d, limit %d",
+		allocator->name, allocator->base);
+
+	init_rwsem(&allocator->rw_sema);
+
+	allocator->alloc = nvkm_pmu_allocator_block_alloc;
+	allocator->free = nvkm_pmu_allocator_block_free;
+
+	return 0;
+}
+
+/* destroy allocator, free all remaining blocks if any */
+void nvkm_pmu_allocator_destroy(struct nvkm_pmu_allocator *allocator)
+{
+	down_write(&allocator->rw_sema);
+
+	kfree(allocator->bitmap);
+
+	memset(allocator, 0, sizeof(struct nvkm_pmu_allocator));
+}
+
+/*
+ * *addr != ~0 for fixed address allocation. if *addr == 0, base addr is
+ * returned to caller in *addr.
+ *
+ * contiguous allocation, which allocates one block of
+ * contiguous address.
+*/
+int nvkm_pmu_allocator_block_alloc(struct nvkm_pmu_allocator *allocator,
+		u32 *addr, u32 len, u32 align)
+{
+	unsigned long _addr;
+
+	allocator_dbg(allocator, "[in] addr %d, len %d", *addr, len);
+
+	if ((*addr != 0 && *addr < allocator->base) || /* check addr range */
+	    *addr + len > allocator->limit || /* check addr range */
+	    *addr & (align - 1) || /* check addr alignment */
+	     len == 0)                        /* check len */
+		return -EINVAL;
+
+	len = ALIGN(len, align);
+	if (!len)
+		return -ENOMEM;
+
+	down_write(&allocator->rw_sema);
+
+	_addr = bitmap_find_next_zero_area(allocator->bitmap,
+			allocator->limit - allocator->base + 1,
+			*addr ? (*addr - allocator->base) : 0,
+			len,
+			align - 1);
+	if ((_addr > allocator->limit - allocator->base + 1) ||
+	    (*addr && *addr != (_addr + allocator->base))) {
+		up_write(&allocator->rw_sema);
+		return -ENOMEM;
+	}
+
+	bitmap_set(allocator->bitmap, _addr, len);
+	*addr = allocator->base + _addr;
+
+	up_write(&allocator->rw_sema);
+
+	allocator_dbg(allocator, "[out] addr %d, len %d", *addr, len);
+
+	return 0;
+}
+
+/* free all blocks between start and end */
+int nvkm_pmu_allocator_block_free(struct nvkm_pmu_allocator *allocator,
+		u32 addr, u32 len, u32 align)
+{
+	allocator_dbg(allocator, "[in] addr %d, len %d", addr, len);
+
+	if (addr + len > allocator->limit || /* check addr range */
+	    addr < allocator->base ||
+	    addr & (align - 1))   /* check addr alignment */
+		return -EINVAL;
+
+	len = ALIGN(len, align);
+	if (!len)
+		return -EINVAL;
+
+	down_write(&allocator->rw_sema);
+	bitmap_clear(allocator->bitmap, addr - allocator->base, len);
+	up_write(&allocator->rw_sema);
+
+	allocator_dbg(allocator, "[out] addr %d, len %d", addr, len);
+
+	return 0;
+}
+
 void
 nvkm_pmu_pgob(struct nvkm_pmu *pmu, bool enable)
 {
diff --git a/drm/nouveau/nvkm/subdev/pmu/gk20a.c b/drm/nouveau/nvkm/subdev/pmu/gk20a.c
index a49934bbe637..0fd2530301a3 100644
--- a/drm/nouveau/nvkm/subdev/pmu/gk20a.c
+++ b/drm/nouveau/nvkm/subdev/pmu/gk20a.c
@@ -20,21 +20,67 @@
  * DEALINGS IN THE SOFTWARE.
  */
 #include "priv.h"
+#include "gk20a.h"
+#include <core/client.h>
+#include <core/gpuobj.h>
+#include <subdev/bar.h>
+#include <subdev/fb.h>
+#include <subdev/mc.h>
+#include <subdev/timer.h>
+#include <subdev/mmu.h>
+#include <subdev/pmu.h>
+#include <engine/falcon.h>
 
+#include <linux/delay.h>	/* for mdelay */
+#include <linux/firmware.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/debugfs.h>
+#include <linux/dma-mapping.h>
+#include <linux/uaccess.h>
 #include <subdev/clk.h>
 #include <subdev/timer.h>
 #include <subdev/volt.h>
 
 #define BUSY_SLOT	0
 #define CLK_SLOT	7
+#define GK20A_PMU_UCODE_IMAGE	"gpmu_ucode.bin"
+
+static int falc_trace_show(struct seq_file *s, void *data);
+static int falc_trace_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, falc_trace_show, inode->i_private);
+}
+static const struct file_operations falc_trace_fops = {
+	.open		= falc_trace_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+struct pmu_priv_vm pmuvm;
+const struct firmware *pmufw;
+
+static void  gk20a_pmu_isr(struct nvkm_pmu *ppmu);
+static void pmu_process_message(struct work_struct *work);
+
+static int
+gk20a_pmu_init_vm(struct nvkm_pmu *ppmu, const struct firmware *fw);
+static void
+gk20a_pmu_dump_firmware_info(struct nvkm_pmu *ppmu, const struct firmware *fw);
+
+static int
+gk20a_pmu_load_firmware(struct nvkm_pmu *ppmu, const struct firmware **pfw);
+static int gk20a_init_pmu_setup_sw(struct nvkm_pmu *ppmu);
+static int gk20a_init_pmu_setup_hw1(struct nvkm_pmu *ppmu, struct nvkm_mc *pmc);
+static void gk20a_pmu_intr(struct nvkm_subdev *subdev);
 
+static void gk20a_pmu_pgob(struct nvkm_pmu *ppmu, bool enable);
 struct gk20a_pmu_dvfs_data {
 	int p_load_target;
 	int p_load_max;
 	int p_smooth;
 	unsigned int avg_load;
 };
-
 struct gk20a_pmu_priv {
 	struct nvkm_pmu base;
 	struct nvkm_alarm alarm;
@@ -46,7 +92,30 @@ struct gk20a_pmu_dvfs_dev_status {
 	unsigned long busy;
 	int cur_state;
 };
-
+int gk20a_pmu_debugfs_init(struct nvkm_pmu *ppmu)
+{
+	struct dentry *d;
+	ppmu->debugfs = debugfs_create_dir("PMU", NULL);
+	if (!ppmu->debugfs)
+		goto err_out;
+	nv_debug(ppmu, "PMU directory created with success\n");
+	d = debugfs_create_file(
+		"falc_trace", 0644, ppmu->debugfs, ppmu,
+						&falc_trace_fops);
+	if (!d)
+		goto err_out;
+	return 0;
+err_out:
+	pr_err("%s: Failed to make debugfs node\n", __func__);
+	debugfs_remove_recursive(ppmu->debugfs);
+	return -ENOMEM;
+}
+void gk20a_pmu_release_firmware(struct nvkm_pmu *ppmu,
+						    const struct firmware *pfw)
+{
+	nv_debug(ppmu, "firmware released\n");
+	release_firmware(pfw);
+}
 static int
 gk20a_pmu_dvfs_target(struct gk20a_pmu_priv *priv, int *state)
 {
@@ -164,31 +233,145 @@ gk20a_pmu_fini(struct nvkm_object *object, bool suspend)
 {
 	struct nvkm_pmu *pmu = (void *)object;
 	struct gk20a_pmu_priv *priv = (void *)pmu;
-
+	nv_wr32(pmu, 0x10a014, 0x00000060);
+	flush_work(&pmu->recv.work);
 	nvkm_timer_alarm_cancel(priv, &priv->alarm);
 
 	return nvkm_subdev_fini(&pmu->base, suspend);
 }
+static bool find_hex_in_string(char *strings, u32 *hex_pos)
+{
+	u32 i = 0, j = strlen(strings);
+	for (; i < j; i++) {
+		if (strings[i] == '%')
+			if (strings[i + 1] == 'x' || strings[i + 1] == 'X') {
+				*hex_pos = i;
+				return true;
+			}
+	}
+	*hex_pos = -1;
+	return false;
+}
+static int falc_trace_show(struct seq_file *s, void *data)
+{
+	struct nvkm_pmu *ppmu = s->private;
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+	u32 i = 0, j = 0, k, l, m;
+	char part_str[40];
+	u32 data1;
+	char *log_data = kmalloc(GK20A_PMU_TRACE_BUFSIZE, GFP_KERNEL);
+	char *trace = log_data;
+	u32 *trace1 = (u32 *)log_data;
+	for (i = 0; i < GK20A_PMU_TRACE_BUFSIZE; i += 4) {
+		data1 = nv_ro32(pmu->trace_buf.pmubufobj, 0x0000 + i);
+		memcpy(log_data + i, (void *)(&data1), 32);
+	}
+	for (i = 0; i < GK20A_PMU_TRACE_BUFSIZE; i += 0x40) {
+		for (j = 0; j < 0x40; j++)
+			if (trace1[(i / 4) + j])
+				break;
+		if (j == 0x40)
+			goto out;
+		seq_printf(s, "Index %x: ", trace1[(i / 4)]);
+		l = 0;
+		m = 0;
+		while (find_hex_in_string((trace+i+20+m), &k)) {
+			if (k >= 40)
+				break;
+			strncpy(part_str, (trace+i+20+m), k);
+			part_str[k] = 0;
+			seq_printf(s, "%s0x%x", part_str,
+					trace1[(i / 4) + 1 + l]);
+			l++;
+			m += k + 2;
+		}
+		seq_printf(s, "%s", (trace+i+20+m));
+	}
+out:
+	kfree(log_data);
+	return 0;
+}
 
 int
 gk20a_pmu_init(struct nvkm_object *object)
 {
-	struct nvkm_pmu *pmu = (void *)object;
-	struct gk20a_pmu_priv *priv = (void *)pmu;
+	struct nvkm_pmu *ppmu = (void *)object;
+	struct nvkm_mc *pmc = nvkm_mc(object);
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu;
+	struct gk20a_pmu_priv *priv;
+	struct pmu_gk20a_data *gk20adata;
 	int ret;
 
-	ret = nvkm_subdev_init(&pmu->base);
+	pmu = &impl->pmudata;
+
+	nv_subdev(ppmu)->intr = gk20a_pmu_intr;
+
+	mutex_init(&pmu->isr_mutex);
+	mutex_init(&pmu->pmu_copy_lock);
+	mutex_init(&pmu->pmu_seq_lock);
+
+	if (pmufw == NULL) {
+		ret = gk20a_pmu_load_firmware(ppmu, &pmufw);
+		if (ret < 0) {
+			nv_error(ppmu, "failed to load pmu fimware\n");
+			return ret;
+		}
+		nv_debug(ppmu, "loading firmware sucessful\n");
+		ret = gk20a_pmu_init_vm(ppmu, pmufw);
+		if (ret < 0) {
+			nv_error(ppmu, "failed to map pmu fw to va space\n");
+			goto init_vm_err;
+		}
+	}
+	pmu->desc = (struct pmu_ucode_desc *)pmufw->data;
+	gk20a_pmu_dump_firmware_info(ppmu, pmufw);
+
+	if (pmu->desc->app_version != APP_VERSION_GK20A) {
+		nv_error(ppmu,
+		"PMU code version not supported version: %d\n",
+			pmu->desc->app_version);
+		ret = -EINVAL;
+		goto app_ver_err;
+	}
+	gk20adata = kzalloc(sizeof(*gk20adata), GFP_KERNEL);
+	if (!gk20adata) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	pmu->pmu_chip_data = (void *)gk20adata;
+
+	pmu->remove_support = gk20a_remove_pmu_support;
+
+	ret = gk20a_init_pmu_setup_sw(ppmu);
 	if (ret)
-		return ret;
+		goto err;
+
+	pmu->pmu_state = PMU_STATE_STARTING;
+	ret = gk20a_init_pmu_setup_hw1(ppmu, pmc);
+	if (ret)
+		goto err;
+
+	priv = (void *)ppmu;
 
-	pmu->pgob = nvkm_pmu_pgob;
+	ret = nvkm_subdev_init(&ppmu->base);
+	if (ret)
+		goto err;
+
+	ppmu->pgob = nvkm_pmu_pgob;
 
-	/* init pwr perf counter */
-	nv_wr32(pmu, 0x10a504 + (BUSY_SLOT * 0x10), 0x00200001);
-	nv_wr32(pmu, 0x10a50c + (BUSY_SLOT * 0x10), 0x00000002);
-	nv_wr32(pmu, 0x10a50c + (CLK_SLOT * 0x10), 0x00000003);
+	/* init pmu perf counter */
+	nv_wr32(ppmu, 0x10a504 + (BUSY_SLOT * 0x10), 0x00200001);
+	nv_wr32(ppmu, 0x10a50c + (BUSY_SLOT * 0x10), 0x00000002);
+	nv_wr32(ppmu, 0x10a50c + (CLK_SLOT * 0x10), 0x00000003);
 
-	nvkm_timer_alarm(pmu, 2000000000, &priv->alarm);
+	nvkm_timer_alarm(ppmu, 2000000000, &priv->alarm);
+err:
+init_vm_err:
+app_ver_err:
+	gk20a_pmu_release_firmware(ppmu, pmufw);
 	return ret;
 }
 
@@ -226,4 +409,1926 @@ gk20a_pmu_oclass = &(struct nvkm_pmu_impl) {
 		.init = gk20a_pmu_init,
 		.fini = gk20a_pmu_fini,
 	},
+	.base.handle = NV_SUBDEV(PMU, 0xea),
+	.pgob = gk20a_pmu_pgob,
 }.base;
+void pmu_copy_from_dmem(struct pmu_desc *pmu,
+		u32 src, u8 *dst, u32 size, u8 port)
+{
+	u32 i, words, bytes;
+	u32 data, addr_mask;
+	u32 *dst_u32 = (u32 *)dst;
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+
+	if (size == 0) {
+		nv_error(ppmu, "size is zero\n");
+		goto out;
+	}
+
+	if (src & 0x3) {
+		nv_error(ppmu, "src (0x%08x) not 4-byte aligned\n", src);
+		goto out;
+	}
+
+	mutex_lock(&pmu->pmu_copy_lock);
+
+	words = size >> 2;
+	bytes = size & 0x3;
+
+	addr_mask = (0x3f << 2) | 0xff << 8;
+
+	src &= addr_mask;
+
+	nv_wr32(ppmu, (0x10a1c0 + (port * 8)), (src | (0x1 << 25)));
+
+	for (i = 0; i < words; i++) {
+		dst_u32[i] = nv_rd32(ppmu, (0x0010a1c4 + port * 8));
+		nv_debug(ppmu, "0x%08x\n", dst_u32[i]);
+	}
+	if (bytes > 0) {
+		data = nv_rd32(ppmu, (0x0010a1c4 + port * 8));
+		nv_debug(ppmu, "0x%08x\n", data);
+
+		for (i = 0; i < bytes; i++)
+			dst[(words << 2) + i] = ((u8 *)&data)[i];
+	}
+	mutex_unlock(&pmu->pmu_copy_lock);
+out:
+	nv_debug(ppmu, "exit %s\n", __func__);
+}
+
+void pmu_copy_to_dmem(struct pmu_desc *pmu,
+		u32 dst, u8 *src, u32 size, u8 port)
+{
+	u32 i, words, bytes;
+	u32 data, addr_mask;
+	u32 *src_u32 = (u32 *)src;
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+
+	if (size == 0) {
+		nv_error(ppmu, "size is zero\n");
+		goto out;
+	}
+
+	if (dst & 0x3) {
+		nv_error(ppmu, "dst (0x%08x) not 4-byte aligned\n", dst);
+		goto out;
+	}
+
+	mutex_lock(&pmu->pmu_copy_lock);
+
+	words = size >> 2;
+	bytes = size & 0x3;
+
+	addr_mask = (0x3f << 2) | 0xff << 8;
+
+	dst &= addr_mask;
+
+	nv_wr32(ppmu, (0x10a1c0 + (port * 8)), (dst | (0x1 << 24)));
+
+	for (i = 0; i < words; i++) {
+		nv_wr32(ppmu, (0x10a1c4 + (port * 8)), src_u32[i]);
+		nv_debug(ppmu, "0x%08x\n", src_u32[i]);
+	}
+	if (bytes > 0) {
+		data = 0;
+		for (i = 0; i < bytes; i++)
+			((u8 *)&data)[i] = src[(words << 2) + i];
+		nv_wr32(ppmu, (0x10a1c4 + (port * 8)), data);
+		nv_debug(ppmu, "0x%08x\n", data);
+	}
+
+	data = nv_rd32(ppmu, (0x10a1c0 + (port * 8))) & addr_mask;
+	size = ALIGN(size, 4);
+	if (data != dst + size) {
+		nv_error(ppmu, "copy failed. bytes written %d, expected %d",
+			data - dst, size);
+	}
+	mutex_unlock(&pmu->pmu_copy_lock);
+out:
+	nv_debug(ppmu, "exit %s", __func__);
+}
+
+static int pmu_idle(struct nvkm_pmu *ppmu)
+{
+	unsigned long end_jiffies = jiffies +
+		msecs_to_jiffies(2000);
+	u32 idle_stat;
+
+	/* wait for pmu idle */
+	do {
+		idle_stat = nv_rd32(ppmu, 0x0010a04c);
+
+		if (((idle_stat & 0x01) == 0) &&
+			((idle_stat >> 1) & 0x7fff) == 0) {
+			break;
+		}
+
+		if (time_after_eq(jiffies, end_jiffies)) {
+			nv_error(ppmu, "timeout waiting pmu idle : 0x%08x",
+				  idle_stat);
+			return -EBUSY;
+		}
+		usleep_range(100, 200);
+	} while (1);
+
+	return 0;
+}
+
+void pmu_enable_irq(struct nvkm_pmu *ppmu, struct nvkm_mc *pmc,
+			bool enable)
+{
+
+	nv_wr32(pmc, 0x00000640,
+		nv_rd32(pmc, 0x00000640) &
+		~0x1000000);
+	nv_wr32(pmc, 0x00000644,
+		nv_rd32(pmc, 0x00000644) &
+		~0x1000000);
+	nv_wr32(ppmu, 0x0010a014, 0xff);
+
+	if (enable) {
+		nv_debug(ppmu, "enable pmu irq\n");
+		/* dest 0=falcon, 1=host; level 0=irq0, 1=irq1
+		nv_wr32(ppmu, 0x0010a01c, 0xff01ff52);
+		0=disable, 1=enable*/
+
+		nv_wr32(ppmu, 0x0010a010, 0xff);
+		nv_wr32(pmc, 0x00000640,
+			nv_rd32(pmc, 0x00000640) |
+			0x1000000);
+		nv_wr32(pmc, 0x00000644,
+			nv_rd32(pmc, 0x00000644) |
+			0x1000000);
+	} else {
+		nv_debug(ppmu, "disable pmu irq\n");
+	}
+
+}
+
+static int pmu_enable_hw(struct nvkm_pmu *ppmu, struct nvkm_mc *pmc,
+			bool enable)
+{
+	u32 reg;
+
+	if (enable) {
+		int retries = GK20A_IDLE_CHECK_MAX / GK20A_IDLE_CHECK_DEFAULT;
+		/*need a spinlock?*/
+		reg = nv_rd32(pmc, 0x00000200);
+		reg |= 0x2000;
+		nv_wr32(pmc, 0x00000200, reg);
+		nv_rd32(pmc, 0x00000200);
+		do {
+			u32 w = nv_rd32(ppmu, 0x0010a10c) & 0x6;
+
+			if (!w)
+				return 0;
+
+			udelay(GK20A_IDLE_CHECK_DEFAULT);
+		} while (--retries);
+
+		reg = nv_rd32(pmc, 0x00000200);
+		reg &= ~0x2000;
+		nv_wr32(pmc, 0x00000200, reg);
+		nv_error(ppmu, "Falcon mem scrubbing timeout\n");
+
+		goto error;
+	} else {
+		reg = nv_rd32(pmc, 0x00000200);
+		reg &= ~0x2000;
+		nv_wr32(pmc, 0x00000200, reg);
+		return 0;
+	}
+error:
+	return -ETIMEDOUT;
+}
+
+static int pmu_enable(struct nvkm_pmu *ppmu, struct nvkm_mc *pmc,
+			bool enable)
+{
+	u32 pmc_enable;
+	int err;
+
+	if (!enable) {
+		pmc_enable = nv_rd32(pmc, 0x200);
+		if ((pmc_enable & 0x2000) != 0x0) {
+			pmu_enable_irq(ppmu, pmc, false);
+			pmu_enable_hw(ppmu, pmc, false);
+		}
+	} else {
+		err = pmu_enable_hw(ppmu, pmc, true);
+		if (err)
+			return err;
+
+		/* TBD: post reset */
+
+		err = pmu_idle(ppmu);
+		if (err)
+			return err;
+
+		pmu_enable_irq(ppmu, pmc, true);
+	}
+
+	return 0;
+}
+
+int pmu_reset(struct nvkm_pmu *ppmu, struct nvkm_mc *pmc)
+{
+	int err;
+
+	err = pmu_idle(ppmu);
+	if (err)
+		return err;
+
+	/* TBD: release pmu hw mutex */
+
+	err = pmu_enable(ppmu, pmc, false);
+	if (err)
+		return err;
+
+	err = pmu_enable(ppmu, pmc, true);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int pmu_bootstrap(struct pmu_desc *pmu)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	struct pmu_ucode_desc *desc = pmu->desc;
+	u64 addr_code, addr_data, addr_load;
+	u32 i, blocks, addr_args;
+	u32 *adr_data, *adr_load, *adr_code;
+	struct pmu_cmdline_args_gk20a cmdline_args;
+	struct pmu_priv_vm *ppmuvm = &pmuvm;
+
+	nv_wr32(ppmu, 0x0010a048,
+		nv_rd32(ppmu, 0x0010a048) | 0x01);
+	/*bind the address*/
+	nv_wr32(ppmu, 0x0010a480,
+		ppmuvm->mem->addr >> 12 |
+		0x1 << 30 |
+		0x20000000);
+
+	/* TBD: load all other surfaces */
+	cmdline_args.falc_trace_size = GK20A_PMU_TRACE_BUFSIZE;
+	cmdline_args.falc_trace_dma_base =
+				 u64_lo32(pmu->trace_buf.pmubufvma.offset >> 8);
+	cmdline_args.falc_trace_dma_idx = GK20A_PMU_DMAIDX_VIRT;
+	cmdline_args.cpu_freq_hz = 204;
+	cmdline_args.secure_mode = 0;
+
+	addr_args = (nv_rd32(ppmu, 0x0010a108) >> 9) & 0x1ff;
+	addr_args = addr_args << GK20A_PMU_DMEM_BLKSIZE2;
+	addr_args -= sizeof(struct pmu_cmdline_args_gk20a);
+	nv_debug(ppmu, "initiating copy to dmem\n");
+	pmu_copy_to_dmem(pmu, addr_args,
+			(u8 *)&cmdline_args,
+			sizeof(struct pmu_cmdline_args_gk20a), 0);
+
+	nv_wr32(ppmu, 0x0010a1c0, 0x1 << 24);
+
+
+	addr_code = u64_lo32((pmu->ucode.pmubufvma.offset +
+			desc->app_start_offset +
+			desc->app_resident_code_offset) >> 8);
+
+	addr_data = u64_lo32((pmu->ucode.pmubufvma.offset +
+			desc->app_start_offset +
+			desc->app_resident_data_offset) >> 8);
+
+	addr_load = u64_lo32((pmu->ucode.pmubufvma.offset +
+			desc->bootloader_start_offset) >> 8);
+
+	adr_code = (u32 *) (&addr_code);
+	adr_load = (u32 *) (&addr_load);
+	adr_data = (u32 *) (&addr_data);
+	nv_wr32(ppmu, 0x0010a1c4, GK20A_PMU_DMAIDX_UCODE);
+	nv_debug(ppmu, "0x%08x\n", GK20A_PMU_DMAIDX_UCODE);
+	nv_wr32(ppmu, 0x0010a1c4, *(adr_code));
+	nv_debug(ppmu, "0x%08x\n", *(adr_code));
+	nv_wr32(ppmu, 0x0010a1c4, desc->app_size);
+	nv_debug(ppmu, "0x%08x\n", desc->app_size);
+	nv_wr32(ppmu, 0x0010a1c4, desc->app_resident_code_size);
+	nv_debug(ppmu, "0x%08x\n", desc->app_resident_code_size);
+	nv_wr32(ppmu, 0x0010a1c4, desc->app_imem_entry);
+	nv_debug(ppmu, "0x%08x\n", desc->app_imem_entry);
+	nv_wr32(ppmu, 0x0010a1c4,  *(adr_data));
+	nv_debug(ppmu, "0x%08x\n", *(adr_data));
+	nv_wr32(ppmu, 0x0010a1c4, desc->app_resident_data_size);
+	nv_debug(ppmu, "0x%08x\n", desc->app_resident_data_size);
+	nv_wr32(ppmu, 0x0010a1c4, *(adr_code));
+	nv_debug(ppmu, "0x%08x\n", *(adr_code));
+	nv_wr32(ppmu, 0x0010a1c4, 0x1);
+	nv_debug(ppmu, "0x%08x\n", 1);
+	nv_wr32(ppmu, 0x0010a1c4, addr_args);
+	nv_debug(ppmu, "0x%08x\n", addr_args);
+
+
+	nv_wr32(ppmu, 0x0010a110,
+		*(adr_load) - (desc->bootloader_imem_offset >> 8));
+
+	blocks = ((desc->bootloader_size + 0xFF) & ~0xFF) >> 8;
+
+	for (i = 0; i < blocks; i++) {
+		nv_wr32(ppmu, 0x0010a114,
+			desc->bootloader_imem_offset + (i << 8));
+		nv_wr32(ppmu, 0x0010a11c,
+			desc->bootloader_imem_offset + (i << 8));
+		nv_wr32(ppmu, 0x0010a118,
+			0x01 << 4  |
+			0x06 << 8  |
+			((GK20A_PMU_DMAIDX_UCODE & 0x07) << 12));
+	}
+
+
+	nv_wr32(ppmu, 0x0010a104,
+		(0xffffffff & desc->bootloader_entry_point));
+
+	nv_wr32(ppmu, 0x0010a100, 0x1 << 1);
+
+	nv_wr32(ppmu, 0x0010a080, desc->app_version);
+
+	return 0;
+}
+
+void pmu_seq_init(struct pmu_desc *pmu)
+{
+	u32 i;
+
+	memset(pmu->seq, 0,
+		sizeof(struct pmu_sequence) * PMU_MAX_NUM_SEQUENCES);
+	memset(pmu->pmu_seq_tbl, 0,
+		sizeof(pmu->pmu_seq_tbl));
+
+	for (i = 0; i < PMU_MAX_NUM_SEQUENCES; i++)
+		pmu->seq[i].id = i;
+}
+
+static int pmu_seq_acquire(struct pmu_desc *pmu,
+			struct pmu_sequence **pseq)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	struct pmu_sequence *seq;
+	u32 index;
+
+	mutex_lock(&pmu->pmu_seq_lock);
+	index = find_first_zero_bit(pmu->pmu_seq_tbl,
+				sizeof(pmu->pmu_seq_tbl));
+	if (index >= sizeof(pmu->pmu_seq_tbl)) {
+		nv_error(ppmu,
+			"no free sequence available");
+		mutex_unlock(&pmu->pmu_seq_lock);
+		return -EAGAIN;
+	}
+	set_bit(index, pmu->pmu_seq_tbl);
+	mutex_unlock(&pmu->pmu_seq_lock);
+
+	seq = &pmu->seq[index];
+	seq->state = PMU_SEQ_STATE_PENDING;
+
+	*pseq = seq;
+	return 0;
+}
+
+static void pmu_seq_release(struct pmu_desc *pmu,
+			struct pmu_sequence *seq)
+{
+	seq->state	= PMU_SEQ_STATE_FREE;
+	seq->desc	= PMU_INVALID_SEQ_DESC;
+	seq->callback	= NULL;
+	seq->cb_params	= NULL;
+	seq->msg	= NULL;
+	seq->out_payload = NULL;
+	seq->in_gk20a.alloc.dmem.size = 0;
+	seq->out_gk20a.alloc.dmem.size = 0;
+	clear_bit(seq->id, pmu->pmu_seq_tbl);
+}
+
+static int pmu_queue_init(struct pmu_desc *pmu,
+		u32 id, struct pmu_init_msg_pmu_gk20a *init)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	struct pmu_queue *queue = &pmu->queue[id];
+
+	queue->id	= id;
+	queue->index    = init->queue_info[id].index;
+	queue->offset   = init->queue_info[id].offset;
+	queue->size = init->queue_info[id].size;
+	queue->mutex_id = id;
+	mutex_init(&queue->mutex);
+
+	nv_debug(ppmu, "queue %d: index %d, offset 0x%08x, size 0x%08x",
+		id, queue->index, queue->offset, queue->size);
+
+	return 0;
+}
+
+static int pmu_queue_head(struct pmu_desc *pmu, struct pmu_queue *queue,
+			u32 *head, bool set)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+
+	BUG_ON(!head);
+
+	if (PMU_IS_COMMAND_QUEUE(queue->id)) {
+
+		if (queue->index >= 0x00000004)
+			return -EINVAL;
+
+		if (!set)
+			*head = nv_rd32(ppmu, 0x0010a4a0 + (queue->index * 4)) &
+				0xffffffff;
+		else
+			nv_wr32(ppmu,
+				(0x0010a4a0 + (queue->index * 4)),
+				(*head & 0xffffffff));
+	} else {
+		if (!set)
+			*head = nv_rd32(ppmu, 0x0010a4c8) & 0xffffffff;
+		else
+			nv_wr32(ppmu, 0x0010a4c8, (*head & 0xffffffff));
+	}
+
+	return 0;
+}
+
+static int pmu_queue_tail(struct pmu_desc *pmu, struct pmu_queue *queue,
+			u32 *tail, bool set)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+
+	BUG_ON(!tail);
+
+	if (PMU_IS_COMMAND_QUEUE(queue->id)) {
+
+		if (queue->index >= 0x00000004)
+			return -EINVAL;
+
+		if (!set)
+			*tail = nv_rd32(ppmu, 0x0010a4b0 + (queue->index * 4)) &
+				0xffffffff;
+		else
+			nv_wr32(ppmu, (0x0010a4b0 + (queue->index * 4)),
+							  (*tail & 0xffffffff));
+	} else {
+		if (!set)
+			*tail = nv_rd32(ppmu, 0x0010a4cc) & 0xffffffff;
+		else
+			nv_wr32(ppmu, 0x0010a4cc, (*tail & 0xffffffff));
+	}
+
+	return 0;
+}
+
+static inline void pmu_queue_read(struct pmu_desc *pmu,
+			u32 offset, u8 *dst, u32 size)
+{
+	pmu_copy_from_dmem(pmu, offset, dst, size, 0);
+}
+
+static inline void pmu_queue_write(struct pmu_desc *pmu,
+			u32 offset, u8 *src, u32 size)
+{
+	pmu_copy_to_dmem(pmu, offset, src, size, 0);
+}
+
+int pmu_mutex_acquire(struct nvkm_pmu *ppmu, u32 id, u32 *token)
+{
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+	struct pmu_mutex *mutex;
+	u32 data, owner, max_retry;
+
+	if (!pmu->initialized)
+		return -EINVAL;
+
+	BUG_ON(!token);
+	BUG_ON(!PMU_MUTEX_ID_IS_VALID(id));
+	BUG_ON(id > pmu->mutex_cnt);
+
+	mutex = &pmu->mutex[id];
+
+	owner = nv_rd32(ppmu, 0x0010a580 + (mutex->index * 4)) & 0xff;
+
+	if (*token != PMU_INVALID_MUTEX_OWNER_ID && *token == owner) {
+		BUG_ON(mutex->ref_cnt == 0);
+		nv_debug(ppmu, "already acquired by owner : 0x%08x", *token);
+		mutex->ref_cnt++;
+		return 0;
+	}
+
+	max_retry = 40;
+	do {
+		data = nv_rd32(ppmu, 0x0010a488) & 0xff;
+		if (data == 0x00000000 ||
+		    data == 0x000000ff) {
+			nv_warn(ppmu,
+				"fail to generate mutex token: val 0x%08x",
+				owner);
+			usleep_range(20, 40);
+			continue;
+		}
+
+		owner = data;
+		nv_wr32(ppmu, (0x0010a580 + mutex->index * 4),
+			owner & 0xff);
+
+		data = nv_rd32(ppmu, 0x0010a580 + (mutex->index * 4));
+
+		if (owner == data) {
+			mutex->ref_cnt = 1;
+			nv_debug(ppmu, "mutex acquired: id=%d, token=0x%x",
+				mutex->index, *token);
+			*token = owner;
+			goto out;
+		} else {
+		  nv_debug(ppmu, "fail to acquire mutex idx=0x%08x",
+				mutex->index);
+
+			nv_mask(ppmu, 0x0010a48c, 0xff, (owner & 0xff));
+
+			usleep_range(20, 40);
+			continue;
+		}
+	} while (max_retry-- > 0);
+
+	return -EBUSY;
+out:
+	return 0;
+}
+
+int pmu_mutex_release(struct nvkm_pmu *ppmu, u32 id, u32 *token)
+{
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+	struct pmu_mutex *mutex;
+	u32 owner;
+
+	if (!pmu->initialized)
+		return -EINVAL;
+
+	BUG_ON(!token);
+	BUG_ON(!PMU_MUTEX_ID_IS_VALID(id));
+	BUG_ON(id > pmu->mutex_cnt);
+
+	mutex = &pmu->mutex[id];
+
+	owner = nv_rd32(ppmu, 0x0010a580 + (mutex->index * 4)) & 0xff;
+
+	if (*token != owner) {
+		nv_error(ppmu,
+			"requester 0x%08x NOT match owner 0x%08x",
+			*token, owner);
+		return -EINVAL;
+	}
+
+	if (--mutex->ref_cnt > 0)
+		return -EBUSY;
+
+	nv_wr32(ppmu, 0x0010a580 + (mutex->index * 4), 0x00);
+
+	nv_mask(ppmu, 0x0010a48c, 0xff, (owner & 0xff));
+
+	nv_debug(ppmu, "mutex released: id=%d, token=0x%x",
+							  mutex->index, *token);
+
+	return 0;
+}
+
+static int pmu_queue_lock(struct pmu_desc *pmu,
+			struct pmu_queue *queue)
+{
+	int ret;
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+
+	if (PMU_IS_MESSAGE_QUEUE(queue->id))
+		return 0;
+
+	if (PMU_IS_SW_COMMAND_QUEUE(queue->id)) {
+		mutex_lock(&queue->mutex);
+		return 0;
+	}
+
+	ret = pmu_mutex_acquire(ppmu, queue->mutex_id, &queue->mutex_lock);
+	return ret;
+}
+
+static int pmu_queue_unlock(struct pmu_desc *pmu,
+			struct pmu_queue *queue)
+{
+	int ret;
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+
+	if (PMU_IS_MESSAGE_QUEUE(queue->id))
+		return 0;
+
+	if (PMU_IS_SW_COMMAND_QUEUE(queue->id)) {
+		mutex_unlock(&queue->mutex);
+		return 0;
+	}
+
+	ret = pmu_mutex_release(ppmu, queue->mutex_id, &queue->mutex_lock);
+	return ret;
+}
+
+/* called by pmu_read_message, no lock */
+static bool pmu_queue_is_empty(struct pmu_desc *pmu,
+			struct pmu_queue *queue)
+{
+	u32 head, tail;
+
+	pmu_queue_head(pmu, queue, &head, QUEUE_GET);
+	if (queue->opened && queue->oflag == OFLAG_READ)
+		tail = queue->position;
+	else
+		pmu_queue_tail(pmu, queue, &tail, QUEUE_GET);
+
+	return head == tail;
+}
+
+static bool pmu_queue_has_room(struct pmu_desc *pmu,
+			struct pmu_queue *queue, u32 size, bool *need_rewind)
+{
+	u32 head, tail, free;
+	bool rewind = false;
+
+	size = ALIGN(size, QUEUE_ALIGNMENT);
+
+	pmu_queue_head(pmu, queue, &head, QUEUE_GET);
+	pmu_queue_tail(pmu, queue, &tail, QUEUE_GET);
+
+	if (head >= tail) {
+		free = queue->offset + queue->size - head;
+		free -= PMU_CMD_HDR_SIZE;
+
+		if (size > free) {
+			rewind = true;
+			head = queue->offset;
+		}
+	}
+
+	if (head < tail)
+		free = tail - head - 1;
+
+	if (need_rewind)
+		*need_rewind = rewind;
+
+	return size <= free;
+}
+
+static int pmu_queue_push(struct pmu_desc *pmu,
+			struct pmu_queue *queue, void *data, u32 size)
+{
+
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	if (!queue->opened && queue->oflag == OFLAG_WRITE) {
+		nv_error(ppmu, "queue not opened for write\n");
+		return -EINVAL;
+	}
+
+	pmu_queue_write(pmu, queue->position, data, size);
+	queue->position += ALIGN(size, QUEUE_ALIGNMENT);
+	return 0;
+}
+
+static int pmu_queue_pop(struct pmu_desc *pmu,
+			struct pmu_queue *queue, void *data, u32 size,
+			u32 *bytes_read)
+{
+	u32 head, tail, used;
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+
+	*bytes_read = 0;
+
+	if (!queue->opened && queue->oflag == OFLAG_READ) {
+		nv_error(ppmu, "queue not opened for read\n");
+		return -EINVAL;
+	}
+
+	pmu_queue_head(pmu, queue, &head, QUEUE_GET);
+	tail = queue->position;
+
+	if (head == tail)
+		return 0;
+
+	if (head > tail)
+		used = head - tail;
+	else
+		used = queue->offset + queue->size - tail;
+
+	if (size > used) {
+		nv_warn(ppmu, "queue size smaller than request read\n");
+		size = used;
+	}
+
+	pmu_queue_read(pmu, tail, data, size);
+	queue->position += ALIGN(size, QUEUE_ALIGNMENT);
+	*bytes_read = size;
+	return 0;
+}
+
+static void pmu_queue_rewind(struct pmu_desc *pmu,
+			struct pmu_queue *queue)
+{
+	struct pmu_cmd cmd;
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+
+
+	if (!queue->opened) {
+		nv_error(ppmu, "queue not opened\n");
+		goto out;
+	}
+
+	if (queue->oflag == OFLAG_WRITE) {
+		cmd.hdr.unit_id = PMU_UNIT_REWIND;
+		cmd.hdr.size = PMU_CMD_HDR_SIZE;
+		pmu_queue_push(pmu, queue, &cmd, cmd.hdr.size);
+		nv_debug(ppmu, "queue %d rewinded\n", queue->id);
+	}
+
+	queue->position = queue->offset;
+out:
+	nv_debug(ppmu, "exit %s\n", __func__);
+}
+
+/* open for read and lock the queue */
+static int pmu_queue_open_read(struct pmu_desc *pmu,
+			struct pmu_queue *queue)
+{
+	int err;
+
+	err = pmu_queue_lock(pmu, queue);
+	if (err)
+		return err;
+
+	if (queue->opened)
+		BUG();
+
+	pmu_queue_tail(pmu, queue, &queue->position, QUEUE_GET);
+	queue->oflag = OFLAG_READ;
+	queue->opened = true;
+
+	return 0;
+}
+
+/* open for write and lock the queue
+   make sure there's enough free space for the write */
+static int pmu_queue_open_write(struct pmu_desc *pmu,
+			struct pmu_queue *queue, u32 size)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	bool rewind = false;
+	int err;
+
+	err = pmu_queue_lock(pmu, queue);
+	if (err)
+		return err;
+
+	if (queue->opened)
+		BUG();
+
+	if (!pmu_queue_has_room(pmu, queue, size, &rewind)) {
+		nv_error(ppmu, "queue full");
+		pmu_queue_unlock(pmu, queue);
+		return -EAGAIN;
+	}
+
+	pmu_queue_head(pmu, queue, &queue->position, QUEUE_GET);
+	queue->oflag = OFLAG_WRITE;
+	queue->opened = true;
+
+	if (rewind)
+		pmu_queue_rewind(pmu, queue);
+
+	return 0;
+}
+
+/* close and unlock the queue */
+static int pmu_queue_close(struct pmu_desc *pmu,
+			struct pmu_queue *queue, bool commit)
+{
+	if (!queue->opened)
+		return 0;
+
+	if (commit) {
+		if (queue->oflag == OFLAG_READ) {
+			pmu_queue_tail(pmu, queue,
+				&queue->position, QUEUE_SET);
+		} else {
+			pmu_queue_head(pmu, queue,
+				&queue->position, QUEUE_SET);
+		}
+	}
+
+	queue->opened = false;
+
+	pmu_queue_unlock(pmu, queue);
+
+	return 0;
+}
+
+int pmu_wait_message_cond(struct pmu_desc *pmu, u32 timeout,
+				 u32 *var, u32 val)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	unsigned long end_jiffies = jiffies + msecs_to_jiffies(timeout);
+	unsigned long delay = GK20A_IDLE_CHECK_DEFAULT;
+
+	do {
+		if (*var == val)
+			return 0;
+
+		if (nv_rd32(ppmu, 0x0010a008))
+			gk20a_pmu_isr(ppmu);
+
+		usleep_range(delay, delay * 2);
+		delay = min_t(u32, delay << 1, GK20A_IDLE_CHECK_MAX);
+	} while (time_before(jiffies, end_jiffies));
+
+	return -ETIMEDOUT;
+}
+
+void pmu_dump_falcon_stats(struct pmu_desc *pmu)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	int i;
+
+	nv_debug(ppmu, "pmu_falcon_os_r : %d\n",
+		nv_rd32(ppmu, 0x0010a080));
+	nv_debug(ppmu, "pmu_falcon_cpuctl_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a100));
+	nv_debug(ppmu, "pmu_falcon_idlestate_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a04c));
+	nv_debug(ppmu, "pmu_falcon_mailbox0_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a040));
+	nv_debug(ppmu, "pmu_falcon_mailbox1_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a044));
+	nv_debug(ppmu, "pmu_falcon_irqstat_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a008));
+	nv_debug(ppmu, "pmu_falcon_irqmode_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a00c));
+	nv_debug(ppmu, "pmu_falcon_irqmask_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a018));
+	nv_debug(ppmu, "pmu_falcon_irqdest_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a01c));
+
+	for (i = 0; i < 0x0000000c; i++)
+		nv_debug(ppmu, "pmu_pmu_mailbox_r(%d) : 0x%x\n",
+			i, nv_rd32(ppmu, 0x0010a450 + i*4));
+
+	for (i = 0; i < 0x00000004; i++)
+		nv_debug(ppmu, "pmu_pmu_debug_r(%d) : 0x%x\n",
+			i, nv_rd32(ppmu, 0x0010a5c0 + i*4));
+
+	for (i = 0; i < 6/*NV_Ppmu_FALCON_ICD_IDX_RSTAT__SIZE_1*/; i++) {
+		nv_wr32(ppmu, 0x0010a200,
+			0xe |
+			(i & 0x1f) << 8);
+		nv_debug(ppmu, "pmu_rstat (%d) : 0x%x\n",
+			i, nv_rd32(ppmu, 0x0010a20c));
+	}
+
+	i = nv_rd32(ppmu, 0x0010a7b0);
+	nv_debug(ppmu, "pmu_pmu_bar0_error_status_r : 0x%x\n", i);
+	if (i != 0) {
+		nv_debug(ppmu, "pmu_pmu_bar0_addr_r : 0x%x\n",
+			nv_rd32(ppmu, 0x0010a7a0));
+		nv_debug(ppmu, "pmu_pmu_bar0_data_r : 0x%x\n",
+			nv_rd32(ppmu, 0x0010a7a4));
+		nv_debug(ppmu, "pmu_pmu_bar0_timeout_r : 0x%x\n",
+			nv_rd32(ppmu, 0x0010a7a8));
+		nv_debug(ppmu, "pmu_pmu_bar0_ctl_r : 0x%x\n",
+			nv_rd32(ppmu, 0x0010a7ac));
+	}
+
+	i = nv_rd32(ppmu, 0x0010a988);
+	nv_debug(ppmu, "pmu_pmu_bar0_fecs_error_r : 0x%x\n", i);
+
+	i = nv_rd32(ppmu, 0x0010a16c);
+	nv_debug(ppmu, "pmu_falcon_exterrstat_r : 0x%x\n", i);
+	if (((i >> 31) & 0x1)) {
+		nv_debug(ppmu, "pmu_falcon_exterraddr_r : 0x%x\n",
+			nv_rd32(ppmu, 0x0010a168));
+		/*nv_debug(ppmu, "pmc_enable : 0x%x\n",
+		  nv_rd32(pmc, 0x00000200));*/
+	}
+
+	nv_debug(ppmu, "pmu_falcon_engctl_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a0a4));
+	nv_debug(ppmu, "pmu_falcon_curctx_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a050));
+	nv_debug(ppmu, "pmu_falcon_nxtctx_r : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a054));
+
+	nv_wr32(ppmu, 0x0010a200,
+		0x8 |
+		((PMU_FALCON_REG_IMB & 0x1f) << 8));
+	nv_debug(ppmu, "PMU_FALCON_REG_IMB : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a20c));
+
+	nv_wr32(ppmu, 0x0010a200,
+		0x8 |
+		((PMU_FALCON_REG_DMB & 0x1f) << 8));
+	nv_debug(ppmu, "PMU_FALCON_REG_DMB : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a20c));
+
+	nv_wr32(ppmu, 0x0010a200,
+		0x8 |
+		((PMU_FALCON_REG_CSW & 0x1f) << 8));
+	nv_debug(ppmu, "PMU_FALCON_REG_CSW : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a20c));
+
+	nv_wr32(ppmu, 0x0010a200,
+		0x8 |
+		((PMU_FALCON_REG_CTX & 0x1f) << 8));
+	nv_debug(ppmu, "PMU_FALCON_REG_CTX : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a20c));
+
+	nv_wr32(ppmu, 0x0010a200,
+		0x8 |
+		((PMU_FALCON_REG_EXCI & 0x1f) << 8));
+	nv_debug(ppmu, "PMU_FALCON_REG_EXCI : 0x%x\n",
+		nv_rd32(ppmu, 0x0010a20c));
+
+	for (i = 0; i < 4; i++) {
+		nv_wr32(ppmu, 0x0010a200,
+			0x8 |
+			((PMU_FALCON_REG_PC & 0x1f) << 8));
+		nv_debug(ppmu, "PMU_FALCON_REG_PC : 0x%x\n",
+			nv_rd32(ppmu, 0x0010a20c));
+
+		nv_wr32(ppmu, 0x0010a200,
+			0x8 |
+			((PMU_FALCON_REG_SP & 0x1f) << 8));
+		nv_debug(ppmu, "PMU_FALCON_REG_SP : 0x%x\n",
+			nv_rd32(ppmu, 0x0010a20c));
+	}
+
+	/* PMU may crash due to FECS crash. Dump FECS status */
+	/*gk20a_fecs_dump_falcon_stats(g);*/
+}
+
+static bool pmu_validate_cmd(struct pmu_desc *pmu, struct pmu_cmd *cmd,
+			struct pmu_msg *msg, struct pmu_payload *payload,
+			u32 queue_id)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	struct pmu_queue *queue;
+	u32 in_size, out_size;
+
+	nv_debug(ppmu, "pmu validate cmd\n");
+	pmu_dump_falcon_stats(pmu);
+
+	if (!PMU_IS_SW_COMMAND_QUEUE(queue_id))
+		goto invalid_cmd;
+
+	queue = &pmu->queue[queue_id];
+	if (cmd->hdr.size < PMU_CMD_HDR_SIZE)
+		goto invalid_cmd;
+
+	if (cmd->hdr.size > (queue->size >> 1))
+		goto invalid_cmd;
+
+	if (msg != NULL && msg->hdr.size < PMU_MSG_HDR_SIZE)
+		goto invalid_cmd;
+
+	if (!PMU_UNIT_ID_IS_VALID(cmd->hdr.unit_id))
+		goto invalid_cmd;
+
+	if (payload == NULL)
+		return true;
+
+	if (payload->in.buf == NULL && payload->out.buf == NULL)
+		goto invalid_cmd;
+
+	if ((payload->in.buf != NULL && payload->in.size == 0) ||
+	    (payload->out.buf != NULL && payload->out.size == 0))
+		goto invalid_cmd;
+
+	in_size = PMU_CMD_HDR_SIZE;
+	if (payload->in.buf) {
+		in_size += payload->in.offset;
+		in_size += sizeof(struct pmu_allocation_gk20a);
+	}
+
+	out_size = PMU_CMD_HDR_SIZE;
+	if (payload->out.buf) {
+		out_size += payload->out.offset;
+		out_size += sizeof(struct pmu_allocation_gk20a);
+	}
+
+	if (in_size > cmd->hdr.size || out_size > cmd->hdr.size)
+		goto invalid_cmd;
+
+
+	if ((payload->in.offset != 0 && payload->in.buf == NULL) ||
+	    (payload->out.offset != 0 && payload->out.buf == NULL))
+		goto invalid_cmd;
+
+	return true;
+
+invalid_cmd:
+	nv_error(ppmu, "invalid pmu cmd :\n"
+		"queue_id=%d,\n"
+		"cmd_size=%d, cmd_unit_id=%d, msg=%p, msg_size=%d,\n"
+		"payload in=%p, in_size=%d, in_offset=%d,\n"
+		"payload out=%p, out_size=%d, out_offset=%d",
+		queue_id, cmd->hdr.size, cmd->hdr.unit_id,
+		msg, msg ? msg->hdr.unit_id : ~0,
+		&payload->in, payload->in.size, payload->in.offset,
+		&payload->out, payload->out.size, payload->out.offset);
+
+	return false;
+}
+
+static int pmu_write_cmd(struct pmu_desc *pmu, struct pmu_cmd *cmd,
+			u32 queue_id, unsigned long timeout)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	struct pmu_queue *queue;
+	unsigned long end_jiffies = jiffies +
+		msecs_to_jiffies(timeout);
+	int err;
+
+	nv_debug(ppmu, "pmu write cmd\n");
+
+	queue = &pmu->queue[queue_id];
+
+	do {
+		err = pmu_queue_open_write(pmu, queue, cmd->hdr.size);
+		if (err == -EAGAIN && time_before(jiffies, end_jiffies))
+			usleep_range(1000, 2000);
+		else
+			break;
+	} while (1);
+
+	if (err)
+		goto clean_up;
+
+	pmu_queue_push(pmu, queue, cmd, cmd->hdr.size);
+
+	err = pmu_queue_close(pmu, queue, true);
+
+clean_up:
+	if (err)
+		nv_error(ppmu,
+			"fail to write cmd to queue %d", queue_id);
+	else
+		nv_debug(ppmu, "cmd writing done");
+
+	return err;
+}
+
+int gk20a_pmu_cmd_post(struct nvkm_pmu *ppmu, struct pmu_cmd *cmd,
+		struct pmu_msg *msg, struct pmu_payload *payload,
+		u32 queue_id, pmu_callback callback, void *cb_param,
+		u32 *seq_desc, unsigned long timeout)
+{
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+	struct pmu_sequence *seq;
+	struct pmu_allocation_gk20a *in = NULL, *out = NULL;
+	int err;
+
+	BUG_ON(!cmd);
+	BUG_ON(!seq_desc);
+	BUG_ON(!pmu->pmu_ready);
+	nv_debug(ppmu, "Post CMD\n");
+	if (!pmu_validate_cmd(pmu, cmd, msg, payload, queue_id))
+		return -EINVAL;
+
+	err = pmu_seq_acquire(pmu, &seq);
+	if (err)
+		return err;
+
+	cmd->hdr.seq_id = seq->id;
+
+	cmd->hdr.ctrl_flags = 0;
+	cmd->hdr.ctrl_flags |= PMU_CMD_FLAGS_STATUS;
+	cmd->hdr.ctrl_flags |= PMU_CMD_FLAGS_INTR;
+
+	seq->callback = callback;
+	seq->cb_params = cb_param;
+	seq->msg = msg;
+	seq->out_payload = NULL;
+	seq->desc = pmu->next_seq_desc++;
+
+	if (payload)
+		seq->out_payload = payload->out.buf;
+
+	*seq_desc = seq->desc;
+
+	if (payload && payload->in.offset != 0) {
+		in = (struct pmu_allocation_gk20a *)((u8 *)&cmd->cmd +
+			payload->in.offset);
+
+		if (payload->in.buf != payload->out.buf)
+			in->alloc.dmem.size = (u16)payload->in.size;
+		else
+			in->alloc.dmem.size =
+				(u16)max(payload->in.size, payload->out.size);
+
+		err = pmu->dmem.alloc(&pmu->dmem,
+			(void *)&in->alloc.dmem.offset,
+			in->alloc.dmem.size,
+			PMU_DMEM_ALLOC_ALIGNMENT);
+		if (err)
+			goto clean_up;
+
+		pmu_copy_to_dmem(pmu, (in->alloc.dmem.offset),
+			payload->in.buf, payload->in.size, 0);
+		seq->in_gk20a.alloc.dmem.size = in->alloc.dmem.size;
+		seq->in_gk20a.alloc.dmem.offset = in->alloc.dmem.offset;
+	}
+
+	if (payload && payload->out.offset != 0) {
+		out = (struct pmu_allocation_gk20a *)((u8 *)&cmd->cmd +
+			payload->out.offset);
+		out->alloc.dmem.size = (u16)payload->out.size;
+
+		if (payload->out.buf != payload->in.buf) {
+			err = pmu->dmem.alloc(&pmu->dmem,
+				(void *)&out->alloc.dmem.offset,
+				out->alloc.dmem.size,
+				PMU_DMEM_ALLOC_ALIGNMENT);
+			if (err)
+				goto clean_up;
+		} else {
+			BUG_ON(in == NULL);
+			out->alloc.dmem.offset = in->alloc.dmem.offset;
+		}
+
+		seq->out_gk20a.alloc.dmem.size = out->alloc.dmem.size;
+		seq->out_gk20a.alloc.dmem.offset = out->alloc.dmem.offset;
+	}
+
+	seq->state = PMU_SEQ_STATE_USED;
+	err = pmu_write_cmd(pmu, cmd, queue_id, timeout);
+	if (err)
+		seq->state = PMU_SEQ_STATE_PENDING;
+
+	nv_debug(ppmu, "cmd posted\n");
+
+	return 0;
+
+clean_up:
+	nv_debug(ppmu, "cmd post failed\n");
+	if (in)
+		pmu->dmem.free(&pmu->dmem,
+			in->alloc.dmem.offset,
+			in->alloc.dmem.size,
+			PMU_DMEM_ALLOC_ALIGNMENT);
+	if (out)
+		pmu->dmem.free(&pmu->dmem,
+			out->alloc.dmem.offset,
+			out->alloc.dmem.size,
+			PMU_DMEM_ALLOC_ALIGNMENT);
+
+	pmu_seq_release(pmu, seq);
+	return err;
+}
+
+void gk20a_pmu_isr(struct nvkm_pmu *ppmu)
+{
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+	struct nvkm_mc *pmc = nvkm_mc(ppmu);
+	struct pmu_queue *queue;
+	u32 intr, mask;
+	bool recheck = false;
+	if (!pmu->isr_enabled)
+		goto out;
+
+	mask = nv_rd32(ppmu, 0x0010a018) &
+		nv_rd32(ppmu, 0x0010a01c);
+
+	intr = nv_rd32(ppmu, 0x0010a008) & mask;
+
+	nv_debug(ppmu, "received falcon interrupt: 0x%08x", intr);
+	pmu_enable_irq(ppmu, pmc, false);
+	if (!intr || pmu->pmu_state == PMU_STATE_OFF) {
+		nv_wr32(ppmu, 0x0010a004, intr);
+		nv_error(ppmu, "pmu state off\n");
+		pmu_enable_irq(ppmu, pmc, true);
+		goto out;
+	}
+	if (intr & 0x10) {
+		nv_error(ppmu,
+			"pmu halt intr not implemented");
+		pmu_dump_falcon_stats(pmu);
+	}
+	if (intr & 0x20) {
+		nv_error(ppmu,
+			"pmu exterr intr not implemented. Clearing interrupt.");
+		pmu_dump_falcon_stats(pmu);
+
+		nv_wr32(ppmu, 0x0010a16c,
+			nv_rd32(ppmu, 0x0010a16c) &
+				~(0x1 << 31));
+	}
+	if (intr & 0x40) {
+		nv_debug(ppmu, "scheduling work\n");
+		schedule_work(&pmu->isr_workq);
+		pmu_enable_irq(ppmu, pmc, true);
+		recheck = true;
+	}
+
+	if (recheck) {
+		queue = &pmu->queue[PMU_MESSAGE_QUEUE];
+		if (!pmu_queue_is_empty(pmu, queue))
+			nv_wr32(ppmu, 0x0010a000, 0x40);
+	} else {
+		pmu_enable_irq(ppmu, pmc, true);
+	}
+
+	pmu_enable_irq(ppmu, pmc, true);
+	nv_wr32(ppmu, 0x0010a004, intr);
+out:
+	nv_debug(ppmu, "irq handled\n");
+}
+
+static int
+gk20a_pmu_init_vm(struct nvkm_pmu *ppmu, const struct firmware *fw)
+{
+	int ret = 0;
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+	u32 *ucode_image;
+	struct pmu_ucode_desc *desc = (struct pmu_ucode_desc *)fw->data;
+	int i;
+	struct pmu_priv_vm *ppmuvm = &pmuvm;
+	struct nvkm_device *device = nv_device(&ppmu->base);
+	struct nvkm_vm *vm;
+	u64 pmu_area_len = 300*1024;
+
+	ppmu->pmuvm = &pmuvm;
+	ppmu->pg_buf = &pmu->pg_buf;
+	pmu->pmu = ppmu;
+	/* mem for inst blk*/
+	ret = nvkm_gpuobj_new(nv_object(ppmu), NULL, 0x1000, 0, 0,
+				&ppmuvm->mem);
+	if (ret)
+		goto instblk_alloc_err;
+
+	/* mem for pgd*/
+	ret = nvkm_gpuobj_new(nv_object(ppmu), NULL, 0x8000, 0, 0,
+				&ppmuvm->pgd);
+	if (ret)
+		goto pgd_alloc_err;
+
+	/*allocate virtual memory range*/
+	ret = nvkm_vm_new(device, 0, pmu_area_len, 0, &vm);
+	if (ret)
+		goto virt_alloc_err;
+
+	atomic_inc(&vm->engref[NVDEV_SUBDEV_PMU]);
+	/*update VM with pgd */
+
+	ret = nvkm_vm_ref(vm, &ppmuvm->vm, ppmuvm->pgd);
+	if (ret)
+		goto virt_alloc_err;
+
+	/*update pgd in inst blk */
+	nv_wo32(ppmuvm->mem, 0x0200, lower_32_bits(ppmuvm->pgd->addr));
+	nv_wo32(ppmuvm->mem, 0x0204, upper_32_bits(ppmuvm->pgd->addr));
+	nv_wo32(ppmuvm->mem, 0x0208, lower_32_bits(pmu_area_len - 1));
+	nv_wo32(ppmuvm->mem, 0x020c, upper_32_bits(pmu_area_len - 1));
+
+	/* allocate memory for pmu fw to be copied to*/
+	ret = nvkm_gpuobj_new(nv_object(ppmu), NULL,
+		   GK20A_PMU_UCODE_SIZE_MAX, 0x1000, 0, &pmu->ucode.pmubufobj);
+	if (ret)
+		goto fw_alloc_err;
+
+	ucode_image = (u32 *)((u32)desc + desc->descriptor_size);
+	for (i = 0; i < (desc->app_start_offset + desc->app_size) >> 2; i++) {
+		nv_wo32(pmu->ucode.pmubufobj, i << 2, ucode_image[i]);
+		pr_info("writing 0x%08x\n", ucode_image[i]);
+	}
+	/* map allocated memory into GMMU */
+	ret = nvkm_gpuobj_map_vm(nv_gpuobj(pmu->ucode.pmubufobj), vm,
+				    NV_MEM_ACCESS_RW,
+				    &pmu->ucode.pmubufvma);
+	if (ret)
+		goto map_err;
+
+	nv_debug(ppmu, "%s function end\n", __func__);
+	return ret;
+map_err:
+	nvkm_gpuobj_destroy(pmu->ucode.pmubufobj);
+virt_alloc_err:
+fw_alloc_err:
+	nvkm_gpuobj_destroy(ppmuvm->pgd);
+pgd_alloc_err:
+	nvkm_gpuobj_destroy(ppmuvm->mem);
+instblk_alloc_err:
+	return ret;
+
+}
+
+static int
+gk20a_pmu_load_firmware(struct nvkm_pmu *ppmu, const struct firmware **pfw)
+{
+	struct nvkm_device *dev;
+	char name[32];
+
+	dev = nv_device(ppmu);
+
+	snprintf(name, sizeof(name), "nvidia/tegra124/%s",
+							 GK20A_PMU_UCODE_IMAGE);
+
+	return request_firmware(pfw, name, nv_device_base(dev));
+}
+
+static void
+gk20a_pmu_dump_firmware_info(struct nvkm_pmu *ppmu,
+		const struct firmware *fw)
+{
+	struct pmu_ucode_desc *desc = (struct pmu_ucode_desc *)fw->data;
+
+	nv_debug(ppmu, "GK20A PMU firmware information\n");
+	nv_debug(ppmu, "descriptor size = %u\n", desc->descriptor_size);
+	nv_debug(ppmu, "image size  = %u\n", desc->image_size);
+	nv_debug(ppmu, "app_version = 0x%08x\n", desc->app_version);
+	nv_debug(ppmu, "date = %s\n", desc->date);
+	nv_debug(ppmu, "bootloader_start_offset = 0x%08x\n",
+				desc->bootloader_start_offset);
+	nv_debug(ppmu, "bootloader_size = 0x%08x\n", desc->bootloader_size);
+	nv_debug(ppmu, "bootloader_imem_offset = 0x%08x\n",
+				desc->bootloader_imem_offset);
+	nv_debug(ppmu, "bootloader_entry_point = 0x%08x\n",
+				desc->bootloader_entry_point);
+	nv_debug(ppmu, "app_start_offset = 0x%08x\n", desc->app_start_offset);
+	nv_debug(ppmu, "app_size = 0x%08x\n", desc->app_size);
+	nv_debug(ppmu, "app_imem_offset = 0x%08x\n", desc->app_imem_offset);
+	nv_debug(ppmu, "app_imem_entry = 0x%08x\n", desc->app_imem_entry);
+	nv_debug(ppmu, "app_dmem_offset = 0x%08x\n", desc->app_dmem_offset);
+	nv_debug(ppmu, "app_resident_code_offset = 0x%08x\n",
+			desc->app_resident_code_offset);
+	nv_debug(ppmu, "app_resident_code_size = 0x%08x\n",
+			desc->app_resident_code_size);
+	nv_debug(ppmu, "app_resident_data_offset = 0x%08x\n",
+			desc->app_resident_data_offset);
+	nv_debug(ppmu, "app_resident_data_size = 0x%08x\n",
+			desc->app_resident_data_size);
+	nv_debug(ppmu, "nb_overlays = %d\n", desc->nb_overlays);
+
+	nv_debug(ppmu, "compressed = %u\n", desc->compressed);
+}
+
+static int pmu_process_init_msg(struct pmu_desc *pmu,
+			struct pmu_msg *msg)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	struct pmu_init_msg_pmu_gk20a *init;
+	struct pmu_sha1_gid_data gid_data;
+	u32 i, tail = 0;
+
+	tail = nv_rd32(ppmu, 0x0010a4cc) & 0xffffffff;
+
+	pmu_copy_from_dmem(pmu, tail,
+		(u8 *)&msg->hdr, PMU_MSG_HDR_SIZE, 0);
+
+	if (msg->hdr.unit_id != PMU_UNIT_INIT) {
+		nv_error(ppmu,
+			"expecting init msg");
+		return -EINVAL;
+	}
+
+	pmu_copy_from_dmem(pmu, tail + PMU_MSG_HDR_SIZE,
+		(u8 *)&msg->msg, msg->hdr.size - PMU_MSG_HDR_SIZE, 0);
+
+	if (msg->msg.init.msg_type != PMU_INIT_MSG_TYPE_PMU_INIT) {
+		nv_error(ppmu,
+			"expecting init msg");
+		return -EINVAL;
+	}
+
+	tail += ALIGN(msg->hdr.size, PMU_DMEM_ALIGNMENT);
+	nv_wr32(ppmu, 0x0010a4cc,
+		tail & 0xffffffff);
+
+	init = &msg->msg.init.pmu_init_gk20a;
+	if (!pmu->gid_info.valid) {
+
+		pmu_copy_from_dmem(pmu,
+			init->sw_managed_area_offset,
+			(u8 *)&gid_data,
+			sizeof(struct pmu_sha1_gid_data), 0);
+
+		pmu->gid_info.valid =
+			(*(u32 *)gid_data.signature == PMU_SHA1_GID_SIGNATURE);
+
+		if (pmu->gid_info.valid) {
+
+			BUG_ON(sizeof(pmu->gid_info.gid) !=
+				sizeof(gid_data.gid));
+
+			memcpy(pmu->gid_info.gid, gid_data.gid,
+				sizeof(pmu->gid_info.gid));
+		}
+	}
+
+	for (i = 0; i < PMU_QUEUE_COUNT; i++)
+		pmu_queue_init(pmu, i, init);
+
+	if (!pmu->dmem.alloc)
+		nvkm_pmu_allocator_init(&pmu->dmem, "gk20a_pmu_dmem",
+				init->sw_managed_area_offset,
+				init->sw_managed_area_size);
+
+	pmu->pmu_ready = true;
+	pmu->pmu_state = PMU_STATE_INIT_RECEIVED;
+
+	return 0;
+}
+
+static bool pmu_read_message(struct pmu_desc *pmu, struct pmu_queue *queue,
+			struct pmu_msg *msg, int *status)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	u32 read_size, bytes_read;
+	int err;
+
+	*status = 0;
+
+	if (pmu_queue_is_empty(pmu, queue))
+		return false;
+
+	err = pmu_queue_open_read(pmu, queue);
+	if (err) {
+		nv_error(ppmu,
+			"fail to open queue %d for read", queue->id);
+		*status = err;
+		return false;
+	}
+
+	err = pmu_queue_pop(pmu, queue, &msg->hdr,
+			PMU_MSG_HDR_SIZE, &bytes_read);
+	if (err || bytes_read != PMU_MSG_HDR_SIZE) {
+		nv_error(ppmu,
+			"fail to read msg from queue %d", queue->id);
+		*status = err | -EINVAL;
+		goto clean_up;
+	}
+
+	if (msg->hdr.unit_id == PMU_UNIT_REWIND) {
+		pmu_queue_rewind(pmu, queue);
+		/* read again after rewind */
+		err = pmu_queue_pop(pmu, queue, &msg->hdr,
+				PMU_MSG_HDR_SIZE, &bytes_read);
+		if (err || bytes_read != PMU_MSG_HDR_SIZE) {
+			nv_error(ppmu,
+				"fail to read msg from queue %d", queue->id);
+			*status = err | -EINVAL;
+			goto clean_up;
+		}
+	}
+
+	if (!PMU_UNIT_ID_IS_VALID(msg->hdr.unit_id)) {
+		nv_error(ppmu,
+			"read invalid unit_id %d from queue %d",
+			msg->hdr.unit_id, queue->id);
+			*status = -EINVAL;
+			goto clean_up;
+	}
+
+	if (msg->hdr.size > PMU_MSG_HDR_SIZE) {
+		read_size = msg->hdr.size - PMU_MSG_HDR_SIZE;
+		err = pmu_queue_pop(pmu, queue, &msg->msg,
+			read_size, &bytes_read);
+		if (err || bytes_read != read_size) {
+			nv_error(ppmu,
+				"fail to read msg from queue %d", queue->id);
+			*status = err;
+			goto clean_up;
+		}
+	}
+
+	err = pmu_queue_close(pmu, queue, true);
+	if (err) {
+		nv_error(ppmu,
+			"fail to close queue %d", queue->id);
+		*status = err;
+		return false;
+	}
+
+	return true;
+
+clean_up:
+	err = pmu_queue_close(pmu, queue, false);
+	if (err)
+		nv_error(ppmu,
+			"fail to close queue %d", queue->id);
+	return false;
+}
+
+static int pmu_response_handle(struct pmu_desc *pmu,
+			struct pmu_msg *msg)
+{
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	struct pmu_sequence *seq;
+	int ret = 0;
+
+	nv_debug(ppmu, "handling pmu response\n");
+	seq = &pmu->seq[msg->hdr.seq_id];
+	if (seq->state != PMU_SEQ_STATE_USED &&
+	    seq->state != PMU_SEQ_STATE_CANCELLED) {
+		nv_error(ppmu,
+			"msg for an unknown sequence %d", seq->id);
+		return -EINVAL;
+	}
+
+	if (msg->hdr.unit_id == PMU_UNIT_RC &&
+	    msg->msg.rc.msg_type == PMU_RC_MSG_TYPE_UNHANDLED_CMD) {
+		nv_error(ppmu,
+			"unhandled cmd: seq %d", seq->id);
+	} else if (seq->state != PMU_SEQ_STATE_CANCELLED) {
+		if (seq->msg) {
+			if (seq->msg->hdr.size >= msg->hdr.size) {
+				memcpy(seq->msg, msg, msg->hdr.size);
+				if (seq->out_gk20a.alloc.dmem.size != 0) {
+					pmu_copy_from_dmem(pmu,
+					seq->out_gk20a.alloc.dmem.offset,
+					seq->out_payload,
+					seq->out_gk20a.alloc.dmem.size, 0);
+				}
+			} else {
+				nv_error(ppmu,
+					"sequence %d msg buffer too small",
+					seq->id);
+			}
+		}
+	} else
+		seq->callback = NULL;
+	if (seq->in_gk20a.alloc.dmem.size != 0)
+		pmu->dmem.free(&pmu->dmem,
+			seq->in_gk20a.alloc.dmem.offset,
+			seq->in_gk20a.alloc.dmem.size,
+			PMU_DMEM_ALLOC_ALIGNMENT);
+	if (seq->out_gk20a.alloc.dmem.size != 0)
+		pmu->dmem.free(&pmu->dmem,
+			seq->out_gk20a.alloc.dmem.offset,
+			seq->out_gk20a.alloc.dmem.size,
+			PMU_DMEM_ALLOC_ALIGNMENT);
+
+	if (seq->callback)
+		seq->callback(ppmu, msg, seq->cb_params, seq->desc, ret);
+
+	pmu_seq_release(pmu, seq);
+
+	/* TBD: notify client waiting for available dmem */
+	nv_debug(ppmu, "pmu response processed\n");
+
+	return 0;
+}
+
+int pmu_wait_message_cond(struct pmu_desc *pmu, u32 timeout,
+				 u32 *var, u32 val);
+
+
+static int pmu_handle_event(struct pmu_desc *pmu, struct pmu_msg *msg)
+{
+	int err = 0;
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+
+	switch (msg->hdr.unit_id) {
+	case PMU_UNIT_PERFMON:
+		nv_debug(ppmu, "init perfmon event generated\n");
+		break;
+	default:
+		nv_debug(ppmu, "default event generated\n");
+		break;
+	}
+
+	return err;
+}
+
+void pmu_process_message(struct work_struct *work)
+{
+	struct pmu_desc *pmu = container_of(work, struct pmu_desc, isr_workq);
+	struct pmu_msg msg;
+	int status;
+	struct nvkm_pmu *ppmu = (void *)nvkm_pmu((void *)
+		impl_from_pmu(pmu));
+	struct nvkm_mc *pmc = nvkm_mc(ppmu);
+
+	mutex_lock(&pmu->isr_mutex);
+	if (unlikely(!pmu->pmu_ready)) {
+		nv_debug(ppmu, "processing init msg\n");
+		pmu_process_init_msg(pmu, &msg);
+		mutex_unlock(&pmu->isr_mutex);
+		pmu_enable_irq(ppmu, pmc, true);
+		goto out;
+	}
+
+	while (pmu_read_message(pmu,
+		&pmu->queue[PMU_MESSAGE_QUEUE], &msg, &status)) {
+
+		nv_debug(ppmu, "read msg hdr:\n"
+				"unit_id = 0x%08x, size = 0x%08x,\n"
+				"ctrl_flags = 0x%08x, seq_id = 0x%08x\n",
+				msg.hdr.unit_id, msg.hdr.size,
+				msg.hdr.ctrl_flags, msg.hdr.seq_id);
+
+		msg.hdr.ctrl_flags &= ~PMU_CMD_FLAGS_PMU_MASK;
+
+		if (msg.hdr.ctrl_flags == PMU_CMD_FLAGS_EVENT)
+			pmu_handle_event(pmu, &msg);
+		else
+			pmu_response_handle(pmu, &msg);
+	}
+	mutex_unlock(&pmu->isr_mutex);
+	pmu_enable_irq(ppmu, pmc, true);
+out:
+	nv_debug(ppmu, "exit %s\n", __func__);
+}
+
+int gk20a_pmu_destroy(struct nvkm_pmu *ppmu, struct nvkm_mc *pmc)
+{
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+
+	/* make sure the pending operations are finished before we continue */
+	cancel_work_sync(&pmu->isr_workq);
+	pmu->initialized = false;
+
+	mutex_lock(&pmu->isr_mutex);
+	pmu_enable(ppmu, pmc, false);
+	pmu->isr_enabled = false;
+	mutex_unlock(&pmu->isr_mutex);
+
+	pmu->pmu_state = PMU_STATE_OFF;
+	pmu->pmu_ready = false;
+	pmu->zbc_ready = false;
+
+	return 0;
+}
+
+int gk20a_pmu_load_norm(struct nvkm_pmu *ppmu, u32 *load)
+{
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+	*load = pmu->load_shadow;
+	return 0;
+}
+
+int gk20a_pmu_load_update(struct nvkm_pmu *ppmu)
+{
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+	u16 _load = 0;
+
+	pmu_copy_from_dmem(pmu, pmu->sample_buffer, (u8 *)&_load, 2, 0);
+	pmu->load_shadow = _load / 10;
+	pmu->load_avg = (((9*pmu->load_avg) + pmu->load_shadow) / 10);
+
+	return 0;
+}
+
+void gk20a_pmu_get_load_counters(struct nvkm_pmu *ppmu, u32 *busy_cycles,
+				 u32 *total_cycles)
+{
+  /*todo if (!g->power_on || gk20a_busy(g->dev)) {
+		*busy_cycles = 0;
+		*total_cycles = 0;
+		return;
+		}*/
+
+	*busy_cycles = nv_rd32(ppmu, 0x0010a508 + 16) & 0x7fffffff;
+	/*todormb();*/
+	*total_cycles = nv_rd32(ppmu, 0x0010a508 + 32) & 0x7fffffff;
+	/*todogk20a_idle(g->dev);*/
+}
+
+void gk20a_pmu_reset_load_counters(struct nvkm_pmu *ppmu)
+{
+	u32 reg_val = 1 << 31;
+
+	/*todoif (!g->power_on || gk20a_busy(g->dev))
+	  return;*/
+
+	nv_wr32(ppmu, 0x0010a508 + 32, reg_val);
+	/*todowmb()*/;
+	nv_wr32(ppmu, 0x0010a508 + 16, reg_val);
+	/*todogk20a_idle(g->dev);*/
+}
+
+static int gk20a_init_pmu_setup_hw1(struct nvkm_pmu *ppmu, struct nvkm_mc *pmc)
+{
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+	int err;
+
+	mutex_lock(&pmu->isr_mutex);
+	pmu_reset(ppmu, pmc);
+	pmu->isr_enabled = true;
+	mutex_unlock(&pmu->isr_mutex);
+
+	/* setup apertures - virtual */
+	nv_wr32(ppmu, 0x10a600 + 0 * 4, 0x0);
+	nv_wr32(ppmu, 0x10a600 + 1 * 4, 0x0);
+	/* setup apertures - physical */
+	nv_wr32(ppmu, 0x10a600 + 2 * 4, 0x4 | 0x0);
+	nv_wr32(ppmu, 0x10a600 + 3 * 4, 0x4 | 0x1);
+	nv_wr32(ppmu, 0x10a600 + 4 * 4, 0x4 | 0x2);
+
+	/* TBD: load pmu ucode */
+	err = pmu_bootstrap(pmu);
+	if (err)
+		return err;
+
+	return 0;
+
+}
+
+static int gk20a_init_pmu_setup_sw(struct nvkm_pmu *ppmu)
+{
+	struct nvkm_pmu_impl *impl = (void *)nv_oclass(ppmu);
+	struct pmu_desc *pmu = &impl->pmudata;
+	struct pmu_priv_vm *ppmuvm = &pmuvm;
+	int i, err = 0;
+	int ret = 0;
+
+
+	if (pmu->sw_ready) {
+
+		for (i = 0; i < pmu->mutex_cnt; i++) {
+			pmu->mutex[i].id    = i;
+			pmu->mutex[i].index = i;
+		}
+		pmu_seq_init(pmu);
+
+		nv_debug(ppmu, "skipping init\n");
+		goto skip_init;
+	}
+
+	/* no infoRom script from vbios? */
+
+	/* TBD: sysmon subtask */
+
+	pmu->mutex_cnt = 0x00000010;
+	pmu->mutex = kzalloc(pmu->mutex_cnt *
+		sizeof(struct pmu_mutex), GFP_KERNEL);
+	if (!pmu->mutex) {
+		err = -ENOMEM;
+		nv_error(ppmu, "not enough space ENOMEM\n");
+		goto err;
+	}
+
+	for (i = 0; i < pmu->mutex_cnt; i++) {
+		pmu->mutex[i].id    = i;
+		pmu->mutex[i].index = i;
+	}
+
+	pmu->seq = kzalloc(PMU_MAX_NUM_SEQUENCES *
+		sizeof(struct pmu_sequence), GFP_KERNEL);
+	if (!pmu->seq) {
+		err = -ENOMEM;
+		nv_error(ppmu, "not enough space ENOMEM\n");
+		goto err_free_mutex;
+	}
+
+	pmu_seq_init(pmu);
+
+	INIT_WORK(&pmu->isr_workq, pmu_process_message);
+	init_waitqueue_head(&ppmu->init_wq);
+	ppmu->gr_initialised = false;
+
+	/* allocate memory for pmu fw area */
+	ret = nvkm_gpuobj_new(nv_object(ppmu), NULL, GK20A_PMU_SEQ_BUF_SIZE,
+					    0x1000, 0, &pmu->seq_buf.pmubufobj);
+	if (ret)
+		return ret;
+	ret = nvkm_gpuobj_new(nv_object(ppmu), NULL, GK20A_PMU_TRACE_BUFSIZE,
+					    0, 0, &pmu->trace_buf.pmubufobj);
+	if (ret)
+		return ret;
+	/* map allocated memory into GMMU */
+	ret = nvkm_gpuobj_map_vm(nv_gpuobj(pmu->seq_buf.pmubufobj),
+					ppmuvm->vm,
+					NV_MEM_ACCESS_RW,
+					&pmu->seq_buf.pmubufvma);
+	if (ret)
+		return ret;
+	ret = nvkm_gpuobj_map_vm(nv_gpuobj(pmu->trace_buf.pmubufobj),
+					ppmuvm->vm,
+					NV_MEM_ACCESS_RW,
+					&pmu->trace_buf.pmubufvma);
+	if (ret)
+		return ret;
+
+	/* TBD: remove this if ZBC save/restore is handled by PMU
+	 * end an empty ZBC sequence for now */
+	nv_wo32(pmu->seq_buf.pmubufobj, 0, 0x16);
+	nv_wo32(pmu->seq_buf.pmubufobj, 1, 0x00);
+	nv_wo32(pmu->seq_buf.pmubufobj, 2, 0x01);
+	nv_wo32(pmu->seq_buf.pmubufobj, 3, 0x00);
+	nv_wo32(pmu->seq_buf.pmubufobj, 4, 0x00);
+	nv_wo32(pmu->seq_buf.pmubufobj, 5, 0x00);
+	nv_wo32(pmu->seq_buf.pmubufobj, 6, 0x00);
+	nv_wo32(pmu->seq_buf.pmubufobj, 7, 0x00);
+
+	pmu->seq_buf.size = GK20A_PMU_SEQ_BUF_SIZE;
+	ret = gk20a_pmu_debugfs_init(ppmu);
+	if (ret)
+		return ret;
+
+	pmu->sw_ready = true;
+
+skip_init:
+	return 0;
+err_free_mutex:
+	kfree(pmu->mutex);
+err:
+	return err;
+}
+
+static void
+gk20a_pmu_pgob(struct nvkm_pmu *ppmu, bool enable)
+{
+	/*
+	nv_mask(ppmu, 0x000200, 0x00001000, 0x00000000);
+	nv_rd32(ppmu, 0x000200);
+	nv_mask(ppmu, 0x000200, 0x08000000, 0x08000000);
+
+	msleep(50);
+
+	nv_mask(ppmu, 0x000200, 0x08000000, 0x00000000);
+	nv_mask(ppmu, 0x000200, 0x00001000, 0x00001000);
+	nv_rd32(ppmu, 0x000200);
+	*/
+}
+
+static void gk20a_pmu_intr(struct nvkm_subdev *subdev)
+{
+	struct nvkm_pmu *ppmu = nvkm_pmu(subdev);
+
+	gk20a_pmu_isr(ppmu);
+}
+
+void gk20a_remove_pmu_support(struct pmu_desc *pmu)
+{
+	nvkm_pmu_allocator_destroy(&pmu->dmem);
+}
+
+int  gk20a_message(struct nvkm_pmu *ppmu, u32 reply[2],
+		 u32 process, u32 message, u32 data0, u32 data1)
+{
+	return -EPERM;
+}
+
+int
+gk20a_pmu_create_(struct nvkm_object *parent,
+		    struct nvkm_object *engine,
+		    struct nvkm_oclass *oclass, int length, void **pobject)
+{
+	struct nvkm_pmu *ppmu;
+	struct nvkm_device *device = nv_device(parent);
+	int ret;
+
+	ret = nvkm_subdev_create_(parent, engine, oclass, 0, "PPMU",
+				     "pmu", length, pobject);
+	ppmu = *pobject;
+	if (ret)
+		return ret;
+
+	ret = nv_device_get_irq(device, true);
+
+	ppmu->message = gk20a_message;
+	ppmu->pgob = gk20a_pmu_pgob;
+	ppmu->pmu_mutex_acquire = pmu_mutex_acquire;
+	ppmu->pmu_mutex_release = pmu_mutex_release;
+	ppmu->pmu_load_norm = gk20a_pmu_load_norm;
+	ppmu->pmu_load_update = gk20a_pmu_load_update;
+	ppmu->pmu_reset_load_counters = gk20a_pmu_reset_load_counters;
+	ppmu->pmu_get_load_counters = gk20a_pmu_get_load_counters;
+
+	return 0;
+}
+
+
+
diff --git a/drm/nouveau/nvkm/subdev/pmu/gk20a.h b/drm/nouveau/nvkm/subdev/pmu/gk20a.h
new file mode 100644
index 000000000000..a084d6d518b4
--- /dev/null
+++ b/drm/nouveau/nvkm/subdev/pmu/gk20a.h
@@ -0,0 +1,369 @@
+#ifndef __NVKM_pmu_GK20A_H__
+#define __NVKM_pmu_GK20A_H__
+
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+void pmu_setup_hw(struct pmu_desc *pmu);
+void gk20a_remove_pmu_support(struct pmu_desc *pmu);
+#define gk20a_pmu_create(p, e, o, d)                                         \
+	gk20a_pmu_create_((p), (e), (o), sizeof(**d), (void **)d)
+
+int gk20a_pmu_create_(struct nvkm_object *, struct nvkm_object *,
+			struct nvkm_oclass *, int, void **);
+/* defined by pmu hw spec */
+#define GK20A_PMU_VA_SIZE		(512 * 1024 * 1024)
+#define GK20A_PMU_UCODE_SIZE_MAX	(256 * 1024)
+#define GK20A_PMU_SEQ_BUF_SIZE		4096
+/* idle timeout */
+#define GK20A_IDLE_CHECK_DEFAULT		100 /* usec */
+#define GK20A_IDLE_CHECK_MAX		5000 /* usec */
+
+/* so far gk20a has two engines: gr and ce2(gr_copy) */
+enum {
+	ENGINE_GR_GK20A	    = 0,
+	ENGINE_CE2_GK20A    = 1,
+	ENGINE_INVAL_GK20A
+};
+
+#define ZBC_MASK(i)			(~(~(0) << ((i)+1)) & 0xfffe)
+
+#define APP_VERSION_GK20A 17997577
+
+enum {
+	GK20A_PMU_DMAIDX_UCODE		= 0,
+	GK20A_PMU_DMAIDX_VIRT		= 1,
+	GK20A_PMU_DMAIDX_PHYS_VID	= 2,
+	GK20A_PMU_DMAIDX_PHYS_SYS_COH	= 3,
+	GK20A_PMU_DMAIDX_PHYS_SYS_NCOH	= 4,
+	GK20A_PMU_DMAIDX_RSVD		= 5,
+	GK20A_PMU_DMAIDX_PELPG		= 6,
+	GK20A_PMU_DMAIDX_END		= 7
+};
+
+struct pmu_mem_gk20a {
+	u32 dma_base;
+	u8  dma_offset;
+	u8  dma_idx;
+	u16 fb_size;
+};
+
+struct pmu_dmem {
+	u16 size;
+	u32 offset;
+};
+
+struct pmu_cmdline_args_gk20a {
+	u32 cpu_freq_hz;		/* Frequency of the clock driving PMU */
+	u32 falc_trace_size;		/* falctrace buffer size (bytes) */
+	u32 falc_trace_dma_base;	/* 256-byte block address */
+	u32 falc_trace_dma_idx;		/* dmaIdx for DMA operations */
+	u8 secure_mode;
+	struct pmu_mem_gk20a gc6_ctx;		/* dmem offset of gc6 context */
+};
+
+#define GK20A_PMU_TRACE_BUFSIZE     0x4000   /* 4K */
+#define GK20A_PMU_DMEM_BLKSIZE2		8
+
+#define GK20A_PMU_UCODE_NB_MAX_OVERLAY	    32
+#define GK20A_PMU_UCODE_NB_MAX_DATE_LENGTH  64
+
+struct pmu_ucode_desc {
+	u32 descriptor_size;
+	u32 image_size;
+	u32 tools_version;
+	u32 app_version;
+	char date[GK20A_PMU_UCODE_NB_MAX_DATE_LENGTH];
+	u32 bootloader_start_offset;
+	u32 bootloader_size;
+	u32 bootloader_imem_offset;
+	u32 bootloader_entry_point;
+	u32 app_start_offset;
+	u32 app_size;
+	u32 app_imem_offset;
+	u32 app_imem_entry;
+	u32 app_dmem_offset;
+	u32 app_resident_code_offset;  /* Offset from appStartOffset */
+/* Exact size of the resident code
+ * ( potentially contains CRC inside at the end ) */
+	u32 app_resident_code_size;
+	u32 app_resident_data_offset;  /* Offset from appStartOffset */
+/* Exact size of the resident data
+ * ( potentially contains CRC inside at the end ) */
+	u32 app_resident_data_size;
+	u32 nb_overlays;
+	struct {u32 start; u32 size; } load_ovl[GK20A_PMU_UCODE_NB_MAX_OVERLAY];
+	u32 compressed;
+};
+
+#define PMU_UNIT_REWIND		(0x00)
+#define PMU_UNIT_PG		(0x03)
+#define PMU_UNIT_INIT		(0x07)
+#define PMU_UNIT_PERFMON	(0x12)
+#define PMU_UNIT_THERM		(0x1B)
+#define PMU_UNIT_RC		(0x1F)
+#define PMU_UNIT_NULL		(0x20)
+#define PMU_UNIT_END		(0x23)
+
+#define PMU_UNIT_TEST_START	(0xFE)
+#define PMU_UNIT_END_SIM	(0xFF)
+#define PMU_UNIT_TEST_END	(0xFF)
+
+#define PMU_UNIT_ID_IS_VALID(id)		\
+		(((id) < PMU_UNIT_END) || ((id) >= PMU_UNIT_TEST_START))
+
+#define PMU_DMEM_ALLOC_ALIGNMENT	(32)
+#define PMU_DMEM_ALIGNMENT		(4)
+
+#define PMU_CMD_FLAGS_PMU_MASK		(0xF0)
+
+#define PMU_CMD_FLAGS_STATUS		BIT(0)
+#define PMU_CMD_FLAGS_INTR		BIT(1)
+#define PMU_CMD_FLAGS_EVENT		BIT(2)
+#define PMU_CMD_FLAGS_WATERMARK		BIT(3)
+
+struct pmu_hdr {
+	u8 unit_id;
+	u8 size;
+	u8 ctrl_flags;
+	u8 seq_id;
+};
+#define PMU_MSG_HDR_SIZE	sizeof(struct pmu_hdr)
+#define PMU_CMD_HDR_SIZE	sizeof(struct pmu_hdr)
+
+
+struct pmu_allocation_gk20a {
+	struct {
+		struct pmu_dmem dmem;
+		struct pmu_mem_gk20a fb;
+	} alloc;
+};
+
+enum {
+	PMU_INIT_MSG_TYPE_PMU_INIT = 0,
+};
+
+struct pmu_init_msg_pmu_gk20a {
+	u8 msg_type;
+	u8 pad;
+	u16  os_debug_entry_point;
+
+	struct {
+		u16 size;
+		u16 offset;
+		u8  index;
+		u8  pad;
+	} queue_info[PMU_QUEUE_COUNT];
+
+	u16 sw_managed_area_offset;
+	u16 sw_managed_area_size;
+};
+
+struct pmu_init_msg {
+	union {
+		u8 msg_type;
+		struct pmu_init_msg_pmu_gk20a pmu_init_gk20a;
+	};
+};
+
+
+enum {
+	PMU_RC_MSG_TYPE_UNHANDLED_CMD = 0,
+};
+
+struct pmu_rc_msg_unhandled_cmd {
+	u8 msg_type;
+	u8 unit_id;
+};
+
+struct pmu_rc_msg {
+	u8 msg_type;
+	struct pmu_rc_msg_unhandled_cmd unhandled_cmd;
+};
+
+/* PERFMON */
+#define PMU_DOMAIN_GROUP_PSTATE		0
+#define PMU_DOMAIN_GROUP_GPC2CLK	1
+#define PMU_DOMAIN_GROUP_NUM		2
+struct pmu_perfmon_counter_gk20a {
+	u8 index;
+	u8 flags;
+	u8 group_id;
+	u8 valid;
+	u16 upper_threshold; /* units of 0.01% */
+	u16 lower_threshold; /* units of 0.01% */
+};
+struct pmu_zbc_cmd {
+	u8 cmd_type;
+	u8 pad;
+	u16 entry_mask;
+};
+
+/* PERFMON MSG */
+enum {
+	PMU_PERFMON_MSG_ID_INCREASE_EVENT = 0,
+	PMU_PERFMON_MSG_ID_DECREASE_EVENT = 1,
+	PMU_PERFMON_MSG_ID_INIT_EVENT     = 2,
+	PMU_PERFMON_MSG_ID_ACK            = 3
+};
+
+struct pmu_perfmon_msg_generic {
+	u8 msg_type;
+	u8 state_id;
+	u8 group_id;
+	u8 data;
+};
+
+struct pmu_perfmon_msg {
+	union {
+		u8 msg_type;
+		struct pmu_perfmon_msg_generic gen;
+	};
+};
+
+
+struct pmu_cmd {
+	struct pmu_hdr hdr;
+	union {
+		struct pmu_zbc_cmd zbc;
+	} cmd;
+};
+
+struct pmu_msg {
+	struct pmu_hdr hdr;
+	union {
+		struct pmu_init_msg init;
+		struct pmu_perfmon_msg perfmon;
+		struct pmu_rc_msg rc;
+	} msg;
+};
+
+/* write by sw, read by pmu, protected by sw mutex lock */
+#define PMU_COMMAND_QUEUE_HPQ		0
+/* write by sw, read by pmu, protected by sw mutex lock */
+#define PMU_COMMAND_QUEUE_LPQ		1
+/* write by pmu, read by sw, accessed by interrupt handler, no lock */
+#define PMU_MESSAGE_QUEUE		4
+#define PMU_QUEUE_COUNT			5
+
+enum {
+	PMU_MUTEX_ID_RSVD1 = 0,
+	PMU_MUTEX_ID_GPUSER,
+	PMU_MUTEX_ID_GPMUTEX,
+	PMU_MUTEX_ID_I2C,
+	PMU_MUTEX_ID_RMLOCK,
+	PMU_MUTEX_ID_MSGBOX,
+	PMU_MUTEX_ID_FIFO,
+	PMU_MUTEX_ID_PG,
+	PMU_MUTEX_ID_GR,
+	PMU_MUTEX_ID_CLK,
+	PMU_MUTEX_ID_RSVD6,
+	PMU_MUTEX_ID_RSVD7,
+	PMU_MUTEX_ID_RSVD8,
+	PMU_MUTEX_ID_RSVD9,
+	PMU_MUTEX_ID_INVALID
+};
+
+#define PMU_IS_COMMAND_QUEUE(id)	\
+		((id)  < PMU_MESSAGE_QUEUE)
+
+#define PMU_IS_SW_COMMAND_QUEUE(id)	\
+		(((id) == PMU_COMMAND_QUEUE_HPQ) || \
+		 ((id) == PMU_COMMAND_QUEUE_LPQ))
+
+#define  PMU_IS_MESSAGE_QUEUE(id)	\
+		((id) == PMU_MESSAGE_QUEUE)
+
+enum {
+	OFLAG_READ = 0,
+	OFLAG_WRITE
+};
+
+#define QUEUE_SET		(true)
+	/*todo find how to get cpu_pa*/
+#define QUEUE_GET		(false)
+
+#define QUEUE_ALIGNMENT		(4)
+
+#define PMU_PGENG_GR_BUFFER_IDX_INIT	(0)
+#define PMU_PGENG_GR_BUFFER_IDX_ZBC	(1)
+#define PMU_PGENG_GR_BUFFER_IDX_FECS	(2)
+
+enum {
+	PMU_DMAIDX_UCODE         = 0,
+	PMU_DMAIDX_VIRT          = 1,
+	PMU_DMAIDX_PHYS_VID      = 2,
+	PMU_DMAIDX_PHYS_SYS_COH  = 3,
+	PMU_DMAIDX_PHYS_SYS_NCOH = 4,
+	PMU_DMAIDX_RSVD          = 5,
+	PMU_DMAIDX_PELPG         = 6,
+	PMU_DMAIDX_END           = 7
+};
+
+#define PMU_MUTEX_ID_IS_VALID(id)	\
+		((id) < PMU_MUTEX_ID_INVALID)
+
+#define PMU_INVALID_MUTEX_OWNER_ID	(0)
+
+struct pmu_mutex {
+	u32 id;
+	u32 index;
+	u32 ref_cnt;
+};
+
+
+#define PMU_INVALID_SEQ_DESC		(~0)
+
+enum {
+	PMU_SEQ_STATE_FREE = 0,
+	PMU_SEQ_STATE_PENDING,
+	PMU_SEQ_STATE_USED,
+	PMU_SEQ_STATE_CANCELLED
+};
+
+struct pmu_payload {
+	struct {
+		void *buf;
+		u32 offset;
+		u32 size;
+	} in, out;
+};
+
+typedef void (*pmu_callback)(struct nvkm_pmu *, struct pmu_msg *, void *,
+u32, u32);
+
+struct pmu_sequence {
+	u8 id;
+	u32 state;
+	u32 desc;
+	struct pmu_msg *msg;
+	struct pmu_allocation_gk20a in_gk20a;
+	struct pmu_allocation_gk20a out_gk20a;
+	u8 *out_payload;
+	pmu_callback callback;
+	void *cb_params;
+};
+struct pmu_gk20a_data {
+	struct pmu_perfmon_counter_gk20a perfmon_counter_gk20a;
+	u32 perfmon_state_id[PMU_DOMAIN_GROUP_NUM];
+};
+
+#endif /*_GK20A_H__*/
diff --git a/drm/nouveau/nvkm/subdev/pmu/priv.h b/drm/nouveau/nvkm/subdev/pmu/priv.h
index 998410563bfd..c4686e418582 100644
--- a/drm/nouveau/nvkm/subdev/pmu/priv.h
+++ b/drm/nouveau/nvkm/subdev/pmu/priv.h
@@ -2,7 +2,91 @@
 #define __NVKM_PMU_PRIV_H__
 #include <subdev/pmu.h>
 #include <subdev/pmu/fuc/os.h>
+#include <core/object.h>
+#include <core/device.h>
+#include <core/parent.h>
+#include <core/mm.h>
+#include <linux/rwsem.h>
+#include <linux/slab.h>
+#include <subdev/mmu.h>
+#include <core/gpuobj.h>
 
+static inline u32 u64_hi32(u64 n)
+{
+	return (u32)((n >> 32) & ~(u32)0);
+}
+
+static inline u32 u64_lo32(u64 n)
+{
+	return (u32)(n & ~(u32)0);
+}
+
+/* #define ALLOCATOR_DEBUG */
+
+/* main struct */
+struct nvkm_pmu_allocator {
+
+	char name[32];			/* name for allocator */
+/*struct rb_root rb_root;*/		/* rb tree root for blocks */
+
+	u32 base;			/* min value of this linear space */
+	u32 limit;			/* max value = limit - 1 */
+
+	unsigned long *bitmap;		/* bitmap */
+
+	struct gk20a_alloc_block *block_first;	/* first block in list */
+	struct gk20a_alloc_block *block_recent; /* last visited block */
+
+	u32 first_free_addr;		/* first free addr, non-contigous
+					   allocation preferred start,
+					   in order to pick up small holes */
+	u32 last_free_addr;		/* last free addr, contiguous
+					   allocation preferred start */
+	u32 cached_hole_size;		/* max free hole size up to
+					   last_free_addr */
+	u32 block_count;		/* number of blocks */
+
+	struct rw_semaphore rw_sema;	/* lock */
+	struct kmem_cache *block_cache;	/* slab cache */
+
+	/* if enabled, constrain to [base, limit) */
+	struct {
+		bool enable;
+		u32 base;
+		u32 limit;
+	} constraint;
+
+	int (*alloc)(struct nvkm_pmu_allocator *allocator,
+		u32 *addr, u32 len, u32 align);
+	int (*free)(struct nvkm_pmu_allocator *allocator,
+		u32 addr, u32 len, u32 align);
+
+};
+
+int nvkm_pmu_allocator_init(struct nvkm_pmu_allocator *allocator,
+			const char *name, u32 base, u32 size);
+void nvkm_pmu_allocator_destroy(struct nvkm_pmu_allocator *allocator);
+
+int nvkm_pmu_allocator_block_alloc(struct nvkm_pmu_allocator *allocator,
+			u32 *addr, u32 len, u32 align);
+
+int nvkm_pmu_allocator_block_free(struct nvkm_pmu_allocator *allocator,
+			u32 addr, u32 len, u32 align);
+
+#if defined(ALLOCATOR_DEBUG)
+
+#define allocator_dbg(alloctor, format, arg...)				\
+do {								\
+	if (1)							\
+		pr_debug("nvkm_pmu_allocator (%s) %s: " format "\n",\
+			alloctor->name, __func__, ##arg);\
+} while (0)
+
+#else /* ALLOCATOR_DEBUG */
+
+#define allocator_dbg(format, arg...)
+
+#endif /* ALLOCATOR_DEBUG */
 #define nvkm_pmu_create(p, e, o, d)                                         \
 	nvkm_pmu_create_((p), (e), (o), sizeof(**d), (void **)d)
 #define nvkm_pmu_destroy(p)                                                 \
@@ -26,6 +110,179 @@ int _nvkm_pmu_ctor(struct nvkm_object *, struct nvkm_object *,
 int _nvkm_pmu_init(struct nvkm_object *);
 int _nvkm_pmu_fini(struct nvkm_object *, bool);
 void nvkm_pmu_pgob(struct nvkm_pmu *pmu, bool enable);
+#define PMU_PG_IDLE_THRESHOLD			15000
+#define PMU_PG_POST_POWERUP_IDLE_THRESHOLD	1000000
+
+/* state transition :
+    OFF => [OFF_ON_PENDING optional] => ON_PENDING => ON => OFF
+    ON => OFF is always synchronized */
+#define PMU_ELPG_STAT_OFF		0   /* elpg is off */
+#define PMU_ELPG_STAT_ON		1   /* elpg is on */
+/* elpg is off, ALLOW cmd has been sent, wait for ack */
+#define PMU_ELPG_STAT_ON_PENDING	2
+/* elpg is on, DISALLOW cmd has been sent, wait for ack */
+#define PMU_ELPG_STAT_OFF_PENDING	3
+/* elpg is off, caller has requested on, but ALLOW
+cmd hasn't been sent due to ENABLE_ALLOW delay */
+#define PMU_ELPG_STAT_OFF_ON_PENDING	4
+
+/* Falcon Register index */
+#define PMU_FALCON_REG_R0		(0)
+#define PMU_FALCON_REG_R1		(1)
+#define PMU_FALCON_REG_R2		(2)
+#define PMU_FALCON_REG_R3		(3)
+#define PMU_FALCON_REG_R4		(4)
+#define PMU_FALCON_REG_R5		(5)
+#define PMU_FALCON_REG_R6		(6)
+#define PMU_FALCON_REG_R7		(7)
+#define PMU_FALCON_REG_R8		(8)
+#define PMU_FALCON_REG_R9		(9)
+#define PMU_FALCON_REG_R10		(10)
+#define PMU_FALCON_REG_R11		(11)
+#define PMU_FALCON_REG_R12		(12)
+#define PMU_FALCON_REG_R13		(13)
+#define PMU_FALCON_REG_R14		(14)
+#define PMU_FALCON_REG_R15		(15)
+#define PMU_FALCON_REG_IV0		(16)
+#define PMU_FALCON_REG_IV1		(17)
+#define PMU_FALCON_REG_UNDEFINED	(18)
+#define PMU_FALCON_REG_EV		(19)
+#define PMU_FALCON_REG_SP		(20)
+#define PMU_FALCON_REG_PC		(21)
+#define PMU_FALCON_REG_IMB		(22)
+#define PMU_FALCON_REG_DMB		(23)
+#define PMU_FALCON_REG_CSW		(24)
+#define PMU_FALCON_REG_CCR		(25)
+#define PMU_FALCON_REG_SEC		(26)
+#define PMU_FALCON_REG_CTX		(27)
+#define PMU_FALCON_REG_EXCI		(28)
+#define PMU_FALCON_REG_RSVD0		(29)
+#define PMU_FALCON_REG_RSVD1		(30)
+#define PMU_FALCON_REG_RSVD2		(31)
+#define PMU_FALCON_REG_SIZE		(32)
+
+/* Choices for pmu_state */
+#define PMU_STATE_OFF			0 /* PMU is off */
+#define PMU_STATE_STARTING		1 /* PMU is on, but not booted */
+#define PMU_STATE_INIT_RECEIVED		2 /* PMU init message received */
+#define PMU_STATE_ELPG_BOOTING		3 /* PMU is booting */
+#define PMU_STATE_ELPG_BOOTED		4 /* ELPG is initialized */
+#define PMU_STATE_LOADING_PG_BUF	5 /* Loading PG buf */
+#define PMU_STATE_LOADING_ZBC		6 /* Loading ZBC buf */
+#define PMU_STATE_STARTED		7 /* Fully unitialized */
+
+#define PMU_QUEUE_COUNT		5
+
+#define PMU_MAX_NUM_SEQUENCES		(256)
+#define PMU_SEQ_BIT_SHIFT		(5)
+#define PMU_SEQ_TBL_SIZE	\
+		(PMU_MAX_NUM_SEQUENCES >> PMU_SEQ_BIT_SHIFT)
+
+#define PMU_SHA1_GID_SIGNATURE		0xA7C66AD2
+#define PMU_SHA1_GID_SIGNATURE_SIZE	4
+
+#define PMU_SHA1_GID_SIZE	16
+
+struct pmu_queue {
+
+	/* used by hw, for BIOS/SMI queue */
+	u32 mutex_id;
+	u32 mutex_lock;
+	/* used by sw, for LPQ/HPQ queue */
+	struct mutex mutex;
+
+	/* current write position */
+	u32 position;
+	/* physical dmem offset where this queue begins */
+	u32 offset;
+	/* logical queue identifier */
+	u32 id;
+	/* physical queue index */
+	u32 index;
+	/* in bytes */
+	u32 size;
+
+	/* open-flag */
+	u32 oflag;
+	bool opened; /* opened implies locked */
+};
+
+struct pmu_sha1_gid {
+	bool valid;
+	u8 gid[PMU_SHA1_GID_SIZE];
+};
+
+struct pmu_sha1_gid_data {
+	u8 signature[PMU_SHA1_GID_SIGNATURE_SIZE];
+	u8 gid[PMU_SHA1_GID_SIZE];
+};
+
+struct pmu_desc {
+
+	struct pmu_ucode_desc *desc;
+	struct pmu_buf_desc ucode;
+
+	struct pmu_buf_desc pg_buf;
+	/* TBD: remove this if ZBC seq is fixed */
+	struct pmu_buf_desc seq_buf;
+	struct pmu_buf_desc trace_buf;
+	bool buf_loaded;
+
+	struct pmu_sha1_gid gid_info;
+
+	struct pmu_queue queue[PMU_QUEUE_COUNT];
+
+	struct pmu_sequence *seq;
+	unsigned long pmu_seq_tbl[PMU_SEQ_TBL_SIZE];
+	u32 next_seq_desc;
+
+	struct pmu_mutex *mutex;
+	u32 mutex_cnt;
+
+	struct mutex pmu_copy_lock;
+	struct mutex pmu_seq_lock;
+
+	struct nvkm_pmu_allocator dmem;
+
+	u32 *ucode_image;
+	bool pmu_ready;
+
+	u32 zbc_save_done;
+
+	u32 stat_dmem_offset;
+
+	u32 elpg_stat;
+
+	int pmu_state;
+
+#define PMU_ELPG_ENABLE_ALLOW_DELAY_MSEC	1 /* msec */
+	struct work_struct isr_workq;
+	struct mutex elpg_mutex; /* protect elpg enable/disable */
+/* disable -1, enable +1, <=0 elpg disabled, > 0 elpg enabled */
+	int elpg_refcnt;
+
+	bool initialized;
+
+	void (*remove_support)(struct pmu_desc *pmu);
+	bool sw_ready;
+	bool perfmon_ready;
+
+	u32 sample_buffer;
+	u32 load_shadow;
+	u32 load_avg;
+
+	struct mutex isr_mutex;
+	bool isr_enabled;
+
+	bool zbc_ready;
+	unsigned long perfmon_events_cnt;
+	bool perfmon_sampling_enabled;
+	u8 pmu_mode;
+	u32 falcon_id;
+	u32 aelpg_param[5];
+	void *pmu_chip_data;
+	struct nvkm_pmu *pmu;
+};
 
 struct nvkm_pmu_impl {
 	struct nvkm_oclass base;
@@ -39,5 +296,12 @@ struct nvkm_pmu_impl {
 	} data;
 
 	void (*pgob)(struct nvkm_pmu *, bool);
+	struct pmu_desc pmudata;
 };
+
+static inline struct nvkm_pmu *impl_from_pmu(struct pmu_desc *pmu)
+{
+	return pmu->pmu;
+}
+
 #endif
-- 
1.9.1
