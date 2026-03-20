Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDAB3921C9;
	Fri, 20 Mar 2026 23:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774049910; cv=none; b=WRGhJDMR9xt9MrBjhI8dIWL28hhQqdD0fRcrkdHQeLe7sxH4V8j0pd1OJBvCGAAaZAPdGQmW18xOe13mew3p2XNRjq1hgEi5AxZgeoWQBXRnIKBL5bWpx01v9qal0rfERac09kLR7MSpYQh0jW4RPAS5eRHMDjxhSSnYRAOqoh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774049910; c=relaxed/simple;
	bh=xfgSGnQ8rEdDKXc1jHdHsYXps3Or07UtVd3U2bkKmIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h5tRMkVB5E6jSPi51quT14X0SGcJY3XsJfaqQr8Q/IWmh1qLGpFeXoPs2m2Qvzmj9MXTql461XAe+ZOkSXH5qGxj32+XgHWiD0v4Zix8Ortz4YCr36OuRt9zhQ+P7z2SdS+Uh2erosgECeLrH3HKR9BCQfHMwlwFgL7OLcdJZwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDVdLzbv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDVdLzbv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAD0C4CEF7;
	Fri, 20 Mar 2026 23:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774049909;
	bh=xfgSGnQ8rEdDKXc1jHdHsYXps3Or07UtVd3U2bkKmIo=;
	h=From:To:Cc:Subject:Date:From;
	b=oDVdLzbv9hZlTjNlRLCKR8DNzUbb5IG3g6zhc7nyntR2SHWnMWY2VXce/3kURvZ5B
	 TVEvf6w9/5iMXyXOP4NuKWzY+/GH5PtyRexNoiLWaKlgr5WDMq1ekUxgXV4FqVZ2Hx
	 7L/SzxZ8kRlSiyCZPwGoeqIaxJmF57jP8aBhqyvHm7lPuZfD2hh7ulQWDVSfJ53FSN
	 Bap7lY1FxHzpoAXtiFNyuBRGIVs4sLO/WE+y8QcswoF5lLx3Pum8k16hDA4VRqsbNl
	 IJ8adTXz35kNwGX4D0+1DxL81aqeM5NTmsr8Qqjxm/KlfzAzJFNeAxAFt+mYpNyqrK
	 7FYXTOhlo302g==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: fuse: Document compatible string for Tegra264 FUSE
Date: Sat, 21 Mar 2026 00:38:21 +0100
Message-ID: <20260320233822.2578569-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This hardware block is mostly the same as the one found on earlier
generations. However, the exact register regions that can be accessed
differ, so a new compatible string is required.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
index 02f0b0462377..bf9923b63852 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
@@ -22,6 +22,7 @@ properties:
           - nvidia,tegra186-efuse
           - nvidia,tegra194-efuse
           - nvidia,tegra234-efuse
+          - nvidia,tegra264-efuse
 
       - items:
           - const: nvidia,tegra132-efuse
-- 
2.52.0

