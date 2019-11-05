From: Jamal Shareef <jamal.k.shareef@gmail.com>
Subject: [PATCH 2/3] drm/tegra: dsi: Remove space in open parenthesis
Date: Mon,  4 Nov 2019 18:23:21 -0800
Message-ID: <4357d243bdb0ac22a36f3edb0f08820fbc31348b.1572920482.git.jamal.k.shareef@gmail.com>
References: <cover.1572920482.git.jamal.k.shareef@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1572920482.git.jamal.k.shareef@gmail.com>
In-Reply-To: <cover.1572920482.git.jamal.k.shareef@gmail.com>
References: <cover.1572920482.git.jamal.k.shareef@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: outreachy-kernel@googlegroups.com
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jamal Shareef <jamal.k.shareef@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Removes space after open left parenthesis. Issue found by checkpatch.

Signed-off-by: Jamal Shareef <jamal.k.shareef@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 60 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index a5d47e301c5f..5966d33831e4 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -283,32 +283,32 @@ static void tegra_dsi_early_unregister(struct drm_connector *connector)
  * non-burst mode with sync pulses
  */
 static const u32 pkt_seq_video_non_burst_sync_pulses[NUM_PKT_SEQ] = {
-	[ 0] = PKT_ID0(MIPI_DSI_V_SYNC_START) | PKT_LEN0(0) |
+	[0] = PKT_ID0(MIPI_DSI_V_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_BLANKING_PACKET) | PKT_LEN1(1) |
 	       PKT_ID2(MIPI_DSI_H_SYNC_END) | PKT_LEN2(0) |
 	       PKT_LP,
-	[ 1] = 0,
-	[ 2] = PKT_ID0(MIPI_DSI_V_SYNC_END) | PKT_LEN0(0) |
+	[1] = 0,
+	[2] = PKT_ID0(MIPI_DSI_V_SYNC_END) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_BLANKING_PACKET) | PKT_LEN1(1) |
 	       PKT_ID2(MIPI_DSI_H_SYNC_END) | PKT_LEN2(0) |
 	       PKT_LP,
-	[ 3] = 0,
-	[ 4] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
+	[3] = 0,
+	[4] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_BLANKING_PACKET) | PKT_LEN1(1) |
 	       PKT_ID2(MIPI_DSI_H_SYNC_END) | PKT_LEN2(0) |
 	       PKT_LP,
-	[ 5] = 0,
-	[ 6] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
+	[5] = 0,
+	[6] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_BLANKING_PACKET) | PKT_LEN1(1) |
 	       PKT_ID2(MIPI_DSI_H_SYNC_END) | PKT_LEN2(0),
-	[ 7] = PKT_ID0(MIPI_DSI_BLANKING_PACKET) | PKT_LEN0(2) |
+	[7] = PKT_ID0(MIPI_DSI_BLANKING_PACKET) | PKT_LEN0(2) |
 	       PKT_ID1(MIPI_DSI_PACKED_PIXEL_STREAM_24) | PKT_LEN1(3) |
 	       PKT_ID2(MIPI_DSI_BLANKING_PACKET) | PKT_LEN2(4),
-	[ 8] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
+	[8] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_BLANKING_PACKET) | PKT_LEN1(1) |
 	       PKT_ID2(MIPI_DSI_H_SYNC_END) | PKT_LEN2(0) |
 	       PKT_LP,
-	[ 9] = 0,
+	[9] = 0,
 	[10] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_BLANKING_PACKET) | PKT_LEN1(1) |
 	       PKT_ID2(MIPI_DSI_H_SYNC_END) | PKT_LEN2(0),
@@ -321,26 +321,26 @@ static const u32 pkt_seq_video_non_burst_sync_pulses[NUM_PKT_SEQ] = {
  * non-burst mode with sync events
  */
 static const u32 pkt_seq_video_non_burst_sync_events[NUM_PKT_SEQ] = {
-	[ 0] = PKT_ID0(MIPI_DSI_V_SYNC_START) | PKT_LEN0(0) |
+	[0] = PKT_ID0(MIPI_DSI_V_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_END_OF_TRANSMISSION) | PKT_LEN1(7) |
 	       PKT_LP,
-	[ 1] = 0,
-	[ 2] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
+	[1] = 0,
+	[2] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_END_OF_TRANSMISSION) | PKT_LEN1(7) |
 	       PKT_LP,
-	[ 3] = 0,
-	[ 4] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
+	[3] = 0,
+	[4] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_END_OF_TRANSMISSION) | PKT_LEN1(7) |
 	       PKT_LP,
-	[ 5] = 0,
-	[ 6] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
+	[5] = 0,
+	[6] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_BLANKING_PACKET) | PKT_LEN1(2) |
 	       PKT_ID2(MIPI_DSI_PACKED_PIXEL_STREAM_24) | PKT_LEN2(3),
-	[ 7] = PKT_ID0(MIPI_DSI_BLANKING_PACKET) | PKT_LEN0(4),
-	[ 8] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
+	[7] = PKT_ID0(MIPI_DSI_BLANKING_PACKET) | PKT_LEN0(4),
+	[8] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_END_OF_TRANSMISSION) | PKT_LEN1(7) |
 	       PKT_LP,
-	[ 9] = 0,
+	[9] = 0,
 	[10] = PKT_ID0(MIPI_DSI_H_SYNC_START) | PKT_LEN0(0) |
 	       PKT_ID1(MIPI_DSI_BLANKING_PACKET) | PKT_LEN1(2) |
 	       PKT_ID2(MIPI_DSI_PACKED_PIXEL_STREAM_24) | PKT_LEN2(3),
@@ -348,16 +348,16 @@ static const u32 pkt_seq_video_non_burst_sync_events[NUM_PKT_SEQ] = {
 };
 
 static const u32 pkt_seq_command_mode[NUM_PKT_SEQ] = {
-	[ 0] = 0,
-	[ 1] = 0,
-	[ 2] = 0,
-	[ 3] = 0,
-	[ 4] = 0,
-	[ 5] = 0,
-	[ 6] = PKT_ID0(MIPI_DSI_DCS_LONG_WRITE) | PKT_LEN0(3) | PKT_LP,
-	[ 7] = 0,
-	[ 8] = 0,
-	[ 9] = 0,
+	[0] = 0,
+	[1] = 0,
+	[2] = 0,
+	[3] = 0,
+	[4] = 0,
+	[5] = 0,
+	[6] = PKT_ID0(MIPI_DSI_DCS_LONG_WRITE) | PKT_LEN0(3) | PKT_LP,
+	[7] = 0,
+	[8] = 0,
+	[9] = 0,
 	[10] = PKT_ID0(MIPI_DSI_DCS_LONG_WRITE) | PKT_LEN0(5) | PKT_LP,
 	[11] = 0,
 };
-- 
2.17.1
