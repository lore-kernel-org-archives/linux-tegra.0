Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA4AECAAD5
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 16:33:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbiIEQdM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 12:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbiIEQdJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 12:33:09 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7B22C660;
        Mon,  5 Sep 2022 09:33:06 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id t5so11952391edc.11;
        Mon, 05 Sep 2022 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=6TFP59nE0q4HUv8ZkVfRblTtjKpKsP4sx/tU+vV7vtg=;
        b=QdbMkvg263fL3UC60Vho6UW+iF/AcJ/+rEhNi0lt58zoQyumBmVnOv2DchdMSbX+ux
         ZrBEMxRrm85NsDQWDx0JaoBxJuY2hQU4dM7aYBJZnhkg3kf0KjRSgOC4EIsXR3pO8P+F
         UQrUDCeuPohJnGNb1nT4OIodUFvsmbipF1WFAogLh8X5zprE+C9BYh6vu9/t83/xtiHx
         bzrtCtJKnx9lIFHGpD0nUT0WexVpTfKW7tZrl8MOY9Y3lZ2r8jH94IbmXKg/S+4Lkv6T
         fagubxJivN5b8eqNgrAV+9DW2Pd06+NzqJNsMatpTZwSmD1kb5jWpuGpTgQl/mQeg9Ep
         zgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=6TFP59nE0q4HUv8ZkVfRblTtjKpKsP4sx/tU+vV7vtg=;
        b=CXE78pv6LdTHfmTDoHSMbrDVawm8PVvBZWHCh6tF+CjIdmbWtdpAaCdGJQoIgqB4o1
         GylcGiE5eTsodJQ/ZUVw/VJ1s+77QxovoxNPZTYF541fWvIxjRKRZ1D11LDSnyByfHLI
         EgVIciCWsUceCKbUUhQXYZiycA0BzhkO+0XdtyxrhEKX88SRxJZmG9iFL23P0Kv4kSqP
         m8VLA4q/C42lvhAtymb68DNGvuoKaAVr2feRrTeo70nKVCFynRs41LfovKEhIo1sdevI
         +m+I4Sag1gtmDbU9JLbIQM9mfjk4L6BeGDCnEifl68q5yl4LhwIXeYeZzyW3R5FlaHtH
         OzZA==
X-Gm-Message-State: ACgBeo3SU3Ao8YU231U5/knuA36VtJT2JhvfO2JgjLC3TxnasZBflcYK
        r4XVnYJ0M/GFiE+ZLDb6vbc=
X-Google-Smtp-Source: AA6agR7/WXJVurWceSqahcKJOJ9r9mouFITyPQ5DMwZ49+WkLim/W4jLwYyKVmLg3EuoJ5eITDRlsw==
X-Received: by 2002:a05:6402:26c5:b0:448:e46f:c9f1 with SMTP id x5-20020a05640226c500b00448e46fc9f1mr24412377edd.287.1662395584761;
        Mon, 05 Sep 2022 09:33:04 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060cc900b0073ce4abf093sm5239426ejh.214.2022.09.05.09.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 09:33:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/6] drm/simpledrm: Support system memory framebuffers
Date:   Mon,  5 Sep 2022 18:32:54 +0200
Message-Id: <20220905163300.391692-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this series of patches adds support for framebuffers residing in system
memory to the simple-framebuffer DRM driver. To do this, the DT bindings
are extended do accept the memory-region property in addition to the reg
property for specifying the framebuffer memory. This is done because the
framebuffer memory will typically also need to be marked as reserved so
that the operating system will not reuse it and the memory-region
property is the standard property to reference reserved memory regions.

A new compatible string is documented to annotate the framebuffer memory
regions and the simpledrm driver has code added to bind such annotated
regions to the simple-framebuffer device.

The second half of the series then adds support for the AB24 format and
ties it all together to provide a simple-framebuffer on Jetson Xavier
NX. It should be noted, though, that the Jetson Xavier NX device tree
nodes are an example only and ultimately these will be generated (or at
least filled in) at runtime because of the variable nature of the values
that they contain.

This example also uses (but doesn't depend on) the iommu-addresses
property that has been proposed and which will hopefully be merged soon.

Thierry

Thierry Reding (6):
  dt-bindings: display: simple-framebuffer: Support system memory
    framebuffers
  dt-bindings: reserved-memory: Support framebuffer reserved memory
  drm/simpledrm: Add support for system memory framebuffers
  drm/format-helper: Support the AB24 format
  drm/simpledrm: Support the AB24 format
  arm64: tegra: Add simple framebuffer on Jetson Xavier NX

 .../bindings/display/simple-framebuffer.yaml  |   5 +
 .../bindings/reserved-memory/framebuffer.yaml |  46 +++++
 .../nvidia/tegra194-p3509-0000+p3668-0001.dts |  32 ++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |   2 +-
 drivers/gpu/drm/drm_format_helper.c           |  35 ++++
 drivers/gpu/drm/tiny/simpledrm.c              | 167 ++++++++++++++----
 6 files changed, 255 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml

-- 
2.37.2

