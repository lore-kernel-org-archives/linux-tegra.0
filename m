Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1D52DCC01
	for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 17:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779037502; cv=none; b=JOWhZKQayvO9S1Pmb4bA6Ogf/XPRkIeYWoWVraabXLDNoZcd4ZjUb9FxyD5YKicCvixQ6VWywsFJIU3oFcEU71p8XbwLihCjCgJ/FTySoZwFKhMXo67BztsOPteTxUqwgwZ454xoavssxywOJNyYTnHKlmxJzAbYeQGB/4/kNHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779037502; c=relaxed/simple;
	bh=GlLqjTL122P6/DbUzOfyNG/g4nxv6YN/h2qiSwhglt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FuvC0qsCdkHS0RIYuNNb9OBPX8IyxxWvPygNkl9umM2FyTJnpHIuqtx1k7eadUl5kFwUoiWzN3HyL4/Rs/Wt3I4n/LSyrZkpnSVKRbFPkAru2EGBDhjmraZcV58j/rrsk67lLlnd5E6+b+qor74z8Ao5S8rPMnItkxWYuG6QDbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYV/Nwm0; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYV/Nwm0"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dcdd1b492eso1635983a34.1
        for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 10:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779037500; x=1779642300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6n/+RyCb939qAJyBNb0yYir20+X71GnlDVWuo/Eg5E=;
        b=ZYV/Nwm0YE/YhS9XWOwj0Giyjnhu9AZpKpTqTC+wxzmZENcLccELNzeW2v7mpI8Fpv
         pK3Vj2dpFCPJtj1BFBWOeHXYZul1Nc1gTkuggMjPz0fb+TPB93OiFrzdc2Xn8UPJW8Gz
         kgRBoze5IIF844UH26zc4BSZrDiqNfhZfVNME0QiDRNSLTCBPfro7DdKOuVXWe0Daet7
         TPwVj7bxECqj6QKrLIKbdFxNvMBlXG2/sJ9ITbwwx2rcXTEmGLCh1DaaRjLJeZh/ZMUH
         pzRJMmgDMN/Y9Ff/tZgikO0gDgmrI7LBusK5okZZu9P1jF3fNkDJjgjG3tWTK1rcZ2pP
         uQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779037500; x=1779642300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6n/+RyCb939qAJyBNb0yYir20+X71GnlDVWuo/Eg5E=;
        b=SsgZ4Rj4CFJYnI8OMV5BNgmqnd+NQEIX5ddC6pJarOnt92q7FwS4hoogp1i76RpIyI
         53PdELBylDwaNvv+/ygOaap1O4jnSXkHJJ//ft9DTrShnyEF6kINNjpIzCNTC9rC3T4u
         khecT5mGR0qkS16wlvva2SK5UW7z4JLStrMZWwA80sEMjhS7LYQR3dnaiZe/ofqLvh7W
         9TjFEkWeqTJ53FDXmUzQHjM/U+8+Bl6gspvK9ps9pfWl7cqYfqUJMqIxofbH2SaNldRi
         ZnM19bmUP6MGTItLd4ASPR8j2zdCwmG4l6ykXrsB+ZhUvBX6+wW0fQW/EQgNHwlchj+R
         7AYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ksrKtgmWKLrzEeLou8fnMNWUKENBuL1C4Xv9/slGLI3NX6QRJtp9DpCyRmVYs1AQXOU4lTk05RMp/QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5FqnMLC6zFOejK6g2rTHms1I1BI4QuqSPmaHmIG79vv+cJ37Z
	kpUEZDmy44qMi0llZw9SeyCR3cK2ZdwKL+vuqp6HJBKVXu6q2CbxF6X8
X-Gm-Gg: Acq92OFiIQDtLHDkFqsqgGNiAOc/ro8pNMqxIHBtQfhHXHvloDUVpcm97BjEupJNeiI
	/L2beKS1mFAMyDpK25V25rJJu8I+S+9a7obQGctncW4QzF48I6o+9wHnb6syBkh7pia8QWc9jCA
	gepQD9OCPp8CqkzknE4xUCqbRASM+W521WFuvZXGidG50L3JdVdYbK03RdPWoWNLc0+EmLHxN7n
	neq3OOTrgQZEmQAyTNZFTFuVX30837YQJ76JnpTbXqIy9M9xW1+NR6CWFcJ859kj4wau7y20Pvt
	Ils3JLYECKwYJOPhiVgjhAqAbH4HftygLqUu8A+TFSv9Rm46I+sSLxECjkQ4vm9hbUETykcZjiA
	B4dlJB6JdsuD/+bl5CN/nfV1Kdy4oTmHinOkI6kBHIxNXauAp4Umo07QReuJOTqDmtTpyG+EkRx
	2kDMrEJC+mMtk1idNvGUbz7Z+9Lk+XpiaM/fDlobhcoF00aw==
X-Received: by 2002:a9d:5381:0:b0:7dc:9908:6cba with SMTP id 46e09a7af769-7e3f1024c53mr6941913a34.6.1779037500072;
        Sun, 17 May 2026 10:05:00 -0700 (PDT)
Received: from MacMini.lan ([172.127.162.94])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55bbd10aesm5924188a34.18.2026.05.17.10.04.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 17 May 2026 10:04:59 -0700 (PDT)
From: shayderrr <darknessshayder@gmail.com>
To: thierry.reding@gmail.com,
	cyndis@kapsi.fi
Cc: airlied@linux.ie,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shayderrr <darknessshayder@gmail.com>
Subject: [PATCH] host1x: bus: Fix missing ops null check in error teardown
Date: Sun, 17 May 2026 12:04:56 -0500
Message-ID: <20260517170456.84927-1-darknessshayder@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In host1x_device_init(), the error teardown paths do not check
client->ops before dereferencing it, unlike the forward init paths
which correctly guard with 'client->ops &&'. This can result in a
NULL pointer dereference if client->ops is NULL.

Fix by adding the missing client->ops check in both the teardown
and teardown_late labels.

Signed-off-by: shayderrr <darknessshayder@gmail.com>
---
 drivers/gpu/host1x/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index f814eb4941c0..43ce048de73a 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -221,7 +221,7 @@ int host1x_device_init(struct host1x_device *device)
 
 teardown:
 	list_for_each_entry_continue_reverse(client, &device->clients, list)
-		if (client->ops->exit)
+		if (client->ops && client->ops->exit)
 			client->ops->exit(client);
 
 	/* reset client to end of list for late teardown */
@@ -229,7 +229,7 @@ int host1x_device_init(struct host1x_device *device)
 
 teardown_late:
 	list_for_each_entry_continue_reverse(client, &device->clients, list)
-		if (client->ops->late_exit)
+		if (client->ops && client->ops->late_exit)
 			client->ops->late_exit(client);
 
 	mutex_unlock(&device->clients_lock);
-- 
2.50.1 (Apple Git-155)

