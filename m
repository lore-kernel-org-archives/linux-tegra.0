Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20242D6614;
	Thu, 24 Jul 2025 13:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753362746; cv=none; b=V80Zws+LSOt/4IezpZ32rlCasRJ1CDMcw7pm5LsLM/WZOGjoUvYj8TcRG5UmEB4myBQw0yO4jOQHXT/NHWdY2gj16mBrlYxF8jHR3w+iKXdC9JEQA25ZrvDpzt4/JRlm4yezHl3z3ATQwI16B7tojXFZu8HI8RadqIGq81DMIMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753362746; c=relaxed/simple;
	bh=DqDisvUI7fPFycDWsUDlI/ksWHfJtT5+KAlRMyouAc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=si9JopFi/+Sr7GmmGfwc0/sf6tAycqJwK4+7iZt/IxTTzdmbpJ2TKa/fMhmoifyelZQKjpAcN7pZ8CzjlDhyHfG3dMmd8Taeuvp1BK2S6oFoRBObOtKLVAy80Ud7VGVIKJOKsamn4pouvwzGKj+Nikk1cz2JYQ77iR1/CM36bx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjAEzzz4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjAEzzz4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304B2C4CEF5;
	Thu, 24 Jul 2025 13:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753362746;
	bh=DqDisvUI7fPFycDWsUDlI/ksWHfJtT5+KAlRMyouAc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjAEzzz4+teYNLIHuorMBoN50S9frIBjrrKydIwPqisvpjzXvdBVPXHywWNJjqTjj
	 f24HAN4kFKjbGw87cUWQ5W8MeXh45U3DzcMVifDcJOlidjdrPAE+B0Df4qj2+MQy5v
	 sWxfW3WBICyi6b3x757+H0zvP0XWkUHxQ1xV09lK4TG5O+OSTx25pNI1VJnhTo/3pd
	 SFAOkqWsaS5NKPyXyk/ef9NTzrWVaFWfJcQJesalbiUId+go8WF9pAF1/ENI2LHzKE
	 ARkSPQAHDjhOjs0qGZrOjDlN0BTTg4vWz98H92BzaB7ecM41g0/Hc3H9xxPfaY4iaA
	 9PnJCeUxWCIhQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uevkD-000000000aH-2enV;
	Thu, 24 Jul 2025 15:12:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: JC Kuo <jckuo@nvidia.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] phy: tegra: xusb: fix device and OF node leak at probe
Date: Thu, 24 Jul 2025 15:12:04 +0200
Message-ID: <20250724131206.2211-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250724131206.2211-1-johan@kernel.org>
References: <20250724131206.2211-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to drop the references taken to the PMC OF node and device by
of_parse_phandle() and of_find_device_by_node() during probe.

Note the holding a reference to the PMC device does not prevent the
PMC regmap from going away (e.g. if the PMC driver is unbound) so there
is no need to keep the reference.

Fixes: 2d1021487273 ("phy: tegra: xusb: Add wake/sleepwalk for Tegra210")
Cc: stable@vger.kernel.org	# 5.14
Cc: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/phy/tegra/xusb-tegra210.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index ebc8a7e21a31..3409924498e9 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -3164,18 +3164,22 @@ tegra210_xusb_padctl_probe(struct device *dev,
 	}
 
 	pdev = of_find_device_by_node(np);
+	of_node_put(np);
 	if (!pdev) {
 		dev_warn(dev, "PMC device is not available\n");
 		goto out;
 	}
 
-	if (!platform_get_drvdata(pdev))
+	if (!platform_get_drvdata(pdev)) {
+		put_device(&pdev->dev);
 		return ERR_PTR(-EPROBE_DEFER);
+	}
 
 	padctl->regmap = dev_get_regmap(&pdev->dev, "usb_sleepwalk");
 	if (!padctl->regmap)
 		dev_info(dev, "failed to find PMC regmap\n");
 
+	put_device(&pdev->dev);
 out:
 	return &padctl->base;
 }
-- 
2.49.1

