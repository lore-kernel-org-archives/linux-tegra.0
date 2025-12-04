Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7685E2FB0B4
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828891; cv=none; b=Lz4O1HxuKsCX0YwuCrkK1DfPj2i6rJmlekKJOBjMrqC0/9SCc7glyg6+EAWsEtLvePrVOqRgmE4LAZb+SiyCaXB8KhcZYnC/l78N+pe+XXZeNpAuTKikCZyhUOo4dPYOi2Zn7sn8zaVa/c9F5zdXjg3J5VC9RktPvvHdRNCiqXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828891; c=relaxed/simple;
	bh=ggGdRmXLBbjArTvqcF72EClkwv1lqIc94ZhVFK9wFgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgp4rjyiWodf/7pyC5JO10hYVkVgK9yzmFBlaZ+Pli0WMBRqxuopRx0En8DhIlC6QU5mXx1W1bjSheXV8r1GBdKx1GpNodmgOQAFz12l//ai1p77JPIM8gdnLLrVO/KKHrH0veGUCR/9ooi5zmQhvonrTi7q5pc664MrSrJFIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=He0JYtR3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He0JYtR3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7277324054so78638166b.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828888; x=1765433688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYiswRj/QaYbkwuLO6ropupZ4HLa9+N1VAg/V5RUYGk=;
        b=He0JYtR3au0+JXHIcQJ04CJvCtrGRhqMlMBkehZ4rKxNs6BMhGhA2mpbqpHICVOztH
         eCpZEBxhadXPLHy30QXzY4MbR3YJKIf4wUzvjzdP/ii0vmyZZpuAWVzBXj3yQ/4oDNg1
         EDQria3TBOizXbX+u4+57B/EO/OGXpIhGy14pOn8IWztMO1OVpf0GnDLSqA4NGI3miwQ
         dVViVzj/tjnsj1bEzJcHkd/CkeFr9nJRHC454iOohOy5/f7aO6U26sIseNccBytGMbUE
         q9ccbTQEE7y3okmuYtDHwlAeIUd4IR/YbLDlhbiwYYc4tikBhHf6pH+t7y1YXxfISJG3
         un5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828888; x=1765433688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vYiswRj/QaYbkwuLO6ropupZ4HLa9+N1VAg/V5RUYGk=;
        b=DkRVgBxevDNNkodkh9knQbuZWt7kLa1fEZ9QkYH5GQSuPXZGzC0rzU3G25gfpBqKp6
         oYDoNpVe5wKntJ63H8Gu+Dvd37IDYC5nyunYml2x0fs+l5Mm2FGZRdzi+4/OdIGnfyHt
         Vr4Buu5WI1rJinHtE88cuJHSsZ18NFwUr750c99v9JCXiIuW9E/YBlfuXwO776OYJh6l
         8+qY9M3M7iXGJeZt6XTqEVAO9SZyDAh10cNaagV1FbdCnyNZAdszuml68I9uOhRU1Rp7
         BDoURyGmrKNigi62Shmme1mk0O5amnU2o1fE0BAYjsguarirMcNGUqZR56m7eVXJMpiv
         8XVw==
X-Forwarded-Encrypted: i=1; AJvYcCUIyc+44S7MRUkXwvf90Uwdx1s0wR4rDVxrPKS/v+rimuo77rHJPFZbNmeao96A3sWKIfGEnBjxPGIQ7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiD6c+bjVtYkNPRiSWdJevF9AzMw7tMrtmiEMD9PUBU4HW03ii
	oJTGL+MY9pHVP9F286IGMUbzGSMPB+QUUVMyohsVTJ9emDa65io07MRQ
X-Gm-Gg: ASbGncvy8trDRXfJuCUl8+6QCj6hDjM0lu77fHSFnb8kbD/2ptpC9H9DwdtF6qyPOBC
	zVq8dzLWQLkliyxk7rn++IPTNhkFvMsnIc7OEkABKShQ2nXfVexkhOfBeHG/xG1+67r0ZpVbKID
	sjQGeRDgSezQ88avh98mnhai+/szbc3b9xyx8oGs8p3QkUlf70pxnimc6xgCKUF0d3v0qCHboSi
	GWK6gmFvAgU43Qrisr6M9RgR8NNPXZ4U8avq4TuD++JHwh+Qn3b1E30YOpYftWQyPezyN1YyEsg
	9lXh5hLDYfzROVjHibNQ5speUpEnVxNY4aswEwKv88M1miQ8jmhrefEK8RWq0IGd4YJBaYS3W/N
	vai9BrzYUS4zdd+Y7nzo9wwTkzuCj33l2ytOXLsTUIgTttVnF3Y1ywr75urWQFnBDSFh0nSG694
	I=
X-Google-Smtp-Source: AGHT+IFFxhTMIa5+kk08uLpT0I+DrZEQ4kNYGNnKIoSZESkvBwYMSmeMpr2IbKVmYL/ijgj/qYJJkQ==
X-Received: by 2002:a17:907:9625:b0:b73:8639:cd88 with SMTP id a640c23a62f3a-b79dbe8fd42mr443652866b.22.1764828887748;
        Wed, 03 Dec 2025 22:14:47 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445968asm50607866b.3.2025.12.03.22.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:14:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2 RESEND] gpu/drm: tegra: dsi: calculate packet parameters for video mode
Date: Thu,  4 Dec 2025 08:14:36 +0200
Message-ID: <20251204061436.5401-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061436.5401-1-clamor95@gmail.com>
References: <20251204061436.5401-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calculate packet parameters for video mode same way it is done or
command mode, by halving timings plugged into equations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index aab555a2eb68..1ec3f03d2577 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -545,12 +545,19 @@ static void tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 		/* horizontal back porch */
 		hbp = (mode->htotal - mode->hsync_end) * mul / div;
 
-		if ((dsi->flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) == 0)
-			hbp += hsw;
-
 		/* horizontal front porch */
 		hfp = (mode->hsync_start - mode->hdisplay) * mul / div;
 
+		if (dsi->master || dsi->slave) {
+			hact /= 2;
+			hsw /= 2;
+			hbp /= 2;
+			hfp /= 2;
+		}
+
+		if ((dsi->flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) == 0)
+			hbp += hsw;
+
 		/* subtract packet overhead */
 		hsw -= 10;
 		hbp -= 14;
-- 
2.48.1

