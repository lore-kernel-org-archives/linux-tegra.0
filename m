Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5A71E22E9;
	Thu,  4 Dec 2025 21:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764884229; cv=none; b=sroN8yrjNYBoHsccrEyxsu6UDrrbj9lfUh4Twd/yBiovgtjxogrpB92ZxIaEhJiHoAe1e36Xgj9zO8zbIyktmvGF0OWjAsO1NPlP3ixaJMI2IvwyLnPy+qkHE+ko0ADWXg1xJbEOC7k2pp4AAvcZ74YWVZZmwiaPGwpYcnRbHVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764884229; c=relaxed/simple;
	bh=k5kseAlh5a9PKK6R0Ldzp853p/wTGU015EJUvqBOXS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNMuVCdUhmWOo+QpWn71exGNH34XdiajJ2c8skQzwNEPHFq+Rqaumv7WgPhSFjA+hcuMT3MhkzYHopy7VLexW2pMjAMs8NQ0ewcVOk1c/h2fIvONVvN32/QCssWhCH+9BR6hAuryZymXy9o3Uy04vWvG9bcHyL0uz2IGCi5iWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=pUrFTV2I; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="pUrFTV2I"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id AC2E76007C1A;
	Thu,  4 Dec 2025 21:27:30 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id XNRBWlhjOxY5; Thu,  4 Dec 2025 21:27:28 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 0CEF46007C2B;
	Thu,  4 Dec 2025 21:27:28 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1764883648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ju0IKFzoz63GeJ4sByij1Pot+ZusvvtRcKzP/L0CthY=;
	b=pUrFTV2IU+7vUAWpptYhfZS68J9pG50NogQCK9iP6QyiMIOs2FTbqL1KJz3OeeIGWS/Sdg
	SAJkQ6dEvXMpcSDZLOCMkaBO8L1zH1kmKCFbuWGeeityWIlzS3SlmQPgok813lk2MAgtjG
	pp5VYhHFDfVXvfcLrkx4m3OaSJ6LYQs63uQQSCUlz0+jar16lMWjEjEHl7sRyuWGLf6pJ6
	ckgq+zbzepcOcQAEYX3w9wE3x3t3zaJW9qmo8Dfbv5+ioYGfLdoOPD/gsuyBACL9FSoABD
	28gAriKHQZhfSbIVWXvTN0/gHry2X2OnFc+dR+r3U+xGoMxsNd3eiM3qet+G3w==
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 3A76A36013E;
	Thu,  4 Dec 2025 21:27:26 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Dec 2025 21:27:21 +0000
Subject: [PATCH 5/5] arm64: tegra: smaug: Add usb-role-switch support
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-diogo-tegra_phy-v1-5-51a2016d0be8@tecnico.ulisboa.pt>
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
In-Reply-To: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764883644; l=854;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=k5kseAlh5a9PKK6R0Ldzp853p/wTGU015EJUvqBOXS8=;
 b=28zNziToJmNiz0XMrWNVpPoY4soMnfoxl9fgEfUGM+2G4OrGSzVb5cQqeu0zyGk2adkYiprkF
 5WxkvW2G82XBStGxypKDOifVbDOfcxsPQ5O59/Ezu6ZXDxzox7QSLBE
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

The USB2 port on Smaug is configured for OTG operation but lacked the
required 'usb-role-switch' property, leading to a failed probe and a
non-functioning USB port. Add the property along with setting the default
role to host.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index b8d854f90be7..49bf23d6f593 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1809,6 +1809,8 @@ usb2-0 {
 				status = "okay";
 				vbus-supply = <&usbc_vbus>;
 				mode = "otg";
+				usb-role-switch;
+				role-switch-default-mode = "host";
 			};
 
 			usb3-0 {

-- 
2.52.0

