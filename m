From: Patrick Georgi <patrick-WyKcznhUmzJg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] cbootimage: allow working with paths that contain '@'
Date: Sat, 12 Mar 2016 12:18:49 +0100
Message-ID: <1457781529-20302-1-git-send-email-patrick@openbios.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pgeorgi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Patrick Georgi <patrick-WyKcznhUmzJg9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Patrick Georgi <patrick-WyKcznhUmzJg9hUCZPvPmw@public.gmane.org>
---
 src/parse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/parse.c b/src/parse.c
index 6f37dad..39d746c 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -249,7 +249,7 @@ parse_filename(char *str, char *name, int chars_remaining)
 	 * Check if the filename buffer is out of space, preserving one
 	 * character to null terminate the string.
 	 */
-	while (isalnum(*str) || strchr("\\/~_-+:.", *str)) {
+	while (isalnum(*str) || strchr("\\/~_-+:.@", *str)) {
 
 		chars_remaining--;
 
-- 
2.6.2
