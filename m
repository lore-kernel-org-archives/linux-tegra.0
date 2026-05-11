Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535E3FA5FA
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507856; cv=none; b=CpApyr86w34427lkH9ftT+koc4NOb9iXAL3TrAiPpy6gOGeETXrI//9xDq1lE2EM3hpYkUvJSdhs05jfVb8LestjzS2RekGbBuhe+PkJvOlncGRgjX94mhHoaDXPDa62faBTeeseLuppscw8MUyrcGmc+XOyAJbxNVpfq9QoGuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507856; c=relaxed/simple;
	bh=E1H1+nd/RwnK9LuWJGKbmqe8Wgfvhjt2SMIIonrseao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fr5N794Gudq7ql6XmNu13+PjSDpHPmKYjyj1vidmgxUq1PyW89fxnIClYoPVVr95hfuC28hEAdCsyfuyoD8asq30uWipY6KqX2rMM9RJCNLP4THaPvhcHowXgC5JB8231C9IzFT8LT+gEzmH2rGWFBjW03T++Few44JwHkCnqwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZxQ5kuP; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZxQ5kuP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bb91b426e40so723859966b.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507847; x=1779112647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BY8lqIlaX558zAJe1pNahwarYdn7KKAgYehteYdm61E=;
        b=EZxQ5kuPJDd822ELEn5XyU1VzeTw1w+Mjno0plhe6QQMrVl4pJkiu9MJGF7kX8Xo4l
         gvM7IsTcSy+siGPSHFUR3253RsEOXHUFH+obV8+28ygPaOsSLAnxoqts3fG168PMYZCS
         ALmmejwb4IxfNAMVXGTTK0UHND39pxpuqwy67e6qFOMIwDEhmvVYmI3gzBOXbL+okxDE
         SvHv1ML8ayH1IPCCpJZuTAzu2+FS2xu7RQ0KsGgAbHcX9vDjEesCGTtqIQRzhN5dXlEI
         6apD2MAkvfWbtQlWVHMWPJ9SNcVinNv0amZ6p8f0RGdzZaLGPT1Jq+6mmhQ1S1ayOtVZ
         2VjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507847; x=1779112647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BY8lqIlaX558zAJe1pNahwarYdn7KKAgYehteYdm61E=;
        b=scp5ZvT4cbYBV/S/pYkf61uIX5JEj/lZIRaJZf32+No+i31kUV9X9W3zp5ZRyA7ajW
         Mbihx1qm3/WrPcPqdtn//CwKbOnCJHw2T2qw66xNJDY3bio5u59i4Q2baR0S33/LVyBa
         0YtVoM3JfEvv1H3GKnQfHjiPve3XS46blHNH/uBh7L9sQGn/BB+okDkgTf3mKUeBra15
         XGMzvexlvd9ofH6JzGtixxonD2FuPChyVWzOmubigaeoQ53Esp2qKweVlOx6H/K3K5j6
         2SZznYX+7kjTsPrDDuObMicLFubnMJGuUOYVuWGaS94HEl9G7xxVEMiCWUJyvwdHFD/X
         IK1A==
X-Forwarded-Encrypted: i=1; AFNElJ8fXyHOABE1hEchMqZt5NszrfTbdEIUhFENoPvTjfVMzR6lxEEgM7wdfsbkG+KJRoo9jLM/Pog+lJibTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYUi+lvgUPo76DR7zdRlsU/4QVPK1m6KUchvmF0COPk2Ci1/Rn
	eSqF8vfgK0DC1oH50yeQqzevqaQ5LfOOy68jyrPUtmRanqkqIkVA24NP
X-Gm-Gg: Acq92OENWE09ffQAZIhsdMTR+mhxQVmDsAof5vF6SIOCvPwnwQq0fYy//Y5zzTXPw5H
	572pNPB0FMYFdXAHIJqTYVLZEx7IivKzfOQS/EaRCgBlKX15raI3ds+fsFpPPeRYLEXhzYhvTCY
	vdrnmr3/zeAn8PR7U+fFkxaAG+GN/pGrJnCUCdpRSkUgZ2bqMwWhwMqskTdjWttGGM4WCI0BTx7
	xml4P2JWhApH4d3oWnP+o7Y77bDYwyoqRhZNv9lCKuo92UmPak/ixnLfmGaBFRly+hc5LE6qsVr
	Z52uPc6pM67OKwIpej37srTe8ikRwC713YT8RXCRVKiwpk+wHid2Fen6ml9wSTNwgKUqJogcUdo
	gsHW4pgSC0zQ8aEmnJ52Jr30hpkYk12rrG7LilYnHAp8X4pPBZ8rgnWn/e9KLirfmP8OITfXPs1
	tH8UXJxmMy1g6L
X-Received: by 2002:a17:907:fdcb:b0:b9d:3e5e:fd32 with SMTP id a640c23a62f3a-bc56a6498c3mr1324021866b.8.1778507846254;
        Mon, 11 May 2026 06:57:26 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 2/6] usb: chipidea: tegra: Avoid controller/PHY init if bus is externally controlled
Date: Mon, 11 May 2026 16:56:57 +0300
Message-ID: <20260511135703.62470-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the USB controller and PHY are externally controlled, then the
registration of the controller and the PHY initialization should be
skipped, since these configurations must be done by the device that
controls the bus to work correctly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 36 +++++++++++++++++-----------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 372788f0f970..593390a818d1 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -32,6 +32,7 @@ struct tegra_usb {
 	struct clk *clk;
 
 	bool needs_double_reset;
+	bool externally_controlled;
 };
 
 struct tegra_usb_soc_info {
@@ -312,20 +313,25 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
 		usb->needs_double_reset = true;
 
+	if (device_property_present(&pdev->dev, "nvidia,external-control"))
+		usb->externally_controlled = true;
+
 	err = tegra_usb_reset_controller(&pdev->dev);
 	if (err) {
 		dev_err_probe(&pdev->dev, err, "failed to reset controller");
 		goto fail_power_off;
 	}
 
-	/*
-	 * USB controller registers shouldn't be touched before PHY is
-	 * initialized, otherwise CPU will hang because clocks are gated.
-	 * PHY driver controls gating of internal USB clocks on Tegra.
-	 */
-	err = usb_phy_init(usb->phy);
-	if (err)
-		goto fail_power_off;
+	if (!usb->externally_controlled) {
+		/*
+		 * USB controller registers shouldn't be touched before PHY is
+		 * initialized, otherwise CPU will hang because clocks are gated.
+		 * PHY driver controls gating of internal USB clocks on Tegra.
+		 */
+		err = usb_phy_init(usb->phy);
+		if (err)
+			goto fail_power_off;
+	}
 
 	/* setup and register ChipIdea HDRC device */
 	usb->soc = soc;
@@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	if (of_usb_get_phy_mode(pdev->dev.of_node) == USBPHY_INTERFACE_MODE_ULPI)
 		usb->data.flags &= ~CI_HDRC_SUPPORTS_RUNTIME_PM;
 
-	usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
-				      pdev->num_resources, &usb->data);
-	if (IS_ERR(usb->dev)) {
-		err = dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
-				    "failed to add HDRC device");
-		goto phy_shutdown;
+	if (!usb->externally_controlled) {
+		usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
+					      pdev->num_resources, &usb->data);
+		if (IS_ERR(usb->dev)) {
+			err = dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
+					    "failed to add HDRC device");
+			goto phy_shutdown;
+		}
 	}
 
 	return 0;
-- 
2.51.0

