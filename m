Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5590746C4C6
	for <linux-tegra@vger.kernel.org>; Fri,  2 Oct 2026 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932160; cv=none; b=Z6ff0M8e9e5OYYHCtEJCWcfyLrwM6n1ado0wQAUwcpoDL4Ucl8nsi4SO8SNcwNjvyjLrAh/IIVi6ehVSl9KpcTzrDzGpQwhuqL4aqDqG3nTh1/g+L/jXuv6n3/PC7hd1UhVRiuwkSm7XQOD1zIYXIlwJ4b3/VoUVAJ843bD7jgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932160; c=relaxed/simple;
	bh=UomcrW3zIvxctzOXTB1TrjNyHVCGwxkmvFr4hqVMWOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fsSq8bBgIb6mHbeQK9KSlbCwoHjziwxo8iQsNCcyv5FPGs+17QxsC93I3KdqO2tLEnbpvHjoflYvMwippDXVfjQ3ev5JLj+gfUGhOvmPD1KM1A5oLuFO4t4AtZRj4cKj2dA4MDAGyvSPMxOPd/TknCYSUw++RNfrRgnyacNza6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hcq07Oe1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hcq07Oe1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DBF1F000FF;
	Fri,  2 Oct 2026 09:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932158;
	bh=PXsaD36Mhp2xdabWJgYcrfy29+ICcaNiixvphOY3GMY=;
	h=From:To:Cc:Subject:Date;
	b=Hcq07Oe1ma2HjAffxWEwVcSkqOWKJozQiKprnBhdxHWlGn5XhlfrOYLtNxx76e02d
	 lLd0b0OUXVjWCXIQvAH6JrD98gEg/OdWPhkStYcbm/eqkPxibZWuuDDlkdIbSOVrBM
	 ouePwpRaTzE82NljQBvD8J/1KEETCG1he7vi2K6ibHRb6QjQt78EmSKGQX7HN69FgW
	 eIZqmTnI0HPA9IoTlA9PE6Ez3Tshy5WuhA8cKnCvTRwQo5cYlFtdyDJRN7b6icN9II
	 p0RUEqQShGJGMeQ9h5KJ4/oBmqPINYvMY1kVm6jfnt+ea1SgGESasSrNDM9/Th6DBm
	 DbTnCdlPIBE5Q==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: tegra: Fix Trun -> Turn typo
Date: Fri,  2 Oct 2026 11:09:12 +0200
Message-ID: <20261002090912.2200487-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Found this while experimenting with codespell, so might as well fix it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/mach-tegra/sleep.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/sleep.S b/arch/arm/mach-tegra/sleep.S
index 945f2c1474f7..751cc71dce7f 100644
--- a/arch/arm/mach-tegra/sleep.S
+++ b/arch/arm/mach-tegra/sleep.S
@@ -48,7 +48,7 @@ ENTRY(tegra_disable_clean_inv_dcache)
 	blne	v7_flush_dcache_louis
 	bleq	v7_flush_dcache_all
 
-	/* Trun off coherency */
+	/* Turn off coherency */
 	exit_smp r4, r5
 
 	ldmfd	sp!, {r0, r4-r5, r7, r9-r11, pc}
-- 
2.55.0

