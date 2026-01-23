Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E712D8DC2;
	Fri, 23 Jan 2026 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769159663; cv=fail; b=Gdx0h/Hfj1V42YNv5nxXk+SdSX3NrnSGGeTxbnkTUZ/pVQF6rhBycJZaMEZS/8GP3V3dF936Wj8+5T6opv/MB1Q2AZUvhygDZtMopdkBzCzg2lsLvFdLBeayPg/VUmVASksUl15mF432RYRbzX9G8v683DfdGxSmsg8AqGTr7uU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769159663; c=relaxed/simple;
	bh=HdmZvQNdZvD+e0okNZMWqZNd7XW9MX0wkQXHbAqmcUQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T9UdlRV0NzJJDk5JdBG35iUDJ4Dr7NPZ6sTr9q6TffYFALnNET7ybRyxdKX90AmtNbhUyIGWc8JsMMKuiQDwpMnsiOyAfHlqAoQhYdbpjcWN27bwwHwrANT2d9LBUqKW82KyjXr2vPFg0Qc1LeSrDOMt5WZ9PvZBJab9+C+k7SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fWdKGhlk; arc=fail smtp.client-ip=40.93.196.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fWdKGhlk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iH/LgrxB7oXyKfEnBYkavfAMdZ7TUkkvBFqfJM2Hgp6JR6il4OcirSBVJQuzt6St50QTFpscdc6hofJW/g8nJ15eHON8LYoQxrPWldfCsdphOX/eDkJs/T8VPBLGFvHoUX+GUUygyqa2qcDylG5B9vEbBvkF3VfbfVivJpkHaZ0lznYgWY+KtD6carc5uCg/o+/NsoXLw9YMTpDmR2gHHEr6k5iLwp1EZ7CNOWVpMGEDJlge0hr9PnCvjRe6fU1krxoAmvlOCBF+eVomKEtBPZMmqeZU4q3o9UfNpXUMpKxUlPr5YQluNbcLQiUUMm6byR8UkyUfH+TuUtp2wW42Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OEVywP447kkxthrQZYS2U6tFPQScSeFPWTygkhouD0=;
 b=I68oFSZ5C7Qg6RV04KtH2hUh6CkA61w/elwfn4PD7+258Gq43Z0I6Wvo7TmlDT8T7RxnfQdfodunusDxnG+vH59ydq/nQIkXazjKq3UCRKiCxhW+eyKNQMAadxbYENm50BObrJCzoCIPclx0ACMGGCgSkMDkRCDv+odiy+rldL66dD0nsdmA3/y+eKKN012nFhb8NG4XyP0+CNkDD8IpPT52FI8DUjsycxw0mY2AppK6t4LaP+368ynswnSwBEtunjeRLdM9mQoO1LsekbrnQIHVPmpdzi+0jZ194x1BWaNUWGgtk7CapXgleWqeQUA73pI2dWlGeFYQTji/9ZgnpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OEVywP447kkxthrQZYS2U6tFPQScSeFPWTygkhouD0=;
 b=fWdKGhlkOLHDly6vX9a2JzI274AA2G45m99RJQFCoFA9JPc6DljoVKqExhMwdD5DEHGAXQfGBs9bHFSlzEfKqM2Kd2uoldvFyXVMwFm1XETE7FgCfZSGPdqE2jcQbQ4IzuA0xpRhTwm12QRhAt6xyIaP8n+x0DsMgPHJssypbV492sYxcYA4Tr6dRpnI6Z+sDkwgdJgoCe46mLKmjaidxiuDh0WhH0wu8zLbasgieehkdzAjFfBbBlViuvMPjJNcKdhLGF5ZC8JJ9WLDdJYX8b2ARE0a4eNA+Mj2taVnaxeAjpoZj1twAduHluCr3+gB0YFQxLHrUujLe/HNQImv7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by DS4PR12MB9562.namprd12.prod.outlook.com (2603:10b6:8:27e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 09:14:19 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 09:14:19 +0000
Message-ID: <9207f78e-c555-483f-8db2-b1e7422f4f9a@nvidia.com>
Date: Fri, 23 Jan 2026 09:14:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/tegra: pmc: Add PMC support for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, thierry.reding@gmail.com,
 jirislaby@kernel.org, pshete@nvidia.com, chleroy@kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260122110805.97899-1-kkartik@nvidia.com>
 <80ed9e52-9173-4e7b-8df9-aefe7294904d@nvidia.com>
 <f6718c48-e953-4e30-bd22-8e06f4fb157d@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <f6718c48-e953-4e30-bd22-8e06f4fb157d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::7) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|DS4PR12MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cef1a0e-1703-4ba9-9ec1-08de5a5fca2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDY0U0pUWks1MXR3bnQramlUalRvYUZIUW9DWmxXNUxJQW1wc2ZzMHBHRzlQ?=
 =?utf-8?B?SGdCeE9vVGRGZXZOZ0E3NElPMGc4SC9SRkdZQXJCS1JvYXVuMXIwQmZZNktr?=
 =?utf-8?B?ejNaQmRuLzdCMWJDMWcwcU5qV25ZOW5aU1lQSWtSL1VLcDFjVnBrU0wvWTd4?=
 =?utf-8?B?aFh5MW9KWklqUlR1VnFRT2k1MWNyK1NIb0JxSDZyQXVwVEF1L1lsVHVUejZq?=
 =?utf-8?B?YVgvaklLL2RxUmJEa3Jla0UvUytTd25aODdCYmtxTnkwU0JmaUc1ekhQT1Nt?=
 =?utf-8?B?UU9qdlpLSDRxZjV4bGhPQ084MGgyUENhMUVXYXpGc3JtenJuTlRPWTRXa2V3?=
 =?utf-8?B?dnZHWEVueHI0Wm01SksxTzYzWXo1d21xUVBKMnpDcytraHU1QzJKZlNON0hq?=
 =?utf-8?B?M01WUkd3ZHc1TUR5MkMwdW1Oa1owVW1OYzJJMTRBd3k1SVVYUXFRdlJvOTJN?=
 =?utf-8?B?SCtqUkhFb3VVT2kxaElYQXVBeitLeEwwWEs0NHFEa3BoeVhoci82R3ptU3ZX?=
 =?utf-8?B?aTVBdmVzVFp3ZTEyOTcvalBZWHEwWUl0ZGlyZjJKNkxXTlo5UzVsVm5XN2dw?=
 =?utf-8?B?ZS8vZWZtZGZ0cXZ0clRUK0tQMGsrYlh6YktYWmREajlSME53RSt4Nm5wQzR6?=
 =?utf-8?B?azZVbjlnTjhLd1hkVDYzVm95U29jdi9YZlpXY0VudENsbUZZUWJqenlqVHNN?=
 =?utf-8?B?RjdVY3kwdEwvM0Z0RDFSYW5HTWl4NmJLREN3aTI1cmhsNEZ6L3JyOEcyRE9T?=
 =?utf-8?B?SG1yMXg2c3pSZXlBbDliTmhjNFBycUcvamxoeXh0a2lsa25Rc2o4WGs4MTVU?=
 =?utf-8?B?M3Fab2QxOW83ZUh0a2tlMGUwUENYZEJOMnd4dnhudVMxbGdRei82L0VNbXVT?=
 =?utf-8?B?RFNkcnBqQTZQNnBHQ2FkSVd0TVFEN3R0ZmtvSkI0em5xZmVFamZCc0pHNTcx?=
 =?utf-8?B?U2h5b2N1MDRUdmQ1N2tMTUw2aDNtOEZIVjdmVWt4bGRHRHdUb3FPRnVxejda?=
 =?utf-8?B?TUFLenpoaFY4YjByaUY3UityVWtBbTlBbWcyd1o2Y3JKK0pldE45SkNxQU91?=
 =?utf-8?B?QjVKM1crdVNMaDhRaE1OUDBpMGt2RGRObnZVOHFIR0NEUkFzREFDaWNOZkw2?=
 =?utf-8?B?a0x1Tm1qMnR3NGMxSHBLNksrbkxMelRtUmhXY09INk1uOFU3Yzh4M1VPeS9r?=
 =?utf-8?B?aXRyM0JNQkplazIrVE5seEhjUTBUb1dFdzhidG9IS1ZBK1VjcTlYR1JCVUtK?=
 =?utf-8?B?c0FhZFJEVzE0R2dmZ0xvazhiRzRIQnV0SiszNVlpSGVzdTFUYXVTK3RaL3pJ?=
 =?utf-8?B?d28xRXIvTEIvS1pGYWNWV2Nvdm4vZ1RHWTZxYWFmZzhjUXRGMlNkMS94MTUx?=
 =?utf-8?B?OWZZUHY2aUJKakducnVIM3RMS3VHL1JmNlZxeEdiaG5Uc25ZcW1MQ1o5NS9w?=
 =?utf-8?B?Z0ZBeUpCbFZxV1RnOEZYVlVNOXdyK1hkK0NiUjZWeDJzRWxsWHk5eXRrV2lM?=
 =?utf-8?B?OVNBQnNPaEJZZ0xLZlVGWkdxUU54bCt2V0FldjkzZDJVaEt1cmRTQUpteUlM?=
 =?utf-8?B?Ni9TZXJPOSs1WG0zOTBpM1ludmorRW1YZFl3YjB4cVFhcEtGendvRWpZTXVp?=
 =?utf-8?B?c0tRZE5nMGVOMVYrd20wckJqVWV4WjE5ZTJLNUZPNTVjQkhjbDhYM2hRdW1x?=
 =?utf-8?B?bUxaWEVOOEpsRlRGai8yT0MxYlpLRVBKN2U4azRFb2llOElrNXJ2bUsvZEEz?=
 =?utf-8?B?c2lSblBBVnlWOG11ejNPellqZEdKdjlEVTlnTVV2TjhjVHp1cm5FdjI5dXh5?=
 =?utf-8?B?NHNQeUJKcTJoTXZuUnV5NTRpaWhEK21aL0dxWVFFb0J2UDRzSWhkaURnZ0ta?=
 =?utf-8?B?QmUyZjBybWliK3RObnYxa2xkdCt5UEVVSVFvRE13OXFnYzV1ZytWcGVVWXNr?=
 =?utf-8?B?VThiazB3NG5XUEtEZm1BTUl1YVVXM2xSTEttNDBvMHN5MjFmaVVSVjhTbGFl?=
 =?utf-8?B?WHBEWi9UZkVxV0k4TXVnNmhzcjNMMkhrSHplSngxckNicjZ0a2U4S3FUekd1?=
 =?utf-8?B?Z2VhdGZCeFE3eFgxcnBwbERIY1F1TmNQNWt4NiswMjVCNi96SFdNYW5lU1dC?=
 =?utf-8?Q?vjZk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmU3ZFR6LzJkQU5ydjAvUTJGQm9vZkdZVkcvR3E0UENiNzNmL1J1L0NuOVlY?=
 =?utf-8?B?Z01yVWpDeVR0ZlQzYmM2Nm9HaXhCOWJqcUkrZkFaN0N1NlN1YVlEckdETVlR?=
 =?utf-8?B?Tkxsbmw4dXRCZUIxMUwrOHZwZHpTd292RTBlUHRIRzdZVnN4bE84NnhwT2Ra?=
 =?utf-8?B?bCtObTFDZkZocU1kOVVZZnBDdFB5VERKVG9FL0RiekRIdWZCcWVzclRjdG84?=
 =?utf-8?B?UVNTdjBZNFpVaklKWmYzM3BDWnJXcEYvKzY4amI0bHBRN0N6UUlxd2R6elRk?=
 =?utf-8?B?OHRzTlU0b1NsZWpMbEhFRWtlTG9JUzJFUFlPU0N3TWtDV0grUzM2cTlXQ3Fs?=
 =?utf-8?B?NDZsMFI0LzFBRS9OMUNubTZJNWJOZC9IbERWOXFrazRCRG56UVZSTEk1RUNs?=
 =?utf-8?B?UGZQRldsWjAycGxzMEZ1anFHM0tESm9CYzZZWVJwUUJxejdYUEsrYTdXeDZz?=
 =?utf-8?B?dW5YWDUrR2RleVZYSWYrYU5TR3pOQzEveDZRLys2dzY0eUdrYmJVUWNnU1RF?=
 =?utf-8?B?ZFlUZG1oT0FRUmpMNkhNZkNnN0VmWVA2eFRCaFI4bnFHOTBRbjhFK01zZno1?=
 =?utf-8?B?SCs1WEtIWDVqWVA3SDE5R0FJUDF5TEhLanNBbmJRVmgwcm1DZFRrUDdKcnln?=
 =?utf-8?B?WWN3VVRoL1Q2R1pxVktWNGxwSEI5UTR6OENsMWgrVmJXeWZ6akYxYUxzWElx?=
 =?utf-8?B?cDliNlRUc24zNWJ5cmpXZHVVSldPQ2JJS2hEZE9Ia1dVbUI1Q1d2anp6Ymly?=
 =?utf-8?B?Yk91WUVUMVZPZHhURW0zRkI4bWtyNjJRS0NRQ2ZqOW1nclNmdngyVm03ZlRY?=
 =?utf-8?B?a0ZuVmxIUStzdjlWeUx5V0p2dGZ0bGZjOVVLZlYrOW0zR3RMMmJJL1ZGcmlw?=
 =?utf-8?B?SjlFVUN0VFEzL0VZbzJHZmxlRER4aGJBcXJxOEtqRytwaFFMNVgrdThQbFdR?=
 =?utf-8?B?Y3VBSGs0eTRBL0RySHAwSWZrSzdPcUxOOStHVnh1QTU1SlZHL3Z3NG9PUGti?=
 =?utf-8?B?dGszS1FJV01CWXNtS3FuQ0RQYVdSdWYyd0ZYV1VrUm4xcFZnZFRnSTZsVjZD?=
 =?utf-8?B?ZzE0ZWE4aXdoZ1NHUk85dHRBTDNEMjVHRFh0Wk9Nb0EwN1lUY2lUU1FHZ1c2?=
 =?utf-8?B?RnNtODNiWVZObFNkTWdPVUcxS0t6bzZqOTA3WDJGemU1WTRiRUZyNVphT3Za?=
 =?utf-8?B?T09uekYwME5sdTl5Si9CdEpUZEhWWXl3RXoySjNJRUcrM25FYXpwZ0VrN1du?=
 =?utf-8?B?MGRFK0F3VkNUMG9nUDFQTStQRkQwVTNuczllaUZqM3MrVHI2VUJtODNGclJo?=
 =?utf-8?B?U0c4UkVKQzFHYkhEa25VREsybE5xejBFZ2NtcDhKdG0xRUZPRHNJN0hNK0xy?=
 =?utf-8?B?LzRaWERGQnFCWFA3azhIcFo1ODRlTjVvV3VlNzF0L3JtVUpTV2tCckY3aTZr?=
 =?utf-8?B?ZmpOWTZNRTc4bEF3c21kNHNUY2VoNVl6Tkk4U0NxeTRubGpNOEJ5T2h3dU5R?=
 =?utf-8?B?cEl3T1JKTHpKL3hJbi9mamVYUzdIOG9wRFVuVThCSnJIMjlGMjNWbW1XKzI1?=
 =?utf-8?B?SEN5ckoza21GVTByUzRvdk1JRUxIemkvV2hHN1Q0V1ZxdUF0aWtoZTcyeUg5?=
 =?utf-8?B?dlltUVF3MEVZUWZoLytCOXIveER4dFNXWkxjOTgzbjIzaEkrNkYwNjluaWcz?=
 =?utf-8?B?K3JlK0xvd0krKzMwMitNZ3puWWlxYTlFcmU0Tk05NC9YOTFsVk92akZrTmtS?=
 =?utf-8?B?MnZUNzFGTzh6QjN4NUJqV3dzU3hLSG1TRGF1VitSTm1WNGs4c3Vib2ZTbUlj?=
 =?utf-8?B?OGtRNk1JVHl6cnlpMVZvM0FnWlNDWXU3K0Z1Q1poTTF1TUR3Wm5LZ2VUL3F3?=
 =?utf-8?B?VHhEWS8xVEZrbE54MU9rNEhlUE5hdU1mNWlmSjhOVnR3UzlGWUFqMUt3cTJs?=
 =?utf-8?B?S3hsNWVsTk5UODRCbnBPbWhiN2Jta2xPWWhkTzIyUG1aT1BrTXNHbnpORVQ0?=
 =?utf-8?B?NWorNWdrbkRYc3FnV3FGNTVnR1FaRTFWOXhoMW55TG84a1lpbGY2dXVEbzU0?=
 =?utf-8?B?b0cyRjE5NVhYUFhkbzMyUDJuR0U3RmxrS2QyMkFsaCtqNjhHRUpaSncrSmtF?=
 =?utf-8?B?RWZvbzErb2pzL1N6YzBmQmlONFVKTTlnSWRVOW5RT0l0WWdkSkFVc1BHMEZp?=
 =?utf-8?B?NnAweTY2bkFvNFU3M05sM3RHMFRxR2RBQWNIWitMakoyNlFCWEhFb29FNzBG?=
 =?utf-8?B?OTNabmxLb0w1UjVFZmlLSndMRUF2L2JFZjBxMmZQU093NXBrTzltd1RhbFVv?=
 =?utf-8?B?OU0weG1PL3VuMlp4NmdyRVpFUVphTXhSS21RbTZpaXNMcDFVVlJibG4zbDhW?=
 =?utf-8?Q?EAsen097KEw4H51zkCviOgIws44L6s0KTC8bgK8zXFKsU?=
X-MS-Exchange-AntiSpam-MessageData-1: G2lPLwKk3eujpg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cef1a0e-1703-4ba9-9ec1-08de5a5fca2f
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:14:19.5490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /f8HPcfY+qNLv1AuszmzUDPANpZG4bJ7zA2lN8pAtykhUYj9EbhWVPM4sd6+VZbfoL6WLx1V3rkBbkHoIRy9Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9562



On 23/01/2026 06:51, Kartik Rajput wrote:

...

>>> +static int tegra_pmc_acpi_probe(struct platform_device *pdev)
>>> +{
>>> +    pmc->soc = device_get_match_data(&pdev->dev);
>>> +    pmc->dev = &pdev->dev;
>>> +
>>> +    pmc->base = devm_platform_ioremap_resource(pdev, 0);
>>> +    if (IS_ERR(pmc->base))
>>> +        return PTR_ERR(pmc->base);
>>> +
>>> +    tegra_pmc_reset_sysfs_init(pmc);
>>> +    platform_set_drvdata(pdev, pmc);
>>> +
>>> +    return 0;
>>> +}
>>
>> Should we just define a tegra_pmc_probe_common() that is used for both 
>> DT and ACPI? The above is not specific to ACPI.
>>
>   Do you mean something like?
> 
>      tegra_pmc_probe() {
>          void __iomem *base;
> 
>          tegra_pmc_probe_common(dev, &base);
> 
>          if (is_acpi_node()) {
>              pmc->base = base;
>              return 0;
>          }
> 
>          ...
> 
>          // Continue DT specific initialisation.
> 
>          ...
> 
>          // Clean-up early pmc->base mapping once the probe is successful.
> 
>          unmap(pmc->base)
>          pmc->base = base;
>      }
> 
> We can do this, but this will introduce some churn in the probe.
> Having a separate tegra_pmc_acpi_probe() avoids this and keeps things neat.

You are right because of this early 'base' handling. OK leave as is for 
now and we will see what Thierry thinks.

Jon

-- 
nvpublic

