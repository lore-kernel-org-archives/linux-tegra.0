From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/tegra: Add VIC support
Date: Mon, 25 May 2015 11:25:34 +0300
Message-ID: <5562DC7E.6010008@nvidia.com>
References: <1432214425-27137-1-git-send-email-amerilainen@nvidia.com> <1432214425-27137-4-git-send-email-amerilainen@nvidia.com> <20150522114733.GE16507@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150522114733.GE16507@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, srasal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

Thank you for your thorough analysis - and sorry for a bunch of very 
silly mistakes.

I am skipping most trivial parts and focus on the trickier comments and 
questions.

On 05/22/2015 02:47 PM, Thierry Reding wrote:
>> +
>> +	struct tegra_bo *ucode_bo;
>> +	bool ucode_valid;
>> +	void *ucode_vaddr;
>> +
>> +	bool booted;
>
> There are a bunch of other drivers that use a Falcon and they will all
> need to use similar data to this to deal with the firmware and all. I
> would like to see that code to be made into a Falcon library so that it
> can be reused in a meaningful way.
>
> Roughly this would look like this:
>
> 	struct falcon {
> 		struct device *dev;
> 		...
> 	};
>
> 	int falcon_init(struct falcon *falcon, struct device *dev,
> 			void __iomem *regs);
> 	int falcon_load_firmware(struct falcon *falcon, const char *filename);
> 	int falcon_exit(struct falcon *falcon);
> 	int falcon_boot(struct falcon *falcon);
>

There are two issues in above scheme..:
- Memory allocation. Despite I have explicitly mentioned that the series 
has been tested only with iommu disabled, I would prefer trying to keep 
an option to use it later. Depending how well we want to isolate the 
falcon library from other parts of tegradrm, the library may not have 
ability to map anything to the tegradrm iommu domain.
- The firmware images may not hold only Falcon firmware. Already in VIC 
case we have two firmwares: One for Falcon, another for FCE.

To overcome the above issues, I would prefer dropping 
falcon_load_firmware() and keeping firmware image specifics inside the 
client driver and giving data related to Falcon as a parameter for 
falcon_boot(). Would this be ok?

>> +
>> +	/* for firewall - this determines if method 1 should be regarded
>> +	 * as an address register */
>> +	bool method_data_is_addr_reg;
>> +};
>
> I think it'd be best to incorporate that functionality into the firewall
> so that we can deal with it more centrally rather that duplicate this in
> all drivers.
>

Do you have a concrete suggestion how this should be done? Firewall has 
no access to the driver specifics and in VIC case the VIC methods 
themselves define whether the METHOD1 includes address or not.

>> +static int vic_dma_pa_to_internal_256b(struct vic *vic, phys_addr_t pa,
>> +				       u32 internal_offset, bool imem)
>
> The name is confusing. Without looking at the code I'd expect this to
> perform some kind of conversion from a physical address to some internal
> address, but if I understand correctly this actually copies code into
> the Falcon instruction or data memories. A better name I think would be:
>
> 	static int falcon_load_chunk(struct falcon *falcon, phys_addr_t phys,
> 				     unsigned long offset, enum falcon_memory target);
>
> Note that this is now part of the Falcon library because I've seen
> identical code used in several other drivers. Also the bool argument is
> now an enumeration, which makes it much easier to read. Compare:
>
> 	err = vic_dma_pa_to_internal_256b(vic, phys, offset, true);
>
> and
>
> 	err = falcon_load_chunk(&vic->falcon, phys, offset, FALCON_MEMORY_IMEM);
>

Sounds ok.

> Is there a specific term in Falcon-speak for these 256 byte blocks?
> "chunk" is a little awkward.
>

Unfortunately I am not aware that there would be - maybe "block"?

>> +	if (ucode.bin_header->bin_ver != 1) {
>> +		dev_err(vic->dev, "unsupported firmware version");
>> +		return -ENOENT;
>
> Why not -EINVAL here, too?
>

We can interpret the issue two ways..: The given firmware is invalid 
(-EINVAL) or that there was no supported firmware entry available (-ENOENT).

I do not have strong opinions and will change this to -EINVAL.

>> +	vic->ucode_bo = tegra_bo_create(dev, ucode_fw->size, 0);
>> +	if (IS_ERR(vic->ucode_bo)) {
>> +		dev_err(vic->dev, "dma memory allocation failed");
>> +		err = PTR_ERR(vic->ucode_bo);
>> +		goto err_alloc_iova;
>> +	}
>
> Erm... no. Please don't use tegra_bo_create() to allocate these buffers.
> tegra_bo_create() creates GEM objects and firmware doesn't qualify as a
> GEM object.
>
> Can't you use the DMA API here?
>

The firmware must be mapped to the IOMMU domain into which VIC is 
attached - and I would prefer keeping the door open for enabling iommu 
on VIC. This was the simplest way to get a buffer that is allocated to 
the tegradrm iommu domain.

Should I add a function for allocating memory without making a gem 
object or should I keep memory allocation here and simply add functions 
for mapping it into tegradrm domain?

>> +static int vic_boot(struct device *dev)
>> +{
>> +	struct vic *vic = dev_get_drvdata(dev);
>> +	u32 offset;
>> +	int err = 0;
>> +
>> +	if (vic->booted)
>> +		return 0;
>> +
>> +	if (!vic->ucode_valid) {
>> +		err = vic_read_ucode(vic);
>> +		if (err)
>> +			return err;
>> +	}
>
> I think this is the wrong place to do this. It's good in that it's as
> late as possible, but vic_boot() is kind of the wrong place. I think you
> should load the firmware and upload it into the Falcon within the
> ->open_channel() implementation, prior to the vic_boot() call. There is
> also no need to reload the firmware every time a VIC channel is opened.
> I think loading the firmware could be done in ->init() instead.
>

I'd prefer pushing this simply inside ->open_channel().

Please correct me if I am wrong here, but ->init() is usually called 
before rootfs has been mounted and the firmware may not be available at 
that point => initialization fails

>> +		dev_err(dev, "boot failed due to timeout");
>> +		return err;
>> +	}
>> +
>> +	/* Set application id and set-up FCE ucode address */
>> +	vic_writel(vic, NVA0B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID >> 2,
>> +		    NV_PVIC_FALCON_METHOD_0);
>> +	vic_writel(vic, 1, NV_PVIC_FALCON_METHOD_1);
>> +	vic_writel(vic, NVA0B6_VIDEO_COMPOSITOR_SET_FCE_UCODE_SIZE >> 2,
>> +		    NV_PVIC_FALCON_METHOD_0);
>> +	vic_writel(vic, vic->fce.size, NV_PVIC_FALCON_METHOD_1);
>
> Looks like this is already a case of device-specific case that's part of
> the boot sequence, so it seems like we're going to need these low-level
> helpers for VIC already.
>

Correct; Everything related to FCE is VIC specific.

>> +static int vic_exit(struct host1x_client *client)
>> +{
>> +	struct tegra_drm_client *drm = host1x_to_drm_client(client);
>> +	struct drm_device *dev = dev_get_drvdata(client->parent);
>> +	struct tegra_drm *tegra = dev->dev_private;
>> +	struct vic *vic = to_vic(drm);
>> +	int err;
>> +
>> +	err = tegra_drm_unregister_client(tegra, drm);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	host1x_syncpt_free(client->syncpts[0]);
>> +	host1x_channel_free(vic->channel);
>> +
>> +	/* ucode is no longer available. release it */
>
> This comment isn't accurate. The microcode won't be available after
> you've released it. Perhaps you meant to say "no longer needed"?
>

Sounds better.

>> +	if (vic->ucode_valid) {
>> +		/* first, ensure that vic is not using it */
>> +		reset_control_assert(vic->rst);
>> +		udelay(10);
>> +		reset_control_deassert(vic->rst);
>> +
>> +		/* ..then release the ucode */
>> +		if (!vic->ucode_bo->vaddr)
>> +			vunmap(vic->ucode_vaddr);
>> +		drm_gem_object_release(&vic->ucode_bo->gem);
>> +		vic->ucode_valid = false;
>> +	}
>
> This now also makes the code unbalanced. You allocate the microcode
> during ->open_channel(), but free it in ->exit(). The allocation should
> happen in ->init() instead if it's freed in ->exit().
>

Please refer to my previous comment for ->init() allocation.

We can rework ->close_channel() to reset the engine and release the 
firmware, however, firmware reading and booting is not free so I would 
prefer keeping this in ->exit().

>> +	err = tegra_powergate_sequence_power_up(vic->config->powergate_id,
>> +						vic->clk, vic->rst);
>> +	if (err) {
>> +		dev_err(dev, "cannot turn on the device\n");
>> +		return err;
>> +	}
>> +
>> +	err = host1x_client_register(&vic->client.base);
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to register host1x client: %d\n", err);
>> +		clk_disable_unprepare(vic->clk);
>> +		tegra_powergate_power_off(vic->config->powergate_id);
>
> tegra_powergate_sequence_power_up() also deasserts the reset, so you
> probably want to assert that here again. Maybe to make it easier you
> could abstract this away into a vic_enable()/vic_disable() pair of
> functions? Or perhaps you could even use runtime PM for this? Don't
> worry about runtime PM if that complicates things too much, though.
>

Sounds good. I planned to introduce PM runtime support a bit later but I 
can check if I can fit to this patch already.

>> +struct ucode_bin_header_v1_vic {
>> +	u32 bin_magic;        /* 0x10de */
>> +	u32 bin_ver;          /* cya, versioning of bin format (1) */
>> +	u32 bin_size;         /* entire image size including this header */
>> +	u32 os_bin_header_offset;
>> +	u32 os_bin_data_offset;
>> +	u32 os_bin_size;
>> +	u32 fce_bin_header_offset;
>> +	u32 fce_bin_data_offset;
>> +	u32 fce_bin_size;
>> +};
>> +
>> +struct ucode_os_code_header_v1_vic {
>> +	u32 offset;
>> +	u32 size;
>> +};
>> +
>> +struct ucode_os_header_v1_vic {
>> +	u32 os_code_offset;
>> +	u32 os_code_size;
>> +	u32 os_data_offset;
>> +	u32 os_data_size;
>> +	u32 num_apps;
>> +	struct ucode_os_code_header_v1_vic *app_code;
>> +	struct ucode_os_code_header_v1_vic *app_data;
>> +	u32 *os_ovl_offset;
>> +	u32 *of_ovl_size;
>> +};
>> +
>> +struct ucode_fce_header_v1_vic {
>> +	u32 fce_ucode_offset;
>> +	u32 fce_ucode_buffer_size;
>> +	u32 fce_ucode_size;
>> +};
>> +
>> +struct ucode_v1_vic {
>> +	struct ucode_bin_header_v1_vic *bin_header;
>> +	struct ucode_os_header_v1_vic  *os_header;
>> +	struct ucode_fce_header_v1_vic *fce_header;
>> +};
>
> I'll assume that these are data structures shared by all other drivers
> for Falcon driven engines, so they should probably go into the Falcon
> library header as well.
>

ucode_os_header_v1_vic is the only common structure above. Please see my 
earlier comment for the falcon library suggestion.

>> +#define NV_PVIC_MISC_PRI_VIC_CG			0x000016d0
>> +#define CG_IDLE_CG_DLY_CNT(val)			((val & 0x3f) << 0)
>> +#define CG_IDLE_CG_EN				(1 << 6)
>> +#define CG_WAKEUP_DLY_CNT(val)			((val & 0xf) << 16)
>
> These aren't in the TRM either, but I vaguely remember this being
> tracked in an internal bug. Have bugs been filed to track documentation
> of the other registers as well?
>

Yes, there is a bug for tracking that this register - and three others 
you mentioned - get documented in TRM.

- Arto
