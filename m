Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BE7C74A5B
	for <linux-tegra@archiver.kernel.org>; Sat, 18 Mar 2023 17:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjCRRF0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 18 Mar 2023 13:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjCRRFY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 18 Mar 2023 13:05:24 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340472385C;
        Sat, 18 Mar 2023 10:05:24 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so3818152pjl.4;
        Sat, 18 Mar 2023 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679159123;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lXTbycD+XrCLh65SDWOsxvJ1+CH6vIOW10lZRN8hiM=;
        b=FRQRAU7F1/1xGyZKIXn+/p/yr8Sl23ZrOjhxYxDTff89ZCX20RDutiCszWs+05eYQs
         Kcchz453BMgIvx+lGWQILEb1G4W4TciaJo5mG8ezfQhD4jJ0tG1Itx+yLPcqd4xj9w31
         OpI3Gmj+/v+AkhQWIaMuJwzHHiAA+Pimz5lDwxy4+oECbbtfK3qD5WgDgHBjOfrxohx3
         EN4eb4Y/JXBZ71M84v2bspnqL7qHYoULmkphcT1eOE0jEEacys4TqIxM8rGvhOUtuo2c
         Oi6wY3+Z/0rBiWmuVhmuf2DrVIWsRmwkcHHiQaqLg6Q6NN/TwYXpbkKmF5Dz6g13Ien1
         UWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679159123;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lXTbycD+XrCLh65SDWOsxvJ1+CH6vIOW10lZRN8hiM=;
        b=lEt3IPRRnqQdDCweLxP2s5DI9fbkwsAd5KUb/xRff2KxrTMjDZZcsySBPyrTKhsR9o
         AqdqLiPjZNfgl3GzIyJ96Us4Je6OTZCvMHUPtQmlUTkPzmf9IWvi3koznmxB84TxFF6+
         cjECnJQ0IzF0MLvcrc6AP9p4KXJnMfgy15uArPcbRSG7LCvdzbg2JGAnc7l3Zpk3cnei
         +PsAdOPCAAKYd7W5h5mKtanfxLy5ijAwx1FbwnLDEOAL+N0ux9eTxeT/+h+I/0sNokbh
         TzyURHq5WPJ69ntAp+cwu3DVto8R7WLg4Oaeu3GyVZP/MhVd/yYPdi5SYY7bZH6YzW6T
         P4ig==
X-Gm-Message-State: AO0yUKV2HmnXuZF1TWp7CgewcTuoJFLJAfhX1Pzb+kKED/fdYlb6Tr24
        a6Sv9L1ksz0Pz6MNJ5cJ5OutvnIErA6z4A==
X-Google-Smtp-Source: AK7set8U9cqHg+DEljwmJJP5GukTuUthxlsefZ9jdWXup8pbOO9wcJkbJKqc0mDXRLnptz1urd3lUw==
X-Received: by 2002:a05:6a20:a884:b0:d6:9674:4433 with SMTP id ca4-20020a056a20a88400b000d696744433mr10643972pzb.10.1679159123528;
        Sat, 18 Mar 2023 10:05:23 -0700 (PDT)
Received: from sumitra.com ([117.199.163.158])
        by smtp.gmail.com with ESMTPSA id m26-20020aa78a1a000000b005a8a5be96b2sm41454pfa.104.2023.03.18.10.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 10:05:22 -0700 (PDT)
Date:   Sat, 18 Mar 2023 10:05:14 -0700
From:   Sumitra Sharma <sumitraartsy@gmail.com>
To:     Marc Dietrich <marvin24@gmx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy@lists.linux.dev
Subject: [PATCH] Staging: nvec: Change container_of macro to an inline
 function.
Message-ID: <20230318170514.GA49181@sumitra.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The macro has the drawback that one cannot determine
what type it applies to by looking at the definition.
Hence this macro definition is not type-safe.

The inline function gives the same benefits as the
macro and only accepts the specific type of arguments.
Use static because the definition only requires it to be
visible in the current file.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/nvec/nvec_paz00.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_paz00.c b/drivers/staging/nvec/nvec_paz00.c
index 8b4da95081c8..9573ba762cdd 100644
--- a/drivers/staging/nvec/nvec_paz00.c
+++ b/drivers/staging/nvec/nvec_paz00.c
@@ -14,8 +14,10 @@
 #include <linux/platform_device.h>
 #include "nvec.h"
 
-#define to_nvec_led(led_cdev) \
-	container_of(led_cdev, struct nvec_led, cdev)
+static inline struct nvec_led *to_nvec_led(struct led_classdev *led_cdev)
+{
+	return container_of(led_cdev, struct nvec_led, cdev);
+}
 
 #define NVEC_LED_REQ {'\x0d', '\x10', '\x45', '\x10', '\x00'}
 
-- 
2.25.1

