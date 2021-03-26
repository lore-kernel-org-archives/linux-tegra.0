Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7580C433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 17:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93A0061A45
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 17:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhCZRqk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 13:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhCZRqZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 13:46:25 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC155C0613AA;
        Fri, 26 Mar 2021 10:46:24 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id hq27so9631178ejc.9;
        Fri, 26 Mar 2021 10:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qal3Pg1eWeJfJHjI4KXNgexM9zHNRBmG/njreZMtivI=;
        b=QuJ2bza2cq/NuzvNeZdfoYoxXlhoBwWSNLhaxQyJ3zbEZvnrczUAS++e4dPna1b9WD
         38h4nzoTHXm4pS13j3vIfJg3e33jKmMZ0htnSQHDrH4EUGX7Ue4Yls/wOInlumHDuuYN
         s3pRGBm3SreiEN4wAMrQE6hxYRfH9bDGls/kQaMteGCmgtZ2f5gHH31OakDq1Agm25VI
         9Qo2rsB0QdWkaZeTKrBOFr5xUGlBCdPeASaOv7KnAjqXuRdTU/gOqsp/b58j/6p44DqN
         dAAGU+U2NFzYoqNv7U9C5dB0TrWZPrWSaFxaWV96PCyk1DZhKuQhoHqfQ6JqtQvhE/H3
         1SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qal3Pg1eWeJfJHjI4KXNgexM9zHNRBmG/njreZMtivI=;
        b=nRUoPIeNBgcO37nJcfqBgB8SARkXoT9dgnbqUlwppqqgm0hMwC0X948Wfe/QT8ug4q
         WtaxFloTYca0nH4iOSR+4/Y6qgsNFeBcTCTpwjPX8mZbFk+fPcl6t8UO+mAS79NZPnGf
         4cLbvJR4DqegfZhJQlI15ETQVetETUGjXfWbBT5BU55+fxalb0nTLKDkEfXAhj0+GG30
         2OkBZ4pGky18FyfrJtAjZjnCWpADrMk/P0XSOwPS2HKOO4ZQ8kgb24pe5/8DrZ7tdzgw
         ELs7OOclsCRHJhmIi/ny5x6VF6rWUcJeUMbkszFwNBpagxecAlbbGtjBwVVjNU3H81my
         8kfQ==
X-Gm-Message-State: AOAM531UYxBOzouaQkUw06rlA71oI3FmxMB2fkdJ+qx5t2wQxhfpjQ2u
        XRI4BhSsJtqw9UJO2twnuarv1R6/x24=
X-Google-Smtp-Source: ABdhPJxqT5OFRIxUqeWkIzvSsn82iH4FejB56xDxIhAQDRV5unck8+ctoyB85StdMvG7O8XxXdO6mA==
X-Received: by 2002:a17:906:7d7:: with SMTP id m23mr16950005ejc.205.1616780782802;
        Fri, 26 Mar 2021 10:46:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t14sm4098559ejc.121.2021.03.26.10.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:46:21 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 0/3] arm64: tegra: Add earlycon support on Tegra194
Date:   Fri, 26 Mar 2021 18:46:38 +0100
Message-Id: <20210326174641.1612738-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Rob,

I've been looking at adding support for earlycon on Tegra194 which uses
the "combined UART" as console. This isn't a real device but rather is
composed of two mailboxes that are used to communicate with a processor
that multiplexes multiple data streams before they are sent over the HW
UART.

It's possible to make this work by passing earlycon with extra options
that select the TCU and pass a TX mailbox address, but I'd prefer if we
could also make this work without any options and instead infer the TX
mailbox address to use from /chosen/stdout-path. I can make that work
with the regular OF_EARLYCON_DECLARE and just a bit of additional code
to write data to the TX mailbox if I change the device tree node to take
a "reg" property. This set of patches implements those changes (there's
a separate patch to the tegra-tcu driver that adds OF_EARLYCON_DECLARE
and a bit of code, but it's not directly relevant to this discussion).

Given that this isn't a real device and the address in the "reg"
property is also a subset of the mailbox device that will take over for
the real console later on, I'm wondering if this is acceptable, even if
it is bending the rules a tiny bit.

The only other alternative I could think of would be to obtain the node
offset to the TCU node (either by passing it to the earlycon ->setup()
callback, or looking it up manually) and then parsing the mboxes
property and find the TX mailbox provider and then compute the TX
mailbox address. But that all seems very involved for something that we
can make work out of the box by simply adding this "reg" property, even
if it may not be strictly correct.

What do you think?

Thierry

Thierry Reding (3):
  dt-bindings: serial: tegra-tcu: Convert to json-schema
  dt-bindings: serial: tegra-tcu: Document "reg" property
  arm64: tegra: Add "reg" property for TCU on Tegra194

 .../bindings/serial/nvidia,tegra194-tcu.txt   | 35 -----------
 .../bindings/serial/nvidia,tegra194-tcu.yaml  | 60 +++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  4 +-
 3 files changed, 63 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
 create mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml

-- 
2.30.2

