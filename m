Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7702E6CBB
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762760155; cv=none; b=I31k/MNraWs16OQFN46jHz42r++28wleakAdi5eotq+Lz5bRBlt2WU9orhKp2V0y3yvHyM2h+vsLNjqTNn4ZHe9yB3O03E8bePMotveMkaEq3oAJlicatZvOUwx+sR6+fC/EMpQrpn9RRcoxv8flF2TMzYSAkk/g2hJyCeIwDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762760155; c=relaxed/simple;
	bh=21nICoZNv0xtRro07vJ8g1b48UZfbTR27eO1M/t7uCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kok5T4Izb5QMtzUA1utoz1OcdXgvpO5Y32Wp0WkEfsrE2/mqZUbcKoXO1WJ+SCdXx+VwgPih1A4OhCUMpSM+BbotPQ6Q+ApHNqji2buaqRmuPm4GvcUTkUcago/EX7pg20E/rd/M1QeddfT3KsT5olK0h3PHA/KCTkm3K7FDvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jI6FNHaT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yi8qFsPO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jI6FNHaT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yi8qFsPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762760152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MZKl7FZF/ch5ijr8g/yA88XxaRvqJkiXLlx75JjOq5E=;
	b=jI6FNHaT8FdLn9EEbbYfHnA7s3RgWCKHDmXuYBs4QFpvJeURCneaoSfks/64LTrqibtQJU
	oBYD891iThDQVQl2qS5VKC1x4AW6Arq/7dg08pwMXZYpzaxd/VhXuKmFEgdTZivyIekexG
	9Hx22wtTAHXo0W7sJGmxhqWjtywAYV8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-pRo99xDnNqyY1hSeM9OQsw-1; Mon, 10 Nov 2025 02:35:51 -0500
X-MC-Unique: pRo99xDnNqyY1hSeM9OQsw-1
X-Mimecast-MFC-AGG-ID: pRo99xDnNqyY1hSeM9OQsw_1762760150
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b70b1778687so265821866b.0
        for <linux-tegra@vger.kernel.org>; Sun, 09 Nov 2025 23:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762760150; x=1763364950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MZKl7FZF/ch5ijr8g/yA88XxaRvqJkiXLlx75JjOq5E=;
        b=Yi8qFsPO08Tog/Vv6/NK+T2Esh7zcTr9RSo/ApOOKb6PAr4GPo5D+a2/6rHGnn1Yyl
         F0f55iN1XIIAHFn8GbkC8LpI5sWeSmGpLIPwLZ3ZbK4dpIjgFFxAUYoTFSFBrUWM//D1
         auN7TRXF7NfTHOCjhbQroCx9IhvXgRUC3tk+CwC/RDc6u1GRjzoz+iD/WptfzRl3naMA
         hya3LmisWVhWhH1lw8JAHY6zfB/pLb2OphFH/BUfm2P+CylQ6qJsRigmMGF5momSJqwG
         pNQVDc2EYgJdXR2BGlsLH32CcbpRHSwrJIhBVAijVKEzji9fc6VqflkhS755E62WUNgC
         fqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762760150; x=1763364950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZKl7FZF/ch5ijr8g/yA88XxaRvqJkiXLlx75JjOq5E=;
        b=uCWRYKV8rjjj/2N1uabaVZVEsbwGu83Sb9n9grZZr1cqSMWoBOc1T4OuSS1XPJe1sp
         sw6WyOnL4xXcixVIu258RgqPKiIiWp9IIuXt6f0ZVkQSlfgX/HcAiHgP+1uh7AEbXMPu
         mjvZSE2495tmfytMw6nQuAdR6rrjuIsGI5vNzBdyfbmk6d/eAgbjwGlw7BgjSTSRsAbL
         d+8aL+9NXh/sc7WLMt3/oUTP5rpddNFY43FHtz6nMLIfxyzCb33oDAysM0k+YR7dQNNn
         i6I9ZQ3Qh0rOa9tjjszQaD/6AYcUZ+3Sk2+zsb5yXypDQ6AiqpIyV9MzoqtYZ3JpqdEb
         87ug==
X-Forwarded-Encrypted: i=1; AJvYcCV34DByQnn4fX6L9ek65XfucjkjESGssoX0fNCnFtO9wbtF7KaTKoYg2LtdyhO3AdthIuZIkImIXodiCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPgjyNjgV9BDggWQB3Wv2E46ytMvNTw+T+/7TW6spQNyAnM0F
	TCkKKSaQnRHiQVxqJ7mY3QZy4adtvb3WQFblmQ8VTK4Pp8oC1LCx09rFjnVul2EICSN3iBJAfCq
	eDpQI0u6WdJlVQI9h6OthXXiQw00Ykeyy4uguMYlxtL5cJ0kI8c+SW7tzKqnSxJxf
X-Gm-Gg: ASbGncsUBvK/QhbJJhv+F55+H1VUGfFqDa9zTBfb2wRufbtCxZzsUAzOCReKqcTPvfw
	yYoyJ1ZfRK4PMsmp5IbQ/xUq2r54SmSs5kvjD2oEpL5yp/Y18yYeMGJU7P2X/M5xTzWF0uHWG30
	gMJTP3OxWsqe7NmETRqclnH3oWS81o2d/V6YDgcktwO/tLTvWBEKy7LSAX+hylrYSFNIKhDmqua
	EqoOWirrCmjQ4JOdKBm8WfkeBV/B6zxAc2l6MLa3tKYM+Qc5mvK85mg1bFiJbpk7A3cALjx2DKt
	7Z3lK7o8eTmpPv60my4aRETpICD4flTyq3U6o/Lml17LnDMsHUXnQESjDm0/n4VJRHdFo7zVDgJ
	t5IYpf0YM9lBaga5C8Fdz3mkBN2pykzlUNUcp3Rj7fNZoT2dz
X-Received: by 2002:a17:906:cac7:b0:b73:845:4171 with SMTP id a640c23a62f3a-b7308454190mr178621266b.64.1762760149651;
        Sun, 09 Nov 2025 23:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiLhLSDBHf+cnguxwEfwJFhitfhGonUvcR76zFD9RWMeGVCjQJ2GOJyu6W6FkcShrY0ZWgcg==
X-Received: by 2002:a17:906:cac7:b0:b73:845:4171 with SMTP id a640c23a62f3a-b7308454190mr178619366b.64.1762760149287;
        Sun, 09 Nov 2025 23:35:49 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bc874sm1039395666b.54.2025.11.09.23.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 23:35:48 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Shubhi Garg <shgarg@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-tegra@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC DRIVER
Date: Mon, 10 Nov 2025 08:35:44 +0100
Message-ID: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver") adds
the section NVIDIA VRS RTC DRIVER in MAINTAINERS, which refers to the
non-existing file include/linux/rtc/rtc-nvidia-vrs10.h

Note, with the changes of v6 to v7 of the patch series adding the driver,
the content of this include file was moved into the driver file, and the
include file was dropped from that patch. It was simply missed to adjust
the section in MAINTAINERS that was newly added with that patch.

Drop the file entry to this non-existing file accordingly now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a881629003c..b2b55947efef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18586,7 +18586,6 @@ L:	linux-tegra@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
 F:	drivers/rtc/rtc-nvidia-vrs10.c
-F:	include/linux/rtc/rtc-nvidia-vrs10.h
 
 NVIDIA WMI EC BACKLIGHT DRIVER
 M:	Daniel Dadap <ddadap@nvidia.com>
-- 
2.51.1

