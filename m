Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056822759C;
	Mon, 18 Aug 2025 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549554; cv=none; b=SNUVCb24n3uEn6hjxGuzdUkCmYiXiHupYcxelTnJd3PDJ8GuPXn0HTyU6lJ0dFAsOPIQzELzP9QOK7/pa8JWWN9i1Z+5QY9/KPNDayeMcINE76aGhfxBt3h5mjTJbLqgLNfFxdnRcxUNGfPhMDOSgGKcRXtEcE0UEXPav3lNcIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549554; c=relaxed/simple;
	bh=UgzXDRPHCY+iSvediDp0yrz0486YqPoJsIGQAuwmtCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jERZYGj9UvNzYQ+oyYVhePhMEvt1xd7tK5TVYF/VjmV95XhriCFw0y3DE0zE0fBw/Qidhxt0jn/We6xzGfpSkq1fR+vo00FwgDNj0puqJmj3nT4JzJEpZRU+GkHiLvWipDmSgEYN7x7uCFwJ5PRw/Cx6kp4wkgpsVRmq2SSxwJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDhvxDRb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDhvxDRb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a25ce7978so12715255e9.3;
        Mon, 18 Aug 2025 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755549551; x=1756154351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQrccaRXBs1IVl7ydgWqPXcB0FTcYEexKWi9dkMZ1eY=;
        b=EDhvxDRbUQYwM6U98hcH4zrAD7KDqjE1tcjxSaNSioyuTMLsD4ZndrsLgV9C063HGf
         ap8KeaUp3lK6JZ1x9ayg2bUvu1vK43omL1UGQzqAN286GtOD4dtRyucUs2NehYPwrtRJ
         scPFbo5OCk7ffIhAgHl4cCyhpgFUsgB4r0FmGxAsBu30VF2FjFsSQoFlBn2UuEMuOuI0
         Bt6MsSx9GR8ZtIxLu+z3Hl01pfMSPv3Q6Kl9XiljUw/qdB7jAtm3lRKA2MHLv6T3yM2H
         KP0nZ3rdgLJQUsUVRRWxvhHWMy/+OsDh7ay9aoFqABoSh8ySEvuErxOmegC9WSeImYSz
         eXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755549551; x=1756154351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQrccaRXBs1IVl7ydgWqPXcB0FTcYEexKWi9dkMZ1eY=;
        b=qZ3nfCBZa5hu+e8NaI8CxvdsGCav7HRPr8lWgeaJpXVIGdABi+sd/YKBxuUCy+0qlm
         MHyjn5v/P0zftoOkM5vbRoo171NNSnPXbQSvdMLmZIEk8+l4c6wCNo4S9gm81fEEVwqW
         aBbq7dZg7lfeXOpYT+doEeMOkNMZ0uHX2UQFxa0I/EIOTtJvTW186LB21NtJlpO7Sdh1
         zMCOGpMe3HA4J7tv5728xK0Gw1qKPax7YeZf2eLebnXwNHorNEH+1qmvwoyl8rP7Q2cF
         S0YbTb21/iiPJSNL0IT95x3NK89n6ugFYarc4bTSkgtPhlB0kpc8oCaA4wQA1IN5JLD/
         nH+A==
X-Forwarded-Encrypted: i=1; AJvYcCUiYjYEa7rthwVfwjCJDu0hwBOVwRKfoYIYhTALJGxbyGrpgMUSE+aR5N+6Gbehf3taWl1FaU+aeBUeFgo=@vger.kernel.org, AJvYcCXH/i6qOZpU4db9sJDjynvh5KKxYtT2TxPfAU92O6S2ltO1Djg9yfgxXo6mf/Ke0/HNQ2sQjTakckse6Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbhE8mZDDDVjkzTreUPhwOAHcYk71VG2MpY5sz9YqrNq7Cxt9T
	+H+cPhOU53RIRTn49ivb7FrMMgRo714WD72Z98bT+1KJ8tX8Yxdyu4ii
X-Gm-Gg: ASbGnctVw//NQgzlU9W+arwaE6Af/SNBiowSuaIgxu19RU85LcPqF81TNVGVphypMuE
	WLr8eOGg4Ne4GNlDuW+3AlIyBQLsHb3Yiy7YkisV2OsXX8NFuS8eIpB8uy52omtQQmr6ki8I2qC
	dVElAhlY9rtQdY5uYCwzZbfdd2zWNHYUQOemV2ar6fISwKvfwOzj+809AcLzqdorJ6YqtsZeXgi
	dqsebjs1s5xJKsr+pUg12Ud43Y4EsJUJU4sAxokbsa3AibuBlK0G32TRgwYq9zK288Zsa9AgfjT
	b7RRY0wzs1lBx1P2Aq5HW0v+UWF8XeuKp+1PG4AKL49aeS/UF4UiX3TWrqdUNbnt5j9iGphF7fN
	4m/SgkjqZPg/JxXvOTs7SqjGFteyZWiZwHzQ1qg==
X-Google-Smtp-Source: AGHT+IF9VloGoXS4W+Ovzqx4/XtENldzlW4keJIOZcxpWYMhXaJGZR7c5xMhCCHCrd/WiBlGuPuENw==
X-Received: by 2002:a05:600c:4f51:b0:459:d709:e59f with SMTP id 5b1f17b1804b1-45b435a7475mr3839545e9.0.1755549550693;
        Mon, 18 Aug 2025 13:39:10 -0700 (PDT)
Received: from simo-20nx006jmx ([41.141.149.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a24e5562csm130648395e9.20.2025.08.18.13.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:39:10 -0700 (PDT)
From: Mohammed Guermoud <mohammed.guermoud@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Guermoud <mohammed.guermoud@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] staging: nvec: Remove unused NVEC_PHD macro
Date: Mon, 18 Aug 2025 21:38:55 +0100
Message-ID: <20250818203855.11914-1-mohammed.guermoud@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVEC_PHD macro is a debugging helper that is only enabled when
NVEC_PS2_DEBUG is defined. As this flag is never defined in the kernel,
the macro and all of its call sites are dead code.

As suggested by Greg Kroah-Hartman, removing the code is the cleanest
solution. This also fixes a build error discovered by the kernel test
robot after the v1 patch modified the macro's body.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508182005.4PiKxXcN-lkp@intel.com/
Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 7accdcafeeac..2e36893e0008 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -23,14 +23,6 @@
 #define DISABLE_MOUSE	0xf5
 #define PSMOUSE_RST	0xff
 
-#ifdef NVEC_PS2_DEBUG
-#define NVEC_PHD(str, buf, len) \
-	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
-			16, 1, buf, len, false)
-#else
-#define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; } while (0)
-#endif
-
 enum ps2_subcmds {
 	SEND_COMMAND = 1,
 	RECEIVE_N,
@@ -70,18 +62,13 @@ static int nvec_ps2_notifier(struct notifier_block *nb,
 	case NVEC_PS2_EVT:
 		for (i = 0; i < msg[1]; i++)
 			serio_interrupt(ps2_dev.ser_dev, msg[2 + i], 0);
-		NVEC_PHD("ps/2 mouse event: ", &msg[2], msg[1]);
 		return NOTIFY_STOP;
 
 	case NVEC_PS2:
 		if (msg[2] == 1) {
 			for (i = 0; i < (msg[1] - 2); i++)
 				serio_interrupt(ps2_dev.ser_dev, msg[i + 4], 0);
-			NVEC_PHD("ps/2 mouse reply: ", &msg[4], msg[1] - 2);
 		}
-
-		else if (msg[1] != 2) /* !ack */
-			NVEC_PHD("unhandled mouse event: ", msg, msg[1] + 2);
 		return NOTIFY_STOP;
 	}
 
-- 
2.50.1

