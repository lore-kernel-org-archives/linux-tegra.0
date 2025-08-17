Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6B31FC0E2;
	Sun, 17 Aug 2025 19:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755458704; cv=none; b=rUg+RZGRJ7Fh3DM86lqFT7BlS6qAXVsufVL3baicIGAvDWV4dFRep1N07bfkIlFIkTq5b+njioBX5OYfuonMu+jsBPNuWqqWf5ghm078G0CAUy4ZeUHXK+tSdaPw3BOe/r5DMXc8g3yTnfZQZPtb51kpA5AZhGOwbgzVQ6AcV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755458704; c=relaxed/simple;
	bh=xL6R8m/nXCFkJx9BMX3ZnWeIl1yLQn9APl1EfADjcYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQBC9mav8cTUVLL9q9+kg2Zw663A7/un0quMgV6+rgccpiHtd5vHJKUxbElJuN3HubY6/18Z4bmzafmgv17XKpcGfV8yy+yHamz6F8utJms8WzvCACcOHZu4899VtF4L41b0j2uJMrVoRCIOmu3+VWP3Hbm7yvNa66KlSLT59gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJ3zc+Jc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJ3zc+Jc"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3bb2fb3a436so1802769f8f.1;
        Sun, 17 Aug 2025 12:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755458700; x=1756063500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FE5LvxHI/u/9rY7Jgwh0AsRJ/tZlVUrx+gbhVYMLy5Y=;
        b=EJ3zc+Jc2GYGh8umrsqlufz31wc6rsd9JAktaXa+FeR4nqjOGZQzpA11DBj5FYZ2HS
         b67rCYEjn3othnXWV2PxyWEqcodUPY1gzzbqdcgRai5hOjiduE7vJGOsk8WFTU9EDaUs
         GDAXCb2b/NWFd1+RPU4oQLKYcpwS2yHzI/zo5QqKGv0QpVYe497Z8rwJRBWnb23QyPii
         5GiploqU2J0vtWv3cS7Wrgjgb/sH3vgbefne9l+ZZf2j/izNwix9kP0MSWjMREmh/BoB
         gCEJpR+5vBBUTYKF5OGrPaRrFbZxHfz5XuK8xWzhBUIoYCYwD5LE70/TIT0W2oVBx+/z
         eHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755458700; x=1756063500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE5LvxHI/u/9rY7Jgwh0AsRJ/tZlVUrx+gbhVYMLy5Y=;
        b=hk7KVp2b9n+7f/tQ/3S4cJCT4b0717/JtFFMvxc4NP6wYOOrPLvCmijIyuaOpRwNVd
         ipdZdGhStPkFMJJJxJvjiajVSrB6HOvJL5v5bwh6ygJt/PoJTmIMbQ+SSxzonFHCRatG
         JC0Lz6dCD2tPAV10hvvSGWxzXqTALBwUtoX4518EciiESUOb3paE0IuNHyl+9xBp6iMK
         uYTvjCrW40gBuegyDY6HXqU1I15VffAendrrw+pjJBqOtWZdyWaxWjKChaqf9ht9jsii
         4R1gt1FLdRh4KUt/LSmZhGaEc/dWzz8o4jVuu5nBvIP8avxkifGhct4F90M1emfTREtb
         f3qw==
X-Forwarded-Encrypted: i=1; AJvYcCUqarySgrDFWz9IxCiIELLlLnItJvglK6bnIRQV6BwiaPAhUdB9hZmBAQhp+ujs61JpQ6nHKMS3ixoBTp0=@vger.kernel.org, AJvYcCVTFzZEz9skahTO0RtAK5xz8KO2wxd/IGDmTUa25/zlBJv/p8jHc4WTUHkQ5oKUWh0dZiDb8KlCtYD2rlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtI+ccXZREwvfhCNyHDb4LFyaWDiTxDu+IvY2wYhaYoio+G1Ha
	5GHgrLZy7Lzj/qpf7PGy1e9ezaBeNJJlIBKSc/krSNrssjKfjPkateNW
X-Gm-Gg: ASbGncsgeSHuPhUno4jCUC9cqmZy4RX9GWUr7Sze8VkwolBp7DyYQiF64vEVfxH/DXu
	CHwyagTSbESj0Xp2jv++dPfl0DZw3j7jXiya/6SiizLt2bGMgj9E5N3BMufc1mYyzfWYJ0GyV2x
	+du0iqY0f7c0XsqPwT7wdmtgFgBwelvjj5IgAAGZ6gQhv4R0auo8UZs+h8td4Qkx7MW27U4zR/W
	9/Nh9+vG0/qdmN7ReG1lQFJuPlQScQa28kIAtHzHgYNi5uoyyohqtRouTutw8jvLJl/QMjkKG/n
	9HEfhVU0pvD5WFJB6f/42R2mq9IWdFKjawAUH5ZSK+V4bz2K5TnFGZknsGqxYVUkuR9eYGGksOS
	/bEW1L1nHlCQs7a4qYrggENwnaLa7vcTOvqAfBZ1hHkNlk/gBjYqh/MbOEmIuoOybs7/qWVqKfs
	TVM5k1qzL7kE6r
X-Google-Smtp-Source: AGHT+IHbLevYiqVnCty4Q8SzEZcXz+rOpZ/2YyoJYFaBeEoB2NwGJh23htNkZ/5c7jJgxTuiXI+kqQ==
X-Received: by 2002:a5d:5d0a:0:b0:3b9:8224:d3cf with SMTP id ffacd0b85a97d-3bc6a83c6b0mr4325502f8f.54.1755458700279;
        Sun, 17 Aug 2025 12:25:00 -0700 (PDT)
Received: from simo-20nx006jmx (adsl196-126-73-217-196.adsl196-11.iam.net.ma. [196.217.73.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cf151sm141569315e9.8.2025.08.17.12.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 12:24:59 -0700 (PDT)
From: Mohammed Guermoud <mohammed.guermoud@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Guermoud <mohammed.guermoud@gmail.com>
Subject: [PATCH] staging: nvec: Silence unused argument warning in NVEC_PHD macro
Date: Sun, 17 Aug 2025 20:24:25 +0100
Message-ID: <20250817192425.12983-1-mohammed.guermoud@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVEC_PHD macro was defined with three arguments (str, buf, len)
that were not used in its empty body, causing a compiler warning.

This patch silences the warning by explicitly casting the unused
arguments to (void), making the intent clear without changing
functionality.

Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 575233fa1677..7accdcafeeac 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -28,7 +28,7 @@
 	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
 			16, 1, buf, len, false)
 #else
-#define NVEC_PHD(str, buf, len) do { } while (0)
+#define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; } while (0)
 #endif
 
 enum ps2_subcmds {
-- 
2.50.1

