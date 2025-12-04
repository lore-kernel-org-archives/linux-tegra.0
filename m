Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5086429B8E8;
	Thu,  4 Dec 2025 21:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764884229; cv=none; b=jl1WkbkhlVQrse89XUJUE+UXnkYMNaZtUBOylZ1pjjhb9TKQs91zBMtisqqiaD8S+aNe5pK/R81Y2RJwUaZ6wHQuVrVqqYzLEd9J+GOv6ns6fdyex1kbdVRS9yMyjpoYjbz9wqgwm0n21CAo5qcXDCDFiBKqZ/QgjhzUUFnayEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764884229; c=relaxed/simple;
	bh=sfqv4Sr+OMnIY9gPi8e20yGHX5crm0dHFpzYIkqQThU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVYXLK7N2xBRolZrwvyA7s/WY5ZXm9AzxLiVGAg1bNimVBDYNaz/wOwFPpO17XLiQM2JVTjGkl/uz7L098K+SUTJRPg5u+ID/K8znRnFGllU5qpAwv93HS+DYptsC+LIq+U7ZIfWcC4Bg6y4qecs4r/Ckcafi/8tex3hrxK57Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=bjzMUT0d; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="bjzMUT0d"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 751846007C07;
	Thu,  4 Dec 2025 21:27:30 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id LtbYQ1UNms0M; Thu,  4 Dec 2025 21:27:28 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 4C6BE6007C2A;
	Thu,  4 Dec 2025 21:27:26 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1764883646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aM83Mw77rc4YXSunFcfwV7YHy4i8gIDVF0RJQ/BhVzk=;
	b=bjzMUT0dNT9EyFzPJm70pDW9tN/aT9KJ5QlvIf+ZKkIgHyFlLWFUtVf/WvvrQkk1jGJxYi
	kZJln2MBCPT4EhTipG4fsOCUaQlqmm5R4ofkkxfhTpq0257GJhxhiAXRDDhGn6JCZpA0Mh
	uzqxeoMSkh6OSkrDpdYbz86SJPBKVOLE2YdG3UHuf4hlewMVWITcFRDo/LC6m5u1a9crh3
	X5blxrCsLBZXNO45VptaSXF+PaHwe2GgqTwgK1RE+Ng+BEtZf9FT/EY0L9WfRGsftzR2/b
	WxknAPxD/mwg2LhTPk5MIn2pym/wCxAW05KPbijoIwPPYMj+1YdDWlBAiUstHQ==
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 1DCF336013D;
	Thu,  4 Dec 2025 21:27:26 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Dec 2025 21:27:20 +0000
Subject: [PATCH 4/5] arm64: tegra: smaug: Complete and enable tegra-udc
 node
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-diogo-tegra_phy-v1-4-51a2016d0be8@tecnico.ulisboa.pt>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764883644; l=925;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=sfqv4Sr+OMnIY9gPi8e20yGHX5crm0dHFpzYIkqQThU=;
 b=BnvupjdKsXMIGOQCbH1KdJqWRnJzGtzyBQhBhW5BNYfMdgIF5DCTYTD+y1ag5U/rOm+mlLqyl
 AJrDL5z+BbNADkNyhq8HkkWwDr5sSqY+TsGyLKDTpY+Ss7c1gvwnNFF
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Complete the missing properties in the tegra-udc node and enable it for
Smaug.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 5aa6afd56cbc..b8d854f90be7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1843,6 +1843,17 @@ mmc@700b0600 {
 		status = "okay";
 	};
 
+	usb@700d0000 {
+		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>,
+		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-6}>;
+		phy-names = "usb2-0", "usb3-0";
+
+		avddio-usb-supply = <&avddio_1v05>;
+		hvdd-usb-supply = <&pp3300>;
+
+		status = "okay";
+	};
+
 	clock@70110000 {
 		status = "okay";
 		nvidia,cf = <6>;

-- 
2.52.0

