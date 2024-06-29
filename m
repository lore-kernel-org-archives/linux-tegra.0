Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F27F4C99;
	Sat, 29 Jun 2024 17:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719683228; cv=none; b=Ihpm8OPuDxpVEv5OAafAC3HYfT2Ub5B1COtYJRxOZ/jldCgdZnqF4h0MbHdtLVpstjoV0IlNU5RHxgrc7s0W036eOsPS86BblcyjLjlpHbLC7RKPrAIeiswFlIz7yToQxk9DAIBqMd78xl187pKA7oPP6+TCcKHbPsaSOK3uEJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719683228; c=relaxed/simple;
	bh=8jXpjaEGXIVt/rnGrJd4HdmWE4veMgKAlIPQ5e/UWBw=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=Kw5D5Nc7HboCIfAWU7EHxOZEmaanXYpVRTrO8eHbToLyuC6nA4eX2uSl1TY/KiWXoJIZZQyDBcWtkUpiJKUm7kPK055evfXoRpYaI2HNUaBjIwWcVNh0OsKDCF3gbo7xLpqRFRGTsT9+k08tvC7kNyTZSSYGOJ5pgS+XuTgVekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gk4kcpKU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gk4kcpKU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-424f2b73629so15864835e9.2;
        Sat, 29 Jun 2024 10:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719683225; x=1720288025; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RM9I+OAVtRNtNBzaQ8k/P87nr2q6nUcg+dZj/RNtCeo=;
        b=Gk4kcpKUvPfmbMt4tkwbioNPHJH1Fsmo0Je/H9OwVHd34i1T/u/58fOZo+7GJIxQGa
         Pa/pHcOjfsGnSI914pZjOfcdi1boGe8PQBgQXXarGmWMJaVPzPMUoFiMg3u074mibCGc
         yBJuYbFGcyZsdDYxBa9+uU0htAadrwq+VzYUsyiTu9Tk8VKNmdREMMUqOqWk40w91Dv6
         n4sO9R/ZJyAXf3zUmysM+6OSS02fAJa7a6/G0/UvyOqG9w7h8mU4c4uAtq1lcjwKjutp
         LK3ncLffTsG4rYDJCOsIFvqXAtNyRL8oCeiwcD3RW9RTFMaigXd/do3r/Xb1OoshVC6y
         FESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719683225; x=1720288025;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RM9I+OAVtRNtNBzaQ8k/P87nr2q6nUcg+dZj/RNtCeo=;
        b=KgluldZibd1Ey8LETb0K/bvOdAgwRMr6uJFGJKNB7m8Vf57ESC/2Ta1FFAQA6Vpfdx
         MifjqtiQrsAmJ0rhFC5cSSnU+DyVAqyXSczv1i366ezKiqYf1RXmaEd86yqRpXP4ingC
         LJ87SpYLjFFQh4GdsRLQuuRXX0L5BQdX0N9Cn3uPAZi8+8yL9hH5r4CNqbjuVWqJFyMo
         NxCTX7a8ICUWFWNJiknffbb5m+tdNXR3ZIEJuhvVkTo4/RIzjsLFWd50+zw4HLe5DKqG
         CjD/yT9vuHHt2haN//LSPELdVbSio48Z2EU9Fr7BXynAFwW54SlxdKmoGliG7ry500zj
         eGFA==
X-Forwarded-Encrypted: i=1; AJvYcCUtYjN6gfOGixl6X2lrbGn5hT5vKyk+e3aaNYzNWbjwtmYuinYPBXQY/sgfWiLKLQ7jSxU+5/lk6VDWZCis1SD7VIgwEnrOCZYw26cQiwZoure8NHySTTMWEYiMhb/Vk0E/Q+wI8KykDqU=
X-Gm-Message-State: AOJu0YzKOmtBaidqHdVn11bwN4eXz3jG2xuHT24otsKAY7g0KASs9+ZO
	Q8fM6qsY4tV1F0SuLngBLDk3DXjMrek0dw61FFPBh2Oj0BvmXnGZ
X-Google-Smtp-Source: AGHT+IH4uBsJD46pExK4S2eIL1HXcwBAMRAtXfuDZKRJ0KGCzOPoK9l5N7iXtrbM8bLZxaTAjDSgNQ==
X-Received: by 2002:a05:6000:c09:b0:35f:16c9:a5bd with SMTP id ffacd0b85a97d-367756aa9d5mr1239993f8f.23.1719683224932;
        Sat, 29 Jun 2024 10:47:04 -0700 (PDT)
Received: from laptom (88-121-55-84.subs.proxad.net. [88.121.55.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e12fcsm5373040f8f.48.2024.06.29.10.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 10:47:04 -0700 (PDT)
Message-ID: <66804898.5d0a0220.6df0f.4f0a@mx.google.com>
X-Google-Original-Message-ID: <ZoBImPI8YbgOzycV@laptom.>
Date: Sat, 29 Jun 2024 19:47:04 +0200
From: Tom Mounet <tommounet@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v3] staging: nvec: Use x instead of x != NULL to improve
 readability.
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use x instead of x != NULL to improve readability.
Issue identified by checkpatch.

Signed-off-by: Tom Mounet <tommounet@gmail.com>
---
v3: Add change history and proper description
v2: Make commit title clearer

 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e5ca78e57..814eb121c 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 {
 	mutex_lock(&nvec->sync_write_mutex);
 
-	if (msg != NULL)
+	if (msg)
 		*msg = NULL;
 
 	nvec->sync_write_pending = (data[1] << 8) + data[0];
@@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 
 	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
 
-	if (msg != NULL)
+	if (msg)
 		*msg = nvec->last_sync_msg;
 	else
 		nvec_msg_free(nvec, nvec->last_sync_msg);
-- 
2.39.2

