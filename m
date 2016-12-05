From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/8] drm/tegra: Add VIC support
Date: Mon, 5 Dec 2016 20:35:59 +0100
Message-ID: <20161205193559.GD22918@ulmo.ba.sec>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
 <20161110182345.31777-5-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2020279805=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161110182345.31777-5-mperttunen@nvidia.com>
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


--===============2020279805==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline


--GyRA7555PLgSTuth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2016 at 08:23:41PM +0200, Mikko Perttunen wrote:
> From: Arto Merilainen <amerilainen@nvidia.com>
>=20
> This patch adds support for Video Image Compositor engine which
> can be used for 2d operations.
>=20
> Signed-off-by: Andrew Chew <achew@nvidia.com>
> Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Makefile |   3 +-
>  drivers/gpu/drm/tegra/drm.c    |   3 +
>  drivers/gpu/drm/tegra/drm.h    |   1 +
>  drivers/gpu/drm/tegra/vic.c    | 400 +++++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/tegra/vic.h    |  31 ++++
>  include/linux/host1x.h         |   1 +
>  6 files changed, 438 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tegra/vic.c
>  create mode 100644 drivers/gpu/drm/tegra/vic.h
>=20
> diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makef=
ile
> index 93e9a4a..6af3a9a 100644
> --- a/drivers/gpu/drm/tegra/Makefile
> +++ b/drivers/gpu/drm/tegra/Makefile
> @@ -14,6 +14,7 @@ tegra-drm-y :=3D \
>  	dpaux.o \
>  	gr2d.o \
>  	gr3d.o \
> -	falcon.o
> +	falcon.o \
> +	vic.o
> =20
>  obj-$(CONFIG_DRM_TEGRA) +=3D tegra-drm.o
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index ecfe7ba..707404d 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1151,11 +1151,13 @@ static const struct of_device_id host1x_drm_subde=
vs[] =3D {
>  	{ .compatible =3D "nvidia,tegra124-sor", },
>  	{ .compatible =3D "nvidia,tegra124-hdmi", },
>  	{ .compatible =3D "nvidia,tegra124-dsi", },
> +	{ .compatible =3D "nvidia,tegra124-vic", },
>  	{ .compatible =3D "nvidia,tegra132-dsi", },
>  	{ .compatible =3D "nvidia,tegra210-dc", },
>  	{ .compatible =3D "nvidia,tegra210-dsi", },
>  	{ .compatible =3D "nvidia,tegra210-sor", },
>  	{ .compatible =3D "nvidia,tegra210-sor1", },
> +	{ .compatible =3D "nvidia,tegra210-vic", },
>  	{ /* sentinel */ }
>  };
> =20
> @@ -1177,6 +1179,7 @@ static struct platform_driver * const drivers[] =3D=
 {
>  	&tegra_sor_driver,
>  	&tegra_gr2d_driver,
>  	&tegra_gr3d_driver,
> +	&tegra_vic_driver,
>  };
> =20
>  static int __init host1x_drm_init(void)
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index f75b505..8efaaa4 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -292,5 +292,6 @@ extern struct platform_driver tegra_dpaux_driver;
>  extern struct platform_driver tegra_sor_driver;
>  extern struct platform_driver tegra_gr2d_driver;
>  extern struct platform_driver tegra_gr3d_driver;
> +extern struct platform_driver tegra_vic_driver;
> =20
>  #endif /* HOST1X_DRM_H */
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> new file mode 100644
> index 0000000..9eda5e5
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -0,0 +1,400 @@
> +/*
> + * Copyright (c) 2015, NVIDIA Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/host1x.h>
> +#include <linux/iommu.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <soc/tegra/pmc.h>
> +
> +#include "drm.h"
> +#include "falcon.h"
> +#include "vic.h"
> +
> +struct vic_config {
> +	/* Firmware name */
> +	const char *ucode_name;

Maybe just "firmware"? That way you could remove the comment.

> +};
> +
> +struct vic {
> +	struct falcon falcon;
> +	bool booted;
> +
> +	void __iomem *regs;
> +	struct tegra_drm_client client;
> +	struct host1x_channel *channel;
> +	struct iommu_domain *domain;
> +	struct device *dev;
> +	struct clk *clk;
> +
> +	/* Platform configuration */
> +	const struct vic_config *config;
> +};
> +
> +static inline struct vic *to_vic(struct tegra_drm_client *client)
> +{
> +	return container_of(client, struct vic, client);
> +}
> +
> +static void vic_writel(struct vic *vic, u32 value, unsigned int offset)
> +{
> +	writel(value, vic->regs + offset);
> +}
> +
> +static int vic_runtime_resume(struct device *dev)
> +{
> +	struct vic *vic =3D dev_get_drvdata(dev);
> +
> +	return clk_prepare_enable(vic->clk);
> +}
> +
> +static int vic_runtime_suspend(struct device *dev)
> +{
> +	struct vic *vic =3D dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(vic->clk);
> +
> +	vic->booted =3D false;
> +
> +	return 0;
> +}
> +
> +static int vic_boot(struct vic *vic)
> +{
> +	u32 fce_ucode_size, fce_bin_data_offset;
> +	void *hdr;
> +	int err =3D 0;
> +
> +	if (vic->booted)
> +		return 0;
> +
> +	if (!vic->falcon.firmware.valid) {
> +		err =3D falcon_read_firmware(&vic->falcon,
> +					   vic->config->ucode_name);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	/* setup clockgating registers */
> +	vic_writel(vic, CG_IDLE_CG_DLY_CNT(4) |
> +			CG_IDLE_CG_EN |
> +			CG_WAKEUP_DLY_CNT(4),
> +		   NV_PVIC_MISC_PRI_VIC_CG);
> +
> +	err =3D falcon_boot(&vic->falcon);
> +	if (err < 0)
> +		return err;
> +
> +	hdr =3D vic->falcon.firmware.vaddr;
> +	fce_bin_data_offset =3D *(u32 *)(hdr + VIC_UCODE_FCE_DATA_OFFSET);
> +	hdr =3D vic->falcon.firmware.vaddr +
> +		*(u32 *)(hdr + VIC_UCODE_FCE_HEADER_OFFSET);
> +	fce_ucode_size =3D *(u32 *)(hdr + FCE_UCODE_SIZE_OFFSET);
> +
> +	falcon_execute_method(&vic->falcon, VIC_SET_APPLICATION_ID, 1);
> +	falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_SIZE,
> +			      fce_ucode_size);
> +	falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_OFFSET,
> +			      (vic->falcon.firmware.paddr + fce_bin_data_offset)
> +				>> 8);
> +
> +	err =3D falcon_wait_idle(&vic->falcon);
> +	if (err < 0) {
> +		dev_err(vic->dev,
> +			"failed to set application ID and FCE base\n");
> +		return err;
> +	}
> +
> +	vic->booted =3D true;
> +
> +	return 0;
> +}
> +
> +static void *vic_falcon_alloc(struct falcon *falcon, size_t size,
> +			       dma_addr_t *iova)
> +{
> +	struct tegra_drm *tegra =3D falcon->data;
> +
> +	return tegra_drm_alloc(tegra, size, iova);
> +}
> +
> +static void vic_falcon_free(struct falcon *falcon, size_t size,
> +			    dma_addr_t iova, void *va)
> +{
> +	struct tegra_drm *tegra =3D falcon->data;
> +
> +	return tegra_drm_free(tegra, size, va, iova);
> +}
> +
> +static const struct falcon_ops vic_falcon_ops =3D {
> +	.alloc =3D vic_falcon_alloc,
> +	.free =3D vic_falcon_free
> +};
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
> +	vic->falcon.dev =3D vic->dev;
> +	vic->falcon.regs =3D vic->regs;
> +	vic->falcon.data =3D tegra;

Why do we need this? We can get at struct vic * from struct falcon * via
an upcast, and once we have struct vic, we have struct tegra_drm_client.

But now I realize that apparently there's no way to get from that to the
struct drm_device. I guess we could go via vic->client.base.parent and a
call to dev_get_drvdata(), but that's rather far. It's still a little
less confusing than stashing the struct tegra_drm * in it, since it is
not at all driver-specific data.

> +	vic->falcon.ops =3D &vic_falcon_ops;
> +	err =3D falcon_init(&vic->falcon);

Could use a blank line between the above.

> +	if (err < 0)
> +		goto detach_device;
> +
> +	vic->channel =3D host1x_channel_request(client->dev);
> +	if (!vic->channel) {
> +		err =3D -ENOMEM;
> +		goto exit_falcon;
> +	}
> +
> +	client->syncpts[0] =3D host1x_syncpt_request(client->dev, 0);
> +	if (!client->syncpts[0]) {
> +		err =3D -ENOMEM;
> +		goto free_channel;
> +	}
> +
> +	err =3D tegra_drm_register_client(tegra, drm);
> +	if (err < 0)
> +		goto free_syncpt;
> +
> +	return 0;
> +
> +free_syncpt:
> +	host1x_syncpt_free(client->syncpts[0]);
> +free_channel:
> +	host1x_channel_free(vic->channel);
> +exit_falcon:
> +	falcon_exit(&vic->falcon);
> +detach_device:
> +	if (tegra->domain)
> +		iommu_detach_device(tegra->domain, vic->dev);
> +
> +	return err;
> +}
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
> +	falcon_exit(&vic->falcon);
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
> +			    struct tegra_drm_context *context)
> +{
> +	struct vic *vic =3D to_vic(client);
> +	int err;
> +
> +	err =3D pm_runtime_get_sync(vic->dev);
> +	if (err < 0)
> +		return err;
> +
> +	/*
> +	 * Try to boot the Falcon microcontroller. Booting is deferred until
> +	 * here because the firmware might not yet be available during system
> +	 * boot, for example if it's on remote storage.
> +	 */

That sounds like a hack. Typically you're supposed to have the firmware
on the same medium as the module that requests it. That is, if the
driver is built-in, then you need to make the firmware available as
built-in as well or stash it into an initrd. If the driver is built as a
loadable module and is on the root filesystem, that's where the firmware
should be as well. There's also the possibility to put the loadable
module into an initrd, in which case that's where the firmware should go
as well.

That said, I think it makes sense to defer the actual booting until this
point. Loading the firmware seems unappropriate to me. It really should
be done in ->probe().

> +	err =3D vic_boot(vic);
> +	if (err < 0) {
> +		pm_runtime_put(vic->dev);
> +		return err;
> +	}
> +
> +	context->channel =3D host1x_channel_get(vic->channel);
> +	if (!context->channel) {
> +		pm_runtime_put(vic->dev);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void vic_close_channel(struct tegra_drm_context *context)
> +{
> +	struct vic *vic =3D to_vic(context->client);
> +
> +	host1x_channel_put(context->channel);
> +
> +	pm_runtime_put(vic->dev);
> +}
> +
> +static const struct tegra_drm_client_ops vic_ops =3D {
> +	.open_channel =3D vic_open_channel,
> +	.close_channel =3D vic_close_channel,
> +	.submit =3D tegra_drm_submit,
> +};
> +
> +static const struct vic_config vic_t124_config =3D {
> +	.ucode_name =3D "nvidia/tegra124/vic03_ucode.bin",
> +};
> +
> +static const struct vic_config vic_t210_config =3D {
> +	.ucode_name =3D "nvidia/tegra210/vic04_ucode.bin",
> +};
> +
> +static const struct of_device_id vic_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra124-vic", .data =3D &vic_t124_config },
> +	{ .compatible =3D "nvidia,tegra210-vic", .data =3D &vic_t210_config },
> +	{ },
> +};
> +
> +static int vic_probe(struct platform_device *pdev)
> +{
> +	struct vic_config *vic_config =3D NULL;
> +	struct device *dev =3D &pdev->dev;
> +	struct host1x_syncpt **syncpts;
> +	struct resource *regs;
> +	const struct of_device_id *match;
> +	struct vic *vic;
> +	int err;
> +
> +	match =3D of_match_device(vic_match, dev);
> +	vic_config =3D (struct vic_config *)match->data;
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
> +	platform_set_drvdata(pdev, vic);
> +
> +	INIT_LIST_HEAD(&vic->client.base.list);
> +	vic->client.base.ops =3D &vic_client_ops;
> +	vic->client.base.dev =3D dev;
> +	vic->client.base.class =3D HOST1X_CLASS_VIC;
> +	vic->client.base.syncpts =3D syncpts;
> +	vic->client.base.num_syncpts =3D 1;
> +	vic->dev =3D dev;
> +	vic->config =3D vic_config;
> +
> +	INIT_LIST_HEAD(&vic->client.list);
> +	vic->client.ops =3D &vic_ops;
> +
> +	err =3D host1x_client_register(&vic->client.base);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register host1x client: %d\n", err);
> +		platform_set_drvdata(pdev, NULL);
> +		return err;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
> +	if (!pm_runtime_enabled(&pdev->dev)) {
> +		err =3D vic_runtime_resume(&pdev->dev);
> +		if (err < 0)
> +			goto unregister_client;
> +	}

That's a slightly ugly construct, but I can't think of an easy way to
get rid of it (other than to depend on PM, which actually might be the
right thing to do here, it's already selected by ARCH_TEGRA on 64-bit
ARM). I can't think of a scenario where we'd want to run without runtime
PM.

> +
> +	dev_info(&pdev->dev, "initialized");

Again, no need for this.

Thierry

--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYRcGcAAoJEN0jrNd/PrOhGyEP/21A0VdoFaN3BpRPuo/LAQHE
SIOD44xG0WqVBuetVN0oZTu2HPHp8b6wwh9u9kNms8JBu+nWsZSpG3dr7c8DXZgX
9D1NegiGj88IHOzvsks+yguPlljv+vCJwdqSLBRbVpwswOcMD5qqLKrsv9n7vW5g
zVjlcZ4WH5YuuIQ/1ajfTQTKAk9HqTtr6+EyKr8Bv0zHq/T/syXwxfilFBXOVlMX
PgvaVOPs39MDb348mxDfZTx3GRvVsUjQbw0l31AoLg/7dgoPXLfaOfCEL6DRFpKY
4hCSd9mNMMcGTaJaXMUoXU6opEkKELA1iql9CBlEfN7yWP9u+bukmF49Agpn5IK6
ZWnyocavIh489LBlXXSeNDQgozTTYJ3peUqXSBdV70bgm1hAWtIvnk9Xmn9Y62Mt
1niH74P4d7TLOJy195ahU9d4KD+PQ9XHzp9BHbZ34Bo2IAgJ2eJ4lmsu/IepScj7
DbrTWuu3/oyce+s1koIyW44sxLAXs080vEPQWqBXZ9XBXQBKNPHxjOP+jT38l+zR
xHp5YjHXsaib/dAgOZ+x9A8ZJnsIX5bIsvavOFIGf0R0UIrrkdbQb+AhpJNFL2Bb
BJ647PrEfNL26SkU7PAucouADO9Z4ddaLd5Oy0ARgYheHRm9Am78P7FCANF111OF
pbwwe15apZQ5b0TVv4MB
=g8uO
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--

--===============2020279805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2020279805==--
