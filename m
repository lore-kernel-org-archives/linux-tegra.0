Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898A746426
	for <linux-tegra@vger.kernel.org>; Tue, 18 Mar 2025 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742279748; cv=none; b=GA6yopxOE2gaFrF2W63XWBW/MpwhEsXLpFgE5EnwC8t8EvevN1NavLojYgAg0wGMVE4yFgPlbX2SsaXjH0Jo0b2XVCDzvNa05LcJ+5rDdhzA9CnzqQ52J+gyPuZrv9HveFoJhu8YQhgmHmraAaq2Au9SX+tNll/vjXeiLdouEsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742279748; c=relaxed/simple;
	bh=g5LDPeZFEOQBI+DgPiE4h4bJJm4JY0NkSiAoW64Upvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5bz1KlhHQsAUU5OZ2RS95wfYP0C6WRdNx+UCsbY0XmXTALil7flGDwhaVChKhV+9QOmnuM8JE0KW3uw9uofZ6oX3EkZo8sCUfmxod52cnZYwNNvwS0F8Sxybs/XHExGMlhnOUCPYItu3SAIfMiuzHEV0qdk0KJDrLAR9O/QGWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nOU4A+w9; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nOU4A+w9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=rPBTU
	KbnNgaTouZNcb18EqWega5P/0Ty2iUC9/ZbyI4=; b=nOU4A+w9e3xPUle5k6gVe
	2Nq0w09lLfcCAG/oY3Q8JG3WogxWq7bzTzrsWO8I/3qtz9Ylahej3jDVzeVQhucr
	68HLOWRHmHnXt/4Z/RRhm8SuGBQJ/+7tPRanw9Og0K0NUtQcl86hrTb9PNTiTEC/
	UCJiJJKc1K62kr+8OGAMBA=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnnuYSFNlnP+WyAA--.9231S5;
	Tue, 18 Mar 2025 14:35:04 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: mripard@kernel.org,
	neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	dianders@chromium.org,
	jani.nikula@intel.com,
	lyude@redhat.com,
	jonathanh@nvidia.com,
	thierry.reding@gmail.com,
	victor.liu@nxp.com,
	rfoss@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 4/5] drm/bridge: anx78xx: Switch to common helpers to power up/down dp link
Date: Tue, 18 Mar 2025 14:34:38 +0800
Message-ID: <20250318063452.4983-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250318063452.4983-1-andyshrk@163.com>
References: <20250318063452.4983-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnnuYSFNlnP+WyAA--.9231S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4ktrW5tF1kur4rZryUAwb_yoW8AFW5pr
	1fKw42vr1xuw13Xr4YkF40gFW5Za4DW395CrW7Gw4vy3WUAFnF9a4IvFyfGas8Jr95AF10
	qr1DAasrZa409w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlXd8UUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hMUXmfZEI52+wAAsm

From: Andy Yan <andy.yan@rock-chips.com>

Use the common dp link power up/down helpers to avoid duplicating code.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

(no changes since v1)

 .../drm/bridge/analogix/analogix-anx78xx.c    | 30 +------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index f74694bb9c50..3d9daa885eef 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -656,35 +656,7 @@ static int anx78xx_dp_link_training(struct anx78xx *anx78xx)
 	if (err)
 		return err;
 
-	/*
-	 * Power up the sink (DP_SET_POWER register is only available on DPCD
-	 * v1.1 and later).
-	 */
-	if (anx78xx->dpcd[DP_DPCD_REV] >= 0x11) {
-		err = drm_dp_dpcd_readb(&anx78xx->aux, DP_SET_POWER, &dpcd[0]);
-		if (err < 0) {
-			DRM_ERROR("Failed to read DP_SET_POWER register: %d\n",
-				  err);
-			return err;
-		}
-
-		dpcd[0] &= ~DP_SET_POWER_MASK;
-		dpcd[0] |= DP_SET_POWER_D0;
-
-		err = drm_dp_dpcd_writeb(&anx78xx->aux, DP_SET_POWER, dpcd[0]);
-		if (err < 0) {
-			DRM_ERROR("Failed to power up DisplayPort link: %d\n",
-				  err);
-			return err;
-		}
-
-		/*
-		 * According to the DP 1.1 specification, a "Sink Device must
-		 * exit the power saving state within 1 ms" (Section 2.5.3.1,
-		 * Table 5-52, "Sink Control Field" (register 0x600).
-		 */
-		usleep_range(1000, 2000);
-	}
+	drm_dp_link_power_up(&anx78xx->aux, anx78xx->dpcd[DP_DPCD_REV]);
 
 	/* Possibly enable downspread on the sink */
 	err = regmap_write(anx78xx->map[I2C_IDX_TX_P0],
-- 
2.43.0

