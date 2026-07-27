Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F10941CB39;
	Mon, 27 Jul 2026 16:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168446; cv=fail; b=pi4mOuJ3CH8hvbhJEmF5w9wyAY7jGyKkoSQ5OGMPQL5tOSaSHXo3x2mZfBSxHZasAyqWROZgcoc127rRZomxRkNUTGoij5pUmNwtqV9NUUH6spQl+Xl4jnO2gH0RZnvPHg61QfkqItPCppJLUCDD5Wxgsjw1QMJJ5sntJzI6OJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168446; c=relaxed/simple;
	bh=aqbrjOTEylG8C0m927Oyx9jbCGU98i1HQHMh7Mzz5Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kuK4ksQn2gj8drXOeNeWRYsL7yYKtsCKDQcwFTVie+JW/aya+UHeNDO9uaNtpiIIPA8mTI93AmGIyrJ/Kv5rBYUCILUjiMRtUvogdyepsB4jmMl9VV4i5RsN6lYwsR0IjRqMDSgnmmupH/btaoRVAGFMvK+fip22eynQeAzHDWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ncJvc375; arc=fail smtp.client-ip=40.107.130.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ncJvc375"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJ43OKkCpaDEDclqMfH96/SbCXIXD+/dHUXlOWe71r/xzob6M3yFgRTIQ+rNvzft+t8fMwKktA5SuhcrO8cK2jm2kJOGkeI0DvfWt5osHktusIOYlCNoQqVxYmDsb0I2uAS1U7sz9GQ2CRPxsN8enBQPCu6ES1pI3oIhd+oYwaq4vZQ2stUb/MIJud3Ml0J63i69HEDPfUqlrghLdRodl6+czhlJi/fsrK1libJd1AdCar31IpIMYbUCcxj1juXJsePWmIUPhfub7+0gsUYgFK1esLC9RR98nkvmHe5NknfjYr1k9ph1jP82XYhMsdYxAvCmKD4lgi0N+gu1UaCCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHSm27CpiZIHWWolmGvrUfPaQ0fawN7pSNHJR9KocEo=;
 b=BF00XXBr8zBt2mI5e/VWriYr8i2pKKtYQhUxJD+GRREg5eAw+3fEC1LM7XfDV3a5d2xgsrr7MLdEtdnfxhd2/+Lcz/DSgNqH3uh1da3R33O86gQZ61wij3l39lyGuE4/6hRSv7zMGW9C7WUaZI3lh218FtdnJ8jidMllWi3KbVQ9wT3w4dj39eZNjlxHCAe1YMJEMytfXxQ59Yi8NjJaoc0r3mN1svkgaeFrgDW5F4xMNQcJp8hurKj9hDE5fyNjLXn7bYODTcXct2NkEHWhP8RHwPXJI105jcXZIpxlmI1OplV1t8TzdVFRgUvd69OrXNDiztr3RPs/DCMbITcrAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHSm27CpiZIHWWolmGvrUfPaQ0fawN7pSNHJR9KocEo=;
 b=ncJvc375ZmwLOWBf0pHbv9+0B+XUoy5Jm2gA896gI7bNDgH5G0tX76Ts5OFMXtrZqR80e/zwgWbRTTDAIFKh6PjIFJjzzdwOYeUNEl6LRFOOXnVfxjf5cB+NrZC+UKOGwnPBxfhPDYdM1Q0/oFSYMHTWnEkFgh86+XhupjeoWm3bDrGIWoj6pvQwBtZfbotOe4wpaE9UF7PdQq3TFBYFck0UshFn6bH1ZLZsNhJo4bTEIK+y5tvM1aMyQZOe55WAC+x6xsCjcFBJQPfs2qcyVGXY31myFRSzkcVFnpgtMYUy2CLEb8aNHa4Hw7qzLkH6t9YoO2xhROwjExDi8SYAZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BESPR04MB12609.eurprd04.prod.outlook.com (2603:10a6:b10:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:07:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:07:21 +0000
Date: Mon, 27 Jul 2026 12:07:12 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: adrian.hunter@intel.com, Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, jonathanh@nvidia.com,
	krzk+dt@kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux@roeck-us.net,
	miquel.raynal@bootlin.com, p.zabel@pengutronix.de, robh@kernel.org,
	thierry.reding@kernel.org
Subject: Re: [PATCH v6 02/12] i3c: master: Use unified device property
 interface
Message-ID: <ameCMN2yBeEKoT3q@lizhi-Precision-Tower-5810>
References: <97465893-3650-4f37-98b7-1db76fc6fd03@intel.com>
 <20260727082652.93876-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727082652.93876-1-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SA0PR11CA0007.namprd11.prod.outlook.com
 (2603:10b6:806:d3::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BESPR04MB12609:EE_
X-MS-Office365-Filtering-Correlation-Id: fa0ed2b5-d447-42b8-e714-08deebf9238a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	K/OoBrRwUfAeJh0tFaAc0HsS9GNMOXeUcW029+3I8OrDLNqg6G1N6iQaNbwws0T08qmCp+N04Keb+QaI31wgLJi9c6V1SBREhQna+AeLX4jmmaPH5V15r33jjzBTGUO0eNnUEkSD/Nu79ixOjspBtLgS3GYDbXrnkMGaU6OlkVLazjKRRwn0y4SSe1Dp23lsPa9XrhF8vQej4bkVFY0JnsdyV7y/MBkYxKybfM/gwuXA6+qLyPZ1xiB32D3ORhIOdwMqIlKas4eZHK8M3vyEuv1cApNKypVHrv7RDCVofjVwLC63Yq9hQfV6nD5Qzze+Qe98gIFri6zXgDWBe7ZnGtVceAQKmj39bbfcFo1BrX8nPfyaNVuqXUV2ZzKjWcFxdJJZWGI9EfHl1RUbLvnyiMFQANDdSop6tYcFskNHSxbuf66TqUMtUS9WAwF8fAuYIBfJGhdCvM7z3cPTg0j5S/c48jJcQ/0+Sb8wRhCFtzbHrFXRPaTKktaD19CdmfQgMIzx3ODI+NjyBii2zdXHj5oFX6TNsw/tA/DNKGh8beyrEmVyHg7pscSYBpKFsRuLWcZl4p+z509J419v6M3ww/wx4mWS1Ch6qS+j3/S2Gf5OclBARFRhkCM63yzGy7NnSILotOrzoav/oHHn0EoHJRAyVx5PUVc3bgVIL+RzPOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0gjYmeXq94MkSrKlmcW3LkRBlq1lB5JsihBGpZL5xFsxoupBvVGPewb23VVk?=
 =?us-ascii?Q?WvS3RWJ06U438EWbz4PS7m9LMoQxSExGyZ2QgD92TD0p/8u6z2SF/8J/8v6A?=
 =?us-ascii?Q?LLdR6xPwHU5HBlzyYnjdqGkLmG9dob2WxZROorCkhTfHD01YG/zDCvDrT6/R?=
 =?us-ascii?Q?ZqYHU/DFsOqAP+Uk4LnuFYR5VnIky9BaIgvhOLOOCUIryGc8B6Fx8P/NHAnR?=
 =?us-ascii?Q?7SFgUa4IREEHd6B7xAmmBppbnGnGFHlWhxJJPF89ufzzJGg7F3y1nCAzpGHb?=
 =?us-ascii?Q?RhALyWB8K0dGYARH0rs6KEcrwpftPysIkB33UPsE0Dgy65LUh3yNZtM58Uks?=
 =?us-ascii?Q?Lgscv/GmjFiKGEH2PRRtCurmhYBFRgIt3cNPPKIMoI7vSvH4mNf49TVClbZC?=
 =?us-ascii?Q?tueU+G73YzrQNZ8Juav1IXTU6wG/Jv7UDz8ZJ2IX5/TP8b/HjcFxklH90Pqu?=
 =?us-ascii?Q?ordQTt0KF8l2GsPtJEdtK/VsPXm/vXLNbnyOFURxm2ifSDoPYTM96JrN6Tnz?=
 =?us-ascii?Q?csLAMQirB/VZ6iE+f60B38mw/uPmzfrYgDlTmp5LiCRnfd3Udf3g7W86vH4r?=
 =?us-ascii?Q?WxNf23a0uUzoDlC/J+F03Tk7ctlgK4Uwp6D7lxgwEJONE6EO9/DMnHorSAqq?=
 =?us-ascii?Q?YzzWneVMkvGEKgtpjBNxpm4PEACanJ7OrZ+nrACXaa6BLDKEwx+OOg6IZX79?=
 =?us-ascii?Q?hrcGvVh4x3SaVwsZ6/nWgHG4+Kx4B5s0ThhBgxIbdiSoJZg751fsRsKV+OGw?=
 =?us-ascii?Q?fEfkbq3uU89D0+h54w4ehS3KKV1yMEWOZ/ifxA6hnvwX+8jQDnITPmcQKeZ8?=
 =?us-ascii?Q?/6F+e2lTX782XPw9QaxWSRyDdpJE2mUG1h8CE2B++bhyDCHEx7/FD0IQRCcU?=
 =?us-ascii?Q?l4SurgxsL/0KXOZ2XJ5h/cXENF6dBqkPcZF0q/gJlxUoO4umzphCpCrMKPPG?=
 =?us-ascii?Q?84SCQWYuZDl89vfNot3yd6fyIOYDMq6dznWSloqSGcJoUVnIGuUmcm08gCYj?=
 =?us-ascii?Q?4gFiJJlPBBnX9uGbjQ8YlYrRSTsS+R2DcwC6ssPoxFrZhhfPcI5ePqF/ZpBE?=
 =?us-ascii?Q?jIcVCBLhceWua7oENc+lwEW0tA50mGiaMQ41dthEWpHMfN8n+JJWr4L5or8r?=
 =?us-ascii?Q?GIhRVc5CLlHr4o1Z61sI6Zr0X/Cu4+xoEUxcvKyhmN9wtmvwtkehaRwNk6/u?=
 =?us-ascii?Q?Tkfdxuh0TP6z+8BNWWPwzhA8U3iPwy7kH/J5q3UXhc8R5ObxTpP7e/S2nIWm?=
 =?us-ascii?Q?WQ9PeWRhrxs2L9InR1afXQO4uZocdu7VRHBRbqfAsl0b8nQcB9TE50Dm4fFK?=
 =?us-ascii?Q?yJfOFyqL9QaQiRpyRmQ1rmpL8wqvURty92jey7CRMxuxHSubkOelCEe5pRN2?=
 =?us-ascii?Q?PBu1VRWWbvSCSGpvScvcxoruQeOeh0OoRCe8R6yvkqY8gVnlfnALcZO2P4kq?=
 =?us-ascii?Q?MsUSvG05h97xbG/3enlYvdEYOMElMdmSWmAaNzhmdUP0USgFraFOPUgf7d+4?=
 =?us-ascii?Q?WTEo4UgQV1/h478NMx6k5yIImtcHxOYjIwRZgru6lpFKeU3fX06tbbzYUX5u?=
 =?us-ascii?Q?7pox2NT4YFLPTK1C7p+SVC+uAur9JzpHmjX2uVV03/l0lum0390QEkjz6Fb7?=
 =?us-ascii?Q?CyYWIREkGiPvlVlQDmZQHuA+Oh+o+mSOuMGvw3AiWA/d9ya/sFNYC5niTUxQ?=
 =?us-ascii?Q?1XcFe3bkqWdncngID3ze4R6xwlgzAxV4w3K2fA4vO4XbrIWunbO3fIgkuOTy?=
 =?us-ascii?Q?klLDhdqnc41+vAKqJq0GEPzB804woJ6z35+R7jlJz45e1kA/o740?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0ed2b5-d447-42b8-e714-08deebf9238a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:07:21.2986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7sqhTfSAnDHibQoXNpgRHJ3zNSJ+FWGxKtVOiuHkQbDicqweeE+xpZHzW75uybCHT9uUQLtaH4y2gRNF1VrBqqUmKTNJG63jAPcJQdPAYvpUoUWxXXARhgqEMDAX25l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB12609

On Mon, Jul 27, 2026 at 08:26:52AM +0000, Akhil R wrote:
> Hi Adrian,
>
> On Wed, 22 Jul 2026 13:38:43 +0300 Adrian Hunter wrote:
> > On 21/07/2026 07:07, Akhil R wrote:
> >> Replace all OF-specific functions with unified device property functions
> >> as a prerequisite to support both ACPI and device tree.
> >>
> >> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> >> ---
> >>  drivers/i3c/master.c       | 77 +++++++++++++++++++++-----------------
> >>  include/linux/i3c/master.h |  5 ++-
> >>  2 files changed, 46 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >> index f1be38a640ca..4b3d9628bc39 100644
> >> --- a/drivers/i3c/master.c
> >> +++ b/drivers/i3c/master.c
> >> @@ -13,10 +13,12 @@
> >>  #include <linux/dma-mapping.h>
> >>  #include <linux/err.h>
> >>  #include <linux/export.h>
> >> +#include <linux/i2c.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/list.h>
> >>  #include <linux/of.h>
> >>  #include <linux/pm_runtime.h>
> >> +#include <linux/property.h>
> >>  #include <linux/slab.h>
> >>  #include <linux/spinlock.h>
> >>  #include <linux/workqueue.h>
> >> @@ -491,7 +493,7 @@ static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
> >>  	mutex_unlock(&i3c_core_lock);
> >>  }
> >>
> >> -static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
> >> +static int i3c_bus_init(struct i3c_bus *i3cbus, struct fwnode_handle *fwnode)
> >>  {
> >>  	int ret, start, end, id = -1;
> >>
> >> @@ -501,8 +503,8 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
> >>  	i3c_bus_init_addrslots(i3cbus);
> >>  	i3cbus->mode = I3C_BUS_MODE_PURE;
> >>
> >> -	if (np)
> >> -		id = of_alias_get_id(np, "i3c");
> >> +	if (fwnode && is_of_node(fwnode))
> >> +		id = of_alias_get_id(to_of_node(fwnode), "i3c");
> >>
> >>  	mutex_lock(&i3c_core_lock);
> >>  	if (id >= 0) {
> >> @@ -837,7 +839,7 @@ static void i3c_masterdev_release(struct device *dev)
> >>  	WARN_ON(!list_empty(&bus->devs.i2c) || !list_empty(&bus->devs.i3c));
> >>  	i3c_bus_cleanup(bus);
> >>
> >> -	of_node_put(dev->of_node);
> >> +	fwnode_handle_put(dev->fwnode);
> >>  }
> >>
> >>  static const struct device_type i3c_masterdev_type = {
> >> @@ -1044,7 +1046,7 @@ static void i3c_device_release(struct device *dev)
> >>
> >>  	WARN_ON(i3cdev->desc);
> >>
> >> -	of_node_put(i3cdev->dev.of_node);
> >> +	fwnode_handle_put(dev->fwnode);
> >>  	kfree(i3cdev);
> >>  }
> >>
> >> @@ -1928,7 +1930,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
> >>  			     desc->info.pid);
> >>
> >>  		if (desc->boardinfo)
> >> -			desc->dev->dev.of_node = desc->boardinfo->of_node;
> >> +			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
> >
> > i3c_device_release() "puts" the node so there should be a "get" here.
> > Should probably fix that before switching to device properties.
> >
> > Also seems like the of_node_get() for boardinfo for both i3c and i2c
> > has no balancing put.  Again, it would be good to get that sorted out
> > before switching to device properties.
>
> Thanks for the review.
>
> I understand the issue of unbalanced get/put, but given the size and
> spread of this series, mixing it up with fixes may make it difficult
> to review and may dilute its intent. This patch is a 1:1 of_node ->
> fwnode conversion and keeps the exact same get/put balance, so it
> should not regress anything.
>
> If you agree, the fixes and pre-existing issues can be taken up
> separately.

You can omit all pre-existing issue for this patch set. Encourage fix
pre-existing issues by new patch.

Frank

>
> Best Regards,
> Akhil
