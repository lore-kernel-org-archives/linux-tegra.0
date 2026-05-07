Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABADC175A99
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 23:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196116; cv=none; b=tjn2h3qEPd/z5KwgcOHeQYQAI+Z+pIztTLdqRtpySCPeuAq5MKioLJ3nFZ9JHoSbT0fzu1oK4fOgmOJ3wAwTDYaU5CGfJt19hsVhfSMbrAgnCtlU5ysLlthYXYcfIlaD8gV8Ll44mmMwPKlB0nnwOUkfQGzh76HdlxBFqLiJKdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196116; c=relaxed/simple;
	bh=/7jMOqiqfS5E2Aa8V7nTqrJGxlbfE7BVeWQEGpFRgbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kt9zNKnkp6skqMyWhwvxUsMPJyOIckNwLL7RIkeY4lQiW/kcuv8abxdYdr7q2jfUjLHw17AVW/n4iYvfPwsdjDlNEGgcxJwf9J6/Lo8sG5GzEykoIWw5FXhSJrhhzZT8ERvGekSlFVY9c473Ds9hcs+1a2lJ2nCjPNrkqntWU0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBpkTEJp; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBpkTEJp"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8021c8c42fso508348a12.3
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 16:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778196115; x=1778800915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqk0bhbr2l3f7IDwzLFxsnylMpESKM7ghHU7R8b35rk=;
        b=sBpkTEJpzYsRNV0AbinK7c5oWYCuTeSL4wLPYHAN30/Zi4ptIEROuxetZ5tRtUY3Er
         KHtcGrmU0YP2TOY2slqFOcdm744tj3vemm4QeVWURNkWctYZbvXR3b+fcaDpkoG5XsKJ
         bmbA+ZS6PzwLj2hGbg5dGyYTu7cUzbDeOeMg4+edSqlv4whe7npShrpHpmLUA9En/2wz
         fhen9+jjGUtwua7lBqrBYudoKYM9NAUjA0+XWXWTPskN3wv6qKJgC5zte139+3U8tpNI
         Y++NSp1WzsGR+toETJ2XwdvbSyqQGWDuxa9vAsnqSof0cE9QE2uQXH7y9xP37V6DgSJ8
         ET+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196115; x=1778800915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqk0bhbr2l3f7IDwzLFxsnylMpESKM7ghHU7R8b35rk=;
        b=Xwpk/xrEZg+e9+xw4GiRplnazMNjq8Pown1mCoSPCe2x3kKyzCwnacWFTAn04DpaPq
         obds2Z/dJqva+W5zBd90Qt9eFYfrAtEnxA7+HWurt3liMeUfVWztQeqg5IDvrd7NrUba
         NW1a7ggz7aSH5LQeC8zXTcSghG47Wvh3FBKedXrxFc8pY7ordEB92zySIVfFZ0u3bvnu
         VGQ/wF8yuy5sBcxrs7abV3/a0Uq1xUKPK1iW9UFDcdixoZ89PWGy1jEJJg/SM5Ft/WyD
         QlOeVU40RhEpf9OV+Eed5A8fTshmiJt+KNYG/jZ4fxWF+k/jv1k3Qr1RK+DbfO3BXon5
         u2AA==
X-Forwarded-Encrypted: i=1; AFNElJ82Oi9Ni8mtopn6RaUFwis5CtShV2g1/mC9NEG7/jYQNYUbkjNXn+JqwlFOIjG9IolNPr+2UhUP2rT6/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNvAFP8duVmajYHAaTrtnTDkWOi0WkbyYpi+kfpSDl5SoIwpl5
	8R2DkF/0EO/xTZPHhW8kWvNxSf6vdNonIX8tqhCT287J8s5s4IeQ9Rfd
X-Gm-Gg: Acq92OFnWUX8jm6iMyHNSdZUdrxlb0npKFo23G1ON+9wset4A46QNxjTMFCfCh/FqFq
	XmqaZG6vYhGpMQpZsiEOtV3VuYEOX9Iqj90aFeb6zC3Q7g4Rwdp1btCtgVhgFFteNHU3LhqVpK6
	jGmlppB5eQr5qHClcXEbGFY5amwHTstmSEn7JgCV48KLImSVFHDVqJs5WPDRfZqqIUUl4v2mmoL
	vh3PgACiNU5a7kRyfbYq9ErRcYuGpM42/zCnsl/FSKSUqiPXMW4ODO0ggPslUc/6pWkypbbmbJD
	iU1PFc6Yn5if5T3nVJQWE9awEmrm5vHF7KstA+8P1mKrc82eKttwWvAHZJJtHEvxMbPJrcoicMn
	MqPyUOZYYl9JblKzs8WDw0jW/AXcJVvEoEt+4mREuLod3KUX5OK3CApYVg9yQYr9qmUpUNSGYsZ
	VAJ2dtDG+dGWlvXuH4ZmlHkVRAQS778i4rxZZUjbmA8WU9aMWrFjGfJDu3uKHH9ejF4tdXmYYjN
	gIqbanOGEzUejnuS5y+ANvkUcxJJ5XqpGo=
X-Received: by 2002:a17:903:28c:b0:2b2:45b7:306e with SMTP id d9443c01a7336-2baf0cf2c98mr2125795ad.3.1778196110299;
        Thu, 07 May 2026 16:21:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae752f766sm9064475ad.2.2026.05.07.16.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 16:21:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit division
Date: Thu,  7 May 2026 16:21:31 -0700
Message-ID: <20260507232131.438589-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A MIPS allmodconfig build with LLVM fails during modpost:

  ERROR: modpost: "__udivdi3"
  [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!

tegra210_mixer_configure_gain() divides a 64-bit BIT_ULL() value by the
fade duration. On 32-bit MIPS, clang emits a call to __udivdi3 for that
plain C division, but that compiler helper is not exported to modules.

Use div_u64() for the inverse duration calculation so the driver uses the
kernel's 64-bit division helper instead of emitting a compiler runtime
call.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/tegra/tegra210_mixer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index f05617b5f433..bfdd457f740c 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -157,8 +158,8 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
 			if (i == DURATION_N3_ID)
 				val = mixer->duration[id];
 			else if (i == DURATION_INV_N3_ID)
-				val = (u32)(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR) /
-					    mixer->duration[id]);
+				val = div_u64(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR),
+					      mixer->duration[id]);
 			else
 				val = gain_params.duration[i];
 		}
-- 
2.54.0

