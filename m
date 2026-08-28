Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD2943785F;
	Fri, 28 Aug 2026 11:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917346; cv=none; b=NMSja8rehVynZjIOJE7DfkQK5WFVp9eHkAklFn58KqKWtZ8/ytcRMrPW6YSdNT/kyPNI+aGG+8R5iTouNsLfQWvieU/tcfuY188dwrfDDnASkqiP2iEDzIBbPHIZo7cSibtcXT6tzyA61HiXr/ATY52eQVucJrR+oX7cw9WJQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917346; c=relaxed/simple;
	bh=UrRRrRGioU2jwFOT4R0dWftSuqJLymr8z94go2/Ju7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mtNBbk0D04mNkZVrpynqBLTncHSzNpOzD/h+rRExK4In4Becq+MEJGVMPE5BVpzgedbh+EFv3im7splmTG/v9XwdNhDDQGbyMsMd/XvF0aarKSbvTGR3FbnCwPKdeahZKgHt0CC8V55vQksfINYXcVJ0QcPijtDr7zCoAZVBk1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowABnO+8SdJFqoBO+Bg--.43429S2;
	Fri, 28 Aug 2026 19:42:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] usb: gadget: tegra-xudc: Unwind device-mode power failures
Date: Fri, 28 Aug 2026 19:42:08 +0800
Message-ID: <20260828114208.49341-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnO+8SdJFqoBO+Bg--.43429S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4ktF4ftFWxtF1kZw1kZrb_yoW5Cr17pa
	1jgFW5J3ykX3sxKFnaq3yqvr15G3ykG348X34Iyay29rsrK34DJry7trWIqFW8Gr93Jr4j
	yr4xK342yr9rWF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUYf
	HjUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The Tegra XUDC role worker ignores runtime-PM, PHY power and PHY mode
failures while entering device mode, and sets current_device_mode even
after an incomplete transition.

Acquire runtime PM with pm_runtime_resume_and_get(), unwind each
completed PHY and pad operation on failure, and only publish
current_device_mode after all steps succeed.  The worker logs the error.
This is an RFC because the asynchronous role request has already
completed and maintainers may prefer retry or desired-role state
handling beyond local rollback.

The issue was identified via static analysis and manually reviewed.

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 38 ++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index e9d33be02866..41015e5dc089 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -696,28 +696,43 @@ static void tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
 	xudc_writel(xudc, val, SSPX_CORE_CNT72);
 }
 
-static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
+static int tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 {
 	int err;
 
-	pm_runtime_get_sync(xudc->dev);
+	err = pm_runtime_resume_and_get(xudc->dev);
+	if (err < 0)
+		return err;
 
 	tegra_phy_xusb_utmi_pad_power_on(xudc->curr_utmi_phy);
 
 	err = phy_power_on(xudc->curr_utmi_phy);
 	if (err < 0)
-		dev_err(xudc->dev, "UTMI power on failed: %d\n", err);
+		goto power_down_pad;
 
 	err = phy_power_on(xudc->curr_usb3_phy);
 	if (err < 0)
-		dev_err(xudc->dev, "USB3 PHY power on failed: %d\n", err);
+		goto power_off_utmi;
 
 	dev_dbg(xudc->dev, "device mode on\n");
 
-	phy_set_mode_ext(xudc->curr_utmi_phy, PHY_MODE_USB_OTG,
-			 USB_ROLE_DEVICE);
+	err = phy_set_mode_ext(xudc->curr_utmi_phy, PHY_MODE_USB_OTG,
+			       USB_ROLE_DEVICE);
+	if (err < 0)
+		goto power_off_usb3;
 
 	xudc->current_device_mode = true;
+
+	return 0;
+
+power_off_usb3:
+	phy_power_off(xudc->curr_usb3_phy);
+power_off_utmi:
+	phy_power_off(xudc->curr_utmi_phy);
+power_down_pad:
+	tegra_phy_xusb_utmi_pad_power_down(xudc->curr_utmi_phy);
+	pm_runtime_put(xudc->dev);
+	return err;
 }
 
 static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
@@ -779,11 +794,16 @@ static void tegra_xudc_usb_role_sw_work(struct work_struct *work)
 {
 	struct tegra_xudc *xudc = container_of(work, struct tegra_xudc,
 					       usb_role_sw_work);
+	int err;
 
-	if (xudc->device_mode)
-		tegra_xudc_device_mode_on(xudc);
-	else
+	if (xudc->device_mode) {
+		err = tegra_xudc_device_mode_on(xudc);
+
+		if (err)
+			dev_err(xudc->dev, "failed to enter device mode: %d\n", err);
+	} else {
 		tegra_xudc_device_mode_off(xudc);
+	}
 }
 
 static int tegra_xudc_get_phy_index(struct tegra_xudc *xudc,
-- 
2.43.0

