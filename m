Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A699C433E1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 22:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85BDF61A3F
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 22:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhCZWAh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 18:00:37 -0400
Received: from mga04.intel.com ([192.55.52.120]:61331 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230411AbhCZWAQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 18:00:16 -0400
IronPort-SDR: nlcwVEHsnz3A61lSDlL2Xz7I5X0wsLQ/3TKqQ/H5jJpQ5IiVQhSh0uD1ntEbi3zVsGERH9ttkA
 MWV2KXGk3+EQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="188957144"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; 
   d="scan'208";a="188957144"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 15:00:16 -0700
IronPort-SDR: 15zBF2Zfwe4jsAAkx5TiwFWzQ65OMD/8NbSxh7zKIyLnQR5RUNkA3CZWPBgdgymVZC+MVu8ZfI
 xc3/H++oqpng==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; 
   d="scan'208";a="416706901"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com) ([10.255.231.203])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 15:00:14 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: [PATCH 13/17] ASoC: tegra: tegra20_das: align function prototypes
Date:   Fri, 26 Mar 2021 16:59:23 -0500
Message-Id: <20210326215927.936377-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

cppcheck warnings:

sound/soc/tegra/tegra20_das.c:35:40: style:inconclusive: Function
'tegra20_das_connect_dap_to_dac' argument 1 names different:
declaration 'dap_id' definition 'dap'. [funcArgNamesDifferent]

int tegra20_das_connect_dap_to_dac(int dap, int dac)
                                       ^
sound/soc/tegra/tegra20_das.h:98:47: note: Function
'tegra20_das_connect_dap_to_dac' argument 1 names different:
declaration 'dap_id' definition 'dap'.
extern int tegra20_das_connect_dap_to_dac(int dap_id, int dac_sel);
                                              ^
sound/soc/tegra/tegra20_das.c:35:40: note: Function
'tegra20_das_connect_dap_to_dac' argument 1 names different:
declaration 'dap_id' definition 'dap'.
int tegra20_das_connect_dap_to_dac(int dap, int dac)
                                       ^
sound/soc/tegra/tegra20_das.c:35:49: style:inconclusive: Function
'tegra20_das_connect_dap_to_dac' argument 2 names different:
declaration 'dac_sel' definition 'dac'. [funcArgNamesDifferent]
int tegra20_das_connect_dap_to_dac(int dap, int dac)
                                                ^
sound/soc/tegra/tegra20_das.h:98:59: note: Function
'tegra20_das_connect_dap_to_dac' argument 2 names different:
declaration 'dac_sel' definition 'dac'.
extern int tegra20_das_connect_dap_to_dac(int dap_id, int dac_sel);
                                                          ^
sound/soc/tegra/tegra20_das.c:35:49: note: Function 'tegra20_das_connect_dap_to_dac' argument 2 names different: declaration 'dac_sel' definition 'dac'.
int tegra20_das_connect_dap_to_dac(int dap, int dac)
                                                ^
sound/soc/tegra/tegra20_das.c:53:40: style:inconclusive: Function
'tegra20_das_connect_dap_to_dap' argument 1 names different:
declaration 'dap_id' definition 'dap'. [funcArgNamesDifferent]
int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
                                       ^
sound/soc/tegra/tegra20_das.h:108:47: note: Function
'tegra20_das_connect_dap_to_dap' argument 1 names different:
declaration 'dap_id' definition 'dap'.
extern int tegra20_das_connect_dap_to_dap(int dap_id, int other_dap_sel,
                                              ^
sound/soc/tegra/tegra20_das.c:53:40: note: Function
'tegra20_das_connect_dap_to_dap' argument 1 names different:
declaration 'dap_id' definition 'dap'.
int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
                                       ^
sound/soc/tegra/tegra20_das.c:53:49: style:inconclusive: Function
'tegra20_das_connect_dap_to_dap' argument 2 names different:
declaration 'other_dap_sel' definition
'otherdap'. [funcArgNamesDifferent]
int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
                                                ^
sound/soc/tegra/tegra20_das.h:108:59: note: Function
'tegra20_das_connect_dap_to_dap' argument 2 names different:
declaration 'other_dap_sel' definition 'otherdap'.
extern int tegra20_das_connect_dap_to_dap(int dap_id, int other_dap_sel,
                                                          ^
sound/soc/tegra/tegra20_das.c:53:49: note: Function
'tegra20_das_connect_dap_to_dap' argument 2 names different:
declaration 'other_dap_sel' definition 'otherdap'.
int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
                                                ^
sound/soc/tegra/tegra20_das.c:75:40: style:inconclusive: Function
'tegra20_das_connect_dac_to_dap' argument 1 names different:
declaration 'dac_id' definition 'dac'. [funcArgNamesDifferent]
int tegra20_das_connect_dac_to_dap(int dac, int dap)
                                       ^
sound/soc/tegra/tegra20_das.h:118:47: note: Function
'tegra20_das_connect_dac_to_dap' argument 1 names different:
declaration 'dac_id' definition 'dac'.
extern int tegra20_das_connect_dac_to_dap(int dac_id, int dap_sel);
                                              ^
sound/soc/tegra/tegra20_das.c:75:40: note: Function
'tegra20_das_connect_dac_to_dap' argument 1 names different:
declaration 'dac_id' definition 'dac'.
int tegra20_das_connect_dac_to_dap(int dac, int dap)
                                       ^
sound/soc/tegra/tegra20_das.c:75:49: style:inconclusive: Function
'tegra20_das_connect_dac_to_dap' argument 2 names different:
declaration 'dap_sel' definition 'dap'. [funcArgNamesDifferent]
int tegra20_das_connect_dac_to_dap(int dac, int dap)
                                                ^
sound/soc/tegra/tegra20_das.h:118:59: note: Function
'tegra20_das_connect_dac_to_dap' argument 2 names different:
declaration 'dap_sel' definition 'dap'.
extern int tegra20_das_connect_dac_to_dap(int dac_id, int dap_sel);
                                                          ^
sound/soc/tegra/tegra20_das.c:75:49: note: Function
'tegra20_das_connect_dac_to_dap' argument 2 names different:
declaration 'dap_sel' definition 'dap'.
int tegra20_das_connect_dac_to_dap(int dac, int dap)
                                                ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/tegra/tegra20_das.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.h b/sound/soc/tegra/tegra20_das.h
index d22abc4d08e6..18e832ded73a 100644
--- a/sound/soc/tegra/tegra20_das.h
+++ b/sound/soc/tegra/tegra20_das.h
@@ -95,7 +95,7 @@ struct tegra20_das {
  * dap_id: DAP to connect: TEGRA20_DAS_DAP_ID_*
  * dac_sel: DAC to connect to: TEGRA20_DAS_DAP_SEL_DAC*
  */
-extern int tegra20_das_connect_dap_to_dac(int dap_id, int dac_sel);
+extern int tegra20_das_connect_dap_to_dac(int dap, int dac);
 
 /*
  * Connect a DAP to another DAP
@@ -105,7 +105,7 @@ extern int tegra20_das_connect_dap_to_dac(int dap_id, int dac_sel);
  * sdata1rx: Is this DAP's SDATA1 pin RX (1) or TX (0)
  * sdata2rx: Is this DAP's SDATA2 pin RX (1) or TX (0)
  */
-extern int tegra20_das_connect_dap_to_dap(int dap_id, int other_dap_sel,
+extern int tegra20_das_connect_dap_to_dap(int dap, int otherdap,
 					  int master, int sdata1rx,
 					  int sdata2rx);
 
@@ -115,6 +115,6 @@ extern int tegra20_das_connect_dap_to_dap(int dap_id, int other_dap_sel,
  * dac_id: DAC ID to connect: TEGRA20_DAS_DAC_ID_*
  * dap_sel: DAP to receive input from: TEGRA20_DAS_DAC_SEL_DAP*
  */
-extern int tegra20_das_connect_dac_to_dap(int dac_id, int dap_sel);
+extern int tegra20_das_connect_dac_to_dap(int dac, int dap);
 
 #endif
-- 
2.25.1

