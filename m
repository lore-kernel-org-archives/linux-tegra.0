From: "Scott Duplichan" <scott-CDj6QYrFEYEdnm+yROfE0A@public.gmane.org>
Subject: [cbootimage PATCH] cbootimage: Add 'b' (binary) flag when using fopen to open a binary file.
Date: Sun, 14 Dec 2014 10:59:51 -0600
Message-ID: <000f01d017bf$61e0cfe0$25a26fa0$@notabs.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-us
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add 'b' (binary) flag when using fopen to open a binary file.
This keeps Windows from expanding \n to \r\n and interpreting
<ctrl>z as end of file. The change is to support a Windows
hosted coreboot build environment.

Signed-off-by: Scott Duplichan <scott-CDj6QYrFEYEdnm+yROfE0A@public.gmane.org>
---
diff --git a/src/set.c b/src/set.c
index 0af6686..e8ae3dd 100644
--- a/src/set.c
+++ b/src/set.c
@@ -53,7 +53,7 @@ read_from_image(char	*filename,
 	FILE *fp;
 	struct stat stats;
 
-	fp = fopen(filename, "r");
+	fp = fopen(filename, "rb");
 	if (fp == NULL) {
 		result = 1;
 		return result;
-- 
