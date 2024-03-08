Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86C52D056
	for <linux-tegra@vger.kernel.org>; Fri,  8 Mar 2024 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709887916; cv=none; b=L71q6eSBBDGMquNZ6VraGFLNN9yZK6ZWeTdUj7ujUzy1OUXGzP3jhPpLEYnDFO0oBvp8xqQuvPQGytAFabpJm2VUriltasFErqB6lxEKzxO3WxCOcMlWfFs96L3bgxnT9piXA+VR0/VsN5zgJIGhqrpXWnbHy/NjKCTH224aY08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709887916; c=relaxed/simple;
	bh=bpBoKQxkhhcUtk1eVpmAwtJYGHzt5lvHcl+mpGFv34Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GEMDTzJRcOMAIelhz9FhXs9F/ebPb5j9f8UWaXVGqzaegU+ovdTsLHMMU7f1e3fWsdeDXoj3eCbVdd0xMd8AQrgWx3ps8c54Lp/F1Vdx2UflodEwGO8ziyBbVPbHol3mn+jak7JUzn/Mm/2keSNsbzkpw+XI7K0gGBcx/f1anqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxF-0006vX-Ls; Fri, 08 Mar 2024 09:51:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxF-0056N6-6t; Fri, 08 Mar 2024 09:51:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxF-00245U-0P;
	Fri, 08 Mar 2024 09:51:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dipen Patel <dipenp@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	timestamp@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] hte: tegra-194: Convert to platform remove callback returning void
Date: Fri,  8 Mar 2024 09:51:07 +0100
Message-ID:  <0b0a5d3816973ee88d4be9fe9f2349065a42cbff.1709886922.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=bpBoKQxkhhcUtk1eVpmAwtJYGHzt5lvHcl+mpGFv34Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6tF9loxXme5Y3qwJPajmNWAgaJ1pdGq5vIuAA 88wYvqqSmeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZerRfQAKCRCPgPtYfRL+ TuVXB/42XSB7OGYbpBihN9q6ey2xFSC7cCInsqwJwMy1VcOzC5T1kgv72DPW8/LHJvqLX/kxyf3 esi9QFjTELCt8iJNpALTzzdvek329axuaMlfhIv4zsmECVCRWAr0xm/rcqhsiehOOBfbvqPjXUu m9ugldRSIQAypvzJIhRETjiaXj6HdYGugxe2xGewxMK4SAiYz78s2Q4TWw39w0jGGF2S/N38OQC ynovLKiB5P3QAj7YERQ6P9vxcfFqHxv0TBFoB0926/v2XpDTb0V4B8V5GGQmruiiZLxAtEw216F WnIqq5w/YceeMKVIFyIRib8yF9r04qMEPi6Rf4a0ZUGwtcFr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hte/hte-tegra194-test.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
index ab2edff018eb..8ee038ccf601 100644
--- a/drivers/hte/hte-tegra194-test.c
+++ b/drivers/hte/hte-tegra194-test.c
@@ -214,7 +214,7 @@ static int tegra_hte_test_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra_hte_test_remove(struct platform_device *pdev)
+static void tegra_hte_test_remove(struct platform_device *pdev)
 {
 	(void)pdev;
 
@@ -222,13 +222,11 @@ static int tegra_hte_test_remove(struct platform_device *pdev)
 	gpiod_put(hte.gpio_in);
 	gpiod_put(hte.gpio_out);
 	del_timer_sync(&hte.timer);
-
-	return 0;
 }
 
 static struct platform_driver tegra_hte_test_driver = {
 	.probe = tegra_hte_test_probe,
-	.remove = tegra_hte_test_remove,
+	.remove_new = tegra_hte_test_remove,
 	.driver = {
 		.name = "tegra_hte_test",
 		.of_match_table = tegra_hte_test_of_match,

base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.43.0

