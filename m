Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F30E2620FC;
	Thu, 22 May 2025 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930287; cv=none; b=uojlEEtJvrZ70Z+Y1fh9L6kUud0Cyn4xe4CU+/NzeDRChGVBv/gfK19mkAISp+RvxAV0QHA+q2FkRTuXI4D6kTxUnS5DTr3DRPbdSYN99BuOyBqVvzeAsb9HKPhhN2r1Ly8Tmj0dP73d1L6QlR7V6QIqMHEGPLjRSwGFn6y9E8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930287; c=relaxed/simple;
	bh=JEfH3x55bskJhV3y2mrEzMyulGhfZQeDOuhnI2p0a6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PnyNvDtFZFPMGOhXQ8wHk2/VdFaJdzabdor9OxZpIEjzS4vfV1tkcubtJp9cmWHIJJn4FnGuQetQcg9NBE8uhkIRhIWCFh+GnJBEfanhTgOg0HDbCDMXRXIzV8m8RlGOGV/SJ+U7hXh+7A8k7g1R3TamwUeJ7t71v2EQ0F40fXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsqCeWt4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsqCeWt4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D626C4CEE4;
	Thu, 22 May 2025 16:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747930287;
	bh=JEfH3x55bskJhV3y2mrEzMyulGhfZQeDOuhnI2p0a6g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=TsqCeWt4Z5jpzoA9XrSdgkEWWeJChz14BXRa4W3a+NfpsL+dco2AmMLp8o7dbZJN9
	 uijjEp32I9PMHFDXcBTwoP2YLDoamxf6Pddcg1vxRz+T87xTo0dcR5DjNqTNds9+0W
	 sDY37BVcpkOFv70jjtF5/7Y/y8DvKu5kj96tawRkkDGrk8E5vx4rJLzR5srx1viZ1x
	 6iOmyZ0EUlqu3p7eWopo+i8T90ZSaCRqrqAkZnCkqhj9DmCn5eXbJ3bQhBqSNbvf6x
	 F6KMgsr6T6pbUncEMum9Gdb/o4IR9PEiepKZpxKbnkyChTpzLzOsghDgJjwWCIpIsN
	 Oa3Fpnai6MU3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222F6C54E65;
	Thu, 22 May 2025 16:11:27 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 22 May 2025 11:11:24 -0500
Subject: [PATCH] ARM: tegra: Use io memcpy to write to iram
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKtML2gC/x2MQQqAMAzAviI9W9CKIn5FPNTZbUWcsokI4t8dH
 kNIHkgSVRIMxQNRLk26hwx1WYDxHJygLpmBKmqrlgg3Nh5PcZFx5cQBLc9Llo2lroecHVGs3v9
 ynN73A1jjFBdiAAAA
X-Change-ID: 20250522-mach-tegra-kasan-fabd0253f268
To: Russell King <linux@armlinux.org.uk>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747930286; l=1106;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=hU2Yl0x61OcdReq0QPOKVTLdxOPyeKujmiktaOo9ip0=;
 b=+CjK5VVg+heemutBNUgW5ZgTFi1GM58YOUfxw5ahL0xfg7exDr03GfcypGLgflQH1UbQahdYf
 mcrxHC7m+mzAOsRFSKYDE1V/wZ1CtL+lOYdb9zBf6HZy+SnO69xWWEV
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Kasan crashes the kernel trying to check boundaries when using the
normal memcpy.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Change-Id: I27714f45aa6aea6a7bee048f706b14b8c7535164
---
 arch/arm/mach-tegra/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
index d5c805adf7a82b938bebd8941eae974cf6bcdbe3..ea706fac63587a393a17fe0f1c2ad69d6e5c14f2 100644
--- a/arch/arm/mach-tegra/reset.c
+++ b/arch/arm/mach-tegra/reset.c
@@ -63,7 +63,7 @@ static void __init tegra_cpu_reset_handler_enable(void)
 	BUG_ON(is_enabled);
 	BUG_ON(tegra_cpu_reset_handler_size > TEGRA_IRAM_RESET_HANDLER_SIZE);
 
-	memcpy(iram_base, (void *)__tegra_cpu_reset_handler_start,
+	memcpy_toio(iram_base, (void *)__tegra_cpu_reset_handler_start,
 			tegra_cpu_reset_handler_size);
 
 	err = call_firmware_op(set_cpu_boot_addr, 0, reset_address);

---
base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
change-id: 20250522-mach-tegra-kasan-fabd0253f268

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


