Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793131336;
	b=iRd/WHa7wLLgjP2LjyyB48phH7787AE5VOzZzP+RQzO4ovlUUwjQpVbTCqSpr0WmM4c5
	 0dx4BC3sq+GJ+TryDyOCb1AUsp2bYCTPttGoWTRcVR98UtwvAWyjrvYmMM0fMW0nQk9o2
	 Nq0RlEivJxlRg5O6ZVryw/LJhmDLlQHZ6mgrUt5zkt0ExKK59Qy+colG98xWBuDEqtwn9
	 QDR2q/opwCuKiluHryG8SkBWoE7Fu+SfcQq/dXc0MMM2C9BgFEcfuboqYYqEBx4eafJB4
	 12F8OTxgvm87kQovuQgRYHoPMbLTKE924EBVN7d0GkucEa02iZDSsirdUV5NAxfmLIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131336;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=o+rqJL14S27vLzq7K2ISYjv7xcKdh37Obdxzvx8Mjfw=;
	b=qUfyAe6FN4UkclUfdOMV7P8SbbfwyBSWwk3FrPwmzbHXZrY0dUhcmh89SPRgqjzkO8iE
	 b05leRhWpDMkjrX4mSTYJhifu85Bmsyy8ERG6xUWG7iqn372TDfjvi/UUBYmcjEupbs2N
	 NceM0LfhixvIrS1Q2cmN7+0cjtPJVTUkuuQzwUWaNAjnToVztDKC4TTNY8yVyWY6dM7Gk
	 gvZ+ynptKnAAJ3i/0uBQEF5Nako1E5A8AoqiGD25m1EayySTkRyUbQU8wdBPIK1Hj1VRe
	 Qqx5Dw7M+NvK7GOZzZterTiGwzTJDGnXBi7ggDu7jwwRKZ3n0r35yKMMPKKSEVVqtTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QCu0xzki;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.18
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD60606A31D;
	Tue, 27 Oct 2026 20:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD60606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QCu0xzki
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1kVrotWNWzYiQ07yx6gqddLz4NgBAPLBjcanJ0qWmbFe2YlZHW5ihYrtuxeCXiiVlCOo8u8PPJJ5BirhImofjAtakOBxpqNChqNYqwUsEmm9FCDDHYv0AbtE4BLmd8EkkmnTS04Pa7qKaW9lkRFGM69psbIrUe3v9VAuvf7q9txEXJiYkWveiyTxrd67usn4dPccxik+zhVKBa4AgjMfCphooKeP4TNUahoF+xDsln8UhPRI3Qj5/ctUcfLn52T79zin1mEQuzE+5oDKzW5iM/GA/DXAFzk88ExN/lRybxk4kgVIitqxARVckGizxCYsDrdP2duoA4Y/G8mR9VMXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+rqJL14S27vLzq7K2ISYjv7xcKdh37Obdxzvx8Mjfw=;
 b=KGGrxXe24UULGgd6vvydAolv1Daoo01ajqWrRS1UyTHXsnb65vBd5W1Z0+Aih4anAysoHizs4GVaJpKMrz0w/BmrSmdR1xEMCDtbyA2VVTCvEJ7LwYy0CwzIHzGy2uzNHAshWNMZlC0qKzrAx+ZZdZRB6ICOmOxcXzdE/4YC9Vg7Y8xdK+Xgyn2eeFpgxscGiitqLdA1UXp21uPZ8yB4AJdKP1jcZ4qNqK8PIaPp79ECsEFkwuHEYSApIGS/DuNJzVlBm5OZZQQEVdnDcyp9F4GDfbIFa6WBejucG/x4D13AjYsP7cSWGFs9fJAMkjzT4sR0Ie4+wTsra+vTcLjiJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+rqJL14S27vLzq7K2ISYjv7xcKdh37Obdxzvx8Mjfw=;
 b=QCu0xzki9DYF9mjbNYlPCrPeBXoWsLgMLBfq53Gq5J7ZKt5nG2YxcCFz5TUMjVJt9xXWrAovGZk7dB11dS7ajbvQ6m8jv3bJ9f6/C2UEoJmTIfZb7RHje3B2hrt+9mk8Gx2Iwz7WXeptsKqj1ub5Xdu0J8xnt4AnZPMIDWC3556xzBU6ZKa9T6WUfBpNEVa7P/2kfi/lHAtc7LowoIvyb1paJMt18gFI8Y9atyCyCPDs2OdW33lawq796s3JRH7+vgLBwjF7XMbcI08mGRre/LRbBdW6u73NCikFPFYBcBfmh2LcKgEqvvAM69EZH3yvag6R6ZmGWjOisjBt/Hk9Pw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA6PR04MB445650.eurprd04.prod.outlook.com (2603:10a6:250:58::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 20:02:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 20:02:13 +0000
Date: Tue, 27 Oct 2026 15:01:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Andy Shevchenko <andy@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dmaengine: mediatek: uart: synchronize completion
 callbacks
Message-ID: <auEDN0av-JcnIXrB@SMW015318>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-2-aad7a6b3c62e@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-2-aad7a6b3c62e@gmail.com>
X-ClientProxiedBy: PH8P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA6PR04MB445650:EE_
X-MS-Office365-Filtering-Correlation-Id: 72290501-abc8-4654-21a6-08df346530fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|1800799024|23010399003|376014|261026121527099003|11063799006|4143699003|56012099006|261022105027099003|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	+j5E/rbCeUySD3KN9N0beiPIRi1DkYEcXks6ppFjpixxFJPd474Dlcw0zP1/tBZ3Eb77j4ZmbDAvCYLj3h7n3mqynvNMmDHbxLGPMii1Qrp/pkFrHv2IqnSeA3dL5AfmPKQbpSBKxaRHENL3f5QqtiKAUHjwNMfgcUGMz9bN8McEYHWdjf0RvXwcMZzQNANcNm44bU0GGHk9l66N2+j76V9MVybxwoL2uFemmGTSuIPKBdB/EBoRtuRjwVKgxYNrWAlqSQBOELGTKuWDlh+8MK/qxMpbV/q+s7meUy3+n9ANJiTURWuuiBkmjItLE+nVMlRBCTBr+7TA9N2fEWqSRHYtFFH8kjHKBov8F6AR5B90tStkAFuMJoJPRAvapVsjZ0nRtB5tC43cGFtI34/W6hfbLfg9p+1aSsF4npei3f3G+Mso4X6dD9pZnigE1Z5Ao0LX3NfCai6IdwMAS9zcocKeHvNGaMm+ZNgb7Qbl3DrAiO7IMvBPcZjGLTydiVKKMKB+HXx2+SjwxFRSDBqt8y3sLHTGv+RjCCbVFjGp5oG+JCu4xIlc88WcgMnuksQ2MGChpuexOMLYGS/W04TyFgH5IyKwbfGwiS2nG6M+Q6olODEFM9fanFpOmkqrqFipkf4wIW3I3gfxXy3fprmLLb3pETAHVRRW28JzJWdbDAc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(1800799024)(23010399003)(376014)(261026121527099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UyaIYMxR//281T/EPxPDqaMe45KprXv5mkiCrbVEzQJJY0K/s2n4BaTqiPQ/?=
 =?us-ascii?Q?PQ4aPOJ4CvbKWfFRzbf3hP5ETRUEin24HG5hKmycsaQIuj5X0/c93QZ1dGLM?=
 =?us-ascii?Q?if8seGZxD5X/cCiZgReioENdcjH2zELOhXR9uMV0SS9xvSoioEKN6sKKzM2g?=
 =?us-ascii?Q?rrEwuVMJmOrR6qW2fGvUXo9cH+vHHBHB8TvIHlGgqffmsZsoAg+4YJ/AvBAY?=
 =?us-ascii?Q?R6WQz/5YyoX9RCtxBQyhyHxfAGG1p3uVQ52OM4P4b6TM8a4QAYH1cYf3+/fg?=
 =?us-ascii?Q?SsoxYgxktmEfKhA5rZ1LKALTsbjrt+bZArOJI1/vsheE8fTrYbWEITVQCI9C?=
 =?us-ascii?Q?+9kJRuj3YmpPUV6T9w7jbFqyfdeY5xLzeTBiq8RCAdImOH/a2buY+56uYWfW?=
 =?us-ascii?Q?0hGd9hNwkeKKbK5NFoqfwn9GEY3dNuLo3XkqIGk8oX3FytdwD7I7XvHw8w/Q?=
 =?us-ascii?Q?MUwa2qRo076xztl3ZlepL6T3KQfeR6QR6bit0g7z+z4Ph15D19HIRbc4eiLw?=
 =?us-ascii?Q?dwcK+3hT8ceLL+HoSSUAKziDkKWvlEQH0EidAPiPEm3huAiRaY9STF9jLeAs?=
 =?us-ascii?Q?x1te/zMp+bK+9yF8Qj9hFtD4Gonpk+1hZVXLcxeExSKTLCDArgIKIjAn/on0?=
 =?us-ascii?Q?MBCknxXkV3m3AmSbiYsgnk4GTVM7DfoH26Maxg3DeoJwBbo14MGuUGaFppB0?=
 =?us-ascii?Q?qLlJ0Rqyny+1qB21eoOjU/uEPFv2KCt+jkRYPGLW929YDCyhH+qnxFUmXJlq?=
 =?us-ascii?Q?N40cuH0ZWZ73Rfl4qqJ0h/Js8epDbkJbjssLZu2mZ4bWZJSZVEoQ/5K9PTtw?=
 =?us-ascii?Q?o+F13147t+XlDpspgTJbukMF216dMJ7TZOVSMC8aayBpUlzpQ21ZUPBllyfn?=
 =?us-ascii?Q?QhZWl29hoDbcmxnTPWiWYmJGQb4IO/qIhr1aDbJRNQVEeJn/XPHZDvTRLRpU?=
 =?us-ascii?Q?dEk4cUG8ti/Yapeqpve73y8sGWHUSm3RTvOK8JBt7FWH6efm0Sjxrt8yDA6g?=
 =?us-ascii?Q?CacT527cJTpJTSs05StVW84imkFMeqT2boE8QGSPRapGw2VtHCQ75F67lINn?=
 =?us-ascii?Q?E3DcPQFrZx9jcCq7YKGGyYhWVMPOFa2j+RGyETsne9/ZokqRb1wQVE2Veh+u?=
 =?us-ascii?Q?qNQDuFSfKS+NZ/bYoG1R3yylBTBGsR8IJ/FCc4isrbmn2j4vCw09TGH0gtnS?=
 =?us-ascii?Q?BYSE7hzjoQUEbqivU7DILFXiw6xsX2GyeiATO68oDN2YKc/sUf5o+mwjYF3/?=
 =?us-ascii?Q?Nih+LMaGqFnKVHkookb533eM3pdXgF3u+m4juNRsgrsRwSv8K/0lDlbbN3/H?=
 =?us-ascii?Q?gsePN8sP9oOOD26WN7CWrhnQOiF3RBpVlojXw5CFxIwzuFfc6A+O7nDYLq38?=
 =?us-ascii?Q?ysjuuqVZqQ8em/jCGlXAoiudu0p7hX7VLGdGSqLp3waiWjv5EhgeOD+KvrU+?=
 =?us-ascii?Q?+pz5XHxPirso8McvE+w1xv2LZmKaIOzGc8RX81kHlyIHm3x+jfseM/b4ZCqd?=
 =?us-ascii?Q?dfJJNW1XjfFOmEhyKm/BToaLxSn6gSN0p1p/7BKqa2RiuXoUNbPseKMo80Mp?=
 =?us-ascii?Q?LXMJT0RFTwar2bTtT9bXshwi6NqtcStnJfD/aigFqu9cRqLuIQQBu2qBJHlo?=
 =?us-ascii?Q?lDCleEiGPSbifaw7M7aeWxyzef9yZmLCOOn1Syac3d3F9KKOFr539zFHOTRl?=
 =?us-ascii?Q?8W5DFQmAD0WQI2u5y2e1JkR+koZsxjEl6DSHDM4XPZPgUo82ZfpcV+ORgt8X?=
 =?us-ascii?Q?CRzdtJ4kVFuVExlq+21RmyrqkL+em5SOa9Gv5c1QgEUD83g6LImC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72290501-abc8-4654-21a6-08df346530fb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 20:02:13.0049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRe0/2C1MgaUjVpqJ2Ypkq6omAUSNwsrGnrC1AizLdlQFN8isGNIAzS4rbGtwIB+e9LPMJlJmpJKh3aoAq2UJLI8MjYFSFe/tJFK/V8RoeQw9JAv8nWKk1LITQlsO4hQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB445650

On Tue, Oct 27, 2026 at 12:22:27PM -0600, James Hilliard wrote:
> Terminating a UART APDMA channel waits for its interrupt handler, but
> completion callbacks run in the virt-dma tasklet. A callback already
> removed from desc_completed can still be running after termination
> returns. With no device_synchronize hook, dmaengine_synchronize() does
> not wait for that callback either.
>
> Use vchan_dma_synchronize() as the UART APDMA device_synchronize callback
> so clients can wait for completion callbacks before reusing callback
> state or freeing DMA buffers. Keep the callback wait separate from
> device_terminate_all so it can run without locks acquired by the callback.
>
> Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
> index f74e9a328588..6bc4f20d8b06 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
>  	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
>  	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
>  	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
> +	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
>  	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
>  	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
>  	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
>
> --
> 2.53.0
>
