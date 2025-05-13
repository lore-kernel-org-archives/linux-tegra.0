Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFCF1FDA6D;
	Tue, 13 May 2025 21:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747170656; cv=none; b=MEVR8wJvsu7VWfpphiM2Urg05LYPch46qYG6xZSzOoBxMRs/lzQD84hZvcKxLU5riJhiNbChUnO1fks+nl6FmhZHEv6aosAmJVB5LyYFJY019eTCiQTBe/RUMbn7k2ay5EQuikBIIVIHLX7Dj6hvlSSC5fgbpCgcBan78rcoos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747170656; c=relaxed/simple;
	bh=Wf/ixVQdJTPDVD55FOEpkhxQFSA7AzSQGrf4Cv0eaLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ewwKQ9dgFOLPnrxZ6aDtDYLGq7Q6/gCplDNyj/QgBzjjr3aNcv5QrTA+Yt+BiB8dyubONrebtaD5sU5uJVkLUDG3vks8nchn6y9JCyKwL+6bi/lr12LJHbULSKL6sTJOk+a1SFXhZtIAIic579nYYSIiSyz82lZ9QYr7fkcDoUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVDBKRTw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVDBKRTw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FD4EC4CEE4;
	Tue, 13 May 2025 21:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747170654;
	bh=Wf/ixVQdJTPDVD55FOEpkhxQFSA7AzSQGrf4Cv0eaLM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=hVDBKRTw39TzaMJ7yo8yJgaJUEWFTLjP/IoiD6gEKP9kumgIZqv3oFcPyywuZFoRn
	 45sik049uWqFW5Zw+O/zltNJBqTON+GkOs2NaBly9jxatDtilyUCYKqW7sRAut90Gw
	 tvaTuAfsYjhaq5ua8EgZog3MPfo9PxzKcGCcrRNgU+xolL+4AKJa/l6LtehciX32Cz
	 xIYlMYqTUfruwRVkeyy6+E+9KaIkHKIByiZ1Amh+ZqIK2UYX+Zg6wa3fndz7Kjd8Hq
	 DmRR4B/LX+bQruVKvBR9ybdWVW/fKfVFXICTewEslttIXfIIMxZna3HfZ9ogn+lz+C
	 3FhER281wXw6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9431EC3ABC9;
	Tue, 13 May 2025 21:10:54 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 13 May 2025 16:10:54 -0500
Subject: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF21I2gC/x3MTQqAIBBA4avErBtIZejnKtEibMqBsNAoQbp70
 vJbvJchchCOMFQZAt8S5fAFqq7AutlvjLIUg240NaQMXkn7hOHYGeMjl3VoWrZEiybV9VC6M/A
 q6X+O0/t+Swr4fWMAAAA=
X-Change-ID: 20250513-tx2nx-role-switch-37ec55d25189
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747170654; l=1050;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=dPLaQNFWwpMQQvgTs6w9ooCG/dAXAgLZi0Ofjn262Is=;
 b=nDqThMqWh8NwGliNuD0oqFzkcSF2nbocrM9K5SlN7Za/ys1VrdmEVOpaQD1t0XPMre3iuf/n7
 Id7O4ix5Wg6CTAqdF5KnF7hEvlZYCO0CbeyKrteqKhRP4oqu0G4ECJh
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The p3509 carrier board does not connect the id gpio. Prior to this, the
gpio role switch driver could not detect the mode of the otg port.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index 26f71651933d1d8ef32bbd1645cac1820bd2e104..81f204e456409df355bbcb691ef99b0d0c9d504e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -669,7 +669,6 @@ connector {
 					vbus-gpios = <&gpio
 						      TEGRA186_MAIN_GPIO(L, 4)
 						      GPIO_ACTIVE_LOW>;
-					id-gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 				};
 			};
 

---
base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
change-id: 20250513-tx2nx-role-switch-37ec55d25189

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


