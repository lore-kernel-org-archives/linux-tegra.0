Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67472E5B2A;
	Thu, 23 Jul 2026 05:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784784106; cv=fail; b=DDK02D4GYDTb+SCol5/8/9dnaD5/k1u6J0yS2XNDXusCpoNX5ea+GmDKA9hwRiGg9nwhllnoXqJeQKlnpHPoFJqm7PhK7N5SKbzeleLHpeDSaXZ8nc6r21sGKrU0YymsPIyP1TsHxQNsspEKrBE7HuabjbbNrk2OPRHQshan130=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784784106; c=relaxed/simple;
	bh=BbrzWM4sGlniwPhffFJ1j4h9MrUQH7Uv8WSaxGzV1PU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jr4ENm5IRV8g/uZJlgYFs5Ef8Z3NibpOo4je1BWae4Fi1pmo0oTPzoLbLPYTIaWNj26CTVKIqhORcyJg5kxLnSzV/eIzuAsc9s0SylfEiubvNKBP4YYSjtbjV74+0z1lMJA9bL3f76fHPvHS3OLtU1+SjY/1HE6nYc+5MoRItmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iQfRRD0Z; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iQfRRD0Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNhf2LzzUvIVhQuy/rztEVaF8kFMjp4hBpjDEbGGAlN4Q9GreE2cDyEk1RHPBmzMzeHEPWJW+WSaQa56XXFeIvtGabNUgnyYN6XeyT5Sl8017bdPniZH6bg4Yj6f7qD3FWcV7cGdC2xaMrdbJ2sQrg2FUIhK6WVaOUJg327GOwzOdNuo+ihN2noTtPNgXo1mpQNvLgViRhZiniL4f5jIMscWx7IapLjT1XzmPeUNBhBFroglz709v35wFzfFRiE1hA1+H1PhX6V1MJaiPiYYGsqFSbNfDd8ptOA+9s8nwtaBvYksSv0YljhYBNSrts6aq8Hp2pGKuPeMyX0t0Qh3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peBiFbSefikmgq1TFdW5PuPc5GVEqWNmbDsvyuGTsYw=;
 b=JdOpqpDJSzKU2RJ7JxLkF8QsxhNv99hsbOru00C/aUALRwdtj7LyFrZm8CBirQdyoPZao8WlOFs+6b4V73bJA5xHCrcC8vgpjPS3vrSSjZgfI8nzXq3Kkm0OgQ+y8Sp4jHbMfv7i5nNrCDiTYJzCYeqKkSdxXTwwVepXhub/nYnQTIp/NXOiHcC6GGHPwPkLVjtrADAujMEI+u25F94+O+xND1LkkEAc8rai3/osk6m38Zpm/LkIYq6SSSptZ7Fyid8haLGFa66f65ii4vFdsk+9qVBCDUBj/p9gdZvcmFXO4YR7Zjdh5YK/qtLiUnZgrrOI2iQ0p/hv2HdkioYtnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peBiFbSefikmgq1TFdW5PuPc5GVEqWNmbDsvyuGTsYw=;
 b=iQfRRD0ZsBqtzVxd55rhOLfMCrbvqPU9FCtpq24uLsvZdawreBQYTpdtljdrjGrCva5JD6YSoe2ZkKUlFejhDVlpJ1SAGmhCYJlAQ7w7JCFZt6EjkBJTSsHOCN053iTKbadEc4YbyBh48Lrvn46wqF46PIi7dLfeL38mq4ggYkoxjN8uyWwgZ2e4HbEYvs+8geWyt4tXNG6/uCxkfe1mkGkCGT5RqYitjV/s1wpA9VgcCezzqF/ViSde8XMKvQSYRnpk4heLSnrT9gwNnjPaaUccnZB7nmnCuP1df7WbLYKoWD2xrlzLRAnptDb6xaWSbwlChzIXXlPSh0jrQqTt+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ2PR12MB8847.namprd12.prod.outlook.com (2603:10b6:a03:546::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 05:21:41 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 05:21:40 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@kernel.org, jonathanh@nvidia.com,
 Aniruddha Rao <anrao@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aniruddha Rao <anrao@nvidia.com>
Subject: Re: [PATCH v2 5/5] firmware: tegra: bpmp: Add MBWT sysfs interface
Date: Thu, 23 Jul 2026 14:21:37 +0900
Message-ID: <g7OOz68bQqOVx48MGjK0ug@nvidia.com>
In-Reply-To: <20260722110544.193551-6-anrao@nvidia.com>
References:
 <20260722110544.193551-1-anrao@nvidia.com>
 <20260722110544.193551-6-anrao@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0364.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ2PR12MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c71c02-738b-4f9c-5a44-08dee87a46dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|376014|1800799024|366016|10067099003|4143699003|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xgiNBnyktmaV57iKz8em+uwexade1b7A3VQ0OENgiyYPWjQdceqYd7eaYNCl8KR1VCzynYFel44BDm1thJmuejnA6FizQ7YaUxpdIAsrQ6JoYE9nwn7upliz3f0p1ZbMy2vCav1AcfX8XOHZyksqC4Vvyqob78hrvpwQXuc+uynCXDaISGW6RX+AakUqlN82GXTL73oR1mBU14myxEia8w9MSy86U4WcOPaItk6wq2oIqOIWV8oWcCfARQszqm6tPSqpNKxqv9HroIjFhMRBBBC27HM4xCKJ5WLb+pSa61f2NJG/Gj7E+kEYFLiHHvgIbKkVNhaTNo9AGFng/+S6VpovMAE1Grh+Z3UGviJ6xsq+yySOXticSs0Wr1ZU+bL6UJyXJvZSM5DIC9ozkF3vBmjNmF90C7EvrSJmQq3OvpRJkx0RFqjiMHQ7IPGsj+zE5GaNGlosgXVU+iruT5QbxYpgxyhzv3N7CXZFGFwuDZrHUErFag1LqKqQPSfjfxrsovLZo7D7fP6Z3ft08MFjbqoPcUFxs+mKjy/Kqx6M6uVAoqK91zJAlCT09AF3PIAEP6g8eXIAUu37mzCwuOmGbZFihLrdZqnjw+0l5x45jWnHEysmxnZqEGWqrnJ+tWLtnypnjOIaPnA3CZJ0FQyCo3A7TJ/VzMEkqyRmdvrqxwA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejhPRWhwNmtHSUdKL3NMdm1NMFlIbjZ1TkdXOG10VWltTjRyVzIvdndSM2Fh?=
 =?utf-8?B?bzhVc3QwZkdZNkJJTjk5YmtuR1drSDZ6ZjVIbVJDcFhKL2lHc0E4b1dzTVpo?=
 =?utf-8?B?SCtEU2ExNDJ2ajFNR1FGWjl4dnRHcjkxUCtEN3hpdENDNFpaM0tyWUpndm5B?=
 =?utf-8?B?Q3ZUZTNSdkJpKytPbWRIdlkzc0hJeGZab2JQTkhiakQrYlJRWXRIbEZPUGlk?=
 =?utf-8?B?Sk9HR2dUbHpVa0tHb3hhMXh1cDByUUdLeGpvcmlCa0FsM1dTRXFwOW1SQ3Nt?=
 =?utf-8?B?NlJmaXoyd0RreU4wUlB0dktNeFNxVU1vaDE2V25RWFlVWXF2T2hEald2SEVN?=
 =?utf-8?B?VEYyeXhMNlVvdEtTOEtoMXMvaGEyc3ZpbDIvVkNIRG14QnV2VEV0bGNEdjJI?=
 =?utf-8?B?dTRDcE9mNG0xd29sQ1NqaXNTSVhGNk15S0htZGxwV1MyWFNsSGVSdzBYZVRa?=
 =?utf-8?B?Z3pSdWdKeHBnWW91WTJhcFViK0thY0l5NitDeTN0b0w5U3FwdStLcHJtQmJJ?=
 =?utf-8?B?a0VuUzdzRFR3ZmJvNUZRQkZOcGNWZEN0Uk9WZDVVQlc1ZWtVeXlHUVVmK0dP?=
 =?utf-8?B?NDhXZUZRMUVQSnExYjFqVkp3SlI3T3BkVGthRlpVRXY4WlppNUNaK2FscDJW?=
 =?utf-8?B?cXVRb0JuNHJjSDU0eVA2SFQzTytIeHhGdW9wLytvdEtlY3MzSEtXTFAvdkta?=
 =?utf-8?B?R2JoQUhXaUNNTkUzcWhJeVlzd1doSStRTmlnTkRWSnFDY0wvRG9iK1RzVm5X?=
 =?utf-8?B?TGVWWDRBU3JObDhKK1FjbTlIaDJaZWhGQTh1MXM0amE5RGJRTHVGT1lIUXU1?=
 =?utf-8?B?cTBSUVlFMFlBZS9Tc2h1YjNzejh0RWZjN0F5OUIwWWZ5QXRzUStHVnB4TGFE?=
 =?utf-8?B?YUFvbVdjTll1VHRZWGFsKzVYQzh4Z2pycVRtd1U3bEJMQnZGUTZrMW1WTE9w?=
 =?utf-8?B?Ui91eTloVVFYNXl6TmtYUk5GLy9FQWFKUjlWT0s4TDAxWU1HNnBqTDd3cC9D?=
 =?utf-8?B?eUxYRG82U3lxdWRYOXBvY3pYVVM2eDR2RmkwNkhKd3RxTEo1ZnI3dHVkdVJH?=
 =?utf-8?B?czVJMHJ2ZWpnN21DYzk0V0g3OGphU20zb3h5Yk1OWjcreVMxYm9ZZ0wyZkl0?=
 =?utf-8?B?ZVlPOTFuNXBvY2YrRFgvOEJPekNRM1cwV3pKYUd2YlVlVkdkWlIrcjlHemQ0?=
 =?utf-8?B?akVTeUtyK2pIK1BEQlB4V0ZtVGJpZ2xCVlEybmNudUFValFadHFjTmV2dnRQ?=
 =?utf-8?B?QXVFTzRWa3pBU2ZHVVV0RUZ2bTlPSHdveWVDYSs5dmVHd3NRaWdIdU1obHZr?=
 =?utf-8?B?UkJ2d3hMZWllVEIrSVlIQU1jSHZYdzJWelhzOExVZE9uT0pjYUUzOHhNdko3?=
 =?utf-8?B?S1FRamtqbUlJQ29ZMVZPaFlLM2RHbHFrdnRiUXBabmI2WlBlaTdiNUo5T2Vr?=
 =?utf-8?B?UUxpM3VPTlBUQ240UFNVNUFkUGlZZ2tZOUdZK1dZS0o5d0RoQkxXYlJwOG1i?=
 =?utf-8?B?cVpZckp2YmQ0eGt3Z1ZIODdCSVVTd2xGWDRPeGt4a3MwMnk3T25DeWk1Q3Br?=
 =?utf-8?B?Q202ZmtlN0IyZGR5dTFwK3NtMHJWZXdwb3NEZzZTU013dlZRWmNrSnc0QXl5?=
 =?utf-8?B?VXBnWm50aEwxd0gzbTNlZVhCdFhVeDJ6TXczSDUwd0FiVUM2S1Q1R2Y1U2M0?=
 =?utf-8?B?cWowWG02MGpKZGhERm1jTUE2YXh2V2tHUUpNbTdzMHQxMHVpZ3VjOWpWVEdi?=
 =?utf-8?B?WXNXdXRJbjdKUTJ3endFaytZS0pEVGlPSjhFWDlDTThDZlM1ZWxDMVhCblNk?=
 =?utf-8?B?L000MFkvZ3lLUDYzK1Iyc0RnRk1kMkI2MkxOZDFHQmMxMUZ0d0tMbk1CaVpF?=
 =?utf-8?B?TG1YSlJLNXY5aUc2T2lSQmlBMHV6T0dBdm41SjZEMHJQbnVSaVIrVjdWZk5P?=
 =?utf-8?B?MUlORHBPaStyT0xoTzZ4NGREZ3Z3MlJLeml1UlAvY04vaWpmMFVkOEhUUVZG?=
 =?utf-8?B?bGxSb1gvVko4N0lrOG5Vc2VMV3ZWWEh4WXpSb1ZFeW83cWxnWVFmOGpZMFE1?=
 =?utf-8?B?YnBmaGZPa0NRZDQvOEwwbUNUMlBDZ0RldmtSMjdudVZwNndDNW1pTU1TTm1w?=
 =?utf-8?B?U2h6VjZGOGJyS1p3U2pCeFhZMzRqR2ZHbUxPQjVQZWJPVnFWVFcxNFhkZ3NU?=
 =?utf-8?B?NzV3MXNyZ1R4U0JPTzNleGwvaFVlbC9BRDBzRy8rRy9sdTBYVjh3RjFMQTQz?=
 =?utf-8?B?L0dNcHM4SGR3cG5KaG9kckRGbXhzNkN3aldweE9VS1N2MlpTZGJiTkc1RXV2?=
 =?utf-8?B?a01HbyszQWhicXpkQndEeHVSVkpaSjNzNGczelFEUnh1bVNscXNQU1RkR2lC?=
 =?utf-8?Q?3YU2L+YIEFgiQAHbBVLmMjxedoNz6QJbGBAepyIa2x+MK?=
X-MS-Exchange-AntiSpam-MessageData-1: 0bC3+9NHmFGpFw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c71c02-738b-4f9c-5a44-08dee87a46dc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 05:21:40.7202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHtZyLW0EphmPPcuXVPiIOWJwNxXP9Un85e5k1wNhupNW49u17XRyh44PjZj8JJWltb61jYM8Fxawm8+Kd8s5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8847

On Wednesday, July 22, 2026 8:05=E2=80=AFPM Aniruddha Rao wrote:
> Different workloads can place different memory-bandwidth demands on the
> system. Selecting an appropriate bandwidth limit depends on the runtime
> workload mix and on the devices carrying that traffic, such as PCIe
> traffic or GPU traffic connected over the chip-to-chip link (NVCLINK).
> That information is not available to the kernel.
>=20
> BPMP firmware of some Tegra platforms provides Memory Bandwidth
> Throttler (MBWT) controls for PCIe and GPU traffic connected over
> NVCLINK on the path to DRAM. Each PCIe bandwidth group has a single
> shared cap for all traffic in that group. Bandwidth for a group can be
> set per traffic type.
>=20
> Add sysfs attributes on the tegra-bpmp platform device to expose a
> narrow userspace interface for MBWT control. The attributes are arranged
> as mbwt/pcie0..pcie5/pcie_read/bandwidth,
> pcie_write/bandwidth and nvclink/bandwidth files. Each pcieN directory
> identifies a PCIe bandwidth group and each traffic directory identifies
> the traffic type.
>=20
> Reading a bandwidth attribute queries firmware for the selected bandwidth
> group and traffic type. Writing an integer programs the target bandwidth
> cap in GB/s for that bandwidth group and traffic type.
>=20
> Register the attributes only when BPMP firmware reports support for the
> MBWT GET_BW and SET_BW requests through its query ABI.
>=20
> Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
> ---
> Changes since v1:
> - Register the interface based on MBWT firmware support, not ACPI.
> - Replace the stateful tuple attribute with per-traffic bandwidth files.
> - Remove software bandwidth range checks.
> - Build the sysfs interface under CONFIG_SYSFS.
> - Rename the registration helper to tegra_bpmp_init_sysfs().
> - Avoid platform-specific or transport-specific MBWT wording.
>=20
>  .../ABI/testing/sysfs-platform-tegra-bpmp     |  48 ++++
>  drivers/firmware/tegra/Makefile               |   1 +
>  drivers/firmware/tegra/bpmp-private.h         |   9 +
>  drivers/firmware/tegra/bpmp-tegra-sysfs.c     | 205 ++++++++++++++++++
>  drivers/firmware/tegra/bpmp.c                 |   4 +
>  5 files changed, 267 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-tegra-bpmp
>  create mode 100644 drivers/firmware/tegra/bpmp-tegra-sysfs.c
>=20
> diff --git a/Documentation/ABI/testing/sysfs-platform-tegra-bpmp b/Docume=
ntation/ABI/testing/sysfs-platform-tegra-bpmp
> new file mode 100644
> index 000000000000..36440e696e7d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-tegra-bpmp
> @@ -0,0 +1,48 @@
> +What:		/sys/bus/platform/devices/<bpmp-device>/mbwt/pcie[0-5]/pcie_read/=
bandwidth
> +What:		/sys/bus/platform/devices/<bpmp-device>/mbwt/pcie[0-5]/pcie_write=
/bandwidth
> +What:		/sys/bus/platform/devices/<bpmp-device>/mbwt/pcie[0-5]/nvclink/ba=
ndwidth
> +Date:		July 2026
> +KernelVersion:	7.2
> +Contact:	Aniruddha TVS Rao <anrao@nvidia.com>
> +Description:
> +		Provides access to Memory Bandwidth Throttler (MBWT)
> +		controls exposed by BPMP firmware for PCIe traffic and GPU
> +		traffic connected over the chip-to-chip link (NVCLINK) on
> +		the path to DRAM.
> +
> +		The attributes are present only when BPMP firmware reports
> +		support for the MBWT GET_BW and SET_BW requests through the
> +		MBWT query ABI.
> +
> +		Each pcieN directory identifies one PCIe bandwidth group.
> +		Each bandwidth group has a single shared cap for all traffic
> +		in that group. A group may contain only PCIe devices, only a
> +		GPU connected over NVCLINK, or both PCIe and GPU traffic in a
> +		bifurcated topology.
> +
> +		The pcie_read, pcie_write and nvclink directories select the
> +		traffic type for the selected group:
> +
> +		pcie_read
> +			PCIe read traffic
> +
> +		pcie_write
> +			PCIe write traffic
> +
> +		nvclink
> +			GPU traffic connected over NVCLINK
> +
> +		Reading a bandwidth attribute returns the bandwidth cap in GB/s
> +		reported by firmware for that bandwidth group and traffic
> +		type.
> +
> +		Writing an integer to a bandwidth attribute programs the target
> +		bandwidth cap in GB/s for that bandwidth group and traffic
> +		type.
> +
> +		Examples:
> +			cat .../mbwt/pcie0/pcie_write/bandwidth
> +			echo 100 > .../mbwt/pcie0/pcie_write/bandwidth
> +
> +Users:		Platform integration and bandwidth tuning on systems with BPMP
> +		firmware MBWT support.
> diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Mak=
efile
> index 41e2e4dc31d6..59085e183fbd 100644
> --- a/drivers/firmware/tegra/Makefile
> +++ b/drivers/firmware/tegra/Makefile
> @@ -6,5 +6,6 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+=3D bpmp-tegra18=
6.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+=3D bpmp-tegra186.o
>  tegra-bpmp-$(CONFIG_DEBUG_FS)	+=3D bpmp-debugfs.o
> +tegra-bpmp-$(CONFIG_SYSFS)	+=3D bpmp-tegra-sysfs.o
>  obj-$(CONFIG_TEGRA_BPMP)	+=3D tegra-bpmp.o
>  obj-$(CONFIG_TEGRA_IVC)		+=3D ivc.o
> diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/teg=
ra/bpmp-private.h
> index b3770e71020e..3a15a7aa0ffc 100644
> --- a/drivers/firmware/tegra/bpmp-private.h
> +++ b/drivers/firmware/tegra/bpmp-private.h
> @@ -33,4 +33,13 @@ int tegra_bpmp_mbwt_get(struct tegra_bpmp *bpmp, unsig=
ned int instance,
>  int tegra_bpmp_mbwt_set(struct tegra_bpmp *bpmp, unsigned int instance,
>  			unsigned int vc_type, unsigned int bandwidth);
> =20
> +#ifdef CONFIG_SYSFS
> +int tegra_bpmp_init_sysfs(struct tegra_bpmp *bpmp);
> +#else
> +static inline int tegra_bpmp_init_sysfs(struct tegra_bpmp *bpmp)
> +{
> +	return 0;
> +}
> +#endif
> +
>  #endif
> diff --git a/drivers/firmware/tegra/bpmp-tegra-sysfs.c b/drivers/firmware=
/tegra/bpmp-tegra-sysfs.c

The directory already says 'tegra', so the file can be just=20
'bpmp-sysfs.c'. That matches the existing 'bpmp-debugfs.c' as well.



