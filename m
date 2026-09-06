Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD03B27DC;
	Sun,  6 Sep 2026 03:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666104; cv=none; b=Uzu0mySnbI+pEnqE1hJLXxUuOb7IgoOeD7rAiyoGpNLxuaiTj+ZV/UKWK9EO9A5UgPsaLyKkDnx4s6ZxjltT24X6e9s1shHJ/QotTcfDyakMAvUtFPU2+ABFxv08tH1eX+7M1nXGdv9cIGTl0zcxeIAUHGLZgCXqPowaa4aEZV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666104; c=relaxed/simple;
	bh=fmw52iuCxdGkNnLgJ6ANUEmY0geyqWUgqDr7sVjha0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIOSdtRISC0u8W520ZnNd6JYCEtZlfM2z0tHdMZoGncDZjEKcZ8rOjBfdYr8TDuCMz0CPlAlPx3swfa5IJP3WPOdTcgaoqhkZWFKoRbq8iATU/oFaawvWBdOmWCHztT4Q6NORSzFDwSrInqC4/JIV5EI+xnZ122hcyzGZp5Vz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eQYtbNfn; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eQYtbNfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=QD
	ZTqb1CH8PuDCI64iNeCo8U7mbrJcdP7sXzmfmEBQA=; b=eQYtbNfnEUZdQmr8SJ
	7Sq7J88s1XT+FmgPrI2uTV6q0ydcfKHxSmHcoxJ1kNt0d5wiMd/clp5dPJ1D8tkT
	x120vpaXvG8sIzu42yxd0+f2cTS4Zyx7oqYs43ZrWwo5jejBjZnmcR7+ss/WKolR
	ClHw+BE7OE29Hdm5BwbawvQZc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBXIM7c4Jxqr17VAw--.6409S2;
	Sun, 06 Sep 2026 11:41:17 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	JC Kuo <jckuo@nvidia.com>,
	linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: host: xhci-tegra: Handle PHY failures while exiting ELPG
Date: Sun,  6 Sep 2026 11:41:14 +0800
Message-ID: <20260906034114.85417-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXIM7c4Jxqr17VAw--.6409S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4xXF48WF18Ar18tw48tFb_yoW8Ar4kpF
	Zag34jgr17JFy3KFnxt3W3ZF1rCws3KrW7Ga4Sk398XrsxW34jgr48KFyrJa9xCr9rtFsx
	tr10yFyUGr4UXrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRK0PDUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7R0x+Wqc4N2sNwAA3o

tegra_xusb_exit_elpg() ignores phy_init() and phy_power_on() failures
and continues to restore firmware and xHCI state.

Stop at the first failed PHY, undo a successful init for that PHY when
power-on fails, and unwind only the previously enabled PHYs in reverse
order before using the existing partition and clock cleanup.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 drivers/usb/host/xhci-tegra.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 6f235d1e117e..7b7cf22a577d 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2328,10 +2328,18 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 		if (!tegra->phys[i])
 			continue;
 
-		if (!wakeup)
-			phy_init(tegra->phys[i]);
+		if (!wakeup) {
+			err = phy_init(tegra->phys[i]);
+			if (err)
+				goto disable_enabled_phys;
+		}
 
-		phy_power_on(tegra->phys[i]);
+		err = phy_power_on(tegra->phys[i]);
+		if (err) {
+			if (!wakeup)
+				phy_exit(tegra->phys[i]);
+			goto disable_enabled_phys;
+		}
 	}
 	if (tegra->suspended)
 		tegra_xhci_program_utmi_power_lp0_exit(tegra);
@@ -2367,7 +2375,9 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 	goto out;
 
 disable_phy:
-	for (i = 0; i < tegra->num_phys; i++) {
+	i = tegra->num_phys;
+disable_enabled_phys:
+	while (i--) {
 		if (!tegra->phys[i])
 			continue;
 
-- 
2.50.1 (Apple Git-155)

