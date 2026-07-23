Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010065.outbound.protection.outlook.com [52.101.193.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545F8313E0D;
	Thu, 23 Jul 2026 05:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784783433; cv=fail; b=tiqtXhKXohT5e+r8dB40TO8Pn+z9tI/aWmzYeRlrvTRmgn3Vanmbgp5W4kvvR0u3mMHkzAbBEUM3Si9PYW+tPdp6tItoCvsF6FXgCc6/HjdWBvl33A74VMSsHMRu8Z3DYKQIBH48HXJ5ETHGEZAiOJP1TNCcjLrSxlBrA0jKxQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784783433; c=relaxed/simple;
	bh=ScPyT+aH3DobvJXVlpjDT4HeFXqFmTo2Y0bPzRZLysk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mrsdCN3avWdBsuJyfNM4t2HSU002+C2aSTRAYitPWVe7s8FWAdQlwxhRwzbW+8pHIF2R/m34rbEtPw6djKmD8gUl8uTqXdGHY3gwbI1VxdD57oQvzec82QIYjTwIiZbxZgYd+odgu8wNFIV/C71Oo7ObAbi0zTyUH1qO54fZlHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RucKV9Po; arc=fail smtp.client-ip=52.101.193.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RucKV9Po"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GW9D2sNTvem6x0Ic773x7CatLEkE2/oAKjfk5oVe3dra67NENXK0u0gN3G0eKD2hJE5ToKor2I6TgPoq+3/7vZCtZMlpk4jHkRQ1JLyCFwRQUNzqQ5pSsA0gtBC2mzk1t6ZX+YabBiPwwdkCRqkziIBlAl8vxQ2iZGQ8G0rixMmjb3ujlDrvn+2dobPWve8oHdFRX0hi0MussnPj6S4NVPzIGuy6oP0/MlniUYY9OeXOi82nmE4PvYNLK8h//9PoksmWaQlpTKV64TF+buw5DnqmFH3TQ6cmKJVe9UxkL3e0DUWDUVxy+I/gVghvhjAkmMotvVknTNv+JoneVEt7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2Qn96ofJ5HYaNZYsnH4mx29DUWcUuLUZZ0yJhEqR6U=;
 b=ElzNw7rS+Ny6ZGijgKuk3MvQqr2uBZ+VhqHmDXVIysuB6GMwilnWeZfZlQH82H55VptPDGCo9cdI6zL/uh1sOAXgqJLBZvOVM3kOi1+HiVeTifEXXckb7ed9sOKoGNC9uxsNhZRAuVbcW/VAYdjb6Coxq955z7IRRvzF4/tzsBIwTEyq80oiYTw6QMMqDk5iWycSfvB7xmYuf7cq0SDe/fGTZ4GrFl9u6rIAYiPr4P7NS/DD7naO/PwgGyN/0nw6Oc9FcbHKAALaJzSFjS46xPs66Z+UV8zSgR6JkHg/yFP1pH8fJetelT+E+6dOjJ7G0t/42AAaeyoqrGUDQBMQLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2Qn96ofJ5HYaNZYsnH4mx29DUWcUuLUZZ0yJhEqR6U=;
 b=RucKV9PonKpyyQ0Zq+TrBOcyAHxRYCkT2tbxdtLr3N/W49vIvta7Wllwig6+d6CaAHrdzs47vD/GGM6buH+Y5d9DLrc+UvMwDX6xBPJlh4hEi6ctKASKd67OGlR10CudKAJNZ8R4pFzNcOpdVNipmlYKalbgVhscf80GnuOtaAKF7+rsCpVMLuES7COqCuzIc/k5vDa/g5Cf+QXhxF2nSziKGagv1GkX+XbCgKZLRQSWkaHooYbslWrOjybtWkPcPcrqXgjBvqLLxAf8g7icF0k1qQJ7YyAN6BIvNAIPkt8ivG1Lh+wHcuCigzlt0I6EUkH5XlMXaf6QhypbOHLV9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB8827.namprd12.prod.outlook.com (2603:10b6:510:26b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 05:10:27 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 05:10:27 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@kernel.org, jonathanh@nvidia.com,
 Aniruddha Rao <anrao@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aniruddha Rao <anrao@nvidia.com>
Subject: Re: [PATCH v2 2/5] firmware: tegra: bpmp: Add ACPI support
Date: Thu, 23 Jul 2026 14:10:23 +0900
Message-ID: <yp4_Hg6NTM6XvmUccLSv1w@nvidia.com>
In-Reply-To: <20260722110544.193551-3-anrao@nvidia.com>
References:
 <20260722110544.193551-1-anrao@nvidia.com>
 <20260722110544.193551-3-anrao@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: OS7PR01CA0233.jpnprd01.prod.outlook.com
 (2603:1096:604:25d::11) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bb2a98-43d7-4380-0cf9-08dee878b53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10070799003|3023799007|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	khhXB6vm/TCUTh1XuaGRaBe2DlcwuQCJ2a96UJUUunOMf6QIOXAccjdS/C44c9f11816o6LZFwvZzjk4DDSe5Mmaewmt2r2ceJ5Mn5f3QWCSqM1nODNpsx50hHBIwHZ097bLBDvyCSxTkiA0OJ35dzAwKSjepeZGcI0okRACcI1qc0A8VSD2GUxLsjMancgyZlQ74ObEX54PuFFmGUqqmtWvLSELhbqqN/4sDjAxzVGfNM0TGcfnkdEtH3i0CmeNFAUNyFuXD/gaj9KLQBcuIUnuuHjER4QwZgL/gz1SbspC9H0qhi9lkFHMU2O5t8Kmfm0uriC8vHP+n/t3DdQ9dYgNR0CUPzP+bNyFpCu5vObpA4Zqwm/45/REuK0uHz+SBNZs5O72wQtRZppJR40pHzqVcbKwELJddqseAocxWsrnFlaCSKvyg3CJX3LrMayPXjN1pPYWCvTVXo/VXB2T89oWE7n6dik1wGkvsfO5ff2PIR0HJM9CY7QohBonQknIZMWMwljjorrxHlCbbpUJyAuYPfodlJqW5AayjrIAzRQIYd0VfFHrEhKl+ZMu3pTP0dQsEz3qyWklflolY4vcJmdPCGNLFIG7pt92omneiyukDC6V2NUMlsK7JMLRfIC1RrMY7PPeyRcA93oUdC++IAw7Svul/jQcwHYRWi49nIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10070799003)(3023799007)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWRZeEIvYjZpL2VhZ3NVbTk4WTlLY1NYUjljRHdLT3lLVklDNVZFUTVVSGVn?=
 =?utf-8?B?aGhqeWt6TnM2OUlBMGJNVnZWNGFKTHl2aVBVTGFCdGRCY3RPSlM1Y0U3Tm03?=
 =?utf-8?B?UUtxcGJoZk5qWE5hKzFXVDUyU2xKNml6QjM3Nmd1Vm85Q3BDSDVOeGRLVWVP?=
 =?utf-8?B?a2dtL1FwQVBuTFBSUm5ZSlBHcXFMYW1wMnB2MEtCS2l2eTJoalExaFhGeCtO?=
 =?utf-8?B?dkJ1cXhjRXJSSkNjdUtua2pPK3djNFE1M3d0WXJuekE3eExQYnM2YXE3NWFw?=
 =?utf-8?B?blU5UjZCSkovZEFvNDZwYWsvMjhhQVNYaGdLSmhkbjlhU2JGbzBGaFpRcTcr?=
 =?utf-8?B?cnR1MCtVcXhUcFVhSTcxTklOK2tIQzRsVnFzS3cvL3VEUUU4MTFoa2hhckNV?=
 =?utf-8?B?b1lwNDVTM053bzlCSk5Gd1ljdCt0Z1VXMkttVFR0NTJnOUJ4bzhBZnlhcDlM?=
 =?utf-8?B?RGpXdzVWajFFc2EzYTRuMCtNM2ZwQ05kZ2JNVFgrd25wRERhdjlwbS9DQ1h5?=
 =?utf-8?B?V2tRV1pud21qK0JsbjlwVWJVbnZ2REI1T0p5cUFuWHNHRUpHZ1JySml1VnFk?=
 =?utf-8?B?SUxWZk9JTFdNL3RibDNGVFFBTkdiRjR0MlczbVdYMm1GUkhGR1BnQ0w4NjJT?=
 =?utf-8?B?ZkZJa3VKeGlkdE9WajJscFF2UWNCbzJsYy95UmJCZzFZT00vdThZTzV2NXYr?=
 =?utf-8?B?a3VSRXpqNFUwN1pPUHE1czFIQ3l0eVNzRVhlUmdXRWpOQ3ZCV3ZXaVpiSUVE?=
 =?utf-8?B?RG5UZjlkV3NZU0ZvcERsd2NKWHRKcmxTUDY3RjFZalJLL0VyeGtnSndPUllh?=
 =?utf-8?B?QlJST2hLSm14TklZZmVKTGVqTVJQVEZpVnhQbzdCSmpkcGpMaDJkUSsyamxn?=
 =?utf-8?B?dXc2Z1J3Uk1TSTVRTjFsVWJCWCtOVjN5OWtiK0djaTE0MTZQd2lSTW5wUHQw?=
 =?utf-8?B?bGJmKzlGTXUxLzZNbHpGMVAyYTVaL1NCakNsY0oxazlySEdpWDZOMHdTQTgv?=
 =?utf-8?B?ZjhHRHU1NzRkakx3SXRmcHdWSkNDaHBqUFJoWS9VVjMzZ2gxMk1ETmNWdGN5?=
 =?utf-8?B?dzBjSmpuaHB6QVRId0V0eTZ1Z1lyVkYweVdTSWtvTHBUOWh4bGlYeVgxN0Fy?=
 =?utf-8?B?NmdGNXU5RTUxSy9DVExrSmgyMnUxRDFGZ1pseU5qZ0h6d1V3STd2bGdEbS96?=
 =?utf-8?B?RFFvQzRlVEx4L2h0bW9ReHoyRVAwQXN6amdXYUw5MmtiaVBSblI1Mll4OWpu?=
 =?utf-8?B?ekpFRmRpVjVNeGJiNlk2UFM5WWZValNBelk0a0twS3liYXk0VXRONG80KzJL?=
 =?utf-8?B?K29za3hDd0hZNFpHTlJaMVBQZ0F0WkFzNVR3cjRteXdqbytDWFMwb09rVm03?=
 =?utf-8?B?ekFBa3NoQjQ1TkJrQnJGRUNiSHV2SWZyUHZzVmlJY3Y2TUtjeU5nV1dOZStv?=
 =?utf-8?B?UTdmZi8vdEJRSU5zWU5lQTlJbThSQ0R6enBhMWFEZUU0SnQ3ajV2cVB2WTlK?=
 =?utf-8?B?aFIxamVFL1pPMTUvSmZ4MGFaWm1rMjNVcFY1NCtnVUtEWmlScXJneDFBb2Rt?=
 =?utf-8?B?Z20zbXlkUnU5dGpwUWdFSWpiNEdSVThHTlhSYzNuVXRnTXBnblpMTmg5eVVE?=
 =?utf-8?B?Ulc4OENVQzJ1VjRMR01mVFN2UDVIY2JEUUFJZmxpaVppNTNBeldTNnhkZzBR?=
 =?utf-8?B?a2hpT0tXVWFzUUE5MCtmUkRPRG5VYXVSQ3VON1hvRkVQOTVSUG5rRTJOWFIr?=
 =?utf-8?B?ZHI1ckZBTDRzQm13K3J5UmNOdGViOWZUM2ZFK2ZnNnVMYlBnRjU2eGJreXNV?=
 =?utf-8?B?cHRlaEJJeUYvVUNsRHpUQkkzUHlHdGFqdkVhTzB1UktZUWxXUDhSdU9GeCtB?=
 =?utf-8?B?QUZCOTJIUE5TN2VCekV2TE5YTmhlOHN4ZCtrb205cW9STmhXZjBtVUovSmhq?=
 =?utf-8?B?YjdWdkp6MmFOdzJVQUxnYm4vNi90MUE3bGtjVFcwbGpIVThoOHBmd1Fsb2M5?=
 =?utf-8?B?WlNOOHp5d0R3WlI5NzZaTUdtb2h3TzQ4SVhlTEU5ekxycXRmVGdXTExjMmRJ?=
 =?utf-8?B?YjZESitlTEh3VmtidXN1dzhVNndrOEZHbXVSNkhlVXBaRDRYemZlUmovRG41?=
 =?utf-8?B?Y2pYeVdldGxRL3JwN1lJcjlzZ0VKcHc3MURWOVBzaVVFc0dieHpueHJlbDlC?=
 =?utf-8?B?NFFCWjAwZzR1ck40eUFOWUwvYnpkczVNRlphVG9vMTRlTlRQNDAyRVA5eGRs?=
 =?utf-8?B?MWFtd0xNVmNUKzBrUkhoemxZT20rMEtxYzBLTE1UTVBQeWxQL2Y5S1gxalRD?=
 =?utf-8?B?d3EyaThESHdsaFBEa29kK3lqR0Z5K3NTRnVPOC9XTmF1TTFhZmROSHZvUzBR?=
 =?utf-8?Q?tgosuZISVPjxiAhxvsx4nDIsb0oMV69rEGiqY2lbFH0Yh?=
X-MS-Exchange-AntiSpam-MessageData-1: 7kVJkZpMs5qxjQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bb2a98-43d7-4380-0cf9-08dee878b53f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 05:10:26.9158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CM3HxMBP9E3L7h5icygefEsX8naBnBW1c4Oceb/vNCH2I4l5yOvEqg6weL+l9fF3lPL048hur3K1kCuDsSdifQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8827

On Wednesday, July 22, 2026 8:05=E2=80=AFPM Aniruddha Rao wrote:
> Add required changes in the Tegra BPMP driver to make it compatible with
> ACPI based platforms.
>=20
> On ACPI systems, IPC is handled through the AML method instead of
> the core kernel framework using mailboxes and IVC.
>=20
> Bypass clock, reset and powergate init calls as these are not
> controlled by the Linux drivers on ACPI based systems.
>=20
> Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
> ---
> Changes since v1:
> - Use acpi_extract_package() and a common cleanup path for BMRQ replies.
> - Treat short BMRQ responses as errors.
> - Rename the mailbox transport helper to __tegra_bpmp_transfer().
> - Avoid a dummy ACPI ops table and call SoC ops only when present.
> - Keep OF resource setup guarded by the OF node in probe.
>=20
>  drivers/firmware/tegra/bpmp.c | 221 ++++++++++++++++++++++++++++------
>  1 file changed, 182 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.=
c
> index 0eb99b1c5068..2dcb74a45b59 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/clk/tegra.h>
>  #include <linux/genalloc.h>
>  #include <linux/mailbox_client.h>
> @@ -11,8 +12,10 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> +#include <linux/property.h>
>  #include <linux/semaphore.h>
>  #include <linux/sched/clock.h>
> +#include <linux/slab.h>
> =20
>  #include <soc/tegra/bpmp.h>
>  #include <soc/tegra/bpmp-abi.h>
> @@ -23,6 +26,12 @@
>  #define MSG_ACK		BIT(0)
>  #define MSG_RING	BIT(1)
>  #define TAG_SZ		32
> +#define TEGRA_BPMP_ACPI_BMRQ_DATA_SZ	3960U
> +
> +struct tegra_bpmp_acpi_message {
> +	u64 status;
> +	u8 *data;
> +};
> =20
>  static inline const struct tegra_bpmp_ops *
>  channel_to_ops(struct tegra_bpmp_channel *channel)
> @@ -343,12 +352,99 @@ static ssize_t tegra_bpmp_channel_write(struct tegr=
a_bpmp_channel *channel,
> =20
>  static int __maybe_unused tegra_bpmp_resume(struct device *dev);
> =20
> +#ifdef CONFIG_ACPI
> +static int tegra_bpmp_transfer_acpi(struct tegra_bpmp *bpmp,
> +				    struct tegra_bpmp_message *msg)
> +{
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer response =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer format =3D { sizeof("NB"), "NB" };
> +	struct acpi_object_list param_list;
> +	union acpi_object params[2];
> +	struct tegra_bpmp_acpi_message *reply;
> +	acpi_status status;
> +	size_t data_len;
> +	int err =3D 0;
> +
> +	if (!tegra_bpmp_message_valid(msg))
> +		return -EINVAL;
> +
> +	params[0].type =3D ACPI_TYPE_INTEGER;
> +	params[0].integer.value =3D msg->mrq;
> +
> +	params[1].type =3D ACPI_TYPE_BUFFER;
> +	params[1].buffer.length =3D msg->tx.size;
> +	params[1].buffer.pointer =3D (u8 *)msg->tx.data;
> +
> +	param_list.count =3D 2;
> +	param_list.pointer =3D params;
> +
> +	status =3D acpi_evaluate_object(ACPI_HANDLE(bpmp->dev), "BMRQ",
> +				      &param_list, &output);
> +	if (ACPI_FAILURE(status)) {
> +		acpi_evaluation_failure_warn(ACPI_HANDLE(bpmp->dev), "BMRQ",
> +					     status);
> +		return -ENODEV;
> +	}
> +
> +	status =3D acpi_extract_package(output.pointer, &format, &response);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(bpmp->dev, "BMRQ: invalid response package: %s\n",
> +			acpi_format_exception(status));
> +		err =3D -ENODATA;
> +		goto out;
> +	}
> +
> +	if (response.length < sizeof(*reply)) {
> +		dev_err(bpmp->dev, "BMRQ: response too short\n");
> +		err =3D -ENODATA;
> +		goto out;
> +	}
> +
> +	reply =3D response.pointer;
> +	data_len =3D response.length - sizeof(*reply);
> +	if (data_len > TEGRA_BPMP_ACPI_BMRQ_DATA_SZ) {
> +		dev_err(bpmp->dev, "BMRQ: reply buffer too large (%zu)\n",
> +			data_len);
> +		err =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	msg->rx.ret =3D (int)reply->status;
> +
> +	if (msg->rx.data && msg->rx.size) {
> +		if (data_len < msg->rx.size) {
> +			dev_err(bpmp->dev, "BMRQ: response data too short\n");
> +			err =3D -ENODATA;
> +			goto out;
> +		}
> +
> +		memcpy(msg->rx.data, reply->data, msg->rx.size);
> +	}
> +
> +out:
> +	kfree(response.pointer);
> +	kfree(output.pointer);
> +
> +	return err;
> +}
> +#else
> +static int tegra_bpmp_transfer_acpi(struct tegra_bpmp *bpmp,
> +				    struct tegra_bpmp_message *msg)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
>  			       struct tegra_bpmp_message *msg)
>  {
>  	struct tegra_bpmp_channel *channel;
>  	int err;
> =20
> +	if (WARN_ON(ACPI_HANDLE(bpmp->dev)))
> +		return -EOPNOTSUPP;
> +
>  	if (WARN_ON(!irqs_disabled()))
>  		return -EPERM;
> =20
> @@ -389,16 +485,13 @@ int tegra_bpmp_transfer_atomic(struct tegra_bpmp *b=
pmp,
>  }
>  EXPORT_SYMBOL_GPL(tegra_bpmp_transfer_atomic);
> =20
> -int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
> -			struct tegra_bpmp_message *msg)
> +static int __tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
> +				 struct tegra_bpmp_message *msg)
>  {
>  	struct tegra_bpmp_channel *channel;
>  	unsigned long timeout;
>  	int err;
> =20
> -	if (WARN_ON(irqs_disabled()))
> -		return -EPERM;
> -
>  	if (!tegra_bpmp_message_valid(msg))
>  		return -EINVAL;
> =20
> @@ -428,6 +521,18 @@ int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
>  	return tegra_bpmp_channel_read(channel, msg->rx.data, msg->rx.size,
>  				       &msg->rx.ret);
>  }
> +
> +int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
> +			struct tegra_bpmp_message *msg)
> +{
> +	if (WARN_ON(irqs_disabled()))
> +		return -EPERM;
> +
> +	if (ACPI_HANDLE(bpmp->dev))
> +		return tegra_bpmp_transfer_acpi(bpmp, msg);
> +
> +	return __tegra_bpmp_transfer(bpmp, msg);
> +}

Having separate __tegra_bpmp_transfer and tegra_bpmp_transfer seems=20
unnecessary to me. I think we can just have tegra_bpmp_transfer call=20
tegra_bpmp_transfer_acpi after the tegra_bpmp_message_valid check?

>  EXPORT_SYMBOL_GPL(tegra_bpmp_transfer);
> =20
>  static struct tegra_bpmp_mrq *tegra_bpmp_find_mrq(struct tegra_bpmp *bpm=
p,
> @@ -606,11 +711,17 @@ static int tegra_bpmp_ping(struct tegra_bpmp *bpmp)
>  	msg.rx.data =3D &response;
>  	msg.rx.size =3D sizeof(response);
> =20
> -	local_irq_save(flags);
>  	start =3D ktime_get();
> -	err =3D tegra_bpmp_transfer_atomic(bpmp, &msg);
> +
> +	if (ACPI_HANDLE(bpmp->dev)) {
> +		err =3D tegra_bpmp_transfer(bpmp, &msg);
> +	} else {
> +		local_irq_save(flags);
> +		err =3D tegra_bpmp_transfer_atomic(bpmp, &msg);
> +		local_irq_restore(flags);
> +	}
> +
>  	end =3D ktime_get();
> -	local_irq_restore(flags);
> =20
>  	if (!err)
>  		dev_dbg(bpmp->dev,
> @@ -632,6 +743,9 @@ static int tegra_bpmp_get_firmware_tag_old(struct teg=
ra_bpmp *bpmp, char *tag,
>  	void *virt;
>  	int err;
> =20
> +	if (ACPI_HANDLE(bpmp->dev))
> +		return -EOPNOTSUPP;
> +
>  	if (size !=3D TAG_SZ)
>  		return -EINVAL;
> =20
> @@ -783,23 +897,32 @@ static int tegra_bpmp_probe(struct platform_device =
*pdev)
>  	if (!bpmp)
>  		return -ENOMEM;
> =20
> -	bpmp->soc =3D of_device_get_match_data(&pdev->dev);
> -	bpmp->dev =3D &pdev->dev;
> +	bpmp->soc =3D device_get_match_data(&pdev->dev);
> +	if (!bpmp->soc)
> +		return -EINVAL;
> =20
> -	err =3D tegra_bpmp_init_channels(bpmp);
> -	if (err < 0)
> -		return err;
> +	bpmp->dev =3D &pdev->dev;
> =20
>  	platform_set_drvdata(pdev, bpmp);
> =20
> -	err =3D bpmp->soc->ops->init(bpmp);
> -	if (err < 0)
> -		return err;
> +	if (!ACPI_HANDLE(bpmp->dev)) {
> +		err =3D tegra_bpmp_init_channels(bpmp);
> +		if (err < 0)
> +			return err;
> +	}
> =20
> -	err =3D tegra_bpmp_request_mrq(bpmp, MRQ_PING,
> -				     tegra_bpmp_mrq_handle_ping, bpmp);
> -	if (err < 0)
> -		goto deinit;
> +	if (bpmp->soc->ops && bpmp->soc->ops->init) {
> +		err =3D bpmp->soc->ops->init(bpmp);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	if (!ACPI_HANDLE(bpmp->dev)) {
> +		err =3D tegra_bpmp_request_mrq(bpmp, MRQ_PING,
> +					     tegra_bpmp_mrq_handle_ping, bpmp);
> +		if (err < 0)
> +			goto deinit;
> +	}
> =20
>  	err =3D tegra_bpmp_ping(bpmp);
>  	if (err < 0) {
> @@ -815,26 +938,30 @@ static int tegra_bpmp_probe(struct platform_device =
*pdev)
> =20
>  	dev_info(&pdev->dev, "firmware: %.*s\n", (int)sizeof(tag), tag);
> =20
> -	err =3D of_platform_default_populate(pdev->dev.of_node, NULL, &pdev->de=
v);
> -	if (err < 0)
> -		goto free_mrq;
> -
> -	if (of_property_present(pdev->dev.of_node, "#clock-cells")) {
> -		err =3D tegra_bpmp_init_clocks(bpmp);
> +	if (pdev->dev.of_node) {
> +		err =3D of_platform_default_populate(pdev->dev.of_node, NULL,
> +						   &pdev->dev);
>  		if (err < 0)
>  			goto free_mrq;
> -	}
> =20
> -	if (of_property_present(pdev->dev.of_node, "#reset-cells")) {
> -		err =3D tegra_bpmp_init_resets(bpmp);
> -		if (err < 0)
> -			goto free_mrq;
> -	}
> +		if (of_property_present(pdev->dev.of_node, "#clock-cells")) {
> +			err =3D tegra_bpmp_init_clocks(bpmp);
> +			if (err < 0)
> +				goto free_mrq;
> +		}
> =20
> -	if (of_property_present(pdev->dev.of_node, "#power-domain-cells")) {
> -		err =3D tegra_bpmp_init_powergates(bpmp);
> -		if (err < 0)
> -			goto free_mrq;
> +		if (of_property_present(pdev->dev.of_node, "#reset-cells")) {
> +			err =3D tegra_bpmp_init_resets(bpmp);
> +			if (err < 0)
> +				goto free_mrq;
> +		}
> +
> +		if (of_property_present(pdev->dev.of_node,
> +					"#power-domain-cells")) {
> +			err =3D tegra_bpmp_init_powergates(bpmp);
> +			if (err < 0)
> +				goto free_mrq;
> +		}
>  	}
> =20
>  	err =3D tegra_bpmp_init_debugfs(bpmp);
> @@ -844,9 +971,10 @@ static int tegra_bpmp_probe(struct platform_device *=
pdev)
>  	return 0;
> =20
>  free_mrq:
> -	tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
> +	if (!ACPI_HANDLE(bpmp->dev))
> +		tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
>  deinit:
> -	if (bpmp->soc->ops->deinit)
> +	if (bpmp->soc->ops && bpmp->soc->ops->deinit)
>  		bpmp->soc->ops->deinit(bpmp);
> =20
>  	return err;
> @@ -867,7 +995,7 @@ static int __maybe_unused tegra_bpmp_resume(struct de=
vice *dev)
> =20
>  	bpmp->suspended =3D false;
> =20
> -	if (bpmp->soc->ops->resume)
> +	if (bpmp->soc->ops && bpmp->soc->ops->resume)
>  		return bpmp->soc->ops->resume(bpmp);
>  	else
>  		return 0;
> @@ -939,10 +1067,25 @@ static const struct of_device_id tegra_bpmp_match[=
] =3D {
>  	{ }
>  };
> =20
> +#ifdef CONFIG_ACPI
> +static const struct tegra_bpmp_soc tegra_bpmp_acpi_soc =3D { };
> +
> +static const struct acpi_device_id tegra_bpmp_acpi_match[] =3D {
> +	{
> +		.id =3D "NVDA3001",
> +		.driver_data =3D (kernel_ulong_t)&tegra_bpmp_acpi_soc,
> +	},
> +	{ }
> +};
> +#endif
> +
>  static struct platform_driver tegra_bpmp_driver =3D {
>  	.driver =3D {
>  		.name =3D "tegra-bpmp",
>  		.of_match_table =3D tegra_bpmp_match,
> +#ifdef CONFIG_ACPI
> +		.acpi_match_table =3D tegra_bpmp_acpi_match,
> +#endif
>  		.pm =3D &tegra_bpmp_pm_ops,
>  		.suppress_bind_attrs =3D true,
>  	},
> --=20
> 2.43.0
>=20



