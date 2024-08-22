Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F013AA2E;
	Thu, 22 Aug 2024 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724359852; cv=none; b=rh82TGoCkDsmzSY1Z0IaJMRQk3MtAKGIeyu1TQ49lH5qdbG3xLzHPqpAMiSnoBtGVl04hkVQ0hZMynab1S69jCtJUDg4CpaJCjjjh2NRxjdu4wmMXPMFngymUOiEfkayBse3BKCtop+4ujHAFV4B44hdWnnN4YkqyGxoTWxetq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724359852; c=relaxed/simple;
	bh=Q54Nx+O2Sl23E88hssQiSTeCj8d0ltDBodtJOVav6nk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ldN2jPdcn4bVd3+m7sJW//0r5Es7lZ0dQYpKasnSwWm4y5OY72CHipqesT93USlPRXx18lLZqrmdHwmvcoXrBKrSk0k44z/+BFUJyjtY7WJjMXmGvX6w5jRqMcWzSttB6ar7Lr+sY76und6gnRHP5gDhBHXcV1HOmaHY8Ly0vyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfvArPAW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfvArPAW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8666734767so164786966b.1;
        Thu, 22 Aug 2024 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724359849; x=1724964649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw3+iCjTPQFvMhYVXHpivZMghgw126sYI/qUY4SnqZ8=;
        b=XfvArPAWBQxV/l4RpMToC5J2cagnMhlCCEG/Oih54fT5N49ok6oPRcxss/nBH+d5vO
         7ltB8iKupdXZzIi89E5YLdv4tv0TfBomSWVyou0hWltABx8pkBQe2i75vtXMt3/BXznB
         /0YEfn9d4lZ+Her7XQ8RBA35WsZsMFtc2baJ26UZdiXcK1PgbNGNU2Po9f/2CO+RnADR
         BNPStNZqXDcBeSdfgHDRtJQMaL02hCexB/c9Ti3XPLnf9cyIYK21Av9h1HVHXFe2HTi1
         ZiSwyRZ/2Iw1S07x7De8oPINrwbOEWjIwpO7v9lVyGa8dAJ19d6LYOQ88hp0MM/Od4JS
         3Skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724359849; x=1724964649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fw3+iCjTPQFvMhYVXHpivZMghgw126sYI/qUY4SnqZ8=;
        b=lCpmZ8nFBWQy/ZheaNE6p8/7cRgwVrmzPfe+UOS8tY8QKC9AQrBYgMt6cf5GkAvAYv
         ihW3Nqdprgf/KQRhSOOUxm/j8vLtfXVMACH9qwR9y+Hk1VTCrpTrC9D3N92s1j8x6Dga
         3phUfmrWr+hO16265k909xst42e/UzfwczIAIioUr1BXen9eZSQaFOjpwj+AcjfzynN8
         WO9k30LZ9C/Q/oo67JvdJMuBPuyQ1xCqmiuV1f5NOfu1tKUAF+vyxwYyd4OIdCTw0rSH
         kxfNAmg9RTwZOxUwwl0kf0L3WvBXrEC8geYLWqt+ObXXS0v/rYrAJF0Ey9v1X5JrnI5a
         y6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUFzCYG86Gu9N5y+IaDlxsjoS7p17WVFuKeUwG6ldNxi8AuPpzdJNkxawhUVR695LGcQ99J7+X5j5QN+rU=@vger.kernel.org, AJvYcCVx299T+s9LpHaGYBuffglL52N4W4mHNj9Mq902mgZz+aTk6ezAkPgSjcctxELqIczluODuYv21cnjc1kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwQtC5EgbloxYQL3h1Si3ddHRo98IRlW7+R1qrNeNDdyErIL78
	tk48tWhslvpGyPxKSs7K/9v2iAhdVf+oNviUBe9CyliBceIK0i8F
X-Google-Smtp-Source: AGHT+IHva2stwTSqG7rGZTaZUHh+/wTMO8O+48GKKMUS8dBUyWj5Buqho3Efd6rTd7pGcg1cwITIAQ==
X-Received: by 2002:a17:906:eec4:b0:a7a:3928:3529 with SMTP id a640c23a62f3a-a866f110c45mr589588266b.13.1724359848540;
        Thu, 22 Aug 2024 13:50:48 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f436ba2sm162067366b.120.2024.08.22.13.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 13:50:48 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/tegra: hdmi: make read-only const array possible_nvram_sizes static
Date: Thu, 22 Aug 2024 21:50:47 +0100
Message-Id: <20240822205047.642845-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the const read-only array possible_nvram_sizes on the
stack at run time, instead make it static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 09987e372e3e..6bf2dae82ca0 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -434,7 +434,7 @@ tegra_hdmi_get_audio_config(unsigned int audio_freq, unsigned int pix_clock,
 
 static void tegra_hdmi_setup_audio_fs_tables(struct tegra_hdmi *hdmi)
 {
-	const unsigned int freqs[] = {
+	static const unsigned int freqs[] = {
 		32000, 44100, 48000, 88200, 96000, 176400, 192000
 	};
 	unsigned int i;
-- 
2.39.2

