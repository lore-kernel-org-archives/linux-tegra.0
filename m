Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669945;
	b=OTK1+b3CluInUxw1JjPawB/w5I9lio3oPYEL4IPVvn5tuwX5Vza39cozz1jbFzYFohs3
	 JRzbu/3yVgebx31A2WqGtMHzL9LJV98mzyeXEEx+8IzgMZRIZx4RTEw3KgQjHVqmcgIX0
	 MNl/GI/yL0fF7xbeWP/kBp2ldDHK3xCMZQnfYBV8ygftNDdLyzOoci9D1nyxmLmj44Lez
	 QAiGz3UPktHaAa3po0oiNtRfRkO+2c7j6ylpo77uUPIQFSC4nbInYYQWJIspK9hm+UrjC
	 Et7Gdxun8AMG/xDJLsy86J0L8aTLUS8YzlehFfacwcgJNmGQKmfZjoLNdR/gerHS1mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669945;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=frAvMo+ea520KGep5xW8OKxT6oKM7N9bBISe9yCmkzU=;
	b=MyQqXPza5hqon/AWZIBcV7MgdAsG1mvq6p2OdYESTwpjlXLVA2q7e7dvImFNUwlpggQv
	 VRPGUpWCm/9srDHET08NFXAPakxV5bPqqf6dpLenwyMImN/CRR2ETXYgOx/BvMXJH0hC/
	 aHELaQH9VEhBL2r4U6CkuJrD9cx1sWWAZePLCtp36J+Zzb8dzNwDGEXcellEa6lC/Jg2R
	 aTKQf6lRswBs3T3L2SZs1MdngsH+W3pd0IYTd7mYBNHoU7wnhcWuIUk64TFplQKjNd+kp
	 X2NmyERDV4Y4g9lflIaNJBkRWBh4KiXbWgS6akZ0kqEqBTENKIo5tyjzlR9hHLsSIoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=SPUqFbPH;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134A1606A681;
	Thu, 26 Nov 2026 05:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 134A1606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=SPUqFbPH
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795669940; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=frAvMo+ea520KGep5xW8OKxT6oKM7N9bBISe9yCmkzU=;
	b=SPUqFbPH3u4WYhuOGlN/mCXkK3Zu5Prz5jU1EKxUprTdW2Eh4vnYdEav4WBFKSIU0zFmJ5Sma4tzbPwGDs+2n/JYiiYRtvVJ9FsWe6eXkr3zFrsPVPy6qRj0J8ugJAIC2887EQ57tblMdt8Xy4E+5L8PppzCKR3tLHR3cXKhy44=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XFTN1en_1795669929;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFTN1en_1795669929 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 13:12:20 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>,
	Kartik Rajput <kkartik@nvidia.com>,
	linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
Subject: [PATCH] i2c: tegra: Fix HS mode clock calculations
Date: Thu, 26 Nov 2026 13:12:07 +0800
Message-ID: <20261126051207.3099199-1-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HS mode support overwrites the selected non-HS tlow/thigh values with
HS timing before calculating clk_multiplier. This makes Standard, Fast and
Fast+ modes use HS timing with a non-HS divisor, while HS mode still uses
the non-HS divisor. The resulting div-clk is incorrect and can produce an
out-of-spec SCL frequency or make clk_set_rate() fail.

Keep the non-HS timing values unchanged when programming the HS registers,
and calculate the clock multiplier for the active mode. HS mode uses its
own timing and clk_divisor_hs_mode; other modes retain their original
timing and divisors.

The higher HS div-clk also affects the master code, which is sent using
Fast-mode timing. At 3.4MHz, the default Fast divisors on Tegra256 and
Tegra264 would result in master-code frequencies of about 457.7kHz and
412.1kHz respectively. Increase the non-HS divisor when necessary to keep
the master code at or below 400kHz without changing the HS data rate.

Qoder, an AI coding assistant, helped analyze the issue, develop the fix
and arithmetic model, and draft this description.

Fixes: 978b3ccbbac3 ("i2c: tegra: Add HS mode support")
Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-tegra.c | 36 ++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a81ff2c33..4da98fe4a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -877,7 +877,8 @@ static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
+	u32 val, clk_divisor, clk_multiplier, clk_rate;
+	u32 tsu_thd, tlow, thigh, non_hs_mode;
 	u32 max_bus_freq_hz;
 	struct i2c_timings *t = &i2c_dev->timings;
 	int err;
@@ -957,6 +958,21 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
 	}
 
+	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
+		clk_multiplier = (i2c_dev->hw->tlow_hs_mode +
+				  i2c_dev->hw->thigh_hs_mode + 2) *
+				 (i2c_dev->hw->clk_divisor_hs_mode + 1);
+		clk_rate = t->bus_freq_hz * clk_multiplier;
+
+		/* The master code must not exceed the Fast-mode frequency. */
+		non_hs_mode = max(non_hs_mode,
+				  DIV_ROUND_UP(clk_rate, I2C_MAX_FAST_MODE_FREQ *
+					       (tlow + thigh + 2)) - 1);
+	} else {
+		clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
+		clk_rate = t->bus_freq_hz * clk_multiplier;
+	}
+
 	/* make sure clock divisor programmed correctly */
 	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
 				 i2c_dev->hw->clk_divisor_hs_mode) |
@@ -978,20 +994,16 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 
 	/* Write HS mode registers. These will get used only for HS mode*/
 	if (i2c_dev->hw->enable_hs_mode_support) {
-		tlow = i2c_dev->hw->tlow_hs_mode;
-		thigh = i2c_dev->hw->thigh_hs_mode;
-		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
-
-		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
-			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
+		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH,
+				 i2c_dev->hw->thigh_hs_mode) |
+		      FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW,
+				 i2c_dev->hw->tlow_hs_mode);
 		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->hs_interface_timing_0);
-		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->hs_interface_timing_1);
+		i2c_writel(i2c_dev, i2c_dev->hw->setup_hold_time_hs_mode,
+			   i2c_dev->hw->regs->hs_interface_timing_1);
 	}
 
-	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
-
-	err = clk_set_rate(i2c_dev->div_clk,
-			   t->bus_freq_hz * clk_multiplier);
+	err = clk_set_rate(i2c_dev->div_clk, clk_rate);
 	if (err) {
 		dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
 		return err;

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.47.3

