Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DA02367D2;
	Thu,  7 Aug 2025 21:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754603035; cv=none; b=XwR3c8jtQctoqnAo0xSqlbMiMiZ5+LKE1/v+wkRv0J1kJBxsTarlLvzn6Ee+weJE7QowdgKtrGV/rYKYlTVAjk6lI2dy3/foKeFupeDc+9+a9Rw0Shw7uUFI2759E7M4CszPN/F/5RbNWHfcDJuFCLMKmYuhgOqNjozCtg7KeZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754603035; c=relaxed/simple;
	bh=DaX4/z7CUYrNY4FEsHPilzzpCOERW6g7IHoDkfCmaxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=acRaOzgSgs02KZs3yGAN4Zsm16QsbLw41clKvG1G17ovpBhnfNhscIGx1Pale9Wez9V3j1EUrgLNcDgJEyNrlLPEq9nnJdnNBL3XME1NkxFs+5sM9LdPHwZ+U4ps7eacYYJJ8FpQ3nMgY90tqueqeC6psbaQftx4MWssIth3y7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vObA1twg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vObA1twg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEF2C4CEEB;
	Thu,  7 Aug 2025 21:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754603035;
	bh=DaX4/z7CUYrNY4FEsHPilzzpCOERW6g7IHoDkfCmaxQ=;
	h=From:To:Cc:Subject:Date:From;
	b=vObA1twggsrMcIsdbwBiex5bl+aOqlOkzTXuUsPb61S3rpA1b/VpMc34/d+UtwyWk
	 7LKRr4mYLLWQ5F50uJj252J6Ty03StEECCrnex4rQeBaAXnuC/xfBZi0udFDX6o19i
	 QoTY+kKeVZL+w4JQfs1T2VrvsPySXn4L6OLLqTpvVgbURciZ1tSa+pT6E4kOpoYAH9
	 U89/d6AUkMT2eLtDBEcFYKAponI7aXMHQLjMAN/9TIOUauVOuF8zOJ397EDAWXOW8C
	 Dlf0Ce/nObE4S/e8qJIf+MrjC5JOiwnYnVZnGz+EF88UQQC4AbwsqtMWAlp0RnHIjG
	 y7QMZkhKihIgQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: Drop duplicate nvidia,tegra20-ehci.txt
Date: Thu,  7 Aug 2025 16:43:50 -0500
Message-ID: <20250807214351.4172243-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nvidia,tegra20-ehci binding is already documented in
ci-hdrc-usb2.yaml, so drop the old text binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/usb/nvidia,tegra20-ehci.txt      | 23 -------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
deleted file mode 100644
index f60785f73d3d..000000000000
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Tegra SOC USB controllers
-
-The device node for a USB controller that is part of a Tegra
-SOC is as described in the document "Open Firmware Recommended
-Practice : Universal Serial Bus" with the following modifications
-and additions :
-
-Required properties :
- - compatible : For Tegra20, must contain "nvidia,tegra20-ehci".
-   For Tegra30, must contain "nvidia,tegra30-ehci".  Otherwise, must contain
-   "nvidia,<chip>-ehci" plus at least one of the above, where <chip> is
-   tegra114, tegra124, tegra132, or tegra210.
- - nvidia,phy : phandle of the PHY that the controller is connected to.
- - clocks : Must contain one entry, for the module clock.
-   See ../clocks/clock-bindings.txt for details.
- - resets : Must contain an entry for each entry in reset-names.
-   See ../reset/reset.txt for details.
- - reset-names : Must include the following entries:
-   - usb
-
-Optional properties:
- - nvidia,needs-double-reset : boolean is to be set for some of the Tegra20
-   USB ports, which need reset twice due to hardware issues.
-- 
2.47.2

