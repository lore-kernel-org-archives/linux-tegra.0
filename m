Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3945B220F41;
	Mon,  4 Aug 2025 03:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754277277; cv=none; b=DI0M6FjpI3DasBMuFdg6WecS0w8Cqh9ubz5QqQSuZkRbCnm9HyXGvIIodyOjQ/Ra9QEXeYmqPwGf5hHahLG4h7/zIfB+8LkONuRgjIIL3bReCiCLyhbFAunPaSuI5yYxa5JldYKCUC4Yd56d9pLA2dgVphnE0yrmBZEWU4GBhps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754277277; c=relaxed/simple;
	bh=myVExRKXPk9+9mqK9OBr5CGv5g4GLCAI6KWhRmWzY8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEjXrB4WbPoz7g3fyifmwjyzgu3WJP4IUHo38pNL7lYOKue5mmA5tdeH4lzi7DLSu0wJyev4xLC9bFQHz0Iw03b5ymgYjSzyMz2jpqsPUC+fF2WyxZ9yvyrjzVyNpHFhyJyAD5ryA+Z0lNOAuS8HxHE86DjTtRhmuentdez8rMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvDhlH3a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvDhlH3a"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A124C4CEF8;
	Mon,  4 Aug 2025 03:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754277276;
	bh=myVExRKXPk9+9mqK9OBr5CGv5g4GLCAI6KWhRmWzY8M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DvDhlH3aZ0IUTnrkJhk0d7efhQvmPlWRjORBzwcXaicFgFQiyOSW11NjNFdSirMy6
	 3oSZkLg81NSjeJ/Oy4W1AraMo7QrNo5o0Q4C1WCFvWXHnZZ8kU9TXz6inegVXWXtA1
	 mPUCmx0pKa5BRnhIPWvbSWkpty244HTeQnghIsQyZvDZs1QPU0ZWRGAab8esdCIFH6
	 YSZ1YfWcqLYQMmgPTsSI5mA6LsIa3EGWBY8UedRimyckt63cki98/ItEUIMWLPNn8s
	 tUPKiJN+4C1Ccvtb75+FWe2L6H2lAPSmkN0De3oRiJ0HSe+m8miFqmTOcHP2kYZoTh
	 UBOIxREShwAhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D95C87FCA;
	Mon,  4 Aug 2025 03:14:36 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 03 Aug 2025 22:14:30 -0500
Subject: [PATCH v2 1/2] arm64: tegra: Add reserved-memory node for P3450
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250803-p3450-mts-bug-v2-1-6307125408c3@gmail.com>
References: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
In-Reply-To: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754277275; l=1065;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=54qVLzP/hgsWFyN6spzXC2/TI27xrBRmEzvsdBu2gLA=;
 b=wfTzZuO/9ZjlrgWh7QaEyWk3Okkkkb1T1RmlMgQy798olmerOcOc4QKon4NsyIxOHgoJFIdCJ
 o3ZHMq3mnFzBwpnU43eFPoA1GrX7Et7x+ys5O5zq6XsR9JyoTBA6ijG
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Tegra210 L4T bootloader ram training will corrupt the in-ram kernel
dt if no reserved-memory node exists. This prevents said bootloader from
being able to boot a kernel without this node, unless a chainloaded
bootloader loads the dt. Add the node to eliminate the requirement for
extra boot stages.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 0ecdd7243b2eb1abba9adbe9a404b226c29b85ef..8fc995e71696f2ef5e662a21feb96ea771c7a53f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -22,6 +22,12 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;

-- 
2.50.1


