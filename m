Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DA0C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 20:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbhLIU7o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 15:59:44 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:35830 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbhLIU7n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 15:59:43 -0500
Received: by mail-oi1-f173.google.com with SMTP id m6so10459253oim.2;
        Thu, 09 Dec 2021 12:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=IazrzJs2/LJl1VvPqobbOJ7LE1C9OqCjhrneR2UnyhM=;
        b=GxrgO1oLYMo9/lCBElhA/lpEROsRL2LokasquyGiAwcimZQBv3wSNhXZRyqrR2S2AH
         Qt+1LPTcWXwyCcoz6Fm3Lc+Uc+ni+YMOIWW5ZSY2T6DUtQNSb84NbTJKBrm3TGp+q5GI
         PjBpFIHTTEMrT5SmxxiumWnXXRQu3H0JtZQLXCdwfzM5axgXrs4yotvF2yA+lGh2pZXI
         z62M8e2tC9Cg0xXVBgKV7SdBKHS0SPyQ9XXGvjfvRTESzi2UuU3xVQ57vwJ65VqYUEYv
         K2GFxvUudKNe5hAZGMC19ttwnfbTFB47C4G+/wU5Na5M2gtoH9fsvTv3XkVQ0nZ0nX4V
         5Haw==
X-Gm-Message-State: AOAM532Ig+/GV/MQ/Rk/HQDbMIr9gfCoOPVE8/nLD1UPA5qzAip6hJAV
        JNR08bJX3svMI+B41MRYxQ==
X-Google-Smtp-Source: ABdhPJxc37a7v37s2G5pA+AODndPbxzWriYiymhWWrbJqxOKlZHTf/DiCDaNzK+NYTw8ObHpIPmT9Q==
X-Received: by 2002:a05:6808:f10:: with SMTP id m16mr8321152oiw.21.1639083368196;
        Thu, 09 Dec 2021 12:56:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 111sm169274otu.55.2021.12.09.12.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 12:56:07 -0800 (PST)
Received: (nullmailer pid 3925946 invoked by uid 1000);
        Thu, 09 Dec 2021 20:55:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-tegra@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@freescale.com>,
        linux-usb@vger.kernel.org, JC Kuo <jckuo@nvidia.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211209165339.614498-1-thierry.reding@gmail.com>
References: <20211209165339.614498-1-thierry.reding@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: chipidea: Convert to json-schema
Date:   Thu, 09 Dec 2021 14:55:59 -0600
Message-Id: <1639083359.686164.3925945.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 09 Dec 2021 17:53:36 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the ChipIdea USB2 bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/usb/chipidea,usb2.yaml           | 310 ++++++++++++++++++
>  .../devicetree/bindings/usb/ci-hdrc-usb2.txt  | 158 ---------
>  2 files changed, 310 insertions(+), 158 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1565842


usb@10024000: clock-names: ['ipg', 'ahb', 'per'] is not of type 'object'
	arch/arm/boot/dts/imx27-apf27dev.dt.yaml
	arch/arm/boot/dts/imx27-apf27.dt.yaml
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml
	arch/arm/boot/dts/imx27-pdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycore-rdk.dt.yaml

usb@10024000: clocks: [[1, 75], [1, 62], [1, 15]] is too long
	arch/arm/boot/dts/imx27-apf27dev.dt.yaml
	arch/arm/boot/dts/imx27-apf27.dt.yaml
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml
	arch/arm/boot/dts/imx27-pdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycore-rdk.dt.yaml

usb@10024000: clocks: Additional items are not allowed ([1, 62], [1, 15] were unexpected)
	arch/arm/boot/dts/imx27-apf27dev.dt.yaml
	arch/arm/boot/dts/imx27-apf27.dt.yaml
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml
	arch/arm/boot/dts/imx27-pdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycore-rdk.dt.yaml

usb@10024200: clock-names: ['ipg', 'ahb', 'per'] is not of type 'object'
	arch/arm/boot/dts/imx27-apf27dev.dt.yaml
	arch/arm/boot/dts/imx27-apf27.dt.yaml
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml
	arch/arm/boot/dts/imx27-pdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycore-rdk.dt.yaml

usb@10024200: clocks: [[1, 75], [1, 62], [1, 15]] is too long
	arch/arm/boot/dts/imx27-apf27dev.dt.yaml
	arch/arm/boot/dts/imx27-apf27.dt.yaml
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml
	arch/arm/boot/dts/imx27-pdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycore-rdk.dt.yaml

usb@10024200: clocks: Additional items are not allowed ([1, 62], [1, 15] were unexpected)
	arch/arm/boot/dts/imx27-apf27dev.dt.yaml
	arch/arm/boot/dts/imx27-apf27.dt.yaml
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml
	arch/arm/boot/dts/imx27-pdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycore-rdk.dt.yaml

usb@10024400: clock-names: ['ipg', 'ahb', 'per'] is not of type 'object'
	arch/arm/boot/dts/imx27-apf27dev.dt.yaml
	arch/arm/boot/dts/imx27-apf27.dt.yaml
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml
	arch/arm/boot/dts/imx27-pdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycore-rdk.dt.yaml

usb@10024400: clocks: [[1, 75], [1, 62], [1, 15]] is too long
	arch/arm/boot/dts/imx27-apf27dev.dt.yaml
	arch/arm/boot/dts/imx27-apf27.dt.yaml
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml
	arch/arm/boot/dts/imx27-pdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycore-rdk.dt.yaml

usb@10024400: clocks: Additional items are not allowed ([1, 62], [1, 15] were unexpected)
	arch/arm/boot/dts/imx27-apf27dev.dt.yaml
	arch/arm/boot/dts/imx27-apf27.dt.yaml
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml
	arch/arm/boot/dts/imx27-pdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dt.yaml
	arch/arm/boot/dts/imx27-phytec-phycore-rdk.dt.yaml

usb@12500000: clock-names: ['core', 'iface'] is not of type 'object'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12500000: clocks: [[12, 128], [12, 126]] is too long
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12500000: clocks: Additional items are not allowed ([12, 126] was unexpected)
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12500000: reg: [[307232768, 512], [307233280, 512]] is too long
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12500000: #reset-cells: [[1]] is not of type 'object'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12500000: reset-names:0: 'usb' was expected
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12500000: ulpi: 'compatible' is a required property
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12500000: ulpi: 'reg' is a required property
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12520000: clock-names: ['core', 'iface'] is not of type 'object'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12520000: clocks: [[12, 297], [12, 295]] is too long
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12520000: clocks: Additional items are not allowed ([12, 295] was unexpected)
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12520000: reg: [[307363840, 512], [307364352, 512]] is too long
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12520000: #reset-cells: [[1]] is not of type 'object'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12520000: reset-names:0: 'usb' was expected
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12520000: ulpi: 'compatible' is a required property
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml

usb@12520000: ulpi: 'reg' is a required property
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml

usb@12530000: clock-names: ['core', 'iface'] is not of type 'object'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12530000: clocks: [[12, 300], [12, 298]] is too long
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12530000: clocks: Additional items are not allowed ([12, 298] was unexpected)
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12530000: reg: [[307429376, 512], [307429888, 512]] is too long
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12530000: #reset-cells: [[1]] is not of type 'object'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12530000: reset-names:0: 'usb' was expected
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

usb@12530000: ulpi: 'compatible' is a required property
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml

usb@12530000: ulpi: 'reg' is a required property
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml

usb@2184000: adp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx6dl-yapp4-draco.dt.yaml
	arch/arm/boot/dts/imx6dl-yapp4-hydra.dt.yaml
	arch/arm/boot/dts/imx6dl-yapp4-orion.dt.yaml
	arch/arm/boot/dts/imx6dl-yapp4-ursa.dt.yaml
	arch/arm/boot/dts/imx6q-pistachio.dt.yaml
	arch/arm/boot/dts/imx6q-var-dt6customboard.dt.yaml
	arch/arm/boot/dts/imx6sll-evk.dt.yaml
	arch/arm/boot/dts/imx6sll-kobo-clarahd.dt.yaml
	arch/arm/boot/dts/imx6sll-kobo-librah2o.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine2hd.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine3.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-vision5.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s-43.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dt.yaml

usb@2184000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx6sl-evk.dt.yaml
	arch/arm/boot/dts/imx6sll-evk.dt.yaml
	arch/arm/boot/dts/imx6sll-kobo-clarahd.dt.yaml
	arch/arm/boot/dts/imx6sll-kobo-librah2o.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine2hd.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine3.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-vision5.dt.yaml
	arch/arm/boot/dts/imx6sl-warp.dt.yaml
	arch/arm/boot/dts/imx6sx-nitrogen6sx.dt.yaml
	arch/arm/boot/dts/imx6sx-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-mqs.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-sai.dt.yaml
	arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-full.dt.yaml
	arch/arm/boot/dts/imx6ul-14x14-evk.dt.yaml
	arch/arm/boot/dts/imx6ul-ccimx6ulsbcexpress.dt.yaml
	arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dt.yaml
	arch/arm/boot/dts/imx6ul-geam.dt.yaml
	arch/arm/boot/dts/imx6ul-isiot-emmc.dt.yaml
	arch/arm/boot/dts/imx6ul-isiot-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s-43.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s.dt.yaml
	arch/arm/boot/dts/imx6ull-14x14-evk.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ul-liteboard.dt.yaml
	arch/arm/boot/dts/imx6ull-myir-mys-6ulx-eval.dt.yaml
	arch/arm/boot/dts/imx6ull-opos6uldev.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-opos6uldev.dt.yaml
	arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-emmc.dt.yaml
	arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-dwarf.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-hobbit.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-pi.dt.yaml
	arch/arm/boot/dts/imx6ul-prti6g.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-0010.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-0011.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dt.yaml
	arch/arm/boot/dts/imx6ulz-14x14-evk.dt.yaml

usb@2184000: fsl,anatop: [[15]] is not of type 'object'
	arch/arm/boot/dts/imx6sll-kobo-librah2o.dt.yaml

usb@2184000: fsl,anatop: [[16]] is not of type 'object'
	arch/arm/boot/dts/imx6sll-kobo-clarahd.dt.yaml
	arch/arm/boot/dts/imx6ul-liteboard.dt.yaml

usb@2184000: fsl,anatop: [[17]] is not of type 'object'
	arch/arm/boot/dts/imx6sll-evk.dt.yaml
	arch/arm/boot/dts/imx6ull-myir-mys-6ulx-eval.dt.yaml

usb@2184000: fsl,anatop: [[18]] is not of type 'object'
	arch/arm/boot/dts/imx6ul-isiot-emmc.dt.yaml
	arch/arm/boot/dts/imx6ul-isiot-nand.dt.yaml
	arch/arm/boot/dts/imx6ulz-14x14-evk.dt.yaml

usb@2184000: fsl,anatop: [[20]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-full.dt.yaml

usb@2184000: fsl,anatop: [[21]] is not of type 'object'
	arch/arm/boot/dts/imx6ul-prti6g.dt.yaml

usb@2184000: fsl,anatop: [[23]] is not of type 'object'
	arch/arm/boot/dts/imx6ul-ccimx6ulsbcexpress.dt.yaml

usb@2184000: fsl,anatop: [[24]] is not of type 'object'
	arch/arm/boot/dts/imx6ul-kontron-n6310-s-43.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s.dt.yaml
	arch/arm/boot/dts/imx6ull-opos6uldev.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-dwarf.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-hobbit.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-pi.dt.yaml

usb@2184000: fsl,anatop: [[25]] is not of type 'object'
	arch/arm/boot/dts/imx6ul-geam.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-opos6uldev.dt.yaml
	arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-emmc.dt.yaml
	arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dt.yaml

usb@2184000: fsl,anatop: [[26]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-sabreauto.dt.yaml

usb@2184000: fsl,anatop: [[27]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-nitrogen6sx.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
	arch/arm/boot/dts/imx6ul-14x14-evk.dt.yaml
	arch/arm/boot/dts/imx6ull-14x14-evk.dt.yaml

usb@2184000: fsl,anatop: [[28]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-sdb.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-sai.dt.yaml

usb@2184000: fsl,anatop: [[29]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-sdb-mqs.dt.yaml

usb@2184000: fsl,anatop: [[30]] is not of type 'object'
	arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-0010.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-0011.dt.yaml

usb@2184000: fsl,anatop: [[33]] is not of type 'object'
	arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dt.yaml

usb@2184000: fsl,anatop: [[35]] is not of type 'object'
	arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dt.yaml

usb@2184000: hnp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx6dl-yapp4-draco.dt.yaml
	arch/arm/boot/dts/imx6dl-yapp4-hydra.dt.yaml
	arch/arm/boot/dts/imx6dl-yapp4-orion.dt.yaml
	arch/arm/boot/dts/imx6dl-yapp4-ursa.dt.yaml
	arch/arm/boot/dts/imx6q-pistachio.dt.yaml
	arch/arm/boot/dts/imx6q-var-dt6customboard.dt.yaml
	arch/arm/boot/dts/imx6sll-evk.dt.yaml
	arch/arm/boot/dts/imx6sll-kobo-clarahd.dt.yaml
	arch/arm/boot/dts/imx6sll-kobo-librah2o.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine2hd.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine3.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-vision5.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s-43.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dt.yaml

usb@2184000: srp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx6dl-yapp4-draco.dt.yaml
	arch/arm/boot/dts/imx6dl-yapp4-hydra.dt.yaml
	arch/arm/boot/dts/imx6dl-yapp4-orion.dt.yaml
	arch/arm/boot/dts/imx6dl-yapp4-ursa.dt.yaml
	arch/arm/boot/dts/imx6q-pistachio.dt.yaml
	arch/arm/boot/dts/imx6q-var-dt6customboard.dt.yaml
	arch/arm/boot/dts/imx6sll-evk.dt.yaml
	arch/arm/boot/dts/imx6sll-kobo-clarahd.dt.yaml
	arch/arm/boot/dts/imx6sll-kobo-librah2o.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine2hd.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine3.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-vision5.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s-43.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dt.yaml

usb@2184200: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx6sl-evk.dt.yaml
	arch/arm/boot/dts/imx6sll-evk.dt.yaml
	arch/arm/boot/dts/imx6sll-kobo-clarahd.dt.yaml
	arch/arm/boot/dts/imx6sll-kobo-librah2o.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine2hd.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine3.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-vision5.dt.yaml
	arch/arm/boot/dts/imx6sl-warp.dt.yaml
	arch/arm/boot/dts/imx6sx-nitrogen6sx.dt.yaml
	arch/arm/boot/dts/imx6sx-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-mqs.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-sai.dt.yaml
	arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-full.dt.yaml
	arch/arm/boot/dts/imx6ul-14x14-evk.dt.yaml
	arch/arm/boot/dts/imx6ul-ccimx6ulsbcexpress.dt.yaml
	arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dt.yaml
	arch/arm/boot/dts/imx6ul-geam.dt.yaml
	arch/arm/boot/dts/imx6ul-isiot-emmc.dt.yaml
	arch/arm/boot/dts/imx6ul-isiot-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s-43.dt.yaml
	arch/arm/boot/dts/imx6ul-kontron-n6310-s.dt.yaml
	arch/arm/boot/dts/imx6ull-14x14-evk.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dt.yaml
	arch/arm/boot/dts/imx6ul-liteboard.dt.yaml
	arch/arm/boot/dts/imx6ull-myir-mys-6ulx-eval.dt.yaml
	arch/arm/boot/dts/imx6ull-opos6uldev.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-opos6uldev.dt.yaml
	arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-emmc.dt.yaml
	arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-dwarf.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-hobbit.dt.yaml
	arch/arm/boot/dts/imx6ul-pico-pi.dt.yaml
	arch/arm/boot/dts/imx6ul-prti6g.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-0010.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-0011.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dt.yaml
	arch/arm/boot/dts/imx6ulz-14x14-evk.dt.yaml

usb@2184200: reset-gpios: [[21, 11, 0]] is not of type 'object'
	arch/arm/boot/dts/imx6q-dms-ba16.dt.yaml

usb@2184200: reset-gpios: [[22, 11, 0]] is not of type 'object'
	arch/arm/boot/dts/imx6q-b450v3.dt.yaml
	arch/arm/boot/dts/imx6q-b650v3.dt.yaml
	arch/arm/boot/dts/imx6q-b850v3.dt.yaml

usb@2184200: reset-gpios: [[39, 26, 1]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-nitrogen6sx.dt.yaml

usb@2184400: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx6sl-evk.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine2hd.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-shine3.dt.yaml
	arch/arm/boot/dts/imx6sl-tolino-vision5.dt.yaml
	arch/arm/boot/dts/imx6sl-warp.dt.yaml
	arch/arm/boot/dts/imx6sx-nitrogen6sx.dt.yaml
	arch/arm/boot/dts/imx6sx-sabreauto.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-mqs.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-sai.dt.yaml
	arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-full.dt.yaml

usb@2184400: fsl,anatop: [[20]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-udoo-neo-basic.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-extended.dt.yaml
	arch/arm/boot/dts/imx6sx-udoo-neo-full.dt.yaml

usb@2184400: fsl,anatop: [[26]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-sabreauto.dt.yaml

usb@2184400: fsl,anatop: [[27]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-nitrogen6sx.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml

usb@2184400: fsl,anatop: [[28]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-sdb.dt.yaml
	arch/arm/boot/dts/imx6sx-sdb-sai.dt.yaml

usb@2184400: fsl,anatop: [[29]] is not of type 'object'
	arch/arm/boot/dts/imx6sx-sdb-mqs.dt.yaml

usb@30b10000: adp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7s-mba7.dt.yaml

usb@30b10000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dt.yaml
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7d-meerkat96.dt.yaml
	arch/arm/boot/dts/imx7d-nitrogen7.dt.yaml
	arch/arm/boot/dts/imx7d-pico-dwarf.dt.yaml
	arch/arm/boot/dts/imx7d-pico-hobbit.dt.yaml
	arch/arm/boot/dts/imx7d-pico-nymph.dt.yaml
	arch/arm/boot/dts/imx7d-pico-pi.dt.yaml
	arch/arm/boot/dts/imx7d-remarkable2.dt.yaml
	arch/arm/boot/dts/imx7d-sbc-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-sdb.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-sht11.dt.yaml
	arch/arm/boot/dts/imx7d-zii-rmu2.dt.yaml
	arch/arm/boot/dts/imx7d-zii-rpu2.dt.yaml
	arch/arm/boot/dts/imx7s-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7s-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7s-mba7.dt.yaml
	arch/arm/boot/dts/imx7s-warp.dt.yaml

usb@30b10000: hnp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7s-mba7.dt.yaml

usb@30b10000: srp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7s-mba7.dt.yaml

usb@30b20000: adp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx7d-flex-concentrator.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dt.yaml
	arch/arm/boot/dts/imx7d-mba7.dt.yaml

usb@30b20000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dt.yaml
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7d-meerkat96.dt.yaml
	arch/arm/boot/dts/imx7d-nitrogen7.dt.yaml
	arch/arm/boot/dts/imx7d-pico-dwarf.dt.yaml
	arch/arm/boot/dts/imx7d-pico-hobbit.dt.yaml
	arch/arm/boot/dts/imx7d-pico-nymph.dt.yaml
	arch/arm/boot/dts/imx7d-pico-pi.dt.yaml
	arch/arm/boot/dts/imx7d-remarkable2.dt.yaml
	arch/arm/boot/dts/imx7d-sbc-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-sdb.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-sht11.dt.yaml
	arch/arm/boot/dts/imx7d-zii-rmu2.dt.yaml
	arch/arm/boot/dts/imx7d-zii-rpu2.dt.yaml

usb@30b20000: hnp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx7d-flex-concentrator.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dt.yaml
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7d-remarkable2.dt.yaml

usb@30b20000: srp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx7d-flex-concentrator.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dt.yaml
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7d-remarkable2.dt.yaml

usb@30b30000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dt.yaml
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7d-meerkat96.dt.yaml
	arch/arm/boot/dts/imx7d-nitrogen7.dt.yaml
	arch/arm/boot/dts/imx7d-pico-dwarf.dt.yaml
	arch/arm/boot/dts/imx7d-pico-hobbit.dt.yaml
	arch/arm/boot/dts/imx7d-pico-nymph.dt.yaml
	arch/arm/boot/dts/imx7d-pico-pi.dt.yaml
	arch/arm/boot/dts/imx7d-remarkable2.dt.yaml
	arch/arm/boot/dts/imx7d-sbc-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-sdb.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-sht11.dt.yaml
	arch/arm/boot/dts/imx7d-zii-rmu2.dt.yaml
	arch/arm/boot/dts/imx7d-zii-rpu2.dt.yaml
	arch/arm/boot/dts/imx7s-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7s-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7s-mba7.dt.yaml
	arch/arm/boot/dts/imx7s-warp.dt.yaml

usb@30b30000: power-domains: [[44]] is not of type 'object'
	arch/arm/boot/dts/imx7d-remarkable2.dt.yaml

usb@30b30000: power-domains: [[46]] is not of type 'object'
	arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml
	arch/arm/boot/dts/imx7d-sbc-imx7.dt.yaml

usb@30b30000: power-domains: [[47]] is not of type 'object'
	arch/arm/boot/dts/imx7d-zii-rmu2.dt.yaml

usb@30b30000: power-domains: [[52]] is not of type 'object'
	arch/arm/boot/dts/imx7d-flex-concentrator.dt.yaml
	arch/arm/boot/dts/imx7d-flex-concentrator-mfg.dt.yaml

usb@30b30000: power-domains: [[54]] is not of type 'object'
	arch/arm/boot/dts/imx7d-meerkat96.dt.yaml

usb@30b30000: power-domains: [[57]] is not of type 'object'
	arch/arm/boot/dts/imx7s-warp.dt.yaml

usb@30b30000: power-domains: [[63]] is not of type 'object'
	arch/arm/boot/dts/imx7d-pico-nymph.dt.yaml

usb@30b30000: power-domains: [[64]] is not of type 'object'
	arch/arm/boot/dts/imx7s-mba7.dt.yaml

usb@30b30000: power-domains: [[65]] is not of type 'object'
	arch/arm/boot/dts/imx7d-pico-dwarf.dt.yaml
	arch/arm/boot/dts/imx7d-pico-hobbit.dt.yaml
	arch/arm/boot/dts/imx7d-pico-pi.dt.yaml
	arch/arm/boot/dts/imx7d-sdb.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-reva.dt.yaml
	arch/arm/boot/dts/imx7d-sdb-sht11.dt.yaml

usb@30b30000: power-domains: [[66]] is not of type 'object'
	arch/arm/boot/dts/imx7d-mba7.dt.yaml
	arch/arm/boot/dts/imx7d-nitrogen7.dt.yaml

usb@30b30000: power-domains: [[74]] is not of type 'object'
	arch/arm/boot/dts/imx7d-zii-rpu2.dt.yaml

usb@30b30000: power-domains: [[78]] is not of type 'object'
	arch/arm/boot/dts/imx7s-colibri-aster.dt.yaml

usb@30b30000: power-domains: [[80]] is not of type 'object'
	arch/arm/boot/dts/imx7d-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-aster.dt.yaml

usb@30b30000: power-domains: [[82]] is not of type 'object'
	arch/arm/boot/dts/imx7s-colibri-eval-v3.dt.yaml

usb@30b30000: power-domains: [[84]] is not of type 'object'
	arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-eval-v3.dt.yaml

usb@32e40000: adp-disable: True is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml

usb@32e40000: clock-names: ['usb1_ctrl_root_clk'] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dt.yaml

usb@32e40000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dt.yaml

usb@32e40000: hnp-disable: True is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml

usb@32e40000: port: 'compatible' is a required property
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml

usb@32e40000: port: 'reg' is a required property
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml

usb@32e40000: power-domains: [[47]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dt.yaml

usb@32e40000: power-domains: [[53]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml

usb@32e40000: power-domains: [[54]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dt.yaml

usb@32e40000: power-domains: [[57]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml

usb@32e40000: power-domains: [[61]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dt.yaml

usb@32e40000: power-domains: [[64]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dt.yaml

usb@32e40000: power-domains: [[65]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dt.yaml

usb@32e40000: power-domains: [[66]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dt.yaml

usb@32e40000: power-domains: [[67]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml

usb@32e40000: power-domains: [[68]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dt.yaml

usb@32e40000: power-domains: [[71]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dt.yaml

usb@32e40000: srp-disable: True is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml

usb@32e40000: usb-role-switch: True is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dt.yaml

usb@32e50000: adp-disable: True is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml

usb@32e50000: clock-names: ['usb1_ctrl_root_clk'] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dt.yaml

usb@32e50000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dt.yaml

usb@32e50000: hnp-disable: True is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml

usb@32e50000: power-domains: [[50]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dt.yaml

usb@32e50000: power-domains: [[57]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dt.yaml

usb@32e50000: power-domains: [[58]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dt.yaml

usb@32e50000: power-domains: [[61]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml

usb@32e50000: power-domains: [[65]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dt.yaml

usb@32e50000: power-domains: [[67]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dt.yaml

usb@32e50000: power-domains: [[69]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dt.yaml

usb@32e50000: power-domains: [[70]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dt.yaml

usb@32e50000: power-domains: [[71]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dt.yaml

usb@32e50000: power-domains: [[75]] is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dt.yaml

usb@32e50000: srp-disable: True is not of type 'object'
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml

usb@40034000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/vf500-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/vf610-bk4.dt.yaml
	arch/arm/boot/dts/vf610-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/vf610-cosmic.dt.yaml
	arch/arm/boot/dts/vf610m4-colibri.dt.yaml
	arch/arm/boot/dts/vf610m4-cosmic.dt.yaml
	arch/arm/boot/dts/vf610-twr.dt.yaml
	arch/arm/boot/dts/vf610-zii-cfu1.dt.yaml
	arch/arm/boot/dts/vf610-zii-dev-rev-b.dt.yaml
	arch/arm/boot/dts/vf610-zii-dev-rev-c.dt.yaml
	arch/arm/boot/dts/vf610-zii-scu4-aib.dt.yaml
	arch/arm/boot/dts/vf610-zii-spb4.dt.yaml
	arch/arm/boot/dts/vf610-zii-ssmb-dtu.dt.yaml
	arch/arm/boot/dts/vf610-zii-ssmb-spu3.dt.yaml

usb@400b4000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/vf500-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/vf610-bk4.dt.yaml
	arch/arm/boot/dts/vf610-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/vf610-cosmic.dt.yaml
	arch/arm/boot/dts/vf610m4-colibri.dt.yaml
	arch/arm/boot/dts/vf610m4-cosmic.dt.yaml
	arch/arm/boot/dts/vf610-twr.dt.yaml
	arch/arm/boot/dts/vf610-zii-cfu1.dt.yaml
	arch/arm/boot/dts/vf610-zii-dev-rev-b.dt.yaml
	arch/arm/boot/dts/vf610-zii-dev-rev-c.dt.yaml
	arch/arm/boot/dts/vf610-zii-scu4-aib.dt.yaml
	arch/arm/boot/dts/vf610-zii-spb4.dt.yaml
	arch/arm/boot/dts/vf610-zii-ssmb-dtu.dt.yaml
	arch/arm/boot/dts/vf610-zii-ssmb-spu3.dt.yaml

usb@40330000: adp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx7ulp-com.dt.yaml
	arch/arm/boot/dts/imx7ulp-evk.dt.yaml

usb@40330000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx7ulp-com.dt.yaml
	arch/arm/boot/dts/imx7ulp-evk.dt.yaml

usb@40330000: hnp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx7ulp-com.dt.yaml
	arch/arm/boot/dts/imx7ulp-evk.dt.yaml

usb@40330000: srp-disable: True is not of type 'object'
	arch/arm/boot/dts/imx7ulp-com.dt.yaml
	arch/arm/boot/dts/imx7ulp-evk.dt.yaml

usb@53f80000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx50-evk.dt.yaml
	arch/arm/boot/dts/imx50-kobo-aura.dt.yaml
	arch/arm/boot/dts/imx53-ard.dt.yaml
	arch/arm/boot/dts/imx53-cx9020.dt.yaml
	arch/arm/boot/dts/imx53-kp-ddc.dt.yaml
	arch/arm/boot/dts/imx53-kp-hsc.dt.yaml
	arch/arm/boot/dts/imx53-m53evk.dt.yaml
	arch/arm/boot/dts/imx53-m53menlo.dt.yaml
	arch/arm/boot/dts/imx53-mba53.dt.yaml
	arch/arm/boot/dts/imx53-ppd.dt.yaml
	arch/arm/boot/dts/imx53-qsb.dt.yaml
	arch/arm/boot/dts/imx53-qsrb.dt.yaml
	arch/arm/boot/dts/imx53-smd.dt.yaml
	arch/arm/boot/dts/imx53-tx53-x03x.dt.yaml
	arch/arm/boot/dts/imx53-tx53-x13x.dt.yaml
	arch/arm/boot/dts/imx53-usbarmory.dt.yaml
	arch/arm/boot/dts/imx53-voipac-bsb.dt.yaml

usb@53f80200: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx50-evk.dt.yaml
	arch/arm/boot/dts/imx50-kobo-aura.dt.yaml
	arch/arm/boot/dts/imx53-ard.dt.yaml
	arch/arm/boot/dts/imx53-cx9020.dt.yaml
	arch/arm/boot/dts/imx53-kp-ddc.dt.yaml
	arch/arm/boot/dts/imx53-kp-hsc.dt.yaml
	arch/arm/boot/dts/imx53-m53evk.dt.yaml
	arch/arm/boot/dts/imx53-m53menlo.dt.yaml
	arch/arm/boot/dts/imx53-mba53.dt.yaml
	arch/arm/boot/dts/imx53-ppd.dt.yaml
	arch/arm/boot/dts/imx53-qsb.dt.yaml
	arch/arm/boot/dts/imx53-qsrb.dt.yaml
	arch/arm/boot/dts/imx53-smd.dt.yaml
	arch/arm/boot/dts/imx53-tx53-x03x.dt.yaml
	arch/arm/boot/dts/imx53-tx53-x13x.dt.yaml
	arch/arm/boot/dts/imx53-usbarmory.dt.yaml
	arch/arm/boot/dts/imx53-voipac-bsb.dt.yaml

usb@53f80400: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx53-ard.dt.yaml
	arch/arm/boot/dts/imx53-cx9020.dt.yaml
	arch/arm/boot/dts/imx53-kp-ddc.dt.yaml
	arch/arm/boot/dts/imx53-kp-hsc.dt.yaml
	arch/arm/boot/dts/imx53-m53evk.dt.yaml
	arch/arm/boot/dts/imx53-m53menlo.dt.yaml
	arch/arm/boot/dts/imx53-mba53.dt.yaml
	arch/arm/boot/dts/imx53-ppd.dt.yaml
	arch/arm/boot/dts/imx53-qsb.dt.yaml
	arch/arm/boot/dts/imx53-qsrb.dt.yaml
	arch/arm/boot/dts/imx53-smd.dt.yaml
	arch/arm/boot/dts/imx53-tx53-x03x.dt.yaml
	arch/arm/boot/dts/imx53-tx53-x13x.dt.yaml
	arch/arm/boot/dts/imx53-usbarmory.dt.yaml
	arch/arm/boot/dts/imx53-voipac-bsb.dt.yaml

usb@53f80600: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx53-ard.dt.yaml
	arch/arm/boot/dts/imx53-cx9020.dt.yaml
	arch/arm/boot/dts/imx53-kp-ddc.dt.yaml
	arch/arm/boot/dts/imx53-kp-hsc.dt.yaml
	arch/arm/boot/dts/imx53-m53evk.dt.yaml
	arch/arm/boot/dts/imx53-m53menlo.dt.yaml
	arch/arm/boot/dts/imx53-mba53.dt.yaml
	arch/arm/boot/dts/imx53-ppd.dt.yaml
	arch/arm/boot/dts/imx53-qsb.dt.yaml
	arch/arm/boot/dts/imx53-qsrb.dt.yaml
	arch/arm/boot/dts/imx53-smd.dt.yaml
	arch/arm/boot/dts/imx53-tx53-x03x.dt.yaml
	arch/arm/boot/dts/imx53-tx53-x13x.dt.yaml
	arch/arm/boot/dts/imx53-usbarmory.dt.yaml
	arch/arm/boot/dts/imx53-voipac-bsb.dt.yaml

usb@53ff4000: clock-names: ['ipg', 'ahb', 'per'] is not of type 'object'
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dt.yaml
	arch/arm/boot/dts/imx25-karo-tx25.dt.yaml
	arch/arm/boot/dts/imx25-pdk.dt.yaml
	arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dt.yaml
	arch/arm/boot/dts/imx35-pdk.dt.yaml

usb@53ff4000: clocks: [[2, 9], [2, 70], [2, 8]] is too long
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dt.yaml
	arch/arm/boot/dts/imx25-karo-tx25.dt.yaml
	arch/arm/boot/dts/imx25-pdk.dt.yaml

usb@53ff4000: clocks: [[2, 9], [2, 73], [2, 28]] is too long
	arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dt.yaml
	arch/arm/boot/dts/imx35-pdk.dt.yaml

usb@53ff4000: clocks: Additional items are not allowed ([2, 70], [2, 8] were unexpected)
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dt.yaml
	arch/arm/boot/dts/imx25-karo-tx25.dt.yaml
	arch/arm/boot/dts/imx25-pdk.dt.yaml

usb@53ff4000: clocks: Additional items are not allowed ([2, 73], [2, 28] were unexpected)
	arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dt.yaml
	arch/arm/boot/dts/imx35-pdk.dt.yaml

usb@53ff4000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dt.yaml
	arch/arm/boot/dts/imx25-karo-tx25.dt.yaml
	arch/arm/boot/dts/imx25-pdk.dt.yaml
	arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dt.yaml
	arch/arm/boot/dts/imx35-pdk.dt.yaml

usb@53ff4400: clock-names: ['ipg', 'ahb', 'per'] is not of type 'object'
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dt.yaml
	arch/arm/boot/dts/imx25-karo-tx25.dt.yaml
	arch/arm/boot/dts/imx25-pdk.dt.yaml
	arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dt.yaml
	arch/arm/boot/dts/imx35-pdk.dt.yaml

usb@53ff4400: clocks: [[2, 9], [2, 70], [2, 8]] is too long
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dt.yaml
	arch/arm/boot/dts/imx25-karo-tx25.dt.yaml
	arch/arm/boot/dts/imx25-pdk.dt.yaml

usb@53ff4400: clocks: [[2, 9], [2, 73], [2, 28]] is too long
	arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dt.yaml
	arch/arm/boot/dts/imx35-pdk.dt.yaml

usb@53ff4400: clocks: Additional items are not allowed ([2, 70], [2, 8] were unexpected)
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dt.yaml
	arch/arm/boot/dts/imx25-karo-tx25.dt.yaml
	arch/arm/boot/dts/imx25-pdk.dt.yaml

usb@53ff4400: clocks: Additional items are not allowed ([2, 73], [2, 28] were unexpected)
	arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dt.yaml
	arch/arm/boot/dts/imx35-pdk.dt.yaml

usb@53ff4400: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dt.yaml
	arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dt.yaml
	arch/arm/boot/dts/imx25-karo-tx25.dt.yaml
	arch/arm/boot/dts/imx25-pdk.dt.yaml
	arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dt.yaml
	arch/arm/boot/dts/imx35-pdk.dt.yaml

usb@73f80000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx51-apf51dev.dt.yaml
	arch/arm/boot/dts/imx51-apf51.dt.yaml
	arch/arm/boot/dts/imx51-babbage.dt.yaml
	arch/arm/boot/dts/imx51-digi-connectcore-jsk.dt.yaml
	arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dt.yaml
	arch/arm/boot/dts/imx51-ts4800.dt.yaml
	arch/arm/boot/dts/imx51-zii-rdu1.dt.yaml
	arch/arm/boot/dts/imx51-zii-scu2-mezz.dt.yaml
	arch/arm/boot/dts/imx51-zii-scu3-esb.dt.yaml

usb@73f80200: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx51-apf51dev.dt.yaml
	arch/arm/boot/dts/imx51-apf51.dt.yaml
	arch/arm/boot/dts/imx51-babbage.dt.yaml
	arch/arm/boot/dts/imx51-digi-connectcore-jsk.dt.yaml
	arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dt.yaml
	arch/arm/boot/dts/imx51-ts4800.dt.yaml
	arch/arm/boot/dts/imx51-zii-rdu1.dt.yaml
	arch/arm/boot/dts/imx51-zii-scu2-mezz.dt.yaml
	arch/arm/boot/dts/imx51-zii-scu3-esb.dt.yaml

usb@73f80400: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx51-apf51dev.dt.yaml
	arch/arm/boot/dts/imx51-apf51.dt.yaml
	arch/arm/boot/dts/imx51-babbage.dt.yaml
	arch/arm/boot/dts/imx51-digi-connectcore-jsk.dt.yaml
	arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dt.yaml
	arch/arm/boot/dts/imx51-ts4800.dt.yaml
	arch/arm/boot/dts/imx51-zii-rdu1.dt.yaml
	arch/arm/boot/dts/imx51-zii-scu2-mezz.dt.yaml
	arch/arm/boot/dts/imx51-zii-scu3-esb.dt.yaml

usb@73f80600: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx51-apf51dev.dt.yaml
	arch/arm/boot/dts/imx51-apf51.dt.yaml
	arch/arm/boot/dts/imx51-babbage.dt.yaml
	arch/arm/boot/dts/imx51-digi-connectcore-jsk.dt.yaml
	arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dt.yaml
	arch/arm/boot/dts/imx51-ts4800.dt.yaml
	arch/arm/boot/dts/imx51-zii-rdu1.dt.yaml
	arch/arm/boot/dts/imx51-zii-scu2-mezz.dt.yaml
	arch/arm/boot/dts/imx51-zii-scu3-esb.dt.yaml

usb@78d9000: adp-disable: True is not of type 'object'
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: clock-names: ['iface', 'core'] is not of type 'object'
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: clocks: [[19, 133], [19, 134]] is too long
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: clocks: Additional items are not allowed ([19, 134] was unexpected)
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: hnp-disable: True is not of type 'object'
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: interrupts: [[0, 134, 4], [0, 140, 4]] is too long
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: reg: [[126717952, 512], [126718464, 512]] is too long
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: #reset-cells: [[1]] is not of type 'object'
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: reset-names:0: 'usb' was expected
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: srp-disable: True is not of type 'object'
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: ulpi: 'compatible' is a required property
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@78d9000: ulpi: 'reg' is a required property
	arch/arm64/boot/dts/qcom/apq8016-sbc.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dt.yaml
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dt.yaml
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dt.yaml

usb@80080000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx23-evk.dt.yaml
	arch/arm/boot/dts/imx23-olinuxino.dt.yaml
	arch/arm/boot/dts/imx23-sansa.dt.yaml
	arch/arm/boot/dts/imx23-stmp378x_devb.dt.yaml
	arch/arm/boot/dts/imx23-xfi3.dt.yaml
	arch/arm/boot/dts/imx28-apf28dev.dt.yaml
	arch/arm/boot/dts/imx28-apf28.dt.yaml
	arch/arm/boot/dts/imx28-apx4devkit.dt.yaml
	arch/arm/boot/dts/imx28-cfa10036.dt.yaml
	arch/arm/boot/dts/imx28-cfa10037.dt.yaml
	arch/arm/boot/dts/imx28-cfa10049.dt.yaml
	arch/arm/boot/dts/imx28-cfa10055.dt.yaml
	arch/arm/boot/dts/imx28-cfa10056.dt.yaml
	arch/arm/boot/dts/imx28-cfa10057.dt.yaml
	arch/arm/boot/dts/imx28-cfa10058.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2-485.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2-enocean.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2-spi.dt.yaml
	arch/arm/boot/dts/imx28-duckbill.dt.yaml
	arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dt.yaml
	arch/arm/boot/dts/imx28-eukrea-mbmx287lc.dt.yaml
	arch/arm/boot/dts/imx28-evk.dt.yaml
	arch/arm/boot/dts/imx28-m28cu3.dt.yaml
	arch/arm/boot/dts/imx28-m28evk.dt.yaml
	arch/arm/boot/dts/imx28-sps1.dt.yaml
	arch/arm/boot/dts/imx28-ts4600.dt.yaml
	arch/arm/boot/dts/imx28-tx28.dt.yaml
	arch/arm/boot/dts/imx28-xea.dt.yaml

usb@80090000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/imx28-apf28dev.dt.yaml
	arch/arm/boot/dts/imx28-apf28.dt.yaml
	arch/arm/boot/dts/imx28-apx4devkit.dt.yaml
	arch/arm/boot/dts/imx28-cfa10036.dt.yaml
	arch/arm/boot/dts/imx28-cfa10037.dt.yaml
	arch/arm/boot/dts/imx28-cfa10049.dt.yaml
	arch/arm/boot/dts/imx28-cfa10055.dt.yaml
	arch/arm/boot/dts/imx28-cfa10056.dt.yaml
	arch/arm/boot/dts/imx28-cfa10057.dt.yaml
	arch/arm/boot/dts/imx28-cfa10058.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2-485.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2-enocean.dt.yaml
	arch/arm/boot/dts/imx28-duckbill-2-spi.dt.yaml
	arch/arm/boot/dts/imx28-duckbill.dt.yaml
	arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dt.yaml
	arch/arm/boot/dts/imx28-eukrea-mbmx287lc.dt.yaml
	arch/arm/boot/dts/imx28-evk.dt.yaml
	arch/arm/boot/dts/imx28-m28cu3.dt.yaml
	arch/arm/boot/dts/imx28-m28evk.dt.yaml
	arch/arm/boot/dts/imx28-sps1.dt.yaml
	arch/arm/boot/dts/imx28-ts4600.dt.yaml
	arch/arm/boot/dts/imx28-tx28.dt.yaml
	arch/arm/boot/dts/imx28-xea.dt.yaml

usb@e0002000: compatible: 'oneOf' conditional failed, one must be fixed:
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

usb@e0003000: compatible: 'oneOf' conditional failed, one must be fixed:
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

usb@f9a55000: adp-disable: True is not of type 'object'
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: clock-names: ['iface', 'core'] is not of type 'object'
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: clocks: [[23, 263], [23, 265]] is too long
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: clocks: Additional items are not allowed ([23, 265] was unexpected)
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: hnp-disable: True is not of type 'object'
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: phy-select: [[34, 45056, 0]] is not of type 'object'
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml

usb@f9a55000: phy-select: [[36, 45056, 1]] is not of type 'object'
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml

usb@f9a55000: phy-select: [[37, 45056, 0]] is not of type 'object'
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: phy-select: [[43, 45056, 0]] is not of type 'object'
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml

usb@f9a55000: phy-select: [[45, 45056, 0]] is not of type 'object'
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml

usb@f9a55000: reg: [[4188360704, 512], [4188361216, 512]] is too long
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: #reset-cells: [[1]] is not of type 'object'
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: reset-names:0: 'usb' was expected
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: srp-disable: True is not of type 'object'
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: ulpi: 'compatible' is a required property
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

usb@f9a55000: ulpi: 'reg' is a required property
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-samsung-klte.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dt.yaml
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dt.yaml

