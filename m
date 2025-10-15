Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C32D24A9;
	Wed, 15 Oct 2025 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543554; cv=none; b=NeRXwA/q4fmtVaoOoDYQ8VWTgV7vBUJx1id8zjx3+ZQ0XPlxS/KhmZ0ZorpSyHxVwcLUxBrcYIVyIwJ0PlrCGOAK5fR3Yk4eQUCl7Jy18AtDHub/BATgyuReAS9Er1+BTit91YUWuGMDDr6k/qpeAcEW4oxCEqT0GNbF9UgCHdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543554; c=relaxed/simple;
	bh=5GGhoyfGd7C2d9b5NUJVQ1myqkk94R5VJe5ZXBVXC6s=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=n7m74yvDYo++4ZlOe4cUYvXD/NPKlmrJtsBA7WIGI9Hd4Olmuu+r5uJqPjCYE7DrNm9uYJJdC/Sy8mWjAa7SsI8VitG9KCogFHSs1Kn9Te83n0UTGqvB2j3LvHzYrf8m2t2QvwJx0QkMxffGHhuUBghrcWrVG2mwe2Bzp+Jwdt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=QTU+nErw; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="QTU+nErw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E4wJYDIfmOLBHQSkEtkRaWLUCWJYMEH7YngSIcElO/E=; b=QTU+nErwnxECo5Lf1ulzTqueWU
	UMYy5DDKguxUOe2lRGVzg107MU6dXIg2VA3nP4Ufw3xYbGub/WVwEfQH/NoyQLYwySAxCQDzM7OAw
	GRdC4pPyGUKdtTKAYl/YC6BSQOWgnyNPZjqyvsrUuX9otYS1b6ufgZaF4VSOlRT6q07mMl96FhaGo
	aiHOZ27sS5AOEJSCCgP6Nkb3R2rXY+c6Vqb6rlJGHDMYcBec1Ffmz2IId+4ZyDinGmau3T1OfMPNQ
	2d+2F0l/dkbdWV9o7CuSySZgwd/eycdJxW0oV+DFhYkDdgc9t1BoJKOsw0zin5nAOcrTFhmmNwSpa
	ey7IpR4A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59786 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v93nf-0000000057r-0noW;
	Wed, 15 Oct 2025 16:52:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v93ne-0000000AmQk-1nHh;
	Wed, 15 Oct 2025 16:52:26 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Aaron Kling <webgeek1234@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-tegra@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] arm64: tegra: mark Jetson Xavier NX's PHY as a
 wakeup source
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v93ne-0000000AmQk-1nHh@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 15 Oct 2025 16:52:26 +0100

Mark the RTL8211F PHY as a wakeup source for the Jetson Xavier NX.
This allows the reworked RTL8211F driver to know that the PHY is
wired to wakeup capable hardware, and thus to expose WoL capabilities.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
I thought I had already sent this patch out, and I'm sure someone said
that they had queued it for the merge window, but it wasn't merged. As
I can't find it in any of my mailboxes, this must be a false memory.
I'm way too overloaded to properly track anything right now.

It's not a big problem. WoL will go from not being functional in
previous kernels (and actually causing problems with interrupt
delivery) to not being supported (ethtool will report so) in v6.18
without this patch. Options are: merge it into 6.18-rc and have
functional WoL for 6.18, or wait until the next merge window and
have WoL working in approx. four months time when 6.19 is released.

Note: the bindings update was already merged in commit a510980e740c
("dt-bindings: net: realtek,rtl82xx: document wakeup-source property")
during the recent merge window.

 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
index a410fc335fa3..c0f17f8189fa 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -42,6 +42,7 @@ phy: ethernet-phy@0 {
 					interrupt-parent = <&gpio>;
 					interrupts = <TEGRA194_MAIN_GPIO(G, 4) IRQ_TYPE_LEVEL_LOW>;
 					#phy-cells = <0>;
+					wakeup-source;
 				};
 			};
 		};
-- 
2.47.3

