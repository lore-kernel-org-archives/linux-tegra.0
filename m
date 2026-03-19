Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339F435C180;
	Thu, 19 Mar 2026 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930601; cv=fail; b=u3m+R4a65IM+/EOIafO7bWsmvzvPLrx/V/C5cyUCL8oGozl7QrgjZeLp89Rgr9bcTaCs3T/0VFjY7rknLVQJnwpNc371k1vtZi6Ni+HoyWrWseHgBbKBoiy685tcyoOJVv4WqbjBXHFjS9XGoHkBBUkTHYd+nUM26nYtD2ZK+ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930601; c=relaxed/simple;
	bh=jTtfLuaVtoTY0HzcPAPulymofUF7NtD9odc06kcJhZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e6KV1j06TbrTu4r4OYRLzSAOybZwROy7JD/uKZzkyhwFjP1v/NmQD70lh38sT4gqaoYp3yTDozg7H/KjT0pHA5JnPLkH11qrW7Dc1Kr64tsqX6uoxKgXgA0NywkM2mxxgMI++6pfJo4Wh57qvH91wpqOkVKAcHU1xtkN3EKi6n4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VoDAJxeX; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VoDAJxeX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maisuyrUaudD/7jfD20LoAR519Ev1AJ+0IwN7CHUyDQ7vRqVv2/VmbQvP/5/3rAY0ABb1FmqV8R3BdzEcOWaCbsJVvK9qlrX+Mnt+ib3tx5cPMLK37kMruT/GOGex9rcfJsSUKNeaXp/xhBNrfq4AwVVZh3uGlboc6NZQh5OsX1Lbst/rQQLHE45wcJj4AFZAwIwBxj+Fjbz+XMjVFhvfzfExpRq8k7BHxMkentkDrHPraLOGe+BQSLQDfxSMR637dHWbbrTOvvhSo3WVdIuPBR/fJwGeED7oNY0S0Z72N37HJHZ2FyjLoaM69umE1VrW4jmBeZ0g9HUaU9jFVnogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDDDaUZI/jV56iGm0BNrraqXa/iW0rff9o6uT4jTXEI=;
 b=mYIj7ARm33AzuPk57M0ZQfZ/MPIvVl8FEiUTiPZTbEAkUY8GhIdBTnJrLDXpGgEAwumToCLuhiZHfWdlz2FnHoXda+EjXGXFwOPV79ikbnLPCU3otxMb3kALmc0a5KYmWCGITqXChmghziBUHVkejwSfRYT+/Aq/bR7Nk1F8JdjW77D9why0wzyxtExSXCm1JMGBBS/plU0qqir2l73kffQrbViUS9veytGew7jHeZOuzFqn7w5pRuIAeqxiuqNdl1vHqvlgRyd1lKnKP4maayhvXC+ijRnDmrk2no46UxDVAp5J7Rv8YGYPX1hgBtxg+CcRDHn85yCv4V63M3hSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDDDaUZI/jV56iGm0BNrraqXa/iW0rff9o6uT4jTXEI=;
 b=VoDAJxeX+0QFeVBrVHuYWOtsJKgRlePw2qNREfTIp1O9jI9C/7XhBDe2cSFq/h7IigqJtsY3e+HLWTr683nIm1IyN7mmroVqAw5CXt8cvNyyHpTkxTezrPB34GcZ6FLzsjU2+che3zc7iUMcqDwXqtsx3A7BeGIagVaLSSoxyq+LptKu3eOT/eidYpmKonozPSht4yEtTYQdMUwSITktsS1bJPJn8+d57yT+P9hdEjdA4jRhi0SS9nbTbO6f3ryMiXpb5/F57QlECGpoNiKansuR0L8Dss3ooV4BWtGMxuLSCIpz0zShs/JRYtOMCm8oZANuLMJjgn3HCNZv4vP+xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11096.eurprd04.prod.outlook.com (2603:10a6:150:27b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 14:29:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 14:29:48 +0000
Date: Thu, 19 Mar 2026 10:29:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Message-ID: <abwIUmXfapfi1k3D@lizhi-Precision-Tower-5810>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-5-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318172820.13771-5-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: 211e114d-04aa-43bb-621c-08de85c3f958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OqRRsIvVbb8aO51pVdQWWnzxMSFZKiB9m+TSF80tMuc5qjDK58ZxU/t/MgC6qUAVuZcMzXx9Dsb0joBU3GNdSD4KS3lLybxIYD+U5CZAmZ70xP3gc+q/NzhlsEkS4agrr+jXArcsSwRRWYfs2XLicgJJN22lCYG6nrmCtRM6lbsRVN9iL5sqol18634Hb64lNFKSTJeo9MXGsBPE0z1cjrWKoXSyKH8vRosxtOrNhWOTct/l9PyB5AHwzn3QzR9hT/rbs9R3ngda0KXk0i2zkuw+cFDecQ+98R1ZcScLeihY9tb/Vpw7M/+AWkTPM7Z7SQCIl5a1eK55atBT6qrNeOl6LFke35Qbr7UzNrNer2HDUs+J/T6dyvbTN9FmkLA4PZ8/6bIljfyAorZ8Pkx2TTbc96txkcgsRgCxJUaMBZ/iXVaxMM17fTEaqlhqgcsVNyxo6nUMNv8V591+7hO5RKwGpzJ3kW7z2x4Uk0ZecvwqgaGkviynyedr+DfxmUFagEXy+nVgdF+aCFWO5XLc/i6xn14WKVnTpU+Po7EJkL1oarS2WoSIGDedmR7/38VzdMt84iRA6xGiVFcPhQOO6gZPPfBjMvueFezj4VYMxowW6HlJobK0785wcU8LFIBHC9gzqnCjm09y3JJc2Q7IcCBi4r6oFcZOoo4eEF4bQVGCSzsw0WdMbgbOtg7I+GZ+Qir2bHbKS/FxB57lRXbsxqG2smFEf85fY7DdJRnh6Zdgd2w70lC/MUmUpIC0Qp3E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2vtEQgf34y8Iy031XUpykaHC4CqagbYOim8ka/TJYnftffu1H7USk+AVr4At?=
 =?us-ascii?Q?7CfqLfnzzx2MOU3MYrlhj9m0WsJecnRjB4qeMhs9fgZ8/Xh73obwnGFqNHIy?=
 =?us-ascii?Q?OzqXwTgeKBcpovziDdkYjuOPpScY01uDW+M09rKZTszeu3C+zWoO/rIZ8OFH?=
 =?us-ascii?Q?rce5gLuT8mt9tV6psyjIagchq1UhAPBgK4Q8v9nr28C/Ah4jbKq8Kl9LDCFZ?=
 =?us-ascii?Q?aUSB794ShL3NOw2CWPGUxM5JcKUOclInlY1/EF8P3vG+6X36PvM63CYqSShM?=
 =?us-ascii?Q?aVwpd6mKUbebS00S6bMpdrUcuFLfZCkTosXPYVwhJ7LCpZOq4xKfvnHHWNNc?=
 =?us-ascii?Q?I2iHuP0CgCOR1eoFEszaHBG3MT4OlJGKq4f+YiVlX5ZlWEgyxqQyBiv9E9/u?=
 =?us-ascii?Q?0o7K3UBcHiJVZyYNSxpNgOSffmrn35iZkxKQurQtCfhJGhp2npkaaBeLEuys?=
 =?us-ascii?Q?yal+dSTbw66Bn0a/zv4F99fw1huiL8/LU1CX4l2EXfWd4oLO/kVMaFubWXI/?=
 =?us-ascii?Q?vnIl4KEttf0FpQgvROj3OGn3yig5Ktp66ibHyI6ZLvU//lI5Cnq/o4/YqFPp?=
 =?us-ascii?Q?wWXX0oECJgKkVo7POU2P00kJ2ntsplQsi0iXoxlNIulYiXCiHfyjiQJ59V0L?=
 =?us-ascii?Q?qhVwxTCexl9Ia5PX3LXT/aZWfK56fmMES4MCupEte71CF1TAgyot4tEBgRzq?=
 =?us-ascii?Q?O2ol9pZgrareojG3FdzCc4dwKxdCQvyLHuHF1Whb1V9itQhcTqmmnqqNRj7H?=
 =?us-ascii?Q?5UbMFxpgaOPcDM7oPBeSwUEorLtphCeV255l4A2yX23UggFDT98tuqVsDxIs?=
 =?us-ascii?Q?jw67v3XV3kdHb7UPo+3y2S/5msT+5lR76wspy1ZzBGvm49GQ4FWng/o5QBef?=
 =?us-ascii?Q?DPLSpeuWMvQZ5ZesRoBon5z5rZ5v7QQW1kcIeYIP14LMmbXzmOmnxOKiBcsE?=
 =?us-ascii?Q?YaeDmjCmXJ2B1Tug4g9fcOiCwty61kZAi8hJxE/5m5h4DW3+Ce3msFHhLyAk?=
 =?us-ascii?Q?sPD6P+73ywjH0ZuacUinTyRCK2g8G5okZa/N+Q7u4vt5ZTGOBvijIaIXukkR?=
 =?us-ascii?Q?j/seBa9b3cozmkZ+t8SWtgYVL8FeaVMcw6PYmVjRUsodZg1FpIAny7U/j6lj?=
 =?us-ascii?Q?8M24RwZmL2+Tp5sa4+6X6yt+1m66y2nguuwxoKYdAR+27j6ST35j1121vEib?=
 =?us-ascii?Q?lgWn3geo9Tka/xA1eX/AXylAC5UWKCqAToHI+a/hIyLOuq0wh3z4v+0Hj9Jg?=
 =?us-ascii?Q?vW/CeWSxBYL83GI4OdyayQt2HTTu3WpuSGW6gedhFO/dOY+9VKHlDnI3jx8l?=
 =?us-ascii?Q?ryJuajAOSZW5tp7fB/ZQFdO0A0/pjT1jHC4VAHiTZxaeSsEvMRw+J+E56Om7?=
 =?us-ascii?Q?xkH1fkocBrdGMm8sSdv8aI89FDZVTlTvoqY5x3ywzs/0D9AfqWtuIqpgeExC?=
 =?us-ascii?Q?6zzQiNimqrV+t6QBipMvr1T/vieAn9wmuBeBdJ80Toa1IqeAOk+U3owXbA6w?=
 =?us-ascii?Q?carvhKuGwOzvJfU443kXRo2i5qBzupjUs+M5bCZ6LODeVlq3g6OezbyZZqXG?=
 =?us-ascii?Q?CL4ebljseNmKUIgvjYtjDZC3DVmxuklnlF3SEQuUqywTTH4Q7TweZFK7JVL+?=
 =?us-ascii?Q?zhucKHnUygpMLqy68ZobKUQ49liT19oVd+MOTl/POdKC/4kKgCFrYhABwoOs?=
 =?us-ascii?Q?uKNiSJzXOIBaClzfUQwTcMKeKJWVxJhl0+Q24aXVHsjjV2Vq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211e114d-04aa-43bb-621c-08de85c3f958
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:29:48.5859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HXprRTwJv3WyM6BXQV3XMMXj6stUoI/uR1txFRZZIoJaHUQKbCxjQOtO82xsBqzRq5556oGF2AKFGdoQgA3ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11096

On Wed, Mar 18, 2026 at 10:57:17PM +0530, Akhil R wrote:
> Support ACPI enumeration for I2C and I3C devices on an I3C bus.
> Read _ADR and LVR from the ACPI resources and extract the data

ADR have _, but not _ before LVR, I am not familary with ACPI.

> as per the ACPI specification for an I3C bus. Also read
> mipi-i3c-static-address as per the MIPI DISCO specifications [1]
> to get the static address to be used.
>
> Although the existing subsystem allows host controllers to register
> through the ACPI table, it was not possible to describe I3C or I2C
> devices there.

why?

> This change enables describing the I3C or I2C devices

Don't use "This commit/change/" just Enable ...

Frank
> in the ACPI table, which is required if the device is using a static
> address or if it needs some specific properties to be attached to it.
>
> [1] https://www.mipi.org/specifications/disco
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master.c | 101 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 93 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2c479fecbfdf..15a356a2b3c8 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2404,12 +2404,31 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
>
>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
>
> +static int i3c_acpi_get_i2c_resource(struct acpi_resource *ares, void *data)
> +{
> +	struct i2c_dev_boardinfo *boardinfo = data;
> +	struct acpi_resource_i2c_serialbus *sb;
> +
> +	if (!i2c_acpi_get_i2c_resource(ares, &sb))
> +		return 1;
> +
> +	boardinfo->base.addr = sb->slave_address;
> +	if (sb->access_mode == ACPI_I2C_10BIT_MODE)
> +		boardinfo->base.flags |= I2C_CLIENT_TEN;
> +
> +	boardinfo->lvr = sb->lvr;
> +
> +	return 0;
> +}
> +
>  static int
>  i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  			     struct fwnode_handle *fwnode, u32 *reg)
>  {
>  	struct i2c_dev_boardinfo *boardinfo;
>  	struct device *dev = &master->dev;
> +	struct acpi_device *adev;
> +	LIST_HEAD(resources);
>  	int ret;
>
>  	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
> @@ -2420,6 +2439,23 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  		ret = of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->base);
>  		if (ret)
>  			return ret;
> +
> +		/* LVR is encoded in reg[2] for Device Tree. */
> +		boardinfo->lvr = reg[2];
> +	} else if (is_acpi_device_node(fwnode)) {
> +		adev = to_acpi_device_node(fwnode);
> +		boardinfo->base.fwnode = acpi_fwnode_handle(adev);
> +
> +		ret = acpi_dev_get_resources(adev, &resources,
> +					     i3c_acpi_get_i2c_resource, boardinfo);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		acpi_dev_free_resource_list(&resources);
> +
> +		if (!boardinfo->base.addr)
> +			return -ENODEV;
>  	} else {
>  		return -EINVAL;
>  	}
> @@ -2434,9 +2470,6 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  		return -EOPNOTSUPP;
>  	}
>
> -	/* LVR is encoded in reg[2]. */
> -	boardinfo->lvr = reg[2];
> -
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
>  	fwnode_handle_get(fwnode);
>
> @@ -2491,8 +2524,8 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
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
> @@ -2516,6 +2549,31 @@ static int i3c_master_add_dev(struct i3c_master_controller *master,
>  	return ret;
>  }
>
> +static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
> +				   struct fwnode_handle *fwnode)
> +{
> +	struct acpi_device *adev = to_acpi_device_node(fwnode);
> +	acpi_bus_address adr;
> +	u32 reg[3] = { 0 };
> +
> +	/*
> +	 * If the ACPI table entry does not have _ADR method, it's an I2C device
> +	 * If the ACPI table entry has _ADR method, it's an I3C device
> +	 */
> +	if (!acpi_has_method(adev->handle, "_ADR"))
> +		return i3c_master_add_i2c_boardinfo(master, fwnode, reg);
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
>  static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
>  {
>  	struct device *dev = &master->dev;
> @@ -2527,7 +2585,13 @@ static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
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
> @@ -2593,10 +2657,31 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
>  {
>  	/* Fall back to no spike filters and FM bus mode. */
>  	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
> +	struct i2c_dev_boardinfo boardinfo;
> +	struct acpi_device *adev;
> +	LIST_HEAD(resources);
>  	u32 reg[3];
> +	int ret;
> +
> +	if (is_of_node(client->dev.fwnode)) {
> +		if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg",
> +						    reg, ARRAY_SIZE(reg)))
> +			lvr = reg[2];
> +	} else if (is_acpi_device_node(client->dev.fwnode)) {
> +		adev = to_acpi_device_node(client->dev.fwnode);
> +		memset(&boardinfo, 0, sizeof(boardinfo));
> +
> +		ret = acpi_dev_get_resources(adev, &resources,
> +					     i3c_acpi_get_i2c_resource, &boardinfo);
>
> -	if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg", reg, ARRAY_SIZE(reg)))
> -		lvr = reg[2];
> +		if (ret < 0)
> +			return lvr;
> +
> +		if (boardinfo.base.addr)
> +			lvr = boardinfo.lvr;
> +
> +		acpi_dev_free_resource_list(&resources);
> +	}
>
>  	return lvr;
>  }
> --
> 2.50.1
>
