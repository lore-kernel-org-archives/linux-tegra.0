Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8549919EED3
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 01:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789955996; cv=none; b=WfbTunyi31YqEHdTiSXzxwbDnZ5jfDJkiQIThQp2tGWdGlrRi3E1jpTEgHlVOOFEuJC1niiX2WsaZ4GUsQKlwjSuO7dWXOWEkD+5fg/lchBmHYuK+nkUfLs1CvYBbwIaUfbGRNfBkTqI4arm7JGf/neYw5RKILyCW8Az5i83Gw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789955996; c=relaxed/simple;
	bh=kW5bVQRCoqrI5ZVf1ECPBcmjU5MFYED1PQS4A/dkRFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G74bFaOy5EkiyWzjaeK6oNN+2pllahqKz3MD4hFghM+jxaaQlljyluzTKv+R6wf4pltDXdsseM16alX1H+HioRBVYunsSTIvpNBDyP5FbbsNqwlbhoFuZCQs4p7mnMBR9fGyMxoFsudJLYgEOa4sqs7Q74kAOVhai4B+zMKp6E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQG0VbOw; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQG0VbOw"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca069c8so24649115ad.3
        for <linux-tegra@vger.kernel.org>; Sun, 20 Sep 2026 18:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789955995; x=1790560795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5asLPp18b/l+0s1qeYWjIfvnNcbJX0h5CaYuSOAhSt0=;
        b=KQG0VbOwaJODsTx8ep2xVGKUlfPzJHjod3p5oWevHxM9G+IhMQHQFTtVoGWEP+QMXy
         RdYBrm1CyWVhfSoU/f+zNGC1V/Mt1rgoioDFQXvf4BFFb2MYbvJB+AXXy2p9SG19QjWy
         CWkYMy0pGO/7IaWaXtR/I6Islxno2tOJOI1TWswE/FfgbayG2JlFDbqKR7PfVJ3GvxcR
         vdYnY+G9gHVPJ3468KuKgG900uXuqr32I2+2ZD2VmQo2oB65T1J0aDk/5B0gmAYpNg4X
         v/igLOaA3LBG59DMFzAMltSNrpOre6+kxFjhO/reRvzMcIZ3IhRINKvLapTjzQxCE2uj
         k2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789955995; x=1790560795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5asLPp18b/l+0s1qeYWjIfvnNcbJX0h5CaYuSOAhSt0=;
        b=24bSpidhWJNpBAJ9LCdAgwckqYrow/AnuDuHe9gKfsRAe3Cg+yHoqDxGC/hqPTJXC2
         8FEeM2qu55VF0MqFl267S3A/gArkhWVL9pRSIyqn+f1BaDkI27069pBiAH3KFAUIMGxy
         QQBa0rNyTdEdFEvBkZUZIqLU2u4V7NKuW+RKmm2j0b14POhW2SdBtP6wHOeFce6y1a22
         ln+NP4Y6vRfBX3SdILLj8LCCFcvV6j3AORGQylrDepNGSpgwb6CTzFf7447GCHZBfrE7
         JIn6D+FoTDYptr4V4aSK5ICX/TvFziruD3yBlO4GHHGQkYuxZUXqf/YTRHb4nOgOun4y
         c3Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzQOY+FD5yT0S2Tty6OSiEifSvFfsFtGvxkKaR7ISZIwwaRUhK97iHdVdROEGJfSNdXnfqwfrbRFWmmOQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lMsngZ/uFITMsIz18BzkkT48GDvss9WsjZNqq1xfRDNvarjCI6
	Cz0pKSf62FYirBzN5UCIsP9hVNvqS7UKtaT/OhAF9bt3L0BIxmf1KUq+ZBAKFA==
X-Gm-Gg: AYBFou3nmkPK19MOD9bSmebIA9mcgeSxIANVQsiVZwbAJmBi6C65/Mojs+dM72XEaRe
	gD7Fbl2iaQ0Oacs8VbStnpxfWZ7lUgT8fnXugY7t7D7P062JXV1KTkIVDuVdcOAOBl4vnQ6NlQR
	5HYPDJy+3+G+n+gXnxZftwVHwifP0ZzuDMtufCa+0XOQTh1vyOUJqwzgiZpdwF+Ui1cFlSlcPg0
	71+3mm+a5JfcHSjJQ9kjlB9FtOD18hV8VwrPLLAKn5bKMlEXCIbffz+e5ViADpgLkkWJ4BrfiVw
	fIJrmDo+jjYe/r7htt5ikOegTuzkPdwIPiSFRYCNhasIIO/63dp+pBSYpi13s3VFRcYHPbBn8a3
	7XmWNSNFbXIIeerHibmW/NE+Z2aATIC77I71wNy+UUbPSZ9rCAqd6Dzj9zc9dDeElfuY0S/gBcs
	g+yW2wISnvVuHSu0v9rfnyCQLHKr7IAOy81rcJ1QWpW+cBUfpuI5azZirB4J+haWDQNsDPiWNfI
	RaN00RDug2lglQ8ynu7BLOz2kr6CL0n8PzF5/bi+ODkLPoeYVkw+Recp1bPvwXnH/jibOTMXxXe
	BFVb0rfFKhSmpKINpDjUwBNfH6TNkIoxhZoiIaDat2jEgVrTupayRSGdizI=
X-Received: by 2002:a17:903:2acc:b0:2dd:c100:b2c4 with SMTP id d9443c01a7336-2ddc100b34amr85692785ad.47.1789955994727;
        Sun, 20 Sep 2026 18:59:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df46c0dad9sm7458995ad.29.2026.09.20.18.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:59:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: phy: tegra: embed UTMI pad config in phy struct
Date: Sun, 20 Sep 2026 18:59:52 -0700
Message-ID: <20260921015952.1047410-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UTMI pad configuration was kept in a heap-allocated void * member of
struct tegra_usb_phy, even though the driver is the only user of the
field.  Embed the struct directly in the phy state to drop the
allocation and the void pointer indirection.  The config is
zero-initialized when the phy struct is allocated, so no extra init
is needed.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 15 ++++-----------
 include/linux/usb/tegra_usb_phy.h |  2 +-
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 00443a7beaeb..12abc99bdf89 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -392,7 +392,7 @@ static int utmip_pad_close(struct tegra_usb_phy *phy)
 
 static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 {
-	struct tegra_utmip_config *config = phy->config;
+	struct tegra_utmip_config *config = &phy->config;
 	void __iomem *base = phy->pad_regs;
 	u32 val;
 	int err;
@@ -549,7 +549,7 @@ static void utmi_phy_clk_enable(struct tegra_usb_phy *phy)
 
 static int utmi_phy_power_on(struct tegra_usb_phy *phy)
 {
-	struct tegra_utmip_config *config = phy->config;
+	struct tegra_utmip_config *config = &phy->config;
 	void __iomem *base = phy->regs;
 	u32 val;
 	int err;
@@ -888,7 +888,7 @@ static void tegra_hsic_writel(struct tegra_usb_phy *phy, u32 reg, u32 value)
 
 static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
 {
-	struct tegra_utmip_config *config = phy->config;
+	struct tegra_utmip_config *config = &phy->config;
 	void __iomem *base = phy->regs;
 	u32 val;
 	int err = 0;
@@ -1324,7 +1324,7 @@ static int read_utmi_param(struct platform_device *pdev, const char *param,
 static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 			  struct platform_device *pdev)
 {
-	struct tegra_utmip_config *config;
+	struct tegra_utmip_config *config = &tegra_phy->config;
 	struct resource *res;
 	int err;
 
@@ -1345,13 +1345,6 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 		return -ENOMEM;
 	}
 
-	tegra_phy->config = devm_kzalloc(&pdev->dev, sizeof(*config),
-					 GFP_KERNEL);
-	if (!tegra_phy->config)
-		return -ENOMEM;
-
-	config = tegra_phy->config;
-
 	err = read_utmi_param(pdev, "nvidia,hssync-start-delay",
 			      &config->hssync_start_delay);
 	if (err)
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 6343f88df5de..953ba9f06c2a 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -76,7 +76,6 @@ struct tegra_usb_phy {
 	struct regulator *vbus;
 	struct regmap *pmc_regmap;
 	enum usb_dr_mode mode;
-	void *config;
 	const struct tegra_phy_soc_config *soc_config;
 	struct usb_phy *ulpi;
 	struct usb_phy u_phy;
@@ -87,6 +86,7 @@ struct tegra_usb_phy {
 	bool wakeup_enabled;
 	bool pad_wakeup;
 	bool powered_on;
+	struct tegra_utmip_config config;
 };
 
 #endif /* __TEGRA_USB_PHY_H */
-- 
2.55.0

