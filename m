Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E98CC4338F
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5822C60F58
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233133AbhHBVU5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbhHBVUy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FA4C06175F;
        Mon,  2 Aug 2021 14:20:43 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id h2so36225620lfu.4;
        Mon, 02 Aug 2021 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ZG/CfQ7+SyXq5/Fmh6AgcZxsemHZ1ybrnhIsEVAHzs=;
        b=gW0NA6uVZylPFHHOSAEzPjqgNTWVQ+DAKH5Dfrup3bT0PwPZDVpi8bTdup35CK0DAk
         uBORj0PuTw5W3XDIR+dSVgyROt8OWtLG0+1T1aRTTY7QSi07VbAvZ0bX8Nr9TRn4RFA1
         3yPngXndpRGDl153ibY3hIoGT8BNC7d2SEg5WAbqaPjJaWbbmslhBvLAAiguq+QhMxO0
         JQBeqbyFxYER9RYKbygAEFNerFdUXQ07EBD55Pq3qtrpWgV45cqNIE5Iq9doshbJraTK
         2Zv1lA3H3FFRs9yjO5qoNxgSg9QM+i0vTqJ8e3mjlahxoupuOka2z4Y9avlCO8q9XtT3
         ZSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ZG/CfQ7+SyXq5/Fmh6AgcZxsemHZ1ybrnhIsEVAHzs=;
        b=BMM76dDSqYsjx3IzHV9k5/CaVlVyXQGtjG9+QsgfW5LYVLhnw4Il2Z7QWo7LSZw/7v
         MI+KEf5KP9gbPyERfN6NupgzPwvPPLsEtNYHtQ6Sij3SGgtDz5d+4gzi1dm5CZp/+sVr
         phaD1CpCqSJNw3g9gdWJw0M5NW3kwUSCHmyQ+yJAgkujYuSTyKfWEhNZjpwwvrh65QEK
         8KZhM2izsPrUFl4ndzBzjK7eJ1v2v+acgWZo8M784q8litWzTAzRU5h41pT/a/Pwf2sL
         ZgL8AQIg/0tTgxQFX7MYIdIENeyvvmHn6iaTSNxkJfsVtUDBHrm30NHRdNzDWwDuYOiv
         PkXw==
X-Gm-Message-State: AOAM533UD+BaTeY+D9/Nb/O23CwwgIIQ4oTP8gGvwqOBxGFe30Fb1Oyp
        b0kf9aksk65ewhAC7zYNsf0=
X-Google-Smtp-Source: ABdhPJw2Omq1gj8UcbjmwsSp3tboh4ILTUnQUms2l1+KSpv48s4G5ZhI7KMfPIyqMRhYy97AI0fFEA==
X-Received: by 2002:a05:6512:98b:: with SMTP id w11mr13572919lft.62.1627939241457;
        Mon, 02 Aug 2021 14:20:41 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:41 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 09/15] ARM: tegra: dalmore: Correct interrupt trigger type of temperature sensor
Date:   Tue,  3 Aug 2021 00:19:41 +0300
Message-Id: <20210802211947.19715-10-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The LM90 temperature sensor should use edge-triggered interrupt because
LM90 hardware doesn't deassert interrupt line until temperature is back
to normal state, which results in interrupt storm. Correct the interrupt
trigger type.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index c04162ddec3c..7fd901f8d39a 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -788,7 +788,7 @@ temperature-sensor@4c {
 			reg = <0x4c>;
 			vcc-supply = <&palmas_ldo6_reg>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_EDGE_FALLING>;
 		};
 	};
 
-- 
2.32.0

