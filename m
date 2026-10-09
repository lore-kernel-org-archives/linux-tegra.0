Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403B4434998;
	Fri,  9 Oct 2026 06:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527535; cv=none; b=kNMnQqRduNrvJhztEDmjZKHteaegDquhSqQ7WGc5G6ZHnwrTTwaQINljOVqV5Owx2LcL0LWFoU8O9x5Oguzaqhvf0c7LqvNSWefOehc/KnxOPqwBh7mwAkW/LC7oKAAk7m8WQLbRXnMeNA6kewkE8sj/ZCT0PxpKNqDKOGlmE7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527535; c=relaxed/simple;
	bh=SJmJvPjq95kXXZNsTkAOwWaIVlCToDkLwuE8XLWV6n4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clhqfLLDAOFFDv/DE0enPhee8je7G39OpKGpAqX4yo+mCVUV3go7mZmviegySwfKeiKzSUh8zL9Vu2z4LDySWqDfguRXsaObcG7HkVSN8MsSBKGyS/zdf2Ue4XW+PFk1nzKJJkbRvjEH1DqrIHAthWKVgjNJtvC0VlocczK/glI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=CoJGFaet; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="CoJGFaet"
Received: from mac.lan (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id 706CC20B7167;
	Thu,  8 Oct 2026 23:32:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 706CC20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791527532;
	bh=qD62pXmGKVATyqrDADZTyaMvYvoa09vK1Gim1YBZHO8=;
	h=From:To:Cc:Subject:Date:From;
	b=CoJGFaet4DDGAbOueEskwrOs0Wir2eiw+rknTCgaQGK4wDpB6sqCgmzGZz/S0gwUd
	 HjSzsbYEkkNxW811t9tabkNp8WDzy5o/mMjS4pdiKOUKO4NW5zlH55NG833VccxAgs
	 xICBtmiNLR+nVmjilTSNy5SOd2g3+mRRfB4+zG2E=
From: "Cen Zhang (Microsoft)" <cenzhang@linux.microsoft.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: Cen Zhang <cenzhang@linux.microsoft.com>,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: nvec: fix GPIO descriptor documentation
Date: Fri,  9 Oct 2026 02:31:56 -0400
Message-ID: <20261009063156.28306-1-cenzhang@linux.microsoft.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for struct nvec_chip still refers to the old gpio member
and to struct nvec_platform_data, which no longer exists.

Rename the documented member to gpiod and describe its role as the GPIO
descriptor for the embedded controller request line.

Signed-off-by: Cen Zhang (Microsoft) <cenzhang@linux.microsoft.com>
---
 drivers/staging/nvec/nvec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.h b/drivers/staging/nvec/nvec.h
index 80c0353f141c..5ef959352338 100644
--- a/drivers/staging/nvec/nvec.h
+++ b/drivers/staging/nvec/nvec.h
@@ -102,7 +102,7 @@ struct nvec_msg {
 /**
  * struct nvec_chip - A single connection to an NVIDIA Embedded controller
  * @dev: The device
- * @gpio: The same as for &struct nvec_platform_data
+ * @gpiod: GPIO descriptor for the embedded controller request line
  * @irq: The IRQ of the I2C device
  * @i2c_addr: The address of the I2C slave
  * @base: The base of the memory mapped region of the I2C device
-- 
2.55.0

