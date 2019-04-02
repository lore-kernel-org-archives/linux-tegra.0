From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 16/16] staging: media: tegra-vde: add proper SPDX identifiers
 on file that did not have it.
Date: Tue,  2 Apr 2019 12:32:03 +0200
Message-ID: <20190402103203.14959-17-gregkh@linuxfoundation.org>
References: <20190402103203.14959-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190402103203.14959-1-gregkh@linuxfoundation.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: devel@driverdev.osuosl.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There was a single file for the tegra-vde driver that did not have SPDX
identifiers on it, so fix that up.  At the same time, remove the "free
form" text that specified the license of the file, as that is impossible
for any tool to properly parse.

Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/media/tegra-vde/uapi.h | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/uapi.h b/drivers/staging/media/tegra-vde/uapi.h
index 4bce08a7a54c..a0dad1ed94ef 100644
--- a/drivers/staging/media/tegra-vde/uapi.h
+++ b/drivers/staging/media/tegra-vde/uapi.h
@@ -1,12 +1,5 @@
-/*
- * Copyright (C) 2016-2017 Dmitry Osipenko <digetx@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version
- * 2 of the License, or (at your option) any later version.
- */
-
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (C) 2016-2017 Dmitry Osipenko <digetx@gmail.com> */
 #ifndef _UAPI_TEGRA_VDE_H_
 #define _UAPI_TEGRA_VDE_H_
 
-- 
2.21.0
