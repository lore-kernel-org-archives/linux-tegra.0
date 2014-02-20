From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/3] drm/tegra: Relicense under GPL v2
Date: Thu, 20 Feb 2014 16:48:11 +0100
Message-ID: <1392911292-6438-3-git-send-email-thierry.reding@gmail.com>
References: <1392911292-6438-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1392911292-6438-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Emil Goode <emilgoode@gmail.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The majority of the code in this driver is licensed under the GPL v2, so
relicense the rest under GPL v2 as well for consistency.

Acked-by: Stephen Warren <swarren@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c      | 20 +++-----------------
 drivers/gpu/drm/tegra/dsi.h      | 20 +++-----------------
 drivers/gpu/drm/tegra/gem.c      | 11 +++--------
 drivers/gpu/drm/tegra/gem.h      | 14 +++-----------
 drivers/gpu/drm/tegra/mipi-phy.c | 20 +++-----------------
 drivers/gpu/drm/tegra/mipi-phy.h | 20 +++-----------------
 6 files changed, 18 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index bdca68651612..8163b77a41ee 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1,23 +1,9 @@
 /*
  * Copyright (C) 2013 NVIDIA Corporation
  *
- * Permission to use, copy, modify, distribute, and sell this software and its
- * documentation for any purpose is hereby granted without fee, provided that
- * the above copyright notice appear in all copies and that both that copyright
- * notice and this permission notice appear in supporting documentation, and
- * that the name of the copyright holders not be used in advertising or
- * publicity pertaining to distribution of the software without specific,
- * written prior permission.  The copyright holders make no representations
- * about the suitability of this software for any purpose.  It is provided "as
- * is" without express or implied warranty.
- *
- * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
- * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
- * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
- * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
- * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
- * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
- * OF THIS SOFTWARE.
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
  */
 
 #include <linux/clk.h>
diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
index 00e79c1f448c..1db5cc24ea91 100644
--- a/drivers/gpu/drm/tegra/dsi.h
+++ b/drivers/gpu/drm/tegra/dsi.h
@@ -1,23 +1,9 @@
 /*
  * Copyright (C) 2013 NVIDIA Corporation
  *
- * Permission to use, copy, modify, distribute, and sell this software and its
- * documentation for any purpose is hereby granted without fee, provided that
- * the above copyright notice appear in all copies and that both that copyright
- * notice and this permission notice appear in supporting documentation, and
- * that the name of the copyright holders not be used in advertising or
- * publicity pertaining to distribution of the software without specific,
- * written prior permission.  The copyright holders make no representations
- * about the suitability of this software for any purpose.  It is provided "as
- * is" without express or implied warranty.
- *
- * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
- * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
- * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
- * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
- * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
- * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
- * OF THIS SOFTWARE.
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
  */
 
 #ifndef DRM_TEGRA_DSI_H
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 29913eb9b25d..bcf9895cef9f 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -8,14 +8,9 @@
  *
  * Copyright (c) 2011 Samsung Electronics Co., Ltd.
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version 2
- * of the License, or (at your option) any later version.
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
  */
 
 #include <linux/dma-buf.h>
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index ffd4f792b410..2f3fe96c5154 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -3,17 +3,9 @@
  *
  * Copyright (c) 2012-2013, NVIDIA Corporation.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
  */
 
 #ifndef __HOST1X_GEM_H
diff --git a/drivers/gpu/drm/tegra/mipi-phy.c b/drivers/gpu/drm/tegra/mipi-phy.c
index e2c4aedaee78..486d19d589c8 100644
--- a/drivers/gpu/drm/tegra/mipi-phy.c
+++ b/drivers/gpu/drm/tegra/mipi-phy.c
@@ -1,23 +1,9 @@
 /*
  * Copyright (C) 2013 NVIDIA Corporation
  *
- * Permission to use, copy, modify, distribute, and sell this software and its
- * documentation for any purpose is hereby granted without fee, provided that
- * the above copyright notice appear in all copies and that both that copyright
- * notice and this permission notice appear in supporting documentation, and
- * that the name of the copyright holders not be used in advertising or
- * publicity pertaining to distribution of the software without specific,
- * written prior permission.  The copyright holders make no representations
- * about the suitability of this software for any purpose.  It is provided "as
- * is" without express or implied warranty.
- *
- * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
- * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
- * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
- * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
- * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
- * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
- * OF THIS SOFTWARE.
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
  */
 
 #include <linux/errno.h>
diff --git a/drivers/gpu/drm/tegra/mipi-phy.h b/drivers/gpu/drm/tegra/mipi-phy.h
index d3591694432d..012ea8ac36d7 100644
--- a/drivers/gpu/drm/tegra/mipi-phy.h
+++ b/drivers/gpu/drm/tegra/mipi-phy.h
@@ -1,23 +1,9 @@
 /*
  * Copyright (C) 2013 NVIDIA Corporation
  *
- * Permission to use, copy, modify, distribute, and sell this software and its
- * documentation for any purpose is hereby granted without fee, provided that
- * the above copyright notice appear in all copies and that both that copyright
- * notice and this permission notice appear in supporting documentation, and
- * that the name of the copyright holders not be used in advertising or
- * publicity pertaining to distribution of the software without specific,
- * written prior permission.  The copyright holders make no representations
- * about the suitability of this software for any purpose.  It is provided "as
- * is" without express or implied warranty.
- *
- * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
- * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
- * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
- * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
- * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
- * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
- * OF THIS SOFTWARE.
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
  */
 
 #ifndef DRM_TEGRA_MIPI_PHY_H
-- 
1.8.4.2
