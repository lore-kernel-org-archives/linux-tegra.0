Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C42E401;
	Wed, 25 Mar 2026 05:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774416436; cv=fail; b=mQCp/R5P48mJNgy6F3Vyco8j/9lwU7e0ur6/7sGRkMT7PgF4VDJgoQTqD6vKLEZMP6uMH+6pTODibD9e3DHwQQOR1vFnuapjjhoL9Dln+zZsj2D4lmvt7eQgdpzJvWEI2rD9SqF8K4kq4gePSnP3GS75LB/pPzkKjN94Pt5AENE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774416436; c=relaxed/simple;
	bh=b/iINwryUzmbuC9J+hM/Q56skYMU9Zgu9CaiqTHMBUc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HUttgcTjNnnWdPAdeVfMg4f4tDZiaxrfarGiXKJIdvecsSaeaPXToR6WaAr4mck1t2bBaAqNTxLki6IRQOOrl7TMNr+rVaJ3TT8Sg72WGbWfMkyoTs9eUBFHLUGmXbMAf7hg530zaJrzLtQ7jrpMn3ZsmUZeNSKUVJOn3oKEa/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gTPP59ME; arc=fail smtp.client-ip=52.101.43.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gTPP59ME"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgH7qwJpOpl7MwT6mxbtEg0cWJvN7hoqnnOoPTj7Jm9Clh/BNEy5RNWqOuCsGOpBuOABPoNWwe4pY6UtgVdbfUIqm6kR+/X5MmAApDenZx5Nu/KapFIB+B2/yZVp1SlvOyAcfGU0CJrR9mUkURxyzmHv+ZFkwBlqWP+K9+IZi8boS0h14SyaD5jVDtt+wEHGF2nabX/llk/y9BYbMDLOHqDCvgV+YvqwJ96UrNonhkCagEex5b/2g0By3uAmJPN9AnoNdohYr8dg1j2crN0sWNnKFEJ54vlekkbQXcFe3hLSouGf+jBPzAqfZkJD8Ws0FJ4DT2Ggl9bu+WTecWhHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OynH1jIOPhQTrZRjmp7BRmnndqit+lrbL4bnSzI3gyA=;
 b=qwQn+ka5ozAnNWaS6teJS9RnoV31DBwoi8ogZk9US2hcy53kFU/DafaE6nXuuHm3jfWliNdADzM9EsNAGh4MV2vwn+kzQAdONz/2jtYt47OiKXU7M0VIs6+frqNC/cpSCGj0BhmZGGh7nfHcgesdrZGSyqvtCGDgv4Xb66caT48aNT0WzIyiuRINjCTl5raaT1DGF2fB0SwSXy2HHClyWTq5SMQGLuUbtCC9uM5Ugmq91y4L1l7Qm8HyHh41DXXP2Vs8JR2hNbl+UnUBGGFE+qAnzbdvVUSp+09WP4RNFtCjWh4McZe25GJO58voRojfcDe5AbOUQh8MVieKW9+ShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OynH1jIOPhQTrZRjmp7BRmnndqit+lrbL4bnSzI3gyA=;
 b=gTPP59MExVEvy+dto1D/rtdIonXV2aKzmpFPDuLTkUWT5SpfmGLsxrxlms0bx/NFyzGmcOf6DsOIG4YVrPhc6Z4Z/UWa1VsdRK6c69t8WYU4tNLv/WZ17yzC2WiiGdbuSnE8slMHAsicbxtLibt9l0iXp7lseG7ZYQeXb/BpcxskHo2nHcznzkFiKPl0iJGme59EIVJp+LH3/38KSnwwpbUCvZxZ3NY44xVlHu0ZtNEIrJchUK2DTceF8iK6OldWeG/dabObEPe2vM9zf7sz7WryncbpE4RzaMXx3hsRcHnYMaAUV8Pe1ipb0nG/ov+I375G2AWGttMBb2Oo5iOYlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DSSPR12MB999212.namprd12.prod.outlook.com (2603:10b6:8:376::11)
 by IA0PR12MB8930.namprd12.prod.outlook.com (2603:10b6:208:481::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 05:27:11 +0000
Received: from DSSPR12MB999212.namprd12.prod.outlook.com
 ([fe80::5e39:8f96:935a:87ba]) by DSSPR12MB999212.namprd12.prod.outlook.com
 ([fe80::5e39:8f96:935a:87ba%3]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 05:27:11 +0000
Message-ID: <fbc85ccb-9c31-483e-94b3-4289d22fb4ff@nvidia.com>
Date: Wed, 25 Mar 2026 10:57:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: add ignore_zero_sysclk flag
To: Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 katsuhiro@katsuster.net, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
References: <20260317094910.1582011-1-sheetal@nvidia.com>
 <20260317094910.1582011-2-sheetal@nvidia.com>
 <ac95d92e-7304-49e7-9582-666eac386102@sirena.org.uk>
 <87cy12hxeu.wl-kuninori.morimoto.gx@renesas.com>
 <9246afe1-4ad2-4224-9b1a-cff07ecfa8d4@nvidia.com>
 <a95d9467-fe64-401a-a692-b33b67afc381@sirena.org.uk>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <a95d9467-fe64-401a-a692-b33b67afc381@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR02CA0103.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::44) To DSSPR12MB999212.namprd12.prod.outlook.com
 (2603:10b6:8:376::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSSPR12MB999212:EE_|IA0PR12MB8930:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5170e0-27d7-46b7-2b2d-08de8a2f2a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+SarJaPLK/73o0lsIVhxpuiy0kxvW3P3oJvUw5JyVk+yLNO1vJHafrN2rulDvZ8ErNhPASoPsSiu1sGa+R8G8xQcGtCz3Zn3ZLIXTmSgK1s1UfvTwSMy8z7UQJ2SzoRvWb22TNB7K1PFn3c9xTJ/2P9eQQiz3wWd+4kBihcqB4aEMtunvYQUKFyvS0GIBkqaHlfq9wXV09E8G8BUYyZRT+r/XCJtRB4FvN9ttIMVJ9ukKMc8uFuqw64e2S3+QnLUOHZ6eHgRyaKJl5Zfhkyf8z7+sBX0+ZnnyIEmbxlAYjkzCpMAy77cP75/cVAYheSFO4CLEFmwhRYP8oTVlCWt2fR1VyuwNEE5uQ2VhruhHg4XbVTUwiAbNs5SfyS8izLDu5h5OQ9FramxoqDob7iDRb2BtoehxaOcqRRAKssaHH1h/Mb0DXpvsQFLgDKRLxvLaeecZschruC0aCSaiRN3hUv/K5L3sRXSk0m1p+d62Kg+AGSy+FNlh1MBn3sYIeIAGjbnxte8CY/vGU0eFK+5RXbrVfytU170T7A69RSy9HiVDqb3oFjOaraiF0zpjFh7rqsySddgonQLE1eb47z6uJYfmKE2BQS54HCuJwcp1sZ8cdvjRTRc+YcmtASir08t5rcOK94+65pDWZ7RLellzEyhZ6ZuzR+8wkVbJRl/0JvHtU490nhV5W77PcGDILVJ3MXWMS75maiUN8451eq2BpRBrbjarST4kl5JYBpHKNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSSPR12MB999212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlBia0I0d0ZuRWhYUkl1VythYnN5QXIxZUxnK1BTMUhMeVFXWjV6aEZLVTZN?=
 =?utf-8?B?ejkxVFZpajRnMkpRUE5YV0NVckloVWVhS241dFM0b216VUx2RmIwR3FaVWZP?=
 =?utf-8?B?ajFQT2lLdFNRcFNpK0dxajh6bDFtQ1VyOXVxNXFDY2t6UTRzR2U2eTMrZmlJ?=
 =?utf-8?B?QkFBT2dDeDIvVXNXSmpuWUtKeEUvM05LWkVheHRlZFp5bFVKMnlxUTJmZ0pD?=
 =?utf-8?B?Y3l5TjJFczlCVm55L2lIQWZCVko2L2pISktnWVA5WTV0TkgvNU55eGZLZWpT?=
 =?utf-8?B?bUFyTno3L1g4eW45VjNVaFJ5TndqQnd0UEJ5M0YrcVZqSld4ZnB6UFNtMXVF?=
 =?utf-8?B?TFRrdDlBTzhFaVl4UFdocjMvbDZXSVBPTXJxUjZIVnZJQjNwRkhoRzhhTlVs?=
 =?utf-8?B?M2R3RzZZaXNoQTFSOE1uWkhLbTQzR3lmVVVNYzRpcHZRTkVoRk9sV01XK0s5?=
 =?utf-8?B?Q2xUN2hnVlRzc2IvZDIvM0VRNFVrdkpoenRxQUFiYnhJckJjWFZxZDYwMXhR?=
 =?utf-8?B?dExQSWhNTlR2bXNyZS9TRVNQUW5oV3U1Zzh6bjgyZVBqK0kzSE1ScE4zNDRQ?=
 =?utf-8?B?NUZITmQ5T1JkYU5iVUp2UmV3aWVLMXRUY0hLS2pKMEJGQ3Y5Qlh0RE90dG9i?=
 =?utf-8?B?VWNwTU5IVWQzOHZraXZMNUJOeGpXSzRnZHAzK2ZIbGlLd3R1OVh6YVNVZmJi?=
 =?utf-8?B?NTU3RktLZGlEVy9YU0V0b29QU0RlN05IR3NqSWtBdHN3V3VhQjFXNUtidkZv?=
 =?utf-8?B?bkRXV3lPRit6d21kR1VNSFp5OWRjeWVjY2lKRmRUYnBneE1oSXpxU0pNMzZK?=
 =?utf-8?B?cUtEdVN1bDZZeGhmQ0xjd3pFU2R1dlV2cVNIRWtYY2s3MzBIY2oxNGVDZ1lQ?=
 =?utf-8?B?RDB6QmNrQlRPYWEwZjA3ajg3djEvbGVkTVpBNkJ6UExXQmRiWFQzRkQzVHZ5?=
 =?utf-8?B?WWhZRUtSWHZVWDdYRU1EdXdhUjNFVVNtT25mMTVaUFlzZGxoNUpqQjFGUnhK?=
 =?utf-8?B?MHpUMjRua09JSEF0MFdVYVZXYkoxdTRpNnhXcnpXV2c5b2RzZjNVSEtRVzZk?=
 =?utf-8?B?c2ZEVmlCZk8rbnp6UTRTbW1jdFpOSVNLalUvUHRhNUZ6Z2REZkpoRFE5UXNL?=
 =?utf-8?B?dVBhd2FiaFY5WjAvNkxoTWpTUXZTcm80N0hSK3ozS1Bxc1hFOHg5ellJMHJ6?=
 =?utf-8?B?OFZKeE4vVnZKNkEzWXFGd1Z3UFVHQmtFR2NCVjE3ZGpMSHFnYk82MGRRWmxx?=
 =?utf-8?B?eGUzRS8wWW91MTIxd1dlelpqUU1QazNzam5zelJBeVM3RlpSM3hyWlVmU2px?=
 =?utf-8?B?Q1V1aDh1NjZUcWNtUjZsMW9PeG52MU9WRDcvcjRzaFlNVjdRNFk4UTA3aHlF?=
 =?utf-8?B?emluV2JCQWJ6eEM2NlhzRUx1Zm1nako0TWYzOE9zVFBEeXJROCtFUTVuTVFy?=
 =?utf-8?B?T0RoYkl2QkNjZ3RpNXBjSkRiVHY0SmRxSkFSQ2hUUmt1L2M0NWV6bTFqajhn?=
 =?utf-8?B?bVVqSjZTd0NmNlQyZEFNMDhuU1o2bEExVFB6MVU5aXZVNVh2SU1QRkI4Vm0x?=
 =?utf-8?B?Y1RFZkg2K2R4amJPQnVkZHd4WklNRFhESHE5WmRFdkZtNG9HdTdTRFBJVUli?=
 =?utf-8?B?QXNENVR1cXJnbXZxQy9wdTlxNVlScXJyMEJDcW9uZnZOdW1OK0RhTW53LzFk?=
 =?utf-8?B?Mzl1V3lPaW9BMk5PN3ovQzcwN1d1ZTdud1NXWS90djhNSTNEK1FsUitHdFdE?=
 =?utf-8?B?aWI5QjFsZjhOZWQvQmxTbTM4UGJ2bHNWbENqSVJKM0l0Zy8rWFk1QUhEUHhU?=
 =?utf-8?B?dndpMXkvM1BhSHViditERXJ1T01XbFJFM29oWlRUbGV6b09xT0RwWVd1Y3JQ?=
 =?utf-8?B?VUlJUEdiL3ZyTFFEc2wrdEZ2dno1ZzcvZnRueU9ncS9wMmlwTUZ5akVmemhO?=
 =?utf-8?B?OENVMkRwSk1haVZJTlp3cEt1TFlGS1pHc1o2dHQ0VmpzL2N5S2tvbnoxUVdH?=
 =?utf-8?B?MytXckkyOVRteDI0V21TUG1OMjkwNWNETUdwVFJ4YmFqRHBQSWlXUVlnVWtT?=
 =?utf-8?B?c2paK0pYQ09jS3dHdGtzaXNBam9ESVB1aisrYXh4WlR5cExxajh0eHdyZ1Vi?=
 =?utf-8?B?ZVozY3VHVzh5eC93NVpEMlQ4ZDduNVp5TEl0d0lpc2szdlp2NXZTcCtURDdP?=
 =?utf-8?B?czdCMjQ2c0F0SFdrN1MrQWUrL0hoMTJqN3JaZlhTK0NYOTBvT1RmVHJnSDNI?=
 =?utf-8?B?VXo0ZlhQZEVHd0lxSk9sb2M3NWVmZWlWRjA0VDBJdHkrUXM4dmpOQkgyblE3?=
 =?utf-8?B?TXk0QnFQcUE5NHdlN2luNytVVjJaUlVFV3ZMc3d0eVhsUC9kMHo2Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5170e0-27d7-46b7-2b2d-08de8a2f2a4b
X-MS-Exchange-CrossTenant-AuthSource: DSSPR12MB999212.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 05:27:11.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juRrn/3zoVrIZSR+8/Kn/ID/M052Usf8eDNchimZP1QudfnCVObIFFL5P5t5rmNshpJC8AwLLdIuh/gLuFOMgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8930



On 18-03-2026 17:26, Mark Brown wrote:
> On Wed, Mar 18, 2026 at 02:36:42PM +0530, Sheetal . wrote:
>> On 18-03-2026 04:32, Kuninori Morimoto wrote:
> 
>>>> If the driver simply can't tolerate disabling the sysclk it seems like
>>>> it would be easier to just have the driver directly ignore attempts to
>>>> do so rather than adding this flag which the driver has to set only to
>>>> get it passed in?
> 
>>> Agree.
>>> I think this commit can help you ?
> 
>>>           1e1a2ef95b571825ca9c0113f6bef51e9cec98b0
>>>           ("ASoC: da7213: Avoid setting PLL when closing audio stream")
> 
>> Thank you for the feedback and the da7213 reference.
> 
>> The concern with the per-codec approach is that this affects any codec with
>> a set_dai_sysclk that forwards the frequency to clk_set_rate(). Since any
>> codec can be connected to Tegra platforms, and MCLK is provided by the SoC
>> to external codecs, when clk_set_rate(..., 0) reaches the BPMP firmware, it
>> raises a fault for rates below the hardware minimum. Fixing this per-codec
>> would require individual patches for each.
> 
> Since in the clock API clk_get_rate() maps onto clk_disable() those
> drivers ought to be fixed anyway - perhaps we need some helpers for this
> since it does look like we have some issues here.  Either the driver
> should ignore the disable (possibly due to already refcounting the use
> of the clock and disabling/enabling without machine driver help) or it
> should translate a rate of 0 to a disable.


Since this needs to be handled in the codec driver, I will start with 
separate patch to fix in RT5640 codec. Adding Realtek codec maintainer 
for visibility.
