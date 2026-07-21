Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC63FDBF7;
	Tue, 21 Jul 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619462; cv=fail; b=rfDtd+gtXl1IEf4PDjgQ8gvN/MNMdmMFyakPUX7TO60jFVQ/uISZwLOptN7sD70ai7T81WVsd6ikYPirwJuFpKa84IJYCyjWHIcS2BCZUrF/NkHqk4q6ZzSki/NQfe7nYLyCTfNpe4rBUW6Y13AXwioniF+RfGAX1ud49EL31/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619462; c=relaxed/simple;
	bh=z2/mc+vONapvfZ31JewbsHO+0UjlTb6O96CdyRmX+to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C/Z+nhDSS5YmTaPDPqOQ3dblJGrkDwRZ86v0YwVsjTft+yQO60F1vK9QJ2VkoJqaSR9BExCrSrnp4/O0r5GBufkncUf7XMGbsE90FeOWvqlxTQjtgyWqd6ByGO2Vzd9IIJK9+ISW83groSCUWUd8Z88gP30VlodYyJutU24oJVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sP1j7O1O; arc=fail smtp.client-ip=52.101.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sP1j7O1O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzXct4sLE6+7iS/9RdqOUPfqRbJ7C5H5q4sCGX3KGK+yL13U5/NCFitck1R8VN507gC7NCXq2lvrjBi8tWbCU0bf3fyf2Y94AZppvPtxb24HPJISmKW+SnxM/LHcQd0Rcfv/BVQCGyA3UsUaWRs9F47yT3zyNDufJS8o/ZgAmXmQT8myCWLeykaF/m7zf0o6xe7zKUEErhmRjzqwor4chqm0Wi2rilqgmFHMLWIxtTstIQ/VolvabWxnbeIHBVD2CIfdGa3Ton9l+eNOfnTpi9styaGLVZcqQL8TeuWbl6gLLzdFT4FEKxVcimG4YBFKiEy82PfT7nzqDRT39yZeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5YMIOAWZueIDwkYuMEq9V759NXLbpDeII/zi2d3Ef8=;
 b=fCoVCVye89bn2tlKg7ASPKarP57W9gZLb6nk/iSieUn/CSA6A3aPprvjahdvNc3Ncxb3HIiDdGERN/DS6y8pJga8MV3EztMsNMW1cxD4w0Xus6/Ej6L7BuJ19Q+hxCglWsOCPsAJ71qdTw0st5vpXqfP1Pq0KHgDqQGuvRTXBLdFApwKHk0D5FLrfLjPVBdkZ7lpcXz3FUKtVhRxQoGy/Q37aN7F1GzNKqAOqTbwCZRHAL5S7S/+30wnDmYhgHEO/pnLdbOhJad7ohD4cjGNKbKdFx+4SgDiKLRHQkh6GlzUF4YmIvqKQbW3r7+z/K4qM337ZCKwDrSVPmjIegOaAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5YMIOAWZueIDwkYuMEq9V759NXLbpDeII/zi2d3Ef8=;
 b=sP1j7O1OT6XHZZeN3LeYW9q8vBcixdbOHcDOmvgXVM7wK+WJlBv1hSxgZSBBuIqfrUqvFcI5NqaBCDzVoS7k2B1AuDx2OeOw6BLLhOAGxx1Hmi8DSAiUnBHgExByJM4Sg3jXdk3gejFTGCjzQfbFFfHKMsbahSJSxulBTR8sLE3m9fPu22/djX5XK+KNE1kAizaMHREmFUODWroFcHP4RUn8SOG0uwCQy0L4DufH8ASXi19H0rXQNkRQDlk1BQ2jhFhHPZweQNumF2GdTPkcE4IxtfJIlj2gr/SAv3BZuY7Ip7V4Ktvp1TMjdcfLwIOaQ1sNJ0cXns1YFPPS6AkFmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by MN6PR12MB8472.namprd12.prod.outlook.com (2603:10b6:208:46c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Tue, 21 Jul
 2026 07:37:37 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 07:37:37 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, webgeek1234@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH 1/2] soc/tegra: fuse: Support revision B01
Date: Tue, 21 Jul 2026 16:37:34 +0900
Message-ID: <NvaHgTOhRNaBSnS5yK1uig@nvidia.com>
In-Reply-To: <20260717-t210b01-speedo-v1-1-f04a8bd4d997@gmail.com>
References:
 <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
 <20260717-t210b01-speedo-v1-1-f04a8bd4d997@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0069.jpnprd01.prod.outlook.com
 (2603:1096:405:370::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|MN6PR12MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd99c7d-2e13-42c1-9f47-08dee6faf000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|11063799006|6133799003|5023799004|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VqErJzOkOU1Fvwp8uQmB+BsV/G/Um7vJUk0SLktPiupx15fG5v4AoABk72LqF9pFCmqE2cM5EmrBI3YNAV7BE4fe3rk1TQYZiRFfs+9D8Luo2UMcrXfCvyFQDqzpNBgYiWSuBtBbgOUjZniveYf+NNWre/hucl3fWLCy6BrgGAMVesWTQs32Bxyj1L+8/Ugzs11yA5dVgPVMBYfKVgkz2mqIFNQ2xmqR7N7PIgm7Q/ZN4gz3YkVSsRRL7aYb2M3l3cfd8QIlAP5Gs0GW3tl5HIwsdSCDH3AClLT6N1qsaq8/CklZkdb+zSsU8Tny7Hd/1aB+vlC9zSvJQsiwbhc0ekNFu9swWgL+1mcumIWGLOY6kX+/mzG79IYrachL1n0ulQK2GY1ZSDhLFzEL2NcWKKEDpMgNK9rJKbzuMoPAlhj8eqjbSXJTWAePdpvRDJI0qUHadWPl7hagTQ1uPODUG2LayJVX5wzZHxfoxwUfjE0A3N8Bh2h9GreRBQ2nLswdUk5iIsl+d79hTXPDiwrmJVBUdwzfFoCJtoRRJmo0MaXB5deKHSqfIxI7+GUK4C4dJiP7IBx8ZD3OWJbpicWcgRGPOGCboAfhB0R8iIkd6nJ3OsXQR5BMvaF4QT4FsH01plpmdn9fBjPPTAtlrJ9sOvQQItks4pCHPgWHe6/rEe4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(11063799006)(6133799003)(5023799004)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjhWQU1LTU5zWHdBR1NnZTQ3Z1R0VjAraTZMTHlza0tFL3F3bUR3b01lYlYw?=
 =?utf-8?B?bDF4QlB1dmhZWjl5R24zYnBMakRQRjAzNEpUYlVnMllCMWwrbnJFZnpSSEYr?=
 =?utf-8?B?NHIyRFJiWTh5TzhSeFgrTFJZb3JXYlFHd1BzL2ZiTmptWFFPQ0U2ZGNkVEM3?=
 =?utf-8?B?Y2w4eXYrWE51R3dJT1h5WjViYXFEOENIUyttVUQwdDhNVCtFNDdwK2YzeWhq?=
 =?utf-8?B?VXQ0L2RUYU03UkVtYnFqMkNnOVBUYU5taytPNDcydnVMNTdEc1BMSVdIaitZ?=
 =?utf-8?B?M0tGRnZBQ0JVUDJlSFlEVVNLRitJTnZHZzd2dHhKZVVWNU5rcGlzUjUwL3VU?=
 =?utf-8?B?TWZ6RDlTbWhtcERJRmplVFc2bWtJQXl5b28rVzdpSXNZZys3SEsrbk5lOTdt?=
 =?utf-8?B?TXZrV0FKZFMxZlRuRzBnMTIrZTR6TmNMNVRJb3lHNXhueXhOdFV2Y1pad1pk?=
 =?utf-8?B?Z0JqdEM1NTlpMGlPRDl5VzIwdnQ3anB3cnVCc0VhcjZjUW5KQWVYSm9TVDdz?=
 =?utf-8?B?QnJnSTJqMjNrcWhKb2trRHR3VGhob09kbHIrUytTOCtmN2pRZkQ0Zithbk5O?=
 =?utf-8?B?a1dLVmlZd0E5L1pNYTdpMjMvRzl3OHZUbUNQK0ZHclVRMXY0VitqV2ZvLytu?=
 =?utf-8?B?NnE1REJLbjZIYUg5TnRpRVNiTnp5TTBwQmJHWENualI5TkwzTld1Vjg4V1V5?=
 =?utf-8?B?Z3hGQVVlVDlhZjJNVCtRNDZFYitaQnZkTGNjNk1tSnNtT0tyQzExZkFQQWQz?=
 =?utf-8?B?eXpIRlhqbFdtaFdzZGs1c1NzV08ybk5xNXFQdXVZZGcvZDNpMlVTRjd1M3JV?=
 =?utf-8?B?UnVkMlU4bXBEUFhGU3oyNWZHSExkT3VqQU0zSkU5eWZyWGh1SDNXeVlRaXVp?=
 =?utf-8?B?TTdOZFpXaU91d3M5VE5wWEFqUzM2eE1MOW13YjhSSWcxU3c2QnNzVWZwRnA1?=
 =?utf-8?B?eFh0NkRyRW52cXZqYmpvZ2pWRFVxMXJXR3d5U3BEMHAxUXdCakZYRFdmS0hU?=
 =?utf-8?B?RUFsQmVYL0h2bEZGUERycTZid08xYjNhdjVkaFNOeTA4b2V3M2JOS29TbitD?=
 =?utf-8?B?NVdWUTdEWVkvVVp1S0ljekVQakw5K3d2RHJDR3pELzZha0FHVW0zdWprRmNq?=
 =?utf-8?B?RzA0MkFvcWRRN0RBTkpONjIvNGxHNzVBT0kxUkEyRWM3Z3lFbG9TZlFBNUxa?=
 =?utf-8?B?NkVTZHJsR29hbENvTDhzQWpDWlRLeFJoem9ZOGxxUjVBd0pDUTZGRHYzNnhV?=
 =?utf-8?B?WjNHZlBGeitZbGlucnBTeTZtKzVnRHA0OU5jRWh3ZTljeFNFdDYzdDdHeDUz?=
 =?utf-8?B?VHo2bVhMNmUxdHlWRU9TbWFZSy9uSy94WUM5am9BTjFyd2RnQmsxa0FsUDRE?=
 =?utf-8?B?bXlJOWJwNVFrZWhYblh3am0wYStaUVRyaVN6WG42TlgzeDViUSt5TTE1bTAy?=
 =?utf-8?B?cnVDNCsyRWZjMnZLYUNCTXdySkc1aGo4ZFBsVTgyR0FMTEFFcXJpSGlGOW1h?=
 =?utf-8?B?eTlHb0s5N0JUSFJGUGltSnYyekhxbjFzRHJhdHBreEhaQmVDMlZSUFB6MUtK?=
 =?utf-8?B?UDNVOVk3VkxXajdGRlNXS016UTUvQmV5Rlo1TEtMa3dtdjVlVlJCUlZXNVpG?=
 =?utf-8?B?YkNkZ0xXNlMyL010RHdRUUVBMkpCd2RuWFVzVkJrK0o2MjMvTFJ0UlVGZ29M?=
 =?utf-8?B?OUVuamdiSnB0RHBxdFYwRWQ2UU5GQUxjcU9hQU1XSmM0dy9id0cvWUw0NTZi?=
 =?utf-8?B?MEVrWFQ0Vjl5bjVaQzI1NUhjMEtwZFhVcnFhZmRkZWVxb2hzclRQV3BxN1VT?=
 =?utf-8?B?SFhsbmswcEE3Y3B6dTlINlNUUCtoQktvbzdkd2UvS3IrVTNXa3dGbno5WlVZ?=
 =?utf-8?B?bU9IODZpdGJBaW5naUt6ODh6cUNFOVN3SjFBNTF3VWZlQ3o2eWVjL041Vkds?=
 =?utf-8?B?SU43eVhudG82b2grczd0dmpvZitLejI0dzlHbTdvVE9ud2tERTBIL29ndkZP?=
 =?utf-8?B?d0N6OE5UVzFvNHAxbjgyb25lTFJIUUhiU2xBU0lzOHFOd2ordXpOdE1SeDEx?=
 =?utf-8?B?UjY1Vm8xMXltOEdEMGJVWi9NdUd5RWp4UEhVZ2ZVWngxKzh4MVV1QjlBZzJl?=
 =?utf-8?B?OVhZUWZlS2hFNk14SWtkUlN4NlFWYTFMSGRoUTd6cG5KMlNOckRXc1pvZnBp?=
 =?utf-8?B?MUZGVERTVnFkQzBsdVVBOTMzdFBqS1FlRjNkcUxtZ1JTM3g2MDlBMzFmMjZL?=
 =?utf-8?B?M1k1ZVk5M201VGptYzVuOTFvc1IvTTJGU0FYZ0oyYzNodU9zK2tLSXpEVDZv?=
 =?utf-8?B?SWhzblZ3dDcvdTQyeU0rNjhGTFhUQUd4SVl3Z1NPajI5LzlzQmpjaUJoM0Rp?=
 =?utf-8?Q?G1MtWznFTSM9RU61u8zLfX94es+rw6CVfX5xSl4+y7fZq?=
X-MS-Exchange-AntiSpam-MessageData-1: D8ME/Kc/PKUpug==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd99c7d-2e13-42c1-9f47-08dee6faf000
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:37:37.8059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7JBKZoHYRkPlejdqLh5/s67BqkFfxRbyZz8y8P2MZ0HEZlYFk/dhF0IGHArR8fgmpPLjkGmoMFVpHgasl+UhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8472

On Saturday, July 18, 2026 8:19=E2=80=AFAM Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> This is used by Tegra210B01

Please describe the change in full in the commit message, don't continue=20
the paragraph from the subject.

>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c    |  1 +
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 45 +++++++++++++++++++---------=
------
>  include/soc/tegra/fuse.h               |  1 +
>  3 files changed, 27 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse=
/fuse-tegra.c
> index 78b054d43a422..a37642dc92c61 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -34,6 +34,7 @@ static const char *tegra_revision_name[TEGRA_REVISION_M=
AX] =3D {
>  	[TEGRA_REVISION_A03]     =3D "A03",
>  	[TEGRA_REVISION_A03p]    =3D "A03 prime",
>  	[TEGRA_REVISION_A04]     =3D "A04",
> +	[TEGRA_REVISION_B01]     =3D "B01",
>  };
> =20
>  static const char *tegra_platform_name[TEGRA_PLATFORM_MAX] =3D {
> diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/f=
use/tegra-apbmisc.c
> index 6af69ccaa295c..8df3bcd148ba7 100644
> --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> @@ -167,30 +167,35 @@ static const struct of_device_id apbmisc_match[] __=
initconst =3D {
> =20
>  void __init tegra_init_revision(void)
>  {
> -	u8 chip_id, minor_rev;
> +	u8 chip_id, major_rev, minor_rev;
> =20
>  	chip_id =3D tegra_get_chip_id();
> +	major_rev =3D tegra_get_major_rev();
>  	minor_rev =3D tegra_get_minor_rev();
> =20
> -	switch (minor_rev) {
> -	case 1:
> -		tegra_sku_info.revision =3D TEGRA_REVISION_A01;
> -		break;
> -	case 2:
> -		tegra_sku_info.revision =3D TEGRA_REVISION_A02;
> -		break;
> -	case 3:
> -		if (chip_id =3D=3D TEGRA20 && (tegra_fuse_read_spare(18) ||
> -					   tegra_fuse_read_spare(19)))
> -			tegra_sku_info.revision =3D TEGRA_REVISION_A03p;
> -		else
> -			tegra_sku_info.revision =3D TEGRA_REVISION_A03;
> -		break;
> -	case 4:
> -		tegra_sku_info.revision =3D TEGRA_REVISION_A04;
> -		break;
> -	default:
> -		tegra_sku_info.revision =3D TEGRA_REVISION_UNKNOWN;
> +	if (major_rev > 1) {
> +		tegra_sku_info.revision =3D TEGRA_REVISION_B01;

To match the A revisions, I think better to check minor_rev as well and=20
set to UNKNOWN if it's not as expected.

Thank you!
Mikko

> +	} else {
> +		switch (minor_rev) {
> +		case 1:
> +			tegra_sku_info.revision =3D TEGRA_REVISION_A01;
> +			break;
> +		case 2:
> +			tegra_sku_info.revision =3D TEGRA_REVISION_A02;
> +			break;
> +		case 3:
> +			if (chip_id =3D=3D TEGRA20 && (tegra_fuse_read_spare(18) ||
> +						   tegra_fuse_read_spare(19)))
> +				tegra_sku_info.revision =3D TEGRA_REVISION_A03p;
> +			else
> +				tegra_sku_info.revision =3D TEGRA_REVISION_A03;
> +			break;
> +		case 4:
> +			tegra_sku_info.revision =3D TEGRA_REVISION_A04;
> +			break;
> +		default:
> +			tegra_sku_info.revision =3D TEGRA_REVISION_UNKNOWN;
> +		}
>  	}
> =20
>  	tegra_sku_info.sku_id =3D tegra_fuse_read_early(FUSE_SKU_INFO);
> diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
> index 8f421b9f7585c..30db79f7f17fd 100644
> --- a/include/soc/tegra/fuse.h
> +++ b/include/soc/tegra/fuse.h
> @@ -33,6 +33,7 @@ enum tegra_revision {
>  	TEGRA_REVISION_A03,
>  	TEGRA_REVISION_A03p,
>  	TEGRA_REVISION_A04,
> +	TEGRA_REVISION_B01,
>  	TEGRA_REVISION_MAX,
>  };
> =20
>=20
> --=20
> 2.54.0
>=20
>=20
>=20




