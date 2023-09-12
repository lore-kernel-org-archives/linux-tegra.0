Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCD9CA0ECA
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Sep 2023 12:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbjILMLw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Sep 2023 08:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235017AbjILMLs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Sep 2023 08:11:48 -0400
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Sep 2023 05:11:43 PDT
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1138B10D0;
        Tue, 12 Sep 2023 05:11:42 -0700 (PDT)
Received: from unicom146.biz-email.net
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id INX00031;
        Tue, 12 Sep 2023 20:10:31 +0800
Received: from localhost.localdomain.com (10.73.43.241) by
 jtjnmail201604.home.langchao.com (10.100.2.4) with Microsoft SMTP Server id
 15.1.2507.32; Tue, 12 Sep 2023 20:10:33 +0800
From:   Deming Wang <wangdeming@inspur.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Deming Wang <wangdeming@inspur.com>
Subject: [PATCH] firmware: tegra: Fix a typo
Date:   Tue, 12 Sep 2023 08:10:30 -0400
Message-ID: <20230912121030.1759-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.73.43.241]
tUid:   202391220103105749af02e976c300ae83dcc6a8096df
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

successfully, not 'succesfully'

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 include/soc/tegra/bpmp-abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index ecefcaec7e66..6b995a8f0f6d 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -1194,7 +1194,7 @@ struct cmd_clk_is_enabled_request {
  */
 struct cmd_clk_is_enabled_response {
 	/**
-	 * @brief The state of the clock that has been succesfully
+	 * @brief The state of the clock that has been successfully
 	 * requested with CMD_CLK_ENABLE or CMD_CLK_DISABLE by the
 	 * master invoking the command earlier.
 	 *
-- 
2.27.0

