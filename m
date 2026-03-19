Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074D32D9EF4;
	Thu, 19 Mar 2026 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930181; cv=fail; b=ioGcdvo5y/iHcFGnRYMs0Q3CSle8ZONk31SpFSIaYQighWy2WGGtT2T6TuqBZW9b6V9Iosc14v+8h11S493hJ+uzaj8ukFEcBJSpRN9QJsJpjYNHOV7Dnyg80h4gNV1WobO57567Wwj1n0AZHxeeTQmrBb9AYR9IqbSR4gG8buE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930181; c=relaxed/simple;
	bh=JJdjyswDZ8kjJ/f4qrpSP5TEOi2grh5Ksy+C+gVWYCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Tq8POupR+Ea2leNt7PCQU1DQVJk7nwkwe2SqosyQ7qrOaX/h9AeCO0MRZRYoPpyoPU1FVfb7rtwCd9ggDpwTZiVX3yxCHpl5XeWth1SMFYyQ4UYtbpBhXndhzQuw1Do9BZCK1kDrNcBhek+921CcOGDMXwfkrbXHO8Pz/LP44r8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MEYmk60L; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MEYmk60L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9MmapC5umykwL6kwdyuVeumvDLlQ/ecAg42txZo3A6pQuPTT4CzkswoWXHscX+KdgspXML0m5iksxM4g9ZTDABcQHC+bu/nArEhT6fauu8P63/XAFw6R+RXePJbZ93W1E/fO3mvQ9ksa3Zvj8qGElsZjJxCZbnFR8dwkuygQwHukEDWWuX7C5vfQwzANBlK/iHRaBbGEeRHYGCrKOLKPtfK1XtiwO6lHR7Mccm9zJ2qetow2ADkoDVTgPoCj35rGjXDJqtLOsrT8hQBoJLN/MSLzjyF/HbNSu+s1++GxtMG6XlcRp5RD28eeq2lGJ3Z5qepcAJh8b/LgdA3PWRiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMql4daNQ5mP2+uWpgytvud9fYkRBNok6N9mz5koM2I=;
 b=cD7KyPr1huD0GKRjR1FHIEU/j17vCUaWl5nOxmClf43crB66VJOx+WfHmO0IakBh6JODy5kUTRokrJiM1GTLFVe3oHu3yCVc4EMUOGMbWUSFbvr6VeLXvSKXfRW6EpcSrZmUMTQD8cBG9NsKO2oN7Ut6FABIl0odwg/j535k1tnBBPqUwLGeK2CHH4mt5A2Lo45NPGAR0KdWnui5Qc2NdRX2E8zlPy4ZhSyDXlUaUGGDLkZCwMVP96uzHwKn2gkSxx3JLHEguSdezKHJGSdoYk/LBH+e3nauptr16wNZVXVBrDA54Q0kjtjcJ6FfvNZId6LS9hGWXu+s5fYJDsjcYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMql4daNQ5mP2+uWpgytvud9fYkRBNok6N9mz5koM2I=;
 b=MEYmk60LDUm0aca99t269N4ua0uIG4eVKW97Iw7NQr1zPzMqUXdTWJPsDYrOz/DFPM/PzdwA3yNusywDOv/8mlpZVge+VZvMSGcNKWYXqIovDwP02IxQVYtHZRjUlpcjBp17A9bnMUNptyyuKzRiW+5m8gqsIGUjcazWTNJoXo4ys92A6VGvuJVhLJPu6/ybKIhHIu7m6efEp6VC5OQL97UR+8neU/EwZF7zfLrnsnSq3SEFQ+E9LAuBIr16W62YeD20524YV0mC5lYlivbDakCrMzWoXOWyYfDYRkyOm3+chaOIL/o6GSizJmKF4w8nAp7DRUV/P5ONsorwPJie4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB9710.eurprd04.prod.outlook.com (2603:10a6:102:268::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 14:22:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 14:22:54 +0000
Date: Thu, 19 Mar 2026 10:22:47 -0400
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
Subject: Re: [PATCH 03/12] i3c: master: Use unified device property interface
Message-ID: <abwGt8IyQxb5A4vg@lizhi-Precision-Tower-5810>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-4-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318172820.13771-4-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SN7PR18CA0021.namprd18.prod.outlook.com
 (2603:10b6:806:f3::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB9710:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e131c6a-33c8-43ff-8ece-08de85c302ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|38350700014|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	9L0Eec0uk9ZaOBVq+H0y/rukxWyK3ezgRk05usIn0mkzLoiJCpVDIsvGea09tSmGnfsFGO4C0fUx+gP1q6unu5bKOue/hYGoVRRnRhw53MbgXsNn7vIobvZhuVDM/0EswwR59mbXHbxJRhqhLHdNvQc/OnjeWF11UxgqIzRfI3qnSFq4QcmeuiakIWtSD7cvmd9Q/vXaWPw04Z9Sj5aH0iGCmb6Vmk3vlTkXwwMp34fg50o1g5aRiOMIVcYx3eBCDwdpx73y65YAb9+l9cSl5qQc/iOJ/jaj/1q9LFIt/Nq0OW5r73TwNpGB5OjikuKiIFje0RzBxzA4jT0ozHTaJIL+QeA9A4foIgbJqVWD08nDSe7CUc4A3pg1gGZA/bNj0bBEc5hWvSOU38dWr3J46uGN4M9/0mATDGF7yDn6yooIBn3qg0f8naehxPvndHcKX9sGAe+2ZDUHzCHgsosa8WP3Wx05g5sX9wqYKTzrIFlZO116A7SEQo6sG/JJ/h0E4/vZwfGPPK/jjyaSggbKKR69oFY0a2Ky4f+ymMQpxQKoty47E2QAkxVYd2iHzEMITrWmsOO4kFmj3iFN99YgWvO6gJkNCWSZ7i18frTEDuunERePfffV1Jym5INtfbXfWiCbAJ60rW6PIT8/acuQcaVQIJOyF0l0Ns+sMEe15VDv+tN7LA2V1epSGNeQCTaKZIS6jJ5joosZEmMfZxf3GGbf6OXvd5VYzAeVFg4EcpSqJbegJ9pyWhnb8cYT2F1vcG74ATYFIwkWRq9hhmCtaaYrxa11cG4d6nTCAW1VTP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iW+RoJ1br3hNO2AeQAKNo43NAinAHEJKu3m2XkRmrX9VFUWCt/n4uz46c39C?=
 =?us-ascii?Q?SXviorWH6TVJhCaAcNJjvvXCAi0w8offHdrBwz1WUTXPI3Vm/GDNqo69ZJkU?=
 =?us-ascii?Q?L0efFOIw645l1g2BIBZPl3dZ/cvGrgmU2kbGv6blN6WOs04KBuYXo3KdkmXu?=
 =?us-ascii?Q?EJGSiPDi1Ql9OpfZLlHbOfth005pMhyu0YHCX3PTEs2gUD7AT7R3+1i1mevX?=
 =?us-ascii?Q?sHiUX16nXYT6h3pVh74aNRZB5KDNvufbPwmMKPvVxrJnxyTbwisqU1W9CVqZ?=
 =?us-ascii?Q?xnX0Jaw2M2vH47CM0LmCZFLyQOoAeudnUA4jWciSHVUpEiRahvjgP4m9wxg8?=
 =?us-ascii?Q?dzFI9O3dSu3Qj5HNKXj1Z1JhWNEysocds2RUVh0PC/CU7GFSMONirE2pv9e5?=
 =?us-ascii?Q?HytR5aihQcnOHlVEa/njgYljdzblGv/sbxOlYe6cgB241fUplzFP/thtYikL?=
 =?us-ascii?Q?P0uBCZzM5xUKXsiARAcJeS5y0UEpTZrI2ZbyWAZlnbzr12cNXpC4JQ8BN/X/?=
 =?us-ascii?Q?vunJlkKfQxLqhOm0gt8kwsMlNLm3k7tsA5Y0i/x6YtXy0m/mpImhcxGvoeom?=
 =?us-ascii?Q?fzbNqwM4bQHsTNbkVm0qvjWMey1jLAW+GivRTEsN3y2nC72nUhan9XphR+J5?=
 =?us-ascii?Q?jEq/C+aM1EUWdmvnirS42nQxcvSIx6ndfoTV5QbsNTs2jVexK5eKQS51yuTy?=
 =?us-ascii?Q?2tu6ogXrmTXKtTd3EFWR1SA9z3mLSFfV9RCk5xgPc67dLCsBQtKYkOG3thJ4?=
 =?us-ascii?Q?fHlfWB22ytdT/pf/j/7IK2Aw089aorwnuwknykB9OWN8CiFbwC1ZWwIVYntN?=
 =?us-ascii?Q?bPPZcR5F6asU8qjPmqU9GsD0A9BzBfNOloIu19avIGYWp+23/e8yKu005Hw0?=
 =?us-ascii?Q?sKH3GDpsPKxpckmQ/37kwedNeTIZ9YBUE5LIYnVs43SZGjW0iYVhGUGCtg/d?=
 =?us-ascii?Q?JXwUUT4R9LxSmg3ilR/8PeAwQXIXmQPIb2Nntx2m0Rf2kfxA1pk8vTA606YE?=
 =?us-ascii?Q?91lZJCUR7qoQkxMGKm/61mS6L9/aFx6eaxb/+7RghzGo7bAiUegeaXSNRXFP?=
 =?us-ascii?Q?J/7fddlh2eXBTjs43lTtlnqty+s66MlZaJhpnZBEHAVwMpxJHhRIvSWFsLwQ?=
 =?us-ascii?Q?h27J8zap6gtElcDJVhB+/HvBVJntQiXUdYllA0lS2APA1FLMcSOvqWR68Z2B?=
 =?us-ascii?Q?iSIzDKeDnvladNHCOX2M3lRib/0LzPnjzEif2ReAZrrenbVd9nDnQFpINIZ5?=
 =?us-ascii?Q?dIqUaBgNaJl47Ku4GjqYSu76K5zGaxkDwdQ/AfS9Sq2KLP9HkRZ9Wd/SaG2Q?=
 =?us-ascii?Q?8qXPuXsF3tlkF7uPNMdEh0t/CYiyGAiyvq91Whn2zHWa19Nt+CvrKO6ACccO?=
 =?us-ascii?Q?ciMvM7NO9SzSti8O4OHtMxxVRLQQ5jn1LeP7UmCdmqK/WjDpf+gNAXrBL3c3?=
 =?us-ascii?Q?RGer3h96tPu5avMLxBbdpy7j3nf9ZFyll0a7OTUa4iO1iTtamtizwdIR8v2S?=
 =?us-ascii?Q?RbPvwpVViwSk+lmy8zbMAOYErz1mgzpO7el/P9Det62bmSeHqxSHttmS5wRh?=
 =?us-ascii?Q?kbpdltPUOyUdZj44NlIMXVczwZ1SrqTQ3Abp/HsogjOJqi2OwoUk5dWBQGhr?=
 =?us-ascii?Q?BVyOxzvU6z8XIM654xIP7WpgCmcBqxeZo+5L4bscHluaFViDvRFMa/whubNo?=
 =?us-ascii?Q?0CsZ9SlPJaSZpviD/+uL2CzHKMclMw99LzQwFmf0xhvG7R0e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e131c6a-33c8-43ff-8ece-08de85c302ac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:22:54.8599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlxZsFnnSSghjsW1Y9qRMezLvzaC/7oceXlyxnOSRSMA7mZiUMqeQEQydFSMg4/Jk0SYbXOLPxKkvU/uHgaMIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9710

On Wed, Mar 18, 2026 at 10:57:16PM +0530, Akhil R wrote:
> Replace all OF-specific functions with unified device property functions
> as a prerequisite to support both ACPI and device tree.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master.c       | 91 ++++++++++++++++++++++----------------
>  include/linux/i3c/master.h |  5 ++-
>  2 files changed, 55 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index c32847bc4d0d..2c479fecbfdf 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -5,16 +5,19 @@
>   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/atomic.h>
>  #include <linux/bug.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/i2c.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/of.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
> @@ -497,7 +500,7 @@ static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
>  	mutex_unlock(&i3c_core_lock);
>  }
>
> -static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
> +static int i3c_bus_init(struct i3c_bus *i3cbus, struct fwnode_handle *fwnode)
>  {
>  	int ret, start, end, id = -1;
>
> @@ -507,8 +510,8 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
>  	i3c_bus_init_addrslots(i3cbus);
>  	i3cbus->mode = I3C_BUS_MODE_PURE;
>
> -	if (np)
> -		id = of_alias_get_id(np, "i3c");
> +	if (fwnode && is_of_node(fwnode))
> +		id = of_alias_get_id(to_of_node(fwnode), "i3c");
>
>  	mutex_lock(&i3c_core_lock);
>  	if (id >= 0) {
> @@ -811,7 +814,7 @@ static void i3c_masterdev_release(struct device *dev)
>  	WARN_ON(!list_empty(&bus->devs.i2c) || !list_empty(&bus->devs.i3c));
>  	i3c_bus_cleanup(bus);
>
> -	of_node_put(dev->of_node);
> +	fwnode_handle_put(dev->fwnode);
>  }
>
>  static const struct device_type i3c_masterdev_type = {
> @@ -995,7 +998,7 @@ static void i3c_device_release(struct device *dev)
>
>  	WARN_ON(i3cdev->desc);
>
> -	of_node_put(i3cdev->dev.of_node);
> +	fwnode_handle_put(dev->fwnode);
>  	kfree(i3cdev);
>  }
>
> @@ -1783,7 +1786,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  			     desc->info.pid);
>
>  		if (desc->boardinfo)
> -			desc->dev->dev.of_node = desc->boardinfo->of_node;
> +			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
>
>  		ret = device_register(&desc->dev->dev);
>  		if (ret) {
> @@ -2402,8 +2405,8 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
>
>  static int
> -of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
> -				struct device_node *node, u32 *reg)
> +i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
> +			     struct fwnode_handle *fwnode, u32 *reg)
>  {
>  	struct i2c_dev_boardinfo *boardinfo;
>  	struct device *dev = &master->dev;
> @@ -2413,9 +2416,13 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	if (!boardinfo)
>  		return -ENOMEM;
>
> -	ret = of_i2c_get_board_info(dev, node, &boardinfo->base);
> -	if (ret)
> -		return ret;
> +	if (is_of_node(fwnode)) {
> +		ret = of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->base);
> +		if (ret)
> +			return ret;
> +	} else {
> +		return -EINVAL;
> +	}
>
>  	/*
>  	 * The I3C Specification does not clearly say I2C devices with 10-bit
> @@ -2431,14 +2438,14 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	boardinfo->lvr = reg[2];
>
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
> -	of_node_get(node);
> +	fwnode_handle_get(fwnode);
>
>  	return 0;
>  }
>
>  static int
> -of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
> -				struct device_node *node, u32 *reg)
> +i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
> +			     struct fwnode_handle *fwnode, u32 *reg)
>  {
>  	struct i3c_dev_boardinfo *boardinfo;
>  	struct device *dev = &master->dev;
> @@ -2461,7 +2468,7 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
>
>  	boardinfo->static_addr = reg[0];
>
> -	if (!of_property_read_u32(node, "assigned-address", &init_dyn_addr)) {
> +	if (!fwnode_property_read_u32(fwnode, "assigned-address", &init_dyn_addr)) {
>  		if (init_dyn_addr > I3C_MAX_ADDR)
>  			return -EINVAL;
>
> @@ -2478,14 +2485,14 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
>  		return -EINVAL;
>
>  	boardinfo->init_dyn_addr = init_dyn_addr;
> -	boardinfo->of_node = of_node_get(node);
> +	boardinfo->fwnode = fwnode_handle_get(fwnode);
>  	list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
>
>  	return 0;
>  }
>
> -static int of_i3c_master_add_dev(struct i3c_master_controller *master,
> -				 struct device_node *node)
> +static int i3c_master_add_dev(struct i3c_master_controller *master,
> +			      struct fwnode_handle *fwnode)
>  {
>  	u32 reg[3];
>  	int ret;
> @@ -2493,7 +2500,7 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
>  	if (!master)
>  		return -EINVAL;
>
> -	ret = of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));
> +	ret = fwnode_property_read_u32_array(fwnode, "reg", reg, ARRAY_SIZE(reg));
>  	if (ret)
>  		return ret;
>
> @@ -2502,25 +2509,25 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
>  	 * dealing with an I2C device.
>  	 */
>  	if (!reg[1])
> -		ret = of_i3c_master_add_i2c_boardinfo(master, node, reg);
> +		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
>  	else
> -		ret = of_i3c_master_add_i3c_boardinfo(master, node, reg);
> +		ret = i3c_master_add_i3c_boardinfo(master, fwnode, reg);
>
>  	return ret;
>  }
>
> -static int of_populate_i3c_bus(struct i3c_master_controller *master)
> +static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
>  {
>  	struct device *dev = &master->dev;
> -	struct device_node *i3cbus_np = dev->of_node;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>  	int ret;
>  	u32 val;
>
> -	if (!i3cbus_np)
> +	if (!fwnode)
>  		return 0;
>
> -	for_each_available_child_of_node_scoped(i3cbus_np, node) {
> -		ret = of_i3c_master_add_dev(master, node);
> +	fwnode_for_each_available_child_node_scoped(fwnode, child) {
> +		ret = i3c_master_add_dev(master, child);
>  		if (ret)
>  			return ret;
>  	}
> @@ -2530,10 +2537,10 @@ static int of_populate_i3c_bus(struct i3c_master_controller *master)
>  	 * on the bus are not supporting typical rates, or if the bus topology
>  	 * prevents it from using max possible rate.
>  	 */
> -	if (!of_property_read_u32(i3cbus_np, "i2c-scl-hz", &val))
> +	if (!device_property_read_u32(dev, "i2c-scl-hz", &val))
>  		master->bus.scl_rate.i2c = val;
>
> -	if (!of_property_read_u32(i3cbus_np, "i3c-scl-hz", &val))
> +	if (!device_property_read_u32(dev, "i3c-scl-hz", &val))
>  		master->bus.scl_rate.i3c = val;
>
>  	return 0;
> @@ -2588,7 +2595,7 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
>  	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
>  	u32 reg[3];
>
> -	if (!of_property_read_u32_array(client->dev.of_node, "reg", reg, ARRAY_SIZE(reg)))
> +	if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg", reg, ARRAY_SIZE(reg)))
>  		lvr = reg[2];
>
>  	return lvr;
> @@ -2707,7 +2714,8 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>  	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
>  	struct i2c_dev_desc *i2cdev;
>  	struct i2c_dev_boardinfo *i2cboardinfo;
> -	int ret, id;
> +	struct fwnode_handle *fwnode = dev_fwnode(&master->dev);
> +	int ret, id = -1;
>
>  	adap->dev.parent = master->dev.parent;
>  	adap->owner = master->dev.parent->driver->owner;
> @@ -2716,7 +2724,9 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>  	adap->timeout = HZ;
>  	adap->retries = 3;
>
> -	id = of_alias_get_id(master->dev.of_node, "i2c");
> +	if (fwnode && is_of_node(fwnode))
> +		id = of_alias_get_id(to_of_node(fwnode), "i2c");
> +
>  	if (id >= 0) {
>  		adap->nr = id;
>  		ret = i2c_add_numbered_adapter(adap);
> @@ -3017,7 +3027,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  		return ret;
>
>  	master->dev.parent = parent;
> -	master->dev.of_node = of_node_get(parent->of_node);
> +	device_set_node(&master->dev, fwnode_handle_get(dev_fwnode(parent)));
>  	master->dev.bus = &i3c_bus_type;
>  	master->dev.type = &i3c_masterdev_type;
>  	master->dev.release = i3c_masterdev_release;
> @@ -3036,13 +3046,13 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
>  	master->dev.dma_parms = parent->dma_parms;
>
> -	ret = i3c_bus_init(i3cbus, master->dev.of_node);
> +	ret = i3c_bus_init(i3cbus, dev_fwnode(&master->dev));
>  	if (ret)
>  		goto err_put_dev;
>
>  	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
>
> -	ret = of_populate_i3c_bus(master);
> +	ret = fwnode_populate_i3c_bus(master);
>  	if (ret)
>  		goto err_put_dev;
>
> @@ -3300,11 +3310,14 @@ static int __init i3c_init(void)
>  {
>  	int res;
>
> -	res = of_alias_get_highest_id("i3c");
> -	if (res >= 0) {
> -		mutex_lock(&i3c_core_lock);
> -		__i3c_first_dynamic_bus_num = res + 1;
> -		mutex_unlock(&i3c_core_lock);
> +	/* of_alias_get_highest_id is DT-specific, only call for DT systems */
> +	if (IS_ENABLED(CONFIG_OF)) {
> +		res = of_alias_get_highest_id("i3c");
> +		if (res >= 0) {
> +			mutex_lock(&i3c_core_lock);
> +			__i3c_first_dynamic_bus_num = res + 1;
> +			mutex_unlock(&i3c_core_lock);
> +		}
>  	}
>
>  	res = bus_register_notifier(&i2c_bus_type, &i2cdev_notifier);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 592b646f6134..6b03a3ce574c 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -177,7 +177,8 @@ struct i3c_device_ibi_info {
>   * @pid: I3C Provisioned ID exposed by the device. This is a unique identifier
>   *	 that may be used to attach boardinfo to i3c_dev_desc when the device
>   *	 does not have a static address
> - * @of_node: optional DT node in case the device has been described in the DT
> + * @fwnode: Firmware node (DT or ACPI) in case the device has been
> + *	    described in firmware
>   *
>   * This structure is used to attach board-level information to an I3C device.
>   * Not all I3C devices connected on the bus will have a boardinfo. It's only
> @@ -189,7 +190,7 @@ struct i3c_dev_boardinfo {
>  	u8 init_dyn_addr;
>  	u8 static_addr;
>  	u64 pid;
> -	struct device_node *of_node;
> +	struct fwnode_handle *fwnode;
>  };
>
>  /**
> --
> 2.50.1
>
