Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F39F2D5C8B;
	Thu, 24 Jul 2025 13:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753362746; cv=none; b=Dc8HebQUHp6Fo/YK2DvkPiilRKVCpcKO5/Ik3i1n0mosBBBOfhZSO27EsVOoNOqmMxDu07teA1btv+N2Fdb9y1A4gnuT8RFkwvt7mtIOenh9yrhP83MFUhJZV1Mcc9LpElYLhVECTwb35TUv/UmwrdfBhN9HdJNWtHq5kmUx4iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753362746; c=relaxed/simple;
	bh=XyEX4AdH2LzV6ZRqRDM97PWYHb67uk81jUAD0OEb81Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h2Iyp9fhwHE9PB4ZSTnH744i0l99RYPkP1YIoRATgXj81YVEQlLZbQ1g7dTjC01m0+Nvcy+DH/bC1LBBlUYiM8PoneBW8n1CQm+dXQ+rVgdtOjblhsEgLpiKf0BkfjRoVlsE6ETtvSvwulJzSaW2eXOyVO4EvIKDM6xe4WGbPvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9nmd7bJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9nmd7bJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199CCC4CEED;
	Thu, 24 Jul 2025 13:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753362746;
	bh=XyEX4AdH2LzV6ZRqRDM97PWYHb67uk81jUAD0OEb81Q=;
	h=From:To:Cc:Subject:Date:From;
	b=g9nmd7bJh64TcfqL2HbFDyTvrP6puZXq+UQfXCN8hQ2jXi1XKtB/dhrthkPieL0fW
	 N3EjLWnwBBs8vVe94v4BM9ZA1oQgi5rj/GrTqJXw831iebZk6lxdjVvRUOjtPDiyeL
	 QzfW3miQsu3UXZ5IFeEvnBiqUQW2qX2Z3wWU7RiuZJc7b0n7j5QSV59xs/c1oMIC3Q
	 bZRdunV3TAzE/l23oTgJ//EkrZ+e/EWDQdmu6+zLtuptwngUkfaheZhinCyCAfcmFu
	 2SpYmnMHh8/vlOaJUYkbsoqg43Qz3foa0G+xNTF8fvayoiXpx/1//Dn2gDn/8enTdG
	 Zs/xZSmxVfxww==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uevkD-000000000aF-2Ba3;
	Thu, 24 Jul 2025 15:12:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: JC Kuo <jckuo@nvidia.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] phy: fix device leaks at unbind
Date: Thu, 24 Jul 2025 15:12:03 +0200
Message-ID: <20250724131206.2211-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes device leaks due to failure to drop the reference
taken by of_find_device_by_node().

Johan

Johan Hovold (3):
  phy: tegra: xusb: fix device and OF node leak at probe
  phy: ti: omap-usb2: fix device leak at unbind
  phy: ti-pipe3: fix device leak at unbind

 drivers/phy/tegra/xusb-tegra210.c |  6 +++++-
 drivers/phy/ti/phy-omap-usb2.c    | 13 +++++++++++++
 drivers/phy/ti/phy-ti-pipe3.c     | 13 +++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.49.1

