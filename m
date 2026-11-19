Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795071178;
	b=xMisQwFxrEr3gc0VpZhDnN+tddw8yAFRFH1n+j8MYGt+ZSO2T1MUHa4nUdbV/yptF+oG
	 33mH9/FL34epboDBcblW+WknTZATv0f29w15tJyL7xx3yW83zJhWM/prxCnpVZkjL/6L2
	 bmNuBbwElEEP0GUAz5X1Mc+3I6ZBSE+iEJtUoOKS4kS4RLRXV7NX6Uz9MRHZDkWZ8sIod
	 X38jGKugMD7Mwkt5/ciHubduE+WUnBBPuI85DOIzBHvjXvxXOuZHzeNYHpCg4kwbXRFyQ
	 6Nonhjisjx/c/UvCvbjOQBnal6Sk1XrAavlJvn+o5yaqJXxXfGrmVLTXjc5tGcmprTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071178;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zb7L27TKvWUaMXeQx8MyG/4CR9/q5lxKWhx6B77KXmA=;
	b=U/1JTbgs9iTMSEXwUDiVRiyhF/KPzg0xwktEfFqnT+ey2V/an8dWmWDsuv3hnKBG3qJz
	 H8kDW0M0uKWw8UxSV6mxjzwqXeoKoW33bt6OePRcKB35dI3Fz4bzz9NWM1hoEvX12v1bq
	 myRl0MBq9LNMDhfvI+ID9RltY1Vz7hCpANA+VvDO+DeKCEpEIxE9MEIlPs7EP0SrBlB6q
	 Xr7kbsTcZyHO1uI9JNU3rAH1Aa6X3Yqe0vbjFgbUeDbt5gI8aIJGcq4mPgF3h839WnTqk
	 q97Tm43zBzeX/VbscTdmeCJmTIsDigOAEHqFFY9Cbn3vtntAV0vy0FtgRdISLXUDTgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fYSJeaVN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.1
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2D606A336;
	Thu, 19 Nov 2026 06:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A2D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fYSJeaVN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=np7pKjq7iMUWGcqgP7hRbX2k3EL+D9e2SuNe7KC8Oxb//PMuvgd7NtG15aOPhuuNbKTDEl5yfpF8shwYHyQ340w0ZgugVjlcGcQCOKqNEx7C32eYugZDbUqxtqyroy6g5nNTn/SHQHBif5vNKNxZEl4P3lNnVyXHujQ/qweZmEnc6UFcha7L+WZXMxoqIogoy0UcVS/JTgxTZtGrI7UFWl/aAgk20O7zySQ5y3KHLt0KhwMXIiI8AHQ50gJo6XrZdEjKPUcBOgQvBotqOtbuxz1wkrxZmp3wXsohlYQBFx87eWPyFIsyhzeYecoDDaNIle/07ykczGCe1zvQ2fngow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zb7L27TKvWUaMXeQx8MyG/4CR9/q5lxKWhx6B77KXmA=;
 b=gjEOQ/1Y2CiVtwKhslMGD9S1WJ7nPnEFng8VNY0WmsC4lznWntYSitNzw4o/n2OLY9g+ou2fkCKuCo0e2QNXTEo83LqlyHPSfT0Z86APORScrzQJSpooNrbPnOwem71hJq2O5qKa9kmKcXb7zSaTg4d/Qp4OvpAnHqlcFS0BwVkEZdcJI0UaSlTAqCGDMjgnLGDawXvKlSAe5peWzZ3g26SKBlrjDFMP+BWj13SbZ78FEkAZSj6cTueKShw8HZsV1LukqhhTj6mrLv5JToQl/uiJRN+hMqDZgjychW1vJPJ2MW0wVoFHYHZ0osirW5EOkMzrHHH4jXrv2SZsXxnfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zb7L27TKvWUaMXeQx8MyG/4CR9/q5lxKWhx6B77KXmA=;
 b=fYSJeaVN4bm9bDqLCGnvGoouRLMCiXgkV+n4VoVo4zmBwVSByxDlbOjEM3q3fBN1/jFFrGsb/T+XgcJXOABTxCOhS9yKHxeuJnlvlzFnv5ksrjLeco8eC23SpwwDcVUE+g3wt8ZzlZvqfX7g+MVd3HA3oEGDv5LHeVWp/83LTRB6xN8M5WG1UbXT57M2wsQlJxg6bLtw7N5eOeo1OWQ4jC+j0tZ91SYi6Ukdt27vN8prLcGn1jmSJl1Muffw86xBk9ub5i9M4JJMZ6oGqooP7aXStu7A8jvmnOA4QuIRDqTwHARvr9fQCWI+NYVBveI0JeddpLsnmnEU/P+xdI7Elg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9803.namprd12.prod.outlook.com (2603:10b6:408:306::15)
 by PH7PR12MB8153.namprd12.prod.outlook.com (2603:10b6:510:2b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 06:52:53 +0000
Received: from LV5PR12MB9803.namprd12.prod.outlook.com
 ([fe80::8385:c5ab:1034:e725]) by LV5PR12MB9803.namprd12.prod.outlook.com
 ([fe80::8385:c5ab:1034:e725%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 06:52:53 +0000
From: Prateek Agarwal <praagarwal@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: Prathamesh Shete <pshete@nvidia.com>,
	Prateek Agarwal <praagarwal@nvidia.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] soc/tegra: Add Tegra268 Kconfig symbol
Date: Thu, 19 Nov 2026 06:52:47 +0000
Message-ID: <20261119065249.2425224-2-praagarwal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119065249.2425224-1-praagarwal@nvidia.com>
References: <20261119065249.2425224-1-praagarwal@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0331.namprd04.prod.outlook.com
 (2603:10b6:303:8a::6) To LV5PR12MB9803.namprd12.prod.outlook.com
 (2603:10b6:408:306::15)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9803:EE_|PH7PR12MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0b18d4-22b6-4579-9be8-08df4609bc05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|261022105027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|261009221227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xOPGzZ6bsDBz05quOJ/O4io/sZcHEahY+VEadphObKqp+c5nXi1lRTWnbIEZhlT1OVCLcZH9TlzKU07WwcxNBM/sMC91TGDmrN/t2hKFkAO1eCKZByfrxsCSXUxdEPwIxbOtNmEzkvjAu9FQSIZE/oK+8XYAEPYHdsqsyYxrRXd5ldW/tObRjZhWAI4nA8YOhvllpovmiA5nSf7nXCxGpo+lDMYZNx5XTZ4X/8W1kyrOH2WL5NVHVK81zShA8iO8xGTw/PKsepwIpUNGzaqKDfh7sQRib67lLgaoqTjGl8xLPaGa9RsyPqFgC/3/SI+XolICDaAzSHPwcyP/gWVtAA2TkWBudZ9I5hWrPu+Y2LMNG6jD9G0dUAPG/hawchhWpErjx0SfZ9N7/0o5H2jw4Mcw76c0JwEFa/JwepTW5nhuBuurCvBQJd94HKqQR2Jne+4SYn51OECXIW3P11bHZXbYvfV0B/jOKkEoEKUdb5z9rWMNg9NtZenSmnyiG0Wafk+cfmvmg4aGrUp85vJOknd28wtKN9Ao2tTVU4aN52gnE/5RS5fW25r5y9QfknI4upEcAmqcJOnFlsuIaOB/tRiUjewbbmSQ2Sqq8K22TNEzzk/A5ubt/ycz7WN9zwjuGNSU8H9T4l59X6wQAKkoIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9803.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(261009221227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fSCu+JB1OUopetwUllDpyZppSZUGTvl+MB+hM+o9zS9Z/tojplA9IiiH556j?=
 =?us-ascii?Q?UVF7f/iX2sjUIN4TM52Ndu/NOeSdGednlolPj/E2fuPVza/BBJD/3IwJIGJp?=
 =?us-ascii?Q?Llnoe2DEX0+iJpb8UnBOiy9swMR1xiebGuowY0KRInACw3TomSPt6ncUJzDh?=
 =?us-ascii?Q?26XOyjioOyS4Nj8l17UAJ3LdmSerEnylGmDRsryNHSI0g2O80qExnxAV/YfM?=
 =?us-ascii?Q?7/BDTNvOLG43w/I19+ir7R/AY+UOXFYyhOURXar8gU6tyDZr/dF96x32Vqud?=
 =?us-ascii?Q?qdXPNv4DGrYSB8M62MAJ+NOHrSTgQONldLr7r/r0iu0wgqmwmByK6pqrxBVT?=
 =?us-ascii?Q?c+n3GoARCTZRbiH9AuzRLETDR/0PJgBDzio7ssR2Kch5a0fFz9+xACgHbdw8?=
 =?us-ascii?Q?m/BX6xoOcuLxfbJ81bwGKTOryLDwd+AGWi0rYjCA2RRhEgh09pJfGa/Vd1OF?=
 =?us-ascii?Q?G3TSJQuOphtzeIGjoHr+++d367/19Mk3KaXL2TXvFWRtwRnGA7HLHQxs6fNO?=
 =?us-ascii?Q?MRINljnVWDCEZf4fcAO2AeaMS6drUdW/qDCm4wIVDjSPoTGeQopLhNRzDFd+?=
 =?us-ascii?Q?6zcQsQNDbh1tLVE+ZkB1RPwsxY8EPkzDUIDBaho6SulTRUEHo7+w6aSo/DlC?=
 =?us-ascii?Q?nAHORTaVoVYjTFAfs9KancvKPQTHhO7CRcPu9T3Y6e+gy48vrRq18TVmhTWu?=
 =?us-ascii?Q?LiuSP+7tSBmCCuKt0p8c7Wq3az43EAOmi/9l+oklCWbaXSjCkoOpyrD+kQZS?=
 =?us-ascii?Q?m9EfWBdJ1ofvMTbAj1NO9CZAidhYv3ojnIu26dgWoGHhfM6ZJbqNDjrCpNk9?=
 =?us-ascii?Q?zVzPpVvWY9GlDRvG17DH2IdqmaaMkalg+YyqpWEn5FGeSIgpsXuzhQlqr5pV?=
 =?us-ascii?Q?bRWqXQiFSzjNn8BFWnNhwvdjfYMkK69Y3ukfW3rpU4gPZEBtWLjU0b8+tdQm?=
 =?us-ascii?Q?Gi7D68R2bajC+LhBKNMQxuXP91kkKs8NARN4Dd8BPPkHWznSz4PQEmqNg4fM?=
 =?us-ascii?Q?G2+cPHMYaJfttRcUBbVmdQOOscf79dEzfTV4XGKFBoktzxqchF+tR+9GpRN7?=
 =?us-ascii?Q?mj0r85q/FkeWM6D65HeIYNIE6mqZIymApHQ3X4Hk0J7zhjVyLeghJZO7b/7d?=
 =?us-ascii?Q?hOkGhMtYMEGvhglg+imSYENWwVT1P6GUWXOM8B+yFU3dCIkaoMkPG5krvkIW?=
 =?us-ascii?Q?oJ9pLX+djn7SNgvUlaA3ldmouXhzWqxvW5orR1t5mujTLzOo6W1UR2tLR+yU?=
 =?us-ascii?Q?Mme8dYa23pw7OgRK/aUMrKoTlqI5GWYFdy6WtNX3qq7fFPWwXQ0kPSFll+4e?=
 =?us-ascii?Q?WLt9ou2aNdoLkfAdDNIZLZ09xsiCdzWTdohFWjRtsGo9YghS2B74w60cLj/a?=
 =?us-ascii?Q?gItn824w+HqzcwiMc1woUwurgUieuIjJcr8Pc3kMWOcq2wzib0eh4RkHTwMt?=
 =?us-ascii?Q?ih0dL8DrfpQPov6o9VPqffdLr59paQVvUNDNGTNOfs7NRSpj4bTAGg7jjCRL?=
 =?us-ascii?Q?75P/g66RabbUWIxO0sOTLgWWtypJcJ58782SgvTo3FrYqIoN55TNFmc6ZrMf?=
 =?us-ascii?Q?ZBC9Cf8G1Ui7PViJJkItPjyy6Pf5xB+KQ3yHOoRMna1zsNNjZk9zLamTKxea?=
 =?us-ascii?Q?DHmgqqGC773d24CyyG4ZA8sZa1/H5Owj0PeMHxi/VZwVbZyGZi/ml+YFVxvF?=
 =?us-ascii?Q?kApgO3Rghk48mKa5FHNEiv6ilK30X3SAY1DQNzC5HmUNhi7kE+QR3/t8yEvG?=
 =?us-ascii?Q?xMTs0oK46w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0b18d4-22b6-4579-9be8-08df4609bc05
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9803.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:52:53.4313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9i2QoVXgxEOJ49pVgFVmHNlqW+RoLrcH+rmeFZW49Cx95U3sTcWZdHf1DpnG3EHZRouED4KQNQs3iJDcovl7fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8153

From: Prathamesh Shete <pshete@nvidia.com>

The NVIDIA Tegra268 SoC is an upcoming new chip. Add a Kconfig symbol to
allow fine-grained selection of support code for this chip.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Prateek Agarwal <praagarwal@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 318e7b604342..1ba51374a175 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -153,6 +153,14 @@ config ARCH_TEGRA_264_SOC
 	help
 	  Enable support for the NVIDIA Tegra264 SoC.
 
+config ARCH_TEGRA_268_SOC
+	bool "NVIDIA Tegra268 SoC"
+	default ARCH_TEGRA
+	select MAILBOX
+	select SOC_TEGRA_PMC
+	help
+	  Enable support for the NVIDIA Tegra268 SoC.
+
 endif
 endif
 
-- 
2.43.0

