From: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [cbootimage-configs PATCH 1/2] post.mk: Add dependency of emmc image on bct file
Date: Mon, 3 Apr 2017 14:25:10 +0200
Message-ID: <20170403122511.7194-1-nikolaus.schulz@avionic-design.de>
References: <8bf27012-af67-3faf-206b-ebd5cd76b276@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8bf27012-af67-3faf-206b-ebd5cd76b276-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Creating an emmc image requires the bct file as a prerequisite.
Add the dependency to post.mk.

Signed-off-by: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 build/post.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/build/post.mk b/build/post.mk
index 979d8ce..809fa2b 100644
--- a/build/post.mk
+++ b/build/post.mk
@@ -26,6 +26,6 @@ image_deps := $(addprefix .,$(addsuffix .d,$(images)))
 %.bct: %.bct.cfg
 	cbootimage -gbct -$(soc) $< $@
 
-%.img: %.img.cfg
+%.img: %.img.cfg $(bcts)
 	../../../build/gen-image-deps.sh $< $@ .$@.d
 	cbootimage -$(soc) $< $@
-- 
2.11.0
