Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9122339098E
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 04:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772512886; cv=fail; b=DTBM7E+8MMectnWyanqMy4sLbjpm5kzEm7PxQQOKhaB9owM9HBZC4kUD1pg8LKDmrpcAPfdBiQuM7QvNeF+mLnDO5GrDh/m1ni92WAt7U9Ud3annNHsVQ+I2x5dfRNj30aJ229lUX/P6aeAS5Gf+QDHjoSm7jqA8YDxpluQzHf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772512886; c=relaxed/simple;
	bh=zIr7XcaNQNIGylkkh4DqTLjefNwq5oaMGBWxFeZ1dLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hm1xBW6rzzyYNj+84hee20UCYXuUC43S1hyJWr5LP68k44pBACdFV9sqPgu0S1QYZp5qsrx1TK631kxDkXJtsjE5iU68Iv9tc/qdCmalPmNmGx7/KQ9soeBKdf3sl5xSlfJj5HzmfY7wtrRYCfWZg93hzc1JNGs4lDVj7XeujeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QE67BMyM; arc=fail smtp.client-ip=52.101.52.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QE67BMyM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pm2ccYKdZ05SwPHarT/0iIu2PwvHIp2iXi/UNIk1TVty7pJjbwsCmQZ67uOw34/unVuXEJr1mWM8wEjuljd0RSJfzCztM4E9Bo+1/niOE5z45+yRmOiB2Rhniuo55i2H9ut6yxOARpxQUuC//lsF2CBRAqCSYj+qi1jnvgRLNWjpqpGGccK+uzdbZ7JLV4/noNdynhT0sJSnW/kwjUZnQLncE6JAuiZjY7ggSz4Gt2jfWBsabQx8nxteRQ61qzMdFzJoZfU6fhvVtOWzV6uZkcgh8gdxq69ARVvdFSUW614TcHbd4jz5IjGIUCfzMXmBRy81zBTSsGmSkcxq9Qu2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/j9Skf7OorPEl4IqbwMTmjYr7P0SBhUq/6nqb1gM8c=;
 b=RrDguMIgRg8/FgflQ6m6JPW9MROdI/XAJbIbT5uc496r5vVjFF8Xm3mzyy1DrUEYa8WwShGjwKHuJmXmn71BshjoLQXYwVT8llN117SH6cT8za9+yTJTUdE78aS/MnyIqYDU1ATjgyUuPtZhwv/Bbh3N5gDW0hy9+KilFQCVeLDcPB6rNew0pov7MWgFWosoOwM8cz70pcsScvcOVPP3IRjwwgN6BTYm/mw6+Y1Ie2/dSwNfKPzpy3WVtDguzFhiBzQrvELT4zifE8zlbzc7dIe+x1xqsKsxcvdTixbBSqK2lOxSOKHUnkMNlocij2HHhA6q+dpPujdHxx2WRCK3vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/j9Skf7OorPEl4IqbwMTmjYr7P0SBhUq/6nqb1gM8c=;
 b=QE67BMyMkJnHySvRpjw9fxiEOFM1+WT8zegEFIsCSU0tAKzleqmwqtuoYLVk2Atg2EGt60zQSUzJYvBF9MI/K1FtphO5xwlwsDgow7F3iaw6DsDWcBSiojzqZJaxHySrwd12BbBwueQNcgrqoSlXeRfK0Amk3pARZRlsznlQU1u0LYg9LdpZT7Zelk7Q0+/+GWzkfjAgzgaaXw1Eg9NwgFHmpFiRj7J+FN2noy0Ge9v9MYiz946Ox169Y8VtaMKgqtn2J6C0b/ZsseuJbuMVblMIB1Nph1QNCx+5FB2oaLpQ2f1WlTDQVL2ZcsyrQhsbze9x/KmvnjcRqnJPNxS5HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 04:41:21 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 04:41:21 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH RESEND] drm/tegra: dp: fix kernel-doc warnings in dp.h
Date: Tue, 03 Mar 2026 13:41:17 +0900
Message-ID: <4932648.mvXUDI8C0e@senjougahara>
In-Reply-To: <20260219215535.469520-1-rdunlap@infradead.org>
References: <20260219215535.469520-1-rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::7) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA1PR12MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 252b1f38-79b9-4cca-56ce-08de78df1dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	xFMUYdDeEnmhMSsAc7Jg+DI8uU7PYfOlU7JzGBFJzHZjIzoTNiSpqh90lpCU84mmzhGYMVJN7MBqbx53DshfEQTgZzTkQZAgNbNqIjhwr1cRfGG5E7bfmbhFXKf7ESQ13UiSrovDtotUR58hr3F/w0462hrcktoPFtW4uzcpKKnGfYAcsB0/MGSWeJem6WbOQ+wpgDE/M+3xFeJPRv0sEgCnhcHnWA0HoRDGaBX9m1IbeMbDhKTLJxVaiplMKGaW/kp/8BlLlJnm+ajP52hAf84ClhJNrppleK9OmHXsZ3jkQTeadPRWtmBXqIC40JSY+qlHGFeSC/03Av1tc73uKsHCJqAar/1TVRFaYY6Pkyhe/Q+OD4wgNpoDdWSUB4LPAiS6Nyadh0uMG1eERU+JErx6D89VULc5DeJ9jlJ2jWZVwC7VtqTk2G4OLbzAjp9DpUkGVV8wv0QOUHzbSo+0/N5/zh3BDtgbrtJjkSJafU9kBD7TafFTPVMuxlv0yA+57aF+n8U2GtAAO5n/kCzGoiDMUOEmle8w8wN2nxIzduXKxoF/0PYUvNg5QN35ocg4vguKHskt568oTHDXAHzt36aoHO6FL1cUVvN+H4HlJAriWK5IQubPhDhX2BIjXPbqldMucT4tFKYTsCql/v3DaojHAeqQXkQdbowq9GWvake9RZTIQ7qzOngmBFXD98NXSiVmLevmeGoekg9oEK3tJWMipEz/VUzJJc967/FblYw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzBYakNHU2gwM21jaG1FT0Y3MVVCV05veUhMYk9RTkluTlYwbzVWZlhPWkZl?=
 =?utf-8?B?ZHJCakNNT1oxV1NDWEVyMlFhRmFDRWMwbFV6VHAvdVZnaFNIU2VXUjhOL21F?=
 =?utf-8?B?azlMWkVsNnlQSHpPMXlacWEycmlEbnltbUNqeGFYYUo2NnBWRTRQMmZlbXZY?=
 =?utf-8?B?Z08zejhjOVhEb0VtZWtIL3BLcWNwWUcxcWhmZGRSd2xQV1hQOEJ2YXI1U0xK?=
 =?utf-8?B?Z0VhUnNVOS9jWFljM2c0WkdzbmpHd29mNmxZR0hDU2hjb0VNakF2eldKNFNm?=
 =?utf-8?B?RGZlNmwvUkx2ejZxMXQvaCtPbjNyeG4yUHE5SzUzRkNHck9JcHdhUVc5MTVx?=
 =?utf-8?B?L1pubmxWV25nZFdYWWtqQnBzSDZDMUlrN1dsU3liMGZFWnVDdFp6QS9NWHVR?=
 =?utf-8?B?VkFUVFdLdmI2TWtNa0NzUzBBV2psakR4VDY1NzdyUzhFQ2xWc1VDSHpJQ0Q3?=
 =?utf-8?B?WC94RmxiRVdsaG1LblFuUUdRazVZV1JjSzNaS2tNVVBIdlg1YnU3M3l2b1g5?=
 =?utf-8?B?emJadjRIVXRzWFFZSThNcVh0L1NMNGNEd2pLbml6QXRMamtEMmNKdEd4bXVv?=
 =?utf-8?B?eFFsOUliaXBJaTE5ZWNncmpFQU9jdTdlU2lNSkltanUzNC80a3pVS0R4YXd0?=
 =?utf-8?B?Q0RIajhTNFFzRHVwSXMyRHpLL2ZYRlk2YlpjSEd2N3hNS0MrcUtSQnJDVUhs?=
 =?utf-8?B?eTV4clJuZ0RPRmNRS1lJV3RBb3FSMWwvM1lPSXl2Q1luanZUVzFueEtNam1I?=
 =?utf-8?B?ZllkWHYzUEJqSG1pZWJUU3hxQUh4bHl1Rk5GT0ZEZ1gxMGVlRi9tWlJTUWJq?=
 =?utf-8?B?M1ozYml4enlCd1ZDODdvZGN0WU8yREhQZ1M3aG9XT3NHcjZUM2dGU1Zhbzln?=
 =?utf-8?B?TFVGcUgyM0V4NFlDZFlrbWxERkM0WGR4R3hobmxDWTZSWDdQdTR5cEZaVFZ5?=
 =?utf-8?B?R1VUMEdjUjVEa0RVTGJHbmN4bWxEL3h0MWtRVGVMZ2hwWFN0L3ErZlk1L1k0?=
 =?utf-8?B?dGZ1akhDVEIrdURiTG9oQ2JRNGJlV3hNU0ZUd08xOGhQcXZrMXBZRFlIc0hD?=
 =?utf-8?B?V2NuMm80SHRBOWRsWlR1dU4rOFFyUFNUU0FuY29GWnU2WGt5V3RNVGRRRThk?=
 =?utf-8?B?bXVIN0Fpc25mRkVxL2JJWjV3MmpZbWxjZnhXQ0JXMjM4aXFZeU5TaktsZkJH?=
 =?utf-8?B?ODUrdk4vUitjRlYrTzY5bFZuMklDWUlrM2c4OEpzbDNDS1gyUDkxNmhidml6?=
 =?utf-8?B?bjVpZ0g1SjdqK1pzUjVrbTQwcWhMUnB6b0ZBMXdjdzJiOG1NV3B0Y2xUZTVk?=
 =?utf-8?B?amNyYkpnMzhiK2VMTWp4VU1SaGRYMkpZc3RkS0ZteTE0eVJmYnRrQmwra0dZ?=
 =?utf-8?B?blZ0N2N3VUNNNzZnWG4vSnEwQjJ3VE4yZUlNUWpwMnBaMmUyNFlBeWdnTVF4?=
 =?utf-8?B?bVB1VSt1K1V5bTZmU2EyMlRBZVB3TGwyaFh6REZXcVBXOVNsUzE4c0pLRG83?=
 =?utf-8?B?ZUh0eXNqbGtYM01qSlp4eWVHcTY4KzkxNDhjZzBwcG42NUJlYzY5NE8yWGk2?=
 =?utf-8?B?Z2F5a3lzSzdXd0lUNU9pZ3VQcU55dFBtNXdCRW1UT1Rjd2dVclI4OHRYQzdS?=
 =?utf-8?B?SVcwRkdFUjZ1K2JmSTVlSUhmVmIzS0VhQlZobnFsT1JiamxTaStZc2xkK09H?=
 =?utf-8?B?N0tGbnlEbTNaWlN0SXFVblk0bXhkbVhualU0WTEyMFpSVkFBU0ZvNjl3M0Jv?=
 =?utf-8?B?ZnpaS05pbWtBRXZNbkluNmZuTkU1akpLenZOOU1DKzJvU1RmbDhNU0RyT2tY?=
 =?utf-8?B?VGxoTkZtcVFEZExWTmFJNEhpTmEzWlVUcHNsY080eHFCbkhWQ0lVaDdVWXNI?=
 =?utf-8?B?ZGtTNGgzNkE0bGxCWDJxV1ArYVpGMjl2Vk0zbnpGa0dUY2I3OWhxWXZaTWxX?=
 =?utf-8?B?K2hORS9QbDNDNWZtL3FIb2Z6a0tSVEV1VXVHNndRL0ZMTmh0VFlCTjJ4YkRZ?=
 =?utf-8?B?TUhyK2NtRU5FTm9YL2lNcTRxUWFrbWpXbmUreUF1QzE1QUV4T0dZRGxqcWhI?=
 =?utf-8?B?WS9OZkozOS9IdW5vays0RE9LcHBqZkxGSFVTS3kxSHdaVUIyb0ZrTWdjSDZM?=
 =?utf-8?B?ODNpUjFSRUxzS0c2cHVYUGIwWnlwOW5ENk1YMVUxeWRFWnl3K0R3MlVBODBj?=
 =?utf-8?B?cmU4R3V0dkJsQS9CdVRvZ1FFaGZRUEttK2JCZkw4cytGaUl3azQ2UHVJZ3E5?=
 =?utf-8?B?QlhXZTZpdlQ4WHpHMUJlWHRWdWt5SmVrV1ovYjB4NXMwOFdxUVNzMEpFeTVL?=
 =?utf-8?B?UkpMd1hCdUpseUsvUnRwd0l6NE5rYnlaSzBHWnZvK3N3MnpjWTJVWGZRUisz?=
 =?utf-8?Q?WQrElZcE6CASQ21Mo284Wl4LoLp88GMgw+/if6ZxjwSAY?=
X-MS-Exchange-AntiSpam-MessageData-1: 7O9Ox3Qm0BFQQA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252b1f38-79b9-4cca-56ce-08de78df1dfe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 04:41:21.1411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jivKBWuz6XnTWe1L2/WKzBH10Z7uOs6Do97wxNpdrc7Zqba0lpUTyCW3zlZCsY21kkrXdPoZ14GDgBDvPR2A0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966

On Friday, February 20, 2026 6:55=E2=80=AFAM Randy Dunlap wrote:
> Use correct kernel-doc format and add missing nested struct entries to
> eliminate kernel-doc warnings:
>=20
> Warning: drivers/gpu/drm/tegra/dp.h:28 Incorrect use of kernel-doc
> format: * tps3_supported:
> Warning: drivers/gpu/drm/tegra/dp.h:54 struct member 'tps3_supported'
>  not described in 'drm_dp_link_caps'
> dp.h:73: warning: Function parameter or struct member 'apply_training'
> not described in 'drm_dp_link_ops'
> dp.h:73: warning: Function parameter or struct member 'configure'
>  not described in 'drm_dp_link_ops'
> dp.h:160: warning: Excess struct member 'cr' description in
> 'drm_dp_link'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  drivers/gpu/drm/tegra/dp.h |   12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> --- linux-next-20260218.orig/drivers/gpu/drm/tegra/dp.h
> +++ linux-next-20260218/drivers/gpu/drm/tegra/dp.h
> @@ -26,7 +26,7 @@ struct drm_dp_link_caps {
>  	bool enhanced_framing;
>=20
>  	/**
> -	 * tps3_supported:
> +	 * @tps3_supported:
>  	 *
>  	 * training pattern sequence 3 supported for equalization
>  	 */
> @@ -62,12 +62,12 @@ void drm_dp_link_caps_copy(struct drm_dp
>   */
>  struct drm_dp_link_ops {
>  	/**
> -	 * @apply_training:
> +	 * @apply_training: apply the link training
>  	 */
>  	int (*apply_training)(struct drm_dp_link *link);
>=20
>  	/**
> -	 * @configure:
> +	 * @configure: configure the DP link
>  	 */
>  	int (*configure)(struct drm_dp_link *link);
>  };
> @@ -113,6 +113,8 @@ struct drm_dp_link_train {
>   * @max_lanes: maximum number of lanes supported on the link
>   * @caps: capabilities supported on the link (see &drm_dp_link_caps)
>   * @aux_rd_interval: AUX read interval to use for training (in
> microseconds) + * @aux_rd_interval.cr: clock recovery read interval
> + * @aux_rd_interval.ce: channel equalization read interval
>   * @edp: eDP revision (0x11: eDP 1.1, 0x12: eDP 1.2, ...)
>   * @rate: currently configured link rate
>   * @lanes: currently configured number of lanes
> @@ -126,10 +128,6 @@ struct drm_dp_link {
>=20
>  	struct drm_dp_link_caps caps;
>=20
> -	/**
> -	 * @cr: clock recovery read interval
> -	 * @ce: channel equalization read interval
> -	 */
>  	struct {
>  		unsigned int cr;
>  		unsigned int ce;

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>




