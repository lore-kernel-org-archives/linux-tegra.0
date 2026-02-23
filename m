Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EEE27FB18;
	Mon, 23 Feb 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857205; cv=none; b=oxMxFHaUgngD3TfXIrh+UPIRc0XnCjRHfhTSMSemy/o13Lqavncv1QnKRtoJ8hYHZDRaUzE0MmRaAny5sVudEp9uPS0DPf/LQyszQ1qZcXjUeWQvuYyYKaG2OwWq98rbMfSJSfeK8bS9oRoLF4hMMAVGP4D0U9gOeXr9ybSZr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857205; c=relaxed/simple;
	bh=iSWnNZonfTM84lz5fS3ZuYbk/i7UW1bf6Re07XrnBBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+EXeEkJbr2OEhLVfFUL+TCFRrdPV29KRwFmi488ImaLWx/LNENjHwanW1sii4IqkiwnTSNkc3gGCuiE58uDsa6JDqPYTqPnTY9pjUhC6rw/m+7/tcqvkOvOZoicjGZXm6ND6XO7hA+4K2XNHYNbIoqyVNVKoctI+WVhjUJsTMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmGpQ7tc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmGpQ7tc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D64C116C6;
	Mon, 23 Feb 2026 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857204;
	bh=iSWnNZonfTM84lz5fS3ZuYbk/i7UW1bf6Re07XrnBBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mmGpQ7tcMh2h1bzIWxCfto0lJ1k9dISE/T/Uwkh7dgRo57jq8N8DJLJMz4aZxwp1Y
	 wQ5u1eozznEFZvHvBN49Bf0HvJl83net5FJtpO3EznBhr05sTfNvTwc4RzXYwNiH3/
	 ZG0OekNju7ilV6/G+6qVTszZ2eyHa3BZc1F7tQ9yBa2jjOSM9W1Rk9Yd9n9jisahlU
	 gtyWVCIuYf9FOGSLyT06aH//90+o9Ts+ye6NDLm2LHdLwdGJ9wOsfVhxHYMTu/sCkH
	 CuK8WIT963T7m3cbAhCIey/zGzsBPP4wMmYOzXspUs3uXAReh6kC+umv1xAVYCkbmA
	 UPSon8yTppByA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 05/10] dt-bindings: arm: tegra: Add missing compatible strings
Date: Mon, 23 Feb 2026 15:33:00 +0100
Message-ID: <20260223143305.3771383-6-thierry.reding@kernel.org>
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

The Nyan Blaze and Nyan Big, as well as Jetson Nano (P3450-0000), Darcy
(P2894-0050-A08) and Pixel C (Smaug) were never mentioned. Add them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- drop comment about Toradex Apalis typofix, that was already fixed in a
  separate patch

 .../devicetree/bindings/arm/tegra.yaml        | 51 +++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 50a31dba7bec..07e225a4d69b 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -131,6 +131,33 @@ properties:
           - const: toradex,apalis-tk1-v1.2
           - const: toradex,apalis-tk1
           - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-big-rev7
+          - const: google,nyan-big-rev6
+          - const: google,nyan-big-rev5
+          - const: google,nyan-big-rev4
+          - const: google,nyan-big-rev3
+          - const: google,nyan-big-rev2
+          - const: google,nyan-big-rev1
+          - const: google,nyan-big-rev0
+          - const: google,nyan-big
+          - const: google,nyan
+          - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-blaze-rev10
+          - const: google,nyan-blaze-rev9
+          - const: google,nyan-blaze-rev8
+          - const: google,nyan-blaze-rev7
+          - const: google,nyan-blaze-rev6
+          - const: google,nyan-blaze-rev5
+          - const: google,nyan-blaze-rev4
+          - const: google,nyan-blaze-rev3
+          - const: google,nyan-blaze-rev2
+          - const: google,nyan-blaze-rev1
+          - const: google,nyan-blaze-rev0
+          - const: google,nyan-blaze
+          - const: google,nyan
+          - const: nvidia,tegra124
       - items:
           - enum:
               - nvidia,norrin
@@ -184,17 +211,35 @@ properties:
           - const: nvidia,tegra124
       - items:
           - enum:
-              - nvidia,darcy
               - nvidia,p2371-0000
               - nvidia,p2371-2180
               - nvidia,p2571
-              - nvidia,p2894-0050-a08
-              - nvidia,p3450-0000
           - const: nvidia,tegra210
       - items:
           - const: nvidia,p3541-0000
           - const: nvidia,p3450-0000
           - const: nvidia,tegra210
+      - description: NVIDIA Jetson Nano
+        items:
+          - const: nvidia,p3450-0000
+          - const: nvidia,tegra210
+      - description: NVIDIA Shield TV
+        items:
+          - const: nvidia,p2894-0050-a08
+          - const: nvidia,darcy
+          - const: nvidia,tegra210
+      - description: Google Pixel C
+        items:
+          - const: google,smaug-rev8
+          - const: google,smaug-rev7
+          - const: google,smaug-rev6
+          - const: google,smaug-rev5
+          - const: google,smaug-rev4
+          - const: google,smaug-rev3
+          - const: google,smaug-rev2
+          - const: google,smaug-rev1
+          - const: google,smaug
+          - const: nvidia,tegra210
       - description: Jetson TX2 Developer Kit
         items:
           - const: nvidia,p2771-0000
-- 
2.52.0

