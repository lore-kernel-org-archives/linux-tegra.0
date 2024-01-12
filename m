Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4059451C2E
	for <linux-tegra@vger.kernel.org>; Fri, 12 Jan 2024 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RflXBjXq"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3373bc6d625so5168278f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 12 Jan 2024 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705051994; x=1705656794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uqnb0b2kXfoCoynTrOB54knZ4i7Z41VS+t4+yg4qHtw=;
        b=RflXBjXqdSNqDk1aQNFST+iWOjiPnBrw2buxYko7F37fINDhWGd+VFyuj5rkSFOKiq
         ejT//NtEvgIt85po7SPC5Wk6TX0c8EroOsqhx+gRqSV/+3yahH7PFJRRZxkVaLtzc5I8
         8B+YpHna+C8X6IFUkN2jsQZgVWUoAMSHHjdVvrbDg0ChbobGFtBOjcInoITy7VgTHAeV
         zjPd379CekVqqMK3gGt6heNH5t2q5OJJHSEpnZHhKlWhlBc4cH3HDc+0Kv+wA4PeVdKI
         j2lRQUtJOdJI7yGeoLlRFlKH3bjRlZrsDJ00EzMcj7DsbxmvNN4f8ziy7eSMRGo9kcRT
         smmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705051994; x=1705656794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqnb0b2kXfoCoynTrOB54knZ4i7Z41VS+t4+yg4qHtw=;
        b=i1OFIMPP0haXhaPp4HpdykN3+egkA2m/7lsoJ7TZSFk7IJm44HUotusCC1mQqlNkUP
         A+be0zY4ATDVNtATRF0DW0b4TObXNXQegrjj822KVOBsoGOMx9nnSNo4aT8HnR3JwG8e
         NYNcy9sxlD4kep0udrOOjcVpeF6bKcer6UBjVHANiei6lJC3aRpRN5nqX18dY4lhCTyC
         v+oS9bNgIoHx8u4ZkhyZSv8CpelMeSRmuY7cLYY+BxOa27x2ZSNA1UcVkuEo0QDv5kV6
         72FV6r9MJPIFuMxA6JSWm/JDI7QFAe+Bu3GCrXKBgDSkfKITfHqo3DuhVUiLHtAbOMa9
         m8tw==
X-Gm-Message-State: AOJu0YwXEMgELR64LkaszEYdhdFpACn2bqM1KXjq/zAyn+rUJATK9fM1
	ipHmVZOLgTZrgQmWBqw+D+HgQcLOKHc=
X-Google-Smtp-Source: AGHT+IE6+h8/DYbmSXiJYqZjqp+/qLkxkD8sj3JjatRq5XQMFKgb9sgj7nOINdycp6uSUKYLMm+3EA==
X-Received: by 2002:a05:600c:a3a0:b0:40e:3645:f029 with SMTP id hn32-20020a05600ca3a000b0040e3645f029mr577465wmb.81.1705051994038;
        Fri, 12 Jan 2024 01:33:14 -0800 (PST)
Received: from morpheus.home.roving-it.com (2.1.9.e.d.3.3.1.6.1.e.d.5.3.a.e.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:ea35:de16:133d:e912])
        by smtp.googlemail.com with ESMTPSA id t5-20020a05600c450500b0040d6d755c90sm5081692wmo.42.2024.01.12.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 01:33:13 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH v2 1/2] bus: tegra-aconnect: Update dependency to ARCH_TEGRA
Date: Fri, 12 Jan 2024 09:32:55 +0000
Message-ID: <20240112093310.329642-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the architecture dependency to be the generic Tegra
because the driver works on the four latest Tegra generations
not just T210, if you build a kernel with a specific
ARCH_TEGRA_xxx_SOC option that excludes 210 you don't get
this driver.

Fixes: 46a88534afb59 ("bus: Add support for Tegra ACONNECT")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>
---

v2: fix spelling of option

 drivers/bus/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e6742998f372c..b003dad62d596 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -186,11 +186,12 @@ config SUNXI_RSB
 
 config TEGRA_ACONNECT
 	tristate "Tegra ACONNECT Bus Driver"
-	depends on ARCH_TEGRA_210_SOC
+	depends on ARCH_TEGRA
 	depends on OF && PM
 	help
 	  Driver for the Tegra ACONNECT bus which is used to interface with
-	  the devices inside the Audio Processing Engine (APE) for Tegra210.
+	  the devices inside the Audio Processing Engine (APE) for
+	  Tegra210/Tegra186/Tegra194/Tegra234.
 
 config TEGRA_GMI
 	tristate "Tegra Generic Memory Interface bus driver"
-- 
2.43.0

