From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH 2/3] Export several parsing functions for external use
Date: Tue, 28 Jan 2014 15:24:16 +0800
Message-ID: <1390893857-18716-2-git-send-email-vinceh@nvidia.com>
References: <1390893857-18716-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390893857-18716-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/parse.c | 14 +++-----------
 src/parse.h |  7 +++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/src/parse.c b/src/parse.c
index 92490b8c5768..ac2c183595f1 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -43,20 +43,12 @@ set_array(build_image_context *context,
 			u_int32_t index,
 			parse_token token,
 			u_int32_t value);
-static char *parse_u32(char *str, u_int32_t *val);
 static char *parse_u8(char *str, u_int32_t *val);
 static char *parse_filename(char *str, char *name, int chars_remaining);
 static char *parse_enum(build_image_context *context,
 			char *str,
 			enum_item *table,
 			u_int32_t *val);
-static char
-*parse_field_name(char *rest, field_item *field_table, field_item **field);
-static char
-*parse_field_value(build_image_context *context,
-			char *rest,
-			field_item *field,
-			u_int32_t *value);
 static int
 parse_array(build_image_context *context, parse_token token, char *rest);
 static int
@@ -115,7 +107,7 @@ static parse_item s_top_level_items[] = {
  * @param val	Returns value that was parsed
  * @return the remainder of the string after the number was parsed
  */
-static char *
+char *
 parse_u32(char *str, u_int32_t *val)
 {
 	u_int32_t value = 0;
@@ -206,7 +198,7 @@ parse_filename(char *str, char *name, int chars_remaining)
  * @param field      	Returns the field item that was parsed
  * @return NULL or the remainder of the string after the field item was parsed
  */
-static char
+char
 *parse_field_name(char *rest, field_item *field_table, field_item **field)
 {
 	u_int32_t i;
@@ -245,7 +237,7 @@ static char
  * @param value	Returns the value that was parsed
  * @return the remainder of the string after the value was parsed
  */
-static char
+char
 *parse_field_value(build_image_context *context,
 			char *rest,
 			field_item *field,
diff --git a/src/parse.h b/src/parse.h
index 239946c7fa7a..17bb3b90781b 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -921,4 +921,11 @@ extern parse_subfield_item s_device_type_table_t30[];
 extern parse_subfield_item s_device_type_table_t114[];
 extern parse_subfield_item s_device_type_table_t124[];
 
+char *parse_u32(char *str, u_int32_t *val);
+char *parse_field_name(char *rest, field_item *field_table, field_item **field);
+char *parse_field_value(build_image_context *context,
+			char *rest,
+			field_item *field,
+			u_int32_t *value);
+
 #endif /* #ifndef INCLUDED_PARSE_H */
-- 
1.8.1.5
