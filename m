Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6802C0F78;
	Fri, 29 Aug 2025 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756470181; cv=none; b=OiD4CAG7R26Mv/QKXrfHTX1pJ10VbgpKyu8Ar+MvJS5j91myBkgyNwxZ2/Kl8DI/b1C/AAjfl8n+GId46uvLIA5kL+qAiEyQumP1MwgJx4V7ajdwRrF/6D7z7lIj4fdzvR4OywMGtkJEOoh9BWRP7hiCCwWncUlNM5vgGWk4KEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756470181; c=relaxed/simple;
	bh=Qsf8LdCBOg6qlEG4F76h0hnKc6twkDYa3SH3IHz2iJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YYdm2ri8RFTq1VG8pj3KU+BvNO895DlI09C6Rwv3Z5s6RDIo23g4jTMGJT4WxVLIPkKBP7JY1Yk8Su4I08hCftizKvdEtgtmh9piGI7PfngRDba28W1tKkB67Hz34XCJv0hmykEEQludGyoH1fn+BMUgMUqO5njnXtVX53QxJEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9OJ/Q4C; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9OJ/Q4C"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-619487c8865so5807799a12.1;
        Fri, 29 Aug 2025 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756470178; x=1757074978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceON3CwjJmrpeVph4t9zEUTzpK3YszuqGPGiBiVrPPM=;
        b=E9OJ/Q4CtF10Bpceijc6GgZzSvsiUIqtWqbUEiWgoTHhFRGpAdakC/G1mXTmk/NDW6
         GsLzWFT14M3OEx8f+cG9dPM+gAPmWKzmT9qFGAMNhRaInDrhkrq1OcBGquO03/w82QTl
         uEpcx32t+3zukG1AXy8VOBE4MiqZs8NAMNOW72ZCYVBZ3RTyJltzMpDRAVzJL6f9h0S1
         WwgXbUIsTVq3sf3Jhy1Nt7Ay+E2Q1ez1pOmP3QBXGuYDpI0RT9U6eMI2KXo1VIzfx0Ap
         a9tKDxG03bakzhrIMjKq4mqpyhLTWpZErwQOFeenfYVPJR6l5qsDuSyZHMjAzW8qv5Tv
         KaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756470178; x=1757074978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceON3CwjJmrpeVph4t9zEUTzpK3YszuqGPGiBiVrPPM=;
        b=ti82+JbEieCSsy/j3kScBcRJUyQumPJ2HSfwLgkUNSKvVoTmkdrYfl221ZbskvH2KO
         Z6NVGtpXaE+zbgGfHi8d/krqzVmMvNkBjERweZC8eD8XBpBbuh7p2Ll/6KCH1zDUYRWG
         XsrMdB0Iq+lSGSBASuicsCbUqtkdkHC0k6GL/5tTgb/+XFqgM5eSmJ0Uu8h6/GYGMEbI
         TQrLZ9XYazI6zfxvRkVvq2HUzZ5LhhSycv+Akw67b3p6M3QAo8civ4c5szdRFoVGg3Vf
         PrKcuqqC3QeGtuV6G/EBvHFGEPJXA1BGkgp9Pyzji37IOkQAIs4sXErveeHnC4YQlAXe
         eUng==
X-Forwarded-Encrypted: i=1; AJvYcCWQriWgjdTD35eX2rZnlZsI4Df310qSFfPAtqzO97gSUGBBmCVEnrjeKpR5Pyqj6sTAuppJh9m4jTjZBodz@vger.kernel.org, AJvYcCWwLUspR84WWJSEc+gwpGdbfdCYrEL+Hxytq5+4NTAHHjbTG/fTCyzXZE7w9wKpw5EiLiBQCcwR6TQ=@vger.kernel.org, AJvYcCXX7uWyACXhoGQvJMcdtxkL9x8NUL8QO2kF0Pa3xFaPLYrHMOjQDgwSc1cFDSWAIg4akUhZAU6ZPaxvFpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC7KPYgTJkRXI/0qe8BT5EuHpnPkINpsvxHNxloRdD923cgkq5
	4ud9rSbDQKBxhpTAZ/mVwOQZQlvn/CK3sqvCw1uaEKSra6UBuNvIBC2b
X-Gm-Gg: ASbGncufXhYypwjQua/5Y7Be0VO6YqfOMgt1GMj3EVH4r4EehRRlzWwKjM2V9j2tAd7
	a/nY71jUB+UJwR8RJLowg95+GxLxVxGS6FvLixnPg5K9/hC5HV5gZYe2olUFHTZF8g74ldZ7Hiu
	HKjQ2D8ywCjehdqoNjf2q+fhnfTPT5gvSmMmrOjMB8QNBnk0/mpD7LuyT0pZfyxHW0aRcwFP4bA
	BDe8RuAB5vJGzyM7+koyiGN79gzckDxDs6RKyqcl6vp+GQwbz7q0u1KBHKq41n0hhyEg05huZju
	P0KeppdrIQ8OLP3jEhZ110SwPWC2nYj9fn+LvRQZjlv1T9cLmsvNEAV31dDWkW9ELZbKXlVgqFp
	ISEGBsNTEQVHiz+HP5hGldAS3bJkFzvYCABY=
X-Google-Smtp-Source: AGHT+IE4zj9HMkqBC+WULHAKvF5+kgyoF9TjB3Y5fjg26i90RF+JsJFl7CS3FbiB7el0t0bUluqmIQ==
X-Received: by 2002:a17:906:3199:b0:afe:d1a9:e815 with SMTP id a640c23a62f3a-afed1a9ec9fmr592729066b.26.1756470178245;
        Fri, 29 Aug 2025 05:22:58 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd7047sm188662166b.51.2025.08.29.05.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 05:22:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 1/4] dt-bindings: reset: add Tegra114 car header
Date: Fri, 29 Aug 2025 15:22:31 +0300
Message-ID: <20250829122235.119745-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250829122235.119745-1-clamor95@gmail.com>
References: <20250829122235.119745-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The way that resets are handled on these Tegra devices is that there is a
set of peripheral clocks & resets which are paired up. This is because they
are laid out in banks within the CAR (clock and reset) controller. In most
cases we're referring to those resets, so you'll often see a clock ID used
in conjection with the same reset ID for a given IP block.

In addition to those peripheral resets, there are a number of extra resets
that don't have a corresponding clock and which are exposed in registers
outside of the peripheral banks, but still part of the CAR. To support
those "special" registers, the TEGRA*_RESET() is used to denote resets
outside of the regular peripheral resets. Essentially it defines the offset
within the CAR at which special resets start. In the above case, Tegra114
has 5 banks with 32 peripheral resets each. The first special reset,
TEGRA114_RESET(0), therefore gets ID 5 * 32 + 0 = 160.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 include/dt-bindings/reset/nvidia,tegra114-car.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 include/dt-bindings/reset/nvidia,tegra114-car.h

diff --git a/include/dt-bindings/reset/nvidia,tegra114-car.h b/include/dt-bindings/reset/nvidia,tegra114-car.h
new file mode 100644
index 000000000000..9b8c320402db
--- /dev/null
+++ b/include/dt-bindings/reset/nvidia,tegra114-car.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * This header provides Tegra114-specific constants for binding
+ * nvidia,tegra114-car.
+ */
+
+#ifndef _DT_BINDINGS_RESET_NVIDIA_TEGRA114_CAR_H
+#define _DT_BINDINGS_RESET_NVIDIA_TEGRA114_CAR_H
+
+#define TEGRA114_RESET(x)		(5 * 32 + (x))
+#define TEGRA114_RST_DFLL_DVCO		TEGRA114_RESET(0)
+
+#endif	/* _DT_BINDINGS_RESET_NVIDIA_TEGRA114_CAR_H */
-- 
2.48.1

