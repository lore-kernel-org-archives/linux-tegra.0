Return-Path: <SRS0=kXk7=C3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46B8C43466
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 02:39:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE14523770
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 02:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600396786;
	bh=casV5YDo5of5191kk54tT26Mx6z9poX2mhDvNHwzyZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dxp28jen/PfXW670tr6zXXwOTkSaZMeb3nZi6esTmO8v8aP5NyVzrMS28Kq6MVIPR
	 MPV2g+w8stwAAlIpoQV7XSgsn1Ws6qJHOqr21onnYdSmj7wpTxMrM2sMPWiqe92x2w
	 012kfyrDAwk4uOtou+xeGWkxNmryYRdhR34EJACA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgIRCjh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 22:39:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:37936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727736AbgIRCL5 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 22:11:57 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 777F623119;
        Fri, 18 Sep 2020 02:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600395116;
        bh=casV5YDo5of5191kk54tT26Mx6z9poX2mhDvNHwzyZI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SKlJHAlsYJayFos9Kgm+Pt57lzGeW252QW8ZEUmT2dvCviGksZKMHHZIiwsFrdeGg
         5cb+nBWDiZgZ/4uus7szDIivY4rjjS4R4RbMoGsqOhqSPwX5PyXqSKCQEuvOi//iPv
         atAiYb3KLzT6+8InUJoH5M1FgltXyXiHfWTBN8lI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, linux-pci@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 189/206] PCI: tegra: Fix runtime PM imbalance on error
Date:   Thu, 17 Sep 2020 22:07:45 -0400
Message-Id: <20200918020802.2065198-189-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dinghao Liu <dinghao.liu@zju.edu.cn>

[ Upstream commit fcee90cdf6f3a3a371add04d41528d5ba9c3b411 ]

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Also, call pm_runtime_disable() when pm_runtime_get_sync() returns
an error code.

Link: https://lore.kernel.org/r/20200521024709.2368-1-dinghao.liu@zju.edu.cn
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/controller/pci-tegra.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 6f86583605a46..097c02197ec8f 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2400,7 +2400,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	err = pm_runtime_get_sync(pcie->dev);
 	if (err < 0) {
 		dev_err(dev, "fail to enable pcie controller: %d\n", err);
-		goto teardown_msi;
+		goto pm_runtime_put;
 	}
 
 	err = tegra_pcie_request_resources(pcie);
@@ -2440,7 +2440,6 @@ free_resources:
 pm_runtime_put:
 	pm_runtime_put_sync(pcie->dev);
 	pm_runtime_disable(pcie->dev);
-teardown_msi:
 	tegra_pcie_msi_teardown(pcie);
 put_resources:
 	tegra_pcie_put_resources(pcie);
-- 
2.25.1

