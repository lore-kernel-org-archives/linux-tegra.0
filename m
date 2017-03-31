From: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] post.mk: Create dependency makefile by makefile rule
Date: Fri, 31 Mar 2017 16:49:54 +0200
Message-ID: <20170331144954.14269-1-nikolaus.schulz@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Creating the emmc image requires creating the bct file and the
bootloader image first.  These dependencies are written to a makefile
snippet that is created by the gen-image-deps.sh script.  But that
script is only invoked when the rule that creates the emmc image is run,
which is too late for creating the dependencies makefile.

Add a rule to post.mk that tells make how to create the dependencies
makefile; with that in place, make automatically makes the dependency
makefile before executing any other rules.

Signed-off-by: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 build/post.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/build/post.mk b/build/post.mk
index 0e1c766..37550bd 100644
--- a/build/post.mk
+++ b/build/post.mk
@@ -21,13 +21,14 @@ bcts: $(bcts)
 images: $(images)
 
 image_deps := $(addprefix .,$(addsuffix .d,$(images)))
+$(image_deps): .%.d : %.cfg
+	../../../build/gen-image-deps.sh $< $(@:.%.d=%) $@
 -include $(image_deps)
 
 %.bct: %.bct.cfg
 	cbootimage -gbct -$(soc) $< $@
 
 %.img: %.img.cfg
-	../../../build/gen-image-deps.sh $< $@ .$@.d
 	cbootimage -$(soc) $< $@
 
 %.simg: %.img $(skb)
-- 
2.1.4
