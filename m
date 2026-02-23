Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1434A27FB18;
	Mon, 23 Feb 2026 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857218; cv=none; b=K0AHORvMPb28AJwCKsxZcUEBdjf8vPPfPoufNCzpERlGw8k7NgWUfH9YkZXbzzrtz34SKbVYMWLNT6yKl35M0G+ugJ6+WlQfLdIZ9tvLfM4ae8VcJUs1XkOBWrCOcyEprDv/gZzEss4EfujswNadx3yzgWJDqplnF2XXh/Rx/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857218; c=relaxed/simple;
	bh=TXE8D9RPrQ8KKV/nSzXY6h9Zw5x8EvO0QKjMfDIdkkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1x10HAROApUaQmXJbgpejzS9K7LLk2mxG+/pNQjjZG04W4ZnkJbeBXsdgpoMS1YZ86Mq31rP+fqypYHgMCzIpLNrGNcNJFxpL+heZJkmxLUZqjORl/VROgq7Bjvm/M+hn9v1ZGS9r+Yj1auE8rgtTJPTpFSQ4RRWpH+a/Jtkyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTay4Rpz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTay4Rpz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94511C116C6;
	Mon, 23 Feb 2026 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857218;
	bh=TXE8D9RPrQ8KKV/nSzXY6h9Zw5x8EvO0QKjMfDIdkkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rTay4Rpzd3KI6GrUBQCfj1SyrYMMYVC6ICpDMoG5Q1tXBa+S3JhBWF/E7fI7wnxJo
	 AS5LLDJtlzcxbj0ZQTveItbJgW7sTmZfSlhObNSrFFAe8jHdx5xZOFNlbWjZqgW5qb
	 5Jsre4eHCJao7i8FDi2Uib/CUD3lW10PzNS6n8euRabVRPjCDvovdCtmfPi6DZh4qD
	 HRVQ16qD4SsPqMpgTKcwQBfEe5V+h5vcoj6NH8I/N2F/WPbznU2s4JzEhht7j1tR80
	 WivQ0Q1hRzxR3/bCxCEbzWsxqLMIShMOxVMMhMJuupykVCY6/MyWc7UeOXUReFOAce
	 jvOZmwckiBerg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 10/10] arm64: tegra: Drop redundant clock and reset names for TSEC
Date: Mon, 23 Feb 2026 15:33:05 +0100
Message-ID: <20260223143305.3771383-11-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223143305.3771383-1-thierry.reding@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The DT bindings don't allow the clock and reset names to be specified
since there is only a single entry for each.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 137aa8375257..5f5e5370d709 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -309,9 +309,7 @@ tsec@54500000 {
 			reg = <0x0 0x54500000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA210_CLK_TSECB>;
-			clock-names = "tsec";
 			resets = <&tegra_car 206>;
-			reset-names = "tsec";
 			status = "disabled";
 		};
 
-- 
2.52.0

