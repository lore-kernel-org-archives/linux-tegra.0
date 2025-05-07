Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485E21D5BE;
	Wed,  7 May 2025 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628696; cv=none; b=HpZ+YhquB7PsVS5RrNdotdEd6uWDvp1c+BRCTy1WJ+FrX7ckZlFr+BS48kqwVrCSreWYk7cz04a24qqlmi879el47jFE6TfImv0bzU83bxq7vyajQLnF8dtgmxEglJagQUB6JB90dy+VILY3jkAjmV2e+zci8VzTq9FjrVzuCLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628696; c=relaxed/simple;
	bh=vjq+u13KsUvIYVcxUHjfGszPIzgMZIijDC7N96LOuFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auc1xwmDc0t1e8v6xXK7eLb6WBCnVo1WRBxAUQqwUeHewYMLs2hPzQengtg3Dddls2IUmdsOKtJxalZU2Q6T8ty0pCeRbTbxGjkC3g0NCK+137xLruljwI8dePi+f39Db6NBNAYi99UkOUPJUrGJof74+p4d9Wph0Qv5wFVXo/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXbFOfto; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXbFOfto"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0b933f214so46895f8f.0;
        Wed, 07 May 2025 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628692; x=1747233492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJYtvNI5TADH4DUmOi/xVOl8RYUqMkSISLm7I0EHSEA=;
        b=BXbFOftoUoaFjHyw40zqLrZfQVE/VlYjIVLVj42ckUc0oWjYJTTxRCX5/Vg+qEdm8F
         MtEkgsmHB4XcgwOpYaxyKX7CiZIHndSTV5zIFZ/KgnMEaToWbp4PX+89hNJ9t0VNSk6X
         plPyen0RL3BsDEBfbGqM/rnn8Wvg0c/lb4CitHumdk6BGpEe4RpW1xOtaKDYvgMoXhrE
         LCjvfhPqVjrwSTvJLAo0DCeCCc8J6P00sIoF7zLdkiz96mI43QsNQXudykG3FiS4pYa1
         FYGfrTWL2yRJS8gCltvXp1p/hzNv9WuC4iEa0C+gyUNleUuKSum00i8+PWtRuFP5vSIn
         +SHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628692; x=1747233492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJYtvNI5TADH4DUmOi/xVOl8RYUqMkSISLm7I0EHSEA=;
        b=ceXygOIEeIr6366VDN0tMt8FshcaDR/9hFANhhgXeiBgbGlMm5UtfDGHC7HJpJM2Ao
         dQzHXSkayL6WekwwTUnfxvduv+t0kbVnecU14eH2tdQaQzMsYwmYjXVl5ZrCM1yRHHGu
         cnCPMoivGL72NBtEHRyooCgkrVWIjyIjPGHJuBng/avAOW2ib/gFlU3u/c2MZJ6HVjTK
         6+O23SX9XFvLgIcfzX39f41MNWsPs68WsqW5/X9xTU4+thiu5mPOdx7QGUoj418ZbgvH
         kFSkhwdeMEQkG6cnVhVEfx/qaJ5IDeG8WrBLNCvA9oCY8H2oVLmovgwFkuaQv18x4G7k
         ePFw==
X-Forwarded-Encrypted: i=1; AJvYcCVZwpfEs6h6Zt8vIwXhz25a0Slhb1Fx/xQ48FP7CKN5dih13/x7kvEtBe0MCFe9JI81q2PBMw3oRZfb3sE=@vger.kernel.org, AJvYcCXwEhJqbRWOyUQfXm56+Z98Dh8igHQDaQSEqqNESdrfva+WagByktnxMSJOdtNlg7gCnHJ/gadMywMF@vger.kernel.org
X-Gm-Message-State: AOJu0YzblG8PiUV8j6APGlnpxrWpuimLeCeyR+WT8RjZcooHe/dRK3Xd
	Y2vIiaztiVzDiLL0pIAO4VHmE+LhFdSIkye8i59fhL5jv5HbGzkn
X-Gm-Gg: ASbGncvMOUp3iRjMwoR7fB/CNi+QLj4A8FH9xg+iofpl7W9ihzhuBSt4+Rc83beVMgE
	cL3NYYGpKSFHWEC1df0UkKyf+EtKAbVidFagFhlfzSHtGS1bosZa6SWqkj6ASvmKXPNwLE/C7J8
	g9fUrYuSZ6EQ2wdkOmdQleGVIKP2zi+Jtj+x97khnWO0ReUszCzvzPGkyOGX6KhfMzXn6B0YUwS
	lFVwrEr2LAEvU86LkJj7OlJvAkxkYv61YQtsnUzIXvdu24ldHlCaXtcHyVhaTdvXJ7prUiagLci
	e6DnibRmn11GgneJ4vJOwAGNXH65Kjx7OBB+ktz42zNvQ+IrjuMpZERudMxz6+KmzBA3D+if8gt
	sOIUP0foh8fGK96EW3uQAowWS5MdMHBKC
X-Google-Smtp-Source: AGHT+IE3GRrUbcJRXUZ8oVHxZExN19EWb4LrUwbbUrQuKMAiFcmec3rh3MmqG0kDCruukT1p3JiACg==
X-Received: by 2002:a5d:5f82:0:b0:3a0:a8b1:cf17 with SMTP id ffacd0b85a97d-3a0b49abab4mr3377148f8f.15.1746628692446;
        Wed, 07 May 2025 07:38:12 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd351315sm3083825e9.19.2025.05.07.07.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Date: Wed,  7 May 2025 16:37:58 +0200
Message-ID: <20250507143802.1230919-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/clock/tegra264-clock.h | 9 +++++++++
 include/dt-bindings/reset/tegra264-reset.h | 7 +++++++
 2 files changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/clock/tegra264-clock.h
 create mode 100644 include/dt-bindings/reset/tegra264-reset.h

diff --git a/include/dt-bindings/clock/tegra264-clock.h b/include/dt-bindings/clock/tegra264-clock.h
new file mode 100644
index 000000000000..7af85b401dd0
--- /dev/null
+++ b/include/dt-bindings/clock/tegra264-clock.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
+#define DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
+
+#define TEGRA264_CLK_CLK_S			2U
+
+#endif /* DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H */
diff --git a/include/dt-bindings/reset/tegra264-reset.h b/include/dt-bindings/reset/tegra264-reset.h
new file mode 100644
index 000000000000..31d89dcf62fa
--- /dev/null
+++ b/include/dt-bindings/reset/tegra264-reset.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_RESET_TEGRA264_RESET_H
+#define DT_BINDINGS_RESET_TEGRA264_RESET_H
+
+#endif /* DT_BINDINGS_RESET_TEGRA264_RESET_H */
-- 
2.49.0

