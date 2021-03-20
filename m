Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCC9C433E0
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:20:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22ED261964
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCTPUN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 20 Mar 2021 11:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCTPTd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Mar 2021 11:19:33 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABD4C061762;
        Sat, 20 Mar 2021 08:19:32 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id f16so15654913ljm.1;
        Sat, 20 Mar 2021 08:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S8vw09ZDi1MPPMzSwTgLK8igxzo8e7xTJejTYiXyr3w=;
        b=RzDMfgsiorCpyFtu8YKjd4iYbBYTEJrZKmLKMvsNdQKWJIjP3lrAPqEY5+fceHqBAH
         LJozjZTsdB4T210doGDrkZ7TttVS6i2mA4C8y8INAjUGGp37oj4I4ekK+09bMkybMhWn
         UOcW1fvc2E4N+nlsWeOcO1iAYf/isrjepRr33+pMIOfiK4pI5kc41kRKxacKGTUGhGTL
         FGkZbfTSS0c3M4HnORtoXfsYv9QR9el98Vy6RohhH+VlYh1SpTv2N9DfuSJO82Hmd7Qd
         IP/PCXkKwhXAM/zRzvHm0wQ+rvNaNOHHIO6FZBM4MEwtqkvLftg1/soIIyUF6ITCiqmc
         EVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S8vw09ZDi1MPPMzSwTgLK8igxzo8e7xTJejTYiXyr3w=;
        b=pZRQC4fXvoeNzxBB3lS1RtGXbHTba9URgFT32d5RxPhCa4tlmxMHkrU8jSjSZa/whd
         mhy55IqL8vFe1ygllV8sDnmKKlnTj9wx+bIRDzL2pllU6lxme0qh0keM1Z9dYy5aPihw
         DhcdKkwgTLBlH5P810aRXY0XjqrHyzCa6nfmPL38s1pXVkNuwsHpkkgVKE4kU5O/29vc
         G5WmAU5QvhTByk49npBujmK1KHzUr7faf5ScK+0HyUgXaVtNoxz3caQ2so+KhW9GbyJr
         uxDSh15nEyGAm9mJ7uM6nnI0nhGL3epysjws+H0NKoZRuE0Ebi9tNnzuLjcnsoe0n02x
         dKUA==
X-Gm-Message-State: AOAM531orwcZfrUhXKYd5ESUwFqLKCWdY3FRQPyNsUuYqQJ8qiCkNvK+
        jCqvlmczlBR4SIU6I8f0esE=
X-Google-Smtp-Source: ABdhPJwlxPbaIIJf+ARg40ihyOF6xP4oDhIc9oxa7GabNoWXd0LpogcbpeqOIMyHdEN2WXTt32J8ng==
X-Received: by 2002:a2e:b817:: with SMTP id u23mr3996323ljo.44.1616253569662;
        Sat, 20 Mar 2021 08:19:29 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f8sm1162447ljn.1.2021.03.20.08.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 08:19:29 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] usb: host: ehci-tegra: Select USB_GADGET Kconfig option
Date:   Sat, 20 Mar 2021 18:19:15 +0300
Message-Id: <20210320151915.7566-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320151915.7566-1-digetx@gmail.com>
References: <20210320151915.7566-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Select USB_GADGET Kconfig option in order to fix build failure which
happens because ChipIdea driver has a build dependency on both USB_GADGET
and USB_EHCI_HCD, while USB_EHCI_TEGRA force-selects the ChipIdea driver
without taking into account the tristate USB_GADGET dependency. It's not
possible to do anything about the cyclic dependency of the Kconfig
options, but USB_EHCI_TEGRA is now a deprecated option that isn't used
by defconfigs and USB_GADGET is wanted on Tegra by default, hence it's
okay to have a bit clunky workaround for it.

Fixes: c3590c7656fb ("usb: host: ehci-tegra: Remove the driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index b94f2a070c05..df9428f1dc5e 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -272,6 +272,7 @@ config USB_EHCI_TEGRA
 	select USB_CHIPIDEA
 	select USB_CHIPIDEA_HOST
 	select USB_CHIPIDEA_TEGRA
+	select USB_GADGET
 	help
 	  This option is deprecated now and the driver was removed, use
 	  USB_CHIPIDEA_TEGRA instead.
-- 
2.30.2

