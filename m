Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD38279334
	for <linux-tegra@vger.kernel.org>; Mon,  1 Sep 2025 21:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756761658; cv=none; b=ECd16VVJu7+i1hrlT8uxHRNhGZpObwWZBODpD7RTDGKtBefyMf2I2N6ByGEbcwJ/ecqZoIpmbTqwjbOBVLInNfLz5hEM1jOTK8yQjrB9ZF658T2JE13P/Ad2cK4QViUOv4Ti9XjfInJAxjygu9dVUVriq1iLCvewP+xwPdWBaPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756761658; c=relaxed/simple;
	bh=bLtQIaf7dyK1Q0ReCFdhXcy1IETUE3HCnqp1Qq2l6SE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lZFKBnSIJ3a1wVki52VmFo8GPoqpMWI1mZDfoCWGoyoG7A2ms3oPb94RxeQ3VgCpui6quwMjLjZjuKWgFtIvM2HjEHwSHWpUki5ngVcRHHRtp/taYcIEkJOs/gh5aYQ9IMcDa0HPZvjLgyq95k5m5eTcyx8ApihGSI5W6WSwtjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=prGBy7V1; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="prGBy7V1"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cG1xn6wN4z9tVj;
	Mon,  1 Sep 2025 23:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1756761646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7jkYr+WUzboPryPVnYCdKAKPTcuqZmMnMRi94vAHDVM=;
	b=prGBy7V1SNTz2F05Do+Xdlspgc+CTHgOjW3vtJYvVzpTO4WEgdfsMaSYdlD3IbZgMiP4j6
	RC4jEk2SqbaCTrLPxNk5/P/tmoh//nqgN+ZpYMOeUVgyfu0D5f/Z1S/lMhXf9d0NYdX0Jz
	m8vv65gX+/s8in/9E2ibrH+yaxy6XRR/gVIuM5Ytrl+RVEUTv/VeRHnqfWrbGrWdDPJwnC
	TAeqLamb7qagXup3qAKLmIiQrxIcaIV8ulQ0Tm9wS2RWtWae7XZOjU6ba7qMCMReVGQVpf
	9K/om2H98PdCM1oftZEHjSY1n8BEo1Kd+evHqmz21sm6bHdsx+gcMS4CH/pK7g==
From: Brahmajit Das <listout@listout.xyz>
To: linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	jonathanh@nvidia.com
Subject: [PATCH] =?UTF-8?q?drm/tegra:=20hdmi:=20sor:=20Fix=20error:=20vari?= =?UTF-8?q?able=20=E2=80=98j=E2=80=99=20set=20but=20not=20used?=
Date: Tue,  2 Sep 2025 02:50:20 +0530
Message-ID: <20250901212020.3757519-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The variable j is set, however never used in or outside the loop, thus
resulting in dead code.
Building with GCC 16 results in a build error due to
-Werror=unused-but-set-variable= enabled by default.
This patch clean up the dead code and fixes the build error.

Example build log:
drivers/gpu/drm/tegra/sor.c:1867:19: error: variable ‘j’ set but not used [-Werror=unused-but-set-variable=]
 1867 |         size_t i, j;
      |                   ^

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 drivers/gpu/drm/tegra/hdmi.c | 4 ++--
 drivers/gpu/drm/tegra/sor.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 8cd2969e7d4b..c4820f5e7658 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -658,7 +658,7 @@ static void tegra_hdmi_write_infopack(struct tegra_hdmi *hdmi, const void *data,
 {
 	const u8 *ptr = data;
 	unsigned long offset;
-	size_t i, j;
+	size_t i;
 	u32 value;
 
 	switch (ptr[0]) {
@@ -691,7 +691,7 @@ static void tegra_hdmi_write_infopack(struct tegra_hdmi *hdmi, const void *data,
 	 * - subpack_low: bytes 0 - 3
 	 * - subpack_high: bytes 4 - 6 (with byte 7 padded to 0x00)
 	 */
-	for (i = 3, j = 0; i < size; i += 7, j += 8) {
+	for (i = 3; i < size; i += 7) {
 		size_t rem = size - i, num = min_t(size_t, rem, 4);
 
 		value = tegra_hdmi_subpack(&ptr[i], num);
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 21f3dfdcc5c9..bc7dd562cf6b 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1864,7 +1864,7 @@ static void tegra_sor_hdmi_write_infopack(struct tegra_sor *sor,
 {
 	const u8 *ptr = data;
 	unsigned long offset;
-	size_t i, j;
+	size_t i;
 	u32 value;
 
 	switch (ptr[0]) {
@@ -1897,7 +1897,7 @@ static void tegra_sor_hdmi_write_infopack(struct tegra_sor *sor,
 	 * - subpack_low: bytes 0 - 3
 	 * - subpack_high: bytes 4 - 6 (with byte 7 padded to 0x00)
 	 */
-	for (i = 3, j = 0; i < size; i += 7, j += 8) {
+	for (i = 3; i < size; i += 7) {
 		size_t rem = size - i, num = min_t(size_t, rem, 4);
 
 		value = tegra_sor_hdmi_subpack(&ptr[i], num);
-- 
2.51.0

