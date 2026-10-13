Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7B3F23D0;
	Tue, 13 Oct 2026 14:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903134; cv=none; b=cFZaPAiC7STeW7F7glLxrmghLr7feyjtAALMHXmFgEjF7ELfhC5mDuxv0lYoQscZlRhNqmkdlI9y4Mb/cYW3/V7K0wV4OkzgFOVtX1SidEAmaN7SuhLiVFd7RdP+N2I5AlFLYgsL0DkRA10RlvNMBR9SiLNYQuBOW30Q3hEUQQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903134; c=relaxed/simple;
	bh=lyZ9X0ZAqUaFCJgH1uhwmIHCKS1vJlYxf3w1kWjDvks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dL//rCzUQ8TTRqZGu7mQOuIgBvTmVtRLMCtcei1wsCD/NpK7y1To28ooNMe/ATVriAuPmFGrwv4Ds3Hf53fFp4eqXhXzersqhroH5U5FWk/5zHO1bQZjhBLRf4yEies6Ynt4xjkAtLxYludemfn6f9+8G7AW3fZ1Nzi/jZpc45E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maz/NfDL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maz/NfDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276071F000FF;
	Tue, 13 Oct 2026 14:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791903133;
	bh=kYokskwFXqmZbxKXA0hYcmteDiHu4dzWazXznQi6jas=;
	h=From:To:Cc:Subject:Date;
	b=maz/NfDLUqWVk46kbQMUYi+byb8hig2awtRci3j40GQMdgpsPuS0sCFthj5FFvq1n
	 WBd+9CZfIpchLU1v2GvSoK418B55YxWRRVnYYJVBYdjT5KEAW3+IM0AchnSIuo3yaA
	 w0hymCfISUgZUKjEHm1Xc2oh30ec4DIi890rilGsmcqHM9p3/NuNe88UKXFgWlRObE
	 Gm8+In9FCU9xPAZlJ6EiJ1gnKqqt3neOvnQsDDduqrMA3v3KWZqcRFdNjyd9dsAqLJ
	 WgI1UXnTeXyC6Cq5jiqiQ7F6914ahbIIdPSttuKaJwiGHVjlFGljGu9DaRq5Ne5Q3v
	 as4m/OI4y0Slw==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock after the reference clock
Date: Tue, 13 Oct 2026 10:52:08 -0400
Message-ID: <20261013145210.103565-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GM20B needs both its reference clock and the fuse clock while it is
powered, so allow "fuse" as a fourth clock after "ref".

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
index 4d856a8b674c..ecbc20e6adec 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
@@ -44,6 +44,7 @@ properties:
       - description: GPU clock
       - description: Power clock
       - description: Reference or fuse clock
+      - description: Fuse clock
 
   clock-names:
     minItems: 2
@@ -51,6 +52,7 @@ properties:
       - const: gpu
       - const: pwr
       - enum: [ ref, fuse ]
+      - const: fuse
 
   resets:
     maxItems: 1
-- 
2.43.0

