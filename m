Received: from sender2-pp-o97.zoho.in (sender2-pp-o97.zoho.in [169.148.134.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0E2156678;
	Sat, 20 Dec 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=169.148.134.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766222595; cv=pass; b=DbT3yWDIu4BwdPh7c6wX4oPxt2g6ObANhW83ocudT6VRuKTb5g5+gwKRYVU64+ZiSXOWRxmYPt6uShfvtiI7UPojxfNsI/JEizctmJsRTpbACHKdrl3/Se0aMG1SYeexa5WcoXt+mkrHLtdtkwWsYeeEjKjnD+t/HSlkcSsQaSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766222595; c=relaxed/simple;
	bh=QC4S4A0dxtSyvs5KO9F2gPy6NDsyk4CJhCUlyY3y6e0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFBO4FuiQrpb0tL/C9hL3gAEGg6cHAEo2lyDGei/tGMo9/fkowjLqMdhwI+oqL3cncQsZI4NA2c7cZx29OolA77r9oJEnKOqdBOERDqTQ5JUUtiqrtTmsuZigHbDD6LXxZahIOOzfzT1rzybqHrXfwK85HwCny/TTpQxps/Wtxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b=S6vcsCnL; arc=pass smtp.client-ip=169.148.134.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b="S6vcsCnL"
ARC-Seal: i=1; a=rsa-sha256; t=1766222578; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=ZWFJrbczGw5tTpNIxPyNwhSEofYqzkO4QQpdAGhKu4aNgNcGZr21ap0I+HsumoxMOjzWyKZwXiUOgyd+K4Mz0HVj0w1natNHKGCRCTgq0LjCFnj/rH9wGkwCdZZWPdN2oqK1+F4ARM5gA9dZMD5bQQd86g1/qR1wQ1bCfqVXvY4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1766222578; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OofW2aCYjbNCIjUw/ER8VfAdyT4D8osctIsy0RUyh8A=; 
	b=L/fErKqCDlAuO+MSqpGWcjaB1FVOLyFp3fWbmrQfX1fZjLMbS8gQC5ZS5nEuZv4uN/OCSdazIGErm9EKHo6pE+ZinHhwoXEFbNKwkKFtzifX10R1sbCskMOEOfj/mseVyqtdZI4KaYUijErtl1ry5UcFfrNEB/x6sqBJGu61yvg=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=preyas17@zohomail.in;
	dmarc=pass header.from=<preyas17@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766222578;
	s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OofW2aCYjbNCIjUw/ER8VfAdyT4D8osctIsy0RUyh8A=;
	b=S6vcsCnL2aOIySwiLurs0yKD0AjIpbVt4xJzYuA5FF49nG11T7Cu0e99Cv324iXN
	d2wMw4RjIScNAibAR2u8MI9tuU0DnMET/k/Qf80XnOBp+IuuUN/l/byriyh6yiOYht/
	vlORyA0tyGYXKlyK0ndXtPpCdwOr//jUUF8tzum8=
Received: by mx.zoho.in with SMTPS id 1766222577179131.58919452716736;
	Sat, 20 Dec 2025 14:52:57 +0530 (IST)
From: Preyas <preyas17@zohomail.in>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Preyas Sharma <preyas17@zohomail.in>
Subject: [PATCH] staging: nvec: replace short udelay with usleep_range
Date: Sat, 20 Dec 2025 09:22:29 +0000
Message-ID: <20251220092229.16606-1-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Preyas Sharma <preyas17@zohomail.in>

Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 263774e6a78c..6ffe5e8656d1 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -648,7 +648,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
+			usleep_range(33, 66);
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
-- 
2.43.0

