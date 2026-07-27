Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4493E451B;
	Mon, 27 Jul 2026 08:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140839; cv=fail; b=QmhNQ/EmbAZiooD4HOVHih2iMMm5r0gpviQRvKcJ3wKM+whk3bEaEZwar9SGA/WKFJ5V2ih+oUhQfihxUnqn8vMAxkriJ+QNwnM62MyQmzZXVHqpxGMVVF0kE6m8aABNAac7GliuO/wX5PjDdLxjqCKQuNhNoPVIx4Wc4Pi+Irg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140839; c=relaxed/simple;
	bh=BlKAHZGdIytD7u6z6wDrTSQJK0JaeZyVZDj/nrEz9zg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rz5+rNeaSo9Bt1J0mwvz0H0mguDl7F3MutNvXb/Q0MstKm0QNtNNyBeQwWVVdS+N0ZIcP5I8nMvFiHOKmUh/QOeUIG32G9V0ndvn692b+Kha//j06Hrg1LrTTVLrptavhSAufx5uBXX1UzkBbfPV0gUYCywOAXjUZE/KTi5UOWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GRqporGd; arc=fail smtp.client-ip=52.101.56.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GRqporGd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGKO/VEnmvS3Ulu38MzgfmmdC6Wg1bFDwB3ICwFs3lKX9XeIbhrp598sS4BUWK4OpQ3wFnKfLveL+lZHF6PqrmF5kpdl44CJ2gWLwuSR3WNnR74EipWiaqiERjSzpuuIoPBd86YgMHTIBx27QlC1KrGfWqnF4VVJbOBgtuaHlh88buk6RBIQVljM3TOSjxH0JYkJbqzmzs/+LFnpM96IpoqUfkEDsmqGW231SAeMXI7kKo0jk8mavfiQiwGiVGwY79jKAEdHdNp7ETqpKfaPNeZ0du5+bxuRFZIhCu0XIKB30RIxbzJCdEqmkwUIZynnsWRtIDZPhrulPA9WPXbWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEUL6RMkO5Ob4+HE54L8S5nfpH2cYTERr0wxB3G7Eco=;
 b=MRq6irCZ6BNe0Zwep4P/WzuFpp5/8oeMhUOlbUpJWUpL+bvB0Q46KLvc+jnj29WzShK73U9PPygWlz42v9uELulM6Pw4FKUHLWwLGTuBi442PwU+V5P8f8tzUCQCnoiVq9GBD2dFdxp7LwQE6hlB+QJSkJTDcwb+jb5FT1OjAqo4uaUzWEbdVVDDXn2kyX4MQ/8ZXsOXBGoFvAe4gCRIkWBKw8GSQlV/GWifh96mCYmZFzxfDrZlxSBVal6lYWlwCqoQkMjUbPQVMNf8qyzkWlaAUvVtXmiROMTac0bJPjJkdiKKrsBmoDfn6usUWheTq4IJqz/DUSOU5OnmXIKBcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEUL6RMkO5Ob4+HE54L8S5nfpH2cYTERr0wxB3G7Eco=;
 b=GRqporGdiV3DWBQ6O+KmC6hkN1ZVeyfHbMD00FrLadX9lXDP2tfYBR0vwEtvkju3J00It9xWAX2/1awohluf5VruP9EhP6YKmY6kdi/SFOrZUMxq6/KcTxNnYebXBV4Hv1w7EVRtQbeEZZ5HpjelD8I6QO6akGNipwUyPUcZ9OyHbAfqgZjNlbNU2gw8n2Ikd3Ahkgq60UOVV/aag6iCXb7G86AU+lhxXBuUlg9HZ7Impj9zwn2A5jYmKNI+Mr8XcpdHdhMZVtbgLHVikfYPW0q6d0OJeYXsv4jaIMh8htiCHAlm6S34Rani93kv9nOaWEwoUeIGDJQ97xvX9RUUkQ==
Received: from SA9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::24)
 by BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 08:27:13 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:26:cafe::c) by SA9P223CA0019.outlook.office365.com
 (2603:10b6:806:26::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 08:27:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 08:27:12 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 01:26:59 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 01:26:58 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Jul 2026 01:26:53 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <adrian.hunter@intel.com>
CC: <Frank.Li@nxp.com>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux@roeck-us.net>, <miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>,
	<robh@kernel.org>, <thierry.reding@kernel.org>
Subject: Re: [PATCH v6 02/12] i3c: master: Use unified device property interface
Date: Mon, 27 Jul 2026 08:26:52 +0000
Message-ID: <20260727082652.93876-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <97465893-3650-4f37-98b7-1db76fc6fd03@intel.com>
References: <97465893-3650-4f37-98b7-1db76fc6fd03@intel.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: ef116135-7537-40c2-aee1-08deebb8dbe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|23010399003|36860700016|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	atm8meFF8zNEjhxyQ0fttt7JWAesZwBCGU5KYWL//+dfucnLP9inHvV5p4kZ4aDvr89vlBg9fzIwCEkc4lEiWjiQXfZeR9yZPmxfvWkI7OGCopTGZe0vsiOREi9a3z+NmJmxxx+ZI8KsJKzQs7XkpkJ+3CYZP3TIIBz3S/DfUMrlLOukh+Eb5NM4q+gWLwqlm6aW4u0+VQxpc6zUBSZFEC6Wtop6k/93CK1upFAtsiyEP/E/5GaGPzuFBJEVlTvCKIcgL+jmb6nRwboai28ds0Y6xdENgcoraqoYYVHusYW/sjVMEhP7Hea1PpLD9KktC7u5k9l6BOamEXMLIcTnYg5nmGLTCWOOZyz2iPVRxH+PM6UW18AFVc5XNlQXoDjrtNVQrwg8vN6ZMAtZPF8wtd5UphhOlUHBwT80HGQVBd/1DqnEc5OqMwYIgbcfZgz6GyPSyDdolt162IVpM4ZYZs68YqW3ZlIvBHZYmod7mVI2cfZWF1TeDW94LjfPRFtby75hznEVmy8+G7tMUtvRvWh4zMVhQSZsHnlueh+yBsLdY9e3lKsy0qLhI5EY2m5RN0Zp4iZOthcF3F/FcGVMtZUkvGY4AFdJg0JEClLwPvg6xKWaU1Xbgf3UqLaJniyaM4L9b0znY7VuHUlxLaE9xQSomYnHH0nhlroVWk2vnFkH2PxrmOwzR6Nt8m4Uu7eYctp6wXMd6BlHf5uH4NI2RQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WG1Qlm5MD9fTEFv9arBlGRqIlVhrVSw1KMccV8xkL7/G+8RUmYF+JlO5q4dVqorz+3gZZe9CQ5pzVikp4zkODT3GLJYe9eQef1ujCrIlSI6N9BB/A+XQ53UphHbzH9YxBM9dyBVc4IhYSGH5Xcjjm1xvw/joCmAEdf4RG+IWmwJd7F8JIXVyyK7C1WtAL09RM5PbVvCCJaS/1aqvfzhrXuvjxPziD9mIdQ72rUIkis2IY6ZNdsynei1hanBFEUObNjIMjjPLA/B7AVNJ5WV7EuutAKTyvRT2XpZqyYaTvPdm2idDBIjwNgunZ9C9R/g14vPp9gx0hZUdHorEn23xvB7OJm5OXR5xFQl57ld/Qg6FHBKdcLoYXdNjUeYJGwZx8jXCx9w7m8B3tWuxo7LevhcXpk6U0JaRi4lHNFjvAaOxnFsuuhooKaRTMMUUKQTC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 08:27:12.4281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef116135-7537-40c2-aee1-08deebb8dbe6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506

Hi Adrian,

On Wed, 22 Jul 2026 13:38:43 +0300 Adrian Hunter wrote:
> On 21/07/2026 07:07, Akhil R wrote:
>> Replace all OF-specific functions with unified device property functions
>> as a prerequisite to support both ACPI and device tree.
>> 
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> ---
>>  drivers/i3c/master.c       | 77 +++++++++++++++++++++-----------------
>>  include/linux/i3c/master.h |  5 ++-
>>  2 files changed, 46 insertions(+), 36 deletions(-)
>> 
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index f1be38a640ca..4b3d9628bc39 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -13,10 +13,12 @@
>>  #include <linux/dma-mapping.h>
>>  #include <linux/err.h>
>>  #include <linux/export.h>
>> +#include <linux/i2c.h>
>>  #include <linux/kernel.h>
>>  #include <linux/list.h>
>>  #include <linux/of.h>
>>  #include <linux/pm_runtime.h>
>> +#include <linux/property.h>
>>  #include <linux/slab.h>
>>  #include <linux/spinlock.h>
>>  #include <linux/workqueue.h>
>> @@ -491,7 +493,7 @@ static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
>>  	mutex_unlock(&i3c_core_lock);
>>  }
>>  
>> -static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
>> +static int i3c_bus_init(struct i3c_bus *i3cbus, struct fwnode_handle *fwnode)
>>  {
>>  	int ret, start, end, id = -1;
>>  
>> @@ -501,8 +503,8 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
>>  	i3c_bus_init_addrslots(i3cbus);
>>  	i3cbus->mode = I3C_BUS_MODE_PURE;
>>  
>> -	if (np)
>> -		id = of_alias_get_id(np, "i3c");
>> +	if (fwnode && is_of_node(fwnode))
>> +		id = of_alias_get_id(to_of_node(fwnode), "i3c");
>>  
>>  	mutex_lock(&i3c_core_lock);
>>  	if (id >= 0) {
>> @@ -837,7 +839,7 @@ static void i3c_masterdev_release(struct device *dev)
>>  	WARN_ON(!list_empty(&bus->devs.i2c) || !list_empty(&bus->devs.i3c));
>>  	i3c_bus_cleanup(bus);
>>  
>> -	of_node_put(dev->of_node);
>> +	fwnode_handle_put(dev->fwnode);
>>  }
>>  
>>  static const struct device_type i3c_masterdev_type = {
>> @@ -1044,7 +1046,7 @@ static void i3c_device_release(struct device *dev)
>>  
>>  	WARN_ON(i3cdev->desc);
>>  
>> -	of_node_put(i3cdev->dev.of_node);
>> +	fwnode_handle_put(dev->fwnode);
>>  	kfree(i3cdev);
>>  }
>>  
>> @@ -1928,7 +1930,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>>  			     desc->info.pid);
>>  
>>  		if (desc->boardinfo)
>> -			desc->dev->dev.of_node = desc->boardinfo->of_node;
>> +			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
>
> i3c_device_release() "puts" the node so there should be a "get" here.
> Should probably fix that before switching to device properties.
>
> Also seems like the of_node_get() for boardinfo for both i3c and i2c
> has no balancing put.  Again, it would be good to get that sorted out
> before switching to device properties.

Thanks for the review.

I understand the issue of unbalanced get/put, but given the size and
spread of this series, mixing it up with fixes may make it difficult
to review and may dilute its intent. This patch is a 1:1 of_node ->
fwnode conversion and keeps the exact same get/put balance, so it
should not regress anything.

If you agree, the fixes and pre-existing issues can be taken up
separately.

Best Regards,
Akhil
