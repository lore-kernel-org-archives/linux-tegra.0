Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0BB19EED3;
	Sun, 20 Apr 2025 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745159739; cv=none; b=TmR2JnpfUcl+hNl275+4K2ULH2ec30xxZIX00SvgrNIpgqV4+bDH/mCUua3q6RHl5SDmaN6OSHadtBL0WRIUU9y3QvORYF8ZzshbHPfvOlS58NW/3hD1hKsSrunNZCqUyry51QdtaUNP/GygA3M9UyQ+hIXpQSeVToiB3u6xe6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745159739; c=relaxed/simple;
	bh=9OoBrdf0aTphFq3DQgOnSUzXQkKcFYrB4Ko2JU4ZoTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d++Bi2Nf7iNDdeGrfw33HQmOTVa9op4zt/nUz0G+gwCtHgxVQZJdCf28KG0R2g2UXyfXyPmgvccX/hgEsb7M682lY4A3RA+32Nvtqx2Or1/I8vGE9bTiaDtHhvH5AmE2iwzxsWgOvATHkR8PP0UfQRMGKEAXwR+xuf95c0vamjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjB0Kszn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjB0Kszn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D96DDC4CEE2;
	Sun, 20 Apr 2025 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745159738;
	bh=9OoBrdf0aTphFq3DQgOnSUzXQkKcFYrB4Ko2JU4ZoTs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QjB0KsznHU9kt2rA6FD7GB00L8cU4Z708N0EZhJdSGdHpZljmRT+H8iiZfLbK3mzr
	 HOOaqO4wgjAnEDzhes1YNYm/6NfoIWo0+csKRBrEI6j2R6AftbAxdKEWmWGIIr1C3n
	 rW8+KJh4fv3j+9Vk7O8H1M9zMBoQUxOHqgdpdkii4yV2a0wIfKGQPMX00YL69eBquz
	 dkPGrSBaLhlZxCEi35PjMSWI/0ENfO9oWbfKMtfQVnQ+hHdTvPhjkkvX9eR1DD1OYF
	 vZqe6of86neR5iwvn8JWG9nGc98tRI9taJ9+VqYHHh3qnGrjYWYX59z9zxsAnCMbEc
	 /0vr7M7Wa/IMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AC2C369C2;
	Sun, 20 Apr 2025 14:35:38 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 20 Apr 2025 09:35:37 -0500
Subject: [PATCH] arm64: tegra: Add uartd serial alias for Jetson TX1 module
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-tx1-bt-v1-1-153cba105a4e@gmail.com>
X-B4-Tracking: v=1; b=H4sIADgGBWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NL3ZIKQ92kEl3TNKBIonmqSXJishJQcUFRalpmBdig6NjaWgBGD1t
 MWAAAAA==
X-Change-ID: 20250419-tx1-bt-5f202a7e4cac
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Tomasz Maciej Nowak <tmn505@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745159738; l=1081;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=s5PVuRKvd6CVIIO1qFvDhPIiDwgl5quGNSuOC1OhL7M=;
 b=tnSSFZwOfguUzNM3zleHB3uCj3aIawzpDFK6Qv9DPsuELzx6WbQRO825xb1LpP8J2+Y5b/eTq
 XgBvci+4zi5BTpRT+QMO9qJRCjH4K05RI9sHD5RhwIFZGHVkC4OE4wH
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

If a serial-tegra interface does not have an alias, the driver fails to
probe with an error:
serial-tegra 70006300.serial: failed to get alias id, errno -19
This prevents the bluetooth device from being accessible.

Fixes: 6eba6471bbb7 ("arm64: tegra: Wire up Bluetooth on Jetson TX1 module")
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 9b9d1d15b0c7eafd3895f02db1bc747d7cc8923c..1bb1f9640a800af6c10fabf0ee3916f2566a6d4b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -11,6 +11,7 @@ aliases {
 		rtc0 = "/i2c@7000d000/pmic@3c";
 		rtc1 = "/rtc@7000e000";
 		serial0 = &uarta;
+		serial3 = &uartd;
 	};
 
 	chosen {

---
base-commit: 119009db267415049182774196e3cce9e13b52ef
change-id: 20250419-tx1-bt-5f202a7e4cac

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


