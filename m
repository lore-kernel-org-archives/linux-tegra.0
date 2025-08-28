Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F197273808;
	Thu, 28 Aug 2025 05:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359867; cv=none; b=EqHfIoLWz2ufQSBkykMTTxBLwVXxWyF4iaBJtAhxLv80+PdWfj/l8sxiCFnL9szTk43PbrGA3M0G0VpeZu2jh6UBN3o2KIotKp3MGQcXeYEVnvnsFw19Gq3d9l8LtX9mOC1N9hpSQLhjDyVRS8CUi+H3+9MmQEICYxROWDa8M3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359867; c=relaxed/simple;
	bh=96edCYZ/EaTjrgkJOXR/cEUQzco83yGGUYqlBhsOXFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciYLrX0IJbVwHD5+UwQWKfjfwmS7azfN1FECyfbf6b/tYt4uIHSwKrcmV2UapEoUWoOk3I39aiMyNUGj495YT5dq7QyZT+9ryk8iMCyjVryTGagcvHXprZg7U5FNXAf13T+3F36VyadcWoZMO/fMiH8EDlJGK9FIOuqrr384wTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmXb3of8; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmXb3of8"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61cd1046d42so686904a12.3;
        Wed, 27 Aug 2025 22:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756359864; x=1756964664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6o/Zimb3QVL23u1xpZEyW/FGO4vWjtp/1DqQ0zMljE=;
        b=MmXb3of8q+YlQ7ES5F6mpYyGXdePsvqEJENew0EkYYXSIwXtj9PiatNVgmKBHg6O1+
         gV4Ev6y/HoILEdhtEytupOwQB7/EANGdq5RAL6LEnpYSVHiuCD7iT/v7DS+6v2Zo14ns
         KSpdtF6DidFPwLOPwf2eo2IOkFjlqFbNZrJqRc+AAJrhijRCud2Gc+Do4iypAeNWHaHC
         wA3gUuBu56jyYmI3nAN3geWXigqrcAVua62n9LUON3vr/9u6GPd+VoGbjgms4PFsliYR
         Nsr7wiWz5teORNblatz4/GvSKA79qK1HN0U4i43yKY59QhH7QXHfMnZc4smtfOEgILaE
         6Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359864; x=1756964664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6o/Zimb3QVL23u1xpZEyW/FGO4vWjtp/1DqQ0zMljE=;
        b=n8uxTrejZD65xHuMyECNdXSk79/ov9gTAJ0PCjvZCt8UAWpctrKBYcz8YSKQh6BaWZ
         ttayHCFAJupVui8ePW+jgjzYI2A4QRStoQdWctGJ9uyoiIfyD0koShHU4r4JwIQCPsgX
         n0VhfLnXinxu2sgH34Ms53R+xIbDFU6NTjlX5K5u4sH1uMMK+rV9hQNJTxPDhV5zpxxw
         GllPF6pR9zwfJeREj8/GYxKsthKVW1jw3o0uHYtVDyCM1umExYCQD3+cVMr9OsxpZiw3
         wSi9V8WobWF865xrNDk87x7KUgHoFfz29Mr/G7YuQMK78BLywYnglnqfSFoFHOQwlt/x
         UJGw==
X-Forwarded-Encrypted: i=1; AJvYcCUDWpGkaLzEjibU3M+S3pMaqGITY0ACzB6DfP3EGuye3iXUhm5/XamXy5EMa5bDLGIX3fKPhzVuyaGVTC0D@vger.kernel.org, AJvYcCX5K37xWs2U+rx87yevSEN4H2w7Ts4cUcS7P/wyl6vZzt+hScJ3vC0gBCuveAt7WjyYswF2tNXTrn8=@vger.kernel.org, AJvYcCXSRFhSikfNIAh9mLl4QuyyJ1a0VKE2U/pHCDA34oRLRh6WQX/FI4S6Zv46KopyvtjS/niDlDamgysDrsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyryrcSAlujF1e+yz2QumHugzqnayukg57iNGLbtU2xlQlpMyF5
	I7JwppEBjpF7tKmBe3KwCictWgaZd/ZPZDGqqlF4YbMIIsqarBnh9UoX
X-Gm-Gg: ASbGncvAaI7QlVShtbgJo5IBza8WwBIBnooqzSX+USFa5F8p4RyKSxckVAOWug+DcjQ
	aH/aouR+FJwmjmJDSYG54A/II4Y8Hi4WGNEfEi6TRmZnOVcnvRlcyMIl5NCxfsvVbmRnEwpthOw
	Z6T+aywtgbRIVgHu/U0/BzDzCv3qh/+aYxXqqgCd/H5oC9b2tNMtrkas5aHKiXNvZGICPcuIXF4
	izaUaMqQvW3O+2kn57VvIU1nv7gAzo8Wxb2Zv0fumpw4FJBs9pWmqiqC+A+lYF0BLUxx87v0nCJ
	GNL5eK96NtXvADB/nDguN2+4hGWy5ja6x2+C19ZDubB7ZI/OAPHgVWOpNlevHlXRYxErAh83ruv
	k8Bao8vLE9ndih028SEHNDd08
X-Google-Smtp-Source: AGHT+IExIqmyqwtJ8qbngtgtYqgIBUhSPtMOSfWiRKn7+rE5u91qLkEv0/hIPHClbNfEmHsfmqZZHQ==
X-Received: by 2002:a05:6402:1e8e:b0:61c:24da:c76 with SMTP id 4fb4d7f45d1cf-61c24da1352mr16101470a12.9.1756359864320;
        Wed, 27 Aug 2025 22:44:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cbbdac051sm2102841a12.29.2025.08.27.22.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 22:44:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: reset: add Tegra114 car header
Date: Thu, 28 Aug 2025 08:44:00 +0300
Message-ID: <20250828054403.7112-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250828054403.7112-1-clamor95@gmail.com>
References: <20250828054403.7112-1-clamor95@gmail.com>
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
 include/dt-bindings/reset/tegra114-car.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 include/dt-bindings/reset/tegra114-car.h

diff --git a/include/dt-bindings/reset/tegra114-car.h b/include/dt-bindings/reset/tegra114-car.h
new file mode 100644
index 000000000000..d7908d810ddf
--- /dev/null
+++ b/include/dt-bindings/reset/tegra114-car.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * This header provides Tegra114-specific constants for binding
+ * nvidia,tegra114-car.
+ */
+
+#ifndef _DT_BINDINGS_RESET_TEGRA114_CAR_H
+#define _DT_BINDINGS_RESET_TEGRA114_CAR_H
+
+#define TEGRA114_RESET(x)		(5 * 32 + (x))
+#define TEGRA114_RST_DFLL_DVCO		TEGRA114_RESET(0)
+
+#endif	/* _DT_BINDINGS_RESET_TEGRA114_CAR_H */
-- 
2.48.1

