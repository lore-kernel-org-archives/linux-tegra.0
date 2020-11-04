Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF48C4742C
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D6FE2236F
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6tIr6aW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730162AbgKDONI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730074AbgKDONH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 09:13:07 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73117C0613D3
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 06:13:07 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id 11so3564040ljf.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 06:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/g46Gh/ST4XdLnJpFnEbsWdi7u+/l5AqrrDn+PLVd+M=;
        b=P6tIr6aWCzYKp+3gnBjXD9nJT858mFLyQy1mUWpTApuPIEbtr9dLYONo3JOXZZ0jau
         rJVCmxvpxoLDB8zCJLB3BoU1IdwYhh/mMYf7YA09bfVDUZtGGeXgrH0SrrrbHZWcrMh4
         rV3v5SdJFVY2eK9XSXNG51KJWcuEMQ+y8Ld/PckhB+av70KnZh+nULQMS0tbeakCiUXq
         P0X11H53wUrc5w8DTgfKee/WJtItijp5Viu2lAlDAujSMGFKg4up1aUVGEJI21lfrrlF
         msrOLGTexhQ8EHGwncu4TDwe+rK4qzh985IR6SjP5w3RqFCvcWBfqSoMyDoTTFuzVAvX
         4u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/g46Gh/ST4XdLnJpFnEbsWdi7u+/l5AqrrDn+PLVd+M=;
        b=I6eVkWCjuMWdvkl9PmipU8deyi2c5419bFaBde4JNBUTG30YP5+q35BsyxnoY5QQ0k
         WBt1MeUEu41WC0r+QMNNZMb16AwcfxZpUPXT7xUC2qrYCn5s5GSAa+xlsZoVytJhLU78
         PB1WqztXnSNe6FNg5C9edDWAQuIa+22xcoFUt3iOFgwVpg+4hfnv7Fy258XPm4NiHe0Z
         Tu4TDKlp1B+PaORPH5Qk+VsI3EmAwybO0CZXS6VwDqvrAhViy7N3xcA3Jtyjqjoj+YQ0
         0kqXVlcELqVlx6ETDGxvXsa76kwwcnXM0/K0U0dEIQIF9Ly/CyCpmT9awWHsCj/Zh3gI
         0vdg==
X-Gm-Message-State: AOAM531QknU6rwCKiSD9k8eGze+2K2c3cpYYhUYXev548KBfLAJigGaT
        ll15g/Rjv2mmGlBpAo5iHEs=
X-Google-Smtp-Source: ABdhPJw2zUKGAq27RxIpecbZk0ixA6E6lIgP2Pn7TC+kLobBKO0QBvdx5OIpIZcM3CZCBzT57m9efA==
X-Received: by 2002:a2e:a375:: with SMTP id i21mr10607829ljn.135.1604499186017;
        Wed, 04 Nov 2020 06:13:06 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id z10sm411853lfi.76.2020.11.04.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:13:05 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/8] ARM: tegra: nexus7: Add power-supply to lvds-encoder node
Date:   Wed,  4 Nov 2020 17:12:48 +0300
Message-Id: <20201104141251.25834-6-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104141251.25834-1-digetx@gmail.com>
References: <20201104141251.25834-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The lvds-encoder binding now supports power-supply property, let's specify
it in the device-tree for completeness.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index adc708bbfb62..c2b1229f0d83 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1172,6 +1172,7 @@ lvds-encoder {
 		compatible = "ti,sn75lvds83", "lvds-encoder";
 
 		powerdown-gpios = <&gpio TEGRA_GPIO(N, 6) GPIO_ACTIVE_LOW>;
+		power-supply = <&vdd_3v3_sys>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.27.0

