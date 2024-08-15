Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FB41B143B;
	Thu, 15 Aug 2024 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723737572; cv=none; b=jTGqT5jr4fFMtiNzHH1U2LSs1IUUmsULLrTzaAGjkcwmJoRy5WdjCiGtUb/rX76Qh5PZDJguG2oCIBJnO9Un1qH4D1I71LPzP8KoWUPiI8RZmqtZ6IsTN8wQbR9un4KYmUJ8BkMIDOt6Tv24zpacKeWOaiFdONSMUltZNU+eNB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723737572; c=relaxed/simple;
	bh=+rwOr/Eb6aLx1oQeqhMY8o2Y2is7QVnmjzrnSPwAwdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ia8MGQqxcNgGbY3h8PKxVNnd78MPrq2napbyOd/c9U7LzJHJxuBYWHu2ekGjPf4Al8J5nF6KxHm/hOAwpQtPzDIQyBUTVL5cF56CMWlBM/DTN+hHTBAbMENCuNLy15Eu7M4GY0+yy1FRHQiVu6pPqJvjdhzTNiKKW64aE3yJYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=vlsCWXHJ; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="vlsCWXHJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 38EB06002402;
	Thu, 15 Aug 2024 16:51:27 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id p4XKnI0bjZwz; Thu, 15 Aug 2024 16:51:25 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D06B16002405;
	Thu, 15 Aug 2024 16:51:24 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1723737084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f2g1boM6IStFG0tqVscyGKuPc9jQ/FmFMZf7AExGi4s=;
	b=vlsCWXHJO/yrIzy3Vn6MJdnib0n/4YSzAYZD9Dv1+PCUA8xQjlyaG2sE1mFgQjfPlXOhjz
	v0ObDZl30fyV8YCaIkV13XZgJTlGAu+iytlzVmYdZCSBp/U8dsoAjLUImRUVw2b1bH7qKU
	HubUUa1kewtudoY62pDxAc5jmpQqoTA=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:a82d:2c2b:d13b:a86a])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 7A2733600F3;
	Thu, 15 Aug 2024 16:51:24 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH 0/2] arm64: tegra: add wp-gpio to P2957 board
Date: Thu, 15 Aug 2024 16:50:38 +0100
Message-Id: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4jvmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0NT3ZIKw/jilNzcZF1jQ8NUEwsDo2QLE2MloPqCotS0zAqwWdGxtbU
 AKjWiHlsAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723737084; l=699;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=+rwOr/Eb6aLx1oQeqhMY8o2Y2is7QVnmjzrnSPwAwdw=;
 b=EOWSwcYvnH9afo/ilzzVIELdqmia0RpMszkwhFFkTsj7/Ku4R4A5bgJ3bWBnsEGUjgpHpl92b
 x/ZWfwKLZOtAA9bfokebKQjsMguEpLTdoi8Rbwh3YnM+6y9b5LG00SC
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Define the wp-gpio for the P2597 board.

For this, patch 1 fixes the assignment of the vmmc supply's gpio that
was incorrectly assigned to the wp-gpio of the external slot.

Patch 2 adds the definition of the wp-gpio.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Diogo Ivo (2):
      arm64: tegra: Fix gpio for P2597 vmmc regulator
      arm64: tegra: Add wp-gpio for P2597's external card slot

 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 1fb918967b56df3262ee984175816f0acb310501
change-id: 20240815-tx1_sdmmc-311e4802c843

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

