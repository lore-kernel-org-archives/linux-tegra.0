Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179C8C001DB
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Jul 2023 14:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbjGDOIn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Jul 2023 10:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbjGDOIg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jul 2023 10:08:36 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74C110C1
        for <linux-tegra@vger.kernel.org>; Tue,  4 Jul 2023 07:08:33 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-313e742a787so4861398f8f.1
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jul 2023 07:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688479712; x=1691071712;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKce7q+XY3D7V+BbPCIXaqQ9N33m7gnyDAJlD3IQrR8=;
        b=Gf9PByhmQAiRqUIz5j4Bd+kN3DhclSbN3XlvhQvF2t4m7wigh7MxQ3ndBRc87zlPpF
         Oo6Pz760zBOvTcIYWxNbYBTSa4Sy5AYvzfl3DW3iox9+zHS0zsaQNfdAUovybf5Ojl9t
         of4ZE5lH9Nc4UkI6z6pkBipXlAN+KBdQf3uYrG2iSL0bdXm7CipIAroipt49cPD8g4oH
         mUKxBuRNLl+une+MfB1CU0BTpOHhIBNHceZRQ6HrdT4lsA5ncKzn32bcioDHjHAX7ldp
         +TxvzSvrzne9O4vsAaaonTqd21Ka0UweFep6c4Cu15giSPg5+zpV0L0xrMTVENh6QkRI
         h5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688479712; x=1691071712;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKce7q+XY3D7V+BbPCIXaqQ9N33m7gnyDAJlD3IQrR8=;
        b=EphuY5SpqaHAq1VNZRTkwp28wKRXN/MdSQrQYwx2c8dQdN8A0awI3KG4s64X4bZR4j
         absdlRNmvipP/am0hQc4MHJDXvvJkbTJu2JglSZYLnz+xFkXDHLtryCDN0CG5Q3cx/FN
         DNA5YV0mtrUwQMV998VsT36/aLpjuqCLWR0lTjcH7EL+f248dlrkj4Oiu+nTKH5OG4Qp
         mGpBbFsv9O44hDWb5HXYPopV+FY8XVW2nUjYGyBTaybGCwgLT2k24U04Jzs4VOQHB85u
         U2/RNXO9vp44bYzUVvOgCuQU2EnN6wppTSHawzZ1pyGsZNBqR95yMA258d1g09kSgW7m
         ugvg==
X-Gm-Message-State: ABy/qLY9oA9Ep/0o9o98JZJXttgOpqAbDQybpvKbvA0FgqijXz2R0dV4
        CRD6eYdmYu+LnmMPJlB5RqBwAQ==
X-Google-Smtp-Source: APBJJlF+GiSkRkLZetwheuVHeTCrH+d/7Y5VgBr1LhpSRaXzV9yr1x+YSCcqGrsz4/9+AUVFnbwT+A==
X-Received: by 2002:adf:cc90:0:b0:306:3352:5b8c with SMTP id p16-20020adfcc90000000b0030633525b8cmr12884042wrj.7.1688479712282;
        Tue, 04 Jul 2023 07:08:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d17-20020adffbd1000000b002fb60c7995esm28473650wrs.8.2023.07.04.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 07:08:31 -0700 (PDT)
Date:   Tue, 4 Jul 2023 17:08:27 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] Revert "usb: xhci: tegra: Fix error check"
Message-ID: <8baace8d-fb4b-41a4-ad5f-848ae643a23b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This reverts commit 18fc7c435be3f17ea26a21b2e2312fcb9088e01f.

The reverted commit was based on static analysis and a misunderstanding
of how PTR_ERR() and NULLs are supposed to work.  When a function
returns both pointer errors and NULL then normally the NULL means
"continue operating without a feature because it was deliberately
turned off".  The NULL should not be treated as a failure.  If a driver
cannot work when that feature is disabled then the KConfig should
enforce that the function cannot return NULL.  We should not need to
test for it.

In this code, the patch means that certain tegra_xusb_probe() will
fail if the firmware supports power-domains but CONFIG_PM is disabled.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
My patch also is based on static analysis and reviewing the code so,
you know, probably best to be careful all round.

 drivers/usb/host/xhci-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 6ca8a37e53e1..4693d83351c6 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1145,15 +1145,15 @@ static int tegra_xusb_powerdomain_init(struct device *dev,
 	int err;
 
 	tegra->genpd_dev_host = dev_pm_domain_attach_by_name(dev, "xusb_host");
-	if (IS_ERR_OR_NULL(tegra->genpd_dev_host)) {
-		err = PTR_ERR(tegra->genpd_dev_host) ? : -ENODATA;
+	if (IS_ERR(tegra->genpd_dev_host)) {
+		err = PTR_ERR(tegra->genpd_dev_host);
 		dev_err(dev, "failed to get host pm-domain: %d\n", err);
 		return err;
 	}
 
 	tegra->genpd_dev_ss = dev_pm_domain_attach_by_name(dev, "xusb_ss");
-	if (IS_ERR_OR_NULL(tegra->genpd_dev_ss)) {
-		err = PTR_ERR(tegra->genpd_dev_ss) ? : -ENODATA;
+	if (IS_ERR(tegra->genpd_dev_ss)) {
+		err = PTR_ERR(tegra->genpd_dev_ss);
 		dev_err(dev, "failed to get superspeed pm-domain: %d\n", err);
 		return err;
 	}
-- 
2.39.2

