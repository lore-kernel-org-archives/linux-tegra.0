Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CEA33374F;
	Tue, 21 Jul 2026 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652758; cv=fail; b=rw7pwqxJHv9vtERjASho8HBbwCd9I6sQnuL4paZBCTFonQg6zSH9onD8o2QejnjdPHQbynRWkHJIaWOx+Fzn09CfbEjWtpdIMTX6J701u6j7334SLflfetqwx4viduSa9E56imxFSQS2iGKT43EvjWa9opWwGMJu73/ozy6hPSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652758; c=relaxed/simple;
	bh=Mo8uH3ziDzHoR9J9lXRNJvz9R2kHG4hGm2Mw7C5DUzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n7/abP0OAE3Eyv2Dvo0YJ56ZJ3x9mbuSTTAUUKTWhaQJ+58RXcQHLTU3Qfy1N9a05I8CS2r2qmJyvUSYufJod5pDhQ6+nbEDMVzSd1b8KuPe4pPVTZdUlsrQXTkXfVsfXDSbyKN11P6Q1HoRjDrBd3GTHz/ppFQ14hVqF+gQDS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ja1sBYWu; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ja1sBYWu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtFvxv85D67D2fz2mqIItfW9ZQM1KKFYelC3x4u1z99kKMz0Oit7kDQ4wh+azPdO5DKUA4d3mMRinyA3AQ3jo07ExNOS3tTbFn7bEXSNwBrvH7u5iTWitrqEtxCuuRWc2HnZkou8wwvY2mqseh3fHnWjmSF6X9LQH5azjh4UrmoMn/OZsXspV0YXLTtoPLeqY7wNsFTn+qZ81nxnjtoqpjQkB3+zZx07iFINJkg0RYSULtrLDpDscR0QOLvM1WojxE7yu+sv0YrXcfzaDzXSTir0/L/Ski6M6Luoo1/wtsmknrYMJ5nkVyTiP8aFk1P8W4hrOf/6wepDV3K3yXQ6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC/2gIg5lNEGQDL6bz0lMofw3oL3pBjMAUGC70QYXuI=;
 b=X7haz2WU7eRVhVa72bMtzgj0d2UDDhBTOM47IZwpdFZDGCMYY3dwdr08wZiuhFoxDZnE/khrh+yAgU9NbuSTwr1pEy3CHVBY+SUmGDjUmOEfUGdAEuLpSQ4uuaNGaA1GZ3Lm7QH5kPKmV4aoL00YYtDd9zthPHSSE2zvCNbxxqrWlhfp/32qunItOM/efktalkRMBQ0VToWz+Aa7qIoWBDT7IRyUiTWpeT2wirKsVM/l7sjEkaTbUJ0slHWWFu3JVDwITIgFlYMcNBnNk/YJblMRuzVpncIikIxPhZo4Sav8Lz2pl4AuPUuwBZ1iaJIYpTYl2vrBN/pnnsd94SNc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC/2gIg5lNEGQDL6bz0lMofw3oL3pBjMAUGC70QYXuI=;
 b=ja1sBYWuSk5aF/a4E++BHIb6x7VvZoIKaZIawHr07cSiKtYV3VygauRvksukQu5Q2jJKPBE333VFbt0EPGGFMZzVd9KJDMGTr8BanopaOLlE6B2H/SmMvE5s+z665369jVV1YmCn0kpEfVBy9czGJlv0zl3jfgORUs02hfXTM4ZKyvpt1qQIWJArOQCV4JezZh8/VmF7Waog0dFK52DXwssSXj1JUGmRXJM0Xz8f1JDiUyPS62WTqc1xwfSS/1fz8/m02bR7bAT2IZkxqjwM8RuxDeLf5IGLlOkm3kWWoHMIFlYD1c0qW1/d+hCdnJj/thmNInWX8PaesBP45j+zMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8065.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 16:52:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 16:52:30 +0000
Date: Tue, 21 Jul 2026 12:52:23 -0400
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
Subject: Re: [PATCH v6 00/12] Support ACPI and SETAASA device discovery
Message-ID: <al-jx5AvUrxq8I75@lizhi-Precision-Tower-5810>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
X-ClientProxiedBy: SA9PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:806:6e::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: a07b9732-e159-4f1a-e198-08dee748742a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|3023799007|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZyhTqa/RyGYDrc9/Ov56/x9t5m3N6KrDL4JOdBaPjB1SQ2MbD6CxjO1QrT7hiBOjMmJjP6xlnLRPAc9MLJ6H7Ihba+PptSRH06TPLN4T/2IqUdLTSDiz1qL44vv3MUUdY116PTyN9u3qzaC7DsOiHGUZFhRA5hjAF8+OngAXAOaV6nt+GChamQIuoBjzs8+N/L6t0PCDvHsNE1tcVinKBzb+IuOJbGPql5Z5hXWI/DGe6FCjOH5qIoxUk4l+lIl2oPfD/dqKT7kMRuYr6t/U5Zy88S8nNQAxggTjkGgaeIS+mcURZw7BYsBVfnG/8AsfVFFKblplEfdeGHvshibhtysvjSdUjUfw9nGEz6EoqnCHvfN6u9Ix7jkMmKZZuLmTCIoFZlG/m5VKobeAGMNd1NJcjwxmfA84OZMWxnmUYReXL9Ay33nsfB10+39UgrsfyMhbzGud7aPXj8xyOfn1Pg8+q+V7CbPQPJwFG1Tr50+cKWtJdjddUt5WPJJM3yRFwiKJynkZYEgiFyp5f1EEqTAAES61NkGgsCemAkBrruhPxa8RgOT0DW1ZbC4VmwSVlbcQi9hTknN8o0WsaqvhWlPigkgjN01pfyt+/IUlPF8DgDX1S22NfwFmeTfqPhpWCaKX2mVdJJe2p22LzgyeVAz7ckYUAynDzJbi+QxxspU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(3023799007)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G1Yh1zgZelneM6AOln74DBFAqRcWjoLbpYPTrte6+cQYcBXGjPMfanFZlISC?=
 =?us-ascii?Q?cjeIIWkgICZlsw3AycrN1ISCCdnn/a432qpyhm0XW3O1zLQS4UlXL5uFILy2?=
 =?us-ascii?Q?d4Jv0ubrELD7JGQ0fxpj+YHwiJViQB3SaQZkh4sb6V5ggYL6f1JfXs5YI2Dx?=
 =?us-ascii?Q?mSiuvpfPqMz5fQlrji0Eh7bgw/LjoyKTUDUAXXauIFoMliO2ztciO6/8mc9e?=
 =?us-ascii?Q?LX7oRrPYdDj2xfy7NP1eM46LPjWYK1Oq96WN8oOz6uX7dnrXg8uBpv0Z4Qzn?=
 =?us-ascii?Q?2CLA1tDtGx2RxqwgTaTEMHsxBjwmRcSuTTS4PkYaKyJeBeTZ5O00cx10g7Wq?=
 =?us-ascii?Q?InqS+tpPiF7k+8p53E2wSKjIDMDaIrBJ94dMhMJ7KVTbUif6cg8DzNSWvyTN?=
 =?us-ascii?Q?6AG5FvE2+8Td8WA1KBsUWSyR0uYbpkXTvhaQ3gUHGYzWHRcEgxHmGPSSMJms?=
 =?us-ascii?Q?gvUtcsoRXDJYzTZB9NcOAETyNlwSXJHWiLlEo2JFt97zU1sL12XFd1SGnIbX?=
 =?us-ascii?Q?nvbJB/VABT+I/tboakor3QSVb3mt876g1Ewy/V1BR1DriIQ5QcnN+ypkGZ9V?=
 =?us-ascii?Q?FDmo4OMnqn7Zv+M/6NV9ITrQmXpKQVzhJ/tQMlsDy5adXbP1ucKCtXcDA5kI?=
 =?us-ascii?Q?zXLV2G01F/632IHjs738q+mQN57BFiWmvohYPCCcBIb3UPf3GGIfBOHrwcDz?=
 =?us-ascii?Q?NneZRZTBQMNYksG7/GQJFyV7KXMgaonX3J5S9prnX0GqRZnN9+1hwgLLh0Vk?=
 =?us-ascii?Q?mjVtepFYOARcUHkuohJ+YrsjW2lkgcJHgfMcZ0JFoQH1f5BRCQRNRVKoQcBq?=
 =?us-ascii?Q?iRPesFn/CrQr4I/XaHhbMMpvsrykX8mCHhoMKRSmvLjtcwxhcf9ReG0HjBOk?=
 =?us-ascii?Q?SpqS8kUwsow/xlajWfDuzmS0zxj/OOlcWLqbAr3FQbeF2qP2bO1brEQgCLq9?=
 =?us-ascii?Q?f8K1bThKSd80UO+sf5oVk4Nk6tQuxhukFd/WzjhCLnvjygptye0QlZTJE2nO?=
 =?us-ascii?Q?s3T+sAXwdU+BfvMDwB0Az+yyWmT2nZ04nyoHczDj0TH3btUsdEa97MgDw2cC?=
 =?us-ascii?Q?+f/gD1ZSR4/Rgnc4AQgW3gudAjqQl5ohbHBGLHVRxLfpNYIeWBbmKBkOQ5t+?=
 =?us-ascii?Q?wji9CWIbnb4OsAoeo+6T+ee/4UILPmOi6bEmOwOe/hAgBZirj8Q3zpLIghaD?=
 =?us-ascii?Q?VJYiO0qytQwSGu1zYX5+5eNPXKGQ0/KcC5LcoqpU9zTmCjkjbh6kWtUewDaM?=
 =?us-ascii?Q?HNQ6+darfuRTBbeKPq0KvccIU31kdowJK6VB0Txd6bw+PF46ZJGzyaA9UDiV?=
 =?us-ascii?Q?KY4wyjXpLBTYBpPTicrqnefoZwrmQvdaYkZZGcH340ucpYO+nS4aXl5gDHd1?=
 =?us-ascii?Q?deibAoTQ57Nj3bDHmsgAw6U3vgZ2bJuzoS1XRrGNu0oHbaSRzgc8PWXajYa5?=
 =?us-ascii?Q?Yfz89/Cta0h7PxfcjMfz9sMwCasQOGHlsuU6tQklYKh+XR1+F4iVb2inJ5EP?=
 =?us-ascii?Q?7KJfdgCLmzVVX/JhbJIED+4chfuQxIV7hwa2SIPKKk6k3EnJFCSdJLVTHnOv?=
 =?us-ascii?Q?8wh5ehXzxZahla5+HYzOKbZ+v92NZcW5athkh9qXCjCk6cXsvuqTsbfG6kv7?=
 =?us-ascii?Q?5G9UhMHmw7cp0Pvhk6n7ZZNZcFep8q4QYppWvSFILN8OKVdUC9fUxo9qYQuv?=
 =?us-ascii?Q?KAQw4brt5C/bURGEUY0UiqTS8SdWKfA8sXwrrLLwnGzpaP/eTJ6fFxE4VMdB?=
 =?us-ascii?Q?vrSk305l0/jasR7ySVHe1ZbI/xSnxg4/xozzYt63T4lTEHHMxW6t?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07b9732-e159-4f1a-e198-08dee748742a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:52:30.7423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPWRgMBoKGKcfVd26uILhoV4SI3bN3o4DTPZxPty03Vts4xEPIQ/su3c7utm5EjI+O0UWNRaX4sUlIeeW78iw8418gt6lismPZuM/iEERgGvnleXhVkZlJ7X5S8x74Mg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8065

On Tue, Jul 21, 2026 at 04:07:48AM +0000, Akhil R wrote:
> This patch series adds SETAASA device discovery to the I3C subsystem,
> enabling support for SPD5118 temperature sensors found on DDR5 memory
> modules. The changes also add ACPI support for all existing DAA
> methods like SETDASA, SETNEWDA as well as I2C devices on I3C bus.
>
> SPD5118 and similar devices on DDR5 memory modules differ from typical
> I3C devices in their initialization. They use SETAASA broadcast CCC
> instead of ENTDAA for address assignment, and per JEDEC specification,
> are not required to have a Provisioned ID or implement standard device
> information CCC commands (GETPID, GETDCR, GETBCR).
>
> The series enables describing all I3C and I2C devices on both Device
> Tree and the ACPI table, using unified device property APIs throughout
> the I3C core and the Synopsys DesignWare I3C master driver.
>
> Please note that the series modifies drivers across multiple subsystems,
> like Device Tree bindings, ACPI, I3C and HWMON.
>
> v5->v6:

Thank you for hard work. I glance at there are some important sashiko AI
review need be figured out. let me know if you think it is ready for me
to do manual check.

You can simple reply sashiko review result by providing your justify.

Frank


>   * Do not take an extra fwnode reference when assigning the boardinfo
>     fwnode to a newly registered I3C device.
>   * Issue SETAASA after SETDASA pre-assignment and before ENTDAA.
>   * Prefer SETDASA over SETAASA when a device advertises both methods
>     and an explicit dynamic address (assigned-address) is provided.
>   * Reject PID 0 for non-SETAASA I3C boardinfo entries.
>   * Drop OF/ACPI uevent modalias emission; keep OF/ACPI matching for
>     SETAASA devices only.
>   * Resolve DesignWare quirks before core clock acquisition and fail
>     probe early when the clock is missing without the ACPI skip quirk.
>
> v4->v5:
>   * Free ACPI I2C boardinfo when an ACPI child without an I2C resource is
>     ignored.
>   * Issue RSTDAA if SETAASA device attach fails after the static address is
>     used as the dynamic address.
>   * Emit OF and ACPI modaliases for firmware-matched I3C devices.
>   * Make the DesignWare core clock optional and use "clock-frequency" as
>     the fallback when core_clk is absent.
>   * Keep DesignWare pclk, reset, and match-data handling on their existing
>     optional paths.
>
> v3->v4:
>   * Clarify mipi-i3c-static-method bit semantics and assigned-address
>   * Add I3C_ADDR_METHOD_VENDOR
>   * Fix fwnode reference handling while converting child property parsing
>     to use unified firmware-node APIs.
>   * Align ACPI child enumeration with the I2C core for multiple
>     I2cSerialBus resources, ignore ACPI child entries without an I2C
>     resource, and populate I2C modalias information from ACPI.
>   * Update SETAASA handling to use the static address as the dynamic
>     address, skip device-info retrieval for SETAASA devices, and tolerate
>     M2 for SETHID/SETAASA similarly to ENTDAA.
>   * Reorder DesignWare I3C clock/reset to include optional clock in the
>     ACPI skip clock/reset quirk.
>   * Add prints for missing ACPI clock-frequency and SPD5118 I3C
>     device type read failures.
>   * Fix grammar in comments and commit messages.
>
> v2->v3:
>   * Fix maximum value and indent bit list for mipi-i3c-static-method.
>   * Move I3C_ADDR_METHOD_* macros to dt-bindings header.
>   * Drop ACPICA commit IDs, keep only the Link: tags.
>   * Revert the change which proceeds to register other devices if SETAASA
>     is not supported so that it aligns with the rest of the driver and to
>     avoid the issues pointed by Sashiko.
>   * Rework multiple commit messages.
>
> v1->v2:
>   * Added patch to remove 16-bit addressing support for SPD5118
>   * Guard ACPI calls with #ifdef CONFIG_ACPI
>   * Remove CONFIG_OF guard for of_alias_get_highest_id()
>   * Mask mipi-i3c-static-method in the driver to select only valid values.
>   * Proceed to register other devices if SETAASA is not supported.
>   * Update commit message and links in the description of multiple commits.
>
> Akhil R (12):
>   dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
>   i3c: master: Use unified device property interface
>   i3c: master: Support ACPI enumeration of child devices
>   i3c: master: Add support for devices using SETAASA
>   i3c: master: Add support for devices without PID
>   i3c: master: match I3C device through DT and ACPI
>   i3c: dw-i3c-master: Add SETAASA as supported CCC
>   i3c: dw-i3c-master: Add ACPI core clock frequency quirk
>   i3c: dw-i3c-master: Add ACPI ID for Tegra410
>   hwmon: spd5118: Remove 16-bit addressing
>   hwmon: spd5118: Add I3C support
>   arm64: defconfig: Enable I3C and SPD5118 hwmon
>
>  .../devicetree/bindings/i3c/i3c.yaml          |  36 +-
>  arch/arm64/configs/defconfig                  |   3 +
>  drivers/hwmon/Kconfig                         |   9 +-
>  drivers/hwmon/spd5118.c                       | 119 +++---
>  drivers/i3c/master.c                          | 390 +++++++++++++++---
>  drivers/i3c/master/dw-i3c-master.c            |  59 ++-
>  include/dt-bindings/i3c/i3c.h                 |   4 +
>  include/linux/i3c/ccc.h                       |   1 +
>  include/linux/i3c/master.h                    |  20 +-
>  9 files changed, 498 insertions(+), 143 deletions(-)
>
>
> base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
> --
> 2.43.0
>
