Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C3AC433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 18:22:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB0F9613C8
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 18:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243465AbhDWSWn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 14:22:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55391 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231400AbhDWSWm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 14:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619202124;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Cg55Iw1JXBxapqO9g4AqcatPlphFbJjxV2toSncpADY=;
        b=AuMGq4dMih1eg3ODpenH5GdR43/hnsUZCqM6wzl+EGiW/MaZJYJ9bXI6byDOSRD9B2bnob
        uL5hcD/aie6hjjUm9lRzismzSMQfZXXpblzhqqY0tVEgIl66ArRxoHuDiKhYS5bTjladXd
        k33V4NywtBvbGdI4JmEik3OH0K5kYUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-l6AHCsVFP0q7LVIXbX1L9w-1; Fri, 23 Apr 2021 14:22:02 -0400
X-MC-Unique: l6AHCsVFP0q7LVIXbX1L9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D51E343A3;
        Fri, 23 Apr 2021 18:22:01 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-114-74.rdu2.redhat.com [10.10.114.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 117D7608BA;
        Fri, 23 Apr 2021 18:21:56 +0000 (UTC)
From:   Lyude Paul <lyude@redhat.com>
To:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Thierry Reding <treding@nvidia.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH 0/2] drm/tegra: Fix device/module refs for DP
Date:   Fri, 23 Apr 2021 14:21:44 -0400
Message-Id: <20210423182146.185633-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch series fixes a regression that was introduced by one of the
changes I made to when Tegra registers its AUX adapters, along with
fixing some reference leaks that I found along the way.

			       !!!NOTE!!!

There's one thing I'm not entirely sure about, which is the use of
module references (e.g. try_module_get()) here. If I'm understanding how
this code worked previously: since the get_device call in tegra_sor_probe()
was previously the i2c adapter for the AUX channel - which itself is
initialized in drm_dp_aux_register() - then I -think- that the module
owner for the DDC adapter would likely have been drm_kms_helper. With
these changes, if I'm understanding things correctly we're now just
grabbing a module reference for ourselves - something which might not be
the best idea?

If anyone could confirm if I need to fix this or not that'd be
appreciated, along with reviews of course :P

Lyude Paul (2):
  drm/tegra: Get ref for DP AUX channel, not its ddc adapter
  drm/tegra: Fix DP AUX channel reference leaks

 drivers/gpu/drm/tegra/sor.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.30.2

