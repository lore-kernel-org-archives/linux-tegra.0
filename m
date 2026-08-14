Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FCB432E6A;
	Fri, 14 Aug 2026 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694753; cv=none; b=rZ+aIvdYeEUnR5fiwImALrcPb0wi7l3MY8IVLxhpY8Lepr3ivqjYTYDIBQErIey3dSgpJZfdd6vCGSXtdylYyO1X25T/nnkHXEMSa5Tq2ITQNR9ng0bQemgjXVeaRsB9SxPcOznHN95ztMkfsJIQwcGJcMyji/SM2CjnUUV2CAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694753; c=relaxed/simple;
	bh=OoLlCaWpYTUXwTuHM3aQZmrkBg3jEvDUARnlYkxiQ+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kHogk/aMcijpIzK+piq0qqVUS51YsJEiaE0P3pdh6JHpsNhfg3v29q8w3+rhFV4fkkUesnKc5tVp9VlfGaDdqqs9zaKwZaFolj6EVQfKKPKUppqetBQs0HWI4205IE2K39CEPawZs6yXqR1wOlyBTZ1PzFUBNVqFCSxxt3yzTS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAAH3fBczH5qn9meBQ--.50162S2;
	Fri, 14 Aug 2026 16:05:48 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Timo Alho <talho@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] firmware: tegra: bpmp: reject truncated debugfs entries
Date: Fri, 14 Aug 2026 16:05:48 +0800
Message-ID: <20260814080548.22922-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAH3fBczH5qn9meBQ--.50162S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF45ZF13ZryxWFy3Gr1UAwb_yoW5Gr1UpF
	Wqy3y3ArWUJr4xGFWktF4UAa4rCa4rWFyxKrZ8Aw45Zr18Crn7GFy5WrWjv3W8trn7A3Z0
	krWqyr95CF47tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU8-
	B_UUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The BPMP debugfs parser reads fixed-width values and bounded strings
from a size-delimited reply. Its fixed-width helper currently treats a
short copy as success, while the string helper advances past the range
when no NUL terminator is present. The status helper also uses an
unsigned return type for negative errors.

Require complete fixed-width reads and a terminator within the remaining
range before moving the cursor. Use a signed status result so errors
reach callers unchanged.

Fixes: f2381f652266 ("firmware: tegra: Add BPMP debugfs support")

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260715083726.30740-1-pengpeng@iscas.ac.cn/
- no source-code changes
- rebase on the current Tegra firmware sources and tighten the commit message
- add the coding-assistant disclosure

The bounded parser helpers and callers were reviewed statically; no
malformed BPMP response was injected.

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
2.50.1 (Apple Git-155)

