Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ACD635
	for <linux-tegra@vger.kernel.org>; Sun,  1 Dec 2024 00:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.137.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733013707; cv=none; b=uZQsqDZDBKhHBYPWsQMUK+y/N4dxw94NT1fuF7QDp9Pn9g2zIi59GN3kdB4SAL9hTNyGpoe5Y30Pecnj9sdOnqxHxUFWYTbUQ7VBpQiLgtpcUlyvQm65FCYGKxnFaD9vLlRztLcB6TIkSurh9q6eV9fJXR1TcIGlghfzY8E3CN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733013707; c=relaxed/simple;
	bh=q5q3SWUiwJH9f8mWAdbdlpWhLqZ7tUpAk8fbDIxbDrc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QfJUSBRBo1eNpGBFWuOaZMKN6irPIcAn8RuIiWWMHLjSy71R4utQQQfTzZVQ92SEKlDOvziYF+kwep6jDQmocdFl+Lwl2PmaynsISLPvmAqB945Ek9qzQS0DoLWGYKCJL1FQ74bBgZKkQxGeYndOTSkKoXnQVr8AoPCUW9DAgJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metafoo.de; spf=pass smtp.mailfrom=metafoo.de; dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de header.b=FcOTDjbT; arc=none smtp.client-ip=78.46.137.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metafoo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metafoo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de header.b="FcOTDjbT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=X9062Dfv8TGUoF2iBJOb2+MW2me1B5nX84/ndMJ30qc=; b=FcOTDjbTmUP/2ov3omHD9ntSwL
	WQkSpjduPCJmpMNpAZahuUNbMW/Jc0DHQnomr1Vpc43nysiKH510fPKNRYZfOYGTurM0owztl2285
	+iPXUbpikz1lapMbd9++Dg8ZVsPgyAf1SoK1A4crG0Jo+JjqxL5J5mkWmNfEKJ0+PPqNo5mJUTnpq
	mag2M8Sffm54jZAJgPtuflcLaIw45XwtIQhWzEdy1y1jvVOhMVdKw7Zifgzy0hBDyM57pWGSMUqcl
	TEkrF/3DZD0DmiabU1jx7iwvSZxG9ZOJS5SbFijuenPN/wuydISP9jcnUq+x5MV/hayrag6Dg12WG
	bQoEfw7g==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <lars@metafoo.de>)
	id 1tHXmV-0005ZS-2j;
	Sun, 01 Dec 2024 01:25:47 +0100
Received: from [136.25.87.181] (helo=lars-desktop.lan)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lars@metafoo.de>)
	id 1tHXmU-000B26-1a;
	Sun, 01 Dec 2024 01:25:47 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] phy: tegra194: p2u: Allow to enable driver on Tegra234
Date: Sat, 30 Nov 2024 16:25:19 -0800
Message-Id: <20241201002519.3468-1-lars@metafoo.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27473/Sat Nov 30 10:41:04 2024)

Commit de6026682569 ("phy: tegra: Add PCIe PIPE2UPHY support for Tegra234")
add support for Tegra234 to the tegra194-p2u PHY driver. But the driver is
currently not selectable when Tegra234 SoC support is enabled.

Update the Kconfig entry to allow the driver to be built when support the
Tegra234 SoC is enabled.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/phy/tegra/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index c591c958f1ebc..f30cfb42b2103 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -13,7 +13,8 @@ config PHY_TEGRA_XUSB
 
 config PHY_TEGRA194_P2U
 	tristate "NVIDIA Tegra194 PIPE2UPHY PHY driver"
-	depends on ARCH_TEGRA_194_SOC || COMPILE_TEST
+	depends on ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || COMPILE_TEST
 	select GENERIC_PHY
 	help
-	  Enable this to support the P2U (PIPE to UPHY) that is part of Tegra 19x SOCs.
+	  Enable this to support the P2U (PIPE to UPHY) that is part of Tegra 19x
+	  and 234 SOCs.
-- 
2.39.5

