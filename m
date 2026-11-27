Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744144;
	b=l5notEFq/MkFjbh2dZf/kwqvWX4EHjwcKtQY2JbZ2NDi2Jd40mNs4S/jwQ89ooEYXir3
	 OXjKmm/IqW23db08vFsYPdvRFEd7aTtfV0/GWH4d1RVrJeOYpGaKuy9EoQrY/43gvQLud
	 6Ydq6cg/1XoN/ZUTF7EzqDPJAUq7d4mvuIvYTacK5f7s7moi3IoHXpzjxv3nmhLoPIS+g
	 GgILm9quJy1Qi8VJKaKVEBiDshiaj9bGips1/ZP1g78GShlw8mjJ9SED6rnTp+1tjNJHZ
	 N2FyrhnTaaIg3Y4JPX1cGnR/nc3b/QBZAXtOTKbTYpZIis5XGRXP0OtLsYDQFaZfEMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744144;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fF/CSMdq+vIO3hseTvokfTbZUL51YXJzx+M163tsNXg=;
	b=gBSyd44OlBGJMYXylhdRYBiWUKDs6rjECKTpx3+1V6ss6plPYMA2ddWLKG0XAGp+hRqh
	 fq1adw6Hplc3GMd2g33A7bCZV7HU9fw8peFycm4Oy8K1yBXyklPHqdwxGx/CrfzGoNYj3
	 9L4+HO74rfy+Tb9m2YJYw0fWnRbYttqzH4r0ThES+njmBK83sauNTEYJCvPQ92K38nt9L
	 B3cFNaZEhrdEN78ZngToW/OMAeuPa/lw0q+bbvs8MQMezyznqIk70JrjIkLIQX6gj3JHH
	 9zqxOgtzeTcAmYXwODnu5GGz2LzVKjBoIgQiPQRxkfailfDuznwSCy6Cn1M+TymYuYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JJX0lqaH;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CE7606A332;
	Fri, 27 Nov 2026 01:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CE7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JJX0lqaH
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795744134; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=fF/CSMdq+vIO3hseTvokfTbZUL51YXJzx+M163tsNXg=;
	b=JJX0lqaHxciv637lvOiqHdqaA7sl71fzuPeJ76Q6uIpGIz1DcTfDAsSC9YJT3LceA0xmlKU1vAQhqb1TJiJaShU92XTZkZcp6kn/tJ2wZcH2xmIp9nbjtvjwc+E/Q1bv1eWeaj/QZ8bIRAAeb3qP5pUqYAqwELuz+PqJoEaSx/A=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R941e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XFW2zBm_1795744124;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFW2zBm_1795744124 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 09:48:53 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: andi.shyti@kernel.org,
	ldewangan@nvidia.com
Cc: digetx@gmail.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	akhilrajeev@nvidia.com,
	kkartik@nvidia.com,
	linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	jiangtianfeng@linux.alibaba.com
Subject: [PATCH v2] i2c: tegra: Fix HS mode clock calculations
Date: Fri, 27 Nov 2026 09:48:33 +0800
Message-ID: <20261127014842.412581-1-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126051207.3099199-1-jiangtianfeng@linux.alibaba.com>
References: <20261126051207.3099199-1-jiangtianfeng@linux.alibaba.com>
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

Calculate the non-HS multiplier before writing the HS registers. For an
actual HS request, use the HS timing and clk_divisor_hs_mode; other modes
retain their calibrated timing and divisors.

Keep non_hs_mode unchanged. Akhil provided the intended clock
configurations which keep the master code within the Fast-mode limit:
Tegra256 uses a fixed 208MHz clock, resulting in 400kHz with the default
Fast divisor, and Tegra264 uses 202.5MHz/3 = 50.625MHz, resulting in
about 383.5kHz. These are platform configuration values, not measurements
from this submission.

Suggested-by: Akhil R <akhilrajeev@nvidia.com>
Qoder, an AI coding assistant, helped analyze the issue, develop the fix
and arithmetic model, and draft this description.
Fixes: 978b3ccbbac3 ("i2c: tegra: Add HS mode support")
Link: https://lore.kernel.org/linux-i2c/20261126121713.57082-1-akhilrajeev@nvidia.com/

Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a81ff2c339f2..a63beb06fa10 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -976,8 +976,11 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->interface_timing_1);
 
+	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
+
 	/* Write HS mode registers. These will get used only for HS mode*/
-	if (i2c_dev->hw->enable_hs_mode_support) {
+	if (i2c_dev->hw->enable_hs_mode_support &&
+	    t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		tlow = i2c_dev->hw->tlow_hs_mode;
 		thigh = i2c_dev->hw->thigh_hs_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
@@ -986,9 +989,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
 		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->hs_interface_timing_0);
 		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->hs_interface_timing_1);
-	}
 
-	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
+		clk_multiplier = (tlow + thigh + 2) *
+				 (i2c_dev->hw->clk_divisor_hs_mode + 1);
+	}
 
 	err = clk_set_rate(i2c_dev->div_clk,
 			   t->bus_freq_hz * clk_multiplier);
-- 
2.47.3

