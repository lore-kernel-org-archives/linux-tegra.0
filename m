Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244F32CA9;
	Tue, 27 May 2025 01:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748308950; cv=none; b=ZGau69zlLwSI7+eIiIlRIR8GO68/CYnPplIu8pP4XHvARtlVHRLlVs0OjHeMHLU6WN4YPw828NTqCipGgvPshaiklVKnIoY+Q8Eyse3Q/G726yFAgQ+QCRG4rCNid86H1hLwlf+ZWnfY8hMnPTn5Xz9ja7W7q+xe1O36ekf9QaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748308950; c=relaxed/simple;
	bh=RKJkT7w5zj/yTul3lSLeJxEILSOWFiAtG3GxY6fv928=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kssNAe32Sl2sv3QKiCuR1+Xc/N/rULZ+2eRx3a7lrFBOvWeFG8qizrmMyEF/CEqcsOaQPSsUs4ZGJOuWucGAohm2TeY+AHK7vFY8r/Vg01KhIRsfkmlBesQd7l9KnKnUazmJyu4eMHpK3GBM02ky26JrHy8IuNjDG7rCiCJ0Ifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNDElprQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNDElprQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E55EC4CEE7;
	Tue, 27 May 2025 01:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748308949;
	bh=RKJkT7w5zj/yTul3lSLeJxEILSOWFiAtG3GxY6fv928=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=eNDElprQMbWjnJR71ETh7ED1rqnOPy1ngdIoaG2rn7ZBaLs/27UXo/fSaBo1Nimjd
	 yjySRHpO/r7sL+2fRVj5cxstcHrwZQH2ENSMaNkHlVJw3SS7W2zfdYRD2n8XsaDLWr
	 8WSD304J8HZ/bNdNLaiRznilK9W8aD1oUsiu3LVqJhOqtJUR06IWcIMli3Kn90e5LW
	 sOFpqc/23MNtxFwr0IAGd9IWtfHG9hMZmEv2SlfHR/zuUKbwjdvT6OB0mNIhDdjV52
	 NWLvkwbhOWQdvTD6br7RTpDYpCt4WlkMdQPzHirLYxsg12AKJBRdKD0XD7blfw77vc
	 a9RkgnT3l6+yQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C24C54FB3;
	Tue, 27 May 2025 01:22:29 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 26 May 2025 20:22:26 -0500
Subject: [PATCH] arm64: tegra: Set usb micro-b port to otg mode on P3450
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-p3450-otg-v1-1-acb80ca2dc63@gmail.com>
X-B4-Tracking: v=1; b=H4sIANETNWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Nj3QJjE1MD3fySdN0kSxPzNGNDCxPjFAsloPqCotS0zAqwWdGxtbU
 Awu937VsAAAA=
X-Change-ID: 20250513-p3450-otg-b947f31843d8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748308948; l=1025;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=1JUbkjCUHsRo77ibOj1eVsP3iKgmrocVJ93H88m4fC0=;
 b=1B6zbjxZikNUuRqKQI3D6EJGN/aUM7kbA1Qip2nE4pcdfC923tP0mgJaqiq5sRK2mtEL1XTvK
 nY0YsXz6I3pAgCQgN3Gy/cWNxJFqlP3aqDLdK//zfVEScAXCHCuL6jP
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The usb micro-b port on p3450 is capable of otg and doesn't need
hardcoded to peripheral. No other supported tegra device is set up like
this, so align for consistency.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 0ecdd7243b2eb1abba9adbe9a404b226c29b85ef..019484a271c396edc30200e8592c713455a8e1a4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -514,7 +514,7 @@ pcie-6 {
 		ports {
 			usb2-0 {
 				status = "okay";
-				mode = "peripheral";
+				mode = "otg";
 				usb-role-switch;
 
 				vbus-supply = <&vdd_5v0_usb>;

---
base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
change-id: 20250513-p3450-otg-b947f31843d8

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


