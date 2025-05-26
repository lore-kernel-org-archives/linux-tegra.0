Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB048C0E;
	Mon, 26 May 2025 19:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748286409; cv=none; b=Ir+VxK7iLPtohaH3mb9h7kvAcwPOnh+9/0SD2bZd+e5NsggmIHscygxvEbChbMkleGccwBoDcvGdWyHk7ipfSJcdaDLKBjpSJ76Fc8KkmIHw/9ZZn44jcPsVREgj2bkI44EKsICsDXgitIotMWZNCBVTSFk7rbJ1FBYhQcc/R5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748286409; c=relaxed/simple;
	bh=TlARb42wyJW4mHm9xZyYPfGjZsDx6XEnfL458goqJwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KtMRl5aH+qgcV4FwIgBBDUtA2kVPF9tuPZCi9IAZNJJERkHaRKPuk8EpTHEfUfnoWtlfp6x56q0veG4/Kp+53Chv14OShpJ4f9G7dru2c31gr22POE1l2KmlXJyHOOKvzj6/Qe9a1rgocZ1D52XUFXCp6Qr9oLQV9pU+cX7dOrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JomNSK+m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JomNSK+m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 840FAC4CEE7;
	Mon, 26 May 2025 19:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748286408;
	bh=TlARb42wyJW4mHm9xZyYPfGjZsDx6XEnfL458goqJwU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JomNSK+mAVpSSOAkpm4bFGI0vMWw4r35od4bKNMuGGUBkAblbMGkj/qjqi0mX6lRz
	 SREWnX6MBV8Qv9IP076z6/apmDqT08TaFXmKiQkv9m4Oo7YwhKvRsOZIMY8B1FkpYI
	 2cBUwW/HLBn+HVZ2Uc2Y8R08gl0j3lxM/vH9sRGKQ3Al3JJSYT3F+CPmGQZRwnFkFo
	 gPke/k9NpSgMtLcRHMigllqCkEQ2nMhbMKQlxpbgBlYD/sTM6p6IPeB9U7jsjYOhUd
	 LdSseWnJqmI88XemtiBazkp4VazA8G9H5ZdSO/aqrsrv9TkfnRvrfY4XqxdU8YWWxK
	 02WlDuzyAgWbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AE9C5AD49;
	Mon, 26 May 2025 19:06:48 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 26 May 2025 14:06:46 -0500
Subject: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMW7NGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMz3QJjE1MD3dySYt2k0nRdAyNjS5PENGPDNINEJaCegqLUtMwKsHn
 RSkFuzkqxtbUAwMoqkGQAAAA=
X-Change-ID: 20250526-p3450-mts-bug-02394af31f0a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748286407; l=1219;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=lJ7CQIivb8F58FIvgU/VSOHUF2zLzJTp4211UVT4t2k=;
 b=4GxshBtdNZF4P2qcPsOYPmwtNXVwDr983XH7CBMrDGcFV3kIdY9ox2nDfDqYubluUY3KErMon
 Nzgh1smI6qhCMY4V7h/d/9AgM2B6L6LyRV79IamYlphtEcFTjngbb+4
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

---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250526-p3450-mts-bug-02394af31f0a

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


