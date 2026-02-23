Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D2222585;
	Mon, 23 Feb 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857207; cv=none; b=MVoFM2KGfC60bpRNcZBWifZD36JWrKPsgmSUr5GhkEy3/q7evvmfM8Kyx6vlzmHBRRvroLcpM05+WZiD8r5kCoPPYn1E2oYyYkZTM6b1VY/WDyY3RqtO0mCwpGCWbsj7W4qxDKNVlJnQR5G6fafpy+TWmiPMSrKxK+JWEQ1OLlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857207; c=relaxed/simple;
	bh=DYP+svTxzjqzMUJliWZ3Xn80kpHLYq8kjDQCxTDzEBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oP2eupSNYacAedkLiZw1COjTYY5zvDnAUOXp5d+cOul6KlRXSaKqRoyu/11o38udhI1TbJHxFxaxGGVXpwtWYFx3cUP17E30mveeyfgCGeAYgQfRD2EgNckiTIlwZ92KGMP8sI5wME4i4R5QsqJ7PW9fbskIxzXwzPR75zqnhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzG5zw5Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzG5zw5Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C6BC116D0;
	Mon, 23 Feb 2026 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857207;
	bh=DYP+svTxzjqzMUJliWZ3Xn80kpHLYq8kjDQCxTDzEBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzG5zw5ZGKZVlnNATOGh14fM0ppFuh5xlgiAnB82TcV2VdDkHcZzWdu9XXraEGKAP
	 sE/3GMkijtifecPQY+Lx6oY4wCpbEXjhKnS/RIQlxgkKhvvK8LU9QSAHnyHYCYbI0T
	 5AFvxul6vi2NzLVacNDYXC5DFttK1xUEvj9Jh/NslGcsB5dY5bedn0EcNDDBtHpys4
	 iQ7hLpRbpf3/iDGXd/CM2KunaWeZxoKCuxo6wBiaYdK0VW0Tz7OdUZb6KynptdOPUH
	 oaaUbmJV36yv/vtsYS6ZHhZWzevqZDw5eXY+lw4ny6o0fyLzrqOLTOvRy97wO/teCb
	 AxlovCEU0KXgQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 06/10] dt-bindings: phy: tegra: Document Tegra210 USB PHY
Date: Mon, 23 Feb 2026 15:33:01 +0100
Message-ID: <20260223143305.3771383-7-thierry.reding@kernel.org>
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

Add a compatible string for the USB PHY found on Tegra210 SoCs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml
index d61585c96e31..a37e8322dc50 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - nvidia,tegra210-usb-phy
               - nvidia,tegra124-usb-phy
               - nvidia,tegra114-usb-phy
           - enum:
-- 
2.52.0

