Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055FF3CD8B8;
	Wed, 15 Jul 2026 08:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104661; cv=none; b=UnRWYSZf8ZdTQREXE57pQEJ0eVEkWDNgMZX8pAZXu53YpR06bSqsD5Ju4mAP09kg8PYzCwmDHrhxicphrJ/qvMOOBz5DeP+pXuWhmSzxt/5tnvfnUJgrkMr3BM+IKzc9vFDN7losq2t0+1hqlbKvqCw1sCwb4e1pozrdMub62Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104661; c=relaxed/simple;
	bh=tPIaco2ktDQGox4jXobxycopW5coQPCxuZ7Oil61iS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cj6nr/+0Nuol4BfTvQfC5Bbpj1UIyvJBqp/SmubFqP01PPwOUCIsKM1Q9rSO0rvbTabQ7kmcxk8Rd/Iq28fLg43E+WIDae8WWjByy1GDCDjEv6hOzSTlQ8J3n0jXQY43YrSXtSXCyUZ1oRb+wfTz3zi3CucFoNT1NgalQygL9zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAAHfO_HRldqNFRHGA--.9246S2;
	Wed, 15 Jul 2026 16:37:27 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Timo Alho <talho@nvidia.com>
Subject: [PATCH] firmware: tegra: bpmp: reject truncated debugfs entries
Date: Wed, 15 Jul 2026 16:37:26 +0800
Message-ID: <20260715083726.30740-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAHfO_HRldqNFRHGA--.9246S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWDKr1xZFy8tr15urWkXrb_yoW8KFW3pF
	WDt3y3AryDJrs7WFWktF1UJF1rCa4rWFyxKrZ8Aws0vr1rGrn3GFy5XrWqv3W8Jrs3Arnx
	trWqyrZ5CF47Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeKsjUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The BPMP debugfs response parser reads u32 fields and NUL-terminated
names from a size-delimited reply. seqbuf_read() currently clamps a
request to the remaining input bytes and can return success after a
short read. Consequently, a truncated u32 can be partially copied and
the directory parser can continue with an incomplete field.

seqbuf_read_str() also moves the cursor one byte beyond the current
range when no NUL terminator exists, and reports the failure only after
changing the parser state.

Make fixed-width reads fail when the full request is unavailable and
require a terminator within the current range before advancing the
cursor. Use a signed return type for the status helper so its error
contract matches its callers.

Fixes: f2381f652266 ("firmware: tegra: Add BPMP debugfs support")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 33c6300af964..bb2ce5be2e78 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -32,7 +32,7 @@ static size_t seqbuf_avail(struct seqbuf *seqbuf)
 	return seqbuf->pos < seqbuf->size ? seqbuf->size - seqbuf->pos : 0;
 }
 
-static size_t seqbuf_status(struct seqbuf *seqbuf)
+static int seqbuf_status(struct seqbuf *seqbuf)
 {
 	return seqbuf->pos <= seqbuf->size ? 0 : -EOVERFLOW;
 }
@@ -44,7 +44,9 @@ static int seqbuf_eof(struct seqbuf *seqbuf)
 
 static int seqbuf_read(struct seqbuf *seqbuf, void *buf, size_t nbyte)
 {
-	nbyte = min(nbyte, seqbuf_avail(seqbuf));
+	if (nbyte > seqbuf_avail(seqbuf))
+		return -EOVERFLOW;
+
 	memcpy(buf, seqbuf->buf + seqbuf->pos, nbyte);
 	seqbuf->pos += nbyte;
 	return seqbuf_status(seqbuf);
@@ -57,9 +59,16 @@ static int seqbuf_read_u32(struct seqbuf *seqbuf, u32 *v)
 
 static int seqbuf_read_str(struct seqbuf *seqbuf, const char **str)
 {
+	size_t avail;
+	size_t len;
+
+	avail = seqbuf_avail(seqbuf);
 	*str = seqbuf->buf + seqbuf->pos;
-	seqbuf->pos += strnlen(*str, seqbuf_avail(seqbuf));
-	seqbuf->pos++;
+	len = strnlen(*str, avail);
+	if (len == avail)
+		return -EOVERFLOW;
+
+	seqbuf->pos += len + 1;
 	return seqbuf_status(seqbuf);
 }
 
-- 
2.43.0

