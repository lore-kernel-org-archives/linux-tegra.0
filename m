Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCD0C7EE2E
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Jun 2023 09:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240274AbjFMJfi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jun 2023 05:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241991AbjFMJfY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jun 2023 05:35:24 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2088.outbound.protection.outlook.com [40.107.212.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E666A18E
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 02:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhGMG3A8VKWgpHnrsGgMRaW1neKlOBqR1uSGSRadryW/QrogMWuVuJFtvRXbXaeAdIMn154nANFnkbayQ9BqtTpYEFhy825ZuphmMTs9Ntx4HgsPVbfwhkmRyGk4Tuf6IiCN+4/3qjmkr4L9GWHqo3QpGSpyC+DQO7JbsGAF4EWRWLB57m7DN+eLUu9nNo9gBf4ibh0VEKWP7EwjN0Pv0wqY058YsssnXqQr6aAfMU+/8503OSIe6znr5PWXfDu0rsBSl1nTpKSnH10iAC3PIXf9oogjYtlz/mzqx8hUe7QF7dMPQ9qqVCAkFzxjFd4vit6yda48JBAFWhoIpVbOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3Io9K83WgrGdpAvw7nNzrnGpVxSEopATy8d9VeVB/E=;
 b=lEgasJne52nQ1kGqO5Rh5t2Zr1Rj67TefQqsW1shV1Uk/bR54J2t3AlYqyZsa/7DM/UzOmlYFqBTTB8ikr2M8fn5QkRsXQ0cItj8aoujTfK+6QqzI50zockcZp6tekm9nLl8q2t5ejwjmCB3tzJ+CDmPnQCCtKjRMCpDPx1YpOrQNzSaGwOycQylYketCgruSJNWCHDY+D6bFjrCoVZ/l3tHzeiH/EGyB/4Np0b3/Eyp/XmSS8rpjTHVCfuclW1Nx5qoWnDU3H89p+A8ja70B6SaezPnn8McCFvWMLC6AlA8RbPwBQ+5i5frdMfwO4AhFwuDG7vEdJwBLzFklR/DlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3Io9K83WgrGdpAvw7nNzrnGpVxSEopATy8d9VeVB/E=;
 b=hUfGOfUQyxze0T8aUPxA30NMSi/bkgDvltfJ1TSAX02AJMG41U1rxqHiyfk8Fm6PxK4BoRvGRLylLzSK4I4bZvhY7O51IIbxcRUFVpsY+EPun97rwqtiCw2udLbUpbehyN/dWV8IQ5ujr3nZcECjsk+1ebVrwA0zRx5YKgYVLHS6alu9kJgOrvwXpv5rZWRb7XspWFU1tu6Fl5MgTXOkEXkKvJcPPcVdLp8IXoB4/9B5eY//aNsdx9xocxMvsJ36ty/276HmPZCsXObl7XANwB0kVaRGovzdq9ktpyUQx/6FkCNwcQ/WW1/aoFMskOi1D9Oys9PVH4HASBb6PWjKbQ==
Received: from MW4PR04CA0320.namprd04.prod.outlook.com (2603:10b6:303:82::25)
 by IA0PR12MB8975.namprd12.prod.outlook.com (2603:10b6:208:48f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 09:35:19 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::3d) by MW4PR04CA0320.outlook.office365.com
 (2603:10b6:303:82::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.35 via Frontend
 Transport; Tue, 13 Jun 2023 09:35:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Tue, 13 Jun 2023 09:35:18 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 13 Jun 2023
 02:35:07 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 13 Jun
 2023 02:35:07 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Tue, 13 Jun 2023 02:35:05 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "Thierry Reding" <thierry.reding@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        "Oswald Buddenhagen" <oswald.buddenhagen@gmx.de>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ASoC: tegra: Fix Master Volume Control
Date:   Tue, 13 Jun 2023 10:34:53 +0100
Message-ID: <20230613093453.13927-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT047:EE_|IA0PR12MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f53fe2-8a33-45c3-d50d-08db6bf18089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTW7EBgEsZ684ctDnzybxqp9QA44Gphlp5MH1WZWgrPpHWcmMbSIN7Chh75zTQAKSYLnbDBY1A97X1dWUiEtrRV+NARk6ytmMIzJRhFoeJFTbBGSfYU8PWsr2FfIxHTuJu2qCo5fzRPnaCc6+utOi7q4OtNfEJnxtOsA0Pmj4swyoQj98IS1iiYcJpmABvB78Q25wLzl5HhfsmMG+xzC1JO3RK7iP81XyqlZD8gd21rkOT2K7pEyaixYSZWj7bn0LGCBGK8vvP4OUToA/Z/lmcyJs2KSFTyGRxX+mWpiiwEZRuvTkcP1W3CbpqhlseQ3M0NjiXGLCw7+yNH0iGJCj/iybnBO9ZKwlG6dD5WIroARpbSnZHah613tGLTjcg0XDDMRcczXfFz6dDJafBSPX8A1ovRqzRkQ8/k/3/WuGQ1qDiMNaV4rEEaIyKYE3EwISHY9Ohne6ebqt96i0mUrtWiTTlKH2XwWhMr9RlK3Y72rFus4hZi+yAD5aDH/jxc/3lrwLmf7+6dMEmsaQcB9VUNL/Xcdr+pDYvdmfGtM5Pg2EFpyN6iwgv5H/93RJECfEvNHr6Gs+TFR5ZZMctzFx4wGYjwE7LgfgSw7ydvh6lzpjPG/b5ar9KRJpgwhdSUFRDWVZToLF7KAe9U7OEK5lpfJEu8lR56/UNYrGl3TIXn+Nfdv4cOHOTE3EQK63F4FNDtcE7WC7WsoPw5e8kFNQ7dRBjZD+9bs165NEoaJDxQ=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(107886003)(36860700001)(7696005)(6666004)(47076005)(336012)(36756003)(426003)(2616005)(82310400005)(86362001)(7636003)(26005)(1076003)(356005)(82740400003)(186003)(40480700001)(54906003)(8676002)(110136005)(2906002)(8936002)(41300700001)(316002)(4744005)(5660300002)(4326008)(6636002)(70586007)(70206006)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 09:35:18.9301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f53fe2-8a33-45c3-d50d-08db6bf18089
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8975
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations") corrected
the PCM wait_time calculations and in doing so reduced the calculated
wait_time. This exposed an issue with the Tegra Master Volume Control
(MVC) device where the reduced wait_time caused the MVC to fail. For now
fix this by setting the default wait_time for Tegra to be 500ms.

Fixes: 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/soc/tegra/tegra_pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 468c8e77de21..0b69cebc9a33 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -117,6 +117,9 @@ int tegra_pcm_open(struct snd_soc_component *component,
 		return ret;
 	}
 
+	/* Set wait time to 500ms by default */
+	substream->wait_time = 500;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_open);
-- 
2.34.1

