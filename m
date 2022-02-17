Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60153C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Feb 2022 19:19:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245094AbiBQTUH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Feb 2022 14:20:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiBQTUG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Feb 2022 14:20:06 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C999CC3C37
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:19:51 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id z22so11469467edd.1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Feb 2022 11:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t5OLgdyOSq3C2fbZ8BWOVpf929s2MamuZQdu8kKbMxg=;
        b=f8KUMQGV24drQ1oxFQa5nPSCJcH34qLfFw5igILtKu+i6C0VLRRvDxH8sHhNU33ABR
         P9lRsIyI8OKEwZTkVrI1Mx7BPLxF3uPuyQ/rSvodAGTDgviKR/pgoJiqRFjKQOIBDuKZ
         cjq4eqLHp0x9bHxawZnLLVKSeFoMZOeWBLl1WEB1xjb3bPhrdRujBMt+VzFpKNh92VxY
         jptELefHv+MesVo60sjzrsFPKG1lX2aICmVbdyIGWHE8wOSIXKcxIUkUKzvebiZIO5TJ
         tES6bZNqw2CGcjksaJIjnhcQD/CI5UyW6YJcSHH4iwuz6enrzBdLwztRpkkZY6IFt2fT
         hR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t5OLgdyOSq3C2fbZ8BWOVpf929s2MamuZQdu8kKbMxg=;
        b=ETt3zHdrK6YPpfqqepjqgWd47jwpPsjvx6xtLBfAoFHaD5+1DPstu5PQ+5shwi4Nn8
         tFHI0OxjMyAuTp2lf8nVx1n9XCJKbfiu8idEb5JiVgEqtA3pNSAR90l0NmiVt+gCtQEI
         +vQ1O7hRx7c4bOIilSb9i468fTMVP9ja/Z2fHzcZ/eaR7K2MmuE3qN+e+RztOY3hza73
         SNWR5090fW8P2uTvnhfE9CsMzpS+TEAAsdwM6ocvU+0PO8gkoIj/NrmcPen6bOfpP+J+
         1fXmNZAjIVZ2Ov/Z30edTslvAPk1cHJ+8hZBemAq6Ii+KD4U/NzW66ZBOFcviNgpT9EJ
         1iMg==
X-Gm-Message-State: AOAM533RrgbvtEQmSU2+KGqjsdoiwLHJ0f7TM8cd+NI7DF/yEi+Bt9Q4
        a/y/3tvLD/6ydtz+ijVDrNE=
X-Google-Smtp-Source: ABdhPJwWPf7A+Dmp/CGUx+j98fHxTt5HIW2mth0V+/ZUKMrSSK/8cyNtQLeBE3EwOgN5T02GyPemcQ==
X-Received: by 2002:aa7:d7d3:0:b0:410:d23b:6746 with SMTP id e19-20020aa7d7d3000000b00410d23b6746mr4312144eds.453.1645125590285;
        Thu, 17 Feb 2022 11:19:50 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
        by smtp.gmail.com with ESMTPSA id u3sm1510856ejz.99.2022.02.17.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:19:49 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm v2 08/25] tegra: Install tegra-openclose test
Date:   Thu, 17 Feb 2022 20:19:14 +0100
Message-Id: <20220217191931.2534836-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191931.2534836-1-thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
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
2.35.1

