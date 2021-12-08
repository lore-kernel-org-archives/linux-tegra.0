Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8EFC433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 13:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234661AbhLHNsS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 08:48:18 -0500
Received: from mail-oo1-f54.google.com ([209.85.161.54]:35442 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234648AbhLHNsN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 08:48:13 -0500
Received: by mail-oo1-f54.google.com with SMTP id e17-20020a4a8291000000b002c5ee0645e7so830625oog.2;
        Wed, 08 Dec 2021 05:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=UpRCZAKgTUGuI9WJ0ncb6g33tq6/jk8aL1sTpXyrnGM=;
        b=RirNHHMWVJwv8HtAN7PtByqUjTzINOAiRt9Qvjr47WFGwn2bP3wHClFPTlY1NesfiO
         9xzz6u8xQfK84iiAJi4hvgTF5/Pog55KfZvXJLDzBc9BzJv5lTQfRBW3TOcrfYGqFUsM
         QwuO+wuLpwe/R2VFCti98c8rg0HsU9gDr9dc1r75BQIcBrjrSPm2cjQFWmnYPXtIRqXu
         MmPVYH7BIPfvq0HqRxIAqgSkAwvIrOrvUAdB3ccsw+B8fzDRZPVRHO9jxGm4e2ntV6VA
         HYx0Df2Sp++a/wpJHLjSed7nT3v4QoyVrs6cDr7kJqmWgGcUTHZhhWz7XkNFRGc5tvol
         1dew==
X-Gm-Message-State: AOAM532JroFEg7nHNmTTwmpASVjauSNSMzV9BCZb7yKA5c7b5TZB24Dk
        GEIg8TYw3AN3aBvVofwwgg==
X-Google-Smtp-Source: ABdhPJyKfZNRxkjs+zNOOCqcA4ivPr0dyBOT7ppKcoLPhz1bh0fCfnzEQyc8vWsO4c2XrBCzIZBaWw==
X-Received: by 2002:a4a:96f1:: with SMTP id t46mr31024296ooi.53.1638971081467;
        Wed, 08 Dec 2021 05:44:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w71sm597383oiw.6.2021.12.08.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 05:44:40 -0800 (PST)
Received: (nullmailer pid 3857734 invoked by uid 1000);
        Wed, 08 Dec 2021 13:44:28 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20211207150746.444478-1-thierry.reding@gmail.com>
References: <20211207150746.444478-1-thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: pmu: Document Denver and Carmel PMUs
Date:   Wed, 08 Dec 2021 07:44:28 -0600
Message-Id: <1638971068.754546.3857733.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 07 Dec 2021 16:07:44 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add compatible strings for the NVIDIA Denver and Carmel PMUs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1564747


arm-pmu: compatible: Additional items are not allowed ('arm,armv8-pmuv3' was unexpected)
	arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2711-rpi-cm4-io.dt.yaml
	arch/arm/boot/dts/bcm2711-rpi-400.dt.yaml
	arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml
	arch/arm/boot/dts/bcm2711-rpi-cm4-io.dt.yaml

arm-pmu: compatible: ['arm,cortex-a72-pmu', 'arm,armv8-pmuv3'] is too long
	arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dt.yaml
	arch/arm64/boot/dts/broadcom/bcm2711-rpi-cm4-io.dt.yaml
	arch/arm/boot/dts/bcm2711-rpi-400.dt.yaml
	arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml
	arch/arm/boot/dts/bcm2711-rpi-cm4-io.dt.yaml

pmu@40089000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/vf500-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/vf610-bk4.dt.yaml
	arch/arm/boot/dts/vf610-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/vf610-cosmic.dt.yaml
	arch/arm/boot/dts/vf610-twr.dt.yaml
	arch/arm/boot/dts/vf610-zii-cfu1.dt.yaml
	arch/arm/boot/dts/vf610-zii-dev-rev-b.dt.yaml
	arch/arm/boot/dts/vf610-zii-dev-rev-c.dt.yaml
	arch/arm/boot/dts/vf610-zii-scu4-aib.dt.yaml
	arch/arm/boot/dts/vf610-zii-spb4.dt.yaml
	arch/arm/boot/dts/vf610-zii-ssmb-dtu.dt.yaml
	arch/arm/boot/dts/vf610-zii-ssmb-spu3.dt.yaml

pmu@54000000: 'reg', 'ti,hwmods' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am3517-craneboard.dt.yaml
	arch/arm/boot/dts/am3517-evm.dt.yaml
	arch/arm/boot/dts/am3517_mt_ventoux.dt.yaml
	arch/arm/boot/dts/logicpd-som-lv-37xx-devkit.dt.yaml
	arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dt.yaml
	arch/arm/boot/dts/omap3430-sdp.dt.yaml
	arch/arm/boot/dts/omap3-beagle.dt.yaml
	arch/arm/boot/dts/omap3-beagle-xm-ab.dt.yaml
	arch/arm/boot/dts/omap3-beagle-xm.dt.yaml
	arch/arm/boot/dts/omap3-cm-t3517.dt.yaml
	arch/arm/boot/dts/omap3-cm-t3530.dt.yaml
	arch/arm/boot/dts/omap3-cm-t3730.dt.yaml
	arch/arm/boot/dts/omap3-devkit8000.dt.yaml
	arch/arm/boot/dts/omap3-devkit8000-lcd43.dt.yaml
	arch/arm/boot/dts/omap3-devkit8000-lcd70.dt.yaml
	arch/arm/boot/dts/omap3-echo.dt.yaml
	arch/arm/boot/dts/omap3-evm-37xx.dt.yaml
	arch/arm/boot/dts/omap3-evm.dt.yaml
	arch/arm/boot/dts/omap3-gta04a3.dt.yaml
	arch/arm/boot/dts/omap3-gta04a4.dt.yaml
	arch/arm/boot/dts/omap3-gta04a5.dt.yaml
	arch/arm/boot/dts/omap3-gta04a5one.dt.yaml
	arch/arm/boot/dts/omap3-ha.dt.yaml
	arch/arm/boot/dts/omap3-ha-lcd.dt.yaml
	arch/arm/boot/dts/omap3-igep0020.dt.yaml
	arch/arm/boot/dts/omap3-igep0020-rev-f.dt.yaml
	arch/arm/boot/dts/omap3-igep0030.dt.yaml
	arch/arm/boot/dts/omap3-igep0030-rev-g.dt.yaml
	arch/arm/boot/dts/omap3-ldp.dt.yaml
	arch/arm/boot/dts/omap3-lilly-dbb056.dt.yaml
	arch/arm/boot/dts/omap3-n900.dt.yaml
	arch/arm/boot/dts/omap3-n950.dt.yaml
	arch/arm/boot/dts/omap3-n9.dt.yaml
	arch/arm/boot/dts/omap3-overo-alto35.dt.yaml
	arch/arm/boot/dts/omap3-overo-chestnut43.dt.yaml
	arch/arm/boot/dts/omap3-overo-gallop43.dt.yaml
	arch/arm/boot/dts/omap3-overo-palo35.dt.yaml
	arch/arm/boot/dts/omap3-overo-palo43.dt.yaml
	arch/arm/boot/dts/omap3-overo-storm-alto35.dt.yaml
	arch/arm/boot/dts/omap3-overo-storm-chestnut43.dt.yaml
	arch/arm/boot/dts/omap3-overo-storm-gallop43.dt.yaml
	arch/arm/boot/dts/omap3-overo-storm-palo35.dt.yaml
	arch/arm/boot/dts/omap3-overo-storm-palo43.dt.yaml
	arch/arm/boot/dts/omap3-overo-storm-summit.dt.yaml
	arch/arm/boot/dts/omap3-overo-storm-tobi.dt.yaml
	arch/arm/boot/dts/omap3-overo-storm-tobiduo.dt.yaml
	arch/arm/boot/dts/omap3-overo-summit.dt.yaml
	arch/arm/boot/dts/omap3-overo-tobi.dt.yaml
	arch/arm/boot/dts/omap3-overo-tobiduo.dt.yaml
	arch/arm/boot/dts/omap3-pandora-1ghz.dt.yaml
	arch/arm/boot/dts/omap3-pandora-600mhz.dt.yaml
	arch/arm/boot/dts/omap3-sbc-t3517.dt.yaml
	arch/arm/boot/dts/omap3-sbc-t3530.dt.yaml
	arch/arm/boot/dts/omap3-sbc-t3730.dt.yaml
	arch/arm/boot/dts/omap3-sniper.dt.yaml
	arch/arm/boot/dts/omap3-thunder.dt.yaml
	arch/arm/boot/dts/omap3-zoom3.dt.yaml

pmu_a57: compatible: Additional items are not allowed ('arm,armv8-pmuv3' was unexpected)
	arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dt.yaml

pmu_a57: compatible: ['arm,cortex-a57-pmu', 'arm,armv8-pmuv3'] is too long
	arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dt.yaml

pmu: compatible: Additional items are not allowed ('arm,armv8-pmuv3' was unexpected)
	arch/arm64/boot/dts/apm/apm-mustang.dt.yaml
	arch/arm64/boot/dts/cavium/thunder2-99xx.dt.yaml
	arch/arm64/boot/dts/cavium/thunder-88xx.dt.yaml
	arch/arm64/boot/dts/sprd/sp9860g-1h10.dt.yaml
	arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dt.yaml
	arch/arm64/boot/dts/synaptics/berlin4ct-stb.dt.yaml

pmu: compatible: ['apm,potenza-pmu', 'arm,armv8-pmuv3'] is too long
	arch/arm64/boot/dts/apm/apm-mustang.dt.yaml

pmu: compatible: ['arm,cortex-a53-pmu', 'arm,armv8-pmuv3'] is too long
	arch/arm64/boot/dts/sprd/sp9860g-1h10.dt.yaml
	arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dt.yaml
	arch/arm64/boot/dts/synaptics/berlin4ct-stb.dt.yaml

pmu: compatible: ['brcm,vulcan-pmu', 'arm,armv8-pmuv3'] is too long
	arch/arm64/boot/dts/cavium/thunder2-99xx.dt.yaml

pmu: compatible: ['cavium,thunder-pmu', 'arm,armv8-pmuv3'] is too long
	arch/arm64/boot/dts/cavium/thunder-88xx.dt.yaml

pmu_denver: compatible: Additional items are not allowed ('arm,armv8-pmuv3' was unexpected)
	arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dt.yaml

pmu_denver: compatible: ['nvidia,denver-pmu', 'arm,armv8-pmuv3'] is too long
	arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dt.yaml

pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/zynq-cc108.dt.yaml
	arch/arm/boot/dts/zynq-ebaz4205.dt.yaml
	arch/arm/boot/dts/zynq-microzed.dt.yaml
	arch/arm/boot/dts/zynq-parallella.dt.yaml
	arch/arm/boot/dts/zynq-zc702.dt.yaml
	arch/arm/boot/dts/zynq-zc706.dt.yaml
	arch/arm/boot/dts/zynq-zc770-xm010.dt.yaml
	arch/arm/boot/dts/zynq-zc770-xm011.dt.yaml
	arch/arm/boot/dts/zynq-zc770-xm012.dt.yaml
	arch/arm/boot/dts/zynq-zc770-xm013.dt.yaml
	arch/arm/boot/dts/zynq-zed.dt.yaml
	arch/arm/boot/dts/zynq-zturn.dt.yaml
	arch/arm/boot/dts/zynq-zturn-v5.dt.yaml
	arch/arm/boot/dts/zynq-zybo.dt.yaml
	arch/arm/boot/dts/zynq-zybo-z7.dt.yaml

pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_nand.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dt.yaml
	arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dt.yaml
	arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml
	arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml
	arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml
	arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml
	arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml
	arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml
	arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml
	arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml
	arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml
	arch/arm/boot/dts/socfpga_vt.dt.yaml

