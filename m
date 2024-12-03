Received: from cmccmta1.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6878842AA3;
	Tue,  3 Dec 2024 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733210016; cv=none; b=A0d9ibjE3ZU8r56HYi/x1oSZFQPVpPDh6YZK3PT99zDiYr0YzUGn+ddVPF2jJBQdaftxGyFhHB9OrMVOlhNyO9MkD2yKyXGSZceyqmoZQ/ZCt0PWPvKnNOpOZ7QbSgBRnLmXwq+1qS94uVJNDOk7/yrDsv1ajUNmLdSDtuze9Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733210016; c=relaxed/simple;
	bh=TtXfN5H4J4ndzSU8WuIWwo4OK0Z8eJ7MsbV2nYDHcf8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=U4j/q4VXXBwHGbHa10VesnE/QC16kPhNEpCQauisS5LS8TiD4mKf9Be0p6BznPrama6JQiF5Zgs4nW9UySj2gbk+fIugeYvOx2ECMsNuiAcnC+CSFNrR9B0sLdNHXUsI70Iu2mnWRyF9bLYexvTHKSEHFGTHpyvYHrGU40xhbT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee4674eaf94bd5-914df;
	Tue, 03 Dec 2024 15:13:24 +0800 (CST)
X-RM-TRANSID:2ee4674eaf94bd5-914df
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee3674eaf9291d-1f7c9;
	Tue, 03 Dec 2024 15:13:24 +0800 (CST)
X-RM-TRANSID:2ee3674eaf9291d-1f7c9
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: thierry.reding@gmail.com
Cc: jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [RESEND] soc/tegra: bpmp: Fix typo in bpmp-abi.h
Date: Mon,  2 Dec 2024 23:13:21 -0800
Message-Id: <20241203071321.6914-1-zhujun2@cmss.chinamobile.com>
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



