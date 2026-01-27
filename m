Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCE835CB66;
	Tue, 27 Jan 2026 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525924; cv=fail; b=GEKYa1VAW0QAnNzRzdCQDQDmk4TU3NHelGoyhZXjkME17/RiZmHueJp83lLQQN7iPbcnSezJxuagU7bZGDqi4EhE7c7ax4EL7kmKMoHvgjHGrJEKB7suTUTEEE7NriQEKU2cobBYeTD8vdUVn1dB02jeaPX8ig7pRQXqjtOEpJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525924; c=relaxed/simple;
	bh=139wz/iSVPF/Ho84Hq0Ckzk9iQroUp5idtjKa4FWolE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X/VzXEkpXOP21xDBIQZptlDmchhUBNWsFVKVgmZNmXtZouwIgZpszj7hgwwre80PHOoFJAMO6RUlKTeeq/Nfl713gbUwEdxvi3owI8eQHGbKgY80LZ24xEQ8vmh1xbwt8YuQdP/48TKabWVOav+7ZehSpD5w8R1mrNJL7WvLOng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Sc+CL8MR; arc=fail smtp.client-ip=52.101.61.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sc+CL8MR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m98fpnVx1B9452I9Xln2AtTt6NzKvYbwWMstn/xslIKVrNHipFBPphqoRMXEakLCTH8A9zh/wUU4spT999PbBCGGAALl8s0I7Xtc0kbWPOIB/Rw2h1eqLf+bnJd225LBnTajIwBMIpZGHNjq3DxY6G3G0q5LzVb2hZGtQMkZjf5J4HHvrGsKHhKqFih7xbVPUovbPhfnXZp0PQvTTM4ir7QQmOE0ZNsESu2BTEdy+GN5Ght8h7Fx+LslhAEdDw2kGX7pG7Tb0fnKNQxvHmCKkKaW7LVXg72oBmgrxGDohFcWtuSSOtAtYk2N+AxFHSq3QgTRtjYH+kqCuf2wLv0BQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBT3LlMT8Os0UEIaBdRZprfmiO82yLMl+gkXvL7n8m0=;
 b=Q9n0QT7+ZnQ3W3/xDAIz5B1bTvswGhIe374/v2gzo59PTzpPF3DYdQztJKRZEyym5ZvMcQleqMrWLqDr3ZtXqvA9BhqKL1BUg1qK5KIzefVTVQI4jkX+X603dbDaGhWz3xoWOf/8kURpc2UorX5L5ty3kyF4VbXLl0tVlYw9vazK1rW2hVgi0ho6iqfqn+1Dtx5t1QAi+Wjhdiyo0J2LuuQ3RZ/V7Ezok2PpFwydUCOr3Z/RRMDjvOSF9QFP8wXCPgnwTKkF2LD7vH0eCANGn91GsdRN89BDa8j7+N+LjpEHO7VFK/pUKoqyU2jno3ZENopcFcnDpUfOWBzTU3roGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBT3LlMT8Os0UEIaBdRZprfmiO82yLMl+gkXvL7n8m0=;
 b=Sc+CL8MRr26pzy0oBIUbNHHoZRO06iBo34O8Z5LoLG9Gj1LyQXZtMtm5r3J0XG1DyeWpWcOW37wsHSoSEgioW8i3EW0OBvs1cAxVPaUi8EkEZ+gCxCd/cS4kvWKhH9Vme21EjX9H2LeE8XnAbQy8L+REozlFSPlbs5EG4i3/GL135Hxq7YYY1F3aVTFlI+rE6kY9gy3J1YZqjmFYW2jzL8kep+5+/iHBmeqjqBwSICR3Ft7K1iVdRzD+sjG40pbx3aVQ/EqpMUryYACiz0sdBc+RXhLSAO9wOQbnJSnsPSJGEK2acuJYcmp/bV3yDo6XxsdsVK0tZTf3w1koc5mfsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH0PR12MB8049.namprd12.prod.outlook.com (2603:10b6:510:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 14:58:39 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 14:58:38 +0000
Message-ID: <80129399-2aee-4be8-ad85-3b973c1cef94@nvidia.com>
Date: Tue, 27 Jan 2026 14:58:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
To: Danilo Krummrich <dakr@kernel.org>, Gui-Dong Han <hanguidong02@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mark Brown <broonie@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Qiu-ji Chen <chenqiuji666@gmail.com>, Aishwarya.TCV@arm.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com>
 <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com>
 <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
 <DFULF717AOGG.GY8B9ET26KND@kernel.org>
 <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com>
 <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com>
 <DFVBKRQ35CC0.95P329BK5KZA@kernel.org>
 <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com>
 <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org>
 <2b7109c2-2275-4a38-a52f-f4f901a6d182@nvidia.com>
 <DFW11G0SNME0.3G28YPXH64DOT@kernel.org>
 <b3b0635c-657f-4869-bc88-06de9287a464@nvidia.com>
 <DFW4JJYIDC2O.3L1XXBT5MY9SI@kernel.org>
 <CALbr=LZ4v7N=tO1vgOsyj9AS+XuNbn6kG-QcF+PacdMjSo0iyw@mail.gmail.com>
 <DFW7DOC56CUG.3PV4UGDTMUYE1@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <DFW7DOC56CUG.3PV4UGDTMUYE1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::23) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH0PR12MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c659352-5417-4ab5-f200-08de5db48d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTZGUnpjYTBETm81ZTdTakZMaERNSkk5R3NqWXlpUXljbElweTNhVmJpWjVC?=
 =?utf-8?B?V3JJMS8zNnRXa3VOOEVOK0tYRkNneHJQRHpDY0dNeTR4ZEYzSlFub3FNRUYr?=
 =?utf-8?B?SS9ST3lDeWZ6WFhzOXdNcXY2NEdGcWdsVzg5THhiSEJLaXozTjVKdUFaeWk0?=
 =?utf-8?B?NWdXbzJ1Tkc0VHhuU1hsOUpidXZYRi8rVmI0YmJHQVpYNFR0REs0R2gxRzYw?=
 =?utf-8?B?UStoejY4L2VISERKV1NWTHNEWTJYQy85cFVOTm94bmxrbnhoMVBLVXMzQXhw?=
 =?utf-8?B?WGJtVVhhb2s0K0RjdzVnMEgzK0VVNVN2TlJEYVR3ZE5hQTE5TjVuYzhFVmhz?=
 =?utf-8?B?UEZQZmNGNDNmUkN2cm5yQlpjZ3lvRG91UCtXSlZJMTAvTUErMThRSkVESGNk?=
 =?utf-8?B?RHVTWUFUc0MxOU5icCtnUStWbERBN3FGTVNYVi9yVGsxRVh2WktmM1phcEFN?=
 =?utf-8?B?ai9zRjBqbzB4M1F2b1ZtbGlPa3Fia1NmRkpZZzVNdGhaNDZVcFN3MzJ0VHQw?=
 =?utf-8?B?SjgyVmFFL01qSUN3c3JMRGloRytVY2FDZmJacDBGOTFNUXRrWnZVQ3dmVGlM?=
 =?utf-8?B?SWdSdDhIcUkzUmNKSUUwa2piV3FxcEx5Rzc2RmpLS0FRRWY2RHFzZ0hDWDNu?=
 =?utf-8?B?RUl6L0pMeFEyaWVnUE9lelVnUjJVY2JCeUIwbUdkT2NxK1BoV0d2R3l2WlJv?=
 =?utf-8?B?UFBjd2UycXUvcURha0hCM1JSdC9HaGdpUmVTTTVrT0lBV010U2w1U2dSWTBv?=
 =?utf-8?B?a2F4ajkwUEJOU2FrWXV6bWltYnJIMGFPRm1WdUlmR1AvcjU3VTBNY1V5RnpI?=
 =?utf-8?B?Vnk5bHdBcEo0cVQ4VUpLZmNQK1dmdi9sZVJQQWxDeFJCOTdlTGNSbzBUQzl3?=
 =?utf-8?B?RGl5KzhoM00wNDF6TFdFVlBwUytPZFNrWU1iK1JuWkFNK0tZbDF6MUN1VFVC?=
 =?utf-8?B?czR3dk5xK09ENDlIdGVvMFF2THdQMkhjMnJ5OTFLcmsvL1NJSXlzQU41M2xh?=
 =?utf-8?B?Q1lZUE1nVE16TTF4MEpScTFhaG1ubmdYajk4VE1zUVVJTTFzeTV0UkxJZjBT?=
 =?utf-8?B?U0ZHQkFXV2s4UnI2cDZqejNiSmdQZktCZ1RDdTVyNmVCc2xENnFOSjdlY1Jp?=
 =?utf-8?B?R3dtVkFNSXNPdEFIZGlIaGJlcjJVeWZRUjhDSUxReEdFbk1ESG9vd3VwbGxt?=
 =?utf-8?B?SXdmamp4bXJSd3F6czlhR0RBZmQvYXFJZWQ3WFVadW1selU5VDFWTzFuSzAv?=
 =?utf-8?B?SEJrU0s1V0VTaUVjK2VVWUpYYkxBTXRjUnRyQS9uMTV0ZE9FeGE5WUVOZzVQ?=
 =?utf-8?B?ZmJaY2lPVU5DcFBwMmlWRVE0WEJUUXZya05TaDgvdE9iSFlFZDFSUStNVkI4?=
 =?utf-8?B?eDB5NUdLczZneUtzVFRDd01xQzRtdnNkQUNKeTV5cmhaNWlLb3FOSlV5ZE10?=
 =?utf-8?B?L2diWWhRN1h2QkVoU3V6RmIxM2dNNDF1ZDdMVXZLUG1nbk5mQVBGZ3hheDFr?=
 =?utf-8?B?K1RTaTREVkdmcHB5MmE5bmNXWktXYmh6RXBvS2dkem1OaWQwMHZuOFQweU1y?=
 =?utf-8?B?Q2UvRnVOT0FRV3hjU1FvQVhYZDdPRHZOKzVPS3ZUeWlGR2FUZFlJbTBFN2Iv?=
 =?utf-8?B?ZEdRbkJLWUFRcmVQbVdaWFpZdkdkRUVZdWJQSkVReXpRVnBZOW9qRStHd0hE?=
 =?utf-8?B?OXV6NDZOZmRsVnFDRnVaSGVkSS8rQ1JhS2NUOUxGY1hoWXQ0Y0FkakFIeDNy?=
 =?utf-8?B?c3hRY0F3dXpoMnI2dVlGUHEyeDEyQVhqem5ycDVZZDFHRDM3MzQ0eFREa2pv?=
 =?utf-8?B?UDZEdVBOdmUvdFNwcUZWd3hqQmFvS3BBcFVBUGJTUDFLVGk5eUFsTStXbGZJ?=
 =?utf-8?B?YXFVVURrRlZFNjRKR3pNc3JMZnlRamQ5V0MzMzZ1QStYVlNtSnM0QStRWlZn?=
 =?utf-8?B?Vjd0a1ovZ1JOOStkblFmRjZRMEpHVS9GKzBoRWZmL2JqaEh5bzlZYnRGU2F1?=
 =?utf-8?B?VWlYNFozdmxQN1lYR1Y3T29DOC9IaWZFUUxGS1Z1OUViMTh4NGIzU29DNml0?=
 =?utf-8?B?ZGNQalRJaEZtSFdBdGE5dEphNk4yckdTVVkvNDVFakVIUzlpOCszZDZUVkh6?=
 =?utf-8?Q?QRIrYr9oUQD7WKTUOAacyg6lk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDdoWER3M3Z6ZGRjV2ZpTktyM0ZLUmhVWWZsOEhSMHpzSVN2WGJka1ZSUEFq?=
 =?utf-8?B?cVRhUWZ3NnBUVFFCdGN3QzI2LzJ1YVVXY0pQblU4ZFBYVEIwR1Z4TkFycFVt?=
 =?utf-8?B?N1FoelFvVUxkazR1em4vSG13N1lqajVVeGdzR1lDdDRhcm9UWkZWc3JlUUlz?=
 =?utf-8?B?YlpvM0Q1N0EvcmJGZ0lHMndXOXRrQ1ZLTC9pMUtkVUZrVUJCMkx6SjFYNmJT?=
 =?utf-8?B?WTlUeUt5blk5UUZwQzlrcXZqUGxGdXNuNUVNTDAxaHdsTUMwSWFiUmxIdnhQ?=
 =?utf-8?B?VmJhcE5najlncHJBQUdLZVBqczZhQVIyNURXL09JTEkwZkkrUXRqTFdZNEd4?=
 =?utf-8?B?VFdHK28vRXNXSTdoNTdSRUwzNmlMRmVnOWs0THE2T21PR0dYTDY2dkFWMG5T?=
 =?utf-8?B?Nm5aUitCajMzdm5xUk9VVU5iWEwzUzRMZ2NKYmM3NlVTN1FGK2dYY0ZxejdF?=
 =?utf-8?B?dmRoc3UrRkZSUW9ONlFXdXJKSnFIZWxWam5EQmZVSUJma2lERFdWRTgvSEcy?=
 =?utf-8?B?N2FBN0xUVzZhRVM3RHZmSkRpeG5yWVZaeEpzZkNlQ00yeUVsbVRSNDRheEw0?=
 =?utf-8?B?QURWTStBbGRtK1RncTVvcllhTFRIN2oyRFJOUXF2U3lwR3hOSktJOG50QU0z?=
 =?utf-8?B?V2NtVkltRGhqakZadDhOdFh3RHNwbVp6TzZZUGE0cW9oNTRGbmo1OGl5bUlV?=
 =?utf-8?B?Z2NVemNpcytRb1cxRzV6OU8wTklaN1BYY3RuOW0ycEtqYWkvQzVaWXRBU3R2?=
 =?utf-8?B?bVZCam9Za0ZjZUREOG5ZUHlSa3FORVRZN1hlTGtwa2pyallISXFLSkVzaXda?=
 =?utf-8?B?cSsxNDlzaDd6MW01T0tjZFJ3WlcxWW9HVDJWOTd0Q0ZkUU4vN3NyWVByYkRY?=
 =?utf-8?B?VWo0b1FOSURxY2s0UDRXMHFqSklWcStRVExxVDJlS1R6V0FRdEJPQXkvc1p1?=
 =?utf-8?B?M0hjNkJDMmZEWDRwUzhTanNkU0pRanFVdml1Y2JOS0VQckJibnlmczhRZmtz?=
 =?utf-8?B?U3UxWDE4bTQ1QVNDeVhYdHV3aERqQnVpdEYvZlk5K3lRaUc3bUJyTHN0bmlm?=
 =?utf-8?B?WFpoYnBPdVV5WE5ocmlhWFFiRC9NOVRLVWprZ3pjdkJnOTRoeGNtek03Z2NT?=
 =?utf-8?B?bURVVFVTQ1JTZHNxeitkLzZ3UEV2ZmNCbmR5QVBHdkYrV3hiK3hIOFByOExr?=
 =?utf-8?B?cTJoemRXbmlYYm0rSGV5ck9xUDFRNHo1NEQzZENTbkdTR3J2VDZhem5LSEFF?=
 =?utf-8?B?aUcrdWxWZFQ5VkpHaVI4OENOVnRuaU1keHgzR29CSTliWnFBUzdpOUdRYStF?=
 =?utf-8?B?anQwSW9QY3o3T0Zxa3JURkpPbVFFOStuY0U2SEJGanRFdi9CK2JKT1p5MFB5?=
 =?utf-8?B?VFBOaE1rK2xiWnFNYnpwV2VzaUYvNTBnVDNEYnJSR0pDT0pMSVN2RnJuU2w4?=
 =?utf-8?B?TTBnMVhPUzVwRktSVm5LVlVxc3ZyemRodUFJTEF3aXVmNnlrb0tnV24zRHU3?=
 =?utf-8?B?SFlWbFVmcXBrUko1Q2V2OSttUitnMi9pR2lnQ2hEa0Y3UkxxejUrdGxpVkF6?=
 =?utf-8?B?WWNCRjI4Y3pRN0lTaGFEUDN4RnVzOFBGSmplWkhoamxRNTBXcnhHbmtGMHEw?=
 =?utf-8?B?cXdKVXJTV2JpcXVRZE9sRHUxUWZTb0VvaU9MWGZoOU1iZElkbUxWZnZMSExw?=
 =?utf-8?B?WndVZEhFVTZodElCcFNwWkxjQS9DanpqVTlTUyt5VHR6ZTJuanM2OTZQSURG?=
 =?utf-8?B?OWhnZ0pKTGxVeHBweGhiSk9GQklYeWo4QTRxZXZ3R0svR3FUZWtPZGdKZlg3?=
 =?utf-8?B?ZmxrRjMycWsrd2p4LzJxKzJTR1ZPTGROaFplY1JNUkxyTnJScitBaTNYK3FW?=
 =?utf-8?B?T1MrM2ZNdVZ2cnQreVdUMzhSa2pvZmduMVkyMklkQTRXbWtEZ0VtZzYwbjhl?=
 =?utf-8?B?WU9SckVhcWdZdXpPZld2UXYvN3l0T3dkTE9CVEVRREtFQ3MvWDlvV3VqYjhz?=
 =?utf-8?B?UWNPbTBZeDVjUThwWW50YVUxOTR5UXB5WGhyRTVvb2RNRXVGdVU4M2puOE5I?=
 =?utf-8?B?SWYxNVAzSzV0UUlkZTRtYTAwdUZUNHdoTzVnZDJIUmUxL3Z6QytpOVBDSUh1?=
 =?utf-8?B?anIxSXZVZys3OEk4dkJjVk85bVZNZlVPSzVLbFlhaWxvSjZHQmxXTTMydUVU?=
 =?utf-8?B?M0MxUGJUKytBd0tIOUFBYU9GM0hqajZIWHVrTlUxS3pNaXdQMlBTZk1EcFk5?=
 =?utf-8?B?Q3F3UkJwcnpKVlBMUjZzdjNsTnBrK2dVVjNmSGh1K1BYZnZRWmVWeHVTQzVW?=
 =?utf-8?B?UDZPZms5ZkhoNUlkamkrMjhRc3NzSStPcWZjVzhrL0NBclF2ZCtxQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c659352-5417-4ab5-f200-08de5db48d7d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 14:58:38.5491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5moIhmVGfdXSPLf+U0m5AZZ0VK23rA/yBXbJ42CgrvFobWHll5vLhpVA2dEiQ4H2G3J60EKivIrDiHHw7Z1MbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8049


On 23/01/2026 19:07, Danilo Krummrich wrote:
> On Fri Jan 23, 2026 at 7:53 PM CET, Gui-Dong Han wrote:
>> It seems the issue is simpler than a recursive registration deadlock.
>> Looking at the logs, tegra_qspi_probe triggers a NULL pointer
>> dereference (Oops) while holding the device_lock. The mutex likely
>> remains marked as held/orphaned, blocking subsequent driver bindings
>> on the same bus.
>>
>> This likely explains why lockdep was silent. Since this is not a lock
>> dependency cycle or a recursive locking violation, but rather a lock
>> remaining held by a terminated task, lockdep would not flag it as a
>> deadlock pattern.
>>
>> This is indeed a side effect of enforcing the lock here—it amplifies
>> the impact of a crash. However, an Oops while holding the device_lock
>> is generally catastrophic regardless.
> 
> This makes sense to me; it might indeed be as simple as that.

Yes I believe that this is the case too.

BTW, if I apply the SPI series from Breno [0], which fixes crash in the 
SPI driver, then everything works fine.

Jon

[0] 
https://lore.kernel.org/linux-tegra/20260126-tegra_xfer-v2-0-6d2115e4f387@debian.org/T/#t
-- 
nvpublic

