From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv4 2/2] ALSA: hda - Add driver for Tegra SoC HDA
Date: Mon, 21 Apr 2014 14:02:03 -0600
Message-ID: <5355793B.9040607@wwwdotorg.org>
References: <1397857578-9340-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397857578-9340-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: tiwai-l3A5Bk7waGM@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/18/2014 03:46 PM, Dylan Reid wrote:
> This adds a driver for the HDA block in Tegra SoCs.  The HDA bus is
> used to communicate with the HDMI codec on Tegra124.
> 
> Most of the code is re-used from the Intel/PCI HDA driver.  It brings
> over only two of the module params, power_save and probe_mask.

(I'm curious how this was tested using an upstream kernel considering we
don't have HDMI support on Tegra124 enabled yet. If you added 1 or 2
more CODEC IDs to patch 1/2, you could probably test on an earlier SoC
generation)

Sorry for the slow review...

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt

> +- compatible : "nvidia,tegra30-hda"
> +- reg : Should contain the HDA registers location and length.
> +- interrupts : The interrupt from the hda controller.

hda should be capitalized.

> +- clocks : Must contain an entry for each required entry in clock-names.

Can you add the following line after that for consistency with other
Tegra bindings:

See ../clocks/clock-bindings.txt for details.

> +- clock-names : Must include the following entries: hda, hdacodec_2x, hda2hdmi
> +- resets : Must contain an entry for each entry in reset-names.
> +  See ../reset/reset.txt for details.
> +- reset-names : Must include the following entries: hda, hdacodec_2x, hda2hdmi
> +
> +Example:
> +
> +hda@70030000 {

that should be named hda@0,70030000, since the reg property's value
below assumes the parent has #address-cells=<2>.

> +	compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
> +	reg = <0x0 0x70030000 0x10000>;

... and here, since #address-cells=<2>, then #size-cells should be 2
too, so that should be:

	reg = <0x0 0x70030000 0 0x10000>;

> diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig

> +config SND_HDA_TEGRA
> +	tristate "NVIDIA Tegra HD Audio"
> +	depends on OF && ARCH_TEGRA

OF is selected by ARCH_TEGRA, so this only needs to depend on ARCH_TEGRA.

(Of course, you could make this depend on ARCH_TEGRA || (COMPILE_TEST &&
OF && ...)

> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> +/*
> + *
> + * Implementation of primary alsa driver code base for NVIDIA Tegra HDA.

ALSA should be capitalized.

> +static void hda_tegra_init(struct hda_tegra *hda)
> +{
> +	u32 v;
> +
> +	/*Enable the PCI access */

There should be a space after /*.

> +static int hda_tegra_init_chip(struct azx *chip, struct platform_device *pdev)

> +	err = hda_tegra_enable_clocks(hda);
> +	if (err)
> +		return err;

I'm not sure where the matching disable() occurs? Is the card assumed to
be started in a powered state, so the next PM transition would be
hda_tegra_suspend()? IIRC, other Tegra devices with PM start in a
power-saved state, and hence would leave clocks stopped after probe().
It's fine if that's the reason; it just looks different so I'm making
sure that's what is going on.

> +static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)

> +	/* read number of streams from GCAP register instead of using
> +	 * hardcoded value
> +	 */
> +	chip->capture_streams = (gcap >> 8) & 0x0f;
> +	chip->playback_streams = (gcap >> 12) & 0x0f;
> +	if (!chip->playback_streams && !chip->capture_streams) {
> +		/* gcap didn't give any info, switching to old method */
> +		chip->playback_streams = ICH6_NUM_PLAYBACK;
> +		chip->capture_streams = ICH6_NUM_CAPTURE;

Are ICH6_* defines appropriate for Tegra?

> +static int hda_tegra_probe(struct platform_device *pdev)

> +	of_id = of_match_device(hda_tegra_match, &pdev->dev);
> +	if (!of_id)
> +		return -ENODEV;

Since of_id isn't used anywhere, there's no point calling
of_match_device() to look it up. The driver core won't call
hda_tegra_probe() unless there is a matching entry in the table.

> +MODULE_DEVICE_TABLE(of, tegra_platform_hda_match);

I think it's typical to put that line immediately after the table it
applies to. Not a big deal though.

With those minor issues fixed,
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
