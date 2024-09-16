Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90346146588;
	Mon, 16 Sep 2024 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498249; cv=fail; b=PWDFBSGhug5KFXQyQMqwILysu+hep6tf5avE/horly+xucbu3S4cC1zarKW9UXwDR9i/eQocmhxpLsd9M+8FfnZgyBmO6S4IRYMejyKwu8IvToOR0NBd23ZwkIjw/aBypU2oSp82jz3NoRfKBohM+KrBCgEskv2xWHdxX28VF3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498249; c=relaxed/simple;
	bh=Ed7qtmv7fgqxkaJ6cY8DkYhyOgwwVo2HE8O9dLBFKTI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ti0IbTDTiP1H7jb9ZH0bAdP9r8Pz+EIW/7jt10FI3X+ZBAlPdwU/ZuPkCbwV6DOj/S22rbQ6GVvsvdkZWerCWgqXMUhKfYdZM16EvkJCQRsuHL1GhDclVdK6sKVkGKCqqW/CsD5hl+1Za4zMKwviNVfy10YC0zc0YH9VBC7GQZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cRGTJjn0; arc=fail smtp.client-ip=40.107.237.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cRGTJjn0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jC650d8OCYRCuqzochNWj7X+IEIPZ90YsqusWsEf01uf3mjvLd3EOw9QP96oA2Tq2+YtvLMx9GT9Pri/kRNg9ftAeZYi4H9ycxSYY4suAF98SKX0Itq2FC+gzE4J0xQ0BoZPrBy2M7eY+1WtU1ahAX0D4wlUi7IdpJfAqEhgDc+nvF6MOX4uan++dRDa8SPyxD9I5N/bhIhUKXbEBv2y+viOyxGqPkM8/045jLAMcp4HTYrTsHYxRPEOuWrWts/vgBl+I9WLdRC9h6q6/aWG2Ew+hIYRwlci8LnEeKKVN1OgeVVolmY4uAPoC8hVwpbKCmeNrLuFfqI896b1laQsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RAvqySEeeNhMowBuEGuIzDvYpQvBpzsn19NxL1+XEY=;
 b=iSWtmpeI4cziSEOCfCnWzuSiJTWb7ib7HR1qfrzMblgVC5nctunWjyWSbEbWRd3fjsK5XNf8Ths1nPNToZcf3iUawPcyXo+OQ59LBeaKU6qvdZy3XCwZFA/KPzNW02yOyCCeBwAhu0Yvv+krsi1Jp5l17xR5yrdElBP39Zk4zys4c6S/kr6NxVCCQNGz/9pGaSQ/Y04/CLxjB7phGHstlIi12ogNo2BGX4nN3FzE4D2z/uX98ctKS1oL2//2vrSePQLTLF9oMhNFxkSCY14BvetL/fpplfCcGYUXaM3VzmvnGvjMvck2UN00pdhBFL5riC3t4gJPk3YRTZ6DrHOAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RAvqySEeeNhMowBuEGuIzDvYpQvBpzsn19NxL1+XEY=;
 b=cRGTJjn0ao+cAEnXtEdJsw99JbIRXzm4LUcGWL7qWitMXfJpUxyUcYlbSD2BZPHPDPIFxswwnJItNiWwrV/9D03v7fCTZzGtOA8t2e4sg0ZsgulXj7RFTkcBFUbGs+nro6xeqZqFQV6xqeUxaoOA8OYZPN2EUTmZY2qBeUbULxj8VXo2VZfZKp6c2p50Pz7ca0yc4WggasYw3HPUcgQbOvHjCIjoXldjyKYBUO4cfsz/sIZ9bpbqyIbZM8D8RV1JWTwbLTL9ShT/1sM2ee53zL6gdHoVJZyHlVv9tD8UGXSxwN+90Ccd3AqnGZ9UTI0sLb6VsDHd7guOUpccuYsXLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 SA1PR12MB8968.namprd12.prod.outlook.com (2603:10b6:806:388::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 14:50:38 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 14:50:38 +0000
Message-ID: <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
Date: Mon, 16 Sep 2024 15:50:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Saravana Kannan <saravanak@google.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240910130019.35081-1-jonathanh@nvidia.com>
 <2024091152-impound-salt-c748@gregkh>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <2024091152-impound-salt-c748@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::21) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|SA1PR12MB8968:EE_
X-MS-Office365-Filtering-Correlation-Id: 54956553-b3ac-49f5-8033-08dcd65eede6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlhFRGk2VzA3RFJyTzhFcyt0MHQrM2lkR3lIRUpJcENlYnZuWGFkVEFORDV4?=
 =?utf-8?B?RFoxV3NzMG1BeWU4UzhHcGlyYXVxcmExbVJsSzBEWUx5cUFUa1F2Q0dJRm91?=
 =?utf-8?B?ZGhSdE1PVUhBQzA1dHh5b082bi9pUFlQRW44OWc5cVRHeXF4MDY0c09tbVFR?=
 =?utf-8?B?RU1WOWhGWXpxY21Ca1kxUG5ETGdPNDJLSnpYSXRzK08wWlBFU010NVFsYzBS?=
 =?utf-8?B?bGNrbG1tVWtPd2xta2gvZTEvaERSZGxvRXgyeUhpd2gyeTR4VUhVenU1TnlZ?=
 =?utf-8?B?bXVxYTFlOWlXMExIZjVZZmJuSEhVdjliMkVDc05SUDZ0VmtLWDFWeFMrUFNF?=
 =?utf-8?B?YWlFZVc5MG94Q29HQ2V6MW5LbUtTOS83ZU5wZ1pMNjNReVJ4L25pc25za2Vy?=
 =?utf-8?B?TGJhRGZXSEd6ckthL3hlYjBCWURtRm41bG9HOEYrd3llRFNnVG9KdWlkV2lt?=
 =?utf-8?B?ZEh6U25ET250di9tWWVHOE13R2VNWE1zcnByVUVBOEd3Qk5CRUFoRzQ0alVP?=
 =?utf-8?B?T1lUbVlzNVNrUXFZQ0IxK2pLbUVKQjRHRSsveFNyN1VIVlpuWkRxLzAxTDVG?=
 =?utf-8?B?a3lCWGcweG5xb2hST3dreVd6Q1pHVHF6U0hnWGtXMFBheFVQM3RpeHg3TmU1?=
 =?utf-8?B?emxvMTYwWDdpbFNJNWFOcWM4dUs3RnNyNk11QmlwNFlkSitKazAvcFlIMUIv?=
 =?utf-8?B?aVlDdG8yUXVqUGpzeU92NG9nSWhBdi9XMGV2a3FxSW1LaGU1OU45RklHb0lx?=
 =?utf-8?B?YnlzZGgrTHhxSDZuc3hnMWJVRysyRkl1WEpvSi9rVmNBSC9pcUdpWVc3Qkkr?=
 =?utf-8?B?eWsrcDYwUDBNYkVqZFROL3N3K3NCY0RLNCs3K0JJKy9BVE1BZjh0bldESEN5?=
 =?utf-8?B?OG1GVlVvbFBTSGJGSGJwWXJIVnVRUG83ZGFJcW94MTVHdFRRWldUZFdtaFFT?=
 =?utf-8?B?MFdrbU1PYzdaNlNtVTlkQ2tHTk41cUxTVmt6dkVjK0YxKzFOWUp2ODArVGVm?=
 =?utf-8?B?YnYvaktPTHlYRCt4SSs2V3NXQ2hicFF1Q29Gc2JtbmpMZmNmUE00L2Z6aXdH?=
 =?utf-8?B?NElGSGh2M1FmUFZTUHJDUU1qeHdoKzhSOEltNHRhcm52TkkyQ1ZVM0FFVE5Z?=
 =?utf-8?B?bFY0eFNRdW95WS80aGVoNmhhQ3RySzM4SXA0ZmpHMm42YVlHQ2pra254Z0c3?=
 =?utf-8?B?ZVdBbHB2anRPTXNoM2pLTzhQNnJKN1hDU1JMVW5kblU3QXE1UDEzcGEyTmpO?=
 =?utf-8?B?d3pETmY3WXNyT0Q4eDFGc09Ja1FTQWlYM3FISHNGZlhld2tXRmljZHpvU3VY?=
 =?utf-8?B?WTcxUzNkVWViYktTUEVneGtUcVhDdnRwK2xDQ21xWUpnNjl0UC9oVjM4STF4?=
 =?utf-8?B?MTcyVXd3cVkwQVBEWVJTRENKelRvZjMrQndVZ0tHQjd2WXJHbjNHdlp5TTV3?=
 =?utf-8?B?Y0dKWjR1WEJWRGcyNFNMQTlMUUVxUjBieWI1K0FYdEdpN1ZZNGJNK3pVNzR6?=
 =?utf-8?B?UnNNZ1Azb2FQVXNPbjBmUU9WZjBOYjEzVTJHTVo0K2RoYUlxaFM2bG0yaUNT?=
 =?utf-8?B?b0Y1bEZVL0luWDYrZTFiWmY2Rm5saHNlTXdFaWVvRk1rSVNENk05Z1JtS3FI?=
 =?utf-8?B?a1MzTnhhODRIcTN6VENxR2VVNjdqZHQ2MlM1TG8vUUFhNlBUMmxFaktTcVFH?=
 =?utf-8?B?cEtyNTY4QTRTMzFjZjdqTGIzSzB2alI2a2J5QlNVbUViMWY4VkN2enZPd3Jp?=
 =?utf-8?B?L3p6elVzMUJxTmJsUHRCVHVYdVZWU1BsNnNFUmpMVE1IVnNlcDRWcC9QOTBw?=
 =?utf-8?B?NXIwUmthTWR3ODV0M2ZXUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5447.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzdEWG91NXdVcFhZcThrOXBtcWVnTVpQM3BDTlBGRnBVOXBkMXJ5L1V0cEhE?=
 =?utf-8?B?bWdOb1czMEk2SU9CUXhGK0IyOTFaNDJhWDh3dURaTWRiUnZ1ckhHbFJ4WHZD?=
 =?utf-8?B?UkhtbVYvTkVGUE1GMmVBRktIQjZ5MkM2SFpycStiemNDbDJyWE9LcHFHSkF4?=
 =?utf-8?B?YzErSXFjOHhEbTZjYkFsdk5lOVJRTXd0cFU1Qk9xTGFzZkhlZ2JEcnJHMFRG?=
 =?utf-8?B?TVJvM1RmWWhkTW5zUHRzUVBpMVIybjBIdncwN0FtSFg3Z3gyRmF6alF6SnVa?=
 =?utf-8?B?ejBlR0VIcGhQd2psaGEybkd5T2laSjZveXVqSFFpNWVDbkozUm4remM4cG1G?=
 =?utf-8?B?b01zRnJyampkQVQyYUU5czVxeFpGS2g1YVpjdlNvM2xRcGl2RSt1bXRiTkJu?=
 =?utf-8?B?c1B0cTdHZ3VhMkxSN0dBdGRIdlBFM2lLSVlTeUk0K1VhdTVXUGt4U3pMRkhX?=
 =?utf-8?B?b01GRDRzQ09TanMrTEtLNUJJalpCb244cGpPVmI3RVN1bTZRcUFNNHpsVm9T?=
 =?utf-8?B?cXdVakk4TkloRXdUNU9FV1hOcFVTeGNRSXJFL2dwVjN2VW1QcnBOV1pqd1R2?=
 =?utf-8?B?SmpOMEJpTG5FbEg5UGoxK0M5VnFSWHR0OU14UFJHc01HWTM3STJXRmNZa0RC?=
 =?utf-8?B?WmJOZEE2SytGRDRjOVdiNXQySm1aODFGNWlOS2NqVXpocndZRVpLMkJJZmNH?=
 =?utf-8?B?bnNDM0w5OGt0aEZ5WFJudWRDejEzUlM2SEZzSm5WTlNhQkhiYy8xcm9YaSs3?=
 =?utf-8?B?K1pxYVhnU3YyU0x0RE9LcmkwTWlldzFRR04rTW9sU1ZYMXdFcTZ6NWUxR2lY?=
 =?utf-8?B?SmlJeG4xeG1XTmpPLzBQaDJYMUlyK2tjSXpzNEdXV3F4MkhQazRrWWFsMDc0?=
 =?utf-8?B?b1p3c1R5WmNQc0lsYURQK3BlaVJaODFmamtObXQ1L3lxTTNqQko3Qk5XVkg0?=
 =?utf-8?B?M21hbjNKREg1c0pLOUtLUEVQTHRtR1EvUDlOS3RlWXUzSlRnWkovT1BTOXg3?=
 =?utf-8?B?RVZIamdYZCtVSmVpeXFhVDhMUG9QejN5WDFyNWM5Sm9ZTkZaSy9Fa1VCaU4y?=
 =?utf-8?B?TmtDZ3dCS2tXYzZPK2FaMHBpQVNVQWoyUlRrY2s5cWNWQVVuZythNVMwUFM4?=
 =?utf-8?B?a1BqZG5zQmM2SWgzeFFoT3NBNzk2ZkNHVmVUVHRPS2lhbHUvN05FZFFFTjg5?=
 =?utf-8?B?WGo5NDVhM0t4K2drdTZ6T3NRR2NQNG5ZK2ZPZy9vUUExVjAwSXg1Ny8wYkwx?=
 =?utf-8?B?bEJFeERBY28wTElkZmRkNWQxVzQwK0J0d1RPOWh4bWpNd3NNWmdEdElaanNE?=
 =?utf-8?B?VjFvaU05M3ZRWnlYSm1zVEpXaCs2VmFSakdCTWt4Wk80Ym1MQjc3VFAxS0lI?=
 =?utf-8?B?VnlGeUhmeFg0d3NFRE80K3ZCWm5ESXFNSjdPSm1KZ3ZuSVcvQ0VYT3hkVlF0?=
 =?utf-8?B?ZFdaNjJFRTlGdit6RkFWOHpnMHZDZ1M3eG9BVk5jZk1OTWl5ZE9BNEt5OFlB?=
 =?utf-8?B?bU9uRVFaY1JOM2xKYzd6MklNYWcyOVk5UEtJUHRyMGs4WURCUjFIdEx1bDJs?=
 =?utf-8?B?Z3E2OTR3cE0zbVg0aG9NWmI5Zms0OG1IaHh3eDhuOVVvblA5eCsyMko3QmRt?=
 =?utf-8?B?Q3VmOXoyUU9LQXFRMW83cHA3d2JYY0JYV0pDK3BWZnNsbjIvclRUSUdRUVNt?=
 =?utf-8?B?ajkzRFVqWERuZjlHU1NibnR6UzFkVUlvUEhPTm9UdTFTejd3T1pkMld5bnU5?=
 =?utf-8?B?V2VSTlN2NDF5R1VQaFV1UnpCZm1hUTF1YmpsdU02Z2hhQWUyWWNvQWdlcTFZ?=
 =?utf-8?B?RkFSOUErK3czakJTMHlmZ1BUODczbjJuU2FGaGhrTmRYREt5L3IrVXdkSXhh?=
 =?utf-8?B?WFAyMldYOUtRYXFMZmZpYkR5bENNMjR5TkZoYmZXT242K00vN1dRdmM1dG1o?=
 =?utf-8?B?T0ZEZWNhMnI4eWwxaGc0NUErMEUwa1U2UGdZVHI5bnpjeE1obSt6WWJuNm9V?=
 =?utf-8?B?RmpxZlNsVVp5MjF3QU5oM2VLWGRBbzhLLytORG5laHdyMTlpaElEbk1ub2xY?=
 =?utf-8?B?K2dmbG9GR0hiSHN1UUpYQ3U2OEwyM1pWSGFkNE8rdmVmQzB6NUpXY2EzRllo?=
 =?utf-8?B?M2prRVhqZk5YSkg1VFNkTWlpZ2w5YXUrV3NrTEFGanNxK0IxaERPSGt3OUxE?=
 =?utf-8?Q?y2GFmij2f3x3gzCb+Qyi1LAGkQ9fcpn4bU4yHBmsEaCl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54956553-b3ac-49f5-8033-08dcd65eede6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 14:50:38.8276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6jssssF+0R8OVIz5oOxNXLNPvdvwj1OqO2Wqtj7VT5DXsBYhJq/GXmJ3Xo9R8vzAUcz5/VTNlFz+UGFO6D17Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8968


On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
> On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wrote:
>> The following error messages are observed on boot with the Tegra234
>> Jetson AGX Orin board ...
>>
>>   tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>     with 1-0008
>>   tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>     with 1-0008
>>   tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>>     with 1-0008
>>
>> In the above case, device_link_add() intentionally returns NULL because
>> these are SYNC_STATE_ONLY links and the device is already probed.
>> Therefore, the above messages are not actually errors. Fix this by
>> replicating the test from device_link_add() in the function
>> fw_devlink_create_devlink() and don't call device_link_add() if there
>> are no links to create.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> 
> What commit id does this fix?


Hard to say exactly. The above error message was first added with commit 
3fb16866b51d ("driver core: fw_devlink: Make cycle detection more 
robust") but at this time we did not have the support in place for 
Tegra234 USB. I am guessing we first started seeing this when I enabled 
support for the type-c controller in commit 16744314ee57 ("arm64: tegra: 
Populate USB Type-C Controller for Jetson AGX Orin"). I can confirm if 
that is helpful?

Jon

-- 
nvpublic
