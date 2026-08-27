Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7D4483802;
	Thu, 27 Aug 2026 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842484; cv=none; b=lSxDnbctxb3yhqvSYylnqqjYfn50V8DQWKQI4MvuT6EYdrleacwM4dDref99dKBBYDU7u5BNdcNdaU2j0kd5Bqq9UlNUfnbURdwHCLt5c1e2roU2eUFQLmb0a7220cFRVnzazJd9dnY9zjrIMJhP5ciIF3a7y6Qo8uQMj16eOhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842484; c=relaxed/simple;
	bh=G63TH+jenKq9CRzuy0d7OB3ZgIqHK+kY9EYYADOADOo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MXSsy0NXuaMRLDcpZBtFQlqnTIOFwUpE8R/10wJ9w6M5NUlfeMzrj7D5BlTzW/3CbQjOSKDku6QQMHyBlO90jczrL9ktqGaOLHE396aw0fy08SWhpL7jvIHui0Q42ppsz2ZTL3r7j2TwfVBF8H3fu68JqUgujJeAVFgaXhChinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HooiMZAT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HooiMZAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E611F000E9;
	Thu, 27 Aug 2026 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787842475;
	bh=oBtnrZz9Wo+EtBTQxkVDPZizsIqsBSgf5yJTcxel/78=;
	h=From:Subject:Date:To:Cc;
	b=HooiMZATcz18jtzoAOspcG+fjXIsl2yMZsEvlxQVVe13o5Hk1t44fYqCXFVbH1JlO
	 2twPAKQbQDmXCeGMBW8yjv8JlrO6HoXNFp7AbmDrb4Xz1KyYMZhAlJ+G2zwtwGghuK
	 FiV/lCGlA7L05wU3FmejmILQ+RcFFnBa6+g7J5fqo0saQpWroV3edKLzO5Qv21jFUc
	 MTc12r3GhhwXVeiGW5px6Fol63cq3ZlAPN6XtZ+n0B1X2Ko+dm2TGB7naS0ph+a5po
	 W9gVZVLxB/YTK1F+cyLQP1rap7Xe9pf3Z6lv1ZrmBsu5Zs6ykY3oK8CErZJJrzYZn+
	 PB3490J0csMSg==
From: Thierry Reding <thierry.reding@kernel.org>
Subject: [PATCH 0/2] arm64: tegra: Add gpio-keys for Jetson AGX Thor DevKit
Date: Thu, 27 Aug 2026 16:54:17 +0200
Message-Id: <20260827-tegra264-gpio-keys-v1-0-89518c5fb29f@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrDugwWrTqxQXGn/jtKCSUWkR7
 96oy2/x3kaKIFB6JhsFrKIyDhHZLSHX14MHSxtNJjVF+shKnuFDbYqc/SQjf/BTtve8tGhaazt
 HMZwCOvme01d1WZfmDTcfJ9r3P5+32xh2AAAA
X-Change-ID: 20260817-tegra264-gpio-keys-95479ebd99fc
To: Thierry Reding <thierry.reding@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=975; i=treding@nvidia.com;
 h=from:subject:message-id; bh=G63TH+jenKq9CRzuy0d7OB3ZgIqHK+kY9EYYADOADOo=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqkE+lB3chB/mTsVQiJqANwBPR6k2alrLGV70qc
 Rmx9GWyKvSJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapBPpQAKCRDdI6zXfz6z
 odCVD/0T44jNJpHhoXewhvKWd5U1WyqbnhOh9CjSQCpBSimjxGgbIKZTjxZU+eR86fRI4AtQ4yC
 z0jAyEw8JLeoC6dmmJtgJjPJsDBb6GI+oBjwLq1PAQAryN384DdlsJf8Ecd8Bvz+lePbb7XQCUE
 zdMFZKaVLvtVeeAaDkskfyYHfFx77+dZRlNZoihZUrlhb912xnioB1SeyEfzRnbn7lZ/QJDpoW1
 0emLEUBjvXnXmkho9PVytcAFW+kvPb77D7EmN4Pm/AOdphXoBdDe1Q1rPZEtcS/R7U1FOaNwwMg
 u9KnlcJeXmkdTbFRTce417jV6ou69I3QTpNvv9Ef8DTR5sjFb6aDUXnEr+2EiY1DVtRk6vX8MB2
 uPftzDje177eH5egLq5o9DXhsI+ICgBO0vx6KVFfwf11M6qZ+jf57m5FRGzWXB8pKHTueWKLtOg
 kLam8+n4mFeNqvCB8lsT8o5y6k6KtLdKOTPfKF7Pidhfnyj2WSZmLxavJM39yEZO8qKJIKVEVME
 cI/SO/3wPQXQ9yykrSwqM8UzwxatrQWeqB9xYe0lJQ5R8XzJj3CWeNmKesR8YCIzGCpFxCD3gnS
 i3KqWy7LlAPcz5cn9oLTlq+8bULWO1ir0pw+kET2H8zlyWO3W2GJDtusZ1lwef5vWqQNAoQEWyZ
 jZfdivtTPUBS00w==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

This set of patches cleans up some existing gpio-keys DT nodes and adds
support for the power and force-recovery keys on Jetson AGX Thor.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Thierry Reding (2):
      arm64: tegra: Use consistent key code for force-recovery button
      arm64: tegra: Enable GPIO keys on Jetson AGX Thor

 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  2 +-
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi |  9 +--------
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  |  9 +--------
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi |  2 +-
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 23 ++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |  1 +
 6 files changed, 28 insertions(+), 18 deletions(-)
---
base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
change-id: 20260817-tegra264-gpio-keys-95479ebd99fc

Best regards,
--  
Thierry Reding <treding@nvidia.com>

