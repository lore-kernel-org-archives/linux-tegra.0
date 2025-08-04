Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EE1220F24;
	Mon,  4 Aug 2025 03:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754277277; cv=none; b=NkQGm9TbaQtttys6lej4GgNfm2C2VldJI0cgRgyt1eMYFw/j2d8dHzOMHw1m8BlPDsObtCug8VWbKvOGrmQ6R1iTLgLFIKKhJVutWBIl060/BDdu34VpFpuwjhs+LDbTAxk8TAdnhXTLiTAxav3yVHqSPnh8VUkpxeksy1YZl2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754277277; c=relaxed/simple;
	bh=5qCGnzZe9zvgxj9r6imoUz73U1Eb0b2h8O09bbJ/Y2g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cJ3qBDVfAI9iI9wZmbWX/Ta+dPJzQdqP29qE95vpYVDTIalxfIhel06hB1GkLvR1SCXIBRSTabJwvEcNSQeUR0W08MxRLZDZtUwBAdaD87D8KKmfA5+15zRSWlmdtYjE3D8QBFwf9T6C5FqVEkA06zh9oac6gwMzQu/ZZEJLRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZQLOQY/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZQLOQY/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88C90C4CEEB;
	Mon,  4 Aug 2025 03:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754277276;
	bh=5qCGnzZe9zvgxj9r6imoUz73U1Eb0b2h8O09bbJ/Y2g=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DZQLOQY/0YJLu6deNLtqlTkEtvjgoJ7GPvRsEsFyYtXJpyaPySpZqcNwCKraaoAmf
	 SfuwbnuJ+roPVFfn6Y4uKEEYB6/BPjfYUqS9SRUehlOz4UmmqMwzURwE8cFi0+BctD
	 M+T5SoO1VDj5hX+6OP5Z/ehLKQenBWcS2kk8Ry82GljW1kZ5P90xk2FX+iMbfG8Q/r
	 yLmAMLim7rFhBfSxcGbcsZzj1AW54Mbt0+1t+PRJXmtab5Gc6bCP0q/Dg3q3Dd1uTW
	 RjCoancdu0Sl7FW23YPwWDYZf9qhTqjX4anBidzL5xxmxcjXMzytavE4jJ/qeMOCXc
	 SQWagWs/pNzwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D0BC87FDA;
	Mon,  4 Aug 2025 03:14:36 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: tegra: Add reserved-memory node to L4T
 Tegra210 devices
Date: Sun, 03 Aug 2025 22:14:29 -0500
Message-Id: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUlkGgC/3XMQQ6CMBCF4auQWTtm2lJUVt7DsKi1hUmEkhaJh
 vTuVvYu/5e8b4PkIrsEbbVBdCsnDlMJeajADmbqHfKjNEiSmrRscFa1JhyXhPdXjyTVpTZeCU8
 GymeOzvN7925d6YHTEuJn51fxW/9Jq0CBp7MmaoTyJO21Hw0/jzaM0OWcv/HWwteqAAAA
X-Change-ID: 20250526-p3450-mts-bug-02394af31f0a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754277275; l=658;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=5qCGnzZe9zvgxj9r6imoUz73U1Eb0b2h8O09bbJ/Y2g=;
 b=pSOcHwoDz3dMPNGO3EBVF8hNPXY0FTEmFRMdwmLLuZK4t52CGSGCYMO5ek9RFNStpLCjWHZnx
 RTHKqJ2rGZcDj4CDggmQLTfHHBSpSfQp0c/rv26FJhxcFVKzHo6wF5j
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v2:
- Add patch for P2180
- Link to v1: https://lore.kernel.org/r/20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com

---
Aaron Kling (2):
      arm64: tegra: Add reserved-memory node for P3450
      arm64: tegra: Add reserved-memory node for P2180

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 6 ++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 6 ++++++
 2 files changed, 12 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250526-p3450-mts-bug-02394af31f0a

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


