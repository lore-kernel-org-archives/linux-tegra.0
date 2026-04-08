Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A883D171B;
	Wed,  8 Apr 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657317; cv=fail; b=NDhL14VkYJR1wMovO7NZrva40an7ebMrQJTQRP0EGKg0ctmt/DOBJOua4kdNBpdnqdBBQWcRu/0pYUHaoxDkr32+wPpJNN4qaFtxrP8RaYbX0IU/vJn+a4osC5FiUaMeRpPE6PWkhyt9RiDWmVrPiMLeIIf4RVX0vH4R3ADARmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657317; c=relaxed/simple;
	bh=49aiw3v80l6WyZL/DQHUolefx+4KnepQsjetQ6htcpw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jUGwFzZTKw80z4b8GAJJTFGKlRc/itoWe9fYZvv+FJvHHrVOlcqWldmBVoZWl41u3rYIWbBrwSkneMxcrbRq/ir9gk7KsnkdBIHFuECrXZ5DHFnwCs2NmkC7ySJ2uKCMdTQINWJ/ZUkYSjFgo8ymvvtkOV2WpmGCc7Aa2iQnYPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nez0Ugm2; arc=fail smtp.client-ip=52.101.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nez0Ugm2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XG0snVFftXilu9jfg+/sW5mgnrbQY1okVIjjr2KC421ZObAd0BPi+nWUnyNj/YTrprUTsxZ9bhehA4B8S/vWt09Ej39pFjpV9JB7WgNz+472iYqHon+ZvZe9FbtSNFTPKJjjiMRPcRqews0rthCDUqbRfWEu7e9ncHVpuq1lBVDwL7HTI5xq+A3+TG+uG0+LyTsaWifOmmJOqVe9JMgkdcIoxUnJmepksRmx9ZilarkKLnQ6QQAxfFokqjmY63nru1kEhtAlrvisdMWAf6omvtGTGjRNzS3+t2Ru2/jyrVBmP22rl6U55I9qn3BS9RxAhdbnzbowmf1HmQfukdeK9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frd3buDo5GZY9CsQyNzjc9m4ia4Ih18f+W+WQ0q9erU=;
 b=CmoHIh0zhjwKTpZtTs8XsQiBeGd+x1ZLEepOQf1BhW3nucWl0u8xZlCnOYYHN+fEvRAdomkEvrugtu37bh5I7DNYO3SZS2Pcg1Tj9MV37jAM/78ac5CFJW+q9ItTGTu/6G1WNKgyYmXEfktMB9N9erkIQ4MHt97gBBJ4HMbniOg3bfYwNyGp01LYoLMB0NBnKVdXvlaTAEOcrmWX0+NzLieM4WX8EUtSLQUHcYLJPwxKuDHIgGy1HC6wQNb4OHVutd+Pzw36v/DzyoIbAQEZcOa+sZ4AL+xSkhZKzsQpF/56Y7Rgcwl/wYqwGjmhrp2D+r4mlO/HT39fQqHT7WfLyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frd3buDo5GZY9CsQyNzjc9m4ia4Ih18f+W+WQ0q9erU=;
 b=Nez0Ugm2WmUyEZLlfVxDkDhugYuNbSQlQgJ5kP3CxTFzjvZSrvyAoOfkisBcoQsXUUfxJiYL8EyWVJij7L3Pm1iFkzM6hOdztctNQj9DxepIA14IDW5xSjeJL+jpn/zFzE5GBwIj2aM9JrhnVyxTQd8LjRclNcEaQnuR4K0Baw5l4v8iO5eBaF1vqohwG++2CpevtFjOj5gedsKfNig7Ueg5HDwNwwIlXTAMGT8G/ZndtFW/e7N1XwVrQmNmEYQeu8cRCblt8H7AenGJv8cIiG4QV9/RalfreMXXLRaytY7EV2SmB9KDZHXLHNu9qs+BaQ69bETFbrzOTzBNanzCOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DSSPR12MB999212.namprd12.prod.outlook.com (2603:10b6:8:376::11)
 by IA0PR12MB7627.namprd12.prod.outlook.com (2603:10b6:208:437::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 14:08:28 +0000
Received: from DSSPR12MB999212.namprd12.prod.outlook.com
 ([fe80::5e39:8f96:935a:87ba]) by DSSPR12MB999212.namprd12.prod.outlook.com
 ([fe80::5e39:8f96:935a:87ba%3]) with mapi id 15.20.9769.015; Wed, 8 Apr 2026
 14:08:28 +0000
Message-ID: <e3bf5a0c-25dd-4920-bb00-7557989e043f@nvidia.com>
Date: Wed, 8 Apr 2026 19:38:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: tegra210_amx: simplify byte map get/put logic
To: Piyush Patle <piyushpatle228@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407170308.100238-1-piyushpatle228@gmail.com>
 <20260407170308.100238-3-piyushpatle228@gmail.com>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <20260407170308.100238-3-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::6) To DSSPR12MB999212.namprd12.prod.outlook.com
 (2603:10b6:8:376::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSSPR12MB999212:EE_|IA0PR12MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c78cff4-1ded-43ea-a7b7-08de95784e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aGnTtjGvewqX8KeQ1J6hw9AduLQtSVYus0Imt9qdZxqYCd/oXiLojE+RHlyuiRPdxOBiUEOzPxxVZdpGCH04mjnXA0erf/j1vOULEY6AcgeQgr5dW2xTkbGdfn2sqste0VluT1BvI5ctljJaKftqdlt/0DlXQIkfLXjiHRVvG6xe/6craO2O4nmR8985rhsmPWl2U4nBQObS/y8MXjau6PGlFMME8xGM819OBABNIP9F2M89p3cmkkPQyrKfj5m2E6GMvAZT1aQsoMx3GXVMLi613i9/ajNTQ76JyerrU/b/veuAsmyMFRgoDRDk10Uti8SEFT+bWqOpSBbTkSfdFMp3zTZYZFhN5jgZZEgFZx2lAKLfPYBXWEKF75UJbiKn5F7IY7vsgAXio0Q5Kmu4KRXBGGXa04BpATC7g8Vfeg3usRAO0T+gWnjDFnrk3GFMie4VelJuaPSKc5+wbo3VDLSKe3LSL7llLAtHgT2SxOshxWAk0I+jd0vUqN6O///j1zXzC69ykiALQ3OaZx1+T6a6H8+QQZ9q7PUUsYRVRIP8FDF0Nr5fX7F7VRKUfyefQVQzks+C57HB7bqTM76a+5XdY9oZ6evB4TJnQzJNveAdmzF5PS8XGAfoiRiyPDuAhQdRwZ436VNmBDhfI+NKgk0ddp6GF/vd2eUlCH8vEol1zZAS/7Bp7tsN74/1sMqrcbJhaDIDGu0W4S6krwF9Ul7ENqYxf+eehuQH/xgVxbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSSPR12MB999212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTg5eUJmMGJCRGtidTI2WWZSOFlBMWlDQlNpVHFUUkJPc0FMMkxTMnJJZjN0?=
 =?utf-8?B?SDhlSmVGM0gwOTU0NFByVjN0cFFZNjdxMlc3Y3I4VGoyTTlES1ljL1lpTi9S?=
 =?utf-8?B?K21LTzNYUjU5QnE1M1JSUDZmdS9yZHk2MFRQbytYSURRRXd3aU5OY0RIZVp6?=
 =?utf-8?B?UFhXdUFnSVREMktYTzFFclhIbFA0RjVoVE42bWU1UGZMWDdXZGZuTlByT09a?=
 =?utf-8?B?ekFnaVJsVlN1d0tabjR4eHVPenhDYndxN0dmVXRlMVBtaGZjVldpalZWUmpu?=
 =?utf-8?B?bFJNaVF2Y29XMkNWUDNHYWY1clRrVHBtS0Y2QTBOczlSL0oyUmJWZkk0djFx?=
 =?utf-8?B?OUpiVUMwVmVKQWhFaVlSeUJOTGtMZ1dnNUhiK09GL0lwb1prR1U3TzlBQlNx?=
 =?utf-8?B?aDB4YVJ0Z2R6UnlvdTZFMWhTTHJsdVJZM05peUtDdDVYZTFZOU5oem5PMG9i?=
 =?utf-8?B?SDFrRGVCVTQrcjJGTjY2ejZnTlZneWl1cFVxQUc1Sy9yb3J1cjg5R1ltanVF?=
 =?utf-8?B?N3R3TXFOUDF6bzE1QktIOStLT0x1MkQyYStFOUdCWkR1VDAra1paS1d5SURB?=
 =?utf-8?B?ZFlDR2pGc2M4MEhvSEZSTmgrMGVoOFphNEtvZWdOUEU2RXY5V05RNTdBb1dQ?=
 =?utf-8?B?S2JCWVlWOGp4ajNtNlRwaUU0OTk3TDAvN1VUdnpscXNGc2pSMXMrVnJoMEdq?=
 =?utf-8?B?clc0c1ErQnpCTGZHQ2EweEdBYk9TdDVYdUpGL2FVbk9id3U2TVQvSUtzSFRJ?=
 =?utf-8?B?NDZPWElCTWNsZ3RtMDBXVGxWbUVJcUtVcVpsLy9nMWFUdHN2YVVqZXdCeDkr?=
 =?utf-8?B?ZEl2VlVEMDF0MCt6V1lGOUxiN25jZ3cyWndjNnFxcWljekZsUXllbEdqQ0dX?=
 =?utf-8?B?SmxyT3E3Z01KcXJVbGxEV3o0MEFGalc2UzJYSEhXTFpKcXhEOVJhcjhBZjZq?=
 =?utf-8?B?eTFhbjZUdTYvTGYweXFMbWkxM0dmYUZVWXhDRm1INmtSL0loOG5YY2R5V0I0?=
 =?utf-8?B?WUNNWXdrOHJMMk1OTDFVVjd1bG94dkpUMkNaak5xT0EzZ1ZsYzZydDN1dUt6?=
 =?utf-8?B?YjdZSEFia1dGbUZKOEdUYk51QWlnSElOMHFmUDIyc3ZIdlBLK3d6cUdtMTNU?=
 =?utf-8?B?V0NCR3hvMXliVmR1QkNBcnVraktJRkt2R2ZSMmhPR0FqejllenVPZlJwSzB5?=
 =?utf-8?B?M2I5Rkc4YXFmdHpGU0dRc0dyRGh5cmJabEJWbzBvLy9WS3I2eHBXOFZlZzUx?=
 =?utf-8?B?QXhwNG1OUzQ3emhPbUFVZ096V0tTZWNkRVVwSWhyOUFvcCtER21VelNYck03?=
 =?utf-8?B?RWF0VnNDcytvSW92RFMzYnN6OEIwTURJSk1hZHRlTmJqZTVpZ3hLcnY5ZU9k?=
 =?utf-8?B?VUY2SVpJMmR0L1paQ1kxMDk5TXQzQXpoYkJhbHJCUW5pQlRFZ1lMbThmUDE1?=
 =?utf-8?B?b0JaMVhXZUlLNWhzNkF2N0x1aDJ4WW4vTmFWc2pqSGJSeVRvSFpUU0RRbGtn?=
 =?utf-8?B?bnNpRktGanhWNzVINy90ZFZoa09qbFdOOEdsaEFPZWREek55UEd5MG1JdzMr?=
 =?utf-8?B?QytINVB6NGhRSkx2aWJqaVZSWjgxamVrOU1UQVI0TW54aTVCSWwrNk9YcGQy?=
 =?utf-8?B?ZTZDVFJFRWx1Y0puQnFNQVNPWW1FZUNJQ0lRbUhBQWVFc2pGMzFEcHYwRU9m?=
 =?utf-8?B?b09pQ0ZNVzBZbG5mVjNBaGRNd3lQWGc2bHhpNzdIaU5oU05hd1h2eFllL0R5?=
 =?utf-8?B?OUdNQy9KTWpXUlNNblMxclhDZUREb2x1OC8yOWYzV0pPKzV5cCtsSS9NL2sr?=
 =?utf-8?B?a08yN1pPNEN2d2gvbFBQVVIvMEVBMzlCOVVnVkJhdUR6ZzFqcHZON2NUNDJE?=
 =?utf-8?B?d0tYdTdndldxNW53Si9jN0VRWEtITE1aSCtwOU42dWR2UUhVcWYzVFY4bEln?=
 =?utf-8?B?dGp3WHNzR2g2Vzh3MTc3MXNwd0c3Smx3M1psd3p2N21UcDlpUlR4RXkrMTJL?=
 =?utf-8?B?dEgxeXpVWWFTYktvWTdOcEdIRGphVTNXS2NyRzhZNlFXMUo5U0FmblZHL2pE?=
 =?utf-8?B?QUZDdENYUXYxQWZjdVJrYUxxVEdKNTJ0UFM4QWFwcVdUTm5PODJLRjN2UmdJ?=
 =?utf-8?B?K1pFanJnN2JOMmcvV09Jam14cEgrT0JWT3IzdDRNcVc2ZTU2Qmh6TDZOc0p1?=
 =?utf-8?B?UXlqdFNDc0NlaE5UOTFWK01QMXNSa3FPRCtpbXppYXdPbFRjWms3MFlmQ2lK?=
 =?utf-8?B?VkVNVlozdW5oZ01ZM2xFS0F3L285Sm5oVFlKeGluOG5oUDdFbWptSExwMElE?=
 =?utf-8?B?WDF5VTQ5UnF0eW9PUFA3VGk2MmRrSGk5eTJNcmpnWTkramFJam9Pdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c78cff4-1ded-43ea-a7b7-08de95784e9f
X-MS-Exchange-CrossTenant-AuthSource: DSSPR12MB999212.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:08:28.1576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWfkdlw+OSvjeBVCZJgPXK/vKQG3HNFnZo9GAvtCQJaJRhKlbVGOCpVYMlGngg/aa2vwgFXZWTbmQJQ6NkTnWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7627



On 07-04-2026 22:33, Piyush Patle wrote:
> External email: Use caution opening links or attachments
> 
> 
> The byte-map controls ("Byte Map N") already expose a value range of
> [0, 256] to userspace via SOC_SINGLE_EXT(), where 256 is the
> "disabled" sentinel. The driver stored this state as a byte-packed
> u32 map[] array plus a separate byte_mask[] bitmap tracking which
> slots were enabled, because 256 does not fit in a byte. As a result
> get_byte_map() had to consult byte_mask[] to decide whether to
> report the stored byte or 256, and put_byte_map() had to keep the
> two arrays in sync on every write.
> 
> Store each slot as a u16 holding the control value directly
> (0..255 enabled, 256 disabled). This is the native representation
> for what userspace already sees, so get_byte_map() becomes a direct
> return and put_byte_map() becomes a compare-and-store. The
> hardware-facing packed RAM word and the OUT_BYTE_EN mask are now
> derived on the fly inside tegra210_amx_write_map_ram() from the
> slot array, which is the only place that needs to know about the
> hardware layout. This also lets us drop the byte_mask field from
> struct tegra210_amx.
> 
> Slots are initialised to 256 in probe() so the default reported
> value stays "disabled", matching previous behaviour. Values written
> from userspace that fall outside [0, 255] are clamped to 256
> ("disabled") exactly as before -- no userspace-visible change.
> 
> As a side effect this also fixes a latent bug in the previous
> put_byte_map(): because it compared the enable mask rather than the
> stored byte, changing a slot from one enabled value to another
> enabled value (e.g. 42 -> 99) would early-return without persisting
> the new value.
> 
> Also fix a potential undefined behavior when constructing the packed
> RAM word by ensuring the shift operates on a u32 value.
> 
> Addresses TODO left in tegra210_amx_get_byte_map().
> 
> Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> ---
>   sound/soc/tegra/tegra210_amx.c | 77 ++++++++++++++++------------------
>   sound/soc/tegra/tegra210_amx.h |  5 ++-
>   2 files changed, 38 insertions(+), 44 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
> index bfda82505298..4dd158e6e974 100644
> --- a/sound/soc/tegra/tegra210_amx.c
> +++ b/sound/soc/tegra/tegra210_amx.c
> @@ -60,6 +60,7 @@ static const struct reg_default tegra264_amx_reg_defaults[] = {
> 
>   static void tegra210_amx_write_map_ram(struct tegra210_amx *amx)
>   {
> +       unsigned int byte_mask[TEGRA264_AMX_BYTE_MASK_COUNT] = { 0 };


byte_mask[] is sized to the chip-specific TEGRA264_AMX_BYTE_MASK_COUNT,
but the map array in probe() is already dynamically sized from
soc_data. Since soc_data->byte_mask_size is available here, kcalloc() 
would be consistent and avoid coupling to a specific SoC variant's constant.


>          int i;
> 
>          regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_CTRL + amx->soc_data->reg_offset,
> @@ -67,14 +68,28 @@ static void tegra210_amx_write_map_ram(struct tegra210_amx *amx)
>                       TEGRA210_AMX_CFG_RAM_CTRL_ADDR_INIT_EN |
>                       TEGRA210_AMX_CFG_RAM_CTRL_RW_WRITE);
> 
> -       for (i = 0; i < amx->soc_data->ram_depth; i++)
> +       for (i = 0; i < amx->soc_data->ram_depth; i++) {
> +               u32 word = 0;
> +               int b;
> +
> +               for (b = 0; b < 4; b++) {
> +                       unsigned int slot = i * 4 + b;
> +                       u16 val = amx->map[slot];
> +
> +                       if (val >= 256)
> +                               continue;
> +
> +                       word |= (u32)val << (b * 8);


The literal '4' (bytes per RAM word) and '8' (bits per byte) are magic
numbers scattered through the code here and in probe function. Please 
consider defining:
   #define TEGRA_AMX_SLOTS_PER_WORD    4
and using BITS_PER_BYTE from <linux/bits.h> for the shift.


> +                       byte_mask[slot / 32] |= 1U << (slot % 32);
> +               }
>                  regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_DATA + amx->soc_data->reg_offset,
> -                            amx->map[i]);
> +                            word);
> +       }
> 
>          for (i = 0; i < amx->soc_data->byte_mask_size; i++)
>                  regmap_write(amx->regmap,
>                               TEGRA210_AMX_OUT_BYTE_EN0 + (i * TEGRA210_AMX_AUDIOCIF_CH_STRIDE),
> -                            amx->byte_mask[i]);
> +                            byte_mask[i]);
>   }
> 
>   static int tegra210_amx_startup(struct snd_pcm_substream *substream,
> @@ -212,26 +227,8 @@ static int tegra210_amx_get_byte_map(struct snd_kcontrol *kcontrol,
>          struct soc_mixer_control *mc =
>                  (struct soc_mixer_control *)kcontrol->private_value;
>          struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
> -       unsigned char *bytes_map = (unsigned char *)amx->map;
> -       int reg = mc->reg;
> -       int enabled;
> 
> -       enabled = amx->byte_mask[reg / 32] & (1 << (reg % 32));
> -
> -       /*
> -        * TODO: Simplify this logic to just return from bytes_map[]
> -        *
> -        * Presently below is required since bytes_map[] is
> -        * tightly packed and cannot store the control value of 256.
> -        * Byte mask state is used to know if 256 needs to be returned.
> -        * Note that for control value of 256, the put() call stores 0
> -        * in the bytes_map[] and disables the corresponding bit in
> -        * byte_mask[].
> -        */
> -       if (enabled)
> -               ucontrol->value.integer.value[0] = bytes_map[reg];
> -       else
> -               ucontrol->value.integer.value[0] = 256;
> +       ucontrol->value.integer.value[0] = amx->map[mc->reg];
> 
>          return 0;
>   }
> @@ -243,22 +240,20 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
>                  (struct soc_mixer_control *)kcontrol->private_value;
>          struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
>          struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
> -       unsigned char *bytes_map = (unsigned char *)amx->map;
> -       int reg = mc->reg;
> -       int value = ucontrol->value.integer.value[0];
> -       unsigned int mask_val = amx->byte_mask[reg / 32];
> +       unsigned int value = ucontrol->value.integer.value[0];
> 
> -       if (value >= 0 && value <= 255)
> -               mask_val |= (1 << (reg % 32));
> -       else
> -               mask_val &= ~(1 << (reg % 32));
> +       /*
> +        * Match the previous behaviour: any value outside [0, 255] is
> +        * treated as the "disabled" sentinel (256). Negative values from
> +        * userspace fold in through the unsigned cast and are caught here.
> +        */
> +       if (value > 255)
> +               value = 256;
> 
> -       if (mask_val == amx->byte_mask[reg / 32])
> +       if (amx->map[mc->reg] == value)
>                  return 0;
> 
> -       /* Update byte map and slot */
> -       bytes_map[reg] = value % 256;
> -       amx->byte_mask[reg / 32] = mask_val;
> +       amx->map[mc->reg] = value;
> 
>          return 1;
>   }
> @@ -727,7 +722,7 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
>          struct device *dev = &pdev->dev;
>          struct tegra210_amx *amx;
>          void __iomem *regs;
> -       int err;
> +       int err, i;
> 
>          amx = devm_kzalloc(dev, sizeof(*amx), GFP_KERNEL);
>          if (!amx)
> @@ -750,16 +745,14 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
> 
>          regcache_cache_only(amx->regmap, true);
> 
> -       amx->map = devm_kzalloc(dev, amx->soc_data->ram_depth * sizeof(*amx->map),
> -                               GFP_KERNEL);
> +       amx->map = devm_kcalloc(dev, amx->soc_data->ram_depth * 4,
> +                               sizeof(*amx->map), GFP_KERNEL);
>          if (!amx->map)
>                  return -ENOMEM;
> 
> -       amx->byte_mask = devm_kzalloc(dev,
> -                                     amx->soc_data->byte_mask_size * sizeof(*amx->byte_mask),
> -                                     GFP_KERNEL);
> -       if (!amx->byte_mask)
> -               return -ENOMEM;
> +       /* Initialize all byte map slots as disabled (value 256). */
> +       for (i = 0; i < amx->soc_data->ram_depth * 4; i++)
> +               amx->map[i] = 256;
> 
>          tegra210_amx_dais[TEGRA_AMX_OUT_DAI_ID].capture.channels_max =
>                          amx->soc_data->max_ch;
> diff --git a/sound/soc/tegra/tegra210_amx.h b/sound/soc/tegra/tegra210_amx.h
> index 50a237b197ba..6df9ab0fe220 100644
> --- a/sound/soc/tegra/tegra210_amx.h
> +++ b/sound/soc/tegra/tegra210_amx.h
> @@ -8,6 +8,8 @@
>   #ifndef __TEGRA210_AMX_H__
>   #define __TEGRA210_AMX_H__
> 
> +#include <linux/types.h>
> +
>   /* Register offsets from TEGRA210_AMX*_BASE */
>   #define TEGRA210_AMX_RX_STATUS                 0x0c
>   #define TEGRA210_AMX_RX_INT_STATUS             0x10
> @@ -105,8 +107,7 @@ struct tegra210_amx_soc_data {
> 
>   struct tegra210_amx {
>          const struct tegra210_amx_soc_data *soc_data;
> -       unsigned int *map;
> -       unsigned int *byte_mask;
> +       u16 *map;
>          struct regmap *regmap;
>   };
> 
> --
> 2.34.1
> 


Same comments apply to the ADX patch (patch 1/2) as well.

Thanks,
Sheetal

