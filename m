Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF3E24677F
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402240; cv=none; b=Hp8oFZMQbLPZ7NK2dqUf9iBoGhyBNK3IzFWQJOpMn6jvhcump3ToTgyj5CGvC5xC28I1KNgXkNLF5B8o1lIbsmZ3jCpUcRJs2InSs7SkvN35b6ETxrxYozy9ML86qfy47nNd/4CVOh8p0E/Oi1ANAV48UFio31GqXT36s36Xmkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402240; c=relaxed/simple;
	bh=uDaNoagHys08JDYY0sUwwSl3qH/ea5LeNwTnG/ymv1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9aKMJqenErF89m+5Xgm0IVFLvPaS2QVeR3lJPUk51X5xrdcOipUZ2yDhdDfMOox1nBjjT71II6PXTu3k5PNBhf4zBpAQSMngU9wBUlLHSphn0sc964TR8EK3F6aDrDWB1QFj+O8XnIUYHMl/Kb9/H5LK0l9UQNNNeWOW066v/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2Q3nQ/q; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2Q3nQ/q"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-479fc1fc048so5115138b6e.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777402238; x=1778007038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIv1W6wjvbNHFz0BT7UvNZrlsknFtuu9/9aZ0cJuVUQ=;
        b=i2Q3nQ/qHAaiQPTyEg8UMAwGeHzScRfn0cd+9RKCxmLt5Sp6swsFzNJTeHu0NMDwtp
         EIfNzAexSpuFl2mhOZWaFmPXPmTOhS5dakbl7j1flkQ5T4rLK86qN8cRSA53WHs/izWO
         qFWCbuIryfztUd2XuWUXJE8lxIprp34Nna42k/pfN71N+bSagmat9ozSiDHjwFDb30/3
         7XaFAfOGYfd0+VcXyFejYUhYePokE0NCPjtdMjMCnjtpg995xdj07rkpKkdpsvtGPRnM
         k4LVfJ5YaX6Fh9GZD/chdrQmpPpkAr8mwwjc0U6V5JfsmGZ3f3miYuOORBrKUMMmNPFk
         g+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402238; x=1778007038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIv1W6wjvbNHFz0BT7UvNZrlsknFtuu9/9aZ0cJuVUQ=;
        b=R09cdTgkhD2Rm5NU8LINpfYMNNiZDO78yi6MFJtwANTG3eVypdWd/Kmsp7leuF1bb5
         ixfVuyH1fGVxIN8hpcy04pLb4rH70QWprJHc3QIX1XyYM2Ye49DvtlPvvMWgJpnELEd+
         G9ZsEFMFVT1J2ig2c6xFjOuNb+3YMTptaS+oN74/eKhNWUN+novZy7TBX2edkqVVjFBj
         lbt+vnhjXOFa4VwG6VjeoxFgIEt9Gd1i7ACB1le+yRq4R3UNzizqoag4dM9yCMhTa28+
         IeXoXmSbbXHNRza0jUcFhWKUFUrAiXuac5U0OklvqwNABHEH/rMLXjNK2udrRQXwSDAA
         lfzg==
X-Forwarded-Encrypted: i=1; AFNElJ8Cbbf4tiltymc67OHo3V9zSTRy5rNUvLQHZlm6QN289rtxe2PbUtiuMnLrLioulwZPNdClx7wGIVBANQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJH5xMK90SrJRnnsAMTh5S4dJlYiOUwC58CBGm56b8Cj3INAR1
	RjiflsomU67rP9GPSeRXH/IPf9NTdM9HUS4WwZl0i+uBqXXjS6bacwriowtOMDs3qg==
X-Gm-Gg: AeBDietVYDLNyThGDPflDJXbiK6HtSmjsb43KebH7w2Rk41kVOz4TWpePhdoFjYpyMA
	nJgW1DW90smWMNWgDbXTcufa+jba6IzqnK6IQkLRzHPILWl4u8dBP70cLQx8ATwDJtHr2NYkwF2
	InDA8AJzodWaFY59M29MSVKLL3vVeUvLOY3E4pLAD8k05xNGCkMJUhUVAi7iEa+KixbL8Xmhwv2
	+26AGS1glbdNEB8BNaqn8BIyjp2936SSYrD/jL9BUUfL5LmHuGvh+E6x+XawwKo2FuGauLRbQnj
	K3L9mFlnX6dQ2atotSYPoQZqSuAse+9jU7PU35Ab+LjGYRiazJe9a3osLmHW2xDWWjyio5m2/nm
	OhD0S3Jpg6giM0LBOlixN6A7885slYWmKiy+xvQwrrsHUUlYNhQ8s7Rl9l0wndGvDtVdgXeGnBO
	Zke8siBQ3mCJhG51FJ867Qjb/8dtZsG6AxQ3dZ4zjhLYETW1fdDRsyjdwmnh/fv76s7ytT2kSd6
	fT9Ank1pPdqWrXu76yspREZ8rk=
X-Received: by 2002:a05:6808:30a7:b0:467:2f84:b0c6 with SMTP id 5614622812f47-47c28d69514mr2327577b6e.8.1777402238476;
        Tue, 28 Apr 2026 11:50:38 -0700 (PDT)
Received: from MSI.hitronhub.home (24-40-252-177.fidnet.com. [24.40.252.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c291c314fsm2008443b6e.16.2026.04.28.11.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 11:50:37 -0700 (PDT)
From: Marc Hanna <marchanna111@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Marc Hanna <marchanna111@gmail.com>
Subject: [PATCH v2] staging: tegra-video: Align wrapped function arguments
Date: Tue, 28 Apr 2026 13:50:24 -0500
Message-ID: <20260428185024.853-1-marchanna111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align wrapped arguments in tegra20.c
to follow kernel coding style.

v2:
- Fix From header
- Update commit message per review feedback

Signed-off-by: Marc Hanna <marchanna111@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..eb1fc5b7e2cd 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -552,7 +552,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1),
+				 base + chan->start_offset);
 		break;
 	/* RAW8 */
 	case V4L2_PIX_FMT_SRGGB8:
@@ -565,7 +566,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SBGGR10:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2),
+				 base + chan->start_offset);
 		break;
 	}
 }
-- 
2.43.0

