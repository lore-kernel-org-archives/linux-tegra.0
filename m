Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2763F1DED4D;
	Tue,  3 Dec 2024 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733217817; cv=none; b=AuprHCQq9wYwCaeSDksCusYy/FHPwqOX6uI+CM46cQOCED/eqA5Ss9+H6rXFmPjN5JYkay6+WzoTYVApcIQpiUM82a47oRTDIi5EUAk97boWBDq0UUiXfmhm55CsBQZ5Yqz1iYXB7Qv3s5OfzbfJj/yPhxEv1FQWGrBTNlSBg0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733217817; c=relaxed/simple;
	bh=TtXfN5H4J4ndzSU8WuIWwo4OK0Z8eJ7MsbV2nYDHcf8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=RuR1zNQYryl2c0DDAhv9lYH/k6iI7PPzD6VV/h0sQy3oFA7gkIGJu+Ffl2wlfQxOyI1dqsaTW71IfRSAREVN9bns5F9BGrh3R+TWCYuXQ+Nu4T8R70IbHRHF/9aRm2wGiI9iyBr0+GoNAZFAWBvHcdcfat9F3Y+O8dGa65qakFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee5674ece10549-c1560;
	Tue, 03 Dec 2024 17:23:31 +0800 (CST)
X-RM-TRANSID:2ee5674ece10549-c1560
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee6674ece1253c-241cc;
	Tue, 03 Dec 2024 17:23:31 +0800 (CST)
X-RM-TRANSID:2ee6674ece1253c-241cc
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: thierry.reding@gmail.com
Cc: jonathanh@nvidia.com,
	zhujun2@cmss.chinamobile.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND] soc/tegra: bpmp: Fix typo in bpmp-abi.h
Date: Tue,  3 Dec 2024 01:23:28 -0800
Message-Id: <20241203092328.7614-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

The word 'traget' is wrong, so fix it.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 include/soc/tegra/bpmp-abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index 6b995a8f0f6d..dc0789c20333 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -3755,7 +3755,7 @@ enum mrq_pwr_limit_cmd {
  * @defgroup bpmp_pwr_limit_type PWR_LIMIT TYPEs
  * @{
  */
-/** @brief Limit value specifies traget cap */
+/** @brief Limit value specifies target cap */
 #define PWR_LIMIT_TYPE_TARGET_CAP		0U
 /** @brief Limit value specifies maximum possible target cap */
 #define PWR_LIMIT_TYPE_BOUND_MAX		1U
-- 
2.17.1



