From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH 3/5] ASoC: Tegra+ALC5632 machine: Add device tree
 binding documentation
Date: Tue, 31 Jan 2012 09:52:42 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178E124438@HQMAIL01.nvidia.com>
References: <1327995040-27152-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1327995040-27152-1-git-send-email-leon@leon.nu>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Leon Romanovsky <leon@leon.nu>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "lrg@ti.com" <lrg@ti.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "olof@lixom.net" <olof@lixom.net>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rdunlap@xenotime.net" <rdunlap@xenotime.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org

Leon Romanovsky wrote at Tuesday, January 31, 2012 12:31 AM:
> Document device tree binding for the tegra board with ALC5632 codec
> according to datasheet functional block description.

> diff --git a/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt

> +  ALC5632 pins:
> +
> +  * SPK_OUTP
> +  * SPK_OUTN
> +  * HP_OUT_L
> +  * HP_OUT_R
> +  * AUX_OUT_P
> +  * AUX_OUT_N

Sorry this is picky, but those are AUX_OUTP and AUX_OUTN in the block
diagram in the datasheet; only 1 underscore in the name.

Hmm, actually the block diagram and "pin assignment" diagram are
inconsistent, e.g. AUX_OUTP+AUX_OUTN in the block diagram vs.
AUX_OUT+AUX_OUTN in the pin assignment, or PHONE_N (block diagram) vs.
PHONEN (pin assignments).

Mark, do you care about this level of detail? I think we should use the
names in the pin assignments section if we do change this patch, but I
guess things are clear enough as it stands, so I'm not excessively
bothered.

> +  * LINE_IN_L
> +  * LINE_IN_R
> +  * PHONE_P
> +  * PHONE_N
> +  * MIC1_P
> +  * MIC1_N
> +  * MIC2_P
> +  * MIC2_N
> +  * MICBIAS1

-- 
nvpublic

