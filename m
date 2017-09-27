From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] staging: Introduce NVIDIA Tegra20 video decoder
 driver
Date: Thu, 28 Sep 2017 02:28:04 +0300
Message-ID: <2b77bfa7-1272-3d11-9190-326fa0f85f22@gmail.com>
References: <cover.1506377430.git.digetx@gmail.com>
 <5c8b83775b982e6ee851c127444a8e839f422ad0.1506377430.git.digetx@gmail.com>
 <20170927094557.yr2fl5arodjnh637@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170927094557.yr2fl5arodjnh637@mwanda>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 27.09.2017 12:45, Dan Carpenter wrote:
> I feel like this code is good enough to go into the regular kernel
> instead of staging, but I don't really know what "- properly handle
> decoding faults" means in this context.

As Greg pointed out, this patch should be cc'ed to media maintainers for a
review. I'll cc them on V2, will see what they would suggest. Yeah, probably the
decoding faults isn't a very candidate for a TODO for staging.

  Does the driver Oops all the
> time or what?
> 

Driver works fine.

> Anyway, minor comments inline.
> 

Thank you very much for the awesome review. I agree with the most of the comments.

> On Tue, Sep 26, 2017 at 01:15:42AM +0300, Dmitry Osipenko wrote:
>> diff --git a/drivers/staging/tegra-vde/Kconfig b/drivers/staging/tegra-vde/Kconfig
>> new file mode 100644
>> index 000000000000..b947c012a373
>> --- /dev/null
>> +++ b/drivers/staging/tegra-vde/Kconfig
>> @@ -0,0 +1,6 @@
>> +config TEGRA_VDE
>> +	tristate "NVIDIA Tegra20 video decoder driver"
>> +	depends on ARCH_TEGRA_2x_SOC
> 
> Could we get a || COMPILE_TEST here as well?
> 
>> +	help
>> +	    Say Y here to enable support for a NVIDIA Tegra20 video decoder
>> +	    driver.
>> diff --git a/drivers/staging/tegra-vde/Makefile b/drivers/staging/tegra-vde/Makefile
>> new file mode 100644
>> index 000000000000..e7c0df1174bf
>> --- /dev/null
>> +++ b/drivers/staging/tegra-vde/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_TEGRA_VDE)	+= vde.o
>> diff --git a/drivers/staging/tegra-vde/TODO b/drivers/staging/tegra-vde/TODO
>> new file mode 100644
>> index 000000000000..533ddfc5190e
>> --- /dev/null
>> +++ b/drivers/staging/tegra-vde/TODO
>> @@ -0,0 +1,8 @@
>> +All TODO's require reverse-engineering to be done first, it is very
>> +unlikely that NVIDIA would ever release HW specs to public.
>> +
>> +TODO:
>> +	- properly handle decoding faults
>> +	- support more formats
> 
> Adding more formats is not a reason to put this into staging instead of
> the normal drivers/ dir.
> 

Well, it feels that the driver isn't very acceptable for the core drivers/. But
maybe it's a wrong feeling. Again, will see what media/ maintainers would suggest.

>> +static int tegra_vde_setup_context(struct tegra_vde *vde,
>> +				   struct tegra_vde_h264_decoder_ctx *ctx,
>> +				   struct video_frame *dpb_frames,
>> +				   phys_addr_t bitstream_data_paddr,
>> +				   int bitstream_data_size,
>> +				   int macroblocks_nb)
>> +{
>> +	struct device *dev = vde->miscdev.parent;
>> +	u32 value;
>> +
>> +	tegra_vde_set_bits(vde->regs,    0xA, SXE(0xF0));
>> +	tegra_vde_set_bits(vde->regs,    0xB, BSEV(CMDQUE_CONTROL));
>> +	tegra_vde_set_bits(vde->regs, 0x8002, MBE(0x50));
>> +	tegra_vde_set_bits(vde->regs,    0xA, MBE(0xA0));
>> +	tegra_vde_set_bits(vde->regs,    0xA, PPE(0x14));
>> +	tegra_vde_set_bits(vde->regs,    0xA, PPE(0x28));
>> +	tegra_vde_set_bits(vde->regs,  0xA00, MCE(0x08));
>> +	tegra_vde_set_bits(vde->regs,    0xA, TFE(0x00));
>> +	tegra_vde_set_bits(vde->regs,    0x5, VDMA(0x04));
>> +
>> +	VDE_WR(0x00000000, vde->regs + VDMA(0x1C));
>> +	VDE_WR(0x00000000, vde->regs + VDMA(0x00));
>> +	VDE_WR(0x00000007, vde->regs + VDMA(0x04));
>> +	VDE_WR(0x00000007, vde->regs + FRAMEID(0x200));
>> +	VDE_WR(0x00000005, vde->regs + TFE(0x04));
>> +	VDE_WR(0x00000000, vde->regs + MBE(0x84));
>> +	VDE_WR(0x00000010, vde->regs + SXE(0x08));
>> +	VDE_WR(0x00000150, vde->regs + SXE(0x54));
>> +	VDE_WR(0x0000054C, vde->regs + SXE(0x58));
>> +	VDE_WR(0x00000E34, vde->regs + SXE(0x5C));
>> +	VDE_WR(0x063C063C, vde->regs + MCE(0x10));
>> +	VDE_WR(0x0003FC00, vde->regs + BSEV(INTR_STATUS));
>> +	VDE_WR(0x0000150D, vde->regs + BSEV(BSE_CONFIG));
>> +	VDE_WR(0x00000100, vde->regs + BSEV(BSE_INT_ENB));
>> +	VDE_WR(0x00000000, vde->regs + BSEV(0x98));
>> +	VDE_WR(0x00000060, vde->regs + BSEV(0x9C));
>> +
>> +	memset_io(vde->iram + 512, 0, macroblocks_nb / 2);
>> +
>> +	tegra_setup_frameidx(vde->regs, dpb_frames, ctx->dpb_frames_nb,
>> +			     ctx->pic_width_in_mbs, ctx->pic_height_in_mbs);
>> +
>> +	tegra_vde_setup_iram_tables(vde->iram, dpb_frames,
>> +				    ctx->dpb_frames_nb - 1,
>> +				    ctx->dpb_ref_frames_with_earlier_poc_nb);
>> +
>> +	VDE_WR(0x00000000, vde->regs + BSEV(0x8C));
>> +	VDE_WR(bitstream_data_paddr + bitstream_data_size,
>> +	       vde->regs + BSEV(0x54));
>> +
>> +	value = ctx->pic_width_in_mbs << 11 | ctx->pic_height_in_mbs << 3;
>> +
>> +	VDE_WR(value, vde->regs + BSEV(0x88));
>> +
>> +	if (tegra_vde_wait_bsev(vde, false))
>> +		return -EIO;
>> +
>> +	if (tegra_vde_push_bsev_icmdqueue(vde, 0x800003FC, false))
> 
> Preserve the error code from tegra_vde_push_bsev_icmdqueue().  It's
> still -EIO so this doesn't affect runtime.
> 

Okay, I'll propagate error code in all other places as well.

>> +		return -EIO;
>> +
>> +	value = 0x01500000;
>> +	value |= ((vde->iram_lists_paddr + 512) >> 2) & 0xFFFF;
>> +
>> +	if (tegra_vde_push_bsev_icmdqueue(vde, value, true))
> 
> Same for all.
> 
>> +		return -EIO;
>> +
>> +	if (tegra_vde_push_bsev_icmdqueue(vde, 0x840F054C, false))
>> +		return -EIO;
>> +
>> +	if (tegra_vde_push_bsev_icmdqueue(vde, 0x80000080, false))
>> +		return -EIO;
>> +
>> +	value = 0x0E340000 | ((vde->iram_lists_paddr >> 2) & 0xFFFF);
>> +
>> +	if (tegra_vde_push_bsev_icmdqueue(vde, value, true))
>> +		return -EIO;
>> +
>> +	value = (1 << 23) | 5;
> 
> I don't like these magic numbers.
> 

I don't know what these bits do, at best I can replace them with a hex for
consistency.

>> +	value |= ctx->pic_width_in_mbs << 11;
>> +	value |= ctx->pic_height_in_mbs << 3;
>> +
>> +	VDE_WR(value, vde->regs + SXE(0x10));
>> +
>> +	value = !ctx->is_baseline_profile << 17;
>> +	value |= ctx->level_idc << 13;
>> +	value |= ctx->log2_max_pic_order_cnt_lsb << 7;
>> +	value |= ctx->pic_order_cnt_type << 5;
>> +	value |= ctx->log2_max_frame_num;
>> +
>> +	VDE_WR(value, vde->regs + SXE(0x40));
>> +
>> +	value = ctx->pic_init_qp << 25;
>> +	value |= !!(ctx->deblocking_filter_control_present_flag) << 2;
>> +	value |= !!ctx->pic_order_present_flag;
>> +
>> +	VDE_WR(value, vde->regs + SXE(0x44));
>> +
>> +	value = ctx->chroma_qp_index_offset;
>> +	value |= ctx->num_ref_idx_l0_active_minus1 << 5;
>> +	value |= ctx->num_ref_idx_l1_active_minus1 << 10;
>> +	value |= !!ctx->constrained_intra_pred_flag << 15;
>> +
>> +	VDE_WR(value, vde->regs + SXE(0x48));
>> +
>> +	value = 0x0C000000;
>> +	value |= !!(dpb_frames[0].flags & FLAG_IS_B_FRAME) << 24;
>> +
>> +	VDE_WR(value, vde->regs + SXE(0x4C));
>> +
>> +	value = 0x03800000;
>> +	value |= min(bitstream_data_size, SZ_1M);
>> +
>> +	VDE_WR(value, vde->regs + SXE(0x68));
>> +
>> +	VDE_WR(bitstream_data_paddr, vde->regs + SXE(0x6C));
>> +
>> +	value = (1 << 28) | 5;
>> +	value |= ctx->pic_width_in_mbs << 11;
>> +	value |= ctx->pic_height_in_mbs << 3;
>> +
>> +	VDE_WR(value, vde->regs + MBE(0x80));
>> +
>> +	value = 0x26800000;
>> +	value |= ctx->level_idc << 4;
>> +	value |= !ctx->is_baseline_profile << 1;
>> +	value |= !!ctx->direct_8x8_inference_flag;
>> +
>> +	VDE_WR(value, vde->regs + MBE(0x80));
>> +
>> +	VDE_WR(0xF4000001, vde->regs + MBE(0x80));
>> +	VDE_WR(0x20000000, vde->regs + MBE(0x80));
>> +	VDE_WR(0xF4000101, vde->regs + MBE(0x80));
>> +
>> +	value = 0x20000000;
>> +	value |= ctx->chroma_qp_index_offset << 8;
>> +
>> +	VDE_WR(value, vde->regs + MBE(0x80));
>> +
>> +	if (tegra_vde_setup_mbe_frame_idx(vde->regs,
>> +					  ctx->pic_order_cnt_type == 0,
>> +					  ctx->dpb_frames_nb - 1)) {
> 
> 
> Preserve the error code.
> 
>> +		dev_err(dev, "MBE frames setup failed\n");
>> +		return -EIO;
>> +	}
>> +
>> +	tegra_vde_mbe_set_0xa_reg(vde->regs, 0, 0x000009FC);
>> +	tegra_vde_mbe_set_0xa_reg(vde->regs, 2, 0xF1DEAD00);
>> +	tegra_vde_mbe_set_0xa_reg(vde->regs, 4, 0xF2DEAD00);
>> +	tegra_vde_mbe_set_0xa_reg(vde->regs, 6, 0xF3DEAD00);
>> +	tegra_vde_mbe_set_0xa_reg(vde->regs, 8, dpb_frames[0].aux_paddr);
>> +
>> +	value = 0xFC000000;
>> +	value |= !!(dpb_frames[0].flags & FLAG_IS_B_FRAME) << 2;
>> +
>> +	if (!ctx->is_baseline_profile)
>> +		value |= !!(dpb_frames[0].flags & FLAG_IS_REFERENCE) << 1;
>> +
>> +	VDE_WR(value, vde->regs + MBE(0x80));
>> +
>> +	if (tegra_vde_wait_mbe(vde->regs)) {
>> +		dev_err(dev, "MBE programming failed\n");
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void tegra_vde_decode_frame(struct tegra_vde *vde, int macroblocks_nb)
>> +{
>> +	VDE_WR(0x00000001, vde->regs + BSEV(0x8C));
>> +	VDE_WR(0x20000000 | (macroblocks_nb - 1), vde->regs + SXE(0x00));
>> +}
>> +
>> +static void tegra_vde_detach_and_put_dmabuf(struct dma_buf_attachment *a)
>> +{
>> +	struct dma_buf *dmabuf = a->dmabuf;
>> +
>> +	if (IS_ERR_OR_NULL(a))
> 
> You just dereferenced this on the line before so it's too late.
> 

Indeed, good catch!

> Obviously we don't want to dereference either an error pointer or a NULL
> but I'm wondering the significance of having it be both.  Normally that
> would mean that NULL is a special case of success.  In other words,
> error pointer means the hardware is broken but NULL means it's missing
> and not required.  I guess I'm suggesting to just delete the check and
> make sure we never set this to either NULL or ERR_PTR.
> 

NULL here exactly means that attachment is missing and not required. But anyway
I'll get rid of IS_ERR_OR_NULL, thanks for the suggestion.

>> +		return;
>> +
>> +	dma_buf_detach(dmabuf, a);
>> +	dma_buf_put(dmabuf);
>> +}
>> +
>> +static int tegra_vde_attach_dmabuf(struct device *dev, int fd,
>> +				   unsigned long offset, int min_size,
>> +				   struct dma_buf_attachment **a,
>> +				   phys_addr_t *paddr, u32 *size,
>> +				   enum dma_data_direction dma_dir)
>> +{
>> +	struct dma_buf_attachment *attachment;
>> +	struct dma_buf *dmabuf;
>> +	struct sg_table *sgt;
>> +
>> +	*a = NULL;
>> +	*paddr = 0xFBDEAD00;
>> +
>> +	dmabuf = dma_buf_get(fd);
>> +	if (IS_ERR(dmabuf)) {
>> +		dev_err(dev, "Invalid dmabuf FD\n");
>> +		return PTR_ERR(dmabuf);
>> +	}
>> +
>> +	if ((u64)offset + min_size > dmabuf->size) {
>> +		dev_err(dev, "Too small dmabuf size %d @0x%lX, "
>> +			     "should be at least %d\n",
>> +			dmabuf->size, offset, min_size);
>> +		return -EINVAL;
>> +	}
>> +
>> +	attachment = dma_buf_attach(dmabuf, dev);
>> +	if (IS_ERR(attachment)) {
>> +		dev_err(dev, "Failed to attach dmabuf\n");
>> +		dma_buf_put(dmabuf);
>> +		return PTR_ERR(attachment);
>> +	}
>> +
>> +	sgt = dma_buf_map_attachment(attachment, dma_dir);
>> +	if (IS_ERR(sgt)) {
>> +		dev_err(dev, "Failed to get dmabuf sg_table\n");
>> +		dma_buf_detach(dmabuf, attachment);
>> +		dma_buf_put(dmabuf);
>> +		return PTR_ERR(sgt);
>> +	}
>> +
>> +	if (sgt->nents != 1) {
>> +		dev_err(dev, "Sparsed DMA area is unsupported\n");
> 
> s/Sparsed/Sparse/
> 

ACK.

>> +		dma_buf_unmap_attachment(attachment, sgt, dma_dir);
>> +		dma_buf_detach(dmabuf, attachment);
>> +		dma_buf_put(dmabuf);
>> +		return -EINVAL;
> 
> This function would be cleaner using gotos to unwind.  Pick the goto
> name to reflect what the goto does.  For example, here it would be:
> 

Okay.

> 	if (sgt->nents != 1) {
> 		dev_err(dev, "Sparse DMA area is unsupported\n");
> 		ret = -EINVAL;
> 		goto err_umap;
> 	}
> 
> 
> 
>> +	}
>> +
>> +	*paddr = sg_dma_address(sgt->sgl) + offset;
>> +
>> +	dma_buf_unmap_attachment(attachment, sgt, dma_dir);
>> +
>> +	*a = attachment;
>> +
>> +	if (size)
>> +		*size = dmabuf->size - offset;
>> +
>> +	return 0;
> 
> 	return 0;
> 
> err_unmap:
> 	dma_buf_unmap_attachment(attachment, sgt, dma_dir);
> err_detach:
> 	dma_buf_detach(dmabuf, attachment);
> err_put:
> 	dma_buf_put(dmabuf);
> 	return ret;
> 
>> +}
>> +
>> +static int tegra_vde_attach_frame_dmabufs(struct device *dev,
>> +					  struct video_frame *frame,
>> +					  struct tegra_vde_h264_frame *source,
>> +					  enum dma_data_direction dma_dir,
>> +					  int is_baseline_profile, int csize)
>> +{
>> +	int ret;
>> +
>> +	ret = tegra_vde_attach_dmabuf(dev, source->y_fd,
>> +				      source->y_offset, csize * 4,
>> +				      &frame->y_dmabuf_attachment,
>> +				      &frame->y_paddr, NULL, dma_dir);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = tegra_vde_attach_dmabuf(dev, source->cb_fd,
>> +				      source->cb_offset, csize,
>> +				      &frame->cb_dmabuf_attachment,
>> +				      &frame->cb_paddr, NULL, dma_dir);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = tegra_vde_attach_dmabuf(dev, source->cr_fd,
>> +				      source->cr_offset, csize,
>> +				      &frame->cr_dmabuf_attachment,
>> +				      &frame->cr_paddr, NULL, dma_dir);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (is_baseline_profile)
>> +		frame->aux_paddr = 0xF4DEAD00;
> 
> The handling of is_baseline_profile is strange to me.  It feels like we
> should always check it before we use ->aux_paddr but we don't ever do
> that.
> 

In a case of baseline profile, aux buffer isn't needed, HW should't use it. Aux
phys address is set to a predefined and invalid address, so that in a case of
VDE trying to use it, its invalid memory accesses would be reported in KMSG by
memory controller driver and the reported invalid addresses would be known to be
associated with the aux buffer. I'm not sure what you are meaning.

>> +	else
>> +		ret = tegra_vde_attach_dmabuf(dev, source->aux_fd,
>> +					      source->aux_offset, csize,
>> +					      &frame->aux_dmabuf_attachment,
>> +					      &frame->aux_paddr, NULL, dma_dir);
> 
> 
> This function should have some error handling to undo the earlier
> attach calls if the latter ones fail.  See below:
> 
> 

Okay.

>> +
>> +	return ret;
> 
> 	return 0;
> 
> err_detach_cr:
> 	tegra_vde_detach_and_put_dmabuf(frame->cr_dmabuf_attachment);
> err_detach_cb:
> 	tegra_vde_detach_and_put_dmabuf(frame->cb_dmabuf_attachment);
> err_detach_y:
> 	tegra_vde_detach_and_put_dmabuf(frame->y_dmabuf_attachment);
> 
> 	return ret;
> 
> 
>> +}
>> +
>> +static void tegra_vde_deattach_frame_dmabufs(struct video_frame *frame)
>> +{
>> +	tegra_vde_detach_and_put_dmabuf(frame->y_dmabuf_attachment);
>> +	tegra_vde_detach_and_put_dmabuf(frame->cb_dmabuf_attachment);
>> +	tegra_vde_detach_and_put_dmabuf(frame->cr_dmabuf_attachment);
>> +	tegra_vde_detach_and_put_dmabuf(frame->aux_dmabuf_attachment);
> 
> 
> It would be happier to write this in the reverse order so it matches
> the error handling that I wrote for you.
> 
> 

Okay.

>> +}
>> +
>> +static int tegra_vde_copy_and_validate_frame(struct device *dev,
>> +					     struct tegra_vde_h264_frame *frame,
>> +					     unsigned long vaddr)
>> +{
>> +	if (copy_from_user(frame, (void __user *)vaddr, sizeof(*frame))) {
>> +		dev_err(dev, "Copying of H.264 frame from user failed\n");
>> +		return -EFAULT;
> 
> Error message are a funny thing and different people feel different
> ways.  These can be triggered by the user so they let you spam dmesg
> but I can see how many of them would be useful.  These ones for
> copy_from_user() are not useful since we assume the programmer should
> know that stuff.  The error code seems enough.
> 

Agree.

>> +	}
>> +
>> +	if (frame->frame_num > 0x7FFFFF) {
>> +		dev_err(dev, "Bad frame_num %u\n", frame->frame_num);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (frame->y_offset & 0xFF) {
>> +		dev_err(dev, "Bad y_offset 0x%X\n", frame->y_offset);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (frame->cb_offset & 0xFF) {
>> +		dev_err(dev, "Bad cb_offset 0x%X\n", frame->cb_offset);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (frame->cr_offset & 0xFF) {
>> +		dev_err(dev, "Bad cr_offset 0x%X\n", frame->cr_offset);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_vde_validate_h264_ctx(struct device *dev,
>> +				       struct tegra_vde_h264_decoder_ctx *ctx)
>> +{
>> +	if (ctx->dpb_frames_nb == 0 || ctx->dpb_frames_nb > 17) {
>> +		dev_err(dev, "Bad DPB size %u\n", ctx->dpb_frames_nb);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ctx->level_idc > 15) {
>> +		dev_err(dev, "Bad level value %u\n", ctx->level_idc);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ctx->pic_init_qp > 52) {
>> +		dev_err(dev, "Bad pic_init_qp value %u\n", ctx->pic_init_qp);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ctx->log2_max_pic_order_cnt_lsb > 16) {
>> +		dev_err(dev, "Bad log2_max_pic_order_cnt_lsb value %u\n",
>> +			ctx->log2_max_pic_order_cnt_lsb);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ctx->log2_max_frame_num > 16) {
>> +		dev_err(dev, "Bad log2_max_frame_num value %u\n",
>> +			ctx->log2_max_frame_num);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ctx->chroma_qp_index_offset > 31) {
>> +		dev_err(dev, "Bad chroma_qp_index_offset value %u\n",
>> +			ctx->chroma_qp_index_offset);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ctx->pic_order_cnt_type > 2) {
>> +		dev_err(dev, "Bad pic_order_cnt_type value %u\n",
>> +			ctx->pic_order_cnt_type);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ctx->num_ref_idx_l0_active_minus1 > 15) {
>> +		dev_err(dev, "Bad num_ref_idx_l0_active_minus1 value %u\n",
>> +			ctx->num_ref_idx_l0_active_minus1);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ctx->num_ref_idx_l1_active_minus1 > 15) {
>> +		dev_err(dev, "Bad num_ref_idx_l1_active_minus1 value %u\n",
>> +			ctx->num_ref_idx_l1_active_minus1);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!ctx->pic_width_in_mbs || ctx->pic_width_in_mbs > 127) {
>> +		dev_err(dev, "Bad pic_width_in_mbs value %u, min 1 max 127\n",
>> +			ctx->pic_width_in_mbs);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!ctx->pic_height_in_mbs || ctx->pic_height_in_mbs > 127) {
>> +		dev_err(dev, "Bad pic_height_in_mbs value %u, min 1 max 127\n",
>> +			ctx->pic_height_in_mbs);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
>> +				       unsigned long vaddr)
>> +{
>> +	struct tegra_vde_h264_decoder_ctx ctx;
>> +	struct tegra_vde_h264_frame frame;
>> +	struct device *dev = vde->miscdev.parent;
>> +	struct video_frame *dpb_frames = NULL;
>> +	struct dma_buf_attachment *bitstream_data_dmabuf_attachment = NULL;
>> +	enum dma_data_direction dma_dir;
>> +	phys_addr_t bitstream_data_paddr;
>> +	phys_addr_t bsev_paddr;
>> +	u32 bitstream_data_size;
>> +	u32 macroblocks_nb;
>> +	bool timeout = false;
>> +	int i, ret;
>> +
>> +	if (copy_from_user(&ctx, (void __user *)vaddr, sizeof(ctx))) {
>> +		dev_err(dev, "Copying of H.264 CTX from user failed\n");
>> +		return -EFAULT;
>> +	}
>> +
>> +	ret = tegra_vde_validate_h264_ctx(dev, &ctx);
>> +	if (ret)
>> +		return -EINVAL;
>> +
>> +	ret = tegra_vde_attach_dmabuf(dev, ctx.bitstream_data_fd,
>> +				      ctx.bitstream_data_offset, 0,
>> +				      &bitstream_data_dmabuf_attachment,
>> +				      &bitstream_data_paddr,
>> +				      &bitstream_data_size,
>> +				      DMA_TO_DEVICE);
>> +	if (ret)
>> +		goto cleanup;
> 
> 
> I hate this label name.  What are we cleaning up???  Now I have to set a
> bookmark so I can remember where I left and then scroll down to the
> bottom of the function and take a look.
> 
> [pause]
> 
> OK.  I'm back.  I call this "one err" style error handling.  And it's
> very bug prone.  Please read my essay on the topic:
> 
> https://plus.google.com/106378716002406849458/posts/dnanfhQ4mHQ
> 
> The bug is that we call tegra_vde_detach_and_put_dmabuf() with a NULL
> pointer and there was that dereference before check that I mentioned
> earlier.
> 

Again, this NULL pointer was intentional. But yes, I messed up the
IS_ERR_OR_NULL/derefernce order and will get rid of it as you suggested. No
objections to what you wrote in the essay ;)

>> +
>> +	dpb_frames = kcalloc(ctx.dpb_frames_nb, sizeof(*dpb_frames),
>> +			     GFP_KERNEL);
>> +	if (!dpb_frames) {
>> +		ret = -ENOMEM;
>> +		goto cleanup;
>> +	}
>> +
>> +	macroblocks_nb = ctx.pic_width_in_mbs * ctx.pic_height_in_mbs;
>> +	vaddr = ctx.dpb_frames_ptr;
>> +
>> +	for (i = 0; i < ctx.dpb_frames_nb; i++) {
>> +		ret = tegra_vde_copy_and_validate_frame(dev, &frame, vaddr);
>> +		if (ret)
>> +			goto cleanup;
>> +
>> +		dpb_frames[i].flags = frame.flags;
>> +		dpb_frames[i].frame_num = frame.frame_num;
>> +
>> +		dma_dir = (i == 0) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
>> +
>> +		ret = tegra_vde_attach_frame_dmabufs(dev,
>> +						     &dpb_frames[i], &frame,
>> +						     dma_dir,
>> +						     ctx.is_baseline_profile,
>> +						     macroblocks_nb * 64);
>> +		if (ret) {
>> +			tegra_vde_deattach_frame_dmabufs(&dpb_frames[i]);
>> +			goto cleanup;
>> +		}
>> +
>> +		vaddr += sizeof(frame);
>> +	}
>> +
>> +	ret = clk_prepare_enable(vde->clk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable clk: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	ret = mutex_lock_interruptible(&vde->lock);
>> +	if (ret)
>> +		goto clkgate;
>> +
>> +	ret = reset_control_deassert(vde->rst);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to deassert reset: %d\n", ret);
>> +		clk_disable_unprepare(vde->clk);
> 
> We do a second clk_disable_unprepare(vde->clk); after the unlock.
> Delete this?
> 

Good catch! I've reshuffled clk managment several times before..

>> +		goto unlock;
>> +	}
>> +
>> +	ret = tegra_vde_setup_context(vde, &ctx, dpb_frames,
>> +				      bitstream_data_paddr,
>> +				      bitstream_data_size,
>> +				      macroblocks_nb);
>> +	if (ret)
>> +		goto reset;
>> +
>> +	tegra_vde_decode_frame(vde, macroblocks_nb);
>> +
>> +	timeout = !wait_for_completion_io_timeout(&vde->decode_completion,
>> +						  TEGRA_VDE_TIMEOUT);
>> +	if (timeout) {
>> +		bsev_paddr = readl(vde->regs + BSEV(0x10));
>> +		macroblocks_nb = readl(vde->regs + SXE(0xC8)) & 0x1FFF;
>> +
>> +		dev_err(dev, "Decoding failed, "
>> +				"read 0x%X bytes : %u macroblocks parsed\n",
>> +			bsev_paddr ? bsev_paddr - bitstream_data_paddr : 0,
>> +			macroblocks_nb);
>> +	}
>> +
>> +reset:
>> +	/*
>> +	 * We rely on the VDE registers reset value, otherwise VDE would
>> +	 * cause bus lockup.
>> +	 */
>> +	ret = reset_control_assert(vde->rst);
>> +	if (ret)
>> +		dev_err(dev, "Failed to assert reset: %d\n", ret);
> 
> We're overwriting "ret" here when we probably want to preserve the error
> code from reset_control_deassert().
> 

I think it doesn't really matter. It's very unlikely that the reset assert could
ever fail, it might result in a further system hang on the next decode invocation.

>> +
>> +	if (timeout)
>> +		ret = -EIO;
>> +
>> +unlock:
>> +	mutex_unlock(&vde->lock);
>> +
>> +clkgate:
>> +	clk_disable_unprepare(vde->clk);
>> +
>> +cleanup:
>> +	if (dpb_frames)
>> +		while (i--)
>> +			tegra_vde_deattach_frame_dmabufs(&dpb_frames[i]);
>> +
>> +	kfree(dpb_frames);
>> +
>> +	tegra_vde_detach_and_put_dmabuf(bitstream_data_dmabuf_attachment);
>> +
>> +	return ret;
>> +}
>> +
>> +static long tegra_vde_unlocked_ioctl(struct file *filp,
>> +				     unsigned int cmd, unsigned long arg)
>> +{
>> +	struct miscdevice *miscdev = filp->private_data;
>> +	struct tegra_vde *vde = container_of(miscdev, struct tegra_vde,
>> +					     miscdev);
>> +
>> +	switch (cmd) {
>> +	case TEGRA_VDE_IOCTL_DECODE_H264:
>> +		return tegra_vde_ioctl_decode_h264(vde, arg);
>> +	}
>> +
>> +	dev_err(miscdev->parent, "Invalid IOCTL command %u\n", cmd);
>> +
>> +	return -ENOTTY;
>> +}
>> +
>> +static const struct file_operations tegra_vde_fops = {
>> +	.owner		= THIS_MODULE,
>> +	.unlocked_ioctl	= tegra_vde_unlocked_ioctl,
>> +};
>> +
>> +static irqreturn_t tegra_vde_isr(int irq, void *data)
>> +{
>> +	struct tegra_vde *vde = data;
>> +
>> +	tegra_vde_set_bits(vde->regs, 0, FRAMEID(0x208));
>> +	complete(&vde->decode_completion);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int tegra_vde_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res_regs, *res_iram;
>> +	struct device *dev = &pdev->dev;
>> +	struct tegra_vde *vde;
>> +	int ret;
>> +
>> +	vde = devm_kzalloc(&pdev->dev, sizeof(*vde), GFP_KERNEL);
>> +	if (!vde)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, vde);
>> +
>> +	res_regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
>> +	if (!res_regs)
>> +		return -ENODEV;
>> +
>> +	res_iram = platform_get_resource_byname(pdev, IORESOURCE_MEM, "iram");
>> +	if (!res_iram)
>> +		return -ENODEV;
>> +
>> +	vde->irq = platform_get_irq_byname(pdev, "sync-token");
>> +	if (vde->irq < 0)
>> +		return vde->irq;
>> +
>> +	vde->regs = devm_ioremap_resource(dev, res_regs);
>> +	if (IS_ERR(vde->regs))
>> +		return PTR_ERR(vde->regs);
>> +
>> +	vde->iram = devm_ioremap_resource(dev, res_iram);
>> +	if (IS_ERR(vde->iram))
>> +		return PTR_ERR(vde->iram);
>> +
>> +	vde->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(vde->clk)) {
>> +		dev_err(dev, "Could not get VDE clk\n");
>> +		return PTR_ERR(vde->clk);
>> +	}
>> +
>> +	vde->rst = devm_reset_control_get(dev, "vde");
>> +	if (IS_ERR(vde->rst)) {
>> +		dev_err(dev, "Could not get VDE reset\n");
>> +		return PTR_ERR(vde->rst);
>> +	}
>> +
>> +	ret = devm_request_irq(dev, vde->irq, tegra_vde_isr, IRQF_SHARED,
>> +			       dev_name(dev), vde);
>> +	if (ret)
>> +		return -ENODEV;
> 
> Presever the error code.
> 
>> +
>> +	ret = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_VDEC,
>> +						vde->clk, vde->rst);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Failed to power up VDE unit\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = reset_control_assert(vde->rst);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to assert reset: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	clk_disable_unprepare(vde->clk);
>> +
>> +	mutex_init(&vde->lock);
>> +	init_completion(&vde->decode_completion);
>> +
>> +	vde->iram_lists_paddr = res_iram->start;
>> +	vde->miscdev.minor = MISC_DYNAMIC_MINOR;
>> +	vde->miscdev.name = "tegra_vde";
>> +	vde->miscdev.fops = &tegra_vde_fops;
>> +	vde->miscdev.parent = dev;
>> +
>> +	ret = misc_register(&vde->miscdev);
>> +	if (ret)
>> +		return -ENODEV;
> 
> Preserve the error code.
> 
>> +
>> +	return 0;
>> +}
>> +
>
-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
