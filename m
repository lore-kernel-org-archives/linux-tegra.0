Return-Path: <SRS0=iMCN=CY=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D75C2D0E3
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 23:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C484120872
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 23:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbgIOXAb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Sep 2020 19:00:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:36740 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727194AbgIOPCN (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 11:02:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B38F4B195;
        Tue, 15 Sep 2020 15:00:31 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
        tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
        tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
        andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
        xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com,
        sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 17/21] drm/virtgpu: Set PRIME export function in struct drm_gem_object_funcs
Date:   Tue, 15 Sep 2020 16:59:54 +0200
Message-Id: <20200915145958.19993-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
References: <20200915145958.19993-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces virtgpu's per-driver PRIME export
function with a per-object function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c    | 1 -
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index b039f493bda9..1f8d6ed11d21 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -203,7 +203,6 @@ static struct drm_driver driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_mmap = drm_gem_prime_mmap,
-	.gem_prime_export = virtgpu_gem_prime_export,
 	.gem_prime_import = virtgpu_gem_prime_import,
 	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 842f8b61aa89..4f7d7ea8194c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -108,6 +108,7 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.close = virtio_gpu_gem_object_close,
 
 	.print_info = drm_gem_shmem_print_info,
+	.export = virtgpu_gem_prime_export,
 	.pin = drm_gem_shmem_pin,
 	.unpin = drm_gem_shmem_unpin,
 	.get_sg_table = drm_gem_shmem_get_sg_table,
-- 
2.28.0

