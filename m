Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013068.outbound.protection.outlook.com [40.107.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C193C09F1;
	Wed,  8 Jul 2026 05:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783490148; cv=fail; b=uPndovijk7I2RSSSJFbaaE5MDRCdgaBsDlS6URKswbd41qbH+2yMNQ6TiEK/vtIBxyesk4s2qVeAoEbvgLFVI1aS6zcucwmNFTREMkjKcxF6H7fqd/PkiY7nd77m/PBxSnY/EvrAGc/5Z4HICgBdqUTcjIOr8ctV4KQvBktX4JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783490148; c=relaxed/simple;
	bh=q8cnbLqvUbEqf3egxBv4fU2FfjitUtg0nzbzSOPwzvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PpatcqTjfEL4XNOGzfjKyEMgkCweOobDIfGH504lj/UQmM5wVazdJ6195JgFiJRQrQLh3FxLohVG5kXJK7rJi3zT3PlPub3rdwht1jzu51HMjtVIV3Du8tJ2E+hytmkj2cTbhYjlHrz5or/OarRnmSyLkwIXnzjsCoVn79jr+X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pZvsYyM0; arc=fail smtp.client-ip=40.107.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pZvsYyM0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYov/9ToJmtFBoEArG5GH47y0GPxhUvTJz+qb2JgYO5z6QgYB1IH/g2VpUOuuCqJk1PyZbOoHR0V++gqWL9ZAuGxo1fLe7Z+ZZRKnA/c92qk8wdAgSwLctsHlJh1j4xkz5rN2lahvO1VgVrjtav+o8iGylMDvGqcObgbT+3xhLGPYZxbIzHOt0JdUYRnDbJLDMvvUVLMW1axt5wt7CORy9zCxDVwFXkJtM0pf8/PQmSq2sX4Cryt/rAX8Dd8QLjQJtsqCcuYLyYn9RJl610BSPHC+CFJd+I1UkAQ3RcQLJJ28vw2mTIuMo3Tbgq7vvtp2tiaoVzxZ3L0fxWOQboZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xS37M2lGhLrak3HIAweZCM7Hq+7VOSB2UfaoVoAu388=;
 b=pJNmim1kRox658Xux7gSBWjZvBi7GBtdCilnG8C60AjaFnBcMv9SV4vxZ4i7k18ghSNzLNweBNXckI7NuJrJfHpebrj2ZXcUn1jbNegAIlJrSNfzDjl64LjEr+Nql951S4qUNd3lKGp19pYnyI6F5wCcOy6uwIlYeHDLba3JkxhBk1dhWOP2Yp1nxdEwTTl3TyB3w7fm7GjCA3e/VoBIiTNdJT0FGZvx7ffQIIswRcaPTDXwy03VHzAwWZInyFDQ7DU2DUB2cF8mobaN2F0oCyP8eYLw6uE/OVuLsLO9+hAnJJIGxEJfDO6YNWA4JGB4GpFG7JiTS8EsnVKNNANCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xS37M2lGhLrak3HIAweZCM7Hq+7VOSB2UfaoVoAu388=;
 b=pZvsYyM0AfTojFvXnxG69Z6qR/UyeS8R7llNlcCDZPLOYfd0oVvbo3sCMcRZ3Uu6lUQ8sGhgQJaN8IrGLzVE2fvMhpqFihyjIa0w4skGBignbzwg5ZnlYRgXiRUnJ3nT0LWNVeHQR+Rr89EqrbTMXSBOr+GUTln9AkgJfTKWwrqK2vAFW8lODFuemR/dbIoQkomNYrP38fw86jTUuZSItpstBicEw0cyHDrE8jXeHj5Bz0WDIJ5X9nIIK/gbBcxIQUCdYYz0tSyzb00vaXwq0g0esDUTOJiEmRLg5OYQjSzT+tuEqQaeYxYMeO/wpoByNEXOjd0cUOFWBfLrbLSpTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ5PPFB332093D3.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Wed, 8 Jul
 2026 05:55:41 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 05:55:41 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jiqi JQ9 Li <lijq9@lenovo.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>
Subject:
 Re: [External] Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 device
 tree
Date: Wed, 08 Jul 2026 14:55:37 +0900
Message-ID: <qH2CwJ61SfKj2xT1jc5N9Q@nvidia.com>
In-Reply-To:
 <JH0PR03MB863759EED0FBEED43ADE8AC983FF2@JH0PR03MB8637.apcprd03.prod.outlook.com>
References:
 <20260701090639.669524-1-lijq9@lenovo.com>
 <qdp3icvlQKCtNtIxYUjG_A@nvidia.com>
 <JH0PR03MB863759EED0FBEED43ADE8AC983FF2@JH0PR03MB8637.apcprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0150.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::19) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ5PPFB332093D3:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b95ebf-766c-48a6-4808-08dedcb58afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|23010399003|5023799004|11063799006|4143699003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1lbHBCf+uaIeFFDEOnk7cracYuZUpLIwvsS7yrOSqXOFSiPKBe+lUJ4gj/a3grQT4/eJkZfBfWQsrYnJxxTWdufso1OVAK4YyJh/6tvHAQz6vLtkfMl4jrfwuKm+g21mDeXIQQfYJlE9biiR/yZS9cvuwfY5D/NpOeXr8hoPRyDcmLCrsVe9kKgquRGQ5YWrXC/icN4ZrcVZFhAjsDACyPxGSQ/wTjUiZ3DYhXVaovLmImZFYRJ4heGrYDwlQGsoR07smEBsxQdKyI/rO2/xQVgowB6esy+RrcUJFpKlQE4nOkUBpM24yVpIPdUCzs7vOa2RsvfNsp5lB8ayzCsxe+txp3gj7DRBFzsI1B6xB3tYS6lQD4JRlukDT5hs2wi1D+uanuqlNdpvcDLzkY58e3cWt4e1d6baeMl+KcxUl3ws3C8kI2OcD8fpOg+nbooIKKSb/TkQuwKn1b0LsCIAQFRrkV1L/Ex74fL75c75nNIxgVOOG/HICxsY5b9FQBxftQzn9PIN94Oa7jxhQ2XVD50sNXTAheqNc0nxjvUZIbHpbq97Cf4W7N/mcvOcH8xMyYtji4SC22x2vE6mbnwzvm4iTeIfbcjn9vHMkUqLL52Vg37iHNmUazp0YbTReLe8XHgafSyZ4w7CVqvaypVorFgxV0to+SbOAtFABsy3Nxw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(23010399003)(5023799004)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXd0Zy93YUpCeDFKQmpRYnFCVlZRMnZYamdCdlFtemtrYWJ5K3ZQd0VjeWpZ?=
 =?utf-8?B?b0lqbzlTaVBmcWQzZ04zUlhBdWxyRWxrM0VGSGp1ajVjQlVsRmNseXRmQi9J?=
 =?utf-8?B?NkIxT1Y0R3JmeVI2TkNMelowVVZwaUtBMVcrbUZIQ29MSmxnWklzKzlqeElE?=
 =?utf-8?B?R29lVEZ6d0NZclc2TzJBUXFMZnJubk13bUp2L0pFaG9tbXpoRWhqUHF4Qi9l?=
 =?utf-8?B?WVlhZExodzdzaXRwOExpckpDQ3FNYUJ3ZW9vNS9PREdlb2JmbTFpbjVTN0Fn?=
 =?utf-8?B?SDdRNGs0S3I2cjVVVEVrajhJdWtwd0VjWlNxQUJ5ZWd4RzM2T2ZXOFQ2aDZ5?=
 =?utf-8?B?Z2NTY0VMWEsxTEdMNXh5cVJ4YmMvd0xqWGtjaU0rMXlYanN6cTQ3TmZXbDcy?=
 =?utf-8?B?SjgraEpQSHBmbzZqY3F5VTFXY1RIWW8yWmFkWWVkMDh3MHFqcTlwRzRabHFC?=
 =?utf-8?B?dkFUL0pMS0lYeHU5MUtwbWd5akdrWEJwTzF5emRHcFJsT2NscUM0Q3JLWkNV?=
 =?utf-8?B?UVZKVi8xSzZ1dHRZQllyR092QlM5WHRDZTlkeXVOWVNGOUJDbXJYSkNMTTg2?=
 =?utf-8?B?YVJ4Y3MzTXhuRk1PU3RLKzFVNFhNUEhRVFY1TnlkZ0h5QXZKT3NkZlowaGhx?=
 =?utf-8?B?RWRBbGpNbmVqOWlSN25KeCt1OTduWEN3YjR5K1lDTE91VkFhbEwvWWxIQ0lB?=
 =?utf-8?B?UHZodFdFdG1GTVNUT1MweklrcG5UMWM2Qk05SUFMTUUrNFRpNGNrd3BIQnhx?=
 =?utf-8?B?OWgxaDBiZXhMM3VTalVkZTdhcjB4Tyt5bXJmMFNjNE1od0NocStDMkEzTjZB?=
 =?utf-8?B?Vm54N0k1UDVrd2RYY3VxelFhdGEvV3NIekQyRnNISHFRUHBMdE4xdWI3QWlN?=
 =?utf-8?B?M1NZSzZ6R3YxVVhRV3ZsbHhxNGI1TmVUV3lCcmYwVW5wc3g0aXJXWDNIS2kv?=
 =?utf-8?B?NHI4ZytCZkFQRGNxMmpZaTNLbkR5N0V6c2RoM24wQnYwVG9XaXRWWHBOeWtM?=
 =?utf-8?B?bUNIMkxyN2NsWTFJeUl6UXlaL0RPQ1dvTWloZk13S2lQdi9qaU5YOWhkRUhF?=
 =?utf-8?B?OWJGQzBkdW9aazNTZy81ZzJVKzhTM0VxYTRidUx3VDJRMGoxRmVFKzJleEU4?=
 =?utf-8?B?aFNSMTRjQkptY2ljbEFsK3dxdEZwaFN6a2U0ZHhzbG83UExDSDBSNUZFVVVl?=
 =?utf-8?B?UzRoaU1OcEVIZDNPS2JMZGhpZUNIVURFb3pzWkxlQ1FzZkxjQTU2US9JL3RB?=
 =?utf-8?B?VFlKNUM4MDM4U1NhWUVPM0poelhuOFhQbExLanAvWWZJV1hXUkx5b2pGN3cw?=
 =?utf-8?B?UjNoZlJ1NzhkKzFpZUlSdGNubnhkV2VMK2xMODFwVWJDSkFObTc3dW9Gckwv?=
 =?utf-8?B?QWk3OUlFdUFxN0tOL1ZLUXgzUlkyeGVCK0dXdFQ0dTgweFlFR3VuQ0pYSlI2?=
 =?utf-8?B?ODVyQTNKdkVXM053MGFkdkJmZkxaRFVzRTZYUk5za1VFRTZhQ2Q1WVVtaFhP?=
 =?utf-8?B?cVFaZFVZM3drM0Nsc2FBTzg3d1RIcGdqbFBBSjdidWdINXhPN0NrTlFVY0pX?=
 =?utf-8?B?cmxYVmJ5THBJbDhBcUFtQmVEOGZMQUFJd0Q2RzltQmtKV1B6MWlYbWwwUk04?=
 =?utf-8?B?c3JteElQTmU0c0VVTjh1R25YYk92cUg0UWtzTHhaMWs3SUh5K1U1RmxQenht?=
 =?utf-8?B?R0c2WmovZzNRVFo0TVpialg1LzhqRUFudUs1Yk1RMG95Q3lER0laMWhESlJh?=
 =?utf-8?B?dmlNSG1rT295MThnNUFubjJVTmRVVmh6blJDRjYzV3Z5MXUyNFJlSkpGK1Nn?=
 =?utf-8?B?NitxTlgvZ1dwOTlFcUdBOUU1aUNHNmxmY0hrTlhZdlovOWtYSmJDNUd5YXVx?=
 =?utf-8?B?SnowMlRXc2ZLejVzRUF4MndXSzJXTXZJQWxmTDVicTF6RWVlRlM3SzFUTXM0?=
 =?utf-8?B?ZGFBaVlLTFZ2ZEo4UnRvTlRlNUtOMHdKVUpMeTh2NExSR2c4QUt1Tm5TUGVk?=
 =?utf-8?B?RlFSTUZIMmplTGlNaGY2ay9DeS9tNU9rb3NiRGk1MHZ5RzVaMUEzRnd4cDNL?=
 =?utf-8?B?K2s2TGRMZWNUdmd4c0Rob0c5UjhYRTBHdEVIOU9PNlEzNk5CQU5qczRROVR1?=
 =?utf-8?B?QmIyUXNpd1Y5VWVSdXJIZWttVm5WTG9xVW1lRlhMdVQ2S3NQcjlGRUNBdVM3?=
 =?utf-8?B?Zm8zTnk5VjBSdWxCVnlXekJPT3I5ejhZK2hHMlIveUY4bnZPWGRhdVUrUkMx?=
 =?utf-8?B?VTlsNFpYb3BNUytTdGRrN21lU3A2N0h5ZUxiNjFnVS9GcUNVNzZnSkxJRklp?=
 =?utf-8?B?eldiK281M2UvaGN1MGV0QnJrdTkyNkk5RDdxa1Z6T3VGeFhrZFZCMjVlSEhk?=
 =?utf-8?Q?Bzy6cdoqyfSKzi5Ns1BJcYmaU1IKMB7BKIOMSZa7fsKwu?=
X-MS-Exchange-AntiSpam-MessageData-1: EpzeH2whxt+wOQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b95ebf-766c-48a6-4808-08dedcb58afe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 05:55:41.3830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZH0oTFuPcMQva4LIlcpV3z4Hxm/BmgVe6xvkCR6gKRSu8EcKepJigaxk2LHyBkYR8m+8sN03hy7oWmAipbZRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB332093D3

On Wednesday, July 8, 2026 12:17=E2=80=AFPM Jiqi JQ9 Li wrote:
> >> Add initial device tree support for the Lenovo ThinkEdge SE70, an
> >> industrial edge gateway based on the NVIDIA Jetson Xavier NX module
> >> (P3668-0001) with a custom carrier board.
> >>
> >> This initial submission includes:
> >> - 40-pin expansion header pinmux configuration
> >> - External Micro SD card slot with dedicated 3.3V regulator
> >> - I2C bus for 40-pin header
> >>
> >> Static verification passed: dt_binding_check and dtbs compilation
> >> complete without errors.
> >>
> >> Signed-off-by: Jiqi Li <lijq9@lenovo.com>
> >> ---
> >> Changes in v2:
> >> - Remove unused input-related headers from baseboard DTSI
> >>
> >> Changes in v3:
> >> - Merge baseboard content into main DTS, drop separate baseboard DTSI
> >> - Use stdout-path instead of bootargs in chosen node
> >> ---
> >>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
> >>  .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 113 +++++++++++++++++=
+
> >>  2 files changed, 114 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinked=
ge-se70.dts
> >>
> >> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts=
/nvidia/Makefile
> >> index 72c0cb5efa47..736a3f8a923f 100644
> >> --- a/arch/arm64/boot/dts/nvidia/Makefile
> >> +++ b/arch/arm64/boot/dts/nvidia/Makefile
> >> @@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186-p3509=
-0000+p3636-0001.dtb
> >>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p2972-0000.dtb
> >>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0000.=
dtb
> >>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0001.=
dtb
> >> +dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-lenovo-thinkedge-se70.=
dtb
> >>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-sim-vdk.dtb
> >>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-p3737-0000+p3701-0000.=
dtb
> >>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-p3737-0000+p3701-0008.=
dtb
> >> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70=
.dts b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> >> new file mode 100644
> >> index 000000000000..530d5bcaeba7
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> >> @@ -0,0 +1,113 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/dts-v1/;
> >> +
> >> +#include "tegra194-p3668-0001.dtsi"
> >> +
> >> +#include <dt-bindings/gpio/tegra194-gpio.h>
> >> +
> >> +/ {
> >> +     model =3D "Lenovo ThinkEdge SE70";
> >> +     compatible =3D "lenovo,thinkedge-se70", "nvidia,p3668-0001", "nv=
idia,tegra194";
> >> +
> >> +     chosen {
> >> +             stdout-path =3D "serial0:115200n8";
> >> +     };
> >> +
> >> +     vdd_5v0_sys: regulator-vdd-5v0-sys {
> >> +             compatible =3D "regulator-fixed";
> >> +             regulator-name =3D "VDD_5V_SYS";
> >> +             regulator-min-microvolt =3D <5000000>;
> >> +             regulator-max-microvolt =3D <5000000>;
> >> +             regulator-always-on;
> >> +             regulator-boot-on;
> >> +     };
> >
> >Nothing currently references this regulator. Should e.g. the SD
> >regulator below supply from it, or should it be removed?
> >
> >> +
> >> +     /* Fixed 3.3V power supply regulator for external Micro SD slot =
*/
> >> +     vdd_3v3_sd: regulator-sd-3v3 {
> >
> >Should be called regulator-vdd-3v3-sd.
> >
> >Also, please move the regulator nodes to the bottom of the file
> >matching other device trees (alphabetical order).
> >
> >Thank you!
> >Mikko
> >
>=20
> Hi Mikko,
>=20
> Thank you for the detailed review of the regulator nodes.
>=20
> I have addressed your comments for the upcoming v4 as follows:
>=20
> 1. Regulator naming and placement:
>    - I will rename `vdd_3v3_sd: regulator-sd-3v3` to
>      `regulator-vdd-3v3-sd` to follow the naming convention.
>    - I will move both regulator nodes to the bottom of the file and
>      order them alphabetically (regulator-vdd-3v3-sd then
>      regulator-vdd-5v0-sys).
>=20
> 2. Regarding `vdd_5v0_sys`:
>    - After removing it, I encountered compilation errors because it is
>      referenced by nodes in `tegra194.dtsi` (USB padctl) and
>      `tegra194-p3668.dtsi` (PMIC regulators). Therefore, it must be
>      kept in the file. I will add a comment to clarify it is a system
>      supply required by the SoM and SoC layers.

Ah, indeed. That's fine then. I agree that a brief comment would be
helpful.

>=20
> I will submit v4 shortly with these changes incorporated.
>=20
> Best regards,
> Jiqi Li
>=20
> >> +             compatible =3D "regulator-fixed";
> >> +             regulator-name =3D "VDD_3V3_SD";
> >> +             regulator-min-microvolt =3D <3300000>;
> >> +             regulator-max-microvolt =3D <3300000>;
> >> +             gpio =3D <&gpio TEGRA194_MAIN_GPIO(Q, 5) GPIO_ACTIVE_HIG=
H>;
> >> +             regulator-boot-on;
> >> +             enable-active-high;
> >> +     };
> >> +
> >> +     bus@0 {
> >> +             /* 40-pin expansion header custom pinmux configuration *=
/
> >> +             pinmux@2430000 {
> >> +                     status =3D "okay";
> >> +                     pinctrl-names =3D "default";
> >> +                     pinctrl-0 =3D <&pinmux_hdr40>;
> >> +
> >> +                     pinmux_hdr40: pinmux-hdr40 {
> >> +                             pin7 {
> >> +                                     nvidia,pins =3D "aud_mclk_ps4";
> >> +                                     nvidia,function =3D "aud";
> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_=
NONE>;
> >> +                                     nvidia,tristate =3D <TEGRA_PIN_D=
ISABLE>;
> >> +                                     nvidia,enable-input =3D <TEGRA_P=
IN_DISABLE>;
> >> +                             };
> >> +                             pin11 {
> >> +                                     nvidia,pins =3D "uart1_rts_pr4";
> >> +                                     nvidia,function =3D "uarta";
> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_=
NONE>;
> >> +                                     nvidia,tristate =3D <TEGRA_PIN_D=
ISABLE>;
> >> +                                     nvidia,enable-input =3D <TEGRA_P=
IN_DISABLE>;
> >> +                             };
> >> +                             pin12 {
> >> +                                     nvidia,pins =3D "dap5_sclk_pt5";
> >> +                                     nvidia,function =3D "i2s5";
> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_=
DOWN>;
> >> +                                     nvidia,tristate =3D <TEGRA_PIN_D=
ISABLE>;
> >> +                                     nvidia,enable-input =3D <TEGRA_P=
IN_ENABLE>;
> >> +                             };
> >> +                             pin35 {
> >> +                                     nvidia,pins =3D "dap5_fs_pu0";
> >> +                                     nvidia,function =3D "i2s5";
> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_=
DOWN>;
> >> +                                     nvidia,tristate =3D <TEGRA_PIN_D=
ISABLE>;
> >> +                                     nvidia,enable-input =3D <TEGRA_P=
IN_ENABLE>;
> >> +                             };
> >> +                             pin36 {
> >> +                                     nvidia,pins =3D "uart1_cts_pr5";
> >> +                                     nvidia,function =3D "uarta";
> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_=
UP>;
> >> +                                     nvidia,tristate =3D <TEGRA_PIN_E=
NABLE>;
> >> +                                     nvidia,enable-input =3D <TEGRA_P=
IN_ENABLE>;
> >> +                             };
> >> +                             pin38 {
> >> +                                     nvidia,pins =3D "dap5_din_pt7";
> >> +                                     nvidia,function =3D "i2s5";
> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_=
DOWN>;
> >> +                                     nvidia,tristate =3D <TEGRA_PIN_E=
NABLE>;
> >> +                                     nvidia,enable-input =3D <TEGRA_P=
IN_ENABLE>;
> >> +                             };
> >> +                             pin40 {
> >> +                                     nvidia,pins =3D "dap5_dout_pt6";
> >> +                                     nvidia,function =3D "i2s5";
> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_=
DOWN>;
> >> +                                     nvidia,tristate =3D <TEGRA_PIN_D=
ISABLE>;
> >> +                                     nvidia,enable-input =3D <TEGRA_P=
IN_DISABLE>;
> >> +                             };
> >> +                     };
> >> +             };
> >> +
> >> +             /* Configure i2c bus clock to 400kHz for carrier board p=
eripherals */
> >> +             i2c@3160000 {
> >> +                     clock-frequency =3D <400000>;
> >> +                     status =3D "okay";
> >> +             };
> >> +
> >> +             /* SDMMC3: External Micro SD card slot */
> >> +             mmc@3440000 {
> >> +                     bus-width =3D <4>;
> >> +                     cd-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(CC, 4)=
 GPIO_ACTIVE_LOW>;
> >> +                     disable-wp;
> >> +                     no-1-8-v;
> >> +                     vmmc-supply =3D <&vdd_3v3_sd>;
> >> +                     status =3D "okay";
> >> +             };
> >> +
> >> +     };
> >> +};
> >> --
> >> 2.43.0
> >>
> >>
> >
>=20
>=20
>=20




