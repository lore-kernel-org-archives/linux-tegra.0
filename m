Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BCBC433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Mar 2022 07:42:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344675AbiCHHnG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Mar 2022 02:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344724AbiCHHnB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Mar 2022 02:43:01 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0363DDFB
        for <linux-tegra@vger.kernel.org>; Mon,  7 Mar 2022 23:42:05 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 92BF83F7FD
        for <linux-tegra@vger.kernel.org>; Tue,  8 Mar 2022 07:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646725324;
        bh=Un+PBm7TVpil6wZFl7iMD+ssa0pQW3YglAFfrUmMR/0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=W69ZLe3tSwrcrThJ6oa5hI6KQyeCf/yge1ZpKEf9YCJ0zHcZoZA4HgXgBKLDV9nCE
         azZcqyZlBFvuK6Ap8qMZJxPRHhJngOtkQtkXsY3+ElZ3lp1p564alZeK8wJOYsaF92
         isx7fjupCBVxN20Lt2Bb/V81mi2a/s9P3zzHV67KWLYlvf5qCVTqdC5NII7xxyjehp
         IQKkuu/lQ6G4v7qBCBHrB1SFT22zcanXnMqkobjrIZ/oJiKty+ZWh5/ofxycS+Pywh
         l5EMOFxJxPmhkbbqW6HhyaBFWngmfO9yHXjNi0wNQeYgpwDPx9CglMBnlVoe2pLGkk
         eL3frctLIxIiA==
Received: by mail-ej1-f72.google.com with SMTP id h22-20020a1709060f5600b006b11a2d3dcfso8217454ejj.4
        for <linux-tegra@vger.kernel.org>; Mon, 07 Mar 2022 23:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Un+PBm7TVpil6wZFl7iMD+ssa0pQW3YglAFfrUmMR/0=;
        b=EAPPIxXrEPPNVne+t7Ef7ugYLVpEq6rwZr1r1zTL6v35kEfosmditPDPqwYv4ZXu0V
         hEJmyKg5tCY4A1x9MJSng9tIcOgrPHxpXFksEMkKRCcvBIj+IcThXuVo8T34+QrqbVxE
         MqU+tibhlpXRxnf3LV70h3pfhrdGEnCIf2Bv4nWVwmS2hrSj1w+P61TScqm77J4TWenw
         ELYVJsoVe9s+zDjJonHkpP+ByxhUCcXIf6V5NJHQJkj14I3KgI6j0m+rEBAzenNMbGC3
         6KmR3HL7MsgBJpLvJvBGY9dWVJ+udbkUYDgfiHXGxOQX2PUtzzdbfblA06f3by97unVp
         nJQg==
X-Gm-Message-State: AOAM5302AxbERNc3Vju4g3aLwwybzFnIGuf/5uZiQpZ1vLPohH+hhwZc
        3tITtOV5cG0JhoPdBQvNoYTExgUwkSbclfaD59jTQxr+SNrhjb12Z6V8D28W+RoCcmOEPr9nqpn
        e2/2eSYav+dsPgZU2FFfQ6eq/cloalLzYsrVp4khK
X-Received: by 2002:a50:d498:0:b0:416:2b00:532 with SMTP id s24-20020a50d498000000b004162b000532mr13081362edi.396.1646725320735;
        Mon, 07 Mar 2022 23:42:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjhCqo9HH0cK+RI8/E89ekTwyLjLyg0tpT17qz7uVBuNxty/NMegrabspJHC1kBpHoMxQrTQ==
X-Received: by 2002:a50:d498:0:b0:416:2b00:532 with SMTP id s24-20020a50d498000000b004162b000532mr13081352edi.396.1646725320534;
        Mon, 07 Mar 2022 23:42:00 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id d4-20020a1709067a0400b006d6e3ca9f71sm5565533ejo.198.2022.03.07.23.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 23:41:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] serial: 8250_tegra: mark acpi_device_id as unused with !ACPI
Date:   Tue,  8 Mar 2022 08:41:57 +0100
Message-Id: <20220308074157.113568-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The driver's acpi_device_id table is referenced via ACPI_PTR() so it
will be unused for !CONFIG_ACPI builds:

  drivers/tty/serial/8250/8250_tegra.c:178:36:
    warning: ‘tegra_uart_acpi_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/tty/serial/8250/8250_tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_tegra.c b/drivers/tty/serial/8250/8250_tegra.c
index e13ae18b0713..e7cddeec9d8e 100644
--- a/drivers/tty/serial/8250/8250_tegra.c
+++ b/drivers/tty/serial/8250/8250_tegra.c
@@ -175,7 +175,7 @@ static const struct of_device_id tegra_uart_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_uart_of_match);
 
-static const struct acpi_device_id tegra_uart_acpi_match[] = {
+static const struct acpi_device_id tegra_uart_acpi_match[] __maybe_unused = {
 	{ "NVDA0100", 0 },
 	{ },
 };
-- 
2.32.0

