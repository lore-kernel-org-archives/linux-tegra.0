Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAAC396D15
	for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935650; cv=none; b=IyaWleMVucoDKe3pdgFaqAB/XRqovSITmHsfSdZyKwBD0Vge89HiTS+Qu0C6vY6XH0vHtYlEeSYtOsRrYXmT2Eot0UqyORqrkd33R68t79AYeHhj6B/RAjVGJzWowSwpo3IKx5CE0A9cHhuSA/vJQ7TGrghcAEB4E6IuC7YCTwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935650; c=relaxed/simple;
	bh=XLbatLTUJXw9A3hBonWnh0l0ZSHoVwD+j7EQZ/FCueU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPA5WzL7pzMmbvGw0ESX/eIm/qHZ7qYfLa0TG0ehC876NZ4F+QB6xdN389YP3XTCIEbSxly6RZuUTxcBKVePpFDfCpostKNbcQSv0y4NvzR5LowjYyXsx4sKIIPsy5K0vMsUTjgPLz/FmrsYca/l3aHQAWoWF+fNC1aEComQJvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbYgykEp; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbYgykEp"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-823081bb15fso3261419b3a.3
        for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 04:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771935649; x=1772540449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKJ9zh45ZdopaEOQEByGr+CA6Hn9q+QZHG4I18FgvD8=;
        b=LbYgykEpPFsd+Hn5rQ3PQWzwmKjZzFfEKdVfup3XaJeUQK4/CLnsfRLSYjR6U9Fg9d
         Jtt84NNJXWzGxK5eymcMonZtRpVPuxTey/Q89YIU70we/nxFV0t1fb9aXMVete0XwnyP
         xEubDm/68ithFXMF8QHUChZOsOfku18/tWrXraWTZmnxWGrDJPj5IVN0ibGxpQo4M8O3
         WMJG4e4DmpF4QWym7ihUYztFL8uUPlCz6pxC4X3tAG0wItKuOwFWpkzeH56TeNkffugq
         3xDsD8V0v4AQHQ28N95Bvovp8Py5c+eZvIsG7sR7DIz5ffUoq3p3l/Oc53tfAuM6Bden
         lcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935649; x=1772540449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QKJ9zh45ZdopaEOQEByGr+CA6Hn9q+QZHG4I18FgvD8=;
        b=Xum+TsyHGWDPhcTbrxUuA5jCbqh7t/Ui9Ipl9lN0S43XuS2v+2oqYysXRa4X5a1XVY
         2Mo+CvYXXuInPco1/wiAxRXfVyFurBKuopjDznaYoSFGCtVZEgZwSu5NQbl1eSqNnoUB
         wzGi3QdY+WibA7sGlUTAT6cuUXFz/2F/4NAjALkKXbWcXHY47nmkbiH8aX1/zRrGnasf
         6xR1KEo9216u+3W5GLJI5OIe4CSx65IfpKf7haoSGYcBSpWeSYiSdX0Gc2h3VKAfeWo+
         UTA3tX2SlWK3rgP1/yWZ2q37qnau5ofapVEP8+l6XTHLAwzx1ac0Ri71oCKJBIr/NMDi
         5c0g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3Tdaniqv5i3K3gFda5UU2sAfw4sz9KX23IdNBKprnU2swuJEkqfMf1T/AVilgyykvPfmxOcNXWkwBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybTb002Sb9gYPKmdybFSt7HxoVHQL650DYZq9xkHPKR4DOLS4c
	U0pru6CzlpiAtAViszQCQMys1KY1bhbj0SrasAFKO73zerL25JNuqt0Q
X-Gm-Gg: ATEYQzyZCHsC41CQBfyRhMVfG39LVrVUoW+SHfs3LG3SAS4SwRiFBNkBtnk3uIthLMM
	YG4N1mF4479nv+IShdSvy2G8Z7vkPHl9anD4S1BxXstfDp6tZmFMQ60ceQ69vbP5lZGn3HR+AZm
	xcjNCxy0HDofMPDHzphH069D/96MEvuX9XNmjXV7CRmqwjm8WesYucsqjjQUVspITuVKLARQvxr
	nweMrIQHsKVzIm2GAiZtOfK4ugiM8TfBVeYF9H6pDMMinuvtNfVHTYKGwuBWiY3PrkEbrHoKJz/
	RjQft0uPpP2Vu819Dt7+2t9cT6ZtAe5q76qiyl2nydPQSZUA+C62kJwkYtaJ/ANbOSZoTC/JpwJ
	PFB3V152qR+zAPz4xwVpC2kPLMsTXB2NOd6eIF4uUNByawm0hAUm+XbUHaqbQf7WtBckDA0hQBD
	yIwtcgVM2CT+Z2gNl+toISpZFpbTcmxA==
X-Received: by 2002:a05:6a00:1d83:b0:823:3056:c2b9 with SMTP id d2e1a72fcca58-826daaf421amr9257126b3a.65.1771935649115;
        Tue, 24 Feb 2026 04:20:49 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8ba11bsm10613950b3a.50.2026.02.24.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 04:20:48 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	linux-tegra@vger.kernel.org (open list:PCI DRIVER FOR NVIDIA TEGRA),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR NVIDIA TEGRA),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 4/5] PCI: tegra: Use readl_poll_timeout() for link status polling
Date: Tue, 24 Feb 2026 17:49:00 +0530
Message-ID: <20260224121948.25218-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260224121948.25218-1-linux.amoon@gmail.com>
References: <20260224121948.25218-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual `do-while` polling loops with the readl_poll_timeout()
helper when checking the link DL_UP and DL_LINK_ACTIVE status bits
during link bring-up. This simplifies the code by removing the open-coded
timeout logic in favor of the standard, more robust iopoll framework.
The change improves readability and reduces code duplication.

Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: None
v2: None
v1: dropped the include  <linux/iopoll.h> header file.
---
 drivers/pci/controller/pci-tegra.c | 37 +++++++++++-------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 32dc11d95cc9..459a2bb1a065 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2156,37 +2156,28 @@ static bool tegra_pcie_port_check_link(struct tegra_pcie_port *port)
 	value |= RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT;
 	writel(value, port->base + RP_PRIV_MISC);
 
-	do {
-		unsigned int timeout = TEGRA_PCIE_LINKUP_TIMEOUT;
+	while (retries--) {
+		int err;
 
-		do {
-			value = readl(port->base + RP_VEND_XP);
-
-			if (value & RP_VEND_XP_DL_UP)
-				break;
-
-			usleep_range(1000, 2000);
-		} while (--timeout);
-
-		if (!timeout) {
+		err = readl_poll_timeout(port->base + RP_VEND_XP, value,
+					 value & RP_VEND_XP_DL_UP,
+					 1000,
+					 TEGRA_PCIE_LINKUP_TIMEOUT * 1000);
+		if (err) {
 			dev_dbg(dev, "link %u down, retrying\n", port->index);
 			goto retry;
 		}
 
-		timeout = TEGRA_PCIE_LINKUP_TIMEOUT;
-
-		do {
-			value = readl(port->base + RP_LINK_CONTROL_STATUS);
-
-			if (value & RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE)
-				return true;
-
-			usleep_range(1000, 2000);
-		} while (--timeout);
+		err = readl_poll_timeout(port->base + RP_LINK_CONTROL_STATUS,
+					 value,
+					 value & RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE,
+					 1000, TEGRA_PCIE_LINKUP_TIMEOUT * 1000);
+		if (!err)
+			return true;
 
 retry:
 		tegra_pcie_port_reset(port);
-	} while (--retries);
+	}
 
 	return false;
 }
-- 
2.50.1

