Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3545B2F7EF9
	for <linux-tegra@vger.kernel.org>; Sun, 26 Jul 2026 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060271; cv=none; b=uN3r9pyESlewTjqSrEcGCFrLvVZ7GfA4F+/TZXaNwZX54ZJ1GaucW+sds0cq3bgfB9aGD1zzhqSyLFQNuhMm0D0oYsBlCuVuQFnAqaZ1qEDB/iqFaOCpbo2d/pPIr7Wg9a/WN4sR5SVq0+aJ8eSM7Iam6by7IO4ecy/IyI+fQvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060271; c=relaxed/simple;
	bh=7B35YZE6oc15BiSnsGvUCtFqLPIM1pzfUZ2v9rqMQOU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gVuYJZIkT8dkVQdolJSHpQvkU837BtbdT+1Gr4fiiIshP9t2CYRLP1QMc/Z8CGIbXXH7kN/8VgXeVUJ2Ay2hJAh1W4+3mdN9Ys5KtPQA5JPVNMtVPLW+8UWtoZKk7TGOn42FZqooy8Eyu5CeHkAUMYUoX57xKS5ddQDBfBE1vFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlFNZsnf; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlFNZsnf"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1319553a12.2
        for <linux-tegra@vger.kernel.org>; Sun, 26 Jul 2026 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785060269; x=1785665069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ylvgAcOl9oKpTpFug9fyDy646d3xIKNYqdv16u3reo=;
        b=WlFNZsnflWfShpHEh3bvTFxbKZlpcot6jk4zqG0cwR0DQ9pbR6xcTOOdPw8wsZG9HO
         M6FS/xj7sBMIiSbZp9E9nqVL463MXwVO62AR3QdhvU9HGU6YDluogcIAcN7Yp91CI+Qj
         pb7AgN2AKrRkPkIKRfiQkESyjG4+EijudsFUP0ZLP0F9dkR6a64bTHw5hz1WebLDK6tM
         exHFVomTZadEocaQEuMZGzzhFqECJ+dZQhepBpEDrtJW0NlD8fb36PU+3j9xGwGSsPSU
         8SebSgGTSx0ASsYjCyziex9rYopFHULbel0Nh9AgeflofvSfd9OK+Hl4Ci9TIWy7TzhN
         F0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060269; x=1785665069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ylvgAcOl9oKpTpFug9fyDy646d3xIKNYqdv16u3reo=;
        b=ge9x2ovHFc/2MNF1qVARXannRlM6wt3C01aQz8TmqGguuvCDho96h2ffCng7g3O4hF
         K3nxLP5lfx8A9eEq8fXfMUwIsT1/Yzqh2YhGIUIwqJHMsdBMQzQBP+eyZid7vup8Qr18
         rTkL9UyfHvVKz7ivSNrWoLVNhQ6njzG3P5xPKc+3gvKN3B8t+dGIoRD6vY90iby70Ssc
         ABUyuFv9QE2Qp3hk+rLSqtmXutp60MQtzhaXEjAieEWD00KK4geGz/UKewRGuwipI/a7
         RhkEZMBSWFY/rgzaxmZvR8RFD33ueFD62ghuBi22GHGDfP62zaNHPQDFqEUQIUlDIDpG
         xO2A==
X-Forwarded-Encrypted: i=1; AHgh+Ro3+Pbv6EaZEhZuw9ue9zmr7Gz0KgbV06Xk3r8P01vMm/L2c3iZyZwmTgNRMLeCBLCdXII7qHxL5p18sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZuN74xYzKlpC1tEVkO0i6AsL1mxZebDKX2inC3CA5KHXU17c1
	/VN5SRa0ikwdVc9MDG7Fm4o8xBO7tuaXDQBaB6oR26r9cHofjtcxE4T5
X-Gm-Gg: AR+sD11ujyiS2MFDFZjun6dB5uQU4kvOx1H2CgBHgNvfYr85kyoHFURssdPl2Hy+kVc
	N7H7ekCRlUDr9Y3dGIrdfKmgZVOr9ELnH2GvUSUwPcK/2AQsmDxBEFoMLTJ1JNG2+/iIvV3H8+n
	GsK+uq6/24Ct/VaqBSFL4L0jEerhilVTMdvh/mYs3lRmDccOxj2YqGVNW8vyp0b7Aqr+JtSa1QJ
	2MybLXtx70m2po7Ut9MlI14unsVeYjeRQ20tzOK6HnbSlFLxYtOW0vP6NKzNSkKLLaOT+IXRrsk
	IA66HJJQ2h24+xy3sdS7+Fpb8qNQqiZV/XjMafnQnXNyGpkZqCDRw3NcDNrYmiqFd0jZr0wL2Rd
	GRvI7XEBJDG4Qx7l4qNzjbQMWU9/k3vcMmKdxzPaWZglSIBis6dIiwa2ZpM7ws9hprYHE1LvzEt
	qraAblv00GjCcFLFL+ivI=
X-Received: by 2002:a05:6a20:d12f:b0:3c3:83e6:c705 with SMTP id adf61e73a8af0-3c67df08725mr4678734637.35.1785060269292;
        Sun, 26 Jul 2026 03:04:29 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc57ae17sm16923506eec.22.2026.07.26.03.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:04:28 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] staging: media: tegra-video: fix syncpoint leak in tegra20 channel init
Date: Sun, 26 Jul 2026 17:04:08 +0700
Message-Id: <20260726100408.3262831-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra20_channel_host1x_syncpt_init() requests two host1x syncpoints. It
stored the first one (mw ack) into chan->mw_ack_sp[0] and only then
requested the second one (frame start). If the second request failed the
function returned without releasing the first syncpoint, leaking it: the
caller tegra_channel_init() bails out with a bare "return ret" on a
syncpt init failure and does not run its free_syncpts error path (that
path only covers failures after syncpoint init has fully succeeded), and
the channel is subsequently torn down via the kfree()-only path, so
nothing ever releases the orphaned syncpoint.

Release the already-acquired syncpoint on the error path, and only
publish the syncpoints into the channel once both have been successfully
requested, so chan->mw_ack_sp[0] never holds a released handle. This
matches the handling in tegra210_channel_host1x_syncpt_init().

Fixes: 0e2c4117c351 ("staging: media: tegra-video: add CSI support for Tegra20 and Tegra30")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..f8acb6834a0b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -429,12 +429,13 @@ static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
 	if (!out_sp)
 		return dev_err_probe(vi->dev, -EBUSY, "failed to request mw ack syncpoint\n");
 
-	chan->mw_ack_sp[0] = out_sp;
-
 	fs_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
-	if (!fs_sp)
+	if (!fs_sp) {
+		host1x_syncpt_put(out_sp);
 		return dev_err_probe(vi->dev, -EBUSY, "failed to request frame start syncpoint\n");
+	}
 
+	chan->mw_ack_sp[0] = out_sp;
 	chan->frame_start_sp[0] = fs_sp;
 
 	return 0;
-- 
2.25.1

