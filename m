Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE5B29B790;
	Fri,  4 Jul 2025 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642871; cv=none; b=fRW5MW3fSr1iN80bO5dJUg+yUPAnedoqKKd/+yE7sA4aZILQ6wDglKGuQGOHKZ6PVK3wUEZeJk6hPGh/iNM5N7uuME0EZERQ+DDfFAg3qS6p1a/egvBH51xyt9CJkbzNxqWvoOgVa1Cv9Y8IDLF9Sq7I6+blm04ccPDp9pJV2is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642871; c=relaxed/simple;
	bh=4v3TRQ4gYwnhEwc5GUKsBPODNNDA4dpVHy1PtRhstxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oeeGjSUHIFcL1K4MC/ylWFXs2toBCx8fA1MPaU4lLE6HQT7g1xLcqDTCJct8TBDfCcZet44R8BbqUuH5lG63Id9CiRE86tS7BB1EOe0hC5S09rxE3O/mxjC+Hb3WkbwpSxcxpWer1Qfa17hw/+brqz3iBrZhNrJKvFHHeMhav8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kz46GqaP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kz46GqaP"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb2bd27d8bso15216866b.1;
        Fri, 04 Jul 2025 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642868; x=1752247668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+ebNQOqTu5W6nuPcdddqE5wsc9kXNQZiBU7TM8ffBE=;
        b=Kz46GqaPAwhQ7LwnJV2Lcz9/JH06R9JUh75DRrZ80upv+YeeSuC1tI+rQ6n25mqJfo
         1RIOIKVoKonVrEJwGNxcJ0typhEXJQSrjY9s2+gBK/1+u8pYN4EOBA9Wb7bm0gKLnbZO
         65FolFJqnQiLXLUNbq1k1/NYnrgjtrL8UfBCqYVaQpGUiuRXgHG9V8ty26cRPvKwbPYI
         P5iagId+mJBbY8cyK2D+AhxuDoCBQxZECwT9rhkFgJnHLdL7RHV+BCOWv5ZLF4Mwb/Mo
         DuVsn2S1lO8T4J8J1FNaRIK14OOsSjzC7w/ypK1CtxJ3C3gVYuPcKlrZvdh0ruiLRI10
         MINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642868; x=1752247668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+ebNQOqTu5W6nuPcdddqE5wsc9kXNQZiBU7TM8ffBE=;
        b=TCYMeiSlpFfji+Hfxjm9AMBJ2vtelG0E6+R7vFi9yFZt4GdhlfprF1mpToO58SE5H4
         BMquK2fb4/rwrmdsx/so152j1wDn54PRF751m60aVukW58lhsNqCy+QPKWBUpslWHNk+
         hQq3Ptemr8ioCh0F3D1vsvxaVK1mSyctLYKvf2UtwPRbpfUyDvtjuEOO4ecDKPCg5lxo
         q8xDiFzq2X7ggJz1S6ZnQ3AjpQwfE1bEv7ir4QW8zRzzCxEFzmXogwoaVKvANTbz3BGf
         DgP1VvvFVQvhdbEw6155zlnQyiLe4RwS09voUjaUrPeD/ADN65dOy5DVnLlTmnBHN4su
         RPVA==
X-Forwarded-Encrypted: i=1; AJvYcCXPtZdDrFxhGehwsS9tDvX7FoZ8koCo4RhjEpUrkThCtU2FhmKTmSKBFi0SrEevGseaG44lBV648dRfMCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzleggxqF1yfxiqYya63Jol9kXQkMifaUrYVFf4w8fhX2tku9SF
	/dW5fo39sI6AmHCW0yodY7VcxV8e19/HdMdv9XgAzNMYgQDNMM+8Y65Z
X-Gm-Gg: ASbGncuxuIOiSVPN8F8Va5XxXlt0/c5fw8+t07d9Wv83dBqukQ9isX6cgc5PXys+rv2
	BsDEKgMWsDA2v/nJn5M3Fr5Qe7LynWw7Ax4Ru96Ns4OvNkA0F8Mxsm4SIvnXa+A8IxSRF/xEpmH
	WsB7shF2y3Lc7D8dLmtyWgOdycqcA3R0TW5jSid2uJkINi5XvnPIoIj/e0XMCDQPQ0Q7KD24rA0
	iXYO+zXaENr8nvN4LnxpsH2yiVn/TWe7js0QUYXIDaDIGjjPJjoelYNodBZUNwWzFcW++Bbu19o
	FqdB23p/61ivLm2qD1YH/DCl2lgp/eEyn/QpfQZsoNEpV/JENw==
X-Google-Smtp-Source: AGHT+IF6oLHogNvjH3Oz67SB2byAsyBihuBG/+HbpIQjbMscOU/bzY+tofufIUk1WNXeICSLqYmeug==
X-Received: by 2002:a17:907:3daa:b0:ae3:cd73:efb9 with SMTP id a640c23a62f3a-ae3fc212ea3mr109904766b.12.1751642868054;
        Fri, 04 Jul 2025 08:27:48 -0700 (PDT)
Received: from fridge ([46.2.120.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5feasm190894866b.107.2025.07.04.08.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:27:47 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	marvin24@gmx.de,
	linux-kernel@vger.kernel.org,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH] staging: nvec: silence macro argument warnings in NVEC_PHD()
Date: Fri,  4 Jul 2025 18:27:37 +0300
Message-ID: <20250704152737.14315-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl warns that the NVEC_PHD macro defines unused arguments.
Use (void) casts to prevent unused argument warnings when the macro is disabled.

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 575233fa1677..38e736b3761e 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -28,7 +28,11 @@
 	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
 			16, 1, buf, len, false)
 #else
-#define NVEC_PHD(str, buf, len) do { } while (0)
+#define NVEC_PHD(str, buf, len) do { \
+	(void)(str); \
+	(void)(buf); \
+	(void)(len); \
+} while (0)
 #endif
 
 enum ps2_subcmds {
-- 
2.50.0

