Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483BD39891E
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277951; cv=none; b=Tco2Vf963dpomP7KAP8a13hPoLQ9wkN+mnGq9JVRk0Nvr3XEZ1a2qAgrw0HG7xtClPxxPeARefA0r0DUbI/WQZa8Lj6nMF2JuFdABQb5sdtcaU4XaRT45mSPA2+QsfjlX0vzDvN0K/+C40/MAEyWXTqfP6HwgjwO6TQb945Q7o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277951; c=relaxed/simple;
	bh=UbK58Vzg9w7sWB5SY0szpeu7+MJi5WYw4Hn1wlYoJG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4pyj5goJCCmLMJeOpqwpp3KPiLKVbEb1Hkyhe5YZLJFD0E7DVPqelVkKjThvuFjaTD+MEUTmRYl4mqpZ5jOrvLZbXDaUZvSvyQq1GmpzUPuoPscr2I4Vvy2bSHpxcBowm5+Jit2q2EovC97uALMr8reXGscoC33agpd7sD85S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAkO4Nvb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAkO4Nvb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfd832155so7370415f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277949; x=1777882749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcNAF/r3YODfVeip91vVmIe5J4y4IySQb1pjlKeU7P0=;
        b=dAkO4NvbgDEZwv9QfwjUujcPkKm6zJd9g883uXar4SC17YtpLWYJ8OTL6oHObDji7j
         RFJeOIZ0W+nMKlHZcm6qcQZCCwmExMeO8I5ySEqQBgLqM//Kre0ZgjoB/EBRk9HKoMfB
         TqXGi/yia2XkkNWNNdmAXT8dT1q00FZh2YwtgFBpOiIRW7Wka0kD0+47UaQDS8EGHyJR
         uw3Itm/6Yuz4n40+byPTU9mZr4Swi0pGIItm7DSMRnJPL+IoFLAVoRMUm6zLBxjF8eUs
         NwogvFAs0gwv4IZGVw+txyfagkOfJob7iVzxnVs5HT2tgllB6g3R/dLb1eQzOYnsBIZI
         /IlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277949; x=1777882749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gcNAF/r3YODfVeip91vVmIe5J4y4IySQb1pjlKeU7P0=;
        b=fv6hvrOh90TdQck6TjU0VLunqXhZYkm+T2UJFfDMmLdJeTqNkS1Z8fcmKC827I6Fzm
         l61b+IcP937+dWyTW2XHbeb7rNhlgJL+SRm7yDU9DqPJbme4kMBRUoAzI6nt18afkxuL
         a6QGBf/l5vpTaCsNsYIuWS6FMPfiicoZ29/dYNMYHcFmlnylWZP5F3U+WhOg3O8xvZGJ
         A9R1Tzz9ln5SGqMlmXGDskdYbznmvLCYjUK6NafxwKywmV4cagL5nTuAD6YxcNQb7myD
         A85j8NDUHKQH40Ysfh7xzNPPbziv95E0VqznTmYMH+tuedE3osZOZE+Bn0TeHZB/X4yj
         belg==
X-Forwarded-Encrypted: i=1; AFNElJ+Nr3G3flKoNVw69q0OfGYzw51A3QRCCWQvbfMaOug+WdPvIGMFM9wWPnztco/waeKizN6w3j9YibWFPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM//vvKwMC7iHhCcFDO76n7PmMoqnd3TqUB5+RKh44ODgthbfQ
	IsvkdDv7Oln1/nBOn06pGXR3Rk1tJtA/j4ku8S8/HC2whp3CnZ1cJ065
X-Gm-Gg: AeBDiev2GWg9wrylGLWrE971isoBjw54NAfWlXZ2yc6WZi7PgAtlwZmPPZVf+JrVugS
	3O1MVAf4NLvKTnUwxDZDIYao+gTb84GT3OsTFI0p0/qGHdHmm8+FvEFJwwH2yZqbbWarAoStr92
	U1qOVOWPYSFwtgR1Ia75+d0gqeerpHuXJvvV8PT9Vt1TvszEQCkXJ0a/4KZmgCjBgQM99in8j/3
	kclouZ9ZtW66ePKGH2JISjpZ/UraQirbss6oZcIGFv+LCbAU4e8q2gzs7/NfwILbtB3ZqTNx3U6
	XBxKswRsKk41KyA0BWpIlCtZOgiMmeu0Dlcc5DAATitDOzr/jtSfugLwH/vStb19rBNTKn+LVh6
	iIp1J4TLkpgt2KS8pxjpaMPhp3DJ9EMBvEqnBFX/XSGK6zDKMDAq0Nb3bHt7bByykNn5cSDWA+7
	aOMZcB2OSxnKdQ+SBbRCRQCNRbhJ+o2QeFpUxXC4r54qGTMoWcRNMcKb8GE1btMUC60O3o5qSa9
	CG6Jmxh6J5K5YxfdsRGIqOPOuxhu5pErny7fHRz4/Dz1TP0F8VKBH2XYIyyPzxPm606ghY=
X-Received: by 2002:a05:6000:2dc2:b0:441:2473:c30a with SMTP id ffacd0b85a97d-4412473c325mr35101080f8f.31.1777277948556;
        Mon, 27 Apr 2026 01:19:08 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc375dsm69920019f8f.14.2026.04.27.01.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:19:08 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: marvin24@gmx.de,
	error27@gmail.com,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v4 1/2] staging: nvec: fix use-after-free in nvec_rx_completed()
Date: Mon, 27 Apr 2026 10:17:12 +0200
Message-ID: <20260427081713.3401874-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427081713.3401874-1-hossu.alexandru@gmail.com>
References: <20260427081713.3401874-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvec_rx_completed(), when an incomplete RX transfer is detected,
nvec_msg_free() is called to return the message back to the pool by
clearing its 'used' atomic flag. Immediately after this, the code
accesses nvec->rx->data[0] to check the message type.

Since nvec_msg_free() marks the pool slot as available via atomic_set(),
any concurrent or subsequent call to nvec_msg_alloc() could claim that
same slot and overwrite its data[] array. Reading nvec->rx->data[0] after
freeing the message is therefore a use-after-free.

Fix this by saving the message type byte before calling nvec_msg_free(),
then using the saved value for the battery quirk check.

Fixes: d6bdcf2e1019 ("staging: nvec: Add battery quirk to ignore incomplete responses")
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/nvec/nvec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 952c5a849a56..2a3499dd4d63 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -494,6 +494,8 @@ static void nvec_tx_completed(struct nvec_chip *nvec)
 static void nvec_rx_completed(struct nvec_chip *nvec)
 {
 	if (nvec->rx->pos != nvec_msg_size(nvec->rx)) {
+		unsigned char msg_type = nvec->rx->data[0];
+
 		dev_err(nvec->dev, "RX incomplete: Expected %u bytes, got %u\n",
 			(uint)nvec_msg_size(nvec->rx),
 			(uint)nvec->rx->pos);
@@ -502,7 +504,7 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
 		nvec->state = 0;
 
 		/* Battery quirk - Often incomplete, and likes to crash */
-		if (nvec->rx->data[0] == NVEC_BAT)
+		if (msg_type == NVEC_BAT)
 			complete(&nvec->ec_transfer);
 
 		return;
-- 
2.53.0

