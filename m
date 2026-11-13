Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586737;
	b=Gu6Q4TgwfhrYNVLLVCZ/gb8D0sdHBb7lGEy0MEZhhxNpPkCYWbR0rgPvVH0hx11uckom
	 pD/XfP0MBNc/veGwCUzCggZgcpiJ4zqbrhYi3VKS8yOwZmrpDMEc0eJw4Y57NrFIwIiob
	 c5wD9sOP1m9XDjR7ycRiz6h3dFWIO8bxgzi1Y13Y5RBJwFS+v59ALgf52/XomFV41HK0g
	 Fs2OugaDL3C8OuTFjImm0Ij9yxJv5bEwbBhD7bn7fAI/eb70M+BSTMQbtm69Ac06JRErX
	 /Iq8yBPAQgsHCLsBsG5bBtPUcv9nS+kmIOgrAYYibGiyF5NdSTgOBqWWRAKrf5UzHRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hswu/8zR7bhRbfqGAjoZk+uLKvEBL7DKTwwlfCAGB9Q=;
	b=yBCFIcKR7IqGuRA5XkOIpuDT6a6/tRp7cF6gTC7Vb8QxO27Gc7f7Fz50DLJKI/l6+N0/
	 +Xeqw4ESB996CJgdx9fEcwik6VhkVlWhS6yIz+N0g8XRRIH7xAr/8p4cHyfvsftuH/NZG
	 t7L0MbfkmVSuFASF4mW6JPoHPtr//S89Dp69aByg+HED8FztaH4RI0NFdi+U/PO8X3BwF
	 xRL4S3XoR9pgJ9lx/BnNc2A2CSMWdBP/4c3kBWDJEAI8kHYCg6A7Uu1fG7Zwk2hzCP0rr
	 NktuWlZbJl825rD5EiqmYHu2G7suqDV9g4A00GaSuR0npCm7EIbZ1/5It9m9olEo5tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETyUOPD1;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A35A60A2638
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 16:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A35A60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETyUOPD1
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d58c50743so209418866b.1
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 08:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586736; x=1795191536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hswu/8zR7bhRbfqGAjoZk+uLKvEBL7DKTwwlfCAGB9Q=;
        b=ETyUOPD12VTiYDzHiw9qU/ivcbGXOkDrf1bAnc9NjK4sd0XdWNk9CkeSFewmZNQfml
         oLwp3IbkcyYZty8RZENmI7+9sbWT5/mPjU1cuQNrjX5OZfeI6nlmpbCSZCs7B8iCDh07
         L8Y+s3Lk8nUCpVqnO/idSGZ0p1+uBUphsqWyJ4egrIQ+cc+TjQwzNir3/R4yDE+oyI8V
         MAyjjcIWgGlNCkxJ7pKg9jpKTnwb0wukHjqmqFwzOI5sHvTz0lsGO1ed2fJQJhA9+WSV
         sJhMYhHqlbkQAI1ViQICTHlZMxUM7uT7XAQowaw+TuXAybVX/nEz0+fZy5Yp6SDb0wYJ
         1OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586736; x=1795191536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hswu/8zR7bhRbfqGAjoZk+uLKvEBL7DKTwwlfCAGB9Q=;
        b=ISkn4eBOaxGcIOt6HD5y0AXbZtr7YqVaYwN3cdOvvjhjx5CgAXvbEr9bxVs38yaRL8
         fs6wPoPIXQyd7ql7VUT5XFQL6512TCuv14VkZJWLs+JbggHDGWzYY2FfD+xtnQ5j31Qn
         TTLa4b6f08R3LWLyg+W6jyyR5Cq7g3H4175ymmKCbDYO2Vfrq4sL8qOrt4LYtR9KJij1
         0yONMbcDd5ZaVUJoSFxpl5iWPAdda7pVXrNxlUmpyLSgKfPvz1AwuZDtGxFFB8fBAcpQ
         bfKEbOAPIHgA+1y326zpGtwXRtZFc/59C57UQMSFyl0PHcex7wkWFc60uf/VQoni8Zat
         og9g==
X-Forwarded-Encrypted: i=1; AL+hErF9jAlGBvses1E6em77jd7+qJ1WEDyqQRzc5D5p21eo6YFyPpwR/nXDeffMvxBVAcxwBKxmXvwJpHmdIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Td3pZA4Musinrlm74MNOYtDFzTKqHigsoGpnxpl/UdQLssKy9
	FWJxmtMsYN5fFvIorpep4yF9YDxG3bWmMUZvr2FUxltprpZen2A8Whhh
X-Gm-Gg: AYBFou1l8f5jUv9MNJ8qgkKsAqZnLlsST2/61lR3S6aWamIC/bZ8ajlpa8hYQKFnNCn
	DOgEbKdyPBF+XRUBza0W6TS3cx71pBXaWq8avGf1N1CsNHAM+VwHHkgW9TrX5Dwz8/BHt5dVp6f
	FjnCvPaJX0URTZ6n4mLQKBWda5scs6/s8m/OXy/vTkQoUmgjJ9xWq9b5cRqMDt2TfhbDGGbXWUz
	t/HpV+T6nrSpqFZc06bcR3besEnwocKTNnM8GwVLYV/nm0SKQFTA2/AT8Gb34LO5FDUOCnuJEDl
	yTRlIwOizXT08Q6yYEtdbS6QVIOGkDVoEuNCm2DglOb3XoSAzjRFOzFIY9g4w3FIrcz2bTPAUIE
	WvfXdmMIh7TXwv5mdDo7Epzr1udhH+ZcMEchOn6fH52YkhA/XDr449rWrRZLwcphQ7cuxbPnO8R
	wHcvCKOqzKejm/aV6bEeaBdzKnDcDfgEfflGQI3hFjEh4bNu89+fDY4QnV+9PdkkJDveuKIakwy
	vmk+hw+szm4MDphLCGHJKx75aLb4EH7mGCtjN/cOvRCCgRolwyEBQq24dYCgP3PvzqZx86uscEo
	GOivH/lyPzle2x9/KYGwIk3Y7yXZ3+XO9Pj3mWYyCsfTalzqMvzE/BLtNUgWHNR3SitOCZ/Rx3M
	xGX5KxT+TUg==
X-Received: by 2002:a17:907:3f20:b0:c49:df95:f0dc with SMTP id a640c23a62f3a-c509641085bmr283939866b.19.1794586735569;
        Fri, 13 Nov 2026 08:18:55 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 08/10] media: tegra-video: Add CSI support for Tegra114
Date: Fri, 13 Nov 2026 18:18:17 +0200
Message-ID: <20261113161819.36847-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VI implementation used in previous generations is fully compatible
with Tegra114 and remains hardware revision 1, making this a relatively
small patch. Tegra114 supports a higher maximum VI clock frequency of
408 MHz, meaning the Tegra30 compatible cannot be used as a fallback.

The CSI block in Tegra114 is more advanced than the one in Tegra30. It
has three additional lane clocks, both CSI A and B ports have two CIL
pads per port, and the MIPI calibration logic has been moved into a
dedicated block. The Tegra114 CSI also supports an additional CSI-C
output, but since there are no known hardware configurations using it,
it is omitted due to a lack of test hardware.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../platform/nvidia/tegra-video/Makefile      |   1 +
 .../media/platform/nvidia/tegra-video/csi.c   |   3 +
 .../media/platform/nvidia/tegra-video/csi.h   |   6 +
 .../platform/nvidia/tegra-video/tegra20.c     | 149 ++++++++++++++++--
 .../platform/nvidia/tegra-video/tegra210.c    |   1 +
 .../media/platform/nvidia/tegra-video/vi.c    |   3 +
 .../media/platform/nvidia/tegra-video/vi.h    |   3 +
 .../media/platform/nvidia/tegra-video/video.c |   4 +
 8 files changed, 156 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/Makefile b/drivers/media/platform/nvidia/tegra-video/Makefile
index 96380b5dbd8bb..787496ad2f442 100644
--- a/drivers/media/platform/nvidia/tegra-video/Makefile
+++ b/drivers/media/platform/nvidia/tegra-video/Makefile
@@ -7,5 +7,6 @@ tegra-video-objs := \
 
 tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  += tegra20.o
+tegra-video-$(CONFIG_ARCH_TEGRA_114_SOC) += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index 5a5fca378ae64..126dc65731aad 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -877,6 +877,9 @@ static const struct of_device_id tegra_csi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra30-csi", .data = &tegra30_csi_soc },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_114_SOC)
+	{ .compatible = "nvidia,tegra114-csi", .data = &tegra114_csi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/csi.h b/drivers/media/platform/nvidia/tegra-video/csi.h
index f0277cb424469..ec669f4a9997e 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.h
+++ b/drivers/media/platform/nvidia/tegra-video/csi.h
@@ -121,6 +121,8 @@ struct tegra_csi_ops {
  * @num_clks: total clocks count
  * @tpg_frmrate_table: csi tpg frame rate table with blanking intervals
  * @tpg_frmrate_table_size: size of frame rate table
+ * @has_paired_cil: indicates that cil pads are paired per port, this is
+ *		    specific for Tegra114 where each port has 2 cil pads
  */
 struct tegra_csi_soc {
 	const struct tegra_csi_ops *ops;
@@ -130,6 +132,7 @@ struct tegra_csi_soc {
 	unsigned int num_clks;
 	const struct tpg_framerate *tpg_frmrate_table;
 	unsigned int tpg_frmrate_table_size;
+	bool has_paired_cil;
 };
 
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
@@ -138,6 +141,9 @@ extern const struct tegra_csi_soc tegra20_csi_soc;
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_csi_soc tegra30_csi_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_114_SOC)
+extern const struct tegra_csi_soc tegra114_csi_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_csi_soc tegra210_csi_soc;
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
index f27ecb1ba29a7..41dd5c2d098ce 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra20.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra20.c
@@ -217,8 +217,21 @@ enum tegra_vi_out {
 #define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
 #define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
 #define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
+#define       CSI_C_PHY_CIL_NOP				(0x0 << 20)
+#define       CSI_C_PHY_CIL_ENABLE			(0x1 << 20)
+#define       CSI_C_PHY_CIL_DISABLE			(0x2 << 20)
+#define       CSI_C_PHY_CIL_ENABLE_MASK			(0x3 << 20)
+#define       CSI_D_PHY_CIL_NOP				(0x0 << 24)
+#define       CSI_D_PHY_CIL_ENABLE			(0x1 << 24)
+#define       CSI_D_PHY_CIL_DISABLE			(0x2 << 24)
+#define       CSI_D_PHY_CIL_ENABLE_MASK			(0x3 << 24)
+#define       CSI_E_PHY_CIL_NOP				(0x0 << 28)
+#define       CSI_E_PHY_CIL_ENABLE			(0x1 << 28)
+#define       CSI_E_PHY_CIL_DISABLE			(0x2 << 28)
+#define       CSI_E_PHY_CIL_ENABLE_MASK			(0x3 << 28)
 #define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)
 #define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE		BIT(5)
+#define       CSI_DEFAULT_CLOCK_SETTLE_TIME		0x5
 #define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS		0x0078
 #define TEGRA_CSI_CSI_CIL_STATUS			0x007c
 #define       CSI_MIPI_AUTO_CAL_DONE			BIT(15)
@@ -262,6 +275,19 @@ enum tegra_vi_out {
 #define       CSI_PAD_TERM_REF(n)			(((n) & 0x7) << 0)
 #define TEGRA_CSI_CSI_CILA_STATUS			0x00d8
 #define TEGRA_CSI_CSI_CILB_STATUS			0x00dc
+#define TEGRA_CSI_CSI_CILC_STATUS			0x00e4
+#define TEGRA_CSI_CSI_CILD_STATUS			0x00e8
+#define TEGRA_CSI_PHY_CILC_CONTROL0			0x00f8
+#define TEGRA_CSI_PHY_CILD_CONTROL0			0x00fc
+#define TEGRA_CSI_PHY_CILE_CONTROL0			0x010c
+#define TEGRA_CSI_CSI_CIL_STATUS_2			0x0110
+#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK_2		0x0114
+#define TEGRA_CSI_CILC_PAD_CONFIG0			0x0128
+#define TEGRA_CSI_CILC_PAD_CONFIG1			0x012c
+#define TEGRA_CSI_CILD_PAD_CONFIG0			0x0130
+#define TEGRA_CSI_CILD_PAD_CONFIG1			0x0134
+#define TEGRA_CSI_CILE_PAD_CONFIG0			0x0138
+#define TEGRA_CSI_CILE_PAD_CONFIG1			0x013c
 
 /* --------------------------------------------------------------------------
  * Read and Write helpers
@@ -876,6 +902,17 @@ const struct tegra_vi_soc tegra30_vi_soc = {
 	.has_h_v_flip = true,
 };
 
+const struct tegra_vi_soc tegra114_vi_soc = {
+	.video_formats = tegra20_video_formats,
+	.nformats = ARRAY_SIZE(tegra20_video_formats),
+	.default_video_format = &tegra20_video_formats[0],
+	.ops = &tegra30_vi_ops,
+	.hw_revision = 1,
+	.vi_max_channels = 2,
+	.vi_max_clk_hz = 408000000,
+	.has_h_v_flip = true,
+};
+
 /* --------------------------------------------------------------------------
  * MIPI Calibration
  */
@@ -1003,6 +1040,8 @@ static const struct tegra_mipi_ops tegra20_mipi_ops = {
  */
 static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_chan)
 {
+	struct tegra_csi *csi = csi_chan->csi;
+
 	tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, 0);
 	tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL, 0);
 
@@ -1018,6 +1057,11 @@ static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_chan)
 	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
 	tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
 
+	if (csi->soc->has_paired_cil) {
+		tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS_2, 0);
+		tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK_2, 0);
+	}
+
 	tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
 			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
 			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
@@ -1028,6 +1072,7 @@ static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *csi_chan,
 					    u8 portno)
 {
 	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&csi_chan->subdev);
+	struct tegra_csi *csi = csi_chan->csi;
 	int width  = vi_chan->format.width;
 	int height = vi_chan->format.height;
 	u32 data_type = vi_chan->fmtinfo->img_dt;
@@ -1061,9 +1106,30 @@ static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *csi_chan,
 	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0);
 	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port), 0);
 	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port), 0);
-	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0);
-	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0);
-	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0);
+
+	if (csi->soc->has_paired_cil) {
+		if (port == PORT_A) {
+			tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0);
+			tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0);
+			tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0);
+
+			tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port + 1), 0);
+			tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port + 1), 0);
+			tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port + 1), 0);
+		} else {
+			tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CILC_CONTROL0, 0);
+			tegra20_csi_write(csi_chan, TEGRA_CSI_CILC_PAD_CONFIG0, 0);
+			tegra20_csi_write(csi_chan, TEGRA_CSI_CILC_PAD_CONFIG1, 0);
+
+			tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CILD_CONTROL0, 0);
+			tegra20_csi_write(csi_chan, TEGRA_CSI_CILD_PAD_CONFIG0, 0);
+			tegra20_csi_write(csi_chan, TEGRA_CSI_CILD_PAD_CONFIG1, 0);
+		}
+	} else {
+		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0);
+		tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0);
+		tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0);
+	}
 
 	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + port)); /* CSI_PP_YUV422 */
 
@@ -1097,9 +1163,18 @@ static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *csi_chan,
 			  CSI_SKIP_PACKET_THRESHOLD(0x3f) |
 			  (csi_chan->numlanes - 1));
 
-	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
-			  CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
-			  0x5); /* Clock settle time */
+	value = CSI_CONTINUOUS_CLOCK_MODE_ENABLE | CSI_DEFAULT_CLOCK_SETTLE_TIME;
+	if (csi->soc->has_paired_cil) {
+		if (port == PORT_A) {
+			tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), value);
+			tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port + 1), value);
+		} else {
+			tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CILC_CONTROL0, value);
+			tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CILD_CONTROL0, value);
+		}
+	} else {
+		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), value);
+	}
 
 	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(port),
 			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
@@ -1111,8 +1186,18 @@ static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *csi_chan,
 			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
 			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
 
-	value = (port == PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_DISABLE :
-		CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
+	if (csi->soc->has_paired_cil) {
+		if (port == PORT_A)
+			value = CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_ENABLE |
+				CSI_C_PHY_CIL_DISABLE | CSI_D_PHY_CIL_DISABLE;
+		else
+			value = CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_DISABLE |
+				CSI_C_PHY_CIL_ENABLE | CSI_D_PHY_CIL_ENABLE;
+	} else {
+		value = (port == PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_DISABLE :
+			CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
+	}
+
 	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
 
 	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
@@ -1141,17 +1226,34 @@ static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel *csi_chan,
 	dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
 	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
 
+	if (csi->soc->has_paired_cil) {
+		value = tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS_2);
+		dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS_2 0x%08x\n", value);
+		tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS_2, value);
+	}
+
 	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
 			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
 			  CSI_PP_DISABLE);
 
-	if (csi_chan->numlanes == 4) {
-		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
-				  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_DISABLE);
-	} else {
-		value = (port == PORT_A) ? CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_NOP :
-			CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
+	if (csi->soc->has_paired_cil) {
+		if (port == PORT_A)
+			value = CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_DISABLE |
+				CSI_C_PHY_CIL_NOP | CSI_D_PHY_CIL_NOP;
+		else
+			value = CSI_A_PHY_CIL_NOP | CSI_B_PHY_CIL_NOP |
+				CSI_C_PHY_CIL_DISABLE | CSI_D_PHY_CIL_DISABLE;
+
 		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
+	} else {
+		if (csi_chan->numlanes == 4) {
+			tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
+					  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_DISABLE);
+		} else {
+			value = (port == PORT_A) ? CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_NOP :
+				CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
+			tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
+		}
 	}
 }
 
@@ -1199,6 +1301,7 @@ const struct tegra_csi_soc tegra20_csi_soc = {
 	.csi_max_channels = 2, /* CSI-A and CSI-B */
 	.clk_names = tegra20_csi_clks,
 	.num_clks = ARRAY_SIZE(tegra20_csi_clks),
+	.has_paired_cil = false,
 };
 
 static const char * const tegra30_csi_clks[] = {
@@ -1213,6 +1316,24 @@ const struct tegra_csi_soc tegra30_csi_soc = {
 	.csi_max_channels = 2, /* CSI-A and CSI-B */
 	.clk_names = tegra30_csi_clks,
 	.num_clks = ARRAY_SIZE(tegra30_csi_clks),
+	.has_paired_cil = false,
+};
+
+static const char * const tegra114_csi_clks[] = {
+	"csi",
+	"csia-pad",
+	"csib-pad",
+	"cilab",
+	"cilcd",
+	"cile",
+};
+
+const struct tegra_csi_soc tegra114_csi_soc = {
+	.ops = &tegra20_csi_ops,
+	.csi_max_channels = 2, /* CSI-A and CSI-B */
+	.clk_names = tegra114_csi_clks,
+	.num_clks = ARRAY_SIZE(tegra114_csi_clks),
+	.has_paired_cil = true,
 };
 
 /* --------------------------------------------------------------------------
diff --git a/drivers/media/platform/nvidia/tegra-video/tegra210.c b/drivers/media/platform/nvidia/tegra-video/tegra210.c
index a6606768fa036..bedba5cafc897 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra210.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra210.c
@@ -1217,4 +1217,5 @@ const struct tegra_csi_soc tegra210_csi_soc = {
 	.num_clks = ARRAY_SIZE(tegra210_csi_cil_clks),
 	.tpg_frmrate_table = tegra210_tpg_frmrate_table,
 	.tpg_frmrate_table_size = ARRAY_SIZE(tegra210_tpg_frmrate_table),
+	.has_paired_cil = false,
 };
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 0228a11013b05..3f02405da7386 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1968,6 +1968,9 @@ static const struct of_device_id tegra_vi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra30-vi",  .data = &tegra30_vi_soc },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_114_SOC)
+	{ .compatible = "nvidia,tegra114-vi", .data = &tegra114_vi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index ff5c9deed4c88..71b21434cf1ff 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -298,6 +298,9 @@ extern const struct tegra_vi_soc tegra20_vi_soc;
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vi_soc tegra30_vi_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_114_SOC)
+extern const struct tegra_vi_soc tegra114_vi_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_vi_soc tegra210_vi_soc;
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/video.c b/drivers/media/platform/nvidia/tegra-video/video.c
index d483fb709d127..55c17e7c930a2 100644
--- a/drivers/media/platform/nvidia/tegra-video/video.c
+++ b/drivers/media/platform/nvidia/tegra-video/video.c
@@ -132,6 +132,10 @@ static const struct of_device_id host1x_video_subdevs[] = {
 	{ .compatible = "nvidia,tegra30-csi", },
 	{ .compatible = "nvidia,tegra30-vi", },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_114_SOC)
+	{ .compatible = "nvidia,tegra114-csi", },
+	{ .compatible = "nvidia,tegra114-vi", },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
 	{ .compatible = "nvidia,tegra210-vi", },
-- 
2.53.0

