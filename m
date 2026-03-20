Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465373A3835;
	Fri, 20 Mar 2026 23:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050059; cv=none; b=SeKXguXIaFAzV++/9sn6Z2Dk/tcc9MgQ/nQlEOVOtACDm6RVXWMk1lvXKspk0WW5trZv1BnICKyiapmY8MyLu+kDUwZQxMwz1AV9+Lg+eX89EjAFqtlRJ+oLKKQWsOiy/arp/64HBp8RVziQGsmzuPOPKRkPY9zxEqowS3jyme0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050059; c=relaxed/simple;
	bh=b1eUR488/blj8SKbKDDBA311fYHIz/gMv3VkZpIJS68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jKZXH/yVH//ZF1JyI78J+RP2BqPHk51ypR0+0wzSOsx0OUUceOTxdVobL11IcZZHQ2tc9f10zFocO4xduIy4bVL8JKPBx/i/OCN5c8Vae1hsq8LTFKOxHvm1Sy7f3pWyeVrU6TwOT0KOts6Rl3ooMu1ykGPPTlNHDfp01uCSkgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqwWb/WF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqwWb/WF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6551CC4CEF7;
	Fri, 20 Mar 2026 23:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774050058;
	bh=b1eUR488/blj8SKbKDDBA311fYHIz/gMv3VkZpIJS68=;
	h=From:To:Cc:Subject:Date:From;
	b=EqwWb/WFM+a4JqdRMVoyZBBawRUuY4ycVyl5J5vxIC0+wITIEzu/tl+DnuHdwXoT0
	 LlcRPlUwSQ/2tLQ9TICSxeXuRBJeYZlE4VLT9UWfraprkhwhlYwwENubiE2E/+hfcf
	 yF6sCXjT+VWsUx8s34neOp0VvtqIW6bDcmeDBxBEevpEGc1dT3JTjY8K/7IZuu6d7V
	 9Psd06ldfYWLZ/AVSQk3aKoWtPNzjLpcB4bZtHYj2vPfks//2Xnvhi6JgshbUJ8UY3
	 EZTqZTyBGEVJbdwOSNSnLCX7elVUMY/L8JNnE1+Egy3+NZzNru8dqpwaB1XgWOGhQA
	 SMPKF9F5/Y3Vw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264 controllers
Date: Sat, 21 Mar 2026 00:40:55 +0100
Message-ID: <20260320234056.2579010-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The PWM controller found on Tegra264 is largely compatible with the one
on prior generations, but it comes with some extra features, hence a new
compatible string is needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml b/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml
index 41cea4979132..15706d2a808d 100644
--- a/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml
@@ -16,6 +16,8 @@ properties:
       - enum:
           - nvidia,tegra20-pwm
           - nvidia,tegra186-pwm
+          - nvidia,tegra194-pwm
+          - nvidia,tegra264-pwm
 
       - items:
           - enum:
-- 
2.52.0

