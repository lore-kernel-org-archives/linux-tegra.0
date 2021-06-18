Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025DBC49EA3
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 13:44:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC8A861159
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 13:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233893AbhFRNrG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 09:47:06 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:65332 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231855AbhFRNrG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 09:47:06 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15IDhrhY010803;
        Fri, 18 Jun 2021 13:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=FluAY6HgIzMDqkeeKmecM2WfpkpmZL6tgXmZI0hFMgU=;
 b=scjwU88SHNObbORJ+sYovhCb8iDxbzrcREmqBkDWDAStwot+DBW9x17+yz7mFSGp9G8a
 ff+U5xH1jFpcI31wA7VhvtjgjOVERZN5CqdVJFnWBq1loDyqTMxvlEDArj/8b5xjpfap
 hnrHj+SSn3ytRi2ImMAD+TpU5L/hvbiTxCHs72YCjFwBdgxr78+tfvRy9Zkii5TZ4wD1
 Scxn63pc42k8VAfC5STQozCy69xucyyPOvsjNYkd9m0B0sirm6exxfPRvZWWREcypW7J
 n9PGtvS0RLTPv73nwICfhpUaW8hUVHW8ClvxIG8A9jVa3fjtfHWC0VQ4CGofLzuQDxLH GQ== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 397w1y398h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 13:44:37 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15IDiarG103154;
        Fri, 18 Jun 2021 13:44:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 396waxy563-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 13:44:36 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15IDiahj103133;
        Fri, 18 Jun 2021 13:44:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 396waxy55k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 13:44:36 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15IDiXLW016901;
        Fri, 18 Jun 2021 13:44:33 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 18 Jun 2021 13:44:32 +0000
Date:   Fri, 18 Jun 2021 16:44:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ion Agorria <ion@agorria.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: tegra: Fix a NULL vs IS_ERR() check
Message-ID: <YMyjOKFsPe9SietU@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: RudKXr0sEGZo39jcPkSRPU__TXjDmtST
X-Proofpoint-GUID: RudKXr0sEGZo39jcPkSRPU__TXjDmtST
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra_machine_parse_phandle() function doesn't return NULL, it returns
error pointers.

Fixes: cc8f70f56039 ("ASoC: tegra: Unify ASoC machine drivers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index a53aec361a77..735909310a26 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -409,7 +409,7 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 		return PTR_ERR(np_codec);
 
 	np_i2s = tegra_machine_parse_phandle(dev, "nvidia,i2s-controller");
-	if (!np_i2s)
+	if (IS_ERR(np_i2s))
 		return PTR_ERR(np_i2s);
 
 	card->dai_link->cpus->of_node = np_i2s;
-- 
2.30.2

