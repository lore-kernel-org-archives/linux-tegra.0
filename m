From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 2/9] ASoC: tegra: add support for CIF programming
Date: Wed, 5 Feb 2020 20:02:22 +0300
Message-ID: <7239e858-16b7-609f-c4e3-8135bee8450b@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-3-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1580380422-3431-3-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com
List-Id: linux-tegra@vger.kernel.org

30.01.2020 13:33, Sameer Pujar пишет:
...
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include "tegra_cif.h"
> +
> +void tegra_set_cif(struct regmap *regmap, unsigned int reg,
> +		   struct tegra_cif_conf *conf)
> +{
> +	unsigned int value;
> +
> +	value = (conf->threshold << TEGRA_ACIF_CTRL_FIFO_TH_SHIFT) |
> +		((conf->audio_ch - 1) << TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT) |
> +		((conf->client_ch - 1) << TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT) |
> +		(conf->audio_bits << TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT) |
> +		(conf->client_bits << TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT) |
> +		(conf->expand << TEGRA_ACIF_CTRL_EXPAND_SHIFT) |
> +		(conf->stereo_conv << TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT) |
> +		(conf->replicate << TEGRA_ACIF_CTRL_REPLICATE_SHIFT) |
> +		(conf->truncate << TEGRA_ACIF_CTRL_TRUNCATE_SHIFT) |
> +		(conf->mono_conv << TEGRA_ACIF_CTRL_MONO_CONV_SHIFT);
> +
> +	regmap_update_bits(regmap, reg, TEGRA_ACIF_UPDATE_MASK, value);
> +}
> +EXPORT_SYMBOL_GPL(tegra_set_cif);

Are you going to add more stuff into this source file later on?

If not, then it's too much to have a separate driver module just for a
single tiny function, you should move it into the header file (make it
inline).
