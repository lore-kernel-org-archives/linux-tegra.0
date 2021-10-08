Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27032C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1270C61177
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhJHUNd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 16:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbhJHUNd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 16:13:33 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C7BC061570
        for <linux-tegra@vger.kernel.org>; Fri,  8 Oct 2021 13:11:37 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e12so33066992wra.4
        for <linux-tegra@vger.kernel.org>; Fri, 08 Oct 2021 13:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=URri40ZXaY0OFhtJME26qwrD1O071Yx6D/e2sBUCLRY=;
        b=VPu2ihICGlHKjxu5M8qHobMtZu0o/O0A4l7rMrq/i1E03H7vBCRIRDp4S033Wjj2Vm
         I122nU62cO0UJjI4ry3NH0eK7nfOyJ1KA6QQwVnNGBs6UKAyluney7LidHg5B0gIZvNn
         jeYzoT5O2V7aS4xNK/yDe7rgYvwZrfnRAnLkZoSVuoPYlI/ZTvCcSASkDdW9iNg02rNX
         pS6DNhDVhJRpFiUF/xGzo+FORp/WjRKCeu6Wgvbf3PWXM6EQsVe52s/1K4CGfUOBWTxt
         b47jzJmVBLk3grb9ffavudgsWmI1ZFnxTBU6gsn/wtIbU+wkpCpOs4mXt0E2pdSeKhaT
         AH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=URri40ZXaY0OFhtJME26qwrD1O071Yx6D/e2sBUCLRY=;
        b=LhqgoS1aMGnE4jlw2jd7dszqZMuxmI3MMqyYRGH0uvbdQ72I+BYx36LxddR3bD5WUs
         TFJHLT52Ox//FVEjaAO9TrQUpKrZz2Dz7XqvgvYOSuJA0dXw6OWLt/CSNTzrnUv5dhAb
         uNTyz+dpxeSzt86SMR6h24gDv31qW70n7TzJqyeEfeWF1Fb2fMaAnBfjwpUnyvKoYzXz
         wnttARtsIuUkkJSb5fXWJwHAb7jlxgwbEGgOQ7yvkbgKFUwrXqIhh3pu/xkSKxe/1FJF
         39c3NF3tk482T9PzZKCMOvGP96x3KSzYpLpGgIONDL+cpWxNP+pDAC9p1EJFaGL771xk
         HAXQ==
X-Gm-Message-State: AOAM531zOnk6iwkd6uvSY6/Mk43bBK8af+IQ5gUMaTZMvHmiUD95bWXz
        B51joR1b113mnv6X3TNa0Bw=
X-Google-Smtp-Source: ABdhPJxsxUHf6OLRz12MGt9tZ12cq+K1UU29Y5KK8rEY8KuyDdJcHSjlrom09MFyy4UnfUVSEBgdoA==
X-Received: by 2002:adf:a209:: with SMTP id p9mr6603590wra.70.1633723896167;
        Fri, 08 Oct 2021 13:11:36 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s2sm258322wrn.77.2021.10.08.13.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/7] dt-bindings: Changes for v5.16-rc1
Date:   Fri,  8 Oct 2021 22:11:26 +0200
Message-Id: <20211008201132.1678814-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-dt-bindings

for you to fetch changes up to 354754f559507e0dba014aa830c70e73e7d52f98:

  dt-bindings: PCI: tegra194: Fix PCIe endpoint node names (2021-10-07 21:24:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.16-rc1

This contains the DT bindings for the NVDEC hardware video decoder found
on Tegra210 and later chips as well as a node name fix for the examples
in the Tegra194 PCIe controller (endpoint mode) DT bindings.

----------------------------------------------------------------
Mauro Carvalho Chehab (1):
      dt-bindings: PCI: tegra194: Fix PCIe endpoint node names

Mikko Perttunen (1):
      dt-bindings: Add YAML bindings for NVDEC

 .../bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml | 106 +++++++++++++++++++++
 .../bindings/pci/nvidia,tegra194-pcie.txt          |   2 +-
 MAINTAINERS                                        |   1 +
 3 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
