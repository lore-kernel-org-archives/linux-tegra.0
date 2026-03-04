Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B43CD8AE
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 19:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772651966; cv=none; b=rQAt4MvrIutVs2Wwy7ozb7KLWUBrwhZW4mth7a9sNj5FMIbhsgAY+FiU6EUHvUrZeujXfIX8Shl5W+2prML9z71MPPwo5bX/GrUJbBzQK4Q9AgfNO18sUPcACvq6Dlm4F8skIwKa5sRJJ79eVPWjY6UN+Fd0HatFwd0Y9t0Fi5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772651966; c=relaxed/simple;
	bh=KtMloLAjaYn+gwP362zAnW9O3LbVLb9ezwt4mXRDDfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EfJFw84cueTb9byc1la1rWNbFsojyRigTIsAeqKlOoA4IV28wWYU9Z+IFAIYJe+982Lcov4+WwqEKmXk9Qt11TGt/JQvxR1cIU+kMEorMoOJEU3C0Mf/hxZSUBMQkR65bwmnothEo31uzd6dmvX0i9m3N68KmGo5szebATruSO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecwj2P1S; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecwj2P1S"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-389f9895c81so67282531fa.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 11:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772651963; x=1773256763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8xRFn2w9z/jS1C6VB4kiHAZ9cEGHmvzdhzaEpkLpaw=;
        b=ecwj2P1SzMKSCSCQfi7tIx7phq41UhaVuqn0wXqBl/zBgrZyJPJP3tCqCU5lS9Cv58
         yKKKKwVrHaKSq8s0opo0rHaEIKiAcLqpp+8rgWkfdsgoVhJsDeu1Z+j0kG2uxoj6Crkv
         fpEb/Z0grfdPT4cqTQge22MD90SJNEuyVuYyMSfCS6r8SdeXD4FTKm6pUPzzQrO024Lp
         wHToap5NkRNfW5rwqNHtzhXFbjVABDH9sJDZoLRQ1FuF7+gdeThNY5stPi8NT2FkXTLS
         3iTdkxlHVSKkNsJ3O4NfJRRd/+DmefAlpc3074tOt8BzSZ7+/2mxcfVKt2KNRGvOxXLf
         vQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772651963; x=1773256763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8xRFn2w9z/jS1C6VB4kiHAZ9cEGHmvzdhzaEpkLpaw=;
        b=XfFC/SYz44f8+8+Tj+IA1FryWI3YVLbBaYbHm0ItnsIyA13wppNHXL24EGVJkd2Q8H
         mCjTtVAwdyIoV+rFBfsK/ojJTzsVMorU2QQ+tdEkbEsBwOCzozMCGYzK4rfji3MljE6b
         7T8sEqz0C41xZXLtS5sG2TI+P69SHLUCqY7vGKvJI2o3Zxvi+7HzGJ017xKfEjvJbgdv
         G6fuJmXH+spfmyuMgEUH8cfUu38YUT/Dasrpw7a6Odua2w2I7KwnOEK90KhekAQtq7Ot
         0NaE+vfhoxNc7LE1r4ntAjxekE006s8sAdKETMTGheN+RmuJGcd3mH4jTJvO94cLKRN9
         Znrw==
X-Forwarded-Encrypted: i=1; AJvYcCVu5SpZ96sYF6smf2+/AVpuNGr4MhVrhA0WBBuubGuQ3ieJzYCW7wDMeN/h51TdW/+cY5zLlCNnGMveRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2vkbB9xEZ3hv0tseubD3FirMgtjDiWRN1f/s6CsQhL7O0pAlG
	K0CRgMZm5JrhCvmwdTBge+4oxkj1n/RcIxZCahMT6EwP1NuMe+dnJ+KS
X-Gm-Gg: ATEYQzzvJmtLQhqXsa+3PDVFDSPenZPWU2BkNIX85355EfBNfUzNNv419iI2i9TvRrR
	s2hw0LoHiqN46409+XUeULEWVuKhj7a5z4MPtxZLEjrJxctO4XVlC5X3AUjtMabwk4+Z/0PRfhg
	VCcQkw/du47r5u51xqdP2A1QpkKflqoW0eIONa3h7x/mEsR4eY3fVhaoXpq/Z27cR2xPzRbAmVD
	BgxmzQKXwdI6Kqi17sMsy0cIFW6neEme9duTcqRGtNH+k7zwd+a0pdDRW+2Tt9J7TyMz2bw19Bv
	DUCudP9FnNd0kkCZUoczLJDfBatJz2j9Y3i7aRYQTcoi4st8yv0hKY8Gi0mLO03q9Htsn9+VgSU
	yI5z8Ey3DMjb5pWZMmThqSJvonqi96Ym7/JNFkUsZgIz8ZvMnVNL3c/tmKUW2C+fMGwD4jlg31P
	Ah1BDkdh7jr1ENsKrX4ptckTjhFLLwpiRZc/YfPvquTUHMzRgcDo+FDatsFL6OpLegGJ+jyEfoM
	NQ774A5s2cC
X-Received: by 2002:a2e:bd07:0:b0:380:989:f615 with SMTP id 38308e7fff4ca-38a2c58c12dmr24430771fa.6.1772651962614;
        Wed, 04 Mar 2026 11:19:22 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12f4a5b03sm217166e87.87.2026.03.04.11.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:19:21 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style in nvec.c
Date: Wed,  4 Mar 2026 20:18:53 +0100
Message-ID: <20260304191853.4500-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting to use * on subsequent lines
and */ on a separate line as required by kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/nvec/nvec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..ee2715df3b48 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -646,7 +646,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec->state = 2;
 		}
 		break;
-	case 2:		/* first byte after command */
+	case 2:		/* First byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
@@ -659,8 +659,9 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/* Delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0

