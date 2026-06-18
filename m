Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7543148C5;
	Thu, 18 Jun 2026 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781811687; cv=fail; b=IifZQJo5sn3ehj8gAGtIQMkK9vUG+QtNJLDnMJd4pIcQhriGaoAYMiLo7Ecm+QNindRdbEycWx5RxVxYteJQt4GFXek2t0ZhIETnmNrakKTm9KYTZoWoamVxblCd6Z656pdJ+SrJagS7BwrLRyJtUtAidZoDB8Kr7iF773f2Cvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781811687; c=relaxed/simple;
	bh=g4mXtstex+pqwQeWKab9Ssb7BPBacAn1eSvpwxrKETE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VaZlXT4tST5CYLLL4HYPnPn9Xaui9f0aQdUtPIwfJTx5R2tBGyVk1ZEwZ20ctLbwziNt0XIO6h4n6FOFnZBSdiqxrNFcCqLRbuf3lqtg8wX/HAj6GFJJetHwFkzSOaOS4fXgbKO3x4LdWAEAtGs1MwiYQz+Cvxd+1L0iaPlB5Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a8BUFjc2; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a8BUFjc2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c37i30ijKEtZICk1OiSzOyB1QxjFBJa1YPyQjB7TUJKyrjVv8Mgy/C+PEC9WiuqShViosft6WuDHML5E5FMvPoslG8TXJI3pcKby27KOae5USpgWIsT46cPKk1EHZu6g6AVMBaSt2LjZDlu0/pyE6VReQPZDqQ8LSdHMJd+MbmvIKi65Eo72OKhxB+8bh+qBZ3Ghikg7zc9XOLjPYJ24Lx3/8NGTMXbbepVP1BQK7MtRItvgGwSTswmk01SW58VoOKNmBQRv7m8THQ3dFcvluOjY3gAkGWFbkh/s0PatmzH4+Umsnh9OABqPT3BLRE5JibBf8BXyw5n3dgcYkR0yaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi7yZJTu+dT5DvaxOstCIrBvgCzSu4gykdxmJgu69UA=;
 b=LuLLaPpheemFJ7LQRVvhgHX/2ZN8Ssd1rf/2QX9ZOWwhXzLesvi953F0BtuPsqkjoQyiOOPXXMDlThNh4zFSBHJ+UOEYw5+2+5TNj+u8pxABBB+3gyJiUzvUE6sbwUMQpLLttzRI19RUEUOy+y6bAS21R5W/peNugWU0wL39eqVnsXbi6jJgq9kysPSHdH1inmrmz4HtzrBZyNgO5dz2jjDz+4ghTu43cDkh4bnoI/LQFJEXRRg4HC2icO9hj9lB+hMkjtnjZ28oJzHuXENGOI9sGBdlRpoR6R8LaP2EgpTrK6/Y74CWWUqAyQIp4VNDegEauWmEswlzcx7mJKvFCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi7yZJTu+dT5DvaxOstCIrBvgCzSu4gykdxmJgu69UA=;
 b=a8BUFjc2rymDOC3bf7pT857QvnhTOQGVjlzwU9n71A7Qn25iUOfPhL88OjxMaqt6ZppQ6VYxxn18MlJ/Oc87VvBHC071vOoYiM2yAjMd06G9hCw9dIWpcpEXS1CO9e+iuNSxlm3d7oApRg8hVmFEy94ZLr4HRLwGxyH4oFJrV3moS6vnQUJnUpCaoKeiFqf1y5MkMj0t0jLJlcWmtrcZ5IL0diylob/YrcRP827BJiteE+OUxXQzMdvwWDeUHM1KJjMo8hIAQ+MEZdNjdZKMyOonMyRmB/0ZWrrgvUWOJhFjlbIWBc5ZEdYuTQSnp7PRaEJyoTLBoEex2QJ23ZgetQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 19:41:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 19:41:22 +0000
Date: Thu, 18 Jun 2026 15:41:13 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/12] i3c: master: Support ACPI enumeration of child
 devices
Message-ID: <ajRJ2URg02R4AZyz@lizhi-Precision-Tower-5810>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
 <20260616095429.3947205-4-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616095429.3947205-4-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SN7PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:806:127::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: dd65533e-3c5d-4ac3-8ff6-08decd71934f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|56012099006|11063799006|3023799007|4143699003|10063799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zn7kvPHhc6Y9Yw20j7rTBYqCIzRNPfKQ7771W375zqsmLIA3dNUU4zFc7SDogbL06s4mSx5Cgz3gjEnDixldc1fJeyfIGD52bmK7j6pnc1XUPmSFf8RV2Hf9WrpjPOm4kpX4hk2gosO6otZBzKzpHhpqLacuAl/w/kj8LpdC7t06WU5Xodbaj0AiBj7oo2Ut6qAFRRRMgrNvy937LnoeDw697dD/KefGdANG8SZWU/u26PaVOUfUEGD+BlVhN7zhkW3kjWl0JLBtrwbgfSgaxoi2bV3GbubV+MH4E5giqO9Mi7TjA3Bvmj3fdFSrO5ouyKNuJ9W+nqUkHYY8484U4ZExcrT518lj05E/rH2IOZYmn+960uB6quN5pvnpP7934LT2vAQq78PED6dcqRiPh377seQJ8nsXJ+XFz585ox8ZdRIOf2iF/whoHpWjqBp+d8ua/bA4qP1BmnCB8tr2XUIIf3MGKPV6RxDEEkho3kzrTF4fRYikxZiwkgHeEWOEmPPZuOrjL1cqCDYHHHUvyN7fwo+ejNFDqXnkF8b3ylXQ4ItwwpvKzDQyTAzPCjkVmdXDRuMvgbhzeSYqxanTwa1oAFxf4B7TwdJE3ltPcEOgFGpmerUyLiXiuNSMd4+h4pttYlLfIoVu2ejon3CYEMIRe8vVaXcwrfucGASLFSkHoXvEmwEopbkshp1W2WlNYHGksSDR289wY+EtdyEw3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(56012099006)(11063799006)(3023799007)(4143699003)(10063799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vcY2xVMSh/fGa7o9wj4WMMMFN4fdUx7UKk13kzvfY/QGbcQuEXetujp0NLeo?=
 =?us-ascii?Q?XSfHw0qdy3UXgV4+WmkcCxG6wNKphkr4RCzqt/xZg704REwK7nN0C+Wlo4Rj?=
 =?us-ascii?Q?ftDeqH9ZxnzaVv7hPLv7ljpvZAzn52HUKdwaySwWaukEbldNBtgwPY2ciUv6?=
 =?us-ascii?Q?wqrHez+z789X03o5r8Ql50BVNLJhgQBbZ4IvffPdSswWxLiYs9l1ekl12XvZ?=
 =?us-ascii?Q?83WbHrTL7PCAI1EMyVmvob9H/55YMw+sQEz0rIbfcZVRCk2tVUyhntedrifk?=
 =?us-ascii?Q?rRLmpmoXYlzJii7BPKdik7mt3hK1qnO0VOqObA6XNuqc52jfGBXAjs8cH/Jz?=
 =?us-ascii?Q?yHXzLXfNeO24AEN5+Fyc1d48eHL25sLQIuqOoBzyUtYEZWJEwzBPN+UIsrXZ?=
 =?us-ascii?Q?rfViZz5s1SixpX1xe6xzuiaMj5+/wwOlwSHeNBAntiBW1YIDJzBOx/5yHhez?=
 =?us-ascii?Q?CIlPepRiq7s752rEn7Xx7JoUYr4QBKNXR1NCPAoRapDQFSn7sUaFT0uovmKY?=
 =?us-ascii?Q?cp0TPN2mfs0077+3nqU8mn7FWoXf/y99Orc4G6SNwnJPDF8dIVp/hDQKGea7?=
 =?us-ascii?Q?ujaIaJVZz4tikMFG5kLcF9u66SjnO64j5DwQIqORuCV3+ZpOnbtQT5kf0m4Z?=
 =?us-ascii?Q?MSTRqeJi3WeLjIWDO+paecxm/jdPtYUbp5qEYz2ysTqkhfK9Ny3DsEIZCgy4?=
 =?us-ascii?Q?nK+NAlKR/6YuI6mY9Z+pdW3eWVi5U9eth4SqNuslerQmU91HzTwsMLKsC+kz?=
 =?us-ascii?Q?MLvODNoWpq3ocrlQVQsBl7usrYjAgEt3yX3ueEsq2d/pfsyoDqP5MDfqs0Gm?=
 =?us-ascii?Q?o7CpkSQpdS2S9/G2/2p6go3oMmE7sjktK4XVTgk9qmt0SCkTpu+99WYVROia?=
 =?us-ascii?Q?30wTX/QwlykDO/NBCy/qyWxSzGhd9mWHZxRhUB+CP20Wu8GC9DORr2pcGCTp?=
 =?us-ascii?Q?iGKvnFP1AklYYi//MEqxU1cyuWI8tkMN7sf4j75oevScK+sN89aKwyLq2J+L?=
 =?us-ascii?Q?fuMpti3KIRJalZDt5xFxX9DlmroBurYYJ9uLUFYD46BKppo1JWyXaMlYai6G?=
 =?us-ascii?Q?ChPbY0dbfUNJXTTGS9mY3jhOeGTNV7fxkXmVdK+f3BYBTsETuVztxA/Zz4R4?=
 =?us-ascii?Q?mKihhVoGYaihv4SCu4QkYl+G1bmWTY3r7ZBmCKKdACQ2dou2Gq0FS6SPFbKR?=
 =?us-ascii?Q?YvV7WoQryGMfUNHCC9WnSbPti7qJoktGAIb+GFGzP3Sf2BsvgJCXyjYZBuH9?=
 =?us-ascii?Q?xqVRmz2deFOUR8DYf8GGPecCYb5LJCWl5/myQbaNPK9CTNF0DjOUT0NSiakC?=
 =?us-ascii?Q?ILWRamLEXowuLNQY94Vgt3oFdxqjL0nsNykAmyz+K91jhhW1z3/VHGwCU/Qg?=
 =?us-ascii?Q?Fz48AXHad4yRxS/3ZjI3vdV7M9g658grkqBFr4+DJXIzvUhkfr/41IA1zKcs?=
 =?us-ascii?Q?U5rkrGqUgAJsdxy/qiUqtj6wEEwI8TbySLgDmQj4iT0wcHWEhpfBqgoS+Cgn?=
 =?us-ascii?Q?uKCv++FvuUWybQCgmAL2vtHU/S3b1lHH3n3vG6YvJ7+R8431HZ0ttJCVNJ1y?=
 =?us-ascii?Q?djWVnxdFGkNosXOLDkfNr8eG9ztG29eekYuB9w5RxluLLun27xNRpYZ0yUpv?=
 =?us-ascii?Q?aw3LNqCmzl7Qs/JSnUFWZZA8m5IeyUq7HDQVKrKLyTHnowTyQ8bQs/APFm8b?=
 =?us-ascii?Q?NXPV3K6OYYKWHSoAkqY/YUYJSoQGk/c9B2qC72Ew9ZSip7Va9vPEwbmxOSng?=
 =?us-ascii?Q?hXPSdmW5aGjezytMB8aWl4wB3KKmDOP9EnLMavTTxDvMYDHpDHTd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd65533e-3c5d-4ac3-8ff6-08decd71934f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 19:41:22.2114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hmq+14BDrR2+FHlv0BQ/kBQcuHgOgfHcViHFBuv/oBPpk35WyUhekcJrq+hxZvjMwc1oMk19V+qat/sFUfouR8wiBKmolTp403U2D2g+MHP0SUvJph0Ylf3Y3cXh+K0V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

On Tue, Jun 16, 2026 at 09:54:17AM +0000, Akhil R wrote:
> Although the existing subsystem allows host controllers to register
> through the ACPI table, it was not possible to describe I3C or I2C
> devices when using ACPI. This is because the driver relied on the reg
> property to retrieve the PID, static address, etc., whereas ACPI uses
> _ADR or serial resources to describe such devices.
>
> Read _ADR and LVR from ACPI resources and extract the data as per the
> ACPI specification for an I3C bus. Also read mipi-i3c-static-address as
> per the MIPI DISCO specifications [1] to get the static address to be
> used.
>
> Enable describing I3C or I2C devices in the ACPI table. This is required
> if the device uses a static address or if it needs device-specific
> properties.
>
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 149 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 141 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 3b19a5e8f46d..f0e05bcac26d 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -5,6 +5,7 @@
>   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/atomic.h>
>  #include <linux/bitmap.h>
>  #include <linux/bug.h>
> @@ -2596,6 +2597,55 @@ EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>
>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
>
> +#ifdef CONFIG_ACPI
> +static int i3c_acpi_get_i2c_resource(struct acpi_resource *ares, void *data)
> +{
> +	struct i2c_dev_boardinfo *boardinfo = data;
> +	struct acpi_resource_i2c_serialbus *sb;
> +
> +	if (boardinfo->base.addr || !i2c_acpi_get_i2c_resource(ares, &sb))
> +		return 1;
> +
> +	boardinfo->base.addr = sb->slave_address;
> +	if (sb->access_mode == ACPI_I2C_10BIT_MODE)
> +		boardinfo->base.flags |= I2C_CLIENT_TEN;
> +
> +	boardinfo->lvr = sb->lvr;
> +
> +	return 1;
> +}
> +
> +static int i3c_acpi_add_i2c_boardinfo(struct i2c_dev_boardinfo *boardinfo,
> +				      struct fwnode_handle *fwnode)
> +{
> +	struct acpi_device *adev = to_acpi_device_node(fwnode);
> +	LIST_HEAD(resources);
> +	int ret;
> +
> +	boardinfo->base.fwnode = acpi_fwnode_handle(adev);
> +	acpi_set_modalias(adev, dev_name(&adev->dev), boardinfo->base.type,
> +			  sizeof(boardinfo->base.type));
> +
> +	ret = acpi_dev_get_resources(adev, &resources,
> +				     i3c_acpi_get_i2c_resource, boardinfo);
> +	if (ret < 0)
> +		return ret;
> +
> +	acpi_dev_free_resource_list(&resources);
> +
> +	if (!boardinfo->base.addr)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +#else
> +static inline int i3c_acpi_add_i2c_boardinfo(struct i2c_dev_boardinfo *boardinfo,
> +					     struct fwnode_handle *fwnode)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
>  static int
>  i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  			     struct fwnode_handle *fwnode, u32 *reg)
> @@ -2612,6 +2662,13 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  		ret = of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->base);
>  		if (ret)
>  			return ret;
> +
> +		/* LVR is encoded in reg[2] for Device Tree. */
> +		boardinfo->lvr = reg[2];
> +	} else if (is_acpi_device_node(fwnode)) {
> +		ret = i3c_acpi_add_i2c_boardinfo(boardinfo, fwnode);
> +		if (ret)
> +			return ret;
>  	} else {
>  		return -EINVAL;
>  	}
> @@ -2626,9 +2683,6 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  		return -EOPNOTSUPP;
>  	}
>
> -	/* LVR is encoded in reg[2]. */
> -	boardinfo->lvr = reg[2];
> -
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
>  	fwnode_handle_get(fwnode);
>
> @@ -2683,8 +2737,8 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
>  	return 0;
>  }
>
> -static int i3c_master_add_dev(struct i3c_master_controller *master,
> -			      struct fwnode_handle *fwnode)
> +static int i3c_master_add_of_dev(struct i3c_master_controller *master,
> +				 struct fwnode_handle *fwnode)
>  {
>  	u32 reg[3];
>  	int ret;
> @@ -2708,6 +2762,74 @@ static int i3c_master_add_dev(struct i3c_master_controller *master,
>  	return ret;
>  }
>
> +#ifdef CONFIG_ACPI
> +static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
> +				   struct fwnode_handle *fwnode)
> +{
> +	struct acpi_device *adev = to_acpi_device_node(fwnode);
> +	acpi_bus_address adr;
> +	u32 reg[3] = { 0 };
> +	int ret;
> +
> +	/*
> +	 * If the ACPI table entry has _ADR method, it's an I3C device.
> +	 * Otherwise it may be an I2C device described by an I2cSerialBus
> +	 * resource. If no I2cSerialBus resource is found, ignore the entry.
> +	 */
> +	if (!acpi_has_method(adev->handle, "_ADR")) {
> +		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
> +		if (ret == -ENODEV)
> +			return 0;
> +
> +		return ret;
> +	}
> +
> +	adr = acpi_device_adr(adev);
> +
> +	/* For I3C devices, _ADR will have the 48 bit PID of the device  */
> +	reg[1] = upper_32_bits(adr);
> +	reg[2] = lower_32_bits(adr);
> +
> +	fwnode_property_read_u32(fwnode, "mipi-i3c-static-address", &reg[0]);
> +
> +	return i3c_master_add_i3c_boardinfo(master, fwnode, reg);
> +}
> +
> +static u8 i3c_acpi_i2c_get_lvr(struct i2c_client *client)
> +{
> +	struct acpi_device *adev = to_acpi_device_node(client->dev.fwnode);
> +	struct i2c_dev_boardinfo boardinfo = {};
> +	LIST_HEAD(resources);
> +	int ret;
> +	u8 lvr;
> +
> +	lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
> +
> +	ret = acpi_dev_get_resources(adev, &resources,
> +				     i3c_acpi_get_i2c_resource, &boardinfo);
> +	if (ret < 0)
> +		return lvr;
> +
> +	if (boardinfo.base.addr)
> +		lvr = boardinfo.lvr;
> +
> +	acpi_dev_free_resource_list(&resources);
> +
> +	return lvr;
> +}
> +#else
> +static inline int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
> +					  struct fwnode_handle *fwnode)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline u8 i3c_acpi_i2c_get_lvr(struct i2c_client *client)
> +{
> +	return I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
> +}
> +#endif
> +
>  static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
>  {
>  	struct device *dev = &master->dev;
> @@ -2719,7 +2841,13 @@ static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
>  		return 0;
>
>  	fwnode_for_each_available_child_node_scoped(fwnode, child) {
> -		ret = i3c_master_add_dev(master, child);
> +		if (is_of_node(child))
> +			ret = i3c_master_add_of_dev(master, child);
> +		else if (is_acpi_device_node(child))
> +			ret = i3c_master_add_acpi_dev(master, child);
> +		else
> +			continue;
> +
>  		if (ret)
>  			return ret;
>  	}
> @@ -2787,8 +2915,13 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
>  	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
>  	u32 reg[3];
>
> -	if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg", reg, ARRAY_SIZE(reg)))
> -		lvr = reg[2];
> +	if (is_of_node(client->dev.fwnode)) {
> +		if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg",
> +						    reg, ARRAY_SIZE(reg)))
> +			lvr = reg[2];
> +	} else if (is_acpi_device_node(client->dev.fwnode)) {
> +		lvr = i3c_acpi_i2c_get_lvr(client);
> +	}
>
>  	return lvr;
>  }
> --
> 2.43.0
>
