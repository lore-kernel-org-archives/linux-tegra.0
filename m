Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C7A2376F2;
	Tue, 19 Aug 2025 19:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755632714; cv=none; b=guLHTQ9RQkfaNUmiUclnckwptt6edK8kNrHzAieSXeAIM7wgNuEWqsf2JxJi35DR5QwIfTNhPXsOK63N+hjwCbH4CfdE2UpwCtPfe4+G2y1KflNYmDp/7YiPRScwhNhDlJk1Pv3jRhwUgIAvUCPu38cedXpnWxOnsw7J6cN0Hhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755632714; c=relaxed/simple;
	bh=7hYcoDZzopVr3IFH6fDdSM89T0PNbMOEudRMR0Xt7Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9dLxeaJCJshAkdj3Vtr95ZwqDaHhuif2IaYvXgk1cVrBYwVyvKYRK5q98Tsn0aDqpyG2Q69I2ft4+lLoOvKVC3Lr4nn78xxHZ+uD7wUMeCpVjbzzIv6EV/0OfMrYb9NpR6oBDmfuoOpJepsfIM6D6V5Dkw+M/QjRkeJ6sEIJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bac6gOft; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bac6gOft"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a20c51c40so33000755e9.3;
        Tue, 19 Aug 2025 12:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755632711; x=1756237511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80FfVf7cUzwUy7tgcn/X288yxUMH5V6Bpw69CJ451WU=;
        b=bac6gOftoMTJKrG0Wl6TG17VM3k4K2+4Au9RENGfyyyY/dVPEAx+0rBiSoEJZJdQLC
         DL5L3jOzzqiqmFdnfqtbQEfaGbK9isHsufcHTL1fGFDRn/CABNVwiYAtWrMJJyEZgkzu
         UJ4ZIEmTy2pkajLW47O1l1/uqEswdPapvnJxALMDqMtT2cJ1TQkX1azWsTqYToxhVL2l
         SCEeBvTp6e5Lbnc7p9qxkdm5GtPFTd4CpEECPSiUtQ18JPcCsokATlitb30qi/5mLsS1
         RSq6YHsGa4WfargxDxHpkUMQsXFuqkHiWLRzkdY+eOCk1yEoSQFXcutxg+u2GuPjkeE8
         j8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755632711; x=1756237511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80FfVf7cUzwUy7tgcn/X288yxUMH5V6Bpw69CJ451WU=;
        b=bloT1haumdqhOg599pQwgZXHarYgg8yAbfEUJ/SD3Q/zA70Dc0WLHMw27UgBR/mwIO
         tqneooiqLzseR+20zFx2C05vIWHXcTOgNID0Pl6zhPv/g4fPCeN35oJIyXItRaBFARiz
         /i3dM9RleGWWjemGWv6df1w+ULT4LSv1IvS1rJJ52Dw4eKg4l8UpxeOEuDff8GdzxA9D
         hT60YcRPFw1dPr46itkiL6LF+GstnxTgDG845lV5ysOw2PVKPuiMiOgisjxv9Ysf3S1/
         aBY35ot5hY34jzxo51WbaO1Pi7dcMehFEJkU8cm5nY0jhtqL0iyXhBWz8AoPiwKWPp7z
         Wbqw==
X-Forwarded-Encrypted: i=1; AJvYcCUOsTwjtJAm8da+B6CjYr4ziaYWUPAd67Uux/xGjScC8rH+YqqglguWfIjuSEHlp0Br5qJwVPVzEWUqhRs=@vger.kernel.org, AJvYcCW2Awy3I3jAcQUYaHaieiUmMDjk7kQ284q882lMxUQKWZWyMxlQJSg0HzYNBpMnYBVhUCSxQ32CojLruao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4gv7poV+WerxNcOqsHNBXYeD0VAJh9lQ3ar7XO+nCANVY5k/o
	38l482dMe6jn3fhu2u1RkP/ZFBF76TSNVihIq0gYEs94aigPtnwMK5cZ
X-Gm-Gg: ASbGnctG/pW8t/IxXrQiMbH+9OMhFM4aPvZlBse7k0FMiK3vYFCa+1LtHpCCHlcaniY
	TP0b/G9CB0hankJ+Hr7TwRF2G5qXh4zLVw1PE9FFy61VhFX+eH17+/qAHoXVbYrpSOXVfCdl+Li
	5sfXg1XudcBHf/NaPl2UImIFRyHV28nsTGd5YEwpx2+iWBLJCqfIeZYMjeRbV3r0NpvJm/qjST2
	ooPUA6eXtESTlbMC83CYIRndGfjuEv4Ni7XXZ4Rkzq1TxpMj7Ou99Fhl5ZIJbOn055qWZH3M6zv
	W+vB1nHA5oxuj+gzErwU/S50EvOL/e3M0KGKOHKXy/GNsbDpSMCWbDHMagT9uvADy4+kVQUpyIT
	lX93bYSE6MAxLoyCVvd2WQ9XaVjx3uAS1hRd3YWNZBDj4Th2VkARWG4q5G4jmKBHM+O+9mL9BdH
	rpqkbFyhyxj935QfF8mZUWtcf4YQ==
X-Google-Smtp-Source: AGHT+IEvQoGlja9R+ZR7/ohI+yJpAG3IODPFFy8R3prK2DU3y+dW6LXDTltf0RGXTR9uOiKPhw/bnA==
X-Received: by 2002:a05:600c:3b84:b0:459:d3d0:650e with SMTP id 5b1f17b1804b1-45b479b57abmr1101635e9.13.1755632710303;
        Tue, 19 Aug 2025 12:45:10 -0700 (PDT)
Received: from simo-20nx006jmx (adsl196-216-195-217-196.adsl196-15.iam.net.ma. [196.217.195.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1cda0021sm221264235e9.13.2025.08.19.12.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 12:45:09 -0700 (PDT)
From: Mohammed Guermoud <mohammed.guermoud@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Guermoud <mohammed.guermoud@gmail.com>
Subject: [PATCH v3] staging: nvec: Remove unused NVEC_PHD macro
Date: Tue, 19 Aug 2025 20:44:30 +0100
Message-ID: <20250819194430.4525-1-mohammed.guermoud@gmail.com>
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
solution.

Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
---
v3: Fix commit message.
v2: version caused a build error.  It's better to just delete the
    code instead of trying to silence the warning.
	
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

