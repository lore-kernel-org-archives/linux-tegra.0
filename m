From: Giancarlo Canales <gcanalesb-BUHhN+a2lJ4@public.gmane.org>
Subject: [cbootimage PATCH] tN: if_bct_is_tN_get_soc_config: Adds bounds
 checking to the BCT buffer.
Date: Sat, 04 Jul 2015 20:35:55 -0400
Message-ID: <E8E25517-CD76-4F00-B711-9EC26951C9F9@me.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Checks if the BCT buffer is too small to be a valid `nvboot_config_table`.

Signed-off-by: Giancarlo Canales Barreto <gcanalesb-BUHhN+a2lJ4@public.gmane.org>
---
src/t114/nvbctlib_t114.c | 3 +++
src/t124/nvbctlib_t124.c | 3 +++
src/t132/nvbctlib_t132.c | 3 +++
src/t20/nvbctlib_t20.c   | 3 +++
src/t210/nvbctlib_t210.c | 3 +++
src/t30/nvbctlib_t30.c   | 3 +++
6 files changed, 18 insertions(+)

diff --git a/src/t114/nvbctlib_t114.c b/src/t114/nvbctlib_t114.c
index dad8f4f..df68369 100644
--- a/src/t114/nvbctlib_t114.c
+++ b/src/t114/nvbctlib_t114.c
@@ -1139,6 +1139,9 @@ int if_bct_is_t114_get_soc_config(build_image_context *context,
{
	nvboot_config_table * bct = (nvboot_config_table *) context->bct;

+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;
+
	if (bct->boot_data_version == BOOTDATA_VERSION_T114)
	{
		t114_get_soc_config(context, soc_config);
diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
index 5df93cd..1f6dc05 100644
--- a/src/t124/nvbctlib_t124.c
+++ b/src/t124/nvbctlib_t124.c
@@ -1152,6 +1152,9 @@ int if_bct_is_t124_get_soc_config(build_image_context *context,
{
	nvboot_config_table *bct = (nvboot_config_table *) context->bct;

+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;
+
	if (bct->boot_data_version == BOOTDATA_VERSION_T124) {
		t124_get_soc_config(context, soc_config);
		return 1;
diff --git a/src/t132/nvbctlib_t132.c b/src/t132/nvbctlib_t132.c
index ab5ab34..4e5d31a 100644
--- a/src/t132/nvbctlib_t132.c
+++ b/src/t132/nvbctlib_t132.c
@@ -1233,6 +1233,9 @@ int if_bct_is_t132_get_soc_config(build_image_context *context,
{
	nvboot_config_table *bct = (nvboot_config_table *) context->bct;

+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;
+
	if (bct->boot_data_version == BOOTDATA_VERSION_T132) {
		t132_get_soc_config(context, soc_config);
		return 1;
diff --git a/src/t20/nvbctlib_t20.c b/src/t20/nvbctlib_t20.c
index 4e07bf2..813806f 100644
--- a/src/t20/nvbctlib_t20.c
+++ b/src/t20/nvbctlib_t20.c
@@ -719,6 +719,9 @@ int if_bct_is_t20_get_soc_config(build_image_context *context,
	cbootimage_soc_config **soc_config)
{
	nvboot_config_table * bct = (nvboot_config_table *) context->bct;
+
+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;

	if (bct->boot_data_version == BOOTDATA_VERSION_T20)
	{
diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
index 9921bbb..46da441 100644
--- a/src/t210/nvbctlib_t210.c
+++ b/src/t210/nvbctlib_t210.c
@@ -2306,6 +2306,9 @@ int if_bct_is_t210_get_soc_config(build_image_context *context,
{
	nvboot_config_table *bct = (nvboot_config_table*) context->bct;

+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;
+
	if (bct->boot_data_version == BOOTDATA_VERSION_T210) {
		t210_get_soc_config(context, soc_config);
		return 1;
diff --git a/src/t30/nvbctlib_t30.c b/src/t30/nvbctlib_t30.c
index df3bef0..3590c89 100644
--- a/src/t30/nvbctlib_t30.c
+++ b/src/t30/nvbctlib_t30.c
@@ -927,6 +927,9 @@ int if_bct_is_t30_get_soc_config(build_image_context *context,
{
	nvboot_config_table * bct = (nvboot_config_table *) context->bct;

+	if (context->bct_size < sizeof(nvboot_config_table))
+		return 0;
+
	if (bct->boot_data_version == BOOTDATA_VERSION_T30)
	{
		t30_get_soc_config(context, soc_config);
