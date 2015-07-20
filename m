From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/4] drm/tegra: Add VIC support
Date: Mon, 20 Jul 2015 11:35:33 +0200
Message-ID: <20150720093532.GS29614@ulmo>
References: <1437378869-10451-1-git-send-email-mperttunen@nvidia.com>
 <1437378869-10451-3-git-send-email-mperttunen@nvidia.com>
 <55ACB134.8010401@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0424360525=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55ACB134.8010401@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: gnurou@gmail.com, tbergstrom@nvidia.com, swarren@wwwdotorg.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org, Andrew Chew <achew@nvidia.com>, amerilainen@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============0424360525==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vEk28Nl/eckWL8CC"
Content-Disposition: inline


--vEk28Nl/eckWL8CC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 09:28:36AM +0100, Jon Hunter wrote:
> Hi Mikko,
>=20
> On 20/07/15 08:54, Mikko Perttunen wrote:
> > From: Arto Merilainen <amerilainen@nvidia.com>
> >=20
> > This patch adds support for Video Image Compositor engine which
> > can be used for 2d operations.
> >=20
> > Signed-off-by: Andrew Chew <achew@nvidia.com>
> > Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
> > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/Makefile |   3 +-
> >  drivers/gpu/drm/tegra/drm.c    |   7 +
> >  drivers/gpu/drm/tegra/drm.h    |   1 +
> >  drivers/gpu/drm/tegra/vic.c    | 456 +++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/tegra/vic.h    |  35 ++++
> >  include/linux/host1x.h         |   1 +
> >  6 files changed, 502 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/tegra/vic.c
> >  create mode 100644 drivers/gpu/drm/tegra/vic.h
> >=20
> > diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Mak=
efile
> > index 93e9a4a..6af3a9a 100644
> > --- a/drivers/gpu/drm/tegra/Makefile
> > +++ b/drivers/gpu/drm/tegra/Makefile
> > @@ -14,6 +14,7 @@ tegra-drm-y :=3D \
> >  	dpaux.o \
> >  	gr2d.o \
> >  	gr3d.o \
> > -	falcon.o
> > +	falcon.o \
> > +	vic.o
> > =20
> >  obj-$(CONFIG_DRM_TEGRA) +=3D tegra-drm.o
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index af4ff86..bc8cc2a 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -1145,6 +1145,7 @@ static const struct of_device_id host1x_drm_subde=
vs[] =3D {
> >  	{ .compatible =3D "nvidia,tegra124-dc", },
> >  	{ .compatible =3D "nvidia,tegra124-sor", },
> >  	{ .compatible =3D "nvidia,tegra124-hdmi", },
> > +	{ .compatible =3D "nvidia,tegra124-vic", },
> >  	{ /* sentinel */ }
> >  };
> > =20
> > @@ -1194,8 +1195,14 @@ static int __init host1x_drm_init(void)
> >  	if (err < 0)
> >  		goto unregister_gr2d;
> > =20
> > +	err =3D platform_driver_register(&tegra_vic_driver);
> > +	if (err < 0)
> > +		goto unregister_gr3d;
> > +
> >  	return 0;
> > =20
> > +unregister_gr3d:
> > +	platform_driver_unregister(&tegra_gr3d_driver);
> >  unregister_gr2d:
> >  	platform_driver_unregister(&tegra_gr2d_driver);
> >  unregister_dpaux:
> > diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> > index 58c83b11..2fc7e42 100644
> > --- a/drivers/gpu/drm/tegra/drm.h
> > +++ b/drivers/gpu/drm/tegra/drm.h
> > @@ -284,5 +284,6 @@ extern struct platform_driver tegra_hdmi_driver;
> >  extern struct platform_driver tegra_dpaux_driver;
> >  extern struct platform_driver tegra_gr2d_driver;
> >  extern struct platform_driver tegra_gr3d_driver;
> > +extern struct platform_driver tegra_vic_driver;
> > =20
> >  #endif /* HOST1X_DRM_H */
> > diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> > new file mode 100644
> > index 0000000..fce7c04
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tegra/vic.c
> > @@ -0,0 +1,456 @@
> > +/*
> > + * Copyright (c) 2015, NVIDIA Corporation.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/host1x.h>
> > +#include <linux/iommu.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> > +
> > +#include <soc/tegra/pmc.h>
> > +
> > +#include "drm.h"
> > +#include "falcon.h"
> > +#include "vic.h"
> > +
> > +struct vic_config {
> > +	/* Firmware name */
> > +	const char *ucode_name;
> > +};
> > +
> > +struct vic {
> > +	struct falcon falcon;
> > +	bool booted;
> > +
> > +	void __iomem *regs;
> > +	struct tegra_drm_client client;
> > +	struct host1x_channel *channel;
> > +	struct iommu_domain *domain;
> > +	struct device *dev;
> > +	struct clk *clk;
> > +	struct reset_control *rst;
> > +
> > +	/* Platform configuration */
> > +	const struct vic_config *config;
> > +
> > +	/* for firewall - this determines if method 1 should be regarded
> > +	 * as an address register */
> > +	bool method_data_is_addr_reg;
> > +};
> > +
> > +static inline struct vic *to_vic(struct tegra_drm_client *client)
> > +{
> > +	return container_of(client, struct vic, client);
> > +}
> > +
> > +static void vic_writel(struct vic *vic, u32 value, unsigned int offset)
> > +{
> > +	writel(value, vic->regs + offset);
> > +}
> > +
> > +static int vic_runtime_resume(struct device *dev)
> > +{
> > +	struct vic *vic =3D dev_get_drvdata(dev);
> > +	int err;
> > +
> > +	err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_VIC,
> > +						vic->clk, vic->rst);
>=20
> I would like to deprecate use of the above function [1]. I have been
> trying to migrate driver to use a new API instead of the above.
>=20
> > +	if (err < 0)
> > +		dev_err(dev, "failed to power up device\n");
> > +
> > +	return err;
> > +}
> > +
> > +static int vic_runtime_suspend(struct device *dev)
> > +{
> > +	struct vic *vic =3D dev_get_drvdata(dev);
> > +
> > +	clk_disable_unprepare(vic->clk);
> > +	reset_control_assert(vic->rst);
> > +	tegra_powergate_power_off(TEGRA_POWERGATE_VIC);
>=20
> Similarly here. I would like to get rid of the above API in favour of a
> different API to help migrate to generic power domain support.
>=20
> > +	vic->booted =3D false;
> > +
> > +	return 0;
> > +}
> > +
> > +static int vic_boot(struct vic *vic)
> > +{
> > +	u32 fce_ucode_size, fce_bin_data_offset;
> > +	void *hdr;
> > +	int err =3D 0;
> > +
> > +	if (vic->booted)
> > +		return 0;
> > +
> > +	if (!vic->falcon.firmware.valid) {
> > +		err =3D falcon_read_firmware(&vic->falcon,
> > +					   vic->config->ucode_name);
> > +		if (err < 0)
> > +			return err;
> > +	}
> > +
> > +	/* ensure that the engine is in sane state */
> > +	reset_control_assert(vic->rst);
> > +	usleep_range(10, 100);
> > +	reset_control_deassert(vic->rst);
> > +
> > +	/* setup clockgating registers */
> > +	vic_writel(vic, CG_IDLE_CG_DLY_CNT(4) |
> > +			CG_IDLE_CG_EN |
> > +			CG_WAKEUP_DLY_CNT(4),
> > +		   NV_PVIC_MISC_PRI_VIC_CG);
> > +
> > +	err =3D falcon_boot(&vic->falcon);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	hdr =3D vic->falcon.firmware.vaddr;
> > +	fce_bin_data_offset =3D *(u32 *)(hdr + VIC_UCODE_FCE_DATA_OFFSET);
> > +	hdr =3D vic->falcon.firmware.vaddr +
> > +		*(u32 *)(hdr + VIC_UCODE_FCE_HEADER_OFFSET);
> > +	fce_ucode_size =3D *(u32 *)(hdr + FCE_UCODE_SIZE_OFFSET);
> > +
> > +	falcon_execute_method(&vic->falcon, VIC_SET_APPLICATION_ID, 1);
> > +	falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_SIZE,
> > +			      fce_ucode_size);
> > +	falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_OFFSET,
> > +			      (vic->falcon.firmware.paddr + fce_bin_data_offset)
> > +				>> 8);
> > +
> > +	err =3D falcon_wait_idle(&vic->falcon);
> > +	if (err < 0) {
> > +		dev_err(vic->dev,
> > +			"failed to set application ID and FCE base\n");
> > +		return err;
> > +	}
> > +
> > +	vic->booted =3D true;
> > +
> > +	return 0;
> > +}
> > +
> > +static void *vic_falcon_alloc(struct falcon *falcon, size_t size,
> > +			       dma_addr_t *iova)
> > +{
> > +	struct tegra_drm *tegra =3D falcon->data;
> > +
> > +	return tegra_drm_alloc(tegra, size, iova);
> > +}
> > +
> > +static void vic_falcon_free(struct falcon *falcon, size_t size,
> > +			    dma_addr_t iova, void *va)
> > +{
> > +	struct tegra_drm *tegra =3D falcon->data;
> > +
> > +	return tegra_drm_free(tegra, size, va, iova);
> > +}
> > +
> > +static const struct falcon_ops vic_falcon_ops =3D {
> > +	.alloc =3D vic_falcon_alloc,
> > +	.free =3D vic_falcon_free
> > +};
> > +
> > +static int vic_init(struct host1x_client *client)
> > +{
> > +	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> > +	struct drm_device *dev =3D dev_get_drvdata(client->parent);
> > +	struct tegra_drm *tegra =3D dev->dev_private;
> > +	struct vic *vic =3D to_vic(drm);
> > +	int err;
> > +
> > +	if (tegra->domain) {
> > +		err =3D iommu_attach_device(tegra->domain, vic->dev);
> > +		if (err < 0) {
> > +			dev_err(vic->dev, "failed to attach to domain: %d\n",
> > +				err);
> > +			return err;
> > +		}
> > +
> > +		vic->domain =3D tegra->domain;
> > +	}
> > +
> > +	vic->falcon.dev =3D vic->dev;
> > +	vic->falcon.regs =3D vic->regs;
> > +	vic->falcon.data =3D tegra;
> > +	vic->falcon.ops =3D &vic_falcon_ops;
> > +	err =3D falcon_init(&vic->falcon);
> > +	if (err < 0)
> > +		goto detach_device;
> > +
> > +	vic->channel =3D host1x_channel_request(client->dev);
> > +	if (!vic->channel) {
> > +		err =3D -ENOMEM;
> > +		goto exit_falcon;
> > +	}
> > +
> > +	client->syncpts[0] =3D host1x_syncpt_request(client->dev, 0);
> > +	if (!client->syncpts[0]) {
> > +		err =3D -ENOMEM;
> > +		goto free_channel;
> > +	}
> > +
> > +	err =3D tegra_drm_register_client(tegra, drm);
> > +	if (err < 0)
> > +		goto free_syncpt;
> > +
> > +	return 0;
> > +
> > +free_syncpt:
> > +	host1x_syncpt_free(client->syncpts[0]);
> > +free_channel:
> > +	host1x_channel_free(vic->channel);
> > +exit_falcon:
> > +	falcon_exit(&vic->falcon);
> > +detach_device:
> > +	if (tegra->domain)
> > +		iommu_detach_device(tegra->domain, vic->dev);
> > +
> > +	return err;
> > +}
> > +
> > +static int vic_exit(struct host1x_client *client)
> > +{
> > +	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> > +	struct drm_device *dev =3D dev_get_drvdata(client->parent);
> > +	struct tegra_drm *tegra =3D dev->dev_private;
> > +	struct vic *vic =3D to_vic(drm);
> > +	int err;
> > +
> > +	err =3D tegra_drm_unregister_client(tegra, drm);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	host1x_syncpt_free(client->syncpts[0]);
> > +	host1x_channel_free(vic->channel);
> > +
> > +	if (vic->booted) {
> > +		reset_control_assert(vic->rst);
> > +		usleep_range(10, 100);
> > +		reset_control_deassert(vic->rst);
> > +	}
> > +
> > +	falcon_exit(&vic->falcon);
> > +
> > +	if (vic->domain) {
> > +		iommu_detach_device(vic->domain, vic->dev);
> > +		vic->domain =3D NULL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct host1x_client_ops vic_client_ops =3D {
> > +	.init =3D vic_init,
> > +	.exit =3D vic_exit,
> > +};
> > +
> > +static int vic_open_channel(struct tegra_drm_client *client,
> > +			    struct tegra_drm_context *context)
> > +{
> > +	struct vic *vic =3D to_vic(client);
> > +	int err;
> > +
> > +	err =3D pm_runtime_get_sync(vic->dev);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	/*
> > +	 * Try to boot the Falcon microcontroller. Booting is deferred until
> > +	 * here because the firmware might not yet be available during system
> > +	 * boot, for example if it's on remote storage.
> > +	 */
> > +	err =3D vic_boot(vic);
> > +	if (err < 0) {
> > +		pm_runtime_put(vic->dev);
> > +		return err;
> > +	}
> > +
> > +	context->channel =3D host1x_channel_get(vic->channel);
> > +	if (!context->channel) {
> > +		pm_runtime_put(vic->dev);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void vic_close_channel(struct tegra_drm_context *context)
> > +{
> > +	struct vic *vic =3D to_vic(context->client);
> > +
> > +	host1x_channel_put(context->channel);
> > +
> > +	pm_runtime_put(vic->dev);
> > +}
> > +
> > +static int vic_is_addr_reg(struct device *dev, u32 class, u32 offset, =
u32 val)
> > +{
> > +	struct vic *vic =3D dev_get_drvdata(dev);
> > +
> > +	if (class !=3D HOST1X_CLASS_VIC)
> > +		return false;
> > +
> > +	/*
> > +	 * Method call parameter. Check stored value to see if set method uses
> > +	 * parameter as memory address.
> > +	 */
> > +	if (offset =3D=3D FALCON_UCLASS_METHOD_DATA >> 2)
> > +		return vic->method_data_is_addr_reg;
> > +
> > +	/* Method call number store. */
> > +	if (offset =3D=3D FALCON_UCLASS_METHOD_OFFSET >> 2) {
> > +		u32 method =3D val << 2;
> > +
> > +		if ((method >=3D VIC_SET_SURFACE0_SLOT0_LUMA_OFFSET &&
> > +		     method <=3D VIC_SET_SURFACE7_SLOT4_CHROMAV_OFFSET) ||
> > +		    (method >=3D VIC_SET_CONFIG_STRUCT_OFFSET &&
> > +		     method <=3D VIC_SET_OUTPUT_SURFACE_CHROMAV_OFFSET))
> > +			vic->method_data_is_addr_reg =3D true;
> > +		else
> > +			vic->method_data_is_addr_reg =3D false;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static const struct tegra_drm_client_ops vic_ops =3D {
> > +	.open_channel =3D vic_open_channel,
> > +	.close_channel =3D vic_close_channel,
> > +	.is_addr_reg =3D vic_is_addr_reg,
> > +	.submit =3D tegra_drm_submit,
> > +};
> > +
> > +static const struct vic_config vic_t124_config =3D {
> > +	.ucode_name =3D "vic03_ucode.bin",
> > +};
> > +
> > +static const struct of_device_id vic_match[] =3D {
> > +	{ .compatible =3D "nvidia,tegra124-vic", .data =3D &vic_t124_config },
> > +	{ },
> > +};
> > +
> > +static int vic_probe(struct platform_device *pdev)
> > +{
> > +	struct vic_config *vic_config =3D NULL;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct host1x_syncpt **syncpts;
> > +	struct resource *regs;
> > +	const struct of_device_id *match;
> > +	struct vic *vic;
> > +	int err;
> > +
> > +	match =3D of_match_device(vic_match, dev);
> > +	vic_config =3D (struct vic_config *)match->data;
> > +
> > +	vic =3D devm_kzalloc(dev, sizeof(*vic), GFP_KERNEL);
> > +	if (!vic)
> > +		return -ENOMEM;
> > +
> > +	syncpts =3D devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);
> > +	if (!syncpts)
> > +		return -ENOMEM;
> > +
> > +	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!regs) {
> > +		dev_err(&pdev->dev, "failed to get registers\n");
> > +		return -ENXIO;
> > +	}
> > +
> > +	vic->regs =3D devm_ioremap_resource(dev, regs);
> > +	if (IS_ERR(vic->regs))
> > +		return PTR_ERR(vic->regs);
> > +
> > +	vic->clk =3D devm_clk_get(dev, NULL);
> > +	if (IS_ERR(vic->clk)) {
> > +		dev_err(&pdev->dev, "failed to get clock\n");
> > +		return PTR_ERR(vic->clk);
> > +	}
> > +
> > +	vic->rst =3D devm_reset_control_get(dev, "vic");
> > +	if (IS_ERR(vic->rst)) {
> > +		dev_err(&pdev->dev, "cannot get reset\n");
> > +		return PTR_ERR(vic->rst);
> > +	}
> > +
> > +	platform_set_drvdata(pdev, vic);
> > +
> > +	INIT_LIST_HEAD(&vic->client.base.list);
> > +	vic->client.base.ops =3D &vic_client_ops;
> > +	vic->client.base.dev =3D dev;
> > +	vic->client.base.class =3D HOST1X_CLASS_VIC;
> > +	vic->client.base.syncpts =3D syncpts;
> > +	vic->client.base.num_syncpts =3D 1;
> > +	vic->dev =3D dev;
> > +	vic->config =3D vic_config;
> > +
> > +	INIT_LIST_HEAD(&vic->client.list);
> > +	vic->client.ops =3D &vic_ops;
> > +
> > +	err =3D host1x_client_register(&vic->client.base);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to register host1x client: %d\n", err);
> > +		platform_set_drvdata(pdev, NULL);
> > +		return err;
> > +	}
> > +
> > +	pm_runtime_enable(&pdev->dev);
> > +	if (!pm_runtime_enabled(&pdev->dev)) {
> > +		err =3D vic_runtime_resume(&pdev->dev);
> > +		if (err < 0)
> > +			goto unregister_client;
> > +	}
>=20
> I don't see why pm_runtime_enable() should ever fail to enable
> pm_runtime here. Hence, the if-statement appears to be redundant. If you
> are trying to determine whether rpm is supported for the power-domains
> then you should simply check to see if the DT node for the device has
> the "power-domains" property. See my series [1].

Merely checking for a device tree property won't tell you anything.
There are no guarantees that some driver will make the power domains
available, even if they are defined in the DT.

Generally checking device tree properties is a bad idea. You should only
ever rely on whatever mechanism the operating system exposed as a result
of such properties instead.

Thierry

--vEk28Nl/eckWL8CC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVrMDkAAoJEN0jrNd/PrOh97oP/2iPceSROOFIPFwPjLE61j52
cbdt3yKpcNN0Fnt9V0VgmKsuM899+y0mZbW2S2+O0zAo8mDyDRauMXCHU6DKHyZi
1nBjQ4qsqDYaUrwojKpmrdRck2nP5o00jNq48wUc4/AlVH5edBevG3f9yS4E7QTX
fJRhpqF1UUNkO205TPta5260rYmS2U8PwRLZYNwZaB7TLj29qd8+HyRDSf8aCMnt
Hq7j6UZ+pUGLNhc7AzEhP+QRSkK0hwti2QQ3Td5fthJi/jvoUH7oFYXA4BV1zpq9
djNzprjGTdXRsgQbpA+Z2TR0yot1AvBguVbtrUh8kcUnrE2EbDZNEloYu/f31Hw2
/w6McobROH+w6fokK2Xow3S4Ljfy1xBOPgDvorGF/ODkLqCZELIFZbNlxzgXdbiF
ts1bCNvzxTIajEEJ3KcNm3gtJ5BRRfXBFMC7/wO1rmQRw0fH3iw148aDc+OLskOz
mcEymraeE9cy+LF4jZBd4CLn1ySpeWMCHXuJS+gvfhJyUC0NEE3CdnxCG56ta9If
xD9XhKspzdS8UJugNt5XyM2S9IzRArGD3BSqGPhE/CA0VnXibQu5wDm9rg1y4YhU
8Cf7kxTx9b67AuSxAUptm58MuGBnCq9VRap/QhwBYeTnDaAzasx3HCpppYtSMSNl
f/knZHbyjVykLylU2viq
=Q14P
-----END PGP SIGNATURE-----

--vEk28Nl/eckWL8CC--

--===============0424360525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0424360525==--
