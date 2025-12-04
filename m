Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130442F5A39
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828420; cv=none; b=Rf6t244cMB/cxncZ26Utuj7eoolgiD5AA4IJ3uHR2Kc0YEUh7NwgDz+OMu3X9yrGDj0YCRuMc4U0rQkzwm4BNp5qwwNblYpzz01evwMWiZxgf9APIDcXm5COJbCpbaxIjs/SLcaIzYheyEZ0A8dt0K+WD4p+XWprNAh4LnrrR5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828420; c=relaxed/simple;
	bh=Ubq1KrUSxqn44bDKjL0Tglob05w52CADvwCDYj5e0/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7M+D0vnUfCfwCqjSF6JMTQOX3niC5mqvAHf3pshZ9dol6Z4fQ/OIJpoC+ZTQXcSJU2gBKYdwaMrkFrxai7Fgck2J+UYfZwo3irBWaJuew+GT364ULkMuP6SQwgZfrH1n6Xy9cGR2fKM0JAH9hLM4D/9HEl++40zizYSZ+Talrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRhpq7ZM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRhpq7ZM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b735ce67d1dso63902966b.3
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828416; x=1765433216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
        b=GRhpq7ZMmqoXM65GePDBWAgiwFOSMudV28yvRgRi1ybQbf6iXx4xFjsOrP2EkjN0M4
         PiGeqL9GOlAozuMJ8X3a5TqG9SvdgNUxHC5LR/UUyde1BhbKePJZjy03UhBc8gVA5pg6
         UGHpQCbfsXRYu3VXnbXe8ndVFK7MT0ufmjJGA/tnjdwfDhGJEKopEC/wScwKnuEeuBO0
         JK7tE10eHV2m3mWV+CgHVf09xLCLipDY+3O3Z7Pks3LjvW4brZK3KTAEutrhyj9gZBK+
         LSbYZNNbVohStX5UuWhKvBzJ3fXUtvCRwEZWby9Twh7jmIMJDl5h16JERqj0pwGfoYvD
         FZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828416; x=1765433216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
        b=wyKKYsuXDdKRsnM1ZfMqCzwbWwHz1WCBkM5HRFUYs8x4vRzdUXQkMi3yzwodEJGkw5
         IvGTyr1J3yms88y5FzpkLvQd4Ead/jGe1CfTz7/1xr2511EEKdSjW2JYAyG5daYs99Ck
         LOTD5DBEutbwigJRjZPETG9f65qBwJtTTJS83oyhC6V/hpjKQzOHz2f16LnpzHPZLn/c
         DTNrqBkCthy1OrYo9NSEJB7QEGlbBFk1FWI9mgCsVSa+UCcXG4N0zYj13zEZTnu9kPil
         aaKRgjlWvpPJxV2AfbT0Cta6rPN5mAqLVGFdSRqe/p/HnsaBwMGGgGSbmStIl6US/WBY
         F6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPGX+bXg4UJDu+9AFMYsIW45vCey/vIKjcTVy6zOpnQvX75eoQpihicf8php3vBjb4yhhG1/Pw8d8oDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbgcry7gVbHn3uZSXsHK0INxZ0CQGo3QMT2YAKyByHFpy97lbq
	qk+w9Lfbl+SDUscomd43xyMoKY25HX6lxgb5hgtH7ScFEkDaZ1LK9G8b
X-Gm-Gg: ASbGncs6YfI104ziVkqFY45Dwx48UQcbiHpqmolMwqFhjbMO5Keibw+l3OBYs6TFFLE
	55+ujxaDWAH6/gbqpSGwCrXilcBLlTk3ssXrqsLNXn5lI0xLEYiBmaAk3aWP6EGPg9VnvNGHmkH
	tSB0w8TrFBqpOHqH+R+IXCed7QbfsRYRXMonyxLj2rY5WKr+uVIJ1gueYy1bRtTO/CJziGZ1iEj
	p+/y5QD62iC5miamROC2SS5QO7sKANg9v9PQBLYRALQfQI7cavoE5i5oTnyGkLW9zQ9I+mIw1oG
	jLMyzK1BpVZ3FDV4DnaIF803g6pnu5NShgf3uQ4kvc9Tg37QaXUtHYfGXGm8NUG3jxkPi+8F95W
	imo1WDhsC4e7WQUkA2Vq9IDoaaegw0rrh1E4LU1Q2BoFf36ayqu8OJp2oa1tB3AE2UYgsTV495L
	EB/dAr8eCi3g==
X-Google-Smtp-Source: AGHT+IHyJ5vSGGRsFzAABA0jckI72SrOSeey26WOAYb/OdF0iDanbXw4lY7HsSTswxWolZ3f1U5HAQ==
X-Received: by 2002:a17:907:1c94:b0:b72:134a:48c8 with SMTP id a640c23a62f3a-b79ec470ca9mr186508566b.14.1764828416001;
        Wed, 03 Dec 2025 22:06:56 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:06:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 4/7 RESEND] dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
Date: Thu,  4 Dec 2025 08:06:20 +0200
Message-ID: <20251204060627.4727-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Samsung LTL106AL01 simple LVDS panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 4a5ca013d0db..adb244460a09 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -274,6 +274,8 @@ properties:
       - rocktech,rk043fn48h
         # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
       - samsung,ltl101al01
+        # Samsung Electronics 10.6" FWXGA (1366x768) TFT LCD panel
+      - samsung,ltl106al01
         # Samsung Electronics 10.1" WSVGA TFT LCD panel
       - samsung,ltn101nt05
         # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
-- 
2.48.1

