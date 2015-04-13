From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] pmu/gk20a: PMU boot support
Date: Mon, 13 Apr 2015 19:42:18 +0900
Message-ID: <552B9D8A.5050202@nvidia.com>
References: <1428921530-28556-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428921530-28556-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Ben, I guess our main remaining concern with this patch is how it should 
integrate wrt. the existing PMU code. Since it is designed to interact 
with the NVIDIA firmware, maybe we should use a different base code, or 
do you think we can somehow share code and data structures?

Deepak, as explained in the review, I think your time is better spent 
making progress on (and starting submission of) the secure boot code. 
Hopefully this patch starts to be in good shape, so I will take care of 
it from now on. Thanks!

On 04/13/2015 07:38 PM, Alexandre Courbot wrote:
> From: Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> - Maps PMU firmware into PMU virtual memory.
> - Copy bootloader into PMU memory and start it.
> - Allow the PMU to interact with HOST via interrupts.
>
> PMU after successful configurations (to follow after this patch) will:
> 1.Autonomously power gate graphics engine when not in use.It will save
> us a lot of power.
> 2.Provide better way to scale frequencies by reporting Perf counters.
> 3.Be critical for GPU functionality as future GPUs secure some register
> & mem accesses involved in context switch.
>
> Signed-off-by: Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes since v3:
> - Cleaned formatting, renamed variables according to Nouveau standards
> - (Hopefully) fixed init/fini sequence
> - Removed a few more unneeded variables
>
>   drm/nouveau/nvkm/subdev/pmu/gk20a.c | 803 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 785 insertions(+), 18 deletions(-)
>
> diff --git a/drm/nouveau/nvkm/subdev/pmu/gk20a.c b/drm/nouveau/nvkm/subdev/pmu/gk20a.c
> index 594f746e68f2..c206ec5e558a 100644
> --- a/drm/nouveau/nvkm/subdev/pmu/gk20a.c
> +++ b/drm/nouveau/nvkm/subdev/pmu/gk20a.c
> @@ -1,5 +1,5 @@
>   /*
> - * Copyright (c) 2014, NVIDIA CORPORATION. All rights reserved.
> + * Copyright (c) 2014-2015, NVIDIA CORPORATION. All rights reserved.
>    *
>    * Permission is hereby granted, free of charge, to any person obtaining a
>    * copy of this software and associated documentation files (the "Software"),
> @@ -19,14 +19,186 @@
>    * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>    * DEALINGS IN THE SOFTWARE.
>    */
> -#include "priv.h"
>
> +#include "priv.h"
> +#include <core/client.h>
> +#include <core/gpuobj.h>
> +#include <subdev/bar.h>
> +#include <subdev/fb.h>
> +#include <subdev/mc.h>
> +#include <subdev/timer.h>
> +#include <subdev/mmu.h>
> +#include <subdev/pmu.h>
> +#include <core/object.h>
> +#include <core/device.h>
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
>   #include <subdev/clk.h>
>   #include <subdev/timer.h>
>   #include <subdev/volt.h>
>
> +#define APP_VERSION_GK20A  17997577
> +#define GK20A_PMU_UCODE_SIZE_MAX  (256 * 1024)
> +#define PMU_QUEUE_COUNT  5
> +
> +#define GK20A_PMU_TRACE_BUFSIZE             0x4000   /* 4K */
> +#define GK20A_PMU_DMEM_BLKSIZE2		    8
> +#define GK20A_PMU_UCODE_NB_MAX_OVERLAY	    32
> +#define GK20A_PMU_UCODE_NB_MAX_DATE_LENGTH  64
> +
> +#define PMU_UNIT_REWIND		(0x00)
> +#define PMU_UNIT_PG		(0x03)
> +#define PMU_UNIT_INIT		(0x07)
> +#define PMU_UNIT_PERFMON	(0x12)
> +#define PMU_UNIT_THERM		(0x1B)
> +#define PMU_UNIT_RC		(0x1F)
> +#define PMU_UNIT_NULL		(0x20)
> +#define PMU_UNIT_END		(0x23)
> +#define PMU_UNIT_TEST_START	(0xFE)
> +#define PMU_UNIT_END_SIM	(0xFF)
> +#define PMU_UNIT_TEST_END	(0xFF)
> +
> +#define PMU_UNIT_ID_IS_VALID(id)		\
> +		(((id) < PMU_UNIT_END) || ((id) >= PMU_UNIT_TEST_START))
> +#define PMU_DMEM_ALIGNMENT		(4)
> +
>   #define BUSY_SLOT	0
>   #define CLK_SLOT	7
> +#define GK20A_PMU_UCODE_IMAGE	"gpmu_ucode.bin"
> +
> +/*Choices for DMA to use*/
> +enum {
> +	GK20A_PMU_DMAIDX_UCODE		= 0,
> +	GK20A_PMU_DMAIDX_VIRT		= 1,
> +	GK20A_PMU_DMAIDX_PHYS_VID	= 2,
> +	GK20A_PMU_DMAIDX_PHYS_SYS_COH	= 3,
> +	GK20A_PMU_DMAIDX_PHYS_SYS_NCOH	= 4,
> +	GK20A_PMU_DMAIDX_RSVD		= 5,
> +	GK20A_PMU_DMAIDX_PELPG		= 6,
> +	GK20A_PMU_DMAIDX_END		= 7
> +};
> +
> +struct pmu_buf_desc {
> +	struct nvkm_gpuobj *obj;
> +	struct nvkm_vma vma;
> +	size_t size;
> +};
> +
> +struct nvkm_pmu_priv_vm {
> +	struct nvkm_gpuobj *mem;
> +	struct nvkm_gpuobj *pgd;
> +	struct nvkm_vm *vm;
> +};
> +
> +/*Choices for pmu_state*/
> +enum {
> +	PMU_STATE_OFF,             /*0  PMU is off */
> +	PMU_STATE_STARTING,        /*1  PMU is on, but not booted */
> +	PMU_STATE_INIT_RECEIVED    /*2  PMU init message received */
> +};
> +
> +struct pmu_mem_gk20a {
> +	u32 dma_base;
> +	u8  dma_offset;
> +	u8  dma_idx;
> +	u16 fb_size;
> +};
> +
> +struct pmu_cmdline_args_gk20a {
> +	u32 cpu_freq_hz;		/* Frequency of the clock driving PMU */
> +	u32 falc_trace_size;		/* falctrace buffer size (bytes) */
> +	u32 falc_trace_dma_base;	/* 256-byte block address */
> +	u32 falc_trace_dma_idx;		/* dmaIdx for DMA operations */
> +	u8 secure_mode;
> +	struct pmu_mem_gk20a gc6_ctx;		/* dmem offset of gc6 context */
> +};
> +
> +/*pmu ucode descriptor*/
> +struct pmu_ucode_desc {
> +	u32 descriptor_size;
> +	u32 image_size;
> +	u32 tools_version;
> +	u32 app_version;
> +	char date[GK20A_PMU_UCODE_NB_MAX_DATE_LENGTH];
> +	u32 bootloader_start_offset;
> +	u32 bootloader_size;
> +	u32 bootloader_imem_offset;
> +	u32 bootloader_entry_point;
> +	u32 app_start_offset;
> +	u32 app_size;
> +	u32 app_imem_offset;
> +	u32 app_imem_entry;
> +	u32 app_dmem_offset;
> +	u32 app_resident_code_offset;
> +	u32 app_resident_code_size;
> +	u32 app_resident_data_offset;
> +	u32 app_resident_data_size;
> +	u32 nb_overlays;
> +	struct {u32 start; u32 size; } load_ovl[GK20A_PMU_UCODE_NB_MAX_OVERLAY];
> +	u32 compressed;
> +};
> +
> +/*pmu msg header*/
> +struct pmu_hdr {
> +	u8 unit_id;
> +	u8 size;
> +	u8 ctrl_flags;
> +	u8 seq_id;
> +};
> +
> +#define PMU_MSG_HDR_SIZE	sizeof(struct pmu_hdr)
> +
> +enum {
> +	PMU_INIT_MSG_TYPE_PMU_INIT = 0,
> +};
> +
> +/*pmu init msg format*/
> +struct pmu_init_msg_pmu_gk20a {
> +	u8 msg_type;
> +	u8 pad;
> +	u16  os_debug_entry_point;
> +
> +	struct {
> +		u16 size;
> +		u16 offset;
> +		u8  index;
> +		u8  pad;
> +	} queue_info[PMU_QUEUE_COUNT];
> +
> +	u16 sw_managed_area_offset;
> +	u16 sw_managed_area_size;
> +};
> +
> +/*pmu init msg format*/
> +struct pmu_init_msg {
> +	union {
> +		u8 msg_type;
> +		struct pmu_init_msg_pmu_gk20a pmu_init_gk20a;
> +	};
> +};
> +
> +enum {
> +	PMU_RC_MSG_TYPE_UNHANDLED_CMD = 0,
> +};
> +
> +struct pmu_rc_msg_unhandled_cmd {
> +	u8 msg_type;
> +	u8 unit_id;
> +};
> +
> +struct pmu_rc_msg {
> +	u8 msg_type;
> +	struct pmu_rc_msg_unhandled_cmd unhandled_cmd;
> +};
> +
> +/*pmu generic msg format*/
> +struct pmu_msg {
> +	struct pmu_hdr hdr;
> +	union {
> +		struct pmu_init_msg init;
> +		struct pmu_rc_msg rc;
> +	} msg;
> +};
>
>   struct gk20a_pmu_dvfs_data {
>   	int p_load_target;
> @@ -39,8 +211,19 @@ struct gk20a_pmu_priv {
>   	struct nvkm_pmu base;
>   	struct nvkm_alarm alarm;
>   	struct gk20a_pmu_dvfs_data *data;
> +	struct pmu_ucode_desc *desc;
> +	struct pmu_buf_desc ucode;
> +	struct pmu_buf_desc trace_buf;
> +	struct mutex pmu_copy_lock;
> +	bool pmu_ready;
> +	int pmu_state;
> +	struct nvkm_pmu_priv_vm pmuvm;
> +	struct mutex isr_mutex;
> +	bool isr_enabled;
>   };
>
> +#define to_gk20a_priv(ptr) container_of(ptr, struct gk20a_pmu_priv, base)
> +
>   struct gk20a_pmu_dvfs_dev_status {
>   	unsigned long total;
>   	unsigned long busy;
> @@ -48,6 +231,59 @@ struct gk20a_pmu_dvfs_dev_status {
>   };
>
>   static int
> +gk20a_pmu_load_firmware(struct nvkm_pmu *pmu, const struct firmware **pfw)
> +{
> +	struct nvkm_device *dev;
> +	char fw[32];
> +
> +	dev = nv_device(pmu);
> +	snprintf(fw, sizeof(fw), "nvidia/tegra124/%s", GK20A_PMU_UCODE_IMAGE);
> +	return request_firmware(pfw, fw, nv_device_base(dev));
> +}
> +
> +static void
> +gk20a_pmu_release_firmware(struct nvkm_pmu *pmu, const struct firmware *pfw)
> +{
> +	nv_debug(pmu, "firmware released\n");
> +	release_firmware(pfw);
> +}
> +
> +static void
> +gk20a_pmu_dump_firmware_info(struct nvkm_pmu *pmu, const struct firmware *fw)
> +{
> +	struct pmu_ucode_desc *desc = (struct pmu_ucode_desc *)fw->data;
> +
> +	nv_debug(pmu, "GK20A PMU firmware information\n");
> +	nv_debug(pmu, "descriptor size = %u\n", desc->descriptor_size);
> +	nv_debug(pmu, "image size  = %u\n", desc->image_size);
> +	nv_debug(pmu, "app_version = 0x%08x\n", desc->app_version);
> +	nv_debug(pmu, "date = %s\n", desc->date);
> +	nv_debug(pmu, "bootloader_start_offset = 0x%08x\n",
> +				desc->bootloader_start_offset);
> +	nv_debug(pmu, "bootloader_size = 0x%08x\n", desc->bootloader_size);
> +	nv_debug(pmu, "bootloader_imem_offset = 0x%08x\n",
> +				desc->bootloader_imem_offset);
> +	nv_debug(pmu, "bootloader_entry_point = 0x%08x\n",
> +				desc->bootloader_entry_point);
> +	nv_debug(pmu, "app_start_offset = 0x%08x\n", desc->app_start_offset);
> +	nv_debug(pmu, "app_size = 0x%08x\n", desc->app_size);
> +	nv_debug(pmu, "app_imem_offset = 0x%08x\n", desc->app_imem_offset);
> +	nv_debug(pmu, "app_imem_entry = 0x%08x\n", desc->app_imem_entry);
> +	nv_debug(pmu, "app_dmem_offset = 0x%08x\n", desc->app_dmem_offset);
> +	nv_debug(pmu, "app_resident_code_offset = 0x%08x\n",
> +			desc->app_resident_code_offset);
> +	nv_debug(pmu, "app_resident_code_size = 0x%08x\n",
> +			desc->app_resident_code_size);
> +	nv_debug(pmu, "app_resident_data_offset = 0x%08x\n",
> +			desc->app_resident_data_offset);
> +	nv_debug(pmu, "app_resident_data_size = 0x%08x\n",
> +			desc->app_resident_data_size);
> +	nv_debug(pmu, "nb_overlays = %d\n", desc->nb_overlays);
> +
> +	nv_debug(pmu, "compressed = %u\n", desc->compressed);
> +}
> +
> +static int
>   gk20a_pmu_dvfs_target(struct gk20a_pmu_priv *priv, int *state)
>   {
>   	struct nvkm_clk *clk = nvkm_clk(priv);
> @@ -160,40 +396,529 @@ resched:
>   }
>
>   static int
> -gk20a_pmu_fini(struct nvkm_object *object, bool suspend)
> +gk20a_pmu_enable_hw(struct gk20a_pmu_priv *priv, struct nvkm_mc *pmc, bool enable)
>   {
> -	struct nvkm_pmu *pmu = (void *)object;
> -	struct gk20a_pmu_priv *priv = (void *)pmu;
> +	if (enable) {
> +		nv_mask(pmc, 0x000200, 0x00002000, 0x00002000);
> +		nv_rd32(pmc, 0x00000200);
> +		if (nv_wait(priv, 0x0010a10c, 0x00000006, 0x00000000))
> +			return 0;
> +		nv_mask(pmc, 0x00000200, 0x2000, 0x00000000);
> +		nv_error(priv, "Falcon mem scrubbing timeout\n");
> +		return -ETIMEDOUT;
> +	} else {
> +		nv_mask(pmc, 0x00000200, 0x2000, 0x00000000);
> +		return 0;
> +	}
> +}
> +static void
> +gk20a_pmu_enable_irq(struct gk20a_pmu_priv *priv, struct nvkm_mc *pmc, bool enable)
> +{
> +	if (enable) {
> +		nv_debug(priv, "enable pmu irq\n");
> +		nv_wr32(priv, 0x0010a010, 0xff);
> +		nv_mask(pmc, 0x00000640, 0x1000000, 0x1000000);
> +		nv_mask(pmc, 0x00000644, 0x1000000, 0x1000000);
> +	} else {
> +		nv_debug(priv, "disable pmu irq\n");
> +		nv_mask(pmc, 0x00000640, 0x1000000, 0x00000000);
> +		nv_mask(pmc, 0x00000644, 0x1000000, 0x00000000);
> +		nv_wr32(priv, 0x0010a014, 0xff);
> +	}
>
> -	nvkm_timer_alarm_cancel(priv, &priv->alarm);
> +}
>
> -	return nvkm_subdev_fini(&pmu->base, suspend);
> +static int
> +gk20a_pmu_idle(struct gk20a_pmu_priv *priv)
> +{
> +	if (!nv_wait(priv, 0x0010a04c, 0x0000ffff, 0x00000000)) {
> +		nv_error(priv, "timeout waiting pmu idle\n");
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +gk20a_pmu_enable(struct gk20a_pmu_priv *priv, struct nvkm_mc *pmc, bool enable)
> +{
> +	u32 pmc_enable;
> +	int err;
> +
> +	if (enable) {
> +		err = gk20a_pmu_enable_hw(priv, pmc, true);
> +		if (err)
> +			return err;
> +
> +		err = gk20a_pmu_idle(priv);
> +		if (err)
> +			return err;
> +
> +		gk20a_pmu_enable_irq(priv, pmc, true);
> +	} else {
> +		pmc_enable = nv_rd32(pmc, 0x200);
> +		if ((pmc_enable & 0x2000) != 0x0) {
> +			gk20a_pmu_enable_irq(priv, pmc, false);
> +			gk20a_pmu_enable_hw(priv, pmc, false);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void
> +gk20a_pmu_copy_to_dmem(struct gk20a_pmu_priv *priv, u32 dst, u8 *src, u32 size,
> +		       u8 port)
> +{
> +	u32 i, words, bytes;
> +	u32 data, addr_mask;
> +	u32 *src_u32 = (u32 *)src;
> +
> +	if (size == 0) {
> +		nv_error(priv, "size is zero\n");
> +		goto out;
> +	}
> +
> +	if (dst & 0x3) {
> +		nv_error(priv, "dst (0x%08x) not 4-byte aligned\n", dst);
> +		goto out;
> +	}
> +
> +	mutex_lock(&priv->pmu_copy_lock);
> +	words = size >> 2;
> +	bytes = size & 0x3;
> +	addr_mask = 0xfffc;
> +	dst &= addr_mask;
> +
> +	nv_wr32(priv, (0x10a1c0 + (port * 8)), (dst | (0x1 << 24)));
> +
> +	for (i = 0; i < words; i++) {
> +		nv_wr32(priv, (0x10a1c4 + (port * 8)), src_u32[i]);
> +		nv_debug(priv, "0x%08x\n", src_u32[i]);
> +	}
> +
> +	if (bytes > 0) {
> +		data = 0;
> +		for (i = 0; i < bytes; i++)
> +			((u8 *)&data)[i] = src[(words << 2) + i];
> +		nv_wr32(priv, (0x10a1c4 + (port * 8)), data);
> +		nv_debug(priv, "0x%08x\n", data);
> +	}
> +
> +	data = nv_rd32(priv, (0x10a1c0 + (port * 8))) & addr_mask;
> +	size = ALIGN(size, 4);
> +	if (data != dst + size) {
> +		nv_error(priv, "copy failed.... bytes written %d, expected %d",
> +							      data - dst, size);
> +	}
> +	mutex_unlock(&priv->pmu_copy_lock);
> +out:
> +	nv_debug(priv, "exit %s\n", __func__);
> +}
> +
> +static void
> +gk20a_copy_from_dmem(struct gk20a_pmu_priv *priv, u32 src, u8 *dst, u32 size,
> +		     u8 port)
> +{
> +	u32 i, words, bytes;
> +	u32 data, addr_mask;
> +	u32 *dst_u32 = (u32 *)dst;
> +
> +	if (size == 0) {
> +		nv_error(priv, "size is zero\n");
> +		goto out;
> +	}
> +
> +	if (src & 0x3) {
> +		nv_error(priv, "src (0x%08x) not 4-byte aligned\n", src);
> +		goto out;
> +	}
> +
> +	mutex_lock(&priv->pmu_copy_lock);
> +
> +	words = size >> 2;
> +	bytes = size & 0x3;
> +
> +	addr_mask = 0xfffc;
> +
> +	src &= addr_mask;
> +
> +	nv_wr32(priv, (0x10a1c0 + (port * 8)), (src | (0x1 << 25)));
> +
> +	for (i = 0; i < words; i++) {
> +		dst_u32[i] = nv_rd32(priv, (0x0010a1c4 + port * 8));
> +		nv_debug(priv, "0x%08x\n", dst_u32[i]);
> +	}
> +	if (bytes > 0) {
> +		data = nv_rd32(priv, (0x0010a1c4 + port * 8));
> +		nv_debug(priv, "0x%08x\n", data);
> +
> +		for (i = 0; i < bytes; i++)
> +			dst[(words << 2) + i] = ((u8 *)&data)[i];
> +	}
> +	mutex_unlock(&priv->pmu_copy_lock);
> +out:
> +	nv_debug(priv, "exit %s\n", __func__);
> +}
> +
> +static int
> +gk20a_pmu_process_init_msg(struct gk20a_pmu_priv *priv, struct pmu_msg *msg)
> +{
> +	struct pmu_init_msg_pmu_gk20a *init;
> +	u32 tail;
> +
> +	tail = nv_rd32(priv, 0x0010a4cc);
> +
> +	gk20a_copy_from_dmem(priv, tail, (u8 *)&msg->hdr, PMU_MSG_HDR_SIZE, 0);
> +
> +	if (msg->hdr.unit_id != PMU_UNIT_INIT) {
> +		nv_error(priv, "expecting init msg\n");
> +		return -EINVAL;
> +	}
> +
> +	gk20a_copy_from_dmem(priv, tail + PMU_MSG_HDR_SIZE,
> +		(u8 *)&msg->msg, msg->hdr.size - PMU_MSG_HDR_SIZE, 0);
> +
> +	if (msg->msg.init.msg_type != PMU_INIT_MSG_TYPE_PMU_INIT) {
> +		nv_error(priv, "expecting init msg\n");
> +		return -EINVAL;
> +	}
> +
> +	tail += ALIGN(msg->hdr.size, PMU_DMEM_ALIGNMENT);
> +	nv_wr32(priv, 0x0010a4cc, tail);
> +	init = &msg->msg.init.pmu_init_gk20a;
> +	priv->pmu_ready = true;
> +	priv->pmu_state = PMU_STATE_INIT_RECEIVED;
> +	nv_debug(priv, "init msg processed\n");
> +	return 0;
> +}
> +
> +static void
> +gk20a_pmu_process_message(struct work_struct *work)
> +{
> +	struct nvkm_pmu *pmu = container_of(work, struct nvkm_pmu, recv.work);
> +	struct gk20a_pmu_priv *priv = to_gk20a_priv(pmu);
> +	struct pmu_msg msg;
> +	struct nvkm_mc *pmc = nvkm_mc(pmu);
> +
> +	mutex_lock(&priv->isr_mutex);
> +	if (unlikely(!priv->pmu_ready)) {
> +		nv_debug(pmu, "processing init msg\n");
> +		gk20a_pmu_process_init_msg(priv, &msg);
> +		mutex_unlock(&priv->isr_mutex);
> +		gk20a_pmu_enable_irq(priv, pmc, true);
> +	} else {
> +		mutex_unlock(&priv->isr_mutex);
> +	}
> +}
> +
> +static int
> +gk20a_pmu_init_vm(struct gk20a_pmu_priv *priv, const struct firmware *fw)
> +{
> +	int ret = 0;
> +	u32 *ucode_image;
> +	struct pmu_ucode_desc *desc = (struct pmu_ucode_desc *)fw->data;
> +	int i;
> +	struct nvkm_pmu_priv_vm *pmuvm = &priv->pmuvm;
> +	struct nvkm_device *device = nv_device(&priv->base);
> +	struct nvkm_vm *vm;
> +	const u64 pmu_area_len = 300*1024;
> +
> +	/* mem for inst blk*/
> +	ret = nvkm_gpuobj_new(nv_object(priv), NULL, 0x1000, 0, 0, &pmuvm->mem);
> +	if (ret)
> +		return ret;
> +
> +	/* mem for pgd*/
> +	ret = nvkm_gpuobj_new(nv_object(priv), NULL, 0x8000, 0, 0, &pmuvm->pgd);
> +	if (ret)
> +		return ret;
> +
> +	/*allocate virtual memory range*/
> +	ret = nvkm_vm_new(device, 0, pmu_area_len, 0, &vm);
> +	if (ret)
> +		return ret;
> +
> +	atomic_inc(&vm->engref[NVDEV_SUBDEV_PMU]);
> +
> +	/* update VM with pgd */
> +	ret = nvkm_vm_ref(vm, &pmuvm->vm, pmuvm->pgd);
> +	if (ret)
> +		return ret;
> +
> +	/*update pgd in inst blk */
> +	nv_wo32(pmuvm->mem, 0x0200, lower_32_bits(pmuvm->pgd->addr));
> +	nv_wo32(pmuvm->mem, 0x0204, upper_32_bits(pmuvm->pgd->addr));
> +	nv_wo32(pmuvm->mem, 0x0208, lower_32_bits(pmu_area_len - 1));
> +	nv_wo32(pmuvm->mem, 0x020c, upper_32_bits(pmu_area_len - 1));
> +
> +	/* allocate memory for pmu fw to be copied to*/
> +	ret = nvkm_gpuobj_new(nv_object(priv), NULL, GK20A_PMU_UCODE_SIZE_MAX,
> +			      0x1000, 0, &priv->ucode.obj);
> +	if (ret)
> +		return ret;
> +
> +	ucode_image = (u32 *)((u8 *)desc + desc->descriptor_size);
> +	for (i = 0; i < (desc->app_start_offset + desc->app_size); i += 4)
> +		nv_wo32(priv->ucode.obj, i, ucode_image[i/4]);
> +
> +	/* map allocated memory into GMMU */
> +	ret = nvkm_gpuobj_map_vm(priv->ucode.obj, vm, NV_MEM_ACCESS_RW,
> +				 &priv->ucode.vma);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
> +static int
> +gk20a_init_pmu_setup_sw(struct gk20a_pmu_priv *priv)
> +{
> +	struct nvkm_pmu_priv_vm *pmuvm = &priv->pmuvm;
> +	int ret = 0;
> +
> +	INIT_WORK(&priv->base.recv.work, gk20a_pmu_process_message);
> +
> +	ret = nvkm_gpuobj_new(nv_object(priv), NULL, GK20A_PMU_TRACE_BUFSIZE,
> +					    0, 0, &priv->trace_buf.obj);
> +	if (ret)
> +		return ret;
> +
> +	ret = nvkm_gpuobj_map_vm(nv_gpuobj(priv->trace_buf.obj), pmuvm->vm,
> +					NV_MEM_ACCESS_RW, &priv->trace_buf.vma);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int
> +gk20a_pmu_bootstrap(struct gk20a_pmu_priv *priv)
> +{
> +	struct pmu_ucode_desc *desc = priv->desc;
> +	u32 addr_code, addr_data, addr_load;
> +	u32 i, blocks, addr_args;
> +	struct pmu_cmdline_args_gk20a cmdline_args;
> +	struct nvkm_pmu_priv_vm *pmuvm = &priv->pmuvm;
> +
> +	nv_mask(priv, 0x0010a048, 0x01, 0x01);
> +	/*bind the address*/
> +	nv_wr32(priv, 0x0010a480,
> +		pmuvm->mem->addr >> 12 |
> +		0x1 << 30 |
> +		0x20000000);
> +
> +	/* TBD: load all other surfaces */
> +	cmdline_args.falc_trace_size = GK20A_PMU_TRACE_BUFSIZE;
> +	cmdline_args.falc_trace_dma_base =
> +			    lower_32_bits(priv->trace_buf.vma.offset >> 8);
> +	cmdline_args.falc_trace_dma_idx = GK20A_PMU_DMAIDX_VIRT;
> +	cmdline_args.cpu_freq_hz = 204;
> +	cmdline_args.secure_mode = 0;
> +
> +	addr_args = (nv_rd32(priv, 0x0010a108) >> 9) & 0x1ff;
> +	addr_args = addr_args << GK20A_PMU_DMEM_BLKSIZE2;
> +	addr_args -= sizeof(struct pmu_cmdline_args_gk20a);
> +	nv_debug(priv, "initiating copy to dmem\n");
> +	gk20a_pmu_copy_to_dmem(priv, addr_args,
> +			(u8 *)&cmdline_args,
> +			sizeof(struct pmu_cmdline_args_gk20a), 0);
> +
> +	nv_wr32(priv, 0x0010a1c0, 0x1 << 24);
> +
> +	addr_code = lower_32_bits((priv->ucode.vma.offset +
> +			desc->app_start_offset +
> +			desc->app_resident_code_offset) >> 8);
> +
> +	addr_data = lower_32_bits((priv->ucode.vma.offset +
> +			desc->app_start_offset +
> +			desc->app_resident_data_offset) >> 8);
> +
> +	addr_load = lower_32_bits((priv->ucode.vma.offset +
> +			desc->bootloader_start_offset) >> 8);
> +
> +	nv_wr32(priv, 0x0010a1c4, GK20A_PMU_DMAIDX_UCODE);
> +	nv_debug(priv, "0x%08x\n", GK20A_PMU_DMAIDX_UCODE);
> +	nv_wr32(priv, 0x0010a1c4, (addr_code));
> +	nv_debug(priv, "0x%08x\n", (addr_code));
> +	nv_wr32(priv, 0x0010a1c4, desc->app_size);
> +	nv_debug(priv, "0x%08x\n", desc->app_size);
> +	nv_wr32(priv, 0x0010a1c4, desc->app_resident_code_size);
> +	nv_debug(priv, "0x%08x\n", desc->app_resident_code_size);
> +	nv_wr32(priv, 0x0010a1c4, desc->app_imem_entry);
> +	nv_debug(priv, "0x%08x\n", desc->app_imem_entry);
> +	nv_wr32(priv, 0x0010a1c4,  (addr_data));
> +	nv_debug(priv, "0x%08x\n", (addr_data));
> +	nv_wr32(priv, 0x0010a1c4, desc->app_resident_data_size);
> +	nv_debug(priv, "0x%08x\n", desc->app_resident_data_size);
> +	nv_wr32(priv, 0x0010a1c4, (addr_code));
> +	nv_debug(priv, "0x%08x\n", (addr_code));
> +	nv_wr32(priv, 0x0010a1c4, 0x1);
> +	nv_debug(priv, "0x%08x\n", 1);
> +	nv_wr32(priv, 0x0010a1c4, addr_args);
> +	nv_debug(priv, "0x%08x\n", addr_args);
> +
> +	nv_wr32(priv, 0x0010a110,
> +		(addr_load) - (desc->bootloader_imem_offset >> 8));
> +
> +	blocks = ((desc->bootloader_size + 0xFF) & ~0xFF) >> 8;
> +
> +	for (i = 0; i < blocks; i++) {
> +		nv_wr32(priv, 0x0010a114,
> +			desc->bootloader_imem_offset + (i << 8));
> +		nv_wr32(priv, 0x0010a11c,
> +			desc->bootloader_imem_offset + (i << 8));
> +		nv_wr32(priv, 0x0010a118,
> +			0x01 << 4  |
> +			0x06 << 8  |
> +			((GK20A_PMU_DMAIDX_UCODE & 0x07) << 12));
> +	}
> +
> +	nv_wr32(priv, 0x0010a104, (desc->bootloader_entry_point));
> +	nv_wr32(priv, 0x0010a100, 0x1 << 1);
> +	nv_wr32(priv, 0x0010a080, desc->app_version);
> +
> +	return 0;
> +}
> +
> +static int
> +gk20a_init_pmu_setup_hw1(struct gk20a_pmu_priv *priv, struct nvkm_mc *pmc)
> +{
> +	int err;
> +
> +	mutex_lock(&priv->isr_mutex);
> +	err = gk20a_pmu_enable(priv, pmc, true);
> +	priv->isr_enabled = (err == 0);
> +	mutex_unlock(&priv->isr_mutex);
> +	if (err)
> +		return err;
> +
> +	/* setup apertures - virtual */
> +	nv_wr32(priv, 0x10a600 + 0 * 4, 0x0);
> +	nv_wr32(priv, 0x10a600 + 1 * 4, 0x0);
> +	/* setup apertures - physical */
> +	nv_wr32(priv, 0x10a600 + 2 * 4, 0x4 | 0x0);
> +	nv_wr32(priv, 0x10a600 + 3 * 4, 0x4 | 0x1);
> +	nv_wr32(priv, 0x10a600 + 4 * 4, 0x4 | 0x2);
> +
> +	/* TBD: load pmu ucode */
> +	err = gk20a_pmu_bootstrap(priv);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +
> +static void
> +gk20a_pmu_intr(struct nvkm_subdev *subdev)
> +{
> +	struct gk20a_pmu_priv *priv = to_gk20a_priv(nvkm_pmu(subdev));
> +	struct nvkm_mc *pmc = nvkm_mc(priv);
> +	u32 intr, mask;
> +
> +	if (!priv->isr_enabled)
> +		return;
> +
> +	mask = nv_rd32(priv, 0x0010a018) & nv_rd32(priv, 0x0010a01c);
> +
> +	intr = nv_rd32(priv, 0x0010a008) & mask;
> +
> +	nv_debug(priv, "received falcon interrupt: 0x%08x\n", intr);
> +	gk20a_pmu_enable_irq(priv, pmc, false);
> +
> +	if (!intr || priv->pmu_state == PMU_STATE_OFF) {
> +		nv_wr32(priv, 0x0010a004, intr);
> +		nv_error(priv, "pmu state off\n");
> +		gk20a_pmu_enable_irq(priv, pmc, true);
> +	}
> +
> +	if (intr & 0x10)
> +		nv_error(priv, "pmu halt intr not implemented\n");
> +
> +	if (intr & 0x20) {
> +		nv_error(priv, "exterr interrupt  not impl..Clear interrupt\n");
> +		nv_mask(priv, 0x0010a16c, (0x1 << 31), 0x00000000);
> +	}
> +
> +	if (intr & 0x40) {
> +		nv_debug(priv, "scheduling work\n");
> +		schedule_work(&priv->base.recv.work);
> +	}
> +
> +	nv_wr32(priv, 0x0010a004, intr);
> +	nv_debug(priv, "irq handled\n");
> +}
> +
> +static void
> +gk20a_pmu_pgob(struct nvkm_pmu *pmu, bool enable)
> +{
>   }
>
>   static int
>   gk20a_pmu_init(struct nvkm_object *object)
>   {
> -	struct nvkm_pmu *pmu = (void *)object;
> -	struct gk20a_pmu_priv *priv = (void *)pmu;
> +	struct gk20a_pmu_priv *priv = (void *)object;
> +	struct nvkm_mc *pmc = nvkm_mc(object);
>   	int ret;
>
> -	ret = nvkm_subdev_init(&pmu->base);
> +	ret = nvkm_subdev_init(&priv->base.base);
>   	if (ret)
>   		return ret;
>
> -	pmu->pgob = nvkm_pmu_pgob;
> +	priv->pmu_state = PMU_STATE_STARTING;
> +	ret = gk20a_init_pmu_setup_hw1(priv, pmc);
> +	if (ret)
> +		return ret;
> +
> +	nv_wr32(priv, 0x10a504 + (BUSY_SLOT * 0x10), 0x00200001);
> +	nv_wr32(priv, 0x10a50c + (BUSY_SLOT * 0x10), 0x00000002);
> +	nv_wr32(priv, 0x10a50c + (CLK_SLOT * 0x10), 0x00000003);
>
> -	/* init pwr perf counter */
> -	nv_wr32(pmu, 0x10a504 + (BUSY_SLOT * 0x10), 0x00200001);
> -	nv_wr32(pmu, 0x10a50c + (BUSY_SLOT * 0x10), 0x00000002);
> -	nv_wr32(pmu, 0x10a50c + (CLK_SLOT * 0x10), 0x00000003);
> +	nvkm_timer_alarm(priv, 2000000000, &priv->alarm);
>
> -	nvkm_timer_alarm(pmu, 2000000000, &priv->alarm);
>   	return ret;
>   }
>
> +static int
> +gk20a_pmu_fini(struct nvkm_object *object, bool suspend)
> +{
> +	struct gk20a_pmu_priv *priv = (void *)object;
> +	struct nvkm_mc *pmc = nvkm_mc(object);
> +
> +	nvkm_timer_alarm_cancel(priv, &priv->alarm);
> +
> +	cancel_work_sync(&priv->base.recv.work);
> +
> +	mutex_lock(&priv->isr_mutex);
> +	gk20a_pmu_enable(priv, pmc, false);
> +	priv->isr_enabled = false;
> +	mutex_unlock(&priv->isr_mutex);
> +
> +	priv->pmu_state = PMU_STATE_OFF;
> +	priv->pmu_ready = false;
> +	nv_wr32(priv, 0x10a014, 0x00000060);
> +
> +	return nvkm_subdev_fini(&priv->base.base, suspend);
> +}
> +
> +static void
> +gk20a_pmu_dtor(struct nvkm_object *object)
> +{
> +	struct gk20a_pmu_priv *priv = (void *)object;
> +
> +	nvkm_gpuobj_unmap(&priv->trace_buf.vma);
> +	nvkm_gpuobj_ref(NULL, &priv->trace_buf.obj);
> +
> +	nvkm_gpuobj_unmap(&priv->ucode.vma);
> +	nvkm_gpuobj_ref(NULL, &priv->ucode.obj);
> +	nvkm_vm_ref(NULL, &priv->pmuvm.vm, priv->pmuvm.pgd);
> +	nvkm_gpuobj_ref(NULL, &priv->pmuvm.pgd);
> +	nvkm_gpuobj_ref(NULL, &priv->pmuvm.mem);
> +}
> +
>   static struct gk20a_pmu_dvfs_data
> -gk20a_dvfs_data= {
> +gk20a_dvfs_data = {
>   	.p_load_target = 70,
>   	.p_load_max = 90,
>   	.p_smooth = 1,
> @@ -205,6 +930,9 @@ gk20a_pmu_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
>   	       struct nvkm_object **pobject)
>   {
>   	struct gk20a_pmu_priv *priv;
> +	struct nvkm_pmu *pmu;
> +	struct nvkm_mc *pmc;
> +	const struct firmware *pmufw = NULL;
>   	int ret;
>
>   	ret = nvkm_pmu_create(parent, engine, oclass, &priv);
> @@ -212,10 +940,47 @@ gk20a_pmu_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
>   	if (ret)
>   		return ret;
>
> +	mutex_init(&priv->isr_mutex);
> +	mutex_init(&priv->pmu_copy_lock);
>   	priv->data = &gk20a_dvfs_data;
> +	pmu = &priv->base;
> +	pmc = nvkm_mc(pmu);
> +	nv_subdev(pmu)->intr = gk20a_pmu_intr;
>
> +	ret = gk20a_pmu_load_firmware(pmu, &pmufw);
> +	if (ret < 0) {
> +		nv_error(priv, "failed to load pmu fimware\n");
> +		return ret;
> +	}
> +
> +	ret = gk20a_pmu_init_vm(priv, pmufw);
> +	if (ret < 0) {
> +		nv_error(priv, "failed to map pmu fw to va space\n");
> +		goto err;
> +	}
> +
> +	priv->desc = (struct pmu_ucode_desc *)pmufw->data;
> +	gk20a_pmu_dump_firmware_info(pmu, pmufw);
> +
> +	if (priv->desc->app_version != APP_VERSION_GK20A) {
> +		nv_error(priv, "PMU version unsupported: %d\n",
> +						       priv->desc->app_version);
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	ret = gk20a_init_pmu_setup_sw(priv);
> +	if (ret)
> +		goto err;
> +
> +	pmu->pgob = nvkm_pmu_pgob;
>   	nvkm_alarm_init(&priv->alarm, gk20a_pmu_dvfs_work);
> +
>   	return 0;
> +
> +err:
> +	gk20a_pmu_release_firmware(pmu, pmufw);
> +	return ret;
>   }
>
>   struct nvkm_oclass *
> @@ -223,8 +988,10 @@ gk20a_pmu_oclass = &(struct nvkm_pmu_impl) {
>   	.base.handle = NV_SUBDEV(PMU, 0xea),
>   	.base.ofuncs = &(struct nvkm_ofuncs) {
>   		.ctor = gk20a_pmu_ctor,
> -		.dtor = _nvkm_pmu_dtor,
> +		.dtor = gk20a_pmu_dtor,
>   		.init = gk20a_pmu_init,
>   		.fini = gk20a_pmu_fini,
>   	},
> +	.pgob = gk20a_pmu_pgob,
>   }.base;
> +
>
