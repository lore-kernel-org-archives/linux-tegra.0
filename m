Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E170301474
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381853; cv=none; b=bsZ8A/ajp70VT0PlTczhYRuJz6r/apKUyiMyrtVdhCw/w0oABh8HTwAiMP+juid1zHhANa3zE0+p3W/twabCHr3G9DYfhKdKEIjjMNKYebQa9bfXCKN4TRGsEmJffb2DVAAgroK699Uly/uogCMTibgta+mQue1LpkcOPMbFJpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381853; c=relaxed/simple;
	bh=DFzrGNuqedqy8atkxndExskD/dr9k9qOU+KriiRa2NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mkdJJS44HBCTTdHSbIS/1W8YKP6N0M4PX13dAzWa5y/x3ESpytrePbepV/Nh9wo5Yr4aF/jMng4Fvwwbk/HAZv5tOhgG/Z6q58orqz9RuIR4a/k5dnCkvtvM0ivzbScZqb6MiWjjpTUjKf8YhNf49WmL0Q5s02pdqZpqEViXyR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GC6rNT4j; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC6rNT4j"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffe41e8e83so156009137.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 12:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774381851; x=1774986651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qryctq+sXb4beB+BGrqpu6BjYxUYcgGS3vT4B/l0hBg=;
        b=GC6rNT4j7mM9YW1GxztmbQ2XipS/du4b+9qooanl38rThdP0skbCLL+NJgM+1ckeqj
         Jv6S4lKA8cVkdAfXdmdKPs2FRiX5C5mrKt3F0/bJ9bq56CAtNrsHRAzdYcKJR7nm714y
         /nsGKWiXdz3ZrZvomqbv6JHKKaI+MK2JuPLJmecw6iWWGhpIx7cZasRqnw5M9m8fOAXA
         gFKCeBmIwmtQjp+Z/J6z89Xp0GEVPlu/LgPupOx2BQzeCvDcDn7qyeE4lnTk+bWRQa0/
         sno5wVeC5ZBOxi/rlJHMuZQqCU2xPY7QdGPst+pzEI7ppwBddUaADGdmh8TtXuhPDr2r
         8PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774381851; x=1774986651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qryctq+sXb4beB+BGrqpu6BjYxUYcgGS3vT4B/l0hBg=;
        b=HjJvmFOBHS9WUmCYl918HTYP0sKQM9T4IzcMqqXHsOyK4RrjDB8+l/vNd7u7lqcTcP
         Ga0SfYT/K44o1a03kGcbeLxf9gVjUxGb+mViBv+zc+FO+/bvTpVZpqJ/POJUDfD74Ghj
         HW60DAMr8+jiInUMNerAl3VWbdVebWroNs0wVqL7DCqhx9uotKBvPuFc8dJ5cRc39LeU
         QQRTopSJY7zQTIGxfCUOy9bNxoYdmwL7IfwoFuttcs0J5Kh6o2mwYoEHhWDpjLKk41Mo
         It8Z4MVJ23xujrfa4SaLG24t+lw8IJLzdwnZoxuwMyZuVr1/wmKKx9xe99E/8JXMAeKL
         5Amw==
X-Forwarded-Encrypted: i=1; AJvYcCXdb4WvF3l3WWh7pFQad29MlDT3gXi5HrnxaA92bgE19KCB+jh3RqqA3e5LnE4IQB1xJE25wLOYm9GvmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBsOhAGwgZIQdwqckl+Fooh9lS3YoP55DuCx5V8zjUu3zxknT8
	mqBE8zyPXAnN6Ie5hgquRRUOIOuXp1Iw9Ud0K4bVRwQQwLAEpGZHgJJN
X-Gm-Gg: ATEYQzzTNqz58c1oiup1nlYG1409yc2iNQjiddYTkeMANdbJ4exe1yoAzI0w7tJND+W
	GNGPMRhAcKZ7q1c7ab51BpTGu2qkzm9N4Skfsp+Oo/Wl8CWWP8BmI/ygJ1BphOcjopqqnirpjm6
	Kb75+oAP5z+Duf/3N2/Z++GaPiTOFMYbXgehJmM8wp6so7GVSywc2xxn/kMxAPunco//AWOVKdh
	uNIzVg/5bE+L2g/7W+3vDSJGHd2OGeOZNY+MOB/Ku0uRFtyt+sXnXMI5NcQhXmEszxLrJ7xZE2e
	kwAaQYUEHuHrYa0e21ACQ4SK6JrNUOi307PYRU14gLrLRj2/fGHIoJTaUDM1ms+C+U0Fl71AVyF
	e03gRj5sc0roAPb/EkmSNnJvz1dSJ9CgrjGx+RUoBlXhuywEXN3b9Ncw9qV9ksk/X9RoNQBp4RD
	5pHN8ZYgsYoZL9s9+yTs9n5izSuAwzj4DbrM8=
X-Received: by 2002:a05:6102:38c8:b0:602:90b8:9840 with SMTP id ada2fe7eead31-6031628530emr2537503137.18.1774381851377;
        Tue, 24 Mar 2026 12:50:51 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:6d71:aa::11:17b])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136b4b8basm12952273241.2.2026.03.24.12.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:50:50 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: marvin24@gmx.de
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH] staging: nvec: validate battery response length before memcpy
Date: Tue, 24 Mar 2026 13:50:41 -0600
Message-ID: <20260324195041.38343-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvec_power_notifier(), the response length from the embedded
controller is used directly as the size argument to memcpy() when
copying battery manufacturer, model, and type strings. The
destination buffers (bat_manu, bat_model, bat_type) are fixed at 30
bytes, but res->length is a u8 that can be up to 255, allowing a
heap buffer overflow.

Additionally, if res->length is less than 2, the subtraction
res->length - 2 wraps around as an unsigned value, resulting in a
large copy that corrupts kernel heap memory.

Add bounds checks before each memcpy to ensure the copy length does
not exceed the destination buffer size, and that res->length is at
least 2 to prevent unsigned integer underflow.

Cc: stable@vger.kernel.org
Signed-off-by: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fde..29beef0a7 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -193,14 +193,20 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		power->bat_temperature = res->plu - 2732;
 		break;
 	case MANUFACTURER:
+		if (res->length < 2 || res->length - 2 > sizeof(power->bat_manu) - 1)
+			break;
 		memcpy(power->bat_manu, &res->plc, res->length - 2);
 		power->bat_manu[res->length - 2] = '\0';
 		break;
 	case MODEL:
+		if (res->length < 2 || res->length - 2 > sizeof(power->bat_model) - 1)
+			break;
 		memcpy(power->bat_model, &res->plc, res->length - 2);
 		power->bat_model[res->length - 2] = '\0';
 		break;
 	case TYPE:
+		if (res->length < 2 || res->length - 2 > sizeof(power->bat_type) - 1)
+			break;
 		memcpy(power->bat_type, &res->plc, res->length - 2);
 		power->bat_type[res->length - 2] = '\0';
 		/*
-- 
2.43.0

