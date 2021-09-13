Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D133C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 16:42:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2497E60F6C
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 16:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238580AbhIMQoL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 12:44:11 -0400
Received: from mail-co1nam11on2049.outbound.protection.outlook.com ([40.107.220.49]:48672
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238639AbhIMQoI (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 12:44:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvaC6YZNaamAJimenPyqyVikdRRhnlw6p6CnVclmeXi+TF31O5aB0dYn5O3N6PKnknQYskPfH7Z6u4iqIZ0Vheq/tjnHZVsU0H+8KjRtoj4j2rbdP962cv0LSFLb38oFPu9fqm9x4HgH/mE1yPJhauFMAIMNN0nP9T6+sXP+wsY8FCNJMsQFOvW6tgBCJgBaiUkJeaWh/iLGbhKlEFebUJbqh0knvTfa+eIDrcjtXlntOlJlg8vp5nj/3Wth+YLtFDiSTSekDWAzBmxrqeL9791ZatSFaCHBL3c9v8qnVNidpAUyBKYikpQIQ9aWvrxoyXrqwPBV99pCwE/Y+lD1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=iFTbsDkuVYP2/LwOBrQPr7RlWjy5g8Fmm212SeVfETo=;
 b=cI405Nbt7VgD/lV/lHbqT8ZS+ilQsJxVbkbrGr9gaYOCiZAOYyHW0mWQ0lU1aigsXGgPfulLZGAXCw16pf1iACG2+whwQSMTHN9rG92nWCvgjvuKy+XZNImA8nmDTdLj+9EhuBhOprv/A8tWBDmNbynRIEopiYu4rw4nISX01W3KaJpNQ8UQnGJDFwFHHr9yNfKT8XxWlY/cGs/pTA9KUjlCW3otDNZuN4MFH/PEvW1Bt32SK98f6pGo5Upzons32e52c6vCVWmcGffy/7wO1iBNlYwdf1RqfXKRwHxwF42dRu9VxxblKQXDRXmgouqNIXAneIQD86EW+G1kI4uVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFTbsDkuVYP2/LwOBrQPr7RlWjy5g8Fmm212SeVfETo=;
 b=WGZVvxmnJgnSLqhqc8ML9alBPXgQm8sQWMCa+K8oNe10cG54+gegRdjXGvP8U1N3RPtlLaMIgxxnRQqJ+nSdEEespOrIavSUh2Z8JgVSyxA7iuR6hQ5QMEu04kFS3XgW/sUAIm6FymB7k3n0T/xMKs5i/hGvRSxrzUHb91Y8fcAXV5ptBn+9UIyrR8MMjy6xgyXJxqfnjn3Tr9V9brVwFqQf59CZNk7FmOr8kZtdd9v2VYfHUS3Wy4YXfigUJ3pHHz+9nsUr77m/tlNcd02bavI4vjrxJCZ0kGsmbheTxy3Q8edLnA5EVc9Ww95EFl3AS+KxcDk21VnVfUj0pIpDZA==
Received: from DM6PR03CA0051.namprd03.prod.outlook.com (2603:10b6:5:100::28)
 by BN9PR12MB5226.namprd12.prod.outlook.com (2603:10b6:408:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:42:49 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::3b) by DM6PR03CA0051.outlook.office365.com
 (2603:10b6:5:100::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:42:48 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 16:42:46 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:43 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
CC:     <sharadg@nvidia.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
Date:   Mon, 13 Sep 2021 22:12:09 +0530
Message-ID: <1631551342-25469-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 113a2fc6-5e0d-4475-cd3a-08d976d58546
X-MS-TrafficTypeDiagnostic: BN9PR12MB5226:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5226201C8B908FAE4A6F99A6A7D99@BN9PR12MB5226.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YOl4AFnxzbkpBnUGQmZcH6zbPU6ZW+t9fKpIKG3ZEe+CnYNcOmtOq67iRCaTB1WtQTr77riB/fji0GJDvLVNruJiP9MhAK/bDrmq+r2D3ygBwtitF4vArVqBdcvDStK0FR6o8YttA4wfEpGYvXccBFK6laITcupk/iN8S0Lc4uuwtIFtinLADwrksIvpxhkBZ3Bb+ZzrDKz4ZKFr3oCGJE+kp5nd0mfF9yZTGdJZGu/Y6Xd+ZRLEC5xKjfyuwmVUWii8o29mhtJ76cC/7OD8ZPwM0+ByS3MOemAfFd/AkYlr+z/uZS6KZq9SLS04vWX3G7XWeavjc1bwKkk3zQqQIuIrCKoaxnFlsWzaBDGM5QRwYmJsOZn08LyHekWPtBGKzcQ8kCwQTZeheBL33YBpqi1xPcXWlnJvYwkiJzVWf7goaDrJ9F3MF9jxTUMGe5bx+8/iXD+vFDcViKwygeY2hNII4mDeEHdZoBYMrLeCt7ujqpKEFOWQ06UiHIll5iR2Hxf55y5hFT0H/i+0hqthJLbCtU4lS4wZiHwa/P82qUDrb9uFewoghs6bjdfZNJ26jXlQiNUMqtzjCsGYzsZn8GwMqf/+l92sHQ1Z4RdbSFM7BNHprU5rJYLqX6EbjCvyTWkpohEo2MslRhJnN+mSFKSj04jouYYeJAXyN+yBXlvITXysXRUwNk6ChkkkJvgvIehgLvgAqy7MzqPpmYrypxTZoG95mlzbvlBvNdfxPw8=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(54906003)(7696005)(6666004)(110136005)(336012)(4326008)(7636003)(86362001)(8676002)(478600001)(356005)(36860700001)(47076005)(316002)(36906005)(2616005)(426003)(36756003)(7416002)(82740400003)(82310400003)(5660300002)(8936002)(70586007)(107886003)(83380400001)(70206006)(921005)(2906002)(26005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:42:48.3428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113a2fc6-5e0d-4475-cd3a-08d976d58546
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5226
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In some cases, multiple FE components have the same BE component in their
respective DPCM paths. One such example would be a mixer component, which
can receive two or more inputs and sends a mixed output. In such cases,
to avoid reconfiguration of already active DAI (mixer output DAI in this
case), check the BE stream state to filter out the redundancy.

In summary, allow connection of BE if the respective current stream state
is either NEW or CLOSED.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 48f71bb..e30cb5a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1395,6 +1395,10 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		if (!fe->dpcm[stream].runtime && !fe->fe_compr)
 			continue;
 
+		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
+		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
+			continue;
+
 		/* newly connected FE and BE */
 		err = dpcm_be_connect(fe, be, stream);
 		if (err < 0) {
-- 
2.7.4

