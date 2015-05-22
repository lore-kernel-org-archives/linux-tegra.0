From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/4] drm/tegra: Add VIC support
Date: Fri, 22 May 2015 13:47:34 +0200
Message-ID: <20150522114733.GE16507@ulmo>
References: <1432214425-27137-1-git-send-email-amerilainen@nvidia.com>
 <1432214425-27137-4-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0007394623=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1432214425-27137-4-git-send-email-amerilainen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arto Merilainen <amerilainen@nvidia.com>
Cc: achew@nvidia.com, dnibade@nvidia.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, srasal@nvidia.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0007394623==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Content-Disposition: inline


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2015 at 04:20:24PM +0300, Arto Merilainen wrote:
> This patch adds support for Video Image Compositor engine which
> can be used for 2d operations.
>=20
> The engine has a microcontroller (Falcon) that acts as a frontend
> for the rest of the unit. In order to properly utilize the engine,
> the frontend must be booted before pushing any commands.
>=20
> Signed-off-by: Andrew Chew <achew@nvidia.com>
> Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Makefile |   3 +-
>  drivers/gpu/drm/tegra/drm.c    |   9 +-
>  drivers/gpu/drm/tegra/drm.h    |   1 +
>  drivers/gpu/drm/tegra/vic.c    | 593 +++++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/tegra/vic.h    | 116 ++++++++
>  include/linux/host1x.h         |   1 +
>  6 files changed, 721 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/tegra/vic.c
>  create mode 100644 drivers/gpu/drm/tegra/vic.h

I just reviewed, thoroughly, similar patches for ChromeOS. Unfortunately
these comments aren't publicly available, so I guess I'll have to
reproduce them here...

> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
[...]
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/clk.h>
> +#include <linux/host1x.h>
> +#include <linux/module.h>
> +#include <linux/firmware.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <soc/tegra/pmc.h>

This include is misplaced. It should go into a separate section, that is
separated from the <linux/*.h> includes above and the "*.h" includes
below by a blank line.

> +#include <linux/iommu.h>
> +
> +#include "drm.h"
> +#include "gem.h"
> +#include "vic.h"
> +
> +#define VIC_IDLE_TIMEOUT_DEFAULT	10000	/* 10 milliseconds */

The _DEFAULT suffix here isn't very useful since you never override the
default. So this is really just the timeout value.

As was mentioned in the ChromeOS review this should also have a _US
suffix to indicate the unit.

> +#define VIC_IDLE_CHECK_PERIOD		10	/* 10 usec */

_US

> +struct vic;
> +
> +struct vic_config {
> +	/* firmware name */
> +	char *ucode_name;

const?

> +	/* class id */
> +	u32 class_id;
> +
> +	/* powergate id */
> +	int powergate_id;

I don't think it's very likely that these will ever change, so please
drop them.

> +struct vic {
> +	struct {
> +		u32 bin_data_offset;
> +		u32 data_offset;
> +		u32 data_size;
> +		u32 code_offset;
> +		u32 size;
> +	} os, fce;

This is unintuitive. At least these should be commented, but it looks
like these binary firmware images have code and data sections (and the
code to upload to either instruction or data memory corroborates that)
so perhaps it'd be better to structure this more explicitly and hence
do away with the prefixes. Also the types should be non-sized since
these don't represent direct register values nor fields in a binary
file. Perhaps something like:

	struct falcon_firmware_section {
		unsigned long offset;
		size_t size;
	};

	struct falcon_firmware {
		struct falcon_firmware_section code;
		struct falcon_firmware_section data;

		dma_addr_t phys;
		void *virt;
		size_t size;
	};

> +
> +	struct tegra_bo *ucode_bo;
> +	bool ucode_valid;
> +	void *ucode_vaddr;
> +
> +	bool booted;

There are a bunch of other drivers that use a Falcon and they will all
need to use similar data to this to deal with the firmware and all. I
would like to see that code to be made into a Falcon library so that it
can be reused in a meaningful way.

Roughly this would look like this:

	struct falcon {
		struct device *dev;
		...
	};

	int falcon_init(struct falcon *falcon, struct device *dev,
			void __iomem *regs);
	int falcon_load_firmware(struct falcon *falcon, const char *filename);
	int falcon_exit(struct falcon *falcon);
	int falcon_boot(struct falcon *falcon);

etc. Drivers that need to boot a Falcon would then use it somewhat like
this:

	struct vic_soc {
		const char *firmware;
	};

	struct vic {
		struct falcon *falcon;
		void __iomem *regs;
		...
	};

	static int vic_init(struct host1x_client *client)
	{
		struct vic *vic;
		...
		err =3D falcon_boot(&vic->falcon);
		...
	}

	static int vic_probe(struct platform_device *pdev)
	{
		struct falcon_firmware *firmware;
		const struct vic_soc *soc;
		struct vic *vic;
		...
		soc =3D (const struct vic_soc *)match->data;
		...
		err =3D falcon_init(&vic->falcon, &pdev->dev,
				  vic->regs + VIC_FALCON_OFFSET);
		..
		err =3D falcon_load_firmware(&pdev->dev, soc->firmware);
		...
	}

> +	void __iomem *regs;
> +	struct tegra_drm_client client;
> +	struct host1x_channel *channel;
> +	struct iommu_domain *domain;
> +	struct device *dev;
> +	struct clk *clk;
> +	struct reset_control *rst;
> +
> +	/* Platform configuration */
> +	struct vic_config *config;

This should be const.

> +
> +	/* for firewall - this determines if method 1 should be regarded
> +	 * as an address register */
> +	bool method_data_is_addr_reg;
> +};

I think it'd be best to incorporate that functionality into the firewall
so that we can deal with it more centrally rather that duplicate this in
all drivers.

> +static inline struct vic *to_vic(struct tegra_drm_client *client)
> +{
> +	return container_of(client, struct vic, client);
> +}
> +
> +void vic_writel(struct vic *vic, u32 v, u32 r)
> +{
> +	writel(v, vic->regs + r);
> +}
> +
> +u32 vic_readl(struct vic *vic, u32 r)
> +{
> +	return readl(vic->regs + r);
> +}

s/r/offset/, s/v/value/. The offset should also be unsigned long or
unsigned int to make it more difficult to confuse it with a register
value. Both of these functions should also be static. Compiling with
sparse checking enabled (install sparse, compile with C=3D1) will flag
such cases.

> +static int vic_wait_idle(struct vic *vic)
> +{
> +	u32 timeout =3D VIC_IDLE_TIMEOUT_DEFAULT;
> +
> +	do {
> +		u32 check =3D min_t(u32, VIC_IDLE_CHECK_PERIOD, timeout);
> +		u32 w =3D vic_readl(vic, NV_PVIC_FALCON_IDLESTATE);
> +
> +		if (!w)
> +			return 0;
> +
> +		udelay(VIC_IDLE_CHECK_PERIOD);

Don't even use udelay() unless you are in atomic context. usleep_range()
is the right function to use here.

> +		timeout -=3D check;
> +	} while (timeout);

Also this loop is not a very precise way of waiting for a timeout
because it will drift. Use an exit condition based on an absolute
timestamp. The helpers in linux/iopoll.h should work well in this
driver.

> +	dev_err(vic->dev, "vic idle timeout");

You should leave error reporting to the caller. Actually, you already do
that, so in case of a timeout we'd actually get two error messages.

> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int vic_dma_wait_idle(struct vic *vic)
> +{
> +	u32 timeout =3D VIC_IDLE_TIMEOUT_DEFAULT;
> +
> +	do {
> +		u32 check =3D min_t(u32, VIC_IDLE_CHECK_PERIOD, timeout);
> +		u32 dmatrfcmd =3D vic_readl(vic, NV_PVIC_FALCON_DMATRFCMD);
> +
> +		if (dmatrfcmd & DMATRFCMD_IDLE)
> +			return 0;
> +
> +		udelay(VIC_IDLE_CHECK_PERIOD);
> +		timeout -=3D check;
> +	} while (timeout);
> +
> +	dev_err(vic->dev, "dma idle timeout");
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int vic_dma_pa_to_internal_256b(struct vic *vic, phys_addr_t pa,
> +				       u32 internal_offset, bool imem)

The name is confusing. Without looking at the code I'd expect this to
perform some kind of conversion from a physical address to some internal
address, but if I understand correctly this actually copies code into
the Falcon instruction or data memories. A better name I think would be:

	static int falcon_load_chunk(struct falcon *falcon, phys_addr_t phys,
				     unsigned long offset, enum falcon_memory target);

Note that this is now part of the Falcon library because I've seen
identical code used in several other drivers. Also the bool argument is
now an enumeration, which makes it much easier to read. Compare:

	err =3D vic_dma_pa_to_internal_256b(vic, phys, offset, true);

and

	err =3D falcon_load_chunk(&vic->falcon, phys, offset, FALCON_MEMORY_IMEM);

Is there a specific term in Falcon-speak for these 256 byte blocks?
"chunk" is a little awkward.

> +{
> +	u32 cmd =3D DMATRFCMD_SIZE_256B;
> +
> +	if (imem)
> +		cmd |=3D DMATRFCMD_IMEM;
> +
> +	vic_writel(vic, DMATRFMOFFS_OFFS(internal_offset),
> +		   NV_PVIC_FALCON_DMATRFMOFFS);
> +	vic_writel(vic, DMATRFFBOFFS_OFFS(pa),
> +		   NV_PVIC_FALCON_DMATRFFBOFFS);
> +	vic_writel(vic, cmd, NV_PVIC_FALCON_DMATRFCMD);
> +
> +	return vic_dma_wait_idle(vic);
> +}
> +
> +static int vic_setup_ucode_image(struct vic *vic,
> +				 const struct firmware *ucode_fw)
> +{
> +	/* image data is little endian. */
> +	u32 *ucode_vaddr =3D vic->ucode_vaddr;
> +	struct ucode_v1_vic ucode;
> +	int w;

"size_t i" might be better here. "size_t" because that matches
ucode_fw->size (I guess it isn't size_t in this patch, but it really
should be) and "i" because that's a more idiomatic loop variable.

> +
> +	/* copy the whole thing taking into account endianness */
> +	for (w =3D 0; w < ucode_fw->size / sizeof(u32); w++)
> +		ucode_vaddr[w] =3D le32_to_cpu(((u32 *)ucode_fw->data)[w]);

Why not make this part of the firmware loading function? Seems like we
always have to do it anyway, so might as well do it right from the
start.

> +	ucode.bin_header =3D (struct ucode_bin_header_v1_vic *)ucode_vaddr;
> +
> +	/* endian problems would show up right here */
> +	if (ucode.bin_header->bin_magic !=3D 0x10de) {

There's a symbolic name for this magic value: PCI_VENDOR_ID_NVIDIA (see
include/linux/pci_ids.h). I suggest we use that here, even if it's a
little clumsy to use the header in a non-PCI driver.

> +		dev_err(vic->dev, "failed to get firmware magic");
> +		return -EINVAL;
> +	}
> +
> +	if (ucode.bin_header->bin_ver !=3D 1) {
> +		dev_err(vic->dev, "unsupported firmware version");
> +		return -ENOENT;

Why not -EINVAL here, too?

> +	}
> +
> +	/* shouldn't be bigger than what firmware thinks */
> +	if (ucode.bin_header->bin_size > ucode_fw->size) {
> +		dev_err(vic->dev, "ucode image size inconsistency");
> +		return -EINVAL;
> +	}
> +
> +	ucode.os_header =3D (struct ucode_os_header_v1_vic *)
> +		(((void *)ucode_vaddr) +
> +		ucode.bin_header->os_bin_header_offset);
> +	vic->os.size =3D ucode.bin_header->os_bin_size;
> +	vic->os.bin_data_offset =3D ucode.bin_header->os_bin_data_offset;
> +	vic->os.code_offset =3D ucode.os_header->os_code_offset;
> +	vic->os.data_offset =3D ucode.os_header->os_data_offset;
> +	vic->os.data_size =3D ucode.os_header->os_data_size;
> +
> +	ucode.fce_header =3D (struct ucode_fce_header_v1_vic *)
> +		(((void *)ucode_vaddr) +
> +		ucode.bin_header->fce_bin_header_offset);
> +	vic->fce.size =3D ucode.fce_header->fce_ucode_size;
> +	vic->fce.data_offset =3D ucode.bin_header->fce_bin_data_offset;
> +
> +	return 0;
> +}
> +
> +static int vic_read_ucode(struct vic *vic)
> +{
> +	struct host1x_client *client =3D &vic->client.base;
> +	struct drm_device *dev =3D dev_get_drvdata(client->parent);
> +	const struct firmware *ucode_fw;
> +	int err;
> +
> +	err =3D request_firmware(&ucode_fw, vic->config->ucode_name, vic->dev);
> +	if (err) {
> +		dev_err(vic->dev, "failed to get firmware\n");
> +		goto err_request_firmware;
> +	}
> +
> +	vic->ucode_bo =3D tegra_bo_create(dev, ucode_fw->size, 0);
> +	if (IS_ERR(vic->ucode_bo)) {
> +		dev_err(vic->dev, "dma memory allocation failed");
> +		err =3D PTR_ERR(vic->ucode_bo);
> +		goto err_alloc_iova;
> +	}

Erm... no. Please don't use tegra_bo_create() to allocate these buffers.
tegra_bo_create() creates GEM objects and firmware doesn't qualify as a
GEM object.

Can't you use the DMA API here?

> +	/* get vaddr for the ucode */
> +	if (!vic->ucode_bo->vaddr)
> +		vic->ucode_vaddr =3D vmap(vic->ucode_bo->pages,
> +					vic->ucode_bo->num_pages, VM_MAP,
> +					pgprot_writecombine(PAGE_KERNEL));
> +	else
> +		vic->ucode_vaddr =3D vic->ucode_bo->vaddr;
> +
> +	err =3D vic_setup_ucode_image(vic, ucode_fw);
> +	if (err) {
> +		dev_err(vic->dev, "failed to parse firmware image\n");
> +		goto err_setup_ucode_image;
> +	}
> +
> +	vic->ucode_valid =3D true;
> +
> +	release_firmware(ucode_fw);
> +
> +	return 0;
> +
> +err_setup_ucode_image:
> +	drm_gem_object_release(&vic->ucode_bo->gem);
> +err_alloc_iova:
> +	release_firmware(ucode_fw);
> +err_request_firmware:
> +	return err;
> +}
> +
> +static int vic_boot(struct device *dev)
> +{
> +	struct vic *vic =3D dev_get_drvdata(dev);
> +	u32 offset;
> +	int err =3D 0;
> +
> +	if (vic->booted)
> +		return 0;
> +
> +	if (!vic->ucode_valid) {
> +		err =3D vic_read_ucode(vic);
> +		if (err)
> +			return err;
> +	}

I think this is the wrong place to do this. It's good in that it's as
late as possible, but vic_boot() is kind of the wrong place. I think you
should load the firmware and upload it into the Falcon within the
->open_channel() implementation, prior to the vic_boot() call. There is
also no need to reload the firmware every time a VIC channel is opened.
I think loading the firmware could be done in ->init() instead.

> +
> +	/* ensure that the engine is in sane state */
> +	reset_control_assert(vic->rst);
> +	udelay(10);
> +	reset_control_deassert(vic->rst);

This in not called from an atomic context, so should use usleep_range().

> +
> +	/* setup clockgating registers */
> +	vic_writel(vic, CG_IDLE_CG_DLY_CNT(4) |
> +			CG_IDLE_CG_EN |
> +			CG_WAKEUP_DLY_CNT(4),
> +		   NV_PVIC_MISC_PRI_VIC_CG);
> +
> +	/* service all dma requests */
> +	vic_writel(vic, 0, NV_PVIC_FALCON_DMACTL);
> +
> +	/* setup dma base address */
> +	vic_writel(vic, (vic->ucode_bo->paddr + vic->os.bin_data_offset) >> 8,
> +		   NV_PVIC_FALCON_DMATRFBASE);
> +
> +	/* dma ucode data */
> +	for (offset =3D 0; offset < vic->os.data_size; offset +=3D 256)
> +		vic_dma_pa_to_internal_256b(vic,
> +					     vic->os.data_offset + offset,
> +					     offset, false);
> +
> +	/* dma ucode */
> +	vic_dma_pa_to_internal_256b(vic, vic->os.code_offset, 0, true);

Looks like this could be a separate function that uploads the microcode
to the Falcon. Perhaps as part of moving this to library code this could
be split up more fine-grainedly. Perhaps include a falcon_boot() wrapper
that does all this in the standard sequence. Having the possibility to
call low-level helpers makes this more flexible in case we ever need
extra tweaks in some driver.

> +
> +	/* setup falcon interrupts and enable interface */
> +	vic_writel(vic, IRQMSET_EXT(0xff) |
> +			IRQMSET_SWGEN1_SET |
> +			IRQMSET_SWGEN0_SET |
> +			IRQMSET_EXTERR_SET |
> +			IRQMSET_HALT_SET |
> +			IRQMSET_WDTMR_SET,
> +		   NV_PVIC_FALCON_IRQMSET);
> +	vic_writel(vic, IRQDEST_HOST_EXT(0Xff) |
> +			IRQDEST_HOST_SWGEN1_HOST |
> +			IRQDEST_HOST_SWGEN0_HOST |
> +			IRQDEST_HOST_EXTERR_HOST |
> +			IRQDEST_HOST_HALT_HOST,
> +		    NV_PVIC_FALCON_IRQDEST);
> +
> +	/* enable method and context switch interfaces */
> +	vic_writel(vic, ITFEN_MTHDEN_ENABLE |
> +			ITFEN_CTXEN_ENABLE,
> +		   NV_PVIC_FALCON_ITFEN);
> +
> +	/* boot falcon */
> +	vic_writel(vic, BOOTVEC_VEC(0), NV_PVIC_FALCON_BOOTVEC);
> +	vic_writel(vic, CPUCTL_STARTCPU, NV_PVIC_FALCON_CPUCTL);
> +
> +	err =3D vic_wait_idle(vic);
> +	if (err !=3D 0) {

err < 0

> +		dev_err(dev, "boot failed due to timeout");
> +		return err;
> +	}
> +
> +	/* Set application id and set-up FCE ucode address */
> +	vic_writel(vic, NVA0B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID >> 2,
> +		    NV_PVIC_FALCON_METHOD_0);
> +	vic_writel(vic, 1, NV_PVIC_FALCON_METHOD_1);
> +	vic_writel(vic, NVA0B6_VIDEO_COMPOSITOR_SET_FCE_UCODE_SIZE >> 2,
> +		    NV_PVIC_FALCON_METHOD_0);
> +	vic_writel(vic, vic->fce.size, NV_PVIC_FALCON_METHOD_1);

Looks like this is already a case of device-specific case that's part of
the boot sequence, so it seems like we're going to need these low-level
helpers for VIC already.

> +	vic_writel(vic, NVA0B6_VIDEO_COMPOSITOR_SET_FCE_UCODE_OFFSET >> 2,
> +		    NV_PVIC_FALCON_METHOD_0);
> +	vic_writel(vic, (vic->ucode_bo->paddr + vic->fce.data_offset) >> 8,
> +		    NV_PVIC_FALCON_METHOD_1);
> +
> +	err =3D vic_wait_idle(vic);
> +	if (err !=3D 0) {

Here too.

> +		dev_err(dev, "failed to set application id and fce base");
> +		return err;
> +	}
> +
> +	vic->booted =3D true;
> +
> +	dev_info(dev, "booted");
> +
> +	return 0;
> +}
> +
> +static int vic_init(struct host1x_client *client)
> +{
> +	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> +	struct drm_device *dev =3D dev_get_drvdata(client->parent);
> +	struct tegra_drm *tegra =3D dev->dev_private;
> +	struct vic *vic =3D to_vic(drm);
> +	int err;
> +
> +	if (tegra->domain) {
> +		err =3D iommu_attach_device(tegra->domain, vic->dev);
> +		if (err < 0) {
> +			dev_err(vic->dev, "failed to attach to domain: %d\n",
> +				err);
> +			return err;
> +		}
> +
> +		vic->domain =3D tegra->domain;
> +	}
> +
> +	vic->channel =3D host1x_channel_request(client->dev);
> +	if (!vic->channel)
> +		return -ENOMEM;
> +
> +	client->syncpts[0] =3D host1x_syncpt_request(client->dev, 0);
> +	if (!client->syncpts[0]) {
> +		host1x_channel_free(vic->channel);
> +		return -ENOMEM;
> +	}
> +
> +	return tegra_drm_register_client(tegra, drm);
> +}

You never detach from the IOMMU domain on failure.

> +
> +static int vic_exit(struct host1x_client *client)
> +{
> +	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> +	struct drm_device *dev =3D dev_get_drvdata(client->parent);
> +	struct tegra_drm *tegra =3D dev->dev_private;
> +	struct vic *vic =3D to_vic(drm);
> +	int err;
> +
> +	err =3D tegra_drm_unregister_client(tegra, drm);
> +	if (err < 0)
> +		return err;
> +
> +	host1x_syncpt_free(client->syncpts[0]);
> +	host1x_channel_free(vic->channel);
> +
> +	/* ucode is no longer available. release it */

This comment isn't accurate. The microcode won't be available after
you've released it. Perhaps you meant to say "no longer needed"?

> +	if (vic->ucode_valid) {
> +		/* first, ensure that vic is not using it */
> +		reset_control_assert(vic->rst);
> +		udelay(10);
> +		reset_control_deassert(vic->rst);
> +
> +		/* ..then release the ucode */
> +		if (!vic->ucode_bo->vaddr)
> +			vunmap(vic->ucode_vaddr);
> +		drm_gem_object_release(&vic->ucode_bo->gem);
> +		vic->ucode_valid =3D false;
> +	}

This now also makes the code unbalanced. You allocate the microcode
during ->open_channel(), but free it in ->exit(). The allocation should
happen in ->init() instead if it's freed in ->exit().

> +
> +	if (vic->domain) {
> +		iommu_detach_device(vic->domain, vic->dev);
> +		vic->domain =3D NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct host1x_client_ops vic_client_ops =3D {
> +	.init =3D vic_init,
> +	.exit =3D vic_exit,
> +};
> +
> +static int vic_open_channel(struct tegra_drm_client *client,
> +			     struct tegra_drm_context *context)
> +{
> +	struct vic *vic =3D to_vic(client);
> +	int err;
> +
> +	err =3D vic_boot(vic->dev);
> +	if (err)
> +		return err;
> +
> +	context->channel =3D host1x_channel_get(vic->channel);
> +	if (!context->channel)
> +		return -ENOMEM;

It seems like that's correct, but that seems more like a coincidence
rather than anything else. It's weird how we propagate errors from
host1x_pushbuffer_init() to host1x_cdma_init() to host1x_channel_get()
and then return NULL on failure. Perhaps a better way would be to make
host1x_channel_get() return an ERR_PTR()-encoded error code to be more
explicit about the error code. The reason why this makes me
uncomfortable is that if we ever add code that can fail for reasons
other than memory allocation this will be wrong, and chances high that
nobody will remember to update this (given that host1x_channel_get()
does not propagate the error code we wouldn't be able to return anything
accurate anyway).

I think this is fine for now, just something to keep in mind for some
other time.

> +
> +	return 0;
> +}
> +
> +static void vic_close_channel(struct tegra_drm_context *context)
> +{
> +	host1x_channel_put(context->channel);
> +}
> +
> +static int vic_is_addr_reg(struct device *dev, u32 class, u32 offset, u3=
2 val)
> +{
> +	struct vic *vic =3D dev_get_drvdata(dev);
> +
> +	/* handle host class */
> +	if (class =3D=3D HOST1X_CLASS_HOST1X) {
> +		if (offset =3D=3D 0x2b)
> +			return true;
> +		return false;
> +	}
> +
> +	/* write targets towards method 1. check stashed value */
> +	if (offset =3D=3D NV_PVIC_FALCON_METHOD_1 >> 2)
> +		return vic->method_data_is_addr_reg;
> +
> +	/* write targets to method 0. determine if the method takes an
> +	 * address as a parameter */

This isn't a proper block-style comment.

> +	if (offset =3D=3D NV_PVIC_FALCON_METHOD_0 >> 2) {
> +		u32 method =3D val << 2;
> +
> +		if ((method >=3D 0x400 && method <=3D 0x5dc) ||
> +		    (method >=3D 0x720 && method <=3D 0x738))

We're going to need symbolic names here.

> +			vic->method_data_is_addr_reg =3D true;
> +		else
> +			vic->method_data_is_addr_reg =3D false;
> +	}
> +
> +	/* default to false */

I think the code is obvious enough not to warrant this comment.

> +	return false;
> +}
> +
> +static const struct tegra_drm_client_ops vic_ops =3D {
> +	.open_channel =3D vic_open_channel,
> +	.close_channel =3D vic_close_channel,
> +	.is_addr_reg =3D vic_is_addr_reg,
> +	.submit =3D tegra_drm_submit,
> +};
> +
> +static const struct vic_config vic_t124_config =3D {
> +	.ucode_name =3D "vic03_ucode.bin",
> +	.class_id =3D HOST1X_CLASS_VIC,
> +	.powergate_id =3D TEGRA_POWERGATE_VIC,
> +};
> +
> +static const struct of_device_id vic_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra124-vic",
> +		.data =3D &vic_t124_config },

You'd typically indent both of these or have them on one line. That is
either:

	{
		.compatible =3D ...,
		.data =3D ...
	},

or

	{ .compatible =3D ..., .data =3D ... },

> +	{ },
> +};
> +
> +static int vic_probe(struct platform_device *pdev)
> +{
> +	struct vic_config *vic_config =3D NULL;

const

> +	struct device *dev =3D &pdev->dev;
> +	struct host1x_syncpt **syncpts;
> +	struct resource *regs;
> +	struct vic *vic;
> +	int err;
> +
> +	if (dev->of_node) {

This will always be true, so can be dropped.

> +		const struct of_device_id *match;
> +
> +		match =3D of_match_device(vic_match, dev);
> +		if (match)
> +			vic_config =3D (struct vic_config *)match->data;
> +		else
> +			return -ENXIO;

This error condition can never happen either. At least not if you update
the driver properly. If you don't you deserve the ensuing crash.

> +	}
> +
> +	vic =3D devm_kzalloc(dev, sizeof(*vic), GFP_KERNEL);
> +	if (!vic)
> +		return -ENOMEM;
> +
> +	syncpts =3D devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);
> +	if (!syncpts)
> +		return -ENOMEM;
> +
> +	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!regs) {
> +		dev_err(&pdev->dev, "failed to get registers\n");
> +		return -ENXIO;
> +	}

No need for the error checking here. devm_ioremap_resource() below will
do it for you.

> +
> +	vic->regs =3D devm_ioremap_resource(dev, regs);
> +	if (IS_ERR(vic->regs))
> +		return PTR_ERR(vic->regs);
> +
> +	vic->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(vic->clk)) {
> +		dev_err(&pdev->dev, "failed to get clock\n");
> +		return PTR_ERR(vic->clk);
> +	}
> +
> +	vic->rst =3D devm_reset_control_get(dev, "vic03");
> +	if (IS_ERR(vic->rst)) {
> +		dev_err(&pdev->dev, "cannot get reset\n");
> +		return PTR_ERR(vic->rst);
> +	}
> +
> +	platform_set_drvdata(pdev, vic);
> +
> +	INIT_LIST_HEAD(&vic->client.base.list);
> +	vic->client.base.ops =3D &vic_client_ops;
> +	vic->client.base.dev =3D dev;
> +	vic->client.base.class =3D vic_config->class_id;
> +	vic->client.base.syncpts =3D syncpts;
> +	vic->client.base.num_syncpts =3D 1;
> +	vic->dev =3D dev;
> +	vic->config =3D vic_config;
> +
> +	INIT_LIST_HEAD(&vic->client.list);
> +	vic->client.ops =3D &vic_ops;
> +
> +	err =3D tegra_powergate_sequence_power_up(vic->config->powergate_id,
> +						vic->clk, vic->rst);
> +	if (err) {
> +		dev_err(dev, "cannot turn on the device\n");
> +		return err;
> +	}
> +
> +	err =3D host1x_client_register(&vic->client.base);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register host1x client: %d\n", err);
> +		clk_disable_unprepare(vic->clk);
> +		tegra_powergate_power_off(vic->config->powergate_id);

tegra_powergate_sequence_power_up() also deasserts the reset, so you
probably want to assert that here again. Maybe to make it easier you
could abstract this away into a vic_enable()/vic_disable() pair of
functions? Or perhaps you could even use runtime PM for this? Don't
worry about runtime PM if that complicates things too much, though.

> +		platform_set_drvdata(pdev, NULL);
> +		return err;
> +	}
> +
> +	dev_info(&pdev->dev, "initialized");
> +
> +	return 0;
> +}
> +
> +static int vic_remove(struct platform_device *pdev)
> +{
> +	struct vic *vic =3D platform_get_drvdata(pdev);
> +	int err;
> +
> +	err =3D host1x_client_unregister(&vic->client.base);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	clk_disable_unprepare(vic->clk);
> +	tegra_powergate_power_off(vic->config->powergate_id);

This supports the suggestion to introduce a separate function for this.

> +
> +	return 0;
> +}
> +
> +struct platform_driver tegra_vic_driver =3D {
> +	.driver =3D {
> +		.name =3D "tegra-vic",
> +		.of_match_table =3D vic_match,
> +	},
> +	.probe =3D vic_probe,
> +	.remove =3D vic_remove,
> +};
> diff --git a/drivers/gpu/drm/tegra/vic.h b/drivers/gpu/drm/tegra/vic.h
> new file mode 100644
> index 000000000000..65ca38a8da88
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/vic.h
> @@ -0,0 +1,116 @@
> +/*
> + * Copyright (c) 2015, NVIDIA Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef TEGRA_VIC_H
> +#define TEGRA_VIC_H
> +
> +#include <linux/types.h>
> +#include <linux/dma-attrs.h>
> +#include <linux/firmware.h>
> +#include <linux/platform_device.h>
> +
> +struct ucode_bin_header_v1_vic {
> +	u32 bin_magic;        /* 0x10de */
> +	u32 bin_ver;          /* cya, versioning of bin format (1) */
> +	u32 bin_size;         /* entire image size including this header */
> +	u32 os_bin_header_offset;
> +	u32 os_bin_data_offset;
> +	u32 os_bin_size;
> +	u32 fce_bin_header_offset;
> +	u32 fce_bin_data_offset;
> +	u32 fce_bin_size;
> +};
> +
> +struct ucode_os_code_header_v1_vic {
> +	u32 offset;
> +	u32 size;
> +};
> +
> +struct ucode_os_header_v1_vic {
> +	u32 os_code_offset;
> +	u32 os_code_size;
> +	u32 os_data_offset;
> +	u32 os_data_size;
> +	u32 num_apps;
> +	struct ucode_os_code_header_v1_vic *app_code;
> +	struct ucode_os_code_header_v1_vic *app_data;
> +	u32 *os_ovl_offset;
> +	u32 *of_ovl_size;
> +};
> +
> +struct ucode_fce_header_v1_vic {
> +	u32 fce_ucode_offset;
> +	u32 fce_ucode_buffer_size;
> +	u32 fce_ucode_size;
> +};
> +
> +struct ucode_v1_vic {
> +	struct ucode_bin_header_v1_vic *bin_header;
> +	struct ucode_os_header_v1_vic  *os_header;
> +	struct ucode_fce_header_v1_vic *fce_header;
> +};

I'll assume that these are data structures shared by all other drivers
for Falcon driven engines, so they should probably go into the Falcon
library header as well.

> +
> +/* VIC methods */
> +#define NVA0B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID	0x00000200
> +#define NVA0B6_VIDEO_COMPOSITOR_SET_FCE_UCODE_SIZE	0x0000071C
> +#define NVA0B6_VIDEO_COMPOSITOR_SET_FCE_UCODE_OFFSET	0x0000072C
> +
> +/* VIC registers */
> +
> +#define NV_PVIC_FALCON_METHOD_0			0x00000040
> +#define NV_PVIC_FALCON_METHOD_1			0x00000044
> +
> +#define NV_PVIC_FALCON_IRQMSET			0x00001010

I don't see this documented in the TRM.

> +#define IRQMSET_WDTMR_SET			(1 << 1)
> +#define IRQMSET_HALT_SET			(1 << 4)
> +#define IRQMSET_EXTERR_SET			(1 << 5)
> +#define IRQMSET_SWGEN0_SET			(1 << 6)
> +#define IRQMSET_SWGEN1_SET			(1 << 7)
> +#define IRQMSET_EXT(val)			((val & 0xff) << 8)

You'll need to add extra parentheses around "val" to protect against
operator precedence screwing this up.

> +
> +#define NV_PVIC_FALCON_IRQDEST			0x0000101c
> +#define IRQDEST_HOST_HALT_HOST			(1 << 4)
> +#define IRQDEST_HOST_EXTERR_HOST		(1 << 5)
> +#define IRQDEST_HOST_SWGEN0_HOST		(1 << 6)
> +#define IRQDEST_HOST_SWGEN1_HOST		(1 << 7)
> +#define IRQDEST_HOST_EXT(val)			((val & 0xff) << 8)

This isn't documented either.

> +
> +#define NV_PVIC_FALCON_ITFEN			0x00001048
> +#define ITFEN_CTXEN_ENABLE			(1 << 0)
> +#define ITFEN_MTHDEN_ENABLE			(1 << 1)

This is...

> +#define NV_PVIC_FALCON_IDLESTATE		0x0000104c

=2E.. but this again isn't.

> +
> +#define NV_PVIC_FALCON_CPUCTL			0x00001100
> +#define CPUCTL_STARTCPU				(1 << 1)
> +
> +#define NV_PVIC_FALCON_BOOTVEC			0x00001104
> +#define BOOTVEC_VEC(val)			((val & 0xffffffff) << 0)
> +
> +#define NV_PVIC_FALCON_DMACTL			0x0000110c
> +
> +#define NV_PVIC_FALCON_DMATRFBASE		0x00001110
> +
> +#define NV_PVIC_FALCON_DMATRFMOFFS		0x00001114
> +#define DMATRFMOFFS_OFFS(val)			((val & 0xffff) << 0)
> +
> +#define NV_PVIC_FALCON_DMATRFCMD		0x00001118
> +#define DMATRFCMD_IDLE				(1 << 1)
> +#define DMATRFCMD_IMEM				(1 << 4)
> +#define DMATRFCMD_SIZE_256B			(6 << 8)
> +
> +#define NV_PVIC_FALCON_DMATRFFBOFFS		0x0000111c
> +#define DMATRFFBOFFS_OFFS(val)			((val & 0xffffffff) << 0)
> +
> +#define NV_PVIC_MISC_PRI_VIC_CG			0x000016d0
> +#define CG_IDLE_CG_DLY_CNT(val)			((val & 0x3f) << 0)
> +#define CG_IDLE_CG_EN				(1 << 6)
> +#define CG_WAKEUP_DLY_CNT(val)			((val & 0xf) << 16)

These aren't in the TRM either, but I vaguely remember this being
tracked in an internal bug. Have bugs been filed to track documentation
of the other registers as well?

> +
> +

Gratuituous blank line.

> +#endif /* TEGRA_VIC_H */
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index fc86ced77e76..a006dad00009 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -26,6 +26,7 @@ enum host1x_class {
>  	HOST1X_CLASS_HOST1X =3D 0x1,
>  	HOST1X_CLASS_GR2D =3D 0x51,
>  	HOST1X_CLASS_GR2D_SB =3D 0x52,
> +	HOST1X_CLASS_VIC =3D 0x5D,
>  	HOST1X_CLASS_GR3D =3D 0x60,
>  };

Thierry

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXxdSAAoJEN0jrNd/PrOhZk8QALF/BErSIgfdtqpgsKHnfgbS
NpwJxf6pq4y9268S277VM9X9WUnDkxytWeYG3S0TNi664VenwFDXqHJVNWiy2Olt
JnP8pRv7Wqtz4x9Bf223Ahb9lolTF8WVpd8JXWXLUdxYenX5ZXOp2dPlB1qGPdfE
bPnf+eWK3UY1SGk+BpN4z5gAJocut8ml4eJVSGe+mXlgTQPAczbk1CwKkQC5tnMK
RsJYWi4oIvhk5k90/tmOywRA4TI4f6AAZnKcLD9Wk8leF8iF41XBvQdOhCRIaxXp
qNPk/+8LiiZ5Nh8zOCdgGLpfIFioYOJMYGLBBj9hznsKwv0H52UwBNqd5s1iEZT+
QdVYjRSVzGGCO4ffuGLRi85aLL/gO8OldRI7tZIFBJ4PmzFGMbWIguF2X+Lo4H3r
bCt+Pd5OHJHPHIM2JxaqKWE7gvzGEeiGN0ZizLaJxbls+0U/eicOllL0oJewTaFT
MFeAzIGrrNX0YcskW2GkSzryRZokkVrUig9GCubXdTLGY322OJNV7aw1P3Q+ZOes
llqjPPRmJEFs1pPmtsWVeLjqU/VjaOSGwByLKk1VfzxtFP9OeUPwfjzkpjobjGGV
6jmPNyG8Zx6AN7duGULJSO2gVGAzA9rYjAcM3dGEeTevtYGm/Y7T08DYp80nWEnj
oM7Hg7Zxv+aVfKKy70Wt
=cxgm
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--

--===============0007394623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0007394623==--
