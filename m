Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185B43F39CA;
	Fri, 17 Jul 2026 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287961; cv=fail; b=Cc8bxIzQs7ft48HKH7ZkufqUHqGAvCxXbSIKagrepQzz91y0cFeiIxNjwSk9t6q5WU5i/RrYOR1FHrgK8WePm/wxLe2/3lyb/h++XvOmoBAHMb/GJf9zG2ciN1F3WNy2Jk/VODmbZlF04dfZ9pM0idvlyMoJ+6AFQvVft/laEfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287961; c=relaxed/simple;
	bh=U3Vc7M4EMHbD7g5+tFRRONmJ3t5RRYCAfTkLNlz5DGM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VRxSULdyDo2XP01iZskxA5ecg7sNWe8zy2PhVczsDXjTVHYSxWqu+uT3R1IZBJE6Cv2aaqpSWT1soZo9dUbl43M5bMTzxIWlOQQghOpXXmTE1gPmjVwh/HhTpQv31MiabJE91P8FrPY2jlqljGsy1AbvFeV2jRAB7z5yCEP4pFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pvAjp98z; arc=fail smtp.client-ip=52.101.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pvAjp98z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e89dsp2myFcu3sPr1EO6In0niF1YG7sPajUtOwR6uQzNAIN0c/FFLeex0ReWsBsfttjn4vPuSfstKOvEEiSJkQSuZVNMbfVO7A+ujj6A8o5pVY8gSD8ik595aG/LxmFLFbNY4t6xY4LT7Ber6goLGWuQ+WBdhXoRIA0Mzf15KX/y+/yXH5Tomz03/FNNHdaDt+MxzfITfsH6bYzmXKhz4l2WANWdIWHR6iAupyFJt4aZ0nYzigD79eRqB5G6kuQuptEyPTAqFfLySPnx19suKOJhuqfA+1wjHasQ9S29PfFVTVGb1jw15piznGKrWFGNEm4fYhEIUZuu3sn2UvV+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wqJip5X8I8oV5A769+DsLNRt1vcPF/lIsWAfULpFu0=;
 b=TDTMrzCfuFvfDhNRF3WwTbEf78QrYRlnWK1nb2MQuynNJKN60YgrJv0cU3Cgt5L+m5I42q/pXob92O0rXBZOMrcjuidCktalVnHdH7Tc6RtAGKfoDcTzMOW8jzEFxNgps43rlLRSaavMe39Sw7P/ejzBbE3P2rnTEp3QcVJHKdA9tp/QPehQEtH2WkecwK7ID+gNBMymZlailntyYtA6rxrO+bO8DYTE+KauUA4F4uA4EHyQZ01QQpf+dpNCSpY4vQZUiBMvZvdKBr5vnQ2U3H0jRrrHvlq7NC6Fx3IWR52yyN5XBruhlvB7xuzJER43HMg8ThDfCBisxWu3Hb0oQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wqJip5X8I8oV5A769+DsLNRt1vcPF/lIsWAfULpFu0=;
 b=pvAjp98zF6y6BV57zTB3nDIl7auNzurz01+N3+oWKmZUl2AWdcgVhGQZ9NqTSLGvkoLsv2moH3oQWl8doXwE5pRvwp9BUn2VGd8hRYatkL0VoxmQsjNwxUgYDxxPKgHot/BRHBltgCZj0z9zYA8YYUIp/4LfQcT5l7UG6fV2xgORT5oiey1tubcFSo+dD9A7PdLl+ura+Z3YHhFMWR5WM2eSDzEetdzQEja9b4jdf9APFJjP9Jg7XYXhNugnw5bIKZiXDDE6J/XILNyNgBBFh7CHqSl1Lx0DIF0Tp89Ic5lPZaQcqcx7DBAAZ90iILvjyxxY4S6xKb5ct1e18K/VQQ==
Received: from SA0PR11CA0001.namprd11.prod.outlook.com (2603:10b6:806:d3::6)
 by SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 11:32:30 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::91) by SA0PR11CA0001.outlook.office365.com
 (2603:10b6:806:d3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 11:32:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 11:32:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 04:32:15 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 17 Jul 2026 04:32:14 -0700
Received: from build-pshete-bionic-20260122.nvidia.com (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Jul 2026 04:32:14 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u.kleine-koenig@baylibre.com>,
	<dakr@kernel.org>, <bhelgaas@google.com>, <pshete@nvidia.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2 DIN/DOUT pin names
Date: Fri, 17 Jul 2026 11:32:09 +0000
Message-ID: <20260717113210.599463-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|SJ2PR12MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: 6753bab0-2f28-49c7-3edc-08dee3f7163f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	nEd0b9zMGHTCNR125xiKSIdciIhPRDbhKY9DHvbw7J0ePJoEulYtAoPpgDUnFJJK7lxGnVbE+TcfcV3VHjvW8a77lN0DRwzfrkEpsHVfTjYvMaEOEb4tDQEQou13sjZ9yxrkv+eeMrwq+nAXNJ+OVRaE7qI+acFzN1BgjNgfOzrUnv4N+Q8OBky2HSmbUSABcnaOl9wbJrNZREWPl0eGBvIU1X8C4kzgVKrymWjegvLwlsT55Qcq5ji+UkSLKw7zAVjhAzcsGsEWbK/Ma5TCX3MyfxeoLt2bne/Xfd9Jq/YAOajFziOKK6OTdskLxSEWR1SSjqzfr41uUPP7UebQbYPGisCo6m1G+YeeXbZl7Zt61MK/gRK0WKg4nyMnhNg67lAZF9hkB1xpzcmkQ6CCdu2cUdq8o7USp02n2CeQSaMlDHh32rZwEGmijMb2ADvt9cxCcdsDdxAUj3o/eiuqkfVPHtTFMWKbN0/70Qdk7wMvQmMKPZsH0HiVBR1vY0I+Lng7iUdSomLyUP5DD3wHVduf8TduBQtM8GJH7Qm7HQHl5a45WKgVQyakGXS7OJE/l0jyYoRPu8C5Mbskc21ChoiEjEwc7Kh1VLqYB2AAk+iZgPnvvdK+mF1th2V3D5cspfZDH6clZcoA1AgZ7vzPLtx2AeeX9x7HHmVZqwhi8AeT+H8fc7BJix9LnT2KvgrbHm+qxmOcGC+uqZhGmsFKMA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SMu3e0J7K3nkcdeXvokzT7F/fNBN579rJ6PBlMp9gCDcSlyOBZWMLJfU+KbcNZbcDBh+76UDyWH9XQgxvt7pHV/8ko6lY0i3Kky+OaejQwbHfQ4nSNMavisNxe+Q9tKAd6SKwyKvq7nT2g6zfJVB+oqD0GWrRg5yrv334tdpor+Id4XiVi5DWhALXlB30UyAv4KcmTVaKLF7tpXsFZmGJZpASEaYCuhs4JPhbh3q0bPe5q+Fd5r+ipxCLfN2MwHH1LQlyzXx/TQO8g3ejo3kMLtPiRoHnrrVNRSvHh2YZ6n3k6E5NgSZPwKLh2WuFsLrnwD+NbVkeckWr6Tsx5g9JGwThZDUODN8OISjfys3PCbrXD8f3jbou9pL3caYmyyAyLWTxS+rteo0OzpA2zx85kX/viDdzMqXOtOS0SK+MvhdYlKqjTVCTgs7YuKqFlbr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 11:32:30.1705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6753bab0-2f28-49c7-3edc-08dee3f7163f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874

The DAP2_DIN and DAP2_DOUT pins were listed with swapped ball suffixes:
DAP2_DIN as PV7 and DAP2_DOUT as PW0. On silicon DAP2_DIN is on ball PW0
and DAP2_DOUT is on ball PV7. Correct the pin and drive group names to
dap2_din_pw0 and dap2_dout_pv7.

Fixes: 30a9d5162f25 ("dt-bindings: pinctrl: Document Tegra264 pin controllers")
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 .../bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
index c40409d3263c..01db762e82bc 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
@@ -44,7 +44,7 @@ patternProperties:
                     soc_gpio173_pu3, soc_gpio174_pu4, soc_gpio175_pu5,
                     soc_gpio176_pu6, soc_gpio177_pu7, soc_gpio178_pv0,
                     pwm10_pv1, uart4_tx_pv2, uart4_rx_pv3, uart4_rts_n_pv4,
-                    uart4_cts_n_pv5, dap2_clk_pv6, dap2_din_pv7, dap2_dout_pw0,
+                    uart4_cts_n_pv5, dap2_clk_pv6, dap2_din_pw0, dap2_dout_pv7,
                     dap2_fs_pw1, gen1_i2c_scl_pw2, gen1_i2c_sda_pw3,
                     gen0_i2c_scl_pw4, gen0_i2c_sda_pw5, pwr_i2c_scl_pw6,
                     pwr_i2c_sda_pw7, soc_gpio138_pp0, soc_gpio139_pp1,
@@ -111,8 +111,8 @@ patternProperties:
                     drive_soc_gpio351_ps1, drive_gen0_i2c_scl_pw4,
                     drive_gen0_i2c_sda_pw5, drive_gen1_i2c_scl_pw2,
                     drive_gen1_i2c_sda_pw3, drive_dap2_fs_pw1,
-                    drive_dap2_clk_pv6, drive_dap2_din_pv7,
-                    drive_dap2_dout_pw0, drive_pwm10_pv1,
+                    drive_dap2_clk_pv6, drive_dap2_din_pw0,
+                    drive_dap2_dout_pv7, drive_pwm10_pv1,
                     drive_soc_gpio170_pu0, drive_soc_gpio171_pu1,
                     drive_soc_gpio172_pu2, drive_soc_gpio173_pu3,
                     drive_soc_gpio174_pu4, drive_soc_gpio175_pu5,
-- 
2.17.1

