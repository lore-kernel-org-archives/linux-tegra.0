Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046595;
	b=2mmoxwJNbovrRlYXlZ5ahJ5Qx2RQfvGvZWN2VkTgRlRXV1kIfI0Xc55N242b140ywPcs
	 pBRqwXeo1aUgShMCXizsdiUzNBcjEM/Y0LGxOBk/nlPVT0ktp3T34Fw0XgEVrMYu4BzHr
	 ikabXYcJSezdEUcWEixdD2/1mMpRMKVuZ89vors/uyv/qAJK6UmfK1Eg2FGB2xTp5Urex
	 TtFcGl+zNjBMFMSaG3qEJQ4EDuNCSjjCjCOQJFOLOfUBAqIlM5ZpRzeNPP+HYfCySpLLH
	 sdzfHjPvW9Bns8XjtLl5zUUOj/8v/ZqJARrntvUIK/1sG9tk0t6NDt0iZUEBWRg6N8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/PtpWLY5heXix5MU3OQmARxEwZq0XS9BuSVh+haz/H0=;
	b=tSXkrpo6eRf/SDdijkw09pbTgUNCm2kHS+OK6bi60leCTgivSqQ1oEd7jEHwZWBotPei
	 TiH3lubA9pX0rQUsKKM8+ZodqVSSda+i6bEvoWc/pL3hYOvo+wtS53VbH/Mft/d1h0Slh
	 x4SNn/sBi++pOwSrpsqebXEXNb7fafgPLCs6z01mZoiNWlhHwvA6n5OP1/I29muSzL71s
	 ZfeeOQJWqv8PdYSmgwqzQOaOZzrNSmZJ1PWROL9Cp3XlZP8iCVAc2RQDnBe9yBSR0Jagg
	 AZ7hDiEGlO4Ls/ezLzMoxXXn0N/M5ip3mcryzk529hctbUumuI4LZH9Xr8ySzo7EEgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+sNgiut;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF16C606A32E
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF16C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+sNgiut
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-85c1135c286so1028249a34.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046594; x=1794651394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PtpWLY5heXix5MU3OQmARxEwZq0XS9BuSVh+haz/H0=;
        b=W+sNgiutSe006tS0PRMepCwZRW+EnlxJfqDpHiv7GgPswI/mGMjj5oTlcupC+97SNj
         V3/oyB6UGiYeGbgTuPWSshatWTV9j7i74lJ3M0RdU8dbxdTcsZ8FVhvLk+DeCaUkkK8l
         OmeMEZ/0BvKm8K2cXJYWA9v6Uj74J8TOLnpgTv39Rhjv3EKCdfkkAfB/Ri+1oWbdlCfx
         M0yP2rIr6j0phhscFGvX3wGqXlbpluOlKSq5T5Ez74i2HMdvrIbSLkEk0BPsHNeyXgkB
         XFpDo2yBOlOR5WNUMzBFyv1lmX3oM1HGTyD2bJwcMWPK933uib9jiNVsiSo69RVKPokW
         QDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046594; x=1794651394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PtpWLY5heXix5MU3OQmARxEwZq0XS9BuSVh+haz/H0=;
        b=TTRsUSwRJEWmPpEtRy7X7e1Q+Po1xHXv0Rf9kNPB5lpVC3N6YULmlMpoVD/StyqAdv
         xu5AIM19uyxsUjP1Up+a8JaQbYTbZXP7mmc/lz1Jnx6JFNv92A9C7AH4oXq2bguHKyGe
         RUS4vXkNLV+6ZKVEssJjAnKrY5l0/TE4HlfKNtG2NvzMYON9ihl6jwwvyaZJaYAtmb66
         hq8ym6zZ4VWmXW9fK83Ya4LjPQoDkaGRYq9uFs0uNqGWzHazcZbyqIO5vJlLi6zbcfTf
         bvCzgsTBSKuWLUEu1uu9P/Fan3BtYvMJDSyx5SHqwBZxq/TJAOcCJWTK1QKX2CNX4xvG
         cVqA==
X-Forwarded-Encrypted: i=1; AKwUvBxT58E27MLzHffpEypP/U0E07kRm9IPnHxCI2s3eZRRw7Kn6vPbF6GTEabdwoQLf9wUPr6iwM04pgHDwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/17kRx4kd0FUYNEmpQxGaNurGvSMjSYWMpbzVdyecfdtSGjwVM
	c+eG5Deochz4em+WGBM4qoi/NgdYR7Oxcg9fPxKciJhaN2ceHfmYRE57
X-Gm-Gg: AYBFou3DB7KBHYmDMWILHmXwkIoNDCaKdypE+nNMZGujpcJQi87BMoslqgU8Nv+gh5J
	971e9DiHnr2qXFf63oqDXfMC/WlVwptcyM8yVnI9I44niS0w0Q5OHNXbPGbGosnfh9I+z5fqDbm
	ENyKk7+5FXFuXJsKfGhXek60zrSf/zEgP1bTvzsvuKcGny4XhE8m4W3lATTeq+owTsGbPZYsFvM
	MNuVlZrEAjr/xvSz4cvPSSiIGfBSndo7ISldG3brGDW/8DHlWTZYZlnxCW6BPBWTkbXbvWEK0/4
	gNmu+FxaILQG7t8C5Sf1YV1Ku/kHrii1+OtGovQdd+f/u+neGErbFGOzPqRPd8FxbV3KpXWiRqL
	qOzVgID1pQFm2I2v6+8I2U8Qb+FFiZMXMR//bjTMQlp19Fo8CEmBhG6W28mHuMzZbSWv9vmooas
	QN8ZEirjEsuK/PiXPacOGLymrQHugYau/XgTRT3p9QT23c96mSC8FS99AJvbY1uJqCYXq7dp6EN
	Yw3TcX7o7TYc0pxMeHODPK1DvOhGqB0C+pRqRIMozn9shvJb1Z50lQcjnGQZP6TEDTsK1+nG8Vw
	aTeEZjsPXyjyCoLP2iDad3DevO8mXfuJdMA1PzaGg2QRH1NeOKBgezAykvtGx93ttOj0zoE/E8A
	EXuxzyyh1nHrsA1T2I0nuyp22JRK7gFrpIre8U0HpfbWHezNJ+l0PMUghRMRAc55oWJl1+jGXxH
	PMIXuJzXuFJavvYqfdFZ/E7SZyYuY8qIcFlUbBR0i0kUre4X66lE6w
X-Received: by 2002:a05:6830:6815:b0:85f:ee8:26c1 with SMTP id 46e09a7af769-85f1d080300mr5222020a34.22.1794046593661;
        Sat, 07 Nov 2026 02:16:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:00 -0700
Subject: [PATCH 03/58] mtd: add opt-in lifetime ownership for backing
 objects
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-3-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

MTD references retain registered nodes, but do not retain the backing
object allocated by a controller driver. Keeping a partition open across
driver unbind can therefore leave its master and driver metadata freed.
Device references held outside get_mtd_device(), such as NVMEM
consumers, also need the backing object and the partition ancestry to
remain valid.

Add an optional master lifetime initialized by mtd_set_release(). The
driver owns the initial reference. Each registered node and acquired MTD
handle holds another reference. The node reference lasts through final
device release, and nested partitions retain their parent device until
then. mtd_put_master() drops the driver's reference after hardware has
been disconnected and the MTD devices unregistered.

Give OTP NVMEM providers their own backing-object references through the
NVMEM context callbacks. They are parented to the physical device rather
than the MTD node, so the node reference does not cover them. Keep these
references through final NVMEM device release, including after failed MTD
registration, and use the backing driver's module as the consumer owner.

Pin the release callback's module when the driver drops its reference.
If the module is initializing or unloading, wait for the remaining
references instead: failed module initialization can discard module text
despite reference pins, and unload cannot acquire a new pin. Keep the
MTD core module pinned through its device and OTP release callbacks too.

Distinguish registration from retained references so an unregistered
node cannot be opened again. Reference a registered master even when
MTD_PARTITIONED_MASTER is disabled: an unpartitioned device is still
registered in that configuration. Remove the lookup entry under
mtd_table_mutex at the last MTD put, but reserve its number until final
device release. A retained NVMEM provider still uses that number in its
device name, so reusing it earlier would make rebind fail with -EEXIST.

On registration failure, wait for the overridden device release callback
before returning ownership to the caller. This also covers delayed
kobject release, when an immediate caller free would be premature.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c   | 195 +++++++++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/mtd.h |  16 ++++
 2 files changed, 184 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 558a605ba749..42c06a02cd99 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -31,6 +31,7 @@
 #include <linux/nvmem-provider.h>
 #include <linux/root_dev.h>
 #include <linux/error-injection.h>
+#include <linux/completion.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -70,6 +71,7 @@ static struct class mtd_class = {
 };
 
 static DEFINE_IDR(mtd_idr);
+static DEFINE_IDA(mtd_ids);
 
 /* These are exported solely for the purpose of mtd_blkdevs.c. You
    should not use them for _anything_ else */
@@ -78,7 +80,15 @@ EXPORT_SYMBOL_GPL(mtd_table_mutex);
 
 struct mtd_info *__mtd_next_device(int i)
 {
-	return idr_get_next(&mtd_idr, &i);
+	struct mtd_info *mtd;
+
+	while ((mtd = idr_get_next(&mtd_idr, &i))) {
+		if (mtd->registered)
+			return mtd;
+		i++;
+	}
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(__mtd_next_device);
 
@@ -87,37 +97,118 @@ static LIST_HEAD(mtd_notifiers);
 
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
 
-/* REVISIT once MTD uses the driver model better, whoever allocates
- * the mtd_info will probably want to use the release() hook...
+static void mtd_master_release(struct kref *ref)
+{
+	struct mtd_info *master = container_of(ref, struct mtd_info,
+					     master.life_refcnt);
+	struct completion *done = master->master.release_done;
+	struct module *owner = master->master.release_owner;
+
+	master->master.release(master);
+	if (done)
+		complete(done);
+	else
+		module_put(owner);
+}
+
+static void mtd_get_lifetime(struct mtd_info *master)
+{
+	if (master->master.release)
+		kref_get(&master->master.life_refcnt);
+}
+
+static void mtd_put_lifetime(struct mtd_info *master)
+{
+	if (master->master.release)
+		kref_put(&master->master.life_refcnt, mtd_master_release);
+}
+
+/**
+ * mtd_set_release - initialize the lifetime of a dynamically allocated master
+ * @master: master MTD device
+ * @release: free the backing object and its retained metadata
+ *
+ * Call once before registration. The driver owns the initial reference and
+ * drops it with mtd_put_master() after unregistering and disconnecting hardware.
+ * Registered MTD devices and acquired handles retain the backing object too.
+ * The release callback must not access resources released by driver unbind.
  */
+void mtd_set_release(struct mtd_info *master,
+		     void (*release)(struct mtd_info *mtd))
+{
+	kref_init(&master->master.life_refcnt);
+	master->master.release = release;
+}
+EXPORT_SYMBOL_GPL(mtd_set_release);
+
+/**
+ * mtd_put_master - drop the driver's initial lifetime reference
+ * @master: master initialized by mtd_set_release()
+ *
+ * Hardware access must already be disconnected and drained. Unbind may return
+ * while handles retain metadata. Keep the release callback's module loaded
+ * until that metadata is freed. During module unload there can be no acquired
+ * handles, since they pin the module; wait for remaining device references
+ * instead of scheduling a callback into the departing module. Also wait during
+ * module initialization, which may fail and discard the module despite pins.
+ */
+void mtd_put_master(struct mtd_info *master)
+{
+	DECLARE_COMPLETION_ONSTACK(done);
+
+	if ((!master->owner || READ_ONCE(master->owner->state) == MODULE_STATE_LIVE) &&
+	    try_module_get(master->owner)) {
+		master->master.release_owner = master->owner;
+		mtd_put_lifetime(master);
+	} else {
+		master->master.release_done = &done;
+		mtd_put_lifetime(master);
+		wait_for_completion(&done);
+	}
+}
+EXPORT_SYMBOL_GPL(mtd_put_master);
+
 static void mtd_release(struct device *dev)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
-	dev_t index = MTD_DEVT(mtd->index);
+	struct mtd_info *master = mtd->ref_master;
+	struct mtd_info *parent = mtd->parent;
 
-	idr_remove(&mtd_idr, mtd->index);
+	/* Retained NVMEM providers use the MTD number in their device name. */
+	ida_free(&mtd_ids, mtd->index);
 	of_node_put(mtd_get_of_node(mtd));
 
 	if (mtd_is_partition(mtd))
 		release_mtd_partition(mtd);
 
-	/* remove /dev/mtdXro node */
-	device_destroy(&mtd_class, index + 1);
+	if (master) {
+		/* Nested partitions can outlive device_del() of their parents. */
+		if (parent && parent != master)
+			put_device(&parent->dev);
+		mtd_put_lifetime(master);
+	}
+	module_put(THIS_MODULE);
 }
 
 /*
- * No-op device release used in add_mtd_device() error paths.
+ * Hand failed registrations back to their caller only after device release.
  * Prevents mtd_release() from being called via device_release(),
  * which would free the mtd_info that the caller still manages.
  */
-static void mtd_dev_release_nop(struct device *dev)
+static void mtd_dev_release_done(struct device *dev)
 {
+	complete(dev_get_drvdata(dev));
 }
 
 static void mtd_device_release(struct kref *kref)
 {
 	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
 	bool is_partition = mtd_is_partition(mtd);
+	bool managed = mtd->ref_master;
+
+	/* The table mutex is held by the registration or handle put path. */
+	idr_remove(&mtd_idr, mtd->index);
+	device_destroy(&mtd_class, MTD_DEVT(mtd->index) + 1);
 
 	debugfs_remove_recursive(mtd->dbg.dfs_dir);
 
@@ -131,10 +222,8 @@ static void mtd_device_release(struct kref *kref)
 	 *  Should not be done for partition,
 	 *  as it was already destroyed in device_unregister().
 	 */
-	if (!is_partition)
+	if (!is_partition && !managed)
 		memset(&mtd->dev, 0, sizeof(mtd->dev));
-
-	module_put(THIS_MODULE);
 }
 
 #define MTD_DEVICE_ATTR_RO(name) \
@@ -612,7 +701,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.id = NVMEM_DEVID_NONE;
 	config.dev = &mtd->dev;
 	config.name = dev_name(&mtd->dev);
-	config.owner = THIS_MODULE;
+	config.owner = mtd_get_master(mtd)->owner;
 	config.add_legacy_fixed_of_cells = of_device_is_compatible(node, "nvmem-cells");
 	config.reg_read = mtd_nvmem_reg_read;
 	config.size = mtd->size;
@@ -702,10 +791,13 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 
 int add_mtd_device(struct mtd_info *mtd)
 {
+	DECLARE_COMPLETION_ONSTACK(released);
 	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_notifier *not;
 	int i, error, ofidx;
+	u32 id;
+	bool wait_for_release = false;
 
 	/*
 	 * May occur, for instance, on buggy drivers which call
@@ -748,16 +840,28 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (np)
 		ofidx = of_alias_get_id(np, "mtd");
 	if (ofidx >= 0)
-		i = idr_alloc(&mtd_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
+		i = ida_alloc_range(&mtd_ids, ofidx, ofidx, GFP_KERNEL);
 	else
-		i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
+		i = ida_alloc(&mtd_ids, GFP_KERNEL);
 	if (i < 0) {
 		error = i;
 		goto fail_locked;
 	}
+	id = i;
+	error = idr_alloc_u32(&mtd_idr, mtd, &id, id, GFP_KERNEL);
+	if (error) {
+		ida_free(&mtd_ids, i);
+		goto fail_locked;
+	}
 
 	mtd->index = i;
 	kref_init(&mtd->refcnt);
+	if (master->master.release) {
+		mtd_get_lifetime(master);
+		mtd->ref_master = master;
+		if (mtd->parent && mtd->parent != master)
+			get_device(&mtd->parent->dev);
+	}
 
 	/* default value if not set by driver */
 	if (mtd->bitflip_threshold == 0)
@@ -821,7 +925,10 @@ int add_mtd_device(struct mtd_info *mtd)
 	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
 		      "mtd%dro", i);
 
+	/* Keep the release callback loaded until the final device reference. */
+	__module_get(THIS_MODULE);
 	pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
+	mtd->registered = true;
 	/* No need to get a refcount on the module containing
 	   the notifier, since we hold the mtd_table_mutex */
 	list_for_each_entry(not, &mtd_notifiers, list)
@@ -839,29 +946,38 @@ int add_mtd_device(struct mtd_info *mtd)
 		}
 	}
 
-	/* We _know_ we aren't being removed, because
-	   our caller is still holding us here. So none
-	   of this try_ nonsense, and no bitching about it
-	   either. :) */
-	__module_get(THIS_MODULE);
 	return 0;
 
 fail_nvmem_add:
 	device_del(&mtd->dev);
 fail_added:
 	/*
-	 * Clear type and set nop release to prevent mtd_release() ->
+	 * Clear type and override release to prevent mtd_release() ->
 	 * release_mtd_partition() -> free_partition() from freeing mtd.
 	 * The caller handles cleanup on failure.
 	 */
 	mtd->dev.type = NULL;
-	mtd->dev.release = mtd_dev_release_nop;
+	mtd->dev.release = mtd_dev_release_done;
+	dev_set_drvdata(&mtd->dev, &released);
+	wait_for_release = true;
 	put_device(&mtd->dev);
 	of_node_put(mtd_get_of_node(mtd));
 fail_devname:
 	idr_remove(&mtd_idr, i);
+	ida_free(&mtd_ids, i);
+	if (mtd->ref_master) {
+		mtd->ref_master = NULL;
+		if (mtd->parent && mtd->parent != master)
+			put_device(&mtd->parent->dev);
+		mtd_put_lifetime(master);
+	}
 fail_locked:
 	mutex_unlock(&mtd_table_mutex);
+	if (wait_for_release) {
+		wait_for_completion(&released);
+		mtd->dev.release = NULL;
+		dev_set_drvdata(&mtd->dev, mtd);
+	}
 	return error;
 }
 
@@ -882,7 +998,7 @@ int del_mtd_device(struct mtd_info *mtd)
 
 	mutex_lock(&mtd_table_mutex);
 
-	if (idr_find(&mtd_idr, mtd->index) != mtd) {
+	if (idr_find(&mtd_idr, mtd->index) != mtd || !mtd->registered) {
 		ret = -ENODEV;
 		goto out_error;
 	}
@@ -892,6 +1008,7 @@ int del_mtd_device(struct mtd_info *mtd)
 	list_for_each_entry(not, &mtd_notifiers, list)
 		not->remove(mtd);
 
+	mtd->registered = false;
 	kref_put(&mtd->refcnt, mtd_device_release);
 	ret = 0;
 
@@ -952,6 +1069,18 @@ static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
 	return ret == -ENODATA ? 0 : ret;
 }
 
+static void mtd_otp_nvmem_get(void *priv)
+{
+	mtd_get_lifetime(priv);
+	__module_get(THIS_MODULE);
+}
+
+static void mtd_otp_nvmem_put(void *priv)
+{
+	mtd_put_lifetime(priv);
+	module_put(THIS_MODULE);
+}
+
 static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 						   const char *compatible,
 						   int size,
@@ -968,7 +1097,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.dev = mtd->dev.parent;
 	config.name = compatible;
 	config.id = NVMEM_DEVID_AUTO;
-	config.owner = THIS_MODULE;
+	config.owner = mtd->owner;
 	config.add_legacy_fixed_of_cells = !mtd_type_is_nand(mtd);
 	config.type = NVMEM_TYPE_OTP;
 	config.root_only = true;
@@ -977,6 +1106,10 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.size = size;
 	config.of_node = np;
 	config.priv = mtd;
+	if (mtd->master.release) {
+		config.priv_get = mtd_otp_nvmem_get;
+		config.priv_put = mtd_otp_nvmem_put;
+	}
 
 	nvmem = nvmem_register(&config);
 	/* Just ignore if there is no NVMEM support in the kernel */
@@ -1336,6 +1469,9 @@ int __get_mtd_device(struct mtd_info *mtd)
 	struct mtd_info *master = mtd_get_master(mtd);
 	int err;
 
+	if (!mtd->registered)
+		return -ENODEV;
+
 	if (master->_get_device) {
 		err = master->_get_device(mtd);
 		if (err)
@@ -1348,13 +1484,14 @@ int __get_mtd_device(struct mtd_info *mtd)
 		return -ENODEV;
 	}
 
+	mtd_get_lifetime(master);
 	while (mtd) {
 		if (mtd != master)
 			kref_get(&mtd->refcnt);
 		mtd = mtd->parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master->dev.type)
 		kref_get(&master->refcnt);
 
 	return 0;
@@ -1441,6 +1578,7 @@ void __put_mtd_device(struct mtd_info *mtd)
 	struct mtd_info *master = mtd_get_master(mtd);
 	/* master can be freed in _put_device */
 	struct module *owner = master->owner;
+	bool managed = master->master.release;
 
 	while (mtd) {
 		/* kref_put() can relese mtd, so keep a reference mtd->parent */
@@ -1451,12 +1589,14 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master->dev.type)
 		kref_put(&master->refcnt, mtd_device_release);
 
-	/* must be the last use of master */
+	/* Legacy _put_device() callbacks can free an unmanaged master. */
 	if (master->_put_device)
 		master->_put_device(master);
+	if (managed)
+		mtd_put_lifetime(master);
 
 	/* _put_device() runs code from @owner, so drop the module last */
 	module_put(owner);
@@ -2673,6 +2813,7 @@ static void __exit cleanup_mtd(void)
 	bdi_unregister(mtd_bdi);
 	bdi_put(mtd_bdi);
 	idr_destroy(&mtd_idr);
+	ida_destroy(&mtd_ids);
 }
 
 module_init(init_mtd);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..5a1bdae00665 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -187,6 +187,7 @@ struct mtd_pairing_scheme {
 };
 
 struct module;	/* only needed for owner field in mtd_info */
+struct completion;
 
 /**
  * struct mtd_debug_info - debugging information for an MTD device.
@@ -224,6 +225,10 @@ struct mtd_part {
  *		     not only the master partition list, but also all
  *		     sub-partitions.
  * @suspended: set to 1 when the device is suspended, 0 otherwise
+ * @life_refcnt: optional lifetime reference count for the backing object
+ * @release: free the backing object after its last lifetime reference
+ * @release_owner: module reference held during deferred release
+ * @release_done: completion used when the owner module is already unloading
  *
  * This struct is embedded in mtd_info and contains master-specific
  * properties/fields. The master is the root MTD device from the MTD partition
@@ -233,6 +238,10 @@ struct mtd_master {
 	struct mutex partitions_lock;
 	struct mutex chrdev_lock;
 	unsigned int suspended : 1;
+	struct kref life_refcnt;
+	void (*release)(struct mtd_info *mtd);
+	struct module *release_owner;
+	struct completion *release_done;
 };
 
 struct mtd_info {
@@ -380,6 +389,10 @@ struct mtd_info {
 	struct module *owner;
 	struct device dev;
 	struct kref refcnt;
+	/* Protected by mtd_table_mutex; false after del_mtd_device(). */
+	bool registered;
+	/* Lifetime reference held until the device release callback. */
+	struct mtd_info *ref_master;
 	struct mtd_debug_info dbg;
 	struct nvmem_device *nvmem;
 	struct nvmem_device *otp_user_nvmem;
@@ -681,6 +694,9 @@ extern int mtd_device_parse_register(struct mtd_info *mtd,
 #define mtd_device_register(master, parts, nr_parts)	\
 	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
 extern int mtd_device_unregister(struct mtd_info *master);
+void mtd_set_release(struct mtd_info *master,
+		     void (*release)(struct mtd_info *mtd));
+void mtd_put_master(struct mtd_info *master);
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 extern int __get_mtd_device(struct mtd_info *mtd);
 extern void __put_mtd_device(struct mtd_info *mtd);

-- 
2.53.0

