From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/8] drm/tegra: Add falcon helper library
Date: Mon, 5 Dec 2016 20:13:46 +0100
Message-ID: <20161205191346.GC22918@ulmo.ba.sec>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
 <20161110182345.31777-4-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0484059790=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161110182345.31777-4-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Andrew Chew <achew@nvidia.com>, Arto Merilainen <amerilainen@nvidia.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0484059790==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline


--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2016 at 08:23:40PM +0200, Mikko Perttunen wrote:
> From: Arto Merilainen <amerilainen@nvidia.com>
>=20
> Add a set of falcon helper routines for use by the tegradrm client drivers
> of the various falcon-based engines.
>=20
> The falcon is a microcontroller that acts as a frontend for the rest of a
> particular Tegra engine.  In order to properly utilize these engines, the
> frontend must be booted before pushing any commands.
>=20
> Based on work by Andrew Chew <achew@nvidia.com>
>=20
> Signed-off-by: Andrew Chew <achew@nvidia.com>
> Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Makefile |   3 +-
>  drivers/gpu/drm/tegra/falcon.c | 256 +++++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/tegra/falcon.h | 130 +++++++++++++++++++++
>  3 files changed, 388 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tegra/falcon.c
>  create mode 100644 drivers/gpu/drm/tegra/falcon.h
>=20
> diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makef=
ile
> index 2c66a8d..93e9a4a 100644
> --- a/drivers/gpu/drm/tegra/Makefile
> +++ b/drivers/gpu/drm/tegra/Makefile
> @@ -13,6 +13,7 @@ tegra-drm-y :=3D \
>  	sor.o \
>  	dpaux.o \
>  	gr2d.o \
> -	gr3d.o
> +	gr3d.o \
> +	falcon.o
> =20
>  obj-$(CONFIG_DRM_TEGRA) +=3D tegra-drm.o
> diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falco=
n.c
> new file mode 100644
> index 0000000..180b2fd
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/falcon.c
> @@ -0,0 +1,256 @@
> +/*
> + * Copyright (c) 2015, NVIDIA Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/firmware.h>
> +#include <linux/pci_ids.h>
> +#include <linux/iopoll.h>
> +
> +#include "falcon.h"
> +#include "drm.h"
> +
> +#define FALCON_IDLE_TIMEOUT_US		100000
> +#define FALCON_IDLE_CHECK_PERIOD_US	10

Seems a little overkill to have these here, given that their only used
twice. They're also used in two cases where we may end up using
different periods and timeouts eventually, so I'd just stick them into
falcon_wait_idle() and falcon_dma_wait_idle() directly and omit these
definitions. That's kind of a nitpick, so feel free to keep it as-is.

> +
> +enum falcon_memory {
> +	FALCON_MEMORY_IMEM,
> +	FALCON_MEMORY_DATA,
> +};
> +
> +static void falcon_writel(struct falcon *falcon, u32 value, u32 offset)
> +{
> +	writel(value, falcon->regs + offset);
> +}
> +
> +int falcon_wait_idle(struct falcon *falcon)
> +{
> +	u32 idlestate;
> +
> +	return readl_poll_timeout(falcon->regs + FALCON_IDLESTATE, idlestate,
> +				  (!idlestate),

That's an odd way to write this. Why not just "idlestate =3D=3D 0"? That's
much easier to read and more explicit.

> +				  FALCON_IDLE_CHECK_PERIOD_US,
> +				  FALCON_IDLE_TIMEOUT_US);
> +}
> +
> +static int falcon_dma_wait_idle(struct falcon *falcon)
> +{
> +	u32 dmatrfcmd;

u32 value? Naming it after a register suggests that it may be an offset
rather than the register value.

> +
> +	return readl_poll_timeout(falcon->regs + FALCON_DMATRFCMD, dmatrfcmd,
> +				  (dmatrfcmd & FALCON_DMATRFCMD_IDLE),
> +				  FALCON_IDLE_CHECK_PERIOD_US,
> +				  FALCON_IDLE_TIMEOUT_US);
> +}
> +
> +static int falcon_copy_chunk(struct falcon *falcon,
> +			     phys_addr_t base,
> +			     unsigned long offset,
> +			     enum falcon_memory target)
> +{
> +	u32 cmd =3D FALCON_DMATRFCMD_SIZE_256B;
> +
> +	if (target =3D=3D FALCON_MEMORY_IMEM)
> +		cmd |=3D FALCON_DMATRFCMD_IMEM;
> +
> +	falcon_writel(falcon, offset, FALCON_DMATRFMOFFS);
> +	falcon_writel(falcon, base, FALCON_DMATRFFBOFFS);
> +	falcon_writel(falcon, cmd, FALCON_DMATRFCMD);
> +
> +	return falcon_dma_wait_idle(falcon);
> +}
> +
> +static void falcon_copy_firmware_image(struct falcon *falcon,
> +				       const struct firmware *firmware)
> +{
> +	u32 *firmware_vaddr =3D falcon->firmware.vaddr;
> +	size_t i;
> +
> +	/* copy the whole thing taking into account endianness */
> +	for (i =3D 0; i < firmware->size / sizeof(u32); i++)
> +		firmware_vaddr[i] =3D le32_to_cpu(((u32 *)firmware->data)[i]);
> +
> +	/* ensure that caches are flushed and falcon can see the firmware */
> +	dma_sync_single_for_device(falcon->dev, virt_to_phys(firmware_vaddr),
> +				   falcon->firmware.size, DMA_TO_DEVICE);

My understanding is that this is an error and the DMA API will complain
about it if debugging is enabled. I think you need to call one of the
dma_map_*() functions on the memory before you can do a dma_sync_*().

> +}
> +
> +static int falcon_parse_firmware_image(struct falcon *falcon)
> +{
> +	struct falcon_firmware_bin_header_v1 *bin_header =3D
> +		(void *)falcon->firmware.vaddr;
> +	struct falcon_firmware_os_header_v1 *os_header;

Can we make these shorter? Perhaps by leaving out the _header suffix?
It'd be nice if we could avoid splitting these across multiple lines.

> +
> +	/* endian problems would show up right here */
> +	if (bin_header->bin_magic !=3D PCI_VENDOR_ID_NVIDIA) {
> +		dev_err(falcon->dev, "failed to get firmware magic");
> +		return -EINVAL;
> +	}
> +
> +	/* currently only version 1 is supported */
> +	if (bin_header->bin_ver !=3D 1) {
> +		dev_err(falcon->dev, "unsupported firmware version");
> +		return -EINVAL;
> +	}
> +
> +	/* check that the firmware size is consistent */
> +	if (bin_header->bin_size > falcon->firmware.size) {
> +		dev_err(falcon->dev, "firmware image size inconsistency");
> +		return -EINVAL;
> +	}

These messages are missing newlines at the end.

> +
> +	os_header =3D (falcon->firmware.vaddr +
> +		 bin_header->os_bin_header_offset);

I think if we shorten the variable names a little this will also fit on
a single line. There's also no need for the parentheses.

> +
> +	falcon->firmware.bin_data.size =3D bin_header->os_bin_size;
> +	falcon->firmware.bin_data.offset =3D bin_header->os_bin_data_offset;
> +	falcon->firmware.code.offset =3D os_header->os_code_offset;
> +	falcon->firmware.code.size   =3D os_header->os_code_size;
> +	falcon->firmware.data.offset =3D os_header->os_data_offset;
> +	falcon->firmware.data.size   =3D os_header->os_data_size;

Can you remove the extra padding before =3D, please? It's inconsistent
with the other assignments.

> +
> +	return 0;
> +}
> +
> +int falcon_read_firmware(struct falcon *falcon, const char *firmware_nam=
e)

The firmware_ prefix in firmware_name is redundant and can be dropped,
in my opinion.

> +{
> +	const struct firmware *firmware;
> +	int err;
> +
> +	if (falcon->firmware.valid)

Do we really need the .valid field? It seems like we should be able to
derive it from the value of one of the other fields.

> +		return 0;
> +
> +	err =3D request_firmware(&firmware, firmware_name, falcon->dev);
> +	if (err < 0) {
> +		dev_err(falcon->dev, "failed to get firmware\n");
> +		return err;

It'd be nice to show the user what error occurred. Maybe also show the
name of the firmware that couldn't be loaded.

> +	}
> +
> +	falcon->firmware.size =3D firmware->size;
> +
> +	/* allocate iova space for the firmware */
> +	falcon->firmware.vaddr =3D falcon->ops->alloc(falcon, firmware->size,
> +						 &falcon->firmware.paddr);

The arguments aren't properly aligned.

> +	if (!falcon->firmware.vaddr) {
> +		dev_err(falcon->dev, "dma memory mapping failed");
> +		err =3D -ENOMEM;
> +		goto err_alloc_firmware;
> +	}
> +
> +	/* copy firmware image into local area. this also ensures endianness */
> +	falcon_copy_firmware_image(falcon, firmware);
> +
> +	/* parse the image data */
> +	err =3D falcon_parse_firmware_image(falcon);
> +	if (err < 0) {
> +		dev_err(falcon->dev, "failed to parse firmware image\n");
> +		goto err_setup_firmware_image;
> +	}
> +
> +	falcon->firmware.valid =3D true;
> +
> +	release_firmware(firmware);
> +
> +	return 0;
> +
> +err_setup_firmware_image:
> +	falcon->ops->free(falcon, falcon->firmware.size,
> +			  falcon->firmware.paddr, falcon->firmware.vaddr);
> +err_alloc_firmware:
> +	release_firmware(firmware);
> +
> +	return err;
> +}
> +
> +int falcon_init(struct falcon *falcon)
> +{
> +	/* check mandatory ops */
> +	if (!falcon->ops || !falcon->ops->alloc || !falcon->ops->free)
> +		return -EINVAL;
> +
> +	falcon->firmware.valid =3D false;
> +
> +	return 0;
> +}
> +
> +void falcon_exit(struct falcon *falcon)
> +{
> +	if (!falcon->firmware.valid)
> +		return;
> +
> +	falcon->ops->free(falcon, falcon->firmware.size,
> +			  falcon->firmware.paddr,
> +			  falcon->firmware.vaddr);
> +	falcon->firmware.valid =3D false;
> +}
> +
> +int falcon_boot(struct falcon *falcon)
> +{
> +	unsigned long offset;
> +	int err =3D 0;

I don'n think it's necessary to initialize err here.

> +
> +	if (!falcon->firmware.valid)
> +		return -EINVAL;
> +
> +	falcon_writel(falcon, 0, FALCON_DMACTL);
> +
> +	/* setup the address of the binary data. Falcon can access it later */

If you write sentences with a full stop, please use a capital first
letter. In this case I think you can just drop the full stop:

	/* setup the address of the binary data so Falcon can access it later */

> +	falcon_writel(falcon, (falcon->firmware.paddr +
> +			       falcon->firmware.bin_data.offset) >> 8,
> +		      FALCON_DMATRFBASE);
> +
> +	/* copy the data segment into Falcon internal memory */
> +	for (offset =3D 0; offset < falcon->firmware.data.size; offset +=3D 256)
> +		falcon_copy_chunk(falcon,
> +				  falcon->firmware.data.offset + offset,
> +				  offset, FALCON_MEMORY_DATA);
> +
> +	/* copy the first code segment into Falcon internal memory */
> +	falcon_copy_chunk(falcon, falcon->firmware.code.offset,
> +			  0, FALCON_MEMORY_IMEM);
> +
> +	/* setup falcon interrupts */
> +	falcon_writel(falcon, FALCON_IRQMSET_EXT(0xff) |
> +			      FALCON_IRQMSET_SWGEN1 |
> +			      FALCON_IRQMSET_SWGEN0 |
> +			      FALCON_IRQMSET_EXTERR |
> +			      FALCON_IRQMSET_HALT |
> +			      FALCON_IRQMSET_WDTMR,
> +		      FALCON_IRQMSET);
> +	falcon_writel(falcon, FALCON_IRQDEST_EXT(0xff) |
> +			      FALCON_IRQDEST_SWGEN1 |
> +			      FALCON_IRQDEST_SWGEN0 |
> +			      FALCON_IRQDEST_EXTERR |
> +			      FALCON_IRQDEST_HALT,
> +		      FALCON_IRQDEST);
> +
> +	/* enable interface */
> +	falcon_writel(falcon, FALCON_ITFEN_MTHDEN |
> +			      FALCON_ITFEN_CTXEN,
> +		      FALCON_ITFEN);
> +
> +	/* boot falcon */
> +	falcon_writel(falcon, 0x00000000, FALCON_BOOTVEC);
> +	falcon_writel(falcon, FALCON_CPUCTL_STARTCPU, FALCON_CPUCTL);
> +
> +	err =3D falcon_wait_idle(falcon);
> +	if (err < 0) {
> +		dev_err(falcon->dev, "falcon boot failed due to timeout");
> +		return err;
> +	}
> +
> +	dev_info(falcon->dev, "falcon booted");

No need to brag here, it's supposed to be successful. Let the user know
if it isn't. If you really want this, make sure it's output at debug
level, not info. Also I think we need to agree on whether these are
named Falcon or falcon and then use it consistently. I'm leaning towards
the former. Also, there are a few messages with missing newlines.

> +
> +	return 0;
> +}
> +
> +void falcon_execute_method(struct falcon *falcon, u32 method, u32 data)
> +{
> +	falcon_writel(falcon, method >> 2, FALCON_UCLASS_METHOD_OFFSET);
> +	falcon_writel(falcon, data, FALCON_UCLASS_METHOD_DATA);
> +}
> diff --git a/drivers/gpu/drm/tegra/falcon.h b/drivers/gpu/drm/tegra/falco=
n.h
> new file mode 100644
> index 0000000..56284b9
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/falcon.h
> @@ -0,0 +1,130 @@
> +/*
> + * Copyright (c) 2015, NVIDIA Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef _FALCON_H_
> +#define _FALCON_H_
> +
> +#include <linux/types.h>
> +
> +#define FALCON_UCLASS_METHOD_OFFSET		0x00000040
> +
> +#define FALCON_UCLASS_METHOD_DATA		0x00000044
> +
> +#define FALCON_IRQMSET				0x00001010
> +#define FALCON_IRQMSET_WDTMR			(1 << 1)
> +#define FALCON_IRQMSET_HALT			(1 << 4)
> +#define FALCON_IRQMSET_EXTERR			(1 << 5)
> +#define FALCON_IRQMSET_SWGEN0			(1 << 6)
> +#define FALCON_IRQMSET_SWGEN1			(1 << 7)
> +#define FALCON_IRQMSET_EXT(v)			(((v) & 0xff) << 8)
> +
> +#define FALCON_IRQDEST				0x0000101c
> +#define FALCON_IRQDEST_HALT			(1 << 4)
> +#define FALCON_IRQDEST_EXTERR			(1 << 5)
> +#define FALCON_IRQDEST_SWGEN0			(1 << 6)
> +#define FALCON_IRQDEST_SWGEN1			(1 << 7)
> +#define FALCON_IRQDEST_EXT(v)			(((v) & 0xff) << 8)
> +
> +#define FALCON_ITFEN				0x00001048
> +#define FALCON_ITFEN_CTXEN			(1 << 0)
> +#define FALCON_ITFEN_MTHDEN			(1 << 1)
> +
> +#define FALCON_IDLESTATE			0x0000104c
> +
> +#define FALCON_CPUCTL				0x00001100
> +#define FALCON_CPUCTL_STARTCPU			(1 << 1)
> +
> +#define FALCON_BOOTVEC				0x00001104
> +
> +#define FALCON_DMACTL				0x0000110c
> +#define FALCON_DMACTL_DMEM_SCRUBBING		(1 << 1)
> +#define FALCON_DMACTL_IMEM_SCRUBBING		(1 << 2)
> +
> +#define FALCON_DMATRFBASE			0x00001110
> +
> +#define FALCON_DMATRFMOFFS			0x00001114
> +
> +#define FALCON_DMATRFCMD			0x00001118
> +#define FALCON_DMATRFCMD_IDLE			(1 << 1)
> +#define FALCON_DMATRFCMD_IMEM			(1 << 4)
> +#define FALCON_DMATRFCMD_SIZE_256B		(6 << 8)
> +
> +#define FALCON_DMATRFFBOFFS			0x0000111c
> +
> +struct falcon_firmware_bin_header_v1 {
> +	u32 bin_magic;		/* 0x10de */
> +	u32 bin_ver;		/* cya, versioning of bin format (1) */

Not sure everyone understands what cya means, here. Perhaps just drop
it?

> +	u32 bin_size;		/* entire image size including this header */
> +	u32 os_bin_header_offset;
> +	u32 os_bin_data_offset;
> +	u32 os_bin_size;
> +};
> +
> +struct falcon_firmware_os_app_v1 {
> +	u32 offset;
> +	u32 size;
> +};
> +
> +struct falcon_firmware_os_header_v1 {
> +	u32 os_code_offset;
> +	u32 os_code_size;
> +	u32 os_data_offset;
> +	u32 os_data_size;
> +	u32 num_apps;
> +	struct falcon_firmware_os_app_v1 *app_code;
> +	struct falcon_firmware_os_app_v1 *app_data;

The above two seem to be completel unused. Should we drop them?

> +	u32 *os_ovl_offset;
> +	u32 *os_ovl_size;
> +};

Can we in general sanitize the names of these a little? It's redundent
to add a os_ prefix in a structure that contains an _os_ infix.

Thierry

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYRbxnAAoJEN0jrNd/PrOhhBIP/34XsOejE7BqoKX2Q9ajRn9G
Ol7r9Hql3XndzPDOETaVU4dRKN3gadN71L6yJ2407AJfxCqQidcZncePE5gVxpi4
SIlX7nYKfLufYdyWN0L0rOLjkI4YgI67n6SzrJWM5UFcmWLWje12if+sjbtc2xB1
6pYc9ElxlZKODME4nSpnU0kdMUvTrLcYz0Te3+bCpACG3erG7CO2HadEFegFFcKQ
tTDMuOzA1hZfNTQlNmrcC5Vp8GvH3tlV9urhadYNL0cexC8TE3HKrdAZEYhkXoB5
EMsJqkTIWvxuk6fxqbn7uegYwsB1Jm6LA8JU18WBbgCPAGzi3i92SQpappHKkhQn
/h3BFFYxLEEY9yi58ZTG5ZvXQyxTZgG9cct9If46+Ux8k0gvCbhFHQbLGQr5yvyj
8F8rnzBH3+mZsuhKB+lKWxLHKQMwHfLkr12EkGq/ojAWoDNciScM5F5K205JrZme
1n03osMmV2GoO7bvcG2w5z2f5giD4UxLIr5BYWISalNb1T+ncuA8M056FDYHf0s8
40BYGwynuDOY4R9pCGcH76893DArN36r9XzHCN4RrQGd+UDb+vG6MPa+eIiBqEJA
bKqSUpNkDRV1AqvYuVOf7ha/mvsrAE0bamdxpJjQXWe13oVX5pbvVRO5Tg5cebcI
dSMCuFsxVs2c3WwMBzGU
=oBHA
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--

--===============0484059790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0484059790==--
