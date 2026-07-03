Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AAE288C0E
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 15:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093832; cv=none; b=AkuPr5IlcLop+MMiYyfd5H4HjB0z9MZYlRkkr3cj23LOVKppnnCu+9BYTNbC8KXKO3awvzS3GHzNKp7kAGa4IhCK9hlOd9maJm8qmF1UGR6hdn2evWm4FmyWqIlm4FlZl0K6iekjczjG8d2RzYwty7IBKKwM1uz5Gd5YB2ZA3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093832; c=relaxed/simple;
	bh=QCniDK3MYytm6HoVkF3Jm96RLGunl2RkQqt3P75lZRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KaTXcN1wmLpt6MhEC8kdfn5ANcmKTX570ZHT1t+kq26nvRYeLxzOStLrSHSaem/ZN20p0BkmM8N6ROhPXKK4APEXqf/qKmqHnkRkqXpBctryCGwTAzddsB6XMN4i+seitTV6cGKfLc6vQOZi/aX53hYmtBtDjkdbswjWLLzcovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sttu1tSh; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sttu1tSh"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8f0e5e36912so3956986d6.2
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 08:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783093829; x=1783698629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5XX7Rz3Qelo/FGzxIpNIi997ellIca9U5MUALRAgbw=;
        b=Sttu1tSh0n5omgasvtdjYhbZtGnjfL33dOFZJ/btUWv9R3FuxsLT4kjAnTjHcmm8UF
         itdRprSOBJUf/Xcmqd34v/H8+RFvWEbMwJqB/JAqrlKq8bg+l08D90HNIeOjudivI0Nk
         +YishegwsPAoPgsuwB4XZMte+mXI9seTv5t6mfOpTKztzAsE2y+vwb0lKIm42vyJrpr3
         9/PtHwJjDwmV7NcsHyx1LYc8jglTpY9T0s/mISIxbzzvNevhBcXijXFfFOYCq36P7MBB
         jUPcALD3qW4sdoEbhWQDneEoLa64p1OXqjoQVAfqrk1XFrlLbihaUPP5xFySWyRBHOT8
         +Atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093829; x=1783698629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5XX7Rz3Qelo/FGzxIpNIi997ellIca9U5MUALRAgbw=;
        b=jjmwuCwN4vWhhnM4+qpt0NR4Q9LydZRkaL84BLnWhJpuuiEQpuv5zP0QVKgJlBrTXO
         vdarYHLjTA5zK7cY77qyXdsvVjixGQtu3+BZ1kgzAgAv/7r5sCYaFQW/wLuHT9sDLgA7
         BwFfkqL6MUqGxbwf08VzkmvqIxDubGLtwCrrXQJmGBf66pL8XTSVZ/A/dmY3tbcdD1Mw
         TE0Iiqh5ktbfQaRi30wS6HgI77D2esdD6PcOvRnyVj0DqvE0keAJwyP00tJEnxF+bpu8
         DQ5A5AqNwTaMgb+qdD0/vs/qh8U4dJgmtg7eeteZj7mH3CT2HPtEPxpS4NscMeDvac6g
         5RVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YQNVcBnHWqKX2HyfAs+v+WG4zq7xzPm51nmRku7D9gH6TG9dapJbSxZTepfhiKeZamvwdDftwkvsnbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzScpNsQ7UF+3fDQGOAjXtCRX6qY+CAslZxNYHVXWaPO2GYtpIP
	mu/drYq4L6UuFTO8p6BktIu3gl7jaP8eOK1eE0UeladVBoH5wBoNdA0U
X-Gm-Gg: AfdE7cmDK2Pjopa36nAOvSzmHYpHmGHxyxNdDNTqQTcxntzmVMeFgRaKUAetYP8P68n
	A4ryiYO+om3tN/Ppj90Mfo8W0uZxsnqLdgUUeJkxmW7ENMmU425TU1yR7emu6c+IkHuD82tV3yK
	VvcR0q9fIFrx+ZuYrrukcGGBTb7J/x9kaHsJaybdVJu5bDlfuJqPyihKECcPEMTSmoWm/KG2dzV
	yZgcRcZDrzkBvP/j8PEi6aBY2i/6hzg/cDqq4G6bXhdd3xRwOOdKKHMu4XsvsrbgD6ekLWx9/uw
	HZ8+GDo/MKkdpDj2z5RzB4XZJXPqWVsZxtzjofN5W5szgY7TIHl4Zh29DZui8sD3gdPRzDqZKu1
	MWvM3IJPN71dYqy3iDithWD/eiJhLyr5Oe+Fgz5LFjqY/tFgrIDfFTJn4wCtNRGpdpHVGdmYV8G
	lo2wwdil/lasJXUGylVwhJo8ZqRTfs3ts4+fP5PDp9p7hy43N/MzKacwHd01T3A4r/4CihqSczA
	6xaLW6dfpprPTA=
X-Received: by 2002:a05:620a:890f:b0:92e:535b:e08b with SMTP id af79cd13be357-92e9a3c1a71mr192985a.33.1783093829176;
        Fri, 03 Jul 2026 08:50:29 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ccde4fsm187435185a.39.2026.07.03.08.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:50:28 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: tegra: Fix OF node reference leaks in IRQ init
Date: Fri,  3 Jul 2026 11:50:22 -0400
Message-ID: <20260703155022.158268-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra114_gic_cpu_pm_registration() and tegra_init_irq() use
of_find_matching_node() for temporary IRQ init lookups, but the helper
returns a referenced node even when the result is used only as a boolean
or as an of_iomap() input.

Use scoped device_node cleanup for both lookups so the references are
dropped when the functions return.

Fixes: 7e8b15dbc392 ("ARM: tegra114: Reprogram GIC CPU interface to bypass IRQ on CPU PM entry")
Fixes: e9479e0e832b ("ARM: tegra: skip gic_arch_extn setup if DT has a LIC node")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-tegra/irq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
index 4e1ee70b2a3f..e5a611dce7e7 100644
--- a/arch/arm/mach-tegra/irq.c
+++ b/arch/arm/mach-tegra/irq.c
@@ -66,9 +66,9 @@ static const struct of_device_id tegra114_dt_gic_match[] __initconst = {
 
 static void __init tegra114_gic_cpu_pm_registration(void)
 {
-	struct device_node *dn;
+	struct device_node *dn __free(device_node) =
+		of_find_matching_node(NULL, tegra114_dt_gic_match);
 
-	dn = of_find_matching_node(NULL, tegra114_dt_gic_match);
 	if (!dn)
 		return;
 
@@ -88,7 +88,10 @@ static const struct of_device_id tegra_ictlr_match[] __initconst = {
 
 void __init tegra_init_irq(void)
 {
-	if (WARN_ON(!of_find_matching_node(NULL, tegra_ictlr_match)))
+	struct device_node *dn __free(device_node) =
+		of_find_matching_node(NULL, tegra_ictlr_match);
+
+	if (WARN_ON(!dn))
 		pr_warn("Outdated DT detected, suspend/resume will NOT work\n");
 
 	tegra114_gic_cpu_pm_registration();
-- 
2.43.0

