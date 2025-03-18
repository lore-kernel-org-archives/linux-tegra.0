Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACCF1A238C
	for <linux-tegra@vger.kernel.org>; Tue, 18 Mar 2025 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742279751; cv=none; b=KsL7s440ENIx34lUTJlTAHTY3kfVrV/Y2WhVxMFTnvwb1JqQlc2/+n04KPQ46KBTf1NhGaH+PzWWXTy4hvHfg+0H/LmLGzA99psnxxCucAadJoFIXPmfd/xbE0B3t0mUd+BAUyyVpRJ6rZ17q5aZBBxKY5V05IGwwfXegQkeA5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742279751; c=relaxed/simple;
	bh=BjnBKssJqPzZNkcGGVw3IUuCNVxX5rByqu0eojHtaxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ekx8I1raEwDJH6ep3WBMwmUhjqqXX3VICOXonYScypMwCXJ6mz6NV7Cf+pPuT5ZT8JLdTMmE7ipJLa9cilLEJP40ues+kHrtp613wxcwDm8QHNsaQJVnCTe1+5zOpjBw6Gn0yXgYoIFosxc9sSG7IGFkNygHZ6nt1CVpyaoJ28I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IaSe35HR; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IaSe35HR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=R5tub
	IkLGLLauxbma/eCHLbMxtXUO/cXsdIf0aGk0vM=; b=IaSe35HRlr+O00Tn+gVG7
	Zq3ltfYBuFBPMdtP12nP1ACPF75RBIE3Cm88u+cA2SbI8/LLyScE+51NWbjBMdvl
	fYkG8n6cq7Bo4+2QyZc9hL2BtAkASERvhyQ1AS28AqSqdLwfJJIf6eRbudC4CIxg
	VAwBer3lpESVCwwDE6+BQQ=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnnuYSFNlnP+WyAA--.9231S4;
	Tue, 18 Mar 2025 14:35:03 +0800 (CST)
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
Subject: [PATCH v2 3/5] drm/bridge: anx6345: Switch to common helpers to power up/down dp link
Date: Tue, 18 Mar 2025 14:34:37 +0800
Message-ID: <20250318063452.4983-3-andyshrk@163.com>
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
X-CM-TRANSID:_____wDnnuYSFNlnP+WyAA--.9231S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4ktrW5tF1kur4rGF17Wrg_yoW8AFW8pr
	13C342qF1S9wnYqrs0kF10gFs8Z34DW395GrWUCw48u3WUCFnFy34Sy34fGas5XrykA3Wj
	qFnrAF9rZFyvvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jTT5dUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAEUXmfZDcXVgQAAsB

From: Andy Yan <andy.yan@rock-chips.com>

Use the common dp link power up/down helpers to avoid duplicating code.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

(no changes since v1)

 .../drm/bridge/analogix/analogix-anx6345.c    | 30 +------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 83d711ee3a2e..f4fffe4bbb30 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -143,35 +143,7 @@ static int anx6345_dp_link_training(struct anx6345 *anx6345)
 	if (err)
 		return err;
 
-	/*
-	 * Power up the sink (DP_SET_POWER register is only available on DPCD
-	 * v1.1 and later).
-	 */
-	if (anx6345->dpcd[DP_DPCD_REV] >= 0x11) {
-		err = drm_dp_dpcd_readb(&anx6345->aux, DP_SET_POWER, &dpcd[0]);
-		if (err < 0) {
-			DRM_ERROR("Failed to read DP_SET_POWER register: %d\n",
-				  err);
-			return err;
-		}
-
-		dpcd[0] &= ~DP_SET_POWER_MASK;
-		dpcd[0] |= DP_SET_POWER_D0;
-
-		err = drm_dp_dpcd_writeb(&anx6345->aux, DP_SET_POWER, dpcd[0]);
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
+	drm_dp_link_power_up(&anx6345->aux, anx6345->dpcd[DP_DPCD_REV]);
 
 	/* Possibly enable downspread on the sink */
 	err = regmap_write(anx6345->map[I2C_IDX_DPTX],
-- 
2.43.0

