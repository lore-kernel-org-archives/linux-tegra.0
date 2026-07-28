Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C6F4302F8;
	Tue, 28 Jul 2026 12:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241195; cv=fail; b=Qfu+R7w59aAeB15FbdfE97fc6HVAVzjCHV1zC5SpzSH20p/Dq/ZZDjlU9XqtNm5uow1OI1iGxnDIGtF6BTvpxvkQxLSvA2oQi0QajnFYtfeJC28XYSc+N0RIt8sIpfE3Eo9BZxZMxGvFi9360DVKlGT3ZOzR9HsiDtWwrE8/4Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241195; c=relaxed/simple;
	bh=1lA6bXNhjoXa9LEbQ1V6ah68av/rfghGvAhqujK6q7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k76FCr1sVdk+KZxaCrqf8EmQL5ac5kE2zw0pG4vH98ElBJZzf/PKWooGb1DGG66lIVXkpViY9EOR7VvGVz7xU/ygxadPoXqHWZE0Qi5+WMO91IaobAE4k+SaRxAd2UQJ4pLyGlxbcOMKa8zhLCELpNiTcnHTKZsDjX2OwZgxd1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BwHcZCX4; arc=fail smtp.client-ip=52.101.62.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BwHcZCX4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tw9fo5yIsYIKVanLb6YhC40fMhKpKSbAEYIYnE9mNBY+BkMQprrU++8mbvndFyKYKZvfOHUaV2O4KVnEsbYqPahuoizxwJRq1hh8vbyHCeephmruwY8Y4j82tOPYNimU4qlCR5Ray8yj6806f8c3uLBmh6qOIjAw7P4tl37HzMQLw1okpIlVtC+QNIdsL0knM/hIgLSVnTkXUEjsKlWJ9f2ynpbIZbknyYm1pFPUJ+KAN8jUuhbL3JbSbYqShrQaLCVsLRZEr7kQ5kRpqqNaJjbQ9qm9dO7UqwRx/XwxTNzz7nh8Eovcm+UHtXgL0HN3V3hP3ynyALZZy2b28Kitxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ziXEmqVdBT6T9CMPYmfpGImacrDWlMTOuYEL9Es1hA=;
 b=BQqONNqYGdDgAQ6kVS1XLYQm5Du6EOGB/jDrgXxZjphH9Ez10+ECtgZXkhqKP11y5Eob9LDO88cwDIjm+3K34urOgmVB4OrxBf77POk2M51f48/gquOd3MYgj9iR9cukA4jCBwwTIFvxtCLgLoGpLJl9gQs22wU/mLRt5iHxfjt4FQHh9ncrZWI2cNyO/qx8PB6L9WUQOvsWH/dqKShAZopFC4vRDWl/scYO8zyT3HY3RsuDQNIsPwu9XsZnqpZL27dC5QFNQU5kegoS75iKm/qmh6Y441enifBslk3hbgJ7xOsVGbP9ZUeOYscSE2kUgBG2kePd25e1RUuImkmv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ziXEmqVdBT6T9CMPYmfpGImacrDWlMTOuYEL9Es1hA=;
 b=BwHcZCX4qtjh/lNiwTToAeTEK3YuciKvcyIFvAtYrYnAHmqBYkjeH1akJCn5vMGu4sTWVvcgNfYAJR0K0zWPYqt6jyIkPiEgCW8C4wuuD7Ldpx2N6WX112E++AkbTOU6K6gwSvh7BorLFNFZDCC2W4enfx475tDzVryuei/67RkA3IpR2d4odsHC/8Kz83Co0Tyd2ugPB+Yi2r/updLT7b2wT613cYwoUtCP4NzK991wY8Sb3yFzDlWlq2+DGkRH6QQus7FLk2MzBhcItdkxB3GuxlbAXCcCyMeaLYQjVcD0h3eA2tlr07bnbprhPhX7p/eFKiRH4MvuYgHxqLMoig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 12:19:49 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 12:19:48 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, webgeek1234@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>, Alex Frid <afrid@nvidia.com>
Subject: Re: [PATCH v2 0/2] soc/tegra: fuse: Support Tegra210B01 Speedos
Date: Tue, 28 Jul 2026 21:19:45 +0900
Message-ID: <DmzCZrobQoWdruuMTtwS8w@nvidia.com>
In-Reply-To: <20260727-t210b01-speedo-v2-0-4f287a3dab72@gmail.com>
References: <20260727-t210b01-speedo-v2-0-4f287a3dab72@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0337.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::15) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d968c4a-f5d5-4f86-16b1-08deeca28483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|376014|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	V5P/kn6bjEaqDS54pnZX8H03HN1rQSvY5+iO8bJdvOOUVb4jS0kVwnFbfjei8NXXGmubsWwEWT4Xlw4tQ5uwnKcldeU67vSzXHMAZJxCZul68Gci00JGOpuvU3ZZ6vPNM8BFEYY+w++aRChvg99CNEMLWZUlCujFuhPhxTsdz4K6SE0PgGlKy9ABjGbLBwQLn65Lg+L/Rh/CbcB2A4gNxHqvFKyIAHPw4RLN8Dp3x7wQntOUGky/+xIF5OMhoW8DFqfRTvlzmMHzRz+DoYbVjrGUCR86kIn/RrRx5qI/R+BZseT6COFNsfVwxGlaMVxTHUTkksL7x96dncfeB5AD8ZGfqDCtwIZXdxhXGTOWukQH1RETzNNjGtA71YmfPKhFoQt7jttnIqN9wQTfakHk+2mOxr2x8bOjOn2cIdtMTIjq6UgqNct3VIcZdO5BeHxSFz6O0HbMATOS0ybpLkNmiZ/6NIILEd/7zbCZg1WhkAUmxp6EVFyLiskPlc2a0JsAp0tETAdb/Pr9YJ1zKKA23V/QX/UPO36w6N6K6LOAmt6CFEUiwoftsv8bLdaz3fO5RzMPO6B1E26NfWZ7XZwzAVlbiYZaHU+ZMYTGLgzncj9GAjn/AX3PORGH3v7A0oxoH1Ol9DF+8sreUM7oMUSiC/9SM2jxQW2J/WNoFGT1yqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmsxejZYNGhCdDVUOGNUaGpMcllyQlNaaTNwNG5pRWl5c0kzYXUwMmYxTkhm?=
 =?utf-8?B?VlA5cjFsMklicEkyaE1HQmsvbFFrMHFEMHZCUEgyQSszUTNsQXRBc3hYZ1FY?=
 =?utf-8?B?ekRqd2R0NXpGZkhrOHpIUlAwaEJlQ2c0MWNkSDkyM210OEhNSzRRcHIxaGVQ?=
 =?utf-8?B?K3U2cVlnT1N0b1NwcEF4NHhCcGxqaS9mbExTVWgvYnc0TFJReEQxOGFua2tq?=
 =?utf-8?B?eXNWRmx3cHUxcFhwYS9ySXNNWWY2UHhMUWFNdllTU0xSUzFneFI5OGlBZHJ3?=
 =?utf-8?B?RWdFb3AvSlgzZlN2QndSd1JzV3lxUEZYS2lJZFR0UFBZR0RJeWlHZGFsUTZB?=
 =?utf-8?B?anZtU1NTeTAyYXR2UjFSUXRzdmlabHNXYkxEQ3lnMC8yZ2JKMkhjR0hndFJE?=
 =?utf-8?B?V2hScTBNUzJPemFSejMzRXFLV0ZaSTA1K1MxelJocyt1ZE42WDdzeWhwMlNr?=
 =?utf-8?B?RTFpeXFIQVEyWG1QVzVlTkV5d2htYVNxUHZ6Z0d5dzU4bzQyQ0NwRk1veU9T?=
 =?utf-8?B?b2VvemZsTDE4QjRjeW1lUzhOeVFBcXpKMnZwVnhxMzZUTU9DdDI0TGJnWWpX?=
 =?utf-8?B?WDRQRFg4VkNGKzhqUllUQnhiWVJuRmRRRFpNcXJIQmdQMStqMXczU0xGT1Ry?=
 =?utf-8?B?M2NWUXp1QmtET0pXSGIxMnNwVUR5TnRDby9pVm93elJDdDNRQVE1WU5mT1pU?=
 =?utf-8?B?czVJV1ZlKzhjMGdWUHlkV2F3QW1HTzM5dU56MUlFZXJTdU05Qkd4UGE3VktY?=
 =?utf-8?B?V3A4SWtIYUFtaUNYYTUrVmNGemZwdnVjVUhhTjhGaHlNTExJbENqWXowdXNL?=
 =?utf-8?B?S2xvRGZ4bzN5WEkzYVdmbmthKzFoamRuNEV3Q2lLNkdwUmMzRlZnRktBcUYy?=
 =?utf-8?B?UFJxSHg4SWNYUVAzWEloYnNBeTNxNWRRUzYrWk9xZ1ZXTlJ3UlBEcDQzZ1N4?=
 =?utf-8?B?M09lYzRtUWdkSkwvd0JTQVdtanM2NzVjZ3NwL0ZXQ3hmWG5VNnRBYzVra3l5?=
 =?utf-8?B?ZTVuYXlEYndPdFdQcnA2enlWeWJvUFlEZEw4a1dVeFlyeXlNSVZtNnY1SU9T?=
 =?utf-8?B?aFFMbjB2dmdWK0xXYmQvSXczTXNOWS91bDlyYUVqd3RYS1hlRmNWbFFwbWs2?=
 =?utf-8?B?UEpNS0RqTEJwY2lGdDhWY1ljekRMR2ErQzg2c3R2U0lEQWJQOEV3dUFESkM3?=
 =?utf-8?B?NUp0SzZ5Y2N6ZzEycm11bjY5cnJWQ3lMaEsycXFiT04vVjhPSHkvMTQ0Zndk?=
 =?utf-8?B?emd5bldsK0NsUVlvRlpsMEhUbm9NUzdwL0NNME5aSjJVM2hPRldaZjFuNGlx?=
 =?utf-8?B?MWc5NWVidWNCQ2N5WU5HdkhQdTJGRHM4d1VaMk05Y1RaUkxoRUtQelJaVWhH?=
 =?utf-8?B?ZFcrN1I5c3ZaK24vaWpKWlBTRS82RjFYbFFPQ1duclhMUndFZzhseEF4U0d3?=
 =?utf-8?B?QWZrdmt0ajRvdVVpeitWNFhVcGhKcGFtd01KMmY5NUpqRTMySUZtU0J6Vjgv?=
 =?utf-8?B?OUI4QytwbG03RVBIT0RVUTZLNWVRc3FuNG9oM08ySzFIcHhLWmdpcUdRTnYr?=
 =?utf-8?B?cFhDS29iWStYa3I1TStDeVM1TldSc25laGk1N29NZ2xqMnlDV2oyY2d3Tkgz?=
 =?utf-8?B?eVl5KzlTSFRJbG05WDNuMys5NjJzWlhvK2lpRTZoQjZSeVpFSTd0WUJNL2tK?=
 =?utf-8?B?SUtjaFljWUJwWU8yRFVTb1VaeWlCb0doSWs0Zi9mbjNOVnpjaURrTXVhQWpW?=
 =?utf-8?B?N1YwU09Jb1k1VVZCV3dKdk5xbks4T1BTYW1xcFBwaStKTDZyYno0M0ZMU3BQ?=
 =?utf-8?B?NUpBNTdBclJFdkV0VlJTNkk2MUVxMi8zS3NGd2h3YmFDNWFLaUVLTWozT3Nr?=
 =?utf-8?B?d25IS0VySlhScGRIUkJrNlFhYzNzUWl2amtrSDc3Q1dpSElQTXlaMlpJeEJN?=
 =?utf-8?B?WUJoNk1jSFlvUTFUYWIyVWFRSmdJanJQUEtsYnprWTViek9QdTBTS2I3RFBP?=
 =?utf-8?B?ZHRsSndwWURabW55V2ZBb1YvOVJLLzYwT0xUemtDVkZEUFhJY0ZUUysyMFlB?=
 =?utf-8?B?UXVKMXpOWUhIb1FPZlVwNkxXQ1lSY0xpcmQrWEF1Q1ByenVjdDFFTldEMDlH?=
 =?utf-8?B?dGdtNUtpQVBGRVFIVHpoaGlUWnIvRHNiSHNzZ01KSWEzZmJTdkJCTGpKaGYr?=
 =?utf-8?B?aXd6SkcyUk1jVW9ySDU2bUp6VndiSXRXRjRwUzAvRVM1VzBPQk5zSXJNU1J3?=
 =?utf-8?B?MGx3VVdpZG9NVEtXeVlyZEp4WEliU1VaRmZuY1VKTzJHYjBaSUZDUWc4Mlpr?=
 =?utf-8?B?MVpjUUVscnUxR0VWMG1jS01kcUtHNkc5NEo5K09WMzROZkQ2S1FzNlVnWWlY?=
 =?utf-8?Q?BjAEkyhLYElPZYfG2rnUL/sY2dduLFu3xgL2l6i4jGvwA?=
X-MS-Exchange-AntiSpam-MessageData-1: zfKG230F8yWwIA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d968c4a-f5d5-4f86-16b1-08deeca28483
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 12:19:48.7510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RLTYhXncTeyecetZY/zouFm69v4q6dojVjpJaSkyou3MzeYxQ5NCDkkhWgmgHIzLvH4T8D/k1jYQ2euqp9Now==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779

On Tuesday, July 28, 2026 10:57=E2=80=AFAM Aaron Kling via B4 Relay wrote:
> This series adds support for the b01 fuse revision, then adds speedo
> support for known Tegra210B01 sku's.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Update patch 1 commit messag to be more descriptive
> - Update patch 1 to set unknown revision in the major revision B code
>   path if minor revision is not 1.
> - Add based-on tags to patch 2
> - Link to v1: https://lore.kernel.org/r/20260717-t210b01-speedo-v1-0-f04a=
8bd4d997@gmail.com
>=20
> ---
> Aaron Kling (2):
>       soc/tegra: fuse: Support revision B01
>       soc/tegra: fuse: speedo-tegra210: Support revision B01
>=20
>  drivers/soc/tegra/fuse/fuse-tegra.c      |  1 +
>  drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++--
>  drivers/soc/tegra/fuse/tegra-apbmisc.c   | 51 +++++++++++++++++++-------=
------
>  include/soc/tegra/fuse.h                 |  1 +
>  4 files changed, 53 insertions(+), 22 deletions(-)
> ---
> base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
> change-id: 20260714-t210b01-speedo-07f8cd3b3aa3
>=20
> Best regards,
> --=20
> Aaron Kling <webgeek1234@gmail.com>
>=20
>=20
>=20

Series

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



