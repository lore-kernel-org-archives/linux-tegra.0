Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40E82D5922
	for <linux-tegra@vger.kernel.org>; Sat, 11 Apr 2026 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775916069; cv=none; b=lmCUCGw0TNbe2BTA1ugvsRlJU/ZPqmC1szlOmz9tgGPaq2i/UtESsHSv5GGLHQmfkLl2S8dQ9rghvD9rpHpUa11C8y2/3sJQHLkxJnlK6PngaAJhk0ButuKPoJ5gPUswsTxQ1mM5NxhXBEB+9kowsC71Oi4hWSxS0k9ttN/rCds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775916069; c=relaxed/simple;
	bh=bRggQusfsP8ARoca8fSIQkMbx/v48QP93L6U+qX6K4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RkrDAxQQNj1bI+NHQ8MGKBhvWI4c0jX1eQWbZ6YSSGi6wlwRb+Lv50h3AwdLJjiZT46B4GyH6AzfaFQumyJEj6C1gq/xYIEIjtNu5NznWEetxvxOcpSLzcpD9ADXX4filCaznU8e/ABuB9Q4pB7rdMjqe7WMedLdWaC9LlSpFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zb5NeCNw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zb5NeCNw"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8296d553142so1546310b3a.3
        for <linux-tegra@vger.kernel.org>; Sat, 11 Apr 2026 07:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775916068; x=1776520868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VL7rjfcZ2WSKs9LOYGYJ/rM1tEVZ/V20e+rMckrNDqg=;
        b=Zb5NeCNw9m65+Rt2oV82q+LRcIwA/YiyKAQukU+El9S0XOM3NmiV6oveGZuXe+Hx47
         zkJ8zZtQRy0uFspwzOCnSbYTmCGeyY3CXQwVqmP5d4JpT5BlK2t/cvPph7i6iGiKnq0p
         +Qks2FnpV8mSUzidTQUQO/iMY4EpovJaNkCo5kxJBW5Lt4Q8VQ+pPNkYbMy8oFNmzWoz
         k5+uaQkxUJlOFJGncSMoEny7xzqrvijEbmC+f26zhmJwEngsSyi5a7KfyJJy/gafp9Ii
         veH0nT90HLT325DIB0UyoQXQhHfV6meLsJYJJn4PMvQpJXBAYs6pvhkWZW23KgXh+ECN
         OEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775916068; x=1776520868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL7rjfcZ2WSKs9LOYGYJ/rM1tEVZ/V20e+rMckrNDqg=;
        b=s69e6mIgsss2RINVsbecioAUT9agDfUqnJanMAST1r33p2z93Yy4teo52QkGm9KAeK
         CMZFQdHVKFqQTIuBpsWPZ3KgFIcaLsTbGG8AbQKT0TZElOWfDwNWeGRSwMdRiL/tHsOP
         /qCfpOCa0RuKAq2ClQQmZxQYEmCT0668mIVey5GFQdCbQVkoeVN+rJAN+DpSPVQCu7tw
         s5Sm2kMDe3JhErgnA0hm4KTLS+4I9fMoG6J27ClQ1kxI5QiOPHgvHLpTVHojf5nLzo9X
         hRLAuIGAjqRHVry8l/lg0kLg/DK9mmF7TsY0drMO5fyah/7E69EjcUFPtn+9nZhyMiwy
         RYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8K6fwCCJtv1YrlHdPDxkq6Xy1CEHhNjoQVTxiVzSBHso4Goii7FxglxCPd0kI2XuheTOgyWaeLcYZCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMCcqYPpFrCezQO0JaZPqNoN/kju+E8zcqhZz6FSFnmp2tVY0
	dxcos6FxtQ8lEI/VMDw6KwqPnoJd0G8XJgH0m9GTnqEcrnonkNdYpw/8K3OM2g==
X-Gm-Gg: AeBDievqYH37WpCCM5zUTmuPb4GD4WdBoak15rwdhwkrxcHTl2zhgAab9vu0V8L4GS7
	bOOalx2Ev0GncK/uIW+CXyxm0+kzz93bNXxqBVBZNSkEMNn2PMKFKu7wmJLIJM2cwYyVkPsYC46
	iWVTjbWz+cbgEdyyOKkDIJtS3fMM3TFn3jsBztR59Zl52s66PoflMQ6ndLlt+m7vMvQW1R1+NYF
	RwQu2td0wSVS7ButTSGNeTv6N3QhRjIaEw3V15tfoLcel0N+QPgdXaoX0E+ezHrepIdAMxdOumT
	aG1ANyvDv9j9TzmY/ZOuZFN8Ea38wDQF6UgvWaAJ3RadLHXD5rlDIYhzgl5wKJ0IvGVul30i51c
	PrpziEIb9+qwNCEFxI96gpxOF6WpbqVQ54hfHuOnQTZJ6Eow+ihOg5XsvWKiRKWLbZHtge6kNt8
	2AYBjwUpmtJykm9jP+48xffpK6aONx7n/moiVh51laIQi89g6ezLNGD2pTgxxRFkf4p4hRlYbVp
	nbWaWcoViUtKT+CsPTiGp4=
X-Received: by 2002:a05:6a00:10d1:b0:82a:6de8:fa50 with SMTP id d2e1a72fcca58-82f0c1ff27emr7921533b3a.18.1775916067832;
        Sat, 11 Apr 2026 07:01:07 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.113.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c311a06sm6712533b3a.10.2026.04.11.07.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:01:07 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: nvec: Fix block comment formatting
Date: Sat, 11 Apr 2026 19:27:42 +0530
Message-ID: <20260411140038.5041-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PLace the closing */ of block comments on a separate line
to follow the coding style.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..4799510d2d12 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range.
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0

