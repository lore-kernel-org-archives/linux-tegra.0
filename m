Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793343764;
	b=ywvQ82YO+kUauP0s/rXhOdaMRz8fC4oG4TXhcLfZ2TRVPdnRNity7ca+EYdK5vTDvr0L
	 KFq1+RZDp/2oli1sTpXhZ5lAgXe4stL8HWzwsfE/UCAJZ5eaKVOuTzirVOpztINHBj7E2
	 LbkuLpUTktKqiWdhfuWIQRb8/PGDzjLlVYerIm75pRhe2bGnEvriAm+qzATYOH2NSPWMY
	 GVHHTu+4+83zl8F87/2qjl9A5c3zv+fb9lGotG4Nu12k5OxfAnJ+c7x7jBqe0yjaRM0xE
	 1E2DRF8r5aQsFHkP3ta0WzWsaZXnA9fCpkBjRmjaxo1cascp022D9sdlK5AynJvRnHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343764;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qcmnxQOCaJxVBmVTntgGAAl2C1vCgTye7XShEpTtLuQ=;
	b=q+U4ATvFt0qJIrg5p0v9IzfktevHcCkMZ0Yb/OMUC0hivHSVgKc1PVohREt67eJPLzD9
	 ZNIZTp9s9oITFxeN0+5r4GhncvzkP9O3RUL/D5vhEPEqNil2oOmcMI9i2BfvlLSkXFiz3
	 K7e8qjGcttlgYmMKnbh/rHnc8LIxiYm5aEAofDkwZkMZuPFPO7NiPjlOLuD5W4/ZjCzfI
	 GtJNfUbsaBCqyEhxrurTte74KY9AiJ02FrWIAWsSGUaApijAxFA7OD3tn29YsUap+UGW/
	 MazZrywmbfzdeezPqu4tptGINdrOb4gVfo/LxJpeZcVPXyvmAhy9Y3ZRQR/yX53OHNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TQA4dSTw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.65
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011065.outbound.protection.outlook.com [40.93.194.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E7606A31A
	for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 07:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942E7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TQA4dSTw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEeMZmMEGHouW0yy1vk2Rs72abchz31LydbFC+bnj9IGN+UwO8qLfL4bRmJmtJhRNpCwG5Je577+f3uJ3UAOpiAkrPbrDiiLwkfvxyitmGB7VWMu4VhXKm4i+dz9FCJNn57HqGz8F18q+3vxq7KcLXizGFDn+oT7F6sb8YCo/tcv/3OggiiT+eTeEn+gFuPhgBOFovYbE/y4Uhyi6PYAXpMUj6Fw1QoVx+7kyKecdo4I1kz1ZvTiM/p2YXI7KUspiWBZKgizS8VdK/NJNAltrfavtvkknlaCGrmSl7Pz3SDmwoG4/+7BeFJLVbCgEpSehVkJT3BRghiLbmnt+1APTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcmnxQOCaJxVBmVTntgGAAl2C1vCgTye7XShEpTtLuQ=;
 b=mzzk+sK16wwMobyaDNcnCQZO4Ng0NSYgeNKhY9/xyhfpPDo16nMnduFpKirnTfWC8QrqkpTbDrB160ik/oOwJzXdJiUkvwNLXT746BcefW0ztfDnwm/kvGGWhNMRSlL3p0kBm1G3RNRNimu29WEOI8NatGWpxjvXZ6dQ+da4QzlsyQjqTE0WkTD2XnSKXfRdd6zJwC0ziAvd4J/gyCuRiNR/NsRcR2ZGdySziPDut1Ox9cTCDqRubJG+xtF6yQlhU6/R1VDV1oAB2MXSoEwYa//BO0U1+AJA+E5itMy82ENd7H5IWoz+l40UWZD5BmgJUR6zXUH72Y+7q/cYLC/VZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcmnxQOCaJxVBmVTntgGAAl2C1vCgTye7XShEpTtLuQ=;
 b=TQA4dSTwkf0qHG1wgpCdaUBtSLzc6wKSstEtcviHYrNmHWoj1knbYz+HctYaCXfYGYJYO6v+dyxxZ4BzjJPtpRdThrnHFNoYXszSB7pKov1p4aQFtgSg2A9Ab0pOMye3KEOxUIIIgm3c9LrB4tjY0GoR0phrV5Ts+VKvnsYH4F13QCvzpfuwMUfcJtZxZ855kW2m0zfU766qde9ouxMkzqzTj+t+BNQFmCyWXSShXdHlG8nT8Onw2i1bddacMprIcEQjr1IzKHSi7ii9kuFO1enYxmsPV5SCx/31uqak4VzKi2CNmaSn0fAtAw7pwfThy47z2T+Gyc1rO1ei/lF4EQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by LV8PR12MB9360.namprd12.prod.outlook.com (2603:10b6:408:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 07:02:41 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 07:02:40 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Fri, 30 Oct 2026 16:02:29 +0900
Subject: [PATCH] arm64: defconfig: Enable DWMAC_DWC_QOS_ETH as module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-b4-tegra186-ethernet-defconfig-v1-1-ea6e62086ff8@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBBG4as0s3YSoBWrVzEuWvih44IaQGPS9
 O6iLr/NexsVZEGhS7dRxkuKrKlBHzpyy5QiWHwzGWWsVr3ieeCKmCc9WkZdkBMqewS3piCR/Qg
 z9Gfn7elILfLICPL+Da63v8tzvsPVb5X2/QOkNJS4ggAAAA==
X-Change-ID: 20261030-b4-tegra186-ethernet-defconfig-d8e2439cd675
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Antti Miettinen <amiettinen@nvidia.com>, linux-tegra@vger.kernel.org, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.16-dev
X-ClientProxiedBy: TYCP286CA0195.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::13) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|LV8PR12MB9360:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c544ce-9a94-4030-8d41-08df3653c95b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|18002099003|56012099006|11063799006|261026121527099003|10067099003|261021121427099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	MFHJnmoq2DobZw9EhqqeQOmwva8Sb0StERjcIxS7506OuueKame/ENgAynsFEjBa17MEdyz3/yeqINxEQIbT4bTQtKlf5Esiqjnka+fzEoXFJEmag+hZNO2yAykCBNul8Iy9vBfmrtUYdod3zLzMjvypkpuZN16ls0JWzyMw/LRhvUsRC3FX6sqTiLF0fnB4E5Qo0HFB4WjxN8k99zMARZXyX/lLEoCyGlj1a3SKdLVjCEDqniB2lZAbijFQ36zRpEgavzEqbmHxcbBqQidQK/nlqJW2hnGC9rCcuYs5d+cp2IBOgyK3/zoJom39saKykBN7EpyTmxtRLdg1qGmPkR0ENZFi1iRgkn5oe8OTCySzMzJ8JVYZ/mS/iqxXUfix9CQGOW9ml9BZqIFTd7fUWELErdNoROqGi244vNnNapm4Smt+DhWuPKwCgTCqKHGbSDzuvbO0IU4pvrd/egF/NW9A4V5Pixa6n1l1fj8yMH4wf2k1ZPa4+y/pyhFSsIn/oJ1QGJ/F9VxorowOWke0TNMJ7rUHjlK5K9fcqlSvEZHoHNcv5rtdWtgyY3wj4qC8iOygP5te3EXsngVaW3v637GvG8dKpXH3kdkJgRdevEZXf4A0e1EcVAWS/OLE56LWEcSXfJqd5iysv2Ih7iHDnZ8vEX2squk9Xv9QNl8tzqQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(18002099003)(56012099006)(11063799006)(261026121527099003)(10067099003)(261021121427099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWZVY1pHaGpQT2txUGQzaTJNS3pWVG9zbDlnVkxKbm85NEVGc1JHTEtvOHJ2?=
 =?utf-8?B?R3JDdXhXbHJiZG5yYStkbHoxREJFdnFRcmhleXlKZTlCeWtVKzFnM0pLUStp?=
 =?utf-8?B?Z3VsNFZvTDJYTGF6Z1p5b3ZuRTdvSm5pS21tVG1oT0Yzd0tOMkRRNFRFV0li?=
 =?utf-8?B?SXVzUUc1Z2RESGtCcHBUdXl2ZnNSVmM1NGlyR1JsOCtJQ2hHc0pTOXVlLytt?=
 =?utf-8?B?SWRCZ3puUjV1S1lKVkpkZi9zQzJ4bHk1bnNtYnY1MElYUTFpbk9vQnBKSTFU?=
 =?utf-8?B?TWp2Q1dCVlBWZ25JcE9jZjJNUndLL3V1MzVHZlNjUWNIakFmeU41aFRWSWQ4?=
 =?utf-8?B?QTlxSVNpc3Q1bVZFRStjNTZQN2pFSmpPTWY4cFJMZkhGNG03KzJzMnlraTMr?=
 =?utf-8?B?U0hvTG5EalBqNWxPcVk0QVVXWXFQc0tmNitlVHVaNmYxYm9RSTlHMjZoSnlr?=
 =?utf-8?B?NUdzWDlFSU0xdU5aSzd6L3RmOE1zcDQyRkZ4RmNpQmhCbW0vS0ppUHlPb2NI?=
 =?utf-8?B?M3hSMStEV2JicVJLNlo5SiszZHZpemkvTzlPY2J4L3M2SDFhLzJOL2pybklT?=
 =?utf-8?B?RmNlcmdaeE5VcDNWa1NDTkJucDFZMGZ4UDNBSGo3cjhDQ3BoSDZPQ3d6TGxm?=
 =?utf-8?B?VEd3RXcvL1BhZnFweksvS25oWGI2TE5mSVFKa1l3RW1MZzgxYWZTcVIzR0dO?=
 =?utf-8?B?SFFKU0I5VWtyYW9oMDFkZnB0Y3NEUGlqOWVkaG1zREJFdE5TeFEvTG55K2NW?=
 =?utf-8?B?YVQzaWp3bnRxcTFzYWl1TktVMDQ5bHZ1eG1xK0tmYVpVZmVBTHlPOTA1cmRa?=
 =?utf-8?B?OG1hbUk4WFFGOGNCcjBwT2VjRTJxMG0rY3lDWU5Pdy9YMnhDMjdFMlB6Rk5t?=
 =?utf-8?B?dFJPbkVSak9Say81M1VrOGUxWGVqTXVqSyt5Q1lEaG8xSU81VlRWVkxUNGFS?=
 =?utf-8?B?WjIreWtNZWIxT25hL3JqVjRzZFBqTnM2Vkd5MisxblNrOThjSUQ0cVhDelVn?=
 =?utf-8?B?cmFleG9rVERXaEFjUFJXNXB6MjEwYjlhNE4yRFVVQUhjblZZeHpkNHdSMUE0?=
 =?utf-8?B?V1RVcWltb09pTDNjMkNQL1NseUtGdTRxRXBNY0prUnNYUVlsdXJIczJ3Mkw2?=
 =?utf-8?B?QjFJL1BOcTZyS3h4YVhVTVhhcHBJUnNBOE02Y0ZSS3FWZjhsamJvMStNcE9h?=
 =?utf-8?B?K0drdGVyeTNRcGloMGEyaHp5bGtOaWpkTDZ5bWZXQWovWk80R0IrMDdpSm1I?=
 =?utf-8?B?N1pDWkdCbzNkdVZoOGlvM2xLOFU0c3NYSWQyc1J6SXllZmVoaWVjSFVGNER4?=
 =?utf-8?B?SjNwZlRHUE1mak0rbEE2VncwSWFSWG14ZWdBalJ3eHJrVGRKMS9mRFlGK3dP?=
 =?utf-8?B?UmpPYTNVNUYzMS81YkN6dC9abldjejF4L2RoNk5MYU5Hak9wYlhoZHNWZnZt?=
 =?utf-8?B?dG5hV0FPL0UxaGlNbEZDZk9XREoybEJaZlNvSDZGOTc4Nnp3VkFVUk9DQStJ?=
 =?utf-8?B?QkFaYzBjUExmUlk3c3N5bTU3UGxWdnZ1QUlzc3c3WDlJelVudEdNRisrWmxF?=
 =?utf-8?B?S3R6a3FFcnNtejVCRUtlKzZlNyt2YTBtWHdERjhIVXVEd0kza3Y1blQ3Y3BU?=
 =?utf-8?B?Z0QyU1BLYXozbmJBNXVDbVRvMW53bGJlQmMyc1VWNDYrQmE4UzdZL20vd2hK?=
 =?utf-8?B?ZmdQVDN1QWc0TjYxbUZnZFpraXU2WlkyaC9ZUEE2NE10OTJDcUZCa0FMaEFL?=
 =?utf-8?B?cnRLbEhnL1BtSWNheTUwUU1yQnVlZlc5ZWVaa0F3OWdrSVcyaEtxRFdRUWQ0?=
 =?utf-8?B?eSs3L0tXN0pnM2FtTENkajNsNjM1V09nb1pHdWhRWTdTS3JZeE5PVHpYTEdR?=
 =?utf-8?B?Z1htS0tETTFZMDRpeWFNcksyRnByUWlZV1dDSS9hV1hLQ3NGeUxZWGZVczdJ?=
 =?utf-8?B?ZnRIVS8yMEFreXdTWk81QWsyN012MWxDQVpodVZzaHhsNEpMWXU0MUJ3d2li?=
 =?utf-8?B?b2YwdEFZZzM1OEZNSnVWL1cyN2dUdjlRa3M5T1hnYUFSUjMxbWJGTXdibng4?=
 =?utf-8?B?dG15Vm0rUGNnWE9Gd3pRNnNCM1MzZmFhRENOL2Z4VHJ0RW5ZZlpzWG5ZZjFV?=
 =?utf-8?B?akZaZ04xL0tsQVoxS0swSlJQRS9TaVRmckNBcmpoRjlvOHVoczJaWitmZ2VK?=
 =?utf-8?B?WkZWY05OcitJUkJRTEFGYjY2c2lTeXhkbmFEMitEWjM1TDV1d3dkZE5VNk9k?=
 =?utf-8?B?WFNCTXJ3S1FvSjNCOGk1WHkzK1B1aVMxWGl2KythOStqbExlRHhXZXBrWVJa?=
 =?utf-8?B?TXF1YzcyNkcwdlMwVEE2QTJYak83UWtqOVVESjNVT2FHWVI5aWsxZFlzMnV6?=
 =?utf-8?Q?vaH+AtgQJLXOJgTFIgsO9Z8TngnmQzT4B6MshWB5/nINf?=
X-MS-Exchange-AntiSpam-MessageData-1: mmMvy2pjSyl7pw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c544ce-9a94-4030-8d41-08df3653c95b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:02:40.0042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJfLJxJdeJeng12IGf22CMfjrlMQHbH4x+kX8+EwqDUpcRRWuVsziubK0FVHF4KKLhMKqj5HQHbEOneLg/fkhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9360

Enable CONFIG_DWMAC_DWC_QOS_ETH as a module by default to allow ethernet
to work out of the box with Tegra186/Tegra194 devices such as Jetson TX2
and Jetson AGX Xavier.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..15f44291a298 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -446,6 +446,7 @@ CONFIG_SMSC911X=m
 CONFIG_SNI_AVE=m
 CONFIG_SNI_NETSEC=m
 CONFIG_STMMAC_ETH=m
+CONFIG_DWMAC_DWC_QOS_ETH=m
 CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
 # CONFIG_NET_VENDOR_SUN is not set

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261030-b4-tegra186-ethernet-defconfig-d8e2439cd675

