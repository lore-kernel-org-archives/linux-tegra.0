From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ALSA: hda - Add driver for Tegra SoC HDA
Date: Wed, 9 Apr 2014 11:22:13 +0200
Message-ID: <20140409092211.GD9886@ulmo>
References: <1396984533-13900-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396984533-13900-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2014 at 12:15:33PM -0700, Dylan Reid wrote:
> This adds a driver for the HDA block in Tegra SoCs.  The HDA bus is
> used to communicate with the HDMI codec on Tegra124.
>=20
> Most of the code is re-used from the Intel/PCI HDA driver.  It brings
> over only two of thw module params, power_save and probe_mask.

s/thw/the/?

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra124-hda.=
txt b/Documentation/devicetree/bindings/sound/nvidia,tegra124-hda.txt
> new file mode 100644
> index 0000000..c9256d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra124-hda.txt
> @@ -0,0 +1,20 @@
> +NVIDIA Tegra124 HDA controller
> +
> +Required properties:
> +- compatible : "nvidia,tegra124-hda"

=46rom what I can tell this module hasn't changed significantly since
Tegra30 and therefore should be backwards compatible.

The convention so far has always been to name the document after the
first SoC generation that has the IP block. Similarily the driver should
match nvidia,tegra30-hda and use compatible strings for later SoC
generations.

Maybe an example will clarify what I mean:

	tegra30.dtsi:

		hda@70030000 {
			compatible =3D "nvidia,tegra30-hda";
			...
		};

	tegra124.dtsi:

		hda@70030000 {
			compatible =3D "nvidia,tegra124-hda", "nvidia,tegra30-hda";
			...
		};

I suspect that it will be fine if the driver only matched the compatible
string "nvidia,tegra30-hda" because the block hasn't changed since then.

> +- clocks : Must contain an entry for each required entry in clock-names.
> +- clock-names : Must include the following entries: hda, hdacodec_2x, hd=
a2hdmi

I think in addition to the clocks this will also need resets and
reset-names properties.

> --- a/sound/pci/hda/Kconfig
> +++ b/sound/pci/hda/Kconfig
> @@ -20,6 +20,20 @@ config SND_HDA_INTEL
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-hda-intel.
> =20
> +config SND_HDA_TEGRA
> +	tristate "Tegra HD Audio"

Perhaps "NVIDIA Tegra HD Audio"?

> +	select SND_HDA
> +	help
> +	  Say Y here to support the HDA controller present in Nvidia

Nit: While it's not used consistently everywhere, I'd prefer if we could
move towards using only "NVIDIA" rather than the current mix (which does
include "Nvidia" and "nVidia").

> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
[...]
> +#include <linux/clk.h>
> +#include <linux/clocksource.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/moduleparam.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/mutex.h>
> +#include <linux/reboot.h>
> +#include <linux/io.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/of_device.h>
> +#include <linux/time.h>
> +#include <linux/completion.h>
> +
> +#include <sound/core.h>
> +#include <sound/initval.h>
> +#include <linux/firmware.h>

The ordering looks weird here. I'd prefer these to be alphabetically
sorted.

> +#define DRV_NAME "tegra-hda"

This is only used in one place (in the platform_driver initialization),
so I don't think the #define is needed here.

> +/* Defines for Nvidia Tegra HDA support */
> +#define NVIDIA_TEGRA_HDA_BAR0_OFFSET           0x8000
> +
> +#define NVIDIA_TEGRA_HDA_CFG_CMD_OFFSET        0x1004
> +#define NVIDIA_TEGRA_HDA_CFG_BAR0_OFFSET       0x1010

I think the _OFFSET suffix here isn't required. It just makes the name
needlessly long. And since all of these definitions aren't visible
outside of this file, I think the NVIDIA_TEGRA_ prefix can be dropped as
well.

> +struct hda_tegra_data {

Perhaps just "hda_tegra"?

> +	struct azx chip;
> +	struct platform_device *pdev;

Can't this be simply struct device?

> +	struct clk **platform_clks;
> +	int platform_clk_count;

Why the "platform_" prefix? Also I'm not a huge fan of accumulating
clocks into an array like this. I'm not sure it has much of an advantage
code-wise, since there's quite a bit of setup code required to allocate
the array and populate it with the proper clocks.

> +	void __iomem *remap_config_addr;

This is a really long name. Perhaps simply "base" or "regs" would work
just as well?

> +};
> +
> +static int probe_mask[SNDRV_CARDS] =3D {[0 ... (SNDRV_CARDS-1)] =3D -1};
> +module_param_array(probe_mask, int, NULL, 0444);
> +MODULE_PARM_DESC(probe_mask, "Bitmask to probe codecs (default =3D -1)."=
);

Is this really necessary? Do we need this with Tegra? Can't we simply
assume that there's always only one codec? Or always use a probe_mask of
-1? Alternatively, wouldn't this be better off in DT?

> +static int power_save =3D CONFIG_SND_HDA_POWER_SAVE_DEFAULT;
> +static int *power_save_addr =3D &power_save;

Why keep this in a separate variable? It seems to me like you can simply
use &power_save directly at the one location where this is used?

> +module_param(power_save, bint, 0644);
> +MODULE_PARM_DESC(power_save,
> +		 "Automatic power-saving timeout (in seconds, 0 =3D disable).");

Thinking more about it, this seems like the thing you'd want for
something more generic such as PCI HDA where there may actually be more
variance. Is this still useful on Tegra?

> +/*
> + * DMA page allocation ops.
> + */
> +static int dma_alloc_pages(struct azx *chip,
> +			   int type,
> +			   size_t size,
> +			   struct snd_dma_buffer *buf)

This could be fewer lines:

	static int dma_alloc_pages(struct azx *chip, int type, size_t size,
				   struct snd_dma_buffer *buf)

> +{
> +	return snd_dma_alloc_pages(type,
> +				   chip->card->dev,
> +				   size, buf);

This fits perfectly on a single line.

> +/*
> + * Register access ops. Tegra HDA register access is DWORD only.
> + */
> +#define MASK_LONG_ALIGN		0x3UL
> +#define SHIFT_BYTE		3

I think these are obvious enough not to require symbolic names.

> +#define SHIFT_BITS(addr)	\
> +	(((unsigned int)(addr) & MASK_LONG_ALIGN) << SHIFT_BYTE)
> +#define ADDR_ALIGN_L(addr)	\
> +	(void *)((unsigned int)(addr) & ~MASK_LONG_ALIGN)

Can you use ALIGN() or PTR_ALIGN() here?

> +#define MASK(bits)		(BIT(bits) - 1)
> +#define MASK_REG(addr, bits)	(MASK(bits) << SHIFT_BITS(addr))
> +
> +static void tegra_hda_writel(u32 value, u32 *addr)
> +{
> +	writel(value, addr);
> +}
> +
> +static u32 tegra_hda_readl(u32 *addr)
> +{
> +	return readl(addr);
> +}
> +
> +static void tegra_hda_writew(u16 value, u16 *addr)
> +{
> +	unsigned int shift_bits =3D SHIFT_BITS(addr);
> +	writel((readl(ADDR_ALIGN_L(addr)) & ~MASK_REG(addr, 16)) |
> +	       ((value) << shift_bits), ADDR_ALIGN_L(addr));
> +}
> +
> +static u16 tegra_hda_readw(u16 *addr)
> +{
> +	return (readl(ADDR_ALIGN_L(addr)) >> SHIFT_BITS(addr)) & MASK(16);
> +}
> +
> +static void tegra_hda_writeb(u8 value, u8 *addr)
> +{
> +	writel((readl(ADDR_ALIGN_L(addr)) & ~MASK_REG(addr, 8)) |
> +	       ((value) << SHIFT_BITS(addr)), ADDR_ALIGN_L(addr));
> +}
> +
> +static u8 tegra_hda_readb(u8 *addr)
> +{
> +	return (readl(ADDR_ALIGN_L(addr)) >> SHIFT_BITS(addr)) & MASK(8);
> +}

It took me a really long time to review this and resolving all these
references. Can we not make this simpler somehow? Perhaps unwinding this
a bit may help, like this:

	static void tegra_hda_writew(u16 value, u16 *addr)
	{
		unsigned long shift =3D (addr & 0x3) << 3;
		unsigned long address =3D addr & ~0x3;
		u32 v;

		v =3D readl(address);
		v &=3D ~(0xffff << shift);
		v |=3D value << shift;
		writel(v, address);
	}

> +static const struct hda_controller_ops tegra_hda_reg_ops =3D {

Since these aren't only register operations, perhaps "tegra_hda_ops"?

> +static int tegra_hda_acquire_irq(struct azx *chip, int do_disconnect)

Shouldn't do_disconnect be bool?

> +{
> +	struct hda_tegra_data *tdata =3D

Nit: tdata is somewhat generic, perhaps simply call this "hda"?

> +		container_of(chip, struct hda_tegra_data, chip);

This pattern is repeated a few times, so perhaps add a helper such as:

	static inline struct hda_tegra *to_hda_tegra(struct azx *chip)
	{
		return container_of(chip, struct hda_tegra, chip);
	}

> +	int irq_id =3D platform_get_irq(tdata->pdev, 0);

I think this should be part of tegra_hda_probe().

> +	if (devm_request_irq(chip->card->dev, irq_id, azx_interrupt,
> +			     IRQF_SHARED, KBUILD_MODNAME, chip)) {

Perhaps store the error so that you can return (and print) the exact
error code?

> +		dev_err(chip->card->dev,
> +			"unable to grab IRQ %d, disabling device\n",

s/grab/request/?

> +static void tegra_hda_reg_update_bits(void __iomem *base, unsigned int r=
eg,
> +				      unsigned int mask, unsigned int val)
> +{
> +	unsigned int data;
> +
> +	data =3D readl(base + reg);
> +	data &=3D ~mask;
> +	data |=3D (val & mask);
> +	writel(data, base + reg);
> +}
> +
> +static void hda_tegra_init(struct hda_tegra_data *tdata)
> +{
> +	/*Enable the PCI access */
> +	tegra_hda_reg_update_bits(tdata->remap_config_addr,
> +				  NVIDIA_TEGRA_HDA_IPFS_CONFIG,
> +				  NVIDIA_TEGRA_HDA_IPFS_EN_FPCI,
> +				  NVIDIA_TEGRA_HDA_IPFS_EN_FPCI);

I prefer explicit read-modify-write sequences...

> +	/* Enable MEM/IO space and bus master */
> +	tegra_hda_reg_update_bits(tdata->remap_config_addr,
> +				  NVIDIA_TEGRA_HDA_CFG_CMD_OFFSET, 0x507,

=2E.. because it makes it easier to see that 0x507 is actually a mask and
should get a symbolic name too, to make it obvious what fields are being
cleared.

> +				  NVIDIA_TEGRA_HDA_ENABLE_MEM_SPACE |
> +				  NVIDIA_TEGRA_HDA_ENABLE_IO_SPACE |
> +				  NVIDIA_TEGRA_HDA_ENABLE_BUS_MASTER |
> +				  NVIDIA_TEGRA_HDA_ENABLE_SERR);
> +	tegra_hda_reg_update_bits(tdata->remap_config_addr,
> +				  NVIDIA_TEGRA_HDA_CFG_BAR0_OFFSET, 0xFFFFFFFF,
> +				  NVIDIA_TEGRA_HDA_BAR0_INIT_PROGRAM);

Also these are just plain writes, so no need to actually clear the
register first.

> +
> +	return;

Unnecessary return statement.

> +static void hda_tegra_enable_clocks(struct hda_tegra_data *data)
> +{
> +	int i;

If you really insist on keeping the clock array, then this should be
unsigned int.

> +static int tegra_hda_runtime_resume(struct device *dev)
> +{
> +	struct snd_card *card =3D dev_get_drvdata(dev);
> +	struct azx *chip =3D card->private_data;
> +	struct hda_bus *bus;

I don't think this particular temporary gains much.

> +static const struct dev_pm_ops azx_pm =3D {

Perhaps tegra_hda_pm since these are Tegra-specific?

> +static int tegra_hda_free(struct azx *chip)
> +{
> +	int i;
> +
> +	if (chip->running)
> +		pm_runtime_get_noresume(chip->card->dev);
> +
> +	tegra_hda_notifier_unregister(chip);
> +
> +	if (chip->initialized) {
> +		for (i =3D 0; i < chip->num_streams; i++)
> +			azx_stream_stop(chip, &chip->azx_dev[i]);
> +		azx_stop_chip(chip);
> +	}
> +
> +	azx_free_stream_pages(chip);
> +
> +	return 0;
> +}
> +
> +static int tegra_hda_dev_free(struct snd_device *device)
> +{
> +	return tegra_hda_free(device->device_data);
> +}

These can be merged, since tegra_hda_free() isn't used elsewhere.

> +static int hda_tegra_init_chip(struct azx *chip)
> +{
> +	struct hda_tegra_data *tdata =3D
> +		container_of(chip, struct hda_tegra_data, chip);
> +	struct device *dev =3D &tdata->pdev->dev;
> +	struct resource *res, *region;
> +	int i;
> +
> +	tdata->platform_clk_count =3D ARRAY_SIZE(tegra_clk_names);
> +	tdata->platform_clks =3D devm_kzalloc(dev,
> +					    tdata->platform_clk_count *
> +						sizeof(*tdata->platform_clks),
> +					    GFP_KERNEL);

That's devm_kcalloc().

> +	res =3D platform_get_resource(tdata->pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;
> +
> +	region =3D devm_request_mem_region(dev, res->start,
> +					 resource_size(res),
> +					 tdata->pdev->name);
> +	if (!region)
> +		return -ENOMEM;
> +
> +	chip->addr =3D res->start;
> +	chip->remap_addr =3D devm_ioremap(dev, res->start, resource_size(res));
> +	if (!chip->remap_addr)
> +		return -ENXIO;

All of the above can be rewritten as:

	res =3D platform_get_resource(tdata->pdev, IORESOURCE_MEM, 0);
	chip->remap_addr =3D devm_ioremap_resource(dev, res);
	if (IS_ERR(chip->remap_addr))
		return PTR_ERR(chip->remap_addr);

	chip->addr =3D res->start;

> +	tdata->remap_config_addr =3D chip->remap_addr;
> +	chip->remap_addr +=3D NVIDIA_TEGRA_HDA_BAR0_OFFSET;
> +	chip->addr +=3D NVIDIA_TEGRA_HDA_BAR0_OFFSET;

Perhaps a more intuitive way to write this would be (including my rename
suggestions):

	hda->regs =3D devm_ioremap_resource(...);
	...

	chip->remap_addr =3D hda->regs + NVIDIA_TEGRA_HDA_BAR0_OFFSET;
	chip->addr =3D res->start + NVIDIA_TEGRA_HDA_BAR0_OFFSET;

> +
> +	hda_tegra_enable_clocks(tdata);
> +
> +	hda_tegra_init(tdata);

Shouldn't both of these return an error which can be propagated on
failure?

> +static void power_down_all_codecs(struct azx *chip)
> +{
> +	/* The codecs were powered up in snd_hda_codec_new().
> +	 * Now all initialization done, so turn them down if possible
> +	 */
> +	struct hda_codec *codec;

Nit: Perhaps put the variable declaration before the comment. Or
alternatively put the comment above the function.

Also block comments are usually of this format:

	/*
	 * bla...
	 * ... bla.
	 */

> +static int tegra_hda_first_init(struct azx *chip)
> +{
> +	struct snd_card *card =3D chip->card;
> +	int err;
> +	unsigned short gcap;
> +
> +	err =3D hda_tegra_init_chip(chip);
> +	if (err)
> +		return err;
> +
> +	if (tegra_hda_acquire_irq(chip, 0) < 0)
> +		return -EBUSY;

Why not propagate whatever tegra_hda_acquire_irq() returned?

> +	synchronize_irq(chip->irq);
> +
> +	gcap =3D azx_readw(chip, GCAP);
> +	dev_dbg(card->dev, "chipset global capabilities =3D 0x%x\n", gcap);
> +
> +	/* read number of streams from GCAP register instead of using
> +	 * hardcoded value
> +	 */
> +	chip->capture_streams =3D (gcap >> 8) & 0x0f;
> +	chip->playback_streams =3D (gcap >> 12) & 0x0f;
> +	if (!chip->playback_streams && !chip->capture_streams) {
> +		/* gcap didn't give any info, switching to old method */
> +		chip->playback_streams =3D ICH6_NUM_PLAYBACK;
> +		chip->capture_streams =3D ICH6_NUM_CAPTURE;
> +	}
> +	chip->capture_index_offset =3D 0;
> +	chip->playback_index_offset =3D chip->capture_streams;
> +	chip->num_streams =3D chip->playback_streams + chip->capture_streams;
> +	chip->azx_dev =3D devm_kzalloc(card->dev,
> +				     chip->num_streams * sizeof(*chip->azx_dev),
> +				     GFP_KERNEL);

devm_kcalloc()

> +	strcpy(card->driver, "HDA-Tegra");

Perhaps this should match the driver name ("tegra-hda")?

> +/*
> + * constructor
> + */
> +static int tegra_hda_create(struct snd_card *card,
> +			    int dev,
> +			    struct platform_device *pdev,
> +			    unsigned int driver_caps,
> +			    const struct hda_controller_ops *hda_ops,
> +			    struct hda_tegra_data *tdata)

This could be fewer lines.

> +	err =3D snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
> +	if (err < 0) {
> +		dev_err(card->dev, "Error creating device [card]!\n");

Perhaps drop "[card]"? Also I don't think the exclamation mark is
required. It's already an error message.

> +static unsigned int tegra_driver_flags =3D AZX_DCAPS_RIRB_DELAY |
> +					 AZX_DCAPS_PM_RUNTIME;

Perhaps a slightly more future-proof way of doing this would be by
adding a structure, like this:

	struct tegra_hda_soc_info {
		unsigned long flags;
	};

And then instantiate that per SoC:

	static const struct tegra_hda_soc_info tegra124_hda_soc_info =3D {
		.flags =3D ...;
	};

Although looking at the above AZX_* flags, they don't seem to be SoC-
but but rather driver-specific, so they don't really belong in the OF
device match table.

> +static const struct of_device_id tegra_platform_hda_match[] =3D {

Why not simply "tegra_hda_match"?

> +	{ .compatible =3D "nvidia,tegra124-hda", .data =3D &tegra_driver_flags =
},
> +	{},
> +};
> +
> +static int hda_tegra_probe(struct platform_device *pdev)

There seems to be a mix between hda_tegra_ and tegra_hda_ prefixes
throughout the driver. I like it when these are consistent because it is
easier to refer to the functions (you don't always have to remember
which function has which prefix).

> +{
> +	static int dev;
> +	struct snd_card *card;
> +	struct azx *chip;
> +	struct hda_tegra_data *tdata;
> +	const struct of_device_id *of_id;
> +	const unsigned int *driver_data;
> +	int err;
> +
> +	if (dev >=3D SNDRV_CARDS)
> +		return -ENODEV;

I'd really like to avoid this. But I also realize that this is something
inherited from the sound subsystem, so I'm unsure about how easy it is
to get rid of it.

> +	of_id =3D of_match_device(tegra_platform_hda_match, &pdev->dev);
> +	if (!of_id)
> +		return -EINVAL;

Perhaps -ENODEV?

> +	dev_set_drvdata(&pdev->dev, card);

platform_set_drvdata()?

> +static struct platform_driver tegra_platform_hda =3D {
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.owner =3D THIS_MODULE,

This is no longer required.

> +		.pm =3D &azx_pm,
> +		.of_match_table =3D tegra_platform_hda_match,
> +	},
> +	.probe =3D hda_tegra_probe,
> +	.remove =3D hda_tegra_remove,
> +};
> +module_platform_driver(tegra_platform_hda);
> +
> +MODULE_DESCRIPTION("Tegra HDA bus driver");
> +MODULE_LICENSE("GPL v2");

The file header says "GPL v2 or later", so either this or the header
needs to be updated.

> +MODULE_DEVICE_TABLE(of, tegra_platform_hda_match);

I think it's more idiomatic to put this directly below the OF match
table.

Thierry

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTRRFDAAoJEN0jrNd/PrOhT8EP/3KarAzJJ+1zWkUg3Bard8h1
uG8PEcX3UsyBMw1nLYA/VB230bGnTRqX9ozDnWQCMq3N/SXNLDilmlAyJjO8RU2C
alpKg06JyHbtVhbgRn/J96ztbmdh5tcr0Qjpsh9mSmSyAyfsXJkr+TowZRIZLto3
Bx+3b7cZv7+Um3ZpIXA5feRkMdSi5LadYjxDVDrK3NHb5UCtaDkI6B/94EiTJELU
2qIb3MIg7JMigTFgcYmtt3Kfw0Iy/K6dTeZVuyaKaDk2G7YHKgfimHdCSjx5nivq
rd+UTmkRcIjDIgj/0dMRqMtnNXU25D1QO2y9KLSHT91R+/Es38dg4aen8+sfdDKR
nQSPE2wZv5b5bQNAJ71E09pLH5fP4Cfz1ajA+cylj3vqAo7DftTOh53RShSEIdQP
naaIhmKhhe0v8xQFhv2d7jWSxPnaNcG0GFxIZVwUpwCK7ucDrzhC80xjnV3ru0J9
pQmbxrMFE3jojsVGiToRTJTYTp3FJV850FhFT8PTI0aWAoJ4Zw5bpiU6tQlTi/MC
5FyqoSW/V4GP5Ku9HBrXQp5jk3uxT++milgGpMe4/en3+amf2d9qPPUcdyNepCDh
LEqlyT8cMLebORFpOUsR6MpJVA6cngua2dUGx4/knJggcfQNpE0823maePQKl1Gw
LxW7aZviqGwbl09bK8Wc
=/4n2
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--
