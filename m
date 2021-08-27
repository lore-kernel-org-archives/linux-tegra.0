Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A4FC432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B00D604AC
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245452AbhH0NYT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245436AbhH0NYQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:16 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DFEC0613CF
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:27 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b6so10356025wrh.10
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8YwLI+CQi4XoGtQP+jSI8Zav9RLk/yd1Ntp9TAc05U4=;
        b=Z+DC3oA9ukgoYpGazul+lzTz590lx5Kvo+cNG0jbmiigS9B5j33k9SpTE2hPVDsATF
         kzDHwUb9bWklRjF2IKXjb9XTCGgyk/eSsDVlOb0DfHQgaQuftyZ7E6qtc9vPOQSd4m/d
         C0NthKVLYRxt1AJstI2ye2tMdmpOLBc1z1D/jilnCHC7BexKow55lXVYSM6ZmNmdO32P
         TaT9gHP2eGe8rbyZtRziAkOZCs+JndbBo1tUROX21P1aG6zxrLcKCVpCQD9iuuK/2CHK
         dH+z7y/Fbj+ZYnENyMnQxZF2YOe5sZKijWmFMMHhkWJyFFClPB742TrJI0WU7ot32sqI
         5u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8YwLI+CQi4XoGtQP+jSI8Zav9RLk/yd1Ntp9TAc05U4=;
        b=O5vJp+A1voqDFF8vFj80+8erDh+Laidm8aZL5YOo+176bR4jTFcDboiTISVNmktJnW
         aH9bVlk0ZGAEdl5vN9srPx1JOIH3thf4p0rdfIyVWFlGX4z/5vkVnBOfMCVhtO59z0AM
         QlNL2scGFjmanwvzGwvUgz0HJahN/f4viHMsOW/kVY0FZHgk78NK7qhuc5ZOawoBPD88
         oDR+B89A7E5su2iJvYmNyhBc8sifSxd4RW3crPeSFWHrut/PnKzYxWMWPWlmAv+yasDi
         Lz0ziTyBM+vr3d+mkGIyEyxqH12NX44N/WxhlXAhHsEMYcBc26BCKHEeIyupPAtgUYzV
         XdkQ==
X-Gm-Message-State: AOAM531ZVx8kCpVFSkT67egqAlrjDL5hbMsBY37V5+yBw1uUgYY/OFlP
        heFK05ID5YUVFa5GnAjQ3eY=
X-Google-Smtp-Source: ABdhPJyVhIgPY7KUHXU2mM2rHcB/ojog7zoCTI4bFyC26YpvzUSxWh5zQZBEYD03gV5kxu482iPSTg==
X-Received: by 2002:a5d:4410:: with SMTP id z16mr10385083wrq.110.1630070606427;
        Fri, 27 Aug 2021 06:23:26 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d145sm11134339wmd.3.2021.08.27.06.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 08/25] tegra: Install tegra-openclose test
Date:   Fri, 27 Aug 2021 15:22:48 +0200
Message-Id: <20210827132305.3572077-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Allow this simple test to be installed so that it can easily be run on a
target device.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/.gitignore  | 2 +-
 tests/tegra/meson.build | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/tegra/.gitignore b/tests/tegra/.gitignore
index 5c5216c5c5e6..56cfb62b785f 100644
--- a/tests/tegra/.gitignore
+++ b/tests/tegra/.gitignore
@@ -1 +1 @@
-openclose
+tegra-openclose
diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 4f8c54f41553..fbf4e6d8d4a3 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -18,10 +18,13 @@
 # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 # SOFTWARE.
 
+inc_tegra = include_directories('../../tegra')
+
 openclose = executable(
-  'openclose',
+  'tegra-openclose',
   files('openclose.c'),
-  include_directories : [inc_root, inc_drm, include_directories('../../tegra')],
+  include_directories : [inc_root, inc_drm, inc_tegra],
   c_args : libdrm_c_args,
   link_with : [libdrm, libdrm_tegra],
+  install : with_install_tests,
 )
-- 
2.32.0

