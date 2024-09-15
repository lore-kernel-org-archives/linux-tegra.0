Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688841B85C1;
	Sun, 15 Sep 2024 22:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726440488; cv=none; b=sct9EUQtyLH2cq2S8v5EJXpW4wG2mKXzHVSM1DOGmgCEiHHHJfu3+u1Wg0be7I4CXLYebdCyUMbjeEQr0VGcTpfzYvfLDxl/ubWrMdrKhh0Vcpuc/f+2k1prZRtwnNJey+VPTlijz4GLYoTOvctHC6RgUv/Ybj4nMT+hWJsA8WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726440488; c=relaxed/simple;
	bh=W3AVPczafQzhHEPVJeMO8EQOQr9O4ild1Pi+en8FGfY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jS9LlJUEdzsurEj5V4Mu90caxmhq9Vt/M/Z1SUjVXOI6rvqUH6C1ssUKINHYzz2nfezjA+cL3NDgl8um1u3aOTaRjF8pgLFUt5toW0Z7x8mLS5toJtxVMKQ5c1MRL0NgSyYO/0T5Uzi0DsBO0VMF9FeZJDeBTK4ivuR5krDyDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmbBDCoe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmbBDCoe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C917BC4CEC3;
	Sun, 15 Sep 2024 22:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726440487;
	bh=W3AVPczafQzhHEPVJeMO8EQOQr9O4ild1Pi+en8FGfY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cmbBDCoe8YIXNQ4cRKOfBR+foeUaN/TAvRnxLLfr9uVATqYSEYphtLMjTwinVdn5b
	 bW2xvvYeq3SxuMyrdfloOvzGtzQ9XXU1LnGP2JuzL/mCnArd7Wv91rTsmWOse1NkJX
	 qMEnAiID8/DXeeufEJLauoZRKPU7HjaF0mZPNw4e+IoKnVy+GPf+xY8I1K4kyjN838
	 mOBM6JnrMBr1PVXR5ZfLPTediVd63R06ZY3G4/X7y+Z5A1yVgEJhJshPrFAjpMbqd+
	 3INqMPXnVAHXvHWPuvAQppCm9ZYeNm+jcKFohVjmTh3761xTKsE3hmvu8QykGp//1f
	 VtRUrOnj1Kcyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2989C3ABB0;
	Sun, 15 Sep 2024 22:48:07 +0000 (UTC)
From: Jasper Korten via B4 Relay <devnull+jja2000.gmail.com@kernel.org>
Subject: [PATCH 0/2] Add touchscreen and TMP451 tempsensor nodes to Google
 Pixel C (tegra210-smaug) Device Tree
Date: Mon, 16 Sep 2024 00:48:12 +0200
Message-Id: <20240916-touch-temp-v1-0-5a008b2acbc8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACxk52YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0NT3ZL80uQM3ZLU3ALdZDOTJDMLSzPDxNRUJaCGgqLUtMwKsGHRsbW
 1ALWGrpdcAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
 Jasper Korten <jja2000@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726440502; l=1112;
 i=jja2000@gmail.com; s=20240916; h=from:subject:message-id;
 bh=W3AVPczafQzhHEPVJeMO8EQOQr9O4ild1Pi+en8FGfY=;
 b=ZPhbv3N1xwYF4OASpscfGJybNimUttAT4cGxgIPHBup4hw6xYif8atQccSUpMV8j5olBjwYP7
 aQ/9X5wnKYNC8DaykgGgExDNs5W7AtHl9JM3Mh/Bje4qv9Xm6+y+H50
X-Developer-Key: i=jja2000@gmail.com; a=ed25519;
 pk=NV6r6q/S3nZILZkoOEuEM7F+uxANotfAYeXyNZTniJc=
X-Endpoint-Received: by B4 Relay for jja2000@gmail.com/20240916 with
 auth_id=210
X-Original-From: Jasper Korten <jja2000@gmail.com>
Reply-To: jja2000@gmail.com

Information to get these working was gained from downstream DTS.
Link: https://android.googlesource.com/kernel/tegra/+/refs/heads/android-tegra-dragon-3.18-oreo-m8/arch/arm64/boot/dts/tegra/tegra210-smaug.dtsi

Both were missing upstream and easy to add:
- It uses a RMI4 HID-over-I2C compatible touchscreen.
- TMP451 is located close to eMMC according to iFixit's teardown.
  Link: https://www.ifixit.com/Teardown/Google+Pixel+C+Teardown/62277#s290806

This is the first time I've ever submitted patches upstream myself.
If there's anything I've missed or could do better in a new rev,
please let me know!

Signed-off-by: Jasper Korten <jja2000@gmail.com>
---
Jasper Korten (2):
      arm64: dts: nvidia: tegra210-smaug: Add touchscreen node
      arm64: dts: nvidia: tegra210-smaug: Add TMP451 temperature sensor node

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
---
base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
change-id: 20240915-touch-temp-c64b68961aee

Best regards,
-- 
Jasper Korten <jja2000@gmail.com>


