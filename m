Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080EBC43461
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E13F46162B
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhEJU3O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 16:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbhEJU3O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 16:29:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC23C06175F;
        Mon, 10 May 2021 13:28:08 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id w15so22381485ljo.10;
        Mon, 10 May 2021 13:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t+WD7sR6NnA+8LPB9Rjuc/jlkdohjKwrq/YbpcReCR4=;
        b=lRmIkUME4h/s1s94BsBmqvpZ7QliVphNZbQWYy0hToSOLLDDvdEFCXNesfPohVDkN9
         ORXkgPuwZK0IgKFvVy+HZ/pBhm5jmimrc0UiJRDBeebJ6/gnWtf2umxxJTTQ8nSEWtgX
         MHiSMdkycRcchltref32cpw1h8dhcPEJ3PDwTVHL+CsNthuvhQPcwy/yNmsMRzEg7PUg
         G5vTgYEyKcAKR6IcMhdM0pz4QHqzWC9t+ZAOj8euf/R0eqBPdzr2Y7MSpvM0ynP2RoGC
         Edj9HZA6g3NW0CQLat9KKQEzCbidFCXt8y/AXYjBTQ96hJc4NeD2tF2N2yXelVAk5n8m
         0NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t+WD7sR6NnA+8LPB9Rjuc/jlkdohjKwrq/YbpcReCR4=;
        b=AMZ1JHSgwc7OMyRnWUUhMUCaejxwkVnk6isYjqDmfkGd7rfOJUH+W0cIfBQhmrXilq
         waXMFdYirmfiJXK/knVfMNs2Qu1PxdrmwvWV7gPNcMWRvUZ1J5NrecB4eRaCmFSNdvQB
         DsOH3lI+IgBSS/VRXsC5UNhAynUDhtLP233HD3fDCWik6qjh/Ju4S3tAUcgTVDovB3S5
         ccLw6Q4SdCrbzbx2zZ8fjWY/7CwzKy2W2mP+Kib1DmuowRbwKfj/4ray5SKsNJr26o6G
         QDZ1H3Bi53+hvDjU2wxmGH/byGl1NeJQHVgL/krYlyhkfxhWJf2EK5ZWNn6/BEL3VU3b
         VImQ==
X-Gm-Message-State: AOAM533rnQrgYdVou2m1suQlPkE9GK4vRrAZcDqIENJRirP3xpVqNyyb
        wJsnABNFTApt5urckWwzJ9g=
X-Google-Smtp-Source: ABdhPJytMyKC+G55rwrpjBnIZk7X6RcpxnmhBK14Hs0aMRl7piKiAUKN0m+N7jTQbCTF2ReewzJhwQ==
X-Received: by 2002:a05:651c:1311:: with SMTP id u17mr20858527lja.48.1620678486609;
        Mon, 10 May 2021 13:28:06 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id z23sm2360662lfq.241.2021.05.10.13.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 13:28:06 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/10] ARM: tegra: Add reg property to Tegra20 EMC table device-tree nodes
Date:   Mon, 10 May 2021 23:25:54 +0300
Message-Id: <20210510202600.12156-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510202600.12156-1-digetx@gmail.com>
References: <20210510202600.12156-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The reg property is now specified for the emc-tables nodes in the Tegra20
device-tree binding. Add reg property to the EMC table device-tree nodes
of Tegra20 board device-trees in order to silence dt_binding_check warning
about the missing property.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++++
 arch/arm/boot/dts/tegra20-paz00.dts             | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 15b7965599ee..883b76f1039b 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1088,6 +1088,7 @@ memory-controller@7000f400 {
 
 		emc-tables@0 {
 			nvidia,ram-code = <0>; /* elpida-8gb */
+			reg = <0>;
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1185,6 +1186,7 @@ emc-table@300000 {
 
 		emc-tables@1 {
 			nvidia,ram-code = <1>; /* elpida-4gb */
+			reg = <1>;
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1282,6 +1284,7 @@ emc-table@300000 {
 
 		emc-tables@2 {
 			nvidia,ram-code = <2>; /* hynix-8gb */
+			reg = <2>;
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1379,6 +1382,7 @@ emc-table@300000 {
 
 		emc-tables@3 {
 			nvidia,ram-code = <3>; /* hynix-4gb */
+			reg = <3>;
 
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 940a9f31cd86..63d62418d4b8 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -318,6 +318,7 @@ emc-tables@0 {
 			nvidia,ram-code = <0x0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			reg = <0>;
 
 			emc-table@166500 {
 				reg = <166500>;
-- 
2.30.2

