Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF6E3932F0;
	Thu,  2 Jul 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988577; cv=none; b=Q4wtks+PuXTP2RxLHJsV5975ajPmqET71IkZELFYmuGoyIhysxbB+Zhu+v9a73V3k3lMaeHZbkaff3iFTb02WYdAy/4gMJznK5ikviiBYAu71cJEu1kH+cDhqHyhQYwqurZH27Yz0g1AYWvV0f4nvzXcHatTk0wu7N3+61RD2fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988577; c=relaxed/simple;
	bh=KKwMbEsVglT34K4nkdyHyx2nc0kXBL2aJGaLAjuEc5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=UWAx6xPRGpZv/bDYKtx5Hd8KSl0w9t+R8YyLTmHakmxXrsjU+OEX7gs8wTJDGPjwcFkvURIFp4pzIvRaMm+XUJt/A9/Sf3z/PYZLFjZYpB+POaaK+wG5r6qrciP3rRhiFm1i+7RJ8UMchmHtdpJWf+Oj2y/61onz7lsyYncsp4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=BbQOnVIq; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BbQOnVIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782988573; x=1814524573;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=KKwMbEsVglT34K4nkdyHyx2nc0kXBL2aJGaLAjuEc5o=;
  b=BbQOnVIqJGTGtHUThL+YWmkgBl4+4gNHoY49g14y5rOaN6MiQWb6qjem
   vMccRm1zePmoGGrlaOGLjL3eri6UTdLnJkutTGgAiEim/LERPMYgGv4kH
   1Y9KFBLEfAiumRDVNduT1W9dwBahbA5aV000Q5EAKOIYjfdAGBcNgye53
   ASwsmWRg9uZ83Xj4M2aAgl12s1QbwupUhYSoqkoFuzm131N1H+O53uLzD
   W8Rox31rAks5wRmHeCd+uLWyJjNRUhJm/HPIg73VO2J2t4feFvjOylclg
   jxUmpF/5j6WCbf+7aA5wdXJKvMJLqCqitIymbrfzM5nHEzg2h8M9yDAs0
   A==;
X-CSE-ConnectionGUID: s+8iEvFlQYy3/T62SoT8vw==
X-CSE-MsgGUID: /uXFG2VoRtW2NbtFuEFi5w==
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="59155305"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 03:36:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Thu, 2 Jul 2026 03:36:12 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 2 Jul 2026 03:36:08 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Thu, 2 Jul 2026 16:06:06 +0530
Subject: [PATCH] staging: nvec: disable i2c slave on remove
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260702-contrib-nvec-clk-leak-v1-1-659bcbe74e56@microchip.com>
X-B4-Tracking: v=1; b=H4sIABU/RmoC/x3MQQqAIBBA0avErBswKwe6SrQwm2ooLDQkiO6et
 HyL/x+IHIQjdMUDgZNEOXxGVRbgVusXRpmyQSttFCmN7vBXkBF9Yodu33BnuyHR1FJtqTHWQG7
 PwLPc/7cf3vcDg9FaLmcAAAA=
X-Change-ID: 20260702-contrib-nvec-clk-leak-77d573a746a6
To: Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Stephen Warren <swarren@nvidia.com>, "Prashant
 Gaikwad" <pgaikwad@nvidia.com>
CC: <ac100@lists.launchpad.net>, <linux-tegra@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	"Balakrishnan Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3

tegra_init_i2c_slave() runs from probe and enables the i2c controller
clock with clk_prepare_enable(), and enables the interrupt.
tegra_nvec_remove() removes the mfd devices, notifier and work queues
but never calls the matching nvec_disable_i2c_slave(), so the clock's
prepare/enable count is leaked on unbind and the controller clock is
left running with no user.

The leak is only reached on driver unbind, which is why it has gone
unnoticed in normal use.

Call nvec_disable_i2c_slave() on remove, the same teardown the suspend
path already does.

Fixes: 61c3b1971ad4 ("staging: nvec: add clk_prepare/clk_unprepare")
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/staging/nvec/nvec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 88c416ee0381..3869c16ad3c8 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -908,6 +908,7 @@ static void tegra_nvec_remove(struct platform_device *pdev)
 	cancel_work_sync(&nvec->tx_work);
 	if (pm_power_off == nvec_power_off)
 		pm_power_off = NULL;
+	nvec_disable_i2c_slave(nvec);
 }
 
 #ifdef CONFIG_PM_SLEEP

---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260702-contrib-nvec-clk-leak-77d573a746a6

Best regards,
-- 
Balakrishnan Sambath <balakrishnan.s@microchip.com>

