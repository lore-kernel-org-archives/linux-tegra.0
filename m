Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A88BC433EF
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Apr 2022 22:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237926AbiDCWzx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 3 Apr 2022 18:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237761AbiDCWzx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 3 Apr 2022 18:55:53 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B41D140D2;
        Sun,  3 Apr 2022 15:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=zDRYhWu2tTNgKAXBhJFHtn2OfOGGinXlPakc33ZktO4=; b=V/+VTiTVN8UP17TN0I/0PwqKZD
        LhFwmhDwbX+TSPuMoJdpy/7tbyHWltAQ3zxvdCTWwbkwDtm/r2yV54lsSEHi1G7rlrAPsndWN7dbu
        lSj+Rj7rzq4O3XSifGUGKwXVcQg6m76wSb6Lkmh//RE9gjIi6vJx5FmG8VSmAz0dsVfOP79/Ipiy4
        t3sEH/gAkUL9n363wpwIo74TAev32eazYOxn5pwmSwyU3g5OZcY++FCi/EKN/F6TOwLS/JNq1fmh7
        5i3MwLjbfAUnjsyzNqZERd1MEGeaxkO+PVZUHjIURfTwW7t8HzZaZo60nYz2SjIzRmmlYpqYymBNe
        SNTqCRCw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nb96Z-00CVFY-5V; Sun, 03 Apr 2022 22:53:55 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-tegra@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] gpu: host1x: fix a kernel-doc warning
Date:   Sun,  3 Apr 2022 15:53:54 -0700
Message-Id: <20220403225354.2492-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add @cache description to eliminate a kernel-doc warning.

include/linux/host1x.h:104: warning: Function parameter or member 'cache' not described in 'host1x_client'

Fixes: 1f39b1dfa53c ("drm/tegra: Implement buffer object cache")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/linux/host1x.h |    1 +
 1 file changed, 1 insertion(+)

--- lnx-518-rc1.orig/include/linux/host1x.h
+++ lnx-518-rc1/include/linux/host1x.h
@@ -81,6 +81,7 @@ struct host1x_client_ops {
  * @parent: pointer to parent structure
  * @usecount: reference count for this structure
  * @lock: mutex for mutually exclusive concurrency
+ * @cache: host1x buffer object cache
  */
 struct host1x_client {
 	struct list_head list;
