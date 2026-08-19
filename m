Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FC3450400;
	Wed, 19 Aug 2026 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136896; cv=fail; b=MZTks4lZHaTLPvn73vwAWZa0HPbtYfiVp2DrWnK3zAQGJeFJWbAREsXY9n9K8H5L3536dqkgv17r8rZjA/2iqr8g25yvEEuKGEwzSqoQUfWpslm8pF3OxLQJlE6S0nBdqJUnnwQLq4OoaMxbTnF3MQyDmXo7ikT7vlpuJpg+ZsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136896; c=relaxed/simple;
	bh=u+Uz3juvvSGZXJfsA+MN6h63i1VIHVk2oc8rkpn7wjY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q9jKxItssrl+dd9BpLLJ69TgTHG+/vIxGYVIe0ZwHS7Obuh7/oTi8je3eWYTBOUiIrAAO9xITg9Q5gwe46OC2NF4aTkGR3DtC8/t6Wu4m+2VJqAjH3qnzVdsf/EcY/a+M6TMIjYitgN4WIRAOcoFwCPm6P57WL0rnRnySL0fBtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DGlqNrRN; arc=fail smtp.client-ip=52.101.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DGlqNrRN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSuv5rpWV8AcjTFedR9JdY4+35eokuhQNA+DXESvZsGqxuGrJgODeGWaZzHYp/oy95XT2ymJTDNDlnbFpLXmY7cGMOGy1thinPCWeas6UQsKxG95vPv7N7Qv0WkDoPMKj3FIYp+pMAeppelgDHrAQClDOoc/aS1JB5TVRa7qpAZpmH34iS4ftGN46ZBJX0aRLzT0rBQyTiS1Y+ZTkDKLWWvEV9VpMa0R7xVu7PRnmp5gNjNIEa/OIztU1Yc3RigGWOFa1Ve/4KPDJxlV+tx0e6r32/+nhIV/FHSIdVteva/IiH/dmBZ3hB5Qmpg4g6CI8Nrl03sB5etIQHYaaGyMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKo5SGZW3/QIlYGZO3sM4GBo66DfbW87WOqgdPyBtME=;
 b=uhzO6FmFserbt93EXmoslc3K/+Od8VhK9X7bDfUQBIbGaiIip1N9IXv9Q50aaBChxPMum2WmlbxKKHNxUwncpCUBmh+JW54OJCocYn1+9tW6DbVlbWz5gTG0Oe15LiAdcnX4b29zo0fwwb5TqaFWbkONg8mOVsiEjJxE20PDj0IEotHyXQjCVy96mAlFBOX6okIRHhEkFq7+9Di2UA5N94rMFDW5Q9NlRLA2JiUnhT5i8utY/ncLasU11fFDO8f1gyna4WCmTdwMFonDaeBAaIWkEQ5rl8MaXqZm/ZAeCNXG+67aIhCHEecjTn/YHxFrvwqCZym0tMjMzzlX0I8Jnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKo5SGZW3/QIlYGZO3sM4GBo66DfbW87WOqgdPyBtME=;
 b=DGlqNrRN9DwEqBjLw7PA4Kk/62TyZeRnXjgoiesh+up/vPXuse7H+ZnoSA+3XNj7uTT4IZwRp8QLEkclvAsHIf2DMS0jbQBopxsv6+Ik62tswrm43nimI97UHUb392RTOZkh04EUlw3hjhJ7Z4aw8i3LrqB2J57xPUOC8YRyPDF9U5E0ci1wZcQpU6h712sI6vrGoTr2taySOb+GD6XK/QDWtsOzlutCSDVbLTz1g9bVjqJUdxwv9gM5xOvedyHpdFaBoEcDCJBx2x22Kp8ekG8nOpbYrKwQgbqVvfSLS1U0HCSHCSroejq63av+XhzRvH0J6PHy4PTn5kW7gSuEVA==
Received: from CYXP220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:ee::7) by
 IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 10:54:47 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:ee:cafe::96) by CYXP220CA0007.outlook.office365.com
 (2603:10b6:930:ee::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 10:54:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 10:54:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 19 Aug
 2026 03:54:33 -0700
Received: from build-knirmal-noble-20260527.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 19 Aug 2026 03:54:31 -0700
From: Ketan Nirmal <knirmal@nvidia.com>
To: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G
 . Piccoli" <gpiccoli@igalia.com>, Jonathan Corbet <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
CC: <jonathanh@nvidia.com>, <bbasu@nvidia.com>, <pchandru@nvidia.com>,
	<sumitg@nvidia.com>, <knirmal@nvidia.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v1] pstore/blk: add best-effort polled panic_write for block devices
Date: Wed, 19 Aug 2026 10:54:16 +0000
Message-ID: <20260819105416.24436-1-knirmal@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 608e04fc-a577-4d50-e87a-08defde048ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|30052699003|6133799003|56012099006|10067099003|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	s9KiTc7vuomS/hW/qKpgYUwIVeY17iDJF03a/o34ARO3mLw5VqtGCXpWXuHd6I+1LuGRFtmPuYh8VcZTieD4kVLC6BLRZQVStbZyoiA4WCix8URZjAw+Ov6OizfvmlAW0r2EnhWvoLCw/X7QUersVarL4+IDnbYpDGzIpIR9WMPnVBzZB5tWwhlYBkji3r6/56jUdGzmVNB1hySy2MDdnPyWQbMe73H2Q1Yxe0MHRY7SwXC8gqtM757TqoiBpt85OWNvk6YIyWdhXNhXYMPBuVaGSiWUK4MaCndOTk2D0HW6JWQuFcd0/Z2+aQpJy3pS9WhY3nBVDf+RIbS47PZdCZy6L8lSiFdegJxd+pSK9u3dMwFqSFrLzhdC5q4dAgYNxPgTyxq5C6Ahkfpo0bcFmYk4V4JuU2jmOtrco4NvjYCN7uIsR7J0FDaUP5gHbLHDc+Hwl+UC6AUmG19/7HOe36RKEXY+1pQ31h9u7ica1/DuMgkrbJJyLmXi+tYHmrBWLN91cMg9hpeCck6NmaOi0uYcCX+6UsL+PWcsPQjZnvBECqt8XtOfE3g1gwHF7Zko1SbIQWhjEVUHiGyZoeQUh+InTKyda9Uhxt5beKsf+BHg4QRSu5uZM3lICHrHYSShXohVV3XR/yiw1F3mfAp+WsoiznjCTOy1iyoG134VkkgXWodAoe8z4wor2JOe2zYU4Y2HqnOjN5LcIUwtsDRTpQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(30052699003)(6133799003)(56012099006)(10067099003)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PXThWsmL9AhEC3Ze+A/oZW8RNkdFHhHnHDV9pN4PLeyFvV2IAiTlOYjYy1snYLiIOBAQdDrKTRdr9t2iahHX84sEBwUAz/7zkl0S55nU7MmawTXkH4Re3vACFWedyFF06EPT93oDHSUK+aSoAU3kfzJOUyeKziOI/kZRewOYAboW/5JLKx4AT8pRBwqxSITrtEskXFvZeuIr5V5jjgwumsRDGCOcGPi2ldkC5crM/P+WH2TdGRUXI+hx3ouKdJNhj2cqAUyDSTrAwPK5m8HFCjBYpoxtNohvMOGH9Zk33o2klpC5yDDIGnzWH4roIax8zXtcHaCGeEANEl71DgiVfaTV9ydZDniOy3u5BjXPUtuingIekmBBull9kWtlvQpv27KthX67iNF9EyIK7jez30bbRNDhFqpoLn6BNzrHD9Q+LGcpy5kBwgGJec9bR1GZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 10:54:47.0004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 608e04fc-a577-4d50-e87a-08defde048ea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

The NVIDIA Jetson Thor platform is unable to use RAM for storing panic
logs because its DRAM ECC scrub runs during the reset path, so a RAM
carveout is not preserved in a way Linux can rely on after reboot. Hence,
there is no persistent RAM region available for ramoops. NVMe storage is
available on the Jetson Thor platform which would be the desired
pstore/blk backend for storing panic dmesg records.

pstore/blk already has a best-effort mode for normal block devices, but it
does not currently support panic dmesg records from that mode. The
best-effort path opens the configured block device and wires only the
pstore/zone read and write callbacks. During a panic, pstore/zone uses its
optional panic_write callback for dmesg records. Without that callback,
the panic record is only marked dirty in memory and the reboot happens
before the normal write path can flush it. The generic block write path is
not suitable for this callback because it can sleep and depends on normal
block-layer completion handling.

Add a best-effort panic_write implementation for block devices that can
submit nonblocking polled writes. The writer uses a static bio and bvec
array, maps the pstore buffer pages, submits REQ_POLLED | REQ_NOWAIT, and
polls completion with bio_poll(BLK_POLL_ONESHOT). Writes are split to
queue limits and must be sector and logical-block aligned, which matches
pstore/zone panic dmesg FLUSH_ALL records.

Only enable the callback when the queue has poll hardware queues, the block
device supports nowait submission, and FUA is available if the write cache
is enabled. Unsupported devices continue to attach in best-effort mode
without panic_write and log the reason. Use REQ_FUA for data writes, but
avoid REQ_PREFLUSH because flush requests do not provide a poll cookie that
can be waited on from the panic path.

Tag the write as metadata, priority, sync and idle I/O. These flags keep
the record on the urgent metadata path while avoiding writeback-throttle
waits in configurations where that policy is active.

This makes pstore/blk best-effort mode usable with NVMe devices that expose
poll queues, such as NVMe devices configured with nvme.poll_queues=. It is
not a replacement for driver-native panic hooks.

Tested on a Jetson platform with an NVMe partition and nvme.poll_queues=4
by triggering panic via "echo c > /proc/sysrq-trigger"; after reboot the
kmsg dump was recovered from /sys/fs/pstore/dmesg-pstore-blk-0 and from
the raw partition.

Signed-off-by: Ketan Nirmal <knirmal@nvidia.com>
---
 Documentation/admin-guide/pstore-blk.rst |  33 +++
 fs/pstore/blk.c                          | 322 ++++++++++++++++++++++-
 2 files changed, 353 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
index 1bb2a1c292aa..d99576d8b1f4 100644
--- a/Documentation/admin-guide/pstore-blk.rst
+++ b/Documentation/admin-guide/pstore-blk.rst
@@ -219,6 +219,39 @@ pstore/blk supports psblk_blkdev_info(), which is defined in
 *linux/pstore_blk.h*, to get information of using block device, such as the
 device number, sector count and start sector of the whole disk.
 
+Panic writes in best-effort mode
+--------------------------------
+
+When ``best_effort=y`` is used with a suitable block device, pstore/blk can
+register a ``panic_write`` callback for panic dmesg records. The callback
+submits write BIOs with ``REQ_POLLED`` and polls them with ``bio_poll()`` so
+that pstore/blk does not depend on normal completion interrupts for the panic
+record.
+
+The block device must support all of the following when pstore/blk registers:
+
+1. polled hardware queues (``BLK_FEAT_POLL`` with ``HCTX_TYPE_POLL`` queues),
+#. nowait bio submission, and
+#. FUA writes if the device write cache is enabled.
+
+If any requirement is missing, pstore/blk still attaches in best-effort mode
+but leaves ``panic_write`` disabled. The boot log reports whether the panic
+writer was enabled, for example::
+
+        pstore_blk: attached /dev/nvme0n1p3 (...) (panic_write enabled)
+
+or::
+
+        pstore_blk: '/dev/nvme0n1p3' cannot use polled panic writes: missing polled hardware queues
+        pstore_blk: attached /dev/nvme0n1p3 (...) (no dedicated panic_write!)
+
+Some drivers create poll queues only when requested by a module parameter or
+kernel command-line option, such as ``nvme.poll_queues=`` for NVMe.
+
+The panic writer uses ``REQ_FUA`` for the data write. It does not use
+``REQ_PREFLUSH`` because flush requests do not provide a poll cookie that can
+be waited on with ``bio_poll()`` from the panic path.
+
 pstore block internals
 ----------------------
 
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 12070b6a7b11..ff20c8fbe1b0 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -9,6 +9,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/blkdev.h>
+#include <linux/bio.h>
+#include <linux/blk-mq.h>
+#include <linux/blk_types.h>
+#include <linux/delay.h>
+#include <linux/mm.h>
 #include <linux/string.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -18,6 +23,7 @@
 #include <linux/file.h>
 #include <linux/init_syscalls.h>
 #include <linux/mount.h>
+#include <linux/vmalloc.h>
 
 static long kmsg_size = CONFIG_PSTORE_BLK_KMSG_SIZE;
 module_param(kmsg_size, long, 0400);
@@ -190,6 +196,312 @@ static ssize_t psblk_generic_blk_read(char *buf, size_t bytes, loff_t pos)
 	return kernel_read(psblk_file, buf, bytes, &pos);
 }
 
+#define PSBLK_PANIC_MAX_PAGES		16
+#define PSBLK_POLL_DELAY_US		100
+#define PSBLK_POLL_MAX_ITERATIONS	30000
+
+struct psblk_panic_completion {
+	int done;
+	blk_status_t status;
+};
+
+/*
+ * panic_write is only used for panic dmesg records. pstore/zone serializes
+ * those writes, so a single statically reserved bio is enough and avoids
+ * bio allocation from the panic path.
+ */
+static struct bio psblk_panic_bio;
+static struct bio_vec psblk_panic_bvecs[PSBLK_PANIC_MAX_PAGES];
+static struct psblk_panic_completion psblk_panic_comp;
+
+static void psblk_panic_bio_endio(struct bio *bio)
+{
+	struct psblk_panic_completion *comp = bio->bi_private;
+
+	WRITE_ONCE(comp->status, bio->bi_status);
+	/* Pairs with psblk_panic_done() before reading comp->status. */
+	smp_store_release(&comp->done, 1);
+}
+
+static bool psblk_panic_done(struct psblk_panic_completion *comp)
+{
+	/* Pairs with psblk_panic_bio_endio() after writing comp->status. */
+	return smp_load_acquire(&comp->done);
+}
+
+static bool psblk_panic_check_capable(struct block_device *bdev)
+{
+	struct request_queue *q = bdev_get_queue(bdev);
+
+	if (!q) {
+		dev_dbg(&bdev->bd_device,
+			"cannot use polled panic writes: missing request queue\n");
+		return false;
+	}
+
+	if (!(q->limits.features & BLK_FEAT_POLL) || !q->tag_set ||
+	    !q->tag_set->map[HCTX_TYPE_POLL].nr_queues) {
+		dev_dbg(&bdev->bd_device,
+			"cannot use polled panic writes: missing polled hardware queues\n");
+		return false;
+	}
+
+	if (!bdev_nowait(bdev)) {
+		dev_dbg(&bdev->bd_device,
+			"cannot use polled panic writes: missing nowait support\n");
+		return false;
+	}
+
+	if (bdev_write_cache(bdev) && !bdev_fua(bdev)) {
+		dev_dbg(&bdev->bd_device,
+			"cannot use polled panic writes: write cache enabled without FUA\n");
+		return false;
+	}
+
+	return true;
+}
+
+static size_t psblk_panic_max_chunk(struct request_queue *q, const char *buf,
+				    size_t bytes)
+{
+	unsigned int max_pages;
+	unsigned int logical;
+	size_t page_room;
+	size_t max_bytes;
+
+	max_pages = min_t(unsigned int, PSBLK_PANIC_MAX_PAGES,
+			  queue_max_segments(q));
+	max_pages = min_t(unsigned int, max_pages, BIO_MAX_VECS);
+	if (!max_pages)
+		return 0;
+
+	page_room = ((size_t)max_pages << PAGE_SHIFT) - offset_in_page(buf);
+	max_bytes = min_t(size_t, queue_max_bytes(q),
+			  (size_t)max_pages << PAGE_SHIFT);
+	max_bytes = min(max_bytes, page_room);
+
+	logical = queue_logical_block_size(q);
+	max_bytes = round_down(max_bytes, logical);
+
+	return min(bytes, max_bytes);
+}
+
+static ssize_t psblk_panic_fill_bio(struct bio *bio, const char *src,
+				    size_t bytes)
+{
+	size_t added = 0;
+
+	while (added < bytes) {
+		const void *addr = src + added;
+		struct page *page;
+		size_t page_off;
+		size_t page_len;
+		int ret;
+
+		page_off = offset_in_page(addr);
+		page_len = min_t(size_t, PAGE_SIZE - page_off,
+				 bytes - added);
+
+		if (is_vmalloc_addr(addr))
+			page = vmalloc_to_page(addr);
+		else
+			page = virt_to_page(addr);
+
+		if (!page) {
+			pr_emerg("failed to get page for buffer\n");
+			return -EFAULT;
+		}
+
+		ret = bio_add_page(bio, page, page_len, page_off);
+		if (ret != page_len) {
+			pr_emerg("failed to add page to panic bio\n");
+			return -EIO;
+		}
+
+		added += ret;
+	}
+
+	return added;
+}
+
+static int psblk_panic_bio_status(struct psblk_panic_completion *comp)
+{
+	blk_status_t status = READ_ONCE(comp->status);
+	int err;
+
+	if (status == BLK_STS_OK)
+		return 0;
+
+	err = blk_status_to_errno(status);
+	pr_emerg("write failed with block status %u, error %d\n",
+		 (__force unsigned int)status, err);
+	return err;
+}
+
+static int psblk_panic_submit_and_wait(struct bio *bio,
+				       struct psblk_panic_completion *comp,
+				       bool *completed)
+{
+	unsigned long iters = 0;
+	bool can_poll;
+
+	WRITE_ONCE(comp->status, BLK_STS_OK);
+	WRITE_ONCE(comp->done, 0);
+	*completed = false;
+
+	submit_bio(bio);
+
+	can_poll = READ_ONCE(bio->bi_cookie) != BLK_QC_T_NONE;
+	if (!can_poll && !psblk_panic_done(comp))
+		pr_emerg("REQ_POLLED write did not return a poll cookie\n");
+
+	while (!psblk_panic_done(comp)) {
+		if (iters++ >= PSBLK_POLL_MAX_ITERATIONS) {
+			pr_emerg("write timed out after %lu poll attempts\n",
+				 iters);
+			return -ETIMEDOUT;
+		}
+
+		if (can_poll)
+			bio_poll(bio, NULL, BLK_POLL_ONESHOT);
+		cpu_relax();
+
+		if (!psblk_panic_done(comp))
+			udelay(PSBLK_POLL_DELAY_US);
+	}
+
+	*completed = true;
+	return psblk_panic_bio_status(comp);
+}
+
+static ssize_t psblk_panic_blk_write(const char *buf, size_t bytes, loff_t pos)
+{
+	struct file *file = READ_ONCE(psblk_file);
+	struct psblk_panic_completion *comp = &psblk_panic_comp;
+	struct block_device *bdev;
+	struct request_queue *q;
+	size_t remaining = bytes;
+	size_t written = 0;
+	loff_t offset = pos;
+	unsigned int logical;
+	blk_opf_t opf;
+	int ret;
+
+	if (!bytes)
+		return 0;
+
+	if (!file) {
+		pr_emerg("block device file is not available\n");
+		return -ENODEV;
+	}
+
+	if (!buf) {
+		pr_emerg("missing write buffer\n");
+		return -EINVAL;
+	}
+
+	if (pos < 0) {
+		pr_emerg("invalid negative write offset %lld\n", pos);
+		return -EINVAL;
+	}
+
+	if ((pos | bytes) & (SECTOR_SIZE - 1)) {
+		pr_emerg("unaligned sector write: offset %lld, size %zu\n",
+			 pos, bytes);
+		return -EINVAL;
+	}
+
+	bdev = file_bdev(file);
+	if (!bdev) {
+		pr_emerg("failed to get block device\n");
+		return -EINVAL;
+	}
+
+	q = bdev_get_queue(bdev);
+	if (!q) {
+		pr_emerg("failed to get request queue\n");
+		return -EINVAL;
+	}
+
+	if (bdev_read_only(bdev)) {
+		pr_emerg("block device is read-only\n");
+		return -EROFS;
+	}
+
+	if (blk_queue_dying(q)) {
+		pr_emerg("queue is dying, device unavailable\n");
+		return -ENODEV;
+	}
+
+	logical = queue_logical_block_size(q);
+	if ((pos | bytes) & (logical - 1)) {
+		pr_emerg("unaligned logical block write: offset %lld, size %zu, logical block %u\n",
+			 pos, bytes, logical);
+		return -EINVAL;
+	}
+
+	opf = REQ_OP_WRITE | REQ_SYNC | REQ_META | REQ_PRIO |
+	      REQ_IDLE | REQ_POLLED | REQ_NOWAIT | REQ_FUA;
+
+	while (remaining) {
+		struct bio *bio = &psblk_panic_bio;
+		bool completed = false;
+		unsigned int nr_vecs;
+		size_t to_write;
+		ssize_t added;
+
+		to_write = psblk_panic_max_chunk(q, buf + written, remaining);
+		if (!to_write) {
+			pr_emerg("failed to build queue-limited write chunk\n");
+			ret = -EIO;
+			break;
+		}
+
+		nr_vecs = DIV_ROUND_UP(offset_in_page(buf + written) +
+				       to_write, PAGE_SIZE);
+		if (WARN_ON_ONCE(nr_vecs > PSBLK_PANIC_MAX_PAGES)) {
+			pr_emerg("write chunk needs %u bvecs, max is %u\n",
+				 nr_vecs, PSBLK_PANIC_MAX_PAGES);
+			ret = -EIO;
+			break;
+		}
+
+		bio_init(bio, bdev, psblk_panic_bvecs, nr_vecs, opf);
+		bio->bi_iter.bi_sector = offset >> SECTOR_SHIFT;
+		bio->bi_private = comp;
+		bio->bi_end_io = psblk_panic_bio_endio;
+
+		added = psblk_panic_fill_bio(bio, buf + written, to_write);
+		if (added != to_write) {
+			bio_uninit(bio);
+			ret = added < 0 ? added : -EIO;
+			break;
+		}
+
+		ret = psblk_panic_submit_and_wait(bio, comp, &completed);
+		if (completed)
+			bio_uninit(bio);
+		if (ret)
+			break;
+
+		written += to_write;
+		remaining -= to_write;
+		offset += to_write;
+	}
+
+	if (written) {
+		if (ret < 0)
+			pr_emerg("panic write stopped after %zu of %zu bytes: error %d\n",
+				 written, bytes, ret);
+		return written;
+	}
+
+	if (ret < 0)
+		pr_emerg("panic write failed with error %d\n", ret);
+
+	return ret;
+}
+
 static ssize_t psblk_generic_blk_write(const char *buf, size_t bytes,
 		loff_t pos)
 {
@@ -224,6 +536,9 @@ static int __register_pstore_blk(struct pstore_device_info *dev,
 	dev->zone.total_size =
 		bdev_nr_bytes(I_BDEV(psblk_file->f_mapping->host));
 
+	if (psblk_panic_check_capable(file_bdev(psblk_file)))
+		dev->zone.panic_write = psblk_panic_blk_write;
+
 	ret = __register_pstore_device(dev);
 	if (ret)
 		goto err_fput;
@@ -309,8 +624,11 @@ static int __init __best_effort_init(void)
 	if (ret)
 		kfree(best_effort_dev);
 	else
-		pr_info("attached %s (%lu) (no dedicated panic_write!)\n",
-			blkdev, best_effort_dev->zone.total_size);
+		pr_info("attached %s (%lu)%s\n",
+			blkdev, best_effort_dev->zone.total_size,
+			best_effort_dev->zone.panic_write ?
+			" (panic_write enabled)" :
+			" (no dedicated panic_write!)");
 
 	return ret;
 }
-- 
2.43.0

