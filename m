Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CCA2DCC01;
	Mon, 23 Mar 2026 18:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774291369; cv=fail; b=q5nszKrFfcn+I3XhmAvqnQvFg1x1q8aeLSqEmfW58AANNYSEIEL22rSiIhRMY7j/KKjJr9+OVm2efE28GHrf7xIBKXZMT8+MkmtGDhFI4yy/8Bl1CuhpEJty2Ute46Rh+gEoU1NkNqScUPP8wAMMR5H0PY0zGLQmlNslgvGmB7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774291369; c=relaxed/simple;
	bh=aPipYrk+eMKKA/A7XtygUZ+vs8EV045cL1NAPbGEHlo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFwqVhoSPEExcAKuCw7+vSzmu0rcnMb9LZIt7oFvNcBc13HZgPGwm+th07CVW1AVaykuv+nibJ/GOB1TOVkmvIr9se5pjB+rbYawQ0XoCJ//fTNp/ETyVHNFeeXzbdQ7Cv+eMU3Ekcg1Gxs3GsDPIlfS9JnctJSiob34Em4mhKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OIh7cOu3; arc=fail smtp.client-ip=40.93.196.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OIh7cOu3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMKq+CnNQfPOW0HrfQ+J9vrzjvxoE0PIEdwGoptYJPk09lEYPtwOap1vDSScGeVRujsOgoSlHp6sDuCGOYwtwZ8SmRi6zqwEI2pXK38G2Cg9ZTkDFDF8xJDziLIOGnwpsopybETEN9dAG4PPp0VATaC4Svpefp+e5KNapruwC1/zjEOdtd3FjGbs4mu3iwN3E3A2/Ee7b6NslpZbHYZfbFELEkpA0PPfytGyNsOWzoOtZsHWwFD/bulwaUfA3X2GQJ0hC7OFRapGZY4Vf35vWOeT2sSiIZwrQzM5K8lUiimp74cdGHoVAH6mRdzwvhZYqG3+vwTqXAGnwL5eAVjENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPndFtE8B6bVqJmADMf1xBaiwFAnovZ17uGNPtnvv0U=;
 b=Z0D3y+J9G1dfvVPGLHfUUQCnPwFTxu9yUbm2MNSziKqqiMLQicMNR0IevV00CCVGNyOUg4n3xxhSMD+scwcY4ReQUePTiTqcyXz19DBq5GijVxKXhszHquiJ63hZsMHxQL3GaoDbSzNKC0Qc37dTcSkiGl3jcbf0mVzKiWwTs1o5aI1uuwrtXleb762HS5SJYQVKRbXDUptpBkRUQX6T/hP/bZnVmdux/INi2rwFrgFfDACRUP2Xn5k5B31Orns6vbwPx6c+VwLMj2hK3sYV+E0x4NyE5CbGsQP8Rg11MqzPu0iNx18oXsGyi3+zM2KCkLYu/9nl2yuNWHCQn8epoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPndFtE8B6bVqJmADMf1xBaiwFAnovZ17uGNPtnvv0U=;
 b=OIh7cOu3lItzRjdkJd438Sg1RJ45Fi7MedgszeH32cRMtMj5B5QlLHVpjaNEG0ITYAFjtWTZCMPUSf9Lob1eVZBfXSCxGjLB4J5DpXYQs1ZtgF4EdgewTrFv9W2dPqfqYixXJEA1fr/zhA57jMDHeCal+VFdKK504P06k9WpTuW/JzJrkeI2mjZRv9LwIyO4SIGzEGNiOvCmv/dOckWGMq3319g/A3XdR20RDnGUJDKaT8J2MiwvC0m+6zdEy2YY2mRN0aBAjwNY6DxYW0he9NIHs6+fsvlQdWVlEEZKofhFodDZzlBuQ1lelJq2Q8sQracZydsIc39tBozC78cNiw==
Received: from BL1PR13CA0119.namprd13.prod.outlook.com (2603:10b6:208:2b9::34)
 by DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Mon, 23 Mar
 2026 18:42:37 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::c6) by BL1PR13CA0119.outlook.office365.com
 (2603:10b6:208:2b9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 18:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 18:42:36 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 11:42:16 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 11:42:15 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 11:42:08 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <lkp@intel.com>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <llvm@lists.linux.dev>, <miquel.raynal@bootlin.com>,
	<oe-kbuild-all@lists.linux.dev>, <p.zabel@pengutronix.de>,
	<rafael@kernel.org>, <robert.moore@intel.com>, <robh@kernel.org>,
	<smangipudi@nvidia.com>, <thierry.reding@kernel.org>
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Date: Tue, 24 Mar 2026 00:12:07 +0530
Message-ID: <20260323184207.68515-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <202603230124.VFt6CPBe-lkp@intel.com>
References: <202603230124.VFt6CPBe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 17386d8b-37cd-4736-56c8-08de890bf445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|22082099003|18002099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	kzMxMuRnD9fjvedV7Bhxf8CIVIHuIqZt9wrNgIq0AnI7vM34S/9spGWKZ/mg6xrqGPmAomMnZIymIn8LtgfgOHTOr2CHWMU5Crla5kzEM/20NtQ1bWyfvR02zu9ubaE306FvzigzBpBHe++zK3UX5zGvs/JTzRAdx5o5FLraouWB7U6ev1+SPudM5cXGkmiPURAlstUoXBJBIcQPQd1DB7pIATmXuRN70R7vnZMTBGgkNOHgSAmQY1WJsYkb+En8E17QvwudbP4VVcH0NYF+0zIJ/j9MOLqun9pBCIlTraY9C96zDm4IQwZ5qkJc/hjEdlhPY06wWOqeV2zmLWs6c66tVhBjVN9+aJDgcoH15cZhmcJ0z1SDQ1btgU2tNln7T7SIhJyy/QgCG9vkZUTcnUgFcUFwWa8dSFBSUpRVeWjn4ujbdGp3IOjTwN0odbUdJmNMu5RebDMFAClXDihGlMOqGs9LgcA1yiHQhyUBqfu7/DCxTace2c2xAFNp6gIi8zxx/k+uB1IU7SbvfYm/YqnTVKoWbFDidTjBxJkkEQFej4yJ+1kXUivW8xXsOdXFsj8WAdo8ObjERN1KGxUHy/w7yzp6IlfmHHCRsqufhL6CuzxPo/s5X/icOwBgasK6ek2OyX9qmXwY90NMv4UmvmkLhJbW4QEe0kWU+UAOKF0XaEwF814A0zVDgxcr2sxTay+asMtNrqlbkseClWLCEKPFyDTWnxXA8MzXEBtJOYKi6yRwivTnV02MRlwD77+IFGK764RmVq5InHYNfa2Q/g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(22082099003)(18002099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Knjwv4/5Gkq4LNSwj3HO3WdE/5rr/KUC01DNf6JUcGoSITltrMHTpTb0TM3EDxcJyDQTBjsaHvmS9kLMIuwvVUj7geOIZ3zLoCBJb2fy6XSfvjDFkO/oiAJlI0shXUZNlxzLVJ3bQBPCnwE4AQo51zjGBH3DToOzDDdrsRRGK30W/LXR3etBD0+zTQmTHjK6wQMulORd4VIvghd3S825fCGpFa/lj4FPY+knoolcG87pQtJMwAFUi91F4GZePog2oF/9qrBVPowmqz099Fadz1ShxI7rjb17mH+aoUzPARTz+C8jdqFJNPzjyf/Lyi78aORRRSJmfr4JvpWPF/l/dO1UHbci9Z4EQwdqmQ/qkW1k7EqhNR397OPHtV17IQxVzqu03aew+uuCbaAZRcgRrtA9FpjfE6Mm7jLqi2uhFs+OMAptE0sS6Ow0qFqVpc3Q
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 18:42:36.7292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17386d8b-37cd-4736-56c8-08de890bf445
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867

On Mon, 23 Mar 2026 01:47:20 +0800, kernel test robot wrote:
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20260320]
> [also build test ERROR on linus/master v7.0-rc4]
> [cannot apply to i3c/i3c/next rafael-pm/linux-next rafael-pm/bleeding-edge groeck-staging/hwmon-next v7.0-rc4 v7.0-rc3 v7.0-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-i3c-Add-mipi-i3c-static-method-to-support-SETAASA/20260322-174037
> base:   next-20260320
> patch link:    https://lore.kernel.org/r/20260318172820.13771-5-akhilrajeev%40nvidia.com
> patch subject: [PATCH 04/12] i3c: master: Support ACPI enumeration
> config: sparc-randconfig-002-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230007.WOMwklQ6-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230007.WOMwklQ6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603230007.WOMwklQ6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/i3c/master.c: In function 'i3c_master_add_i2c_boardinfo':
>>> drivers/i3c/master.c:2449:23: error: implicit declaration of function 'acpi_dev_get_resources'; did you mean 'acpi_get_event_resources'? [-Wimplicit-function-declaration]
>     2449 |                 ret = acpi_dev_get_resources(adev, &resources,
>          |                       ^~~~~~~~~~~~~~~~~~~~~~
>          |                       acpi_get_event_resources
>>> drivers/i3c/master.c:2455:17: error: implicit declaration of function 'acpi_dev_free_resource_list' [-Wimplicit-function-declaration]
>     2455 |                 acpi_dev_free_resource_list(&resources);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/i3c/master.c: In function 'i3c_master_add_acpi_dev':
>>> drivers/i3c/master.c:2556:9: error: unknown type name 'acpi_bus_address'; did you mean 'acpi_io_address'?
>     2556 |         acpi_bus_address adr;
>          |         ^~~~~~~~~~~~~~~~
>          |         acpi_io_address
>>> drivers/i3c/master.c:2563:14: error: implicit declaration of function 'acpi_has_method'; did you mean 'acpi_has_watchdog'? [-Wimplicit-function-declaration]
>     2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
>          |              ^~~~~~~~~~~~~~~
>          |              acpi_has_watchdog
>>> drivers/i3c/master.c:2563:34: error: invalid use of undefined type 'struct acpi_device'
>     2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
>          |                                  ^~
>>> drivers/i3c/master.c:2566:15: error: implicit declaration of function 'acpi_device_adr'; did you mean 'acpi_device_handle'? [-Wimplicit-function-declaration]
>     2566 |         adr = acpi_device_adr(adev);
>          |               ^~~~~~~~~~~~~~~
>          |               acpi_device_handle

#include <linux/acpi.h> is added in PATCH 03/12. The functions' prototypes
are present in acpi.h. I think the bot checked this patch individually,
or did I miss something?

Best Regards,
Akhil
