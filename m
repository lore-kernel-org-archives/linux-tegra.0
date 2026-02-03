Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010053.outbound.protection.outlook.com [40.93.198.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0714617BA6;
	Tue,  3 Feb 2026 04:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770093178; cv=fail; b=M8wM7QyGcT9hN/QaDPKUItMH7XlCgyphqbqjhvs9iJyDT8Wv09YyOudg82zKzrfwzqbdSCUOqb72Y3ovP0ecWFE8sEV24BF9863PJvVdKoDsJr1bS8VOD7GZaWMSBj4zh7lBM2f1+ILtneYY30Rv7fpg+xGYaY1x1rZJdqy7yx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770093178; c=relaxed/simple;
	bh=WerJ+7jUg5BF0GSQUF0+eoDpQ7xpE0OVTGVYAu9rjbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sxPz4DPOKRytYgDg1KLgqzdGLk9uYRe+2eZJzTa4FmR1rcF6kdEO0LZpCSRE8CE0ZvamtonzaIr0KuQVO3/PqrQpRZUzwYlAmLnb6XVUlXRTJ9E1v8xiP4TiOdWblLpsq7sM9vp3RQCL8uAQDAXYq/FnZMSLGs/P+GqgHdBaUuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OJ35pmhZ; arc=fail smtp.client-ip=40.93.198.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OJ35pmhZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RP0jyazp/4AadN0FMud1wcX4tnlkgJUmdr1UrackhzsFZu4TOlHGYGUcb6Ff/asAbQpVsqB5B9PU4zjjquj1+TlFyUzBOCTWRM3uNY+cvuicwmpco16hJwDJPoAYCyTgZmD7XRZaTwH2ApxmAUtk+2iMKbU4IDknlrqXGgUUyKg5CeHlkgc3R/JWNjl1DVRAXgkfwL1l0r6ig+MBGj6PSXnm5ZEJf7FhgS32SZKRIsef7B2sKyzMQRB8lV+DgM0lnmhDZ1OM1iQxW7onuRCguZMXkG5xxMbEv9TuOLMTqDUkJqHZI3q0tOoLqkx7Mkdwjf7SbPkwqkXpCqv4xDB/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=er0psf+73UO5wKOIr96deNvo3hJec+T4ks1HCmIAiEw=;
 b=S5He8f6M13FKPXJeG3BRPHJ8Pa0lUFvLs2F0WvivhTK+GfIXzy9fDktTrU9OoWCx4lW+Y4sCXfk5nxq1CAgIr9wno6grbVVyPeEuVC043GQ0qKpD2gEug8dfdOhQz7L0zuveM/kuZB+K/NdohV+bAyUMekYedgXe2kvyqlx2kBx1EdfE9GxCI9iML0PV75HnyjkmO8v0SNCGAMnL9cSBdVToJPFmjZp2/ZvOQfCAYrvSvYLOYXqSNIoC8xuYyGk0mdQPud31vM3CDh8lfm5DSiFCIaTAd1yaf9ye3eWKhsMw92wvFgQj1trxfEh8WtV4zpsqabRuHlN1+31qXXH4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er0psf+73UO5wKOIr96deNvo3hJec+T4ks1HCmIAiEw=;
 b=OJ35pmhZ/sLkqCaXQko4DzGgRY4gMreND9B4sWcjRIt3cEocydcnjtrfQBBq02wqXdIEAQ3ANiVKESG5XTT/mWgJYfbk6TDEkEF7CDtBZMWir2qH4sUS7sUBqYtrt90fjDU7meyDx1KNY9rDJDUuFzXuCmtGusCTspcmkkMRhSQePfuWcXRBQUaq2PYkaCS303++kWjfNPNEnVrR2PyzQ5sYnOY3lg86l6Pf5mT3MU6sKdHCpk2908CGhDHg+ygxQ+kUV+iRNocF+s3Z0KM3PRA/+0eoFbP3UfqNsrSupbh2Cz8CuU9EX0N+ErdQXwACHY8nB6q3Pls8BxJAVYiI+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9166.namprd12.prod.outlook.com (2603:10b6:408:19c::13)
 by CY8PR12MB7707.namprd12.prod.outlook.com (2603:10b6:930:86::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 04:32:50 +0000
Received: from LV3PR12MB9166.namprd12.prod.outlook.com
 ([fe80::c2c4:3128:6fae:e55b]) by LV3PR12MB9166.namprd12.prod.outlook.com
 ([fe80::c2c4:3128:6fae:e55b%5]) with mapi id 15.20.9564.008; Tue, 3 Feb 2026
 04:32:50 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-usb@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: phy: tegra: add HSIC support
Date: Tue, 03 Feb 2026 13:32:29 +0900
Message-ID: <2262853.Mh6RI2rZIc@senjougahara>
In-Reply-To:
 <CAPVz0n3PncS5vcK5TDW950c6Z=sf6vTFPOP1B81+2UWvHEa1Xg@mail.gmail.com>
References:
 <20260122151125.7367-1-clamor95@gmail.com> <2051347.usQuhbGJ8B@senjougahara>
 <CAPVz0n3PncS5vcK5TDW950c6Z=sf6vTFPOP1B81+2UWvHEa1Xg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To LV3PR12MB9166.namprd12.prod.outlook.com
 (2603:10b6:408:19c::13)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9166:EE_|CY8PR12MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 1201eb7b-19e6-4c7e-7f86-08de62dd4989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFA3WFB0ZVNvc0gzWENOZkdwSDRIRk9wTEVtQVkxcnJoU1M0REpDazVZSkhn?=
 =?utf-8?B?Vk8vT1NVV01zcGcrTUdSWnhjb3B4cTcyVXhMK2lPd0E4UUl0bkFxWmZxQ3N0?=
 =?utf-8?B?Vm9IUnR6Tkc3YTdjclJoQlFnZHd0cXlLdHhmOE9Zc2tWYUUyWGRNMXYyaVB3?=
 =?utf-8?B?NU13QUp3UGZJdThwNzNxR3JGd0dXcHBXVTRUcVlVNmNGUFJFV3BYZHZ1d2ZV?=
 =?utf-8?B?a0RETnFLUVZjY3BPdnArdFlGSzdjNTJxemRqQnFuN0FaTm5QUkZJZHN6ZmNM?=
 =?utf-8?B?c0VEUXV4T1VXZ1ZITUNLNFRKNTNYaUVDU0xBbzkrVWozSjRMaHRUanRxaG1B?=
 =?utf-8?B?T1pyZFJSMDZRN3NuVVpJM2dlTm90cTQ0YlQxMll1OXBLblRRMzZxUHFtdkVT?=
 =?utf-8?B?QmpOb0dvcEVQK3hRdmc3SHM5eDRhVnRjbEYxNFczVE9uaU1vc2FFY2RWTVlm?=
 =?utf-8?B?Rk5sa2ROVm9pZW1HQ3RUTGRweko0NnRXZFphNEVPVHNMQUlPMkpFNGJsQ0lV?=
 =?utf-8?B?MUdNZjh3dFlmVGNRdGJkaDdJcHlXTEhFUkJKdkxrek5ZZ2pHellmRHJ0Ry85?=
 =?utf-8?B?QStEWnRldFBoNE8zNjMwOVVvUnMzQnA2dGdSejd4emw5c2xDUnZaZHkxMENY?=
 =?utf-8?B?RFV0TVhIcXp5TTZVNk1wOWkzNWMzNjl6bkEyU01ZWm13R3J3L1dUSGc1NXdY?=
 =?utf-8?B?TnVlTDViK093OVhtZ3BkZzFxRG1sM1JaQWFBN29jcXI0K042Ri9IT2E2N3lL?=
 =?utf-8?B?Vno4NjhQUDJ1dFZoTHFacVh1RUhqVnBoZW9VQ2g2WDVaRkx6bTRmQ3N3Zm96?=
 =?utf-8?B?TWc4dU9QNE5YNjBra1J3QlU2MDdJdzVlNGcwTUxmMkExVnUzb1gyd3hRZVZL?=
 =?utf-8?B?WWFoTnd3dzYxZlJxN1VCdm9WdjZGcGV0RzdiR25ab1dXR0J1cUlIUS94TTFI?=
 =?utf-8?B?WnlaNXFrT0c5dmZYWi9YN0pGQUEvSmJSRWFpTjFsb0ZtdUpQUXhwSnNxaHpW?=
 =?utf-8?B?aExXVUM4dzZZZFpINGdtWDJtN01BaEFQaVQ5UExXSEN6MG1QOGZNamtTMFY1?=
 =?utf-8?B?Zm5GamQrRDJ3cTZXNHo3QnRHRXd3eWhZdU5oMlFMUEp5KzhTSmJVNm5YZlcy?=
 =?utf-8?B?R3FCTVNTbmhJU3BMU0xZVTRYWWJoNlJTWUVBQTRTWEtWaGVZWjMrOVU0c3VR?=
 =?utf-8?B?dkNtK2grVVF5ZUdTcGJyelFWTzVnbFg3L0ZaN0tqWUdpcjJCdTlSNkg3RFdj?=
 =?utf-8?B?eGUxUU8rS0hyL1hZM1ltWHhLMzJFZlllM0M1aUNOd1psSUkrMkYxWTU2QzVr?=
 =?utf-8?B?QWdTaVh2QzloRVZuOUlJb0dhZWJUcW05Rm1nTXh2ZnNXTFFvaWdNK0cydGJa?=
 =?utf-8?B?Mmlua1Y1aXJOUTE0MFJoblFhTXpETGtZQWxPS1BvSkR2dkFiTWZ2RDZzNHEy?=
 =?utf-8?B?YzZPVGVWS1J1cGZKQ2VMTERBa0x0NFNIRlhuODJCNFBwcFh4TkpMc0tYUzlZ?=
 =?utf-8?B?ZmFYWmZYZmg3RmNRenpqNXpzOFFWcjEzUlpEMlg4K1VPOXFFUkdNbG9KRHRH?=
 =?utf-8?B?MXhpR1hGZ1d2T0dvTG03ZVQ5MEtOMkhROVBhY0YyRUFwcHFJOFRJNmhGVUlv?=
 =?utf-8?B?NHFqaHpTZkJaOE8xalFCelV0eG84Rkt4eXJralp1bnBHMncvdzJqR0ZyWEt0?=
 =?utf-8?B?R3dpdytlZGE2K09XMU54NEJyME9OVjVGbXpmZk5IZWxHcnFsMlFVazVMbXFk?=
 =?utf-8?B?ZFhaQkdwakxORTRvaTEvV3hwRW5EWWVPeEhSdHloMnIrY2VibDZOQmMwNlEw?=
 =?utf-8?B?RkovWlM1bWcycmhjT0hFWEVXSWM0Q3B1UnpPOUZuTXR1Z2VYb21JOXVYZUlo?=
 =?utf-8?B?MnlpVVozdHhBK0JQeWZZZ1VFOTdVV05jdVJyaUN4VzJ2R3pPQkJtNnNUZDVr?=
 =?utf-8?B?VjNDUW0zcnQ1eVZZQktBcVZKeklYRXFGODE2Sjc4WHRhdHBNaUxjbG1TTFZv?=
 =?utf-8?B?Vk16VWI5eFJkOVlVQ3hUNk42ekJ2VWFvT3d5VnU4WXlxYVBUT0kzNkFiQytn?=
 =?utf-8?B?VmNGb210QXIxckw2MjBGQmRNV2crN25ZcWZYakN2M2xEVTZsVGpJQzdqOWJ0?=
 =?utf-8?Q?2go4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9166.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGZsb2kyUEtWZTdoTUNqbzI1VERrSzZmK0V2d091OGZJUDRrbWNPbHFhdHVv?=
 =?utf-8?B?NCtEdHNiTHp4Zlo0ZElyVDJNT3daNTAxZGgreDIvZFZlK1hXVW5Gc0lVR3dx?=
 =?utf-8?B?WENKaFRCUHFhd3RtM1dHS1E5ZHFUamZwSDNkUGNXeEhqZmlvaE1HSUJ6YVI4?=
 =?utf-8?B?dTFxVTZteFZQMUM1OVRXejdNUlNvV2xTWHpTOG5rMXFXTHRKSnpOaW1LZlZy?=
 =?utf-8?B?ZWN4aDhvOFVJWjBidGJ6V3RKVjFadjVUdmJka2Z5MVlZNCtEc1REM0NPRU8r?=
 =?utf-8?B?bjlWN0JjMms0S3NIMGdCbEZpdmpIMjJ3ZEsrRVlnZ2MxVFgyWldMbkxzYkY1?=
 =?utf-8?B?Sy9hK1FGMDlLYzdKQkpRNHN3YUhVSDVlOVJ0c2N2RE9QeFFKdmxJSDRSNU55?=
 =?utf-8?B?NUt6bEZIWjBVTldlUXI0QUhmZ3VPWUtGaWxUcTRkWWlzYnRPOHFOcEU5aS9X?=
 =?utf-8?B?VFA0VGtWRTFLREJtZW1HSzg3Tm5seEJvVnFCb3Uyc1JsMEZuQ05jZ3QzeEtB?=
 =?utf-8?B?Mlo3cCtrSDNWWVc3N2Y4ZXFIWkQwYS9TUTJXOTR2TTNIei9GYmNZYlhnSWFN?=
 =?utf-8?B?bi9sRFp3M1U4ZUp1bEh3WTY5UVJucGZTRmlmRDk3YUVrMEF5TFVmK003U0l5?=
 =?utf-8?B?VDMwUjBBdm9OVUxMSzdRVklKYlhTcjZzMzN2MmJxenI5Wm9zRElIUGhkYUVz?=
 =?utf-8?B?WkJyVGZZYlRhaTNEejZMWHdWYStVVGEvMEVpQmpBbUx4YjZBUU5oMlNxbWlT?=
 =?utf-8?B?Zkc1NVlQU2JCN1JIRjMxcGkwUFF2S3pVVHBKbUluejRxMVlSWWdlRkx3UU1P?=
 =?utf-8?B?ME5CT0JJQVcrekhmbHN4dk4vTHplY1M0YTdvWWd3N2lsNi9lcHlLdkhhTmZu?=
 =?utf-8?B?UTVLY2htaXZBZnVDRC96VWlUWTBIamkzSVdBS2QwMTlaNWk4UDhycUtRV05N?=
 =?utf-8?B?UWRhbFlNcmJOODhmajZ2cWVmLzF6WTBYbXBlVEJ3Y3Q0anVZZmp3MkdsL1p1?=
 =?utf-8?B?dWZtdHR4dWRJcjJ4dk9XbDBielA0dWt5YTdVYU5VOUI3NWFmd3VDVVlwQ2xa?=
 =?utf-8?B?c0U4dndmSFl6MlVITytERndTUjk5WWRrNUlKOHBJNEJFVmRxc0cyWDRka0JY?=
 =?utf-8?B?T2U3S2NqZDl1QmduTTEzQ0M5WmozUm5jR1pmQmlpV1NTcmpncThOU3hIRUpo?=
 =?utf-8?B?UUtmMWRGTFRBSlhQaU5wVkFuYmJHazBELytWQ0R4V1NpbHpjY3dsQy9RZzEw?=
 =?utf-8?B?SUVubDBPMFhuSUJOcFM4eGZqeDBTU0VranMwTFlUK0tBSlVaVEN2K3BzY0lM?=
 =?utf-8?B?TkV6MHoyckd5ZERtYXZMYzJPLysxbXdRYjJVQjI1aEk5aDIwV0xQeWYrdUd1?=
 =?utf-8?B?cXlBUnFCOU1tOHhXVGZMUm5YRmhBbmlwNTJkVnBCbzliNG9mQ0I5ZUVNUjRr?=
 =?utf-8?B?bjFxcVFLQndkc25OMS9XMUpiYkdIdEpQZW1vWGY3ZE5tNG5kSjZ1ODJjV1dl?=
 =?utf-8?B?Z0tZNExJQm1kQWMvWk1EN1UzendQeFZTYVZjbno3emRZK1I2eUg0T1ZBLzVQ?=
 =?utf-8?B?S200TlFJbGRnRnpxMTErZVVTQlR1bmRBTnVwUnpvZ2kySmxseDJiRnFCUDVw?=
 =?utf-8?B?K1BWczlkbDFKV2RHekRKRnpBV3RQdU1lTkQzM0VkRE9DQkcrWkxjaEl6WTIz?=
 =?utf-8?B?eXgwLzNZdFhnQjhLYmU0QVRzYzMrNlFNem1rYzlTN0M2VXhpVTFUaVNvcW9S?=
 =?utf-8?B?TGNWTjBEaGpIWGJSNlpYQ054dkF2S05CZmZsVjlrYjF4c2c1SjBIRGpXRG9u?=
 =?utf-8?B?TkhsYWdKWWtVd0o0dlpBeHY2a0d5UTdCYkhOZkVZSllxeEczaUNJNGhwbndo?=
 =?utf-8?B?dzRHTXhkNmhKeVV6R1RTTDJ2M3FTWUsxbjQ1VmR0WVhIcWVRNWZlQ0lxN3VM?=
 =?utf-8?B?TzF5bkpvUTM2TDNNVDJkYlJEMGlrMUU3a0dJYWtGVlgwSFRjTjZXZGlheTJo?=
 =?utf-8?B?RTZ3ZExnSm5ybWRURHpPRjVBc3RjR0hwaERWVjdIWjZRZW5sb1lIVEExdk5a?=
 =?utf-8?B?UUJuYmFNTFlvRlYvTU80ajIvaTJ5RVI4M3NCZUFoTDREd2s4TGhKcGxYbkQ2?=
 =?utf-8?B?SU84MllEaWgraG1zUWFLSVRNVkdVWG5MNm10azN1K1EvZjMyQTlrMVNUQVpK?=
 =?utf-8?B?VUg1a2FkQ3pLYVhFWng1clNjdlZXNno2c1dwUDFCRFV3SitZSmZpWTNoSHBW?=
 =?utf-8?B?ellJT3RaaWZGS3RiZDlBMllWMFVFYkE3VmpIbWJVcVhsVVpKMGtmL09ZM09a?=
 =?utf-8?B?bytoZUtRSTBkWWhMMklQNW9iZ0tQTHpWWU5wdllhcDZxbTV1N2xyellVVEdx?=
 =?utf-8?Q?fLUR1H+siUcwjhrqW2UbdqDszrgzADDcXJvWviBOTtkGM?=
X-MS-Exchange-AntiSpam-MessageData-1: PUkQaATG7rxNEw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1201eb7b-19e6-4c7e-7f86-08de62dd4989
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9166.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 04:32:49.8787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4LDaSTfFK8y180M9zbgsExyqpeYKXyfyEMPuwrXY/eG0wYPQZm7rLlP0l3EmcFlV/CjQz95pNlKpz0wCaB2/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7707

On Monday, February 2, 2026 5:24=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 2 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:06 Mik=
ko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Monday, February 2, 2026 3:37=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D0=BF=D0=BD, 2 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 06:07=
 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Friday, January 23, 2026 12:11=E2=80=AFAM Svyatoslav Ryhel wrote=
:
> > > > > Add support for HSIC USB mode, which can be set for second USB co=
ntroller
> > > > > and PHY on Tegra SoC along with already supported UTMI or ULPI.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/usb/phy/phy-tegra-usb.c   | 249 ++++++++++++++++++++++++=
++++--
> > > > >  include/linux/usb/tegra_usb_phy.h |   5 +
> > > > >  2 files changed, 243 insertions(+), 11 deletions(-)
> > > > >
> > > > > diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/ph=
y-tegra-usb.c
> > > > > index afa5b5535f92..4f0fde33647e 100644
> > > > > --- a/drivers/usb/phy/phy-tegra-usb.c
> > > > > +++ b/drivers/usb/phy/phy-tegra-usb.c
> > > > > @@ -29,17 +29,26 @@
> > > > >  #include <linux/usb/tegra_usb_phy.h>
> > > > >  #include <linux/usb/ulpi.h>
> > > > >
> > > > > +#define USB_TXFILLTUNING                     0x154
> > > > > +#define USB_FIFO_TXFILL_THRES(x)             (((x) & 0x1f) << 16=
)
> > > > > +#define USB_FIFO_TXFILL_MASK                 0x1f0000
> > > > > +
> > > > >  #define ULPI_VIEWPORT                                0x170
> > > > >
> > > > >  /* PORTSC PTS/PHCD bits, Tegra20 only */
> > > > >  #define TEGRA_USB_PORTSC1                    0x184
> > > > > -#define TEGRA_USB_PORTSC1_PTS(x)             (((x) & 0x3) << 30)
> > > > > -#define TEGRA_USB_PORTSC1_PHCD                       BIT(23)
> > > > > +#define   TEGRA_USB_PORTSC1_PTS(x)           (((x) & 0x3) << 30)
> > > > > +#define   TEGRA_USB_PORTSC1_PHCD             BIT(23)
> > > > > +#define   TEGRA_USB_PORTSC1_WKOC             BIT(22)
> > > > > +#define   TEGRA_USB_PORTSC1_WKDS             BIT(21)
> > > > > +#define   TEGRA_USB_PORTSC1_WKCN             BIT(20)
> > > > >
> > > > >  /* HOSTPC1 PTS/PHCD bits, Tegra30 and above */
> > > > > +#define TEGRA30_USB_PORTSC1                  0x174
> > > > >  #define TEGRA_USB_HOSTPC1_DEVLC                      0x1b4
> > > > > -#define TEGRA_USB_HOSTPC1_DEVLC_PTS(x)               (((x) & 0x7=
) << 29)
> > > > > -#define TEGRA_USB_HOSTPC1_DEVLC_PHCD         BIT(22)
> > > > > +#define   TEGRA_USB_HOSTPC1_DEVLC_PTS(x)     (((x) & 0x7) << 29)
> > > > > +#define   TEGRA_USB_HOSTPC1_DEVLC_PHCD               BIT(22)
> > > > > +#define   TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC   BIT(2)
> > > >
> > > > PTS is an enumeration, not a bitfield, so I would say '4' instead o=
f 'BIT(2)'
> > > >
> > >
> > > Noted
> > >
> > > > >
> > > > >  /* Bits of PORTSC1, which will get cleared by writing 1 into the=
m */
> > > > >  #define TEGRA_PORTSC1_RWC_BITS       (PORT_CSC | PORT_PEC | PORT=
_OCC)
> > > > > @@ -51,11 +60,12 @@
> > > > >  #define   USB_SUSP_CLR                               BIT(5)
> > > > >  #define   USB_PHY_CLK_VALID                  BIT(7)
> > > > >  #define   UTMIP_RESET                                BIT(11)
> > > > > -#define   UHSIC_RESET                                BIT(11)
> > > > >  #define   UTMIP_PHY_ENABLE                   BIT(12)
> > > > >  #define   ULPI_PHY_ENABLE                    BIT(13)
> > > > >  #define   USB_SUSP_SET                               BIT(14)
> > > > > +#define   UHSIC_RESET                                BIT(14)
> > > > >  #define   USB_WAKEUP_DEBOUNCE_COUNT(x)               (((x) & 0x7=
) << 16)
> > > > > +#define   UHSIC_PHY_ENABLE                   BIT(19)
> > > > >
> > > > >  #define USB_PHY_VBUS_SENSORS                 0x404
> > > > >  #define   B_SESS_VLD_WAKEUP_EN                       BIT(14)
> > > > > @@ -156,6 +166,58 @@
> > > > >  #define UTMIP_BIAS_CFG1                              0x83c
> > > > >  #define   UTMIP_BIAS_PDTRK_COUNT(x)          (((x) & 0x1f) << 3)
> > > > >
> > > > > +/*
> > > > > + * Tegra20 has no UTMIP registers on PHY2 and UHSIC registers st=
art from 0x800
> > > > > + * just where UTMIP registers should have been. This is the case=
 only with Tegra20
> > > > > + * Tegra30+ have UTMIP registers at 0x800 and UHSIC registers sh=
ifter by 0x400
> > > >
> > > > 'shift', or 'are shifted'
> > > >
> > >
> > > Noted
> > >
> > > > > + * to 0xc00, but register layout is preserved.
> > > > > + */
> > > > > +#define UHSIC_PLL_CFG1                               0x804
> > > > > +#define   UHSIC_XTAL_FREQ_COUNT(x)           (((x) & 0xfff) << 0=
)
> > > > > +#define   UHSIC_PLLU_ENABLE_DLY_COUNT(x)     (((x) & 0x1f) << 14=
)
> > > > > +
> > > > > +#define UHSIC_HSRX_CFG0                              0x808
> > > > > +#define   UHSIC_ELASTIC_UNDERRUN_LIMIT(x)    (((x) & 0x1f) << 2)
> > > > > +#define   UHSIC_ELASTIC_OVERRUN_LIMIT(x)     (((x) & 0x1f) << 8)
> > > > > +#define   UHSIC_IDLE_WAIT(x)                 (((x) & 0x1f) << 13=
)
> > > > > +
> > > > > +#define UHSIC_HSRX_CFG1                              0x80c
> > > > > +#define   UHSIC_HS_SYNC_START_DLY(x)         (((x) & 0x1f) << 1)
> > > > > +
> > > > > +#define UHSIC_TX_CFG0                                0x810
> > > > > +#define   UHSIC_HS_READY_WAIT_FOR_VALID              BIT(9)
> > > > > +
> > > > > +#define UHSIC_MISC_CFG0                              0x814
> > > > > +#define   UHSIC_SUSPEND_EXIT_ON_EDGE         BIT(7)
> > > > > +#define   UHSIC_DETECT_SHORT_CONNECT         BIT(8)
> > > > > +#define   UHSIC_FORCE_XCVR_MODE                      BIT(15)
> > > > > +#define   UHSIC_DISABLE_BUSRESET             BIT(20)
> > > > > +
> > > > > +#define UHSIC_MISC_CFG1                              0x818
> > > > > +#define   UHSIC_PLLU_STABLE_COUNT(x)         (((x) & 0xfff) << 2=
)
> > > > > +
> > > > > +#define UHSIC_PADS_CFG0                              0x81c
> > > > > +#define   UHSIC_TX_RTUNEN                    0xf000
> > > > > +#define   UHSIC_TX_RTUNE(x)                  (((x) & 0xf) << 12)
> > > > > +
> > > > > +#define UHSIC_PADS_CFG1                              0x820
> > > > > +#define   UHSIC_PD_BG                                BIT(2)
> > > > > +#define   UHSIC_PD_TX                                BIT(3)
> > > > > +#define   UHSIC_PD_TRK                               BIT(4)
> > > > > +#define   UHSIC_PD_RX                                BIT(5)
> > > > > +#define   UHSIC_PD_ZI                                BIT(6)
> > > > > +#define   UHSIC_RX_SEL                               BIT(7)
> > > > > +#define   UHSIC_RPD_DATA                     BIT(9)
> > > > > +#define   UHSIC_RPD_STROBE                   BIT(10)
> > > > > +#define   UHSIC_RPU_DATA                     BIT(11)
> > > > > +#define   UHSIC_RPU_STROBE                   BIT(12)
> > > > > +
> > > > > +#define UHSIC_CMD_CFG0                               0x824
> > > > > +#define   UHSIC_PRETEND_CONNECT_DETECT               BIT(5)
> > > > > +
> > > > > +#define UHSIC_STAT_CFG0                              0x828
> > > > > +#define   UHSIC_CONNECT_DETECT                       BIT(0)
> > > > > +
> > > > >  /* For Tegra30 and above only, the address is different in Tegra=
20 */
> > > > >  #define USB_USBMODE                          0x1f8
> > > > >  #define   USB_USBMODE_MASK                   (3 << 0)
> > > > > @@ -174,7 +236,8 @@ struct tegra_xtal_freq {
> > > > >       u8 enable_delay;
> > > > >       u8 stable_count;
> > > > >       u8 active_delay;
> > > > > -     u8 xtal_freq_count;
> > > > > +     u8 utmi_xtal_freq_count;
> > > > > +     u16 hsic_xtal_freq_count;
> > > > >       u16 debounce;
> > > > >  };
> > > > >
> > > > > @@ -184,7 +247,8 @@ static const struct tegra_xtal_freq tegra_fre=
q_table[] =3D {
> > > > >               .enable_delay =3D 0x02,
> > > > >               .stable_count =3D 0x2F,
> > > > >               .active_delay =3D 0x04,
> > > > > -             .xtal_freq_count =3D 0x76,
> > > > > +             .utmi_xtal_freq_count =3D 0x76,
> > > > > +             .hsic_xtal_freq_count =3D 0x1CA,
> > > > >               .debounce =3D 0x7530,
> > > > >       },
> > > > >       {
> > > > > @@ -192,7 +256,8 @@ static const struct tegra_xtal_freq tegra_fre=
q_table[] =3D {
> > > > >               .enable_delay =3D 0x02,
> > > > >               .stable_count =3D 0x33,
> > > > >               .active_delay =3D 0x05,
> > > > > -             .xtal_freq_count =3D 0x7F,
> > > > > +             .utmi_xtal_freq_count =3D 0x7F,
> > > > > +             .hsic_xtal_freq_count =3D 0x1F0,
> > > > >               .debounce =3D 0x7EF4,
> > > > >       },
> > > > >       {
> > > > > @@ -200,7 +265,8 @@ static const struct tegra_xtal_freq tegra_fre=
q_table[] =3D {
> > > > >               .enable_delay =3D 0x03,
> > > > >               .stable_count =3D 0x4B,
> > > > >               .active_delay =3D 0x06,
> > > > > -             .xtal_freq_count =3D 0xBB,
> > > > > +             .utmi_xtal_freq_count =3D 0xBB,
> > > > > +             .hsic_xtal_freq_count =3D 0x2DD,
> > > > >               .debounce =3D 0xBB80,
> > > > >       },
> > > > >       {
> > > > > @@ -208,7 +274,8 @@ static const struct tegra_xtal_freq tegra_fre=
q_table[] =3D {
> > > > >               .enable_delay =3D 0x04,
> > > > >               .stable_count =3D 0x66,
> > > > >               .active_delay =3D 0x09,
> > > > > -             .xtal_freq_count =3D 0xFE,
> > > > > +             .utmi_xtal_freq_count =3D 0xFE,
> > > > > +             .hsic_xtal_freq_count =3D 0x3E0,
> > > > >               .debounce =3D 0xFDE8,
> > > > >       },
> > > > >  };
> > > > > @@ -541,7 +608,7 @@ static int utmi_phy_power_on(struct tegra_usb=
_phy *phy)
> > > > >               val =3D readl_relaxed(base + UTMIP_PLL_CFG1);
> > > > >               val &=3D ~(UTMIP_XTAL_FREQ_COUNT(~0) |
> > > > >                       UTMIP_PLLU_ENABLE_DLY_COUNT(~0));
> > > > > -             val |=3D UTMIP_XTAL_FREQ_COUNT(phy->freq->xtal_freq=
_count) |
> > > > > +             val |=3D UTMIP_XTAL_FREQ_COUNT(phy->freq->utmi_xtal=
_freq_count) |
> > > > >                       UTMIP_PLLU_ENABLE_DLY_COUNT(phy->freq->enab=
le_delay);
> > > > >               writel_relaxed(val, base + UTMIP_PLL_CFG1);
> > > > >       }
> > > > > @@ -812,6 +879,153 @@ static int ulpi_phy_power_off(struct tegra_=
usb_phy *phy)
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > +static u32 tegra_hsic_readl(struct tegra_usb_phy *phy, u32 reg)
> > > > > +{
> > > > > +     void __iomem *base =3D phy->regs;
> > > > > +     u32 shift =3D phy->soc_config->uhsic_registers_shift;
> > > > > +
> > > > > +     return readl_relaxed(base + shift + reg);
> > > > > +}
> > > > > +
> > > > > +static void tegra_hsic_writel(struct tegra_usb_phy *phy, u32 reg=
, u32 value)
> > > > > +{
> > > > > +     void __iomem *base =3D phy->regs;
> > > > > +     u32 shift =3D phy->soc_config->uhsic_registers_shift;
> > > > > +
> > > > > +     writel_relaxed(value, base + shift + reg);
> > > > > +}
> > > > > +
> > > > > +static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
> > > > > +{
> > > > > +     struct tegra_utmip_config *config =3D phy->config;
> > > > > +     void __iomem *base =3D phy->regs;
> > > > > +     u32 val;
> > > > > +
> > > > > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
> > > > > +     val &=3D ~(UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC=
_PD_RX |
> > > > > +              UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
> > > > > +     val |=3D UHSIC_RX_SEL;
> > > >
> > > > L4T r16 (Tegra30) keeps UHSIC_PD_TX set until after UHSIC_RESET has=
 been cleared. Commit message says this avoids a signal glitch.
> > > >
> > >
> > > I did not notice any difference with this change and without. Since i=
t
> > > does not affect detection of modem by my device I can apply it (is it
> > > worth applying at all?). Should it be applied globally or for Tegra30=
+
> > > only?
> >
> > Downstream only has it for Tegra30, but that's probably just because it=
 was tested in the Tegra30 timeframe. If it's not causing any issue on Tegr=
a20 I would apply it globally. Considering it's a signal glitch it might on=
ly have an effect in marginal signal situations.
> >
> > >
> > > > > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
> > > > > +
> > > > > +     udelay(2);
> > > > > +
> > > > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > > > +     val |=3D UHSIC_RESET;
> > > > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > > > +
> > > > > +     udelay(30);
> > > > > +
> > > > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > > > +     val |=3D UHSIC_PHY_ENABLE;
> > > > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > > > +
> > > > > +     val =3D tegra_hsic_readl(phy, UHSIC_HSRX_CFG0);
> > > > > +     val &=3D ~(UHSIC_IDLE_WAIT(~0) |
> > > > > +              UHSIC_ELASTIC_UNDERRUN_LIMIT(~0) |
> > > > > +              UHSIC_ELASTIC_OVERRUN_LIMIT(~0));
> > > > > +     val |=3D UHSIC_IDLE_WAIT(config->idle_wait_delay) |
> > > > > +             UHSIC_ELASTIC_UNDERRUN_LIMIT(config->elastic_limit)=
 |
> > > > > +             UHSIC_ELASTIC_OVERRUN_LIMIT(config->elastic_limit);
> > > > > +     tegra_hsic_writel(phy, UHSIC_HSRX_CFG0, val);
> > > > > +
> > > > > +     val =3D tegra_hsic_readl(phy, UHSIC_HSRX_CFG1);
> > > > > +     val &=3D ~UHSIC_HS_SYNC_START_DLY(~0);
> > > > > +     val |=3D UHSIC_HS_SYNC_START_DLY(config->hssync_start_delay=
);
> > > > > +     tegra_hsic_writel(phy, UHSIC_HSRX_CFG1, val);
> > > > > +
> > > >
> > > > L4T r16 (Tegra30) clears UHSIC_TX_CFG0.UHSIC_HS_READY_WAIT_FOR_VALI=
D here. According to commit message this fixes an intermittent failure to c=
onnect to HSIC modem. It also sets UHSIC_MISC_CFG0.UHSIC_DISABLE_BUSRESET  =
below due to same issue.
> > > >
> > >
> > > And this change causes my modem to fail entirely.
> > >
> > > [   10.145976] usb 1-1: new high-speed USB device number 2 using ci_h=
drc
> > > [   10.295970] usb 1-1: device descriptor read/64, error -71
> > > [   10.545975] usb 1-1: device descriptor read/64, error -71
> > > [   10.795990] usb 1-1: new high-speed USB device number 3 using ci_h=
drc
> > > [   10.935970] usb 1-1: device descriptor read/64, error -71
> > > [   11.185977] usb 1-1: device descriptor read/64, error -71
> > >
> > > I assume UHSIC_DISABLE_BUSRESET, UHSIC_HS_READY_WAIT_FOR_VALID and
> > > UHSIC_PD_TX workarounds are all consequences of how modem in
> > > downstream kernel is called. Instead of relaying on modem to lead the
> > > controller probe, downstream just brutally removes and reinits
> > > controller until modem probes. I have never observed modem not
> > > appearing without any of discussed patches.
> >
> > The downstream commit says that without this workaround, the modem woul=
d sometimes not come up in stress tests. So I think it's possible there is =
still a rare hardware bug that this is working around, but perhaps we're mi=
ssing some other part and that's why it's not working. I think it's fine to=
 drop these changes.
> >
>=20
> I propose not adding any of the three workarounds for now. I don't
> have a Tegra20 with an HSIC modem, as it seems that most Tegra20
> devices use ULPI mode. Among my personal devices, only the LG Optimus
> Vu (P895) is a GSM device with an XMM HSIC modem, and it fails if I
> add UHSIC_DISABLE_BUSRESET and UHSIC_HS_READY_WAIT_FOR_VALID. Since I
> may be the only one at the moment actively working in this area of
> legacy Tegra SoCs =E2=80=94 and this discussion is public =E2=80=94 anyon=
e who has
> issues can contact me to resolve them. Additionally, I will keep in
> mind that there may be a need for these workarounds; if I find any
> need for them during modem bring-ups in the legacy Tegra community, I
> will submit dedicated patches with explanations.

Sure, that sounds fine.

Mikko

>=20
> > >
> > >
> > > > > +     val =3D tegra_hsic_readl(phy, UHSIC_MISC_CFG0);
> > > > > +     val |=3D UHSIC_SUSPEND_EXIT_ON_EDGE;
> > > > > +     tegra_hsic_writel(phy, UHSIC_MISC_CFG0, val);
> > > > > +
> > > > > +     val =3D tegra_hsic_readl(phy, UHSIC_MISC_CFG1);
> > > > > +     val &=3D ~UHSIC_PLLU_STABLE_COUNT(~0);
> > > > > +     val |=3D UHSIC_PLLU_STABLE_COUNT(phy->freq->stable_count);
> > > > > +     tegra_hsic_writel(phy, UHSIC_MISC_CFG1, val);
> > > > > +
> > > > > +     val =3D tegra_hsic_readl(phy, UHSIC_PLL_CFG1);
> > > > > +     val &=3D ~(UHSIC_XTAL_FREQ_COUNT(~0) |
> > > > > +             UHSIC_PLLU_ENABLE_DLY_COUNT(~0));
> > > > > +     val |=3D UHSIC_XTAL_FREQ_COUNT(phy->freq->hsic_xtal_freq_co=
unt) |
> > > > > +             UHSIC_PLLU_ENABLE_DLY_COUNT(phy->freq->enable_delay=
);
> > > > > +     tegra_hsic_writel(phy, UHSIC_PLL_CFG1, val);
> > > > > +
> > > > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > > > +     val &=3D ~UHSIC_RESET;
> > > > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > > > +
> > > > > +     udelay(2);
> > > > > +
> > > > > +     if (phy->soc_config->requires_usbmode_setup) {
> > > > > +             val =3D readl_relaxed(base + USB_USBMODE);
> > > > > +             val &=3D ~USB_USBMODE_MASK;
> > > > > +             if (phy->mode =3D=3D USB_DR_MODE_HOST)
> > > > > +                     val |=3D USB_USBMODE_HOST;
> > > > > +             else
> > > > > +                     val |=3D USB_USBMODE_DEVICE;
> > > > > +             writel_relaxed(val, base + USB_USBMODE);
> > > > > +     }
> > > > > +
> > > > > +     if (phy->soc_config->has_hostpc)
> > > > > +             set_pts(phy, TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC);
> > > > > +     else
> > > > > +             set_pts(phy, 0);
> > > >
> > > > This (and below) are abusing has_hostpc to detect Tegra30 vs Tegra2=
0. We should instead add soc_config fields hsic_pts_value and portsc1_offse=
t.
> > > >
> > > > > +
> > > > > +     val =3D readl_relaxed(base + USB_TXFILLTUNING);
> > > > > +     if ((val & USB_FIFO_TXFILL_MASK) !=3D USB_FIFO_TXFILL_THRES=
(0x10)) {
> > > > > +             val =3D USB_FIFO_TXFILL_THRES(0x10);
> > > > > +             writel_relaxed(val, base + USB_TXFILLTUNING);
> > > > > +     }
> > > > > +
> > > > > +     if (phy->soc_config->has_hostpc) {
> > > > > +             val =3D readl_relaxed(base + TEGRA30_USB_PORTSC1);
> > > > > +             val &=3D ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTS=
C1_WKDS |
> > > > > +                      TEGRA_USB_PORTSC1_WKCN);
> > > > > +             writel_relaxed(val, base + TEGRA30_USB_PORTSC1);
> > > > > +     } else {
> > > > > +             val =3D readl_relaxed(base + TEGRA_USB_PORTSC1);
> > > > > +             val &=3D ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTS=
C1_WKDS |
> > > > > +                      TEGRA_USB_PORTSC1_WKCN);
> > > > > +             writel_relaxed(val, base + TEGRA_USB_PORTSC1);
> > > > > +     }
> > > > > +
> > > > > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG0);
> > > > > +     val &=3D ~UHSIC_TX_RTUNEN;
> > > > > +     val |=3D UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
> > > > > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
> > > > > +
> > > > > +     if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VA=
LID,
> > > > > +                            USB_PHY_CLK_VALID))
> > > > > +             dev_err(phy->u_phy.dev,
> > > > > +                     "Timeout waiting for PHY to stabilize on en=
able (HSIC)\n");
> > > >
> > > > Should return error (return value of utmi_wait_register) here?
> > > >
> > >
> > > Noted.
> > >
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static int uhsic_phy_power_off(struct tegra_usb_phy *phy)
> > > > > +{
> > > > > +     void __iomem *base =3D phy->regs;
> > > > > +     u32 val;
> > > > > +
> > > > > +     set_phcd(phy, true);
> > > > > +
> > > > > +     val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
> > > > > +     val |=3D (UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_=
PD_RX |
> > > > > +             UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
> > > > > +     tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
> > > > > +
> > > > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > > > +     val |=3D UHSIC_RESET;
> > > > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > > > +
> > > > > +     udelay(30);
> > > > > +
> > > > > +     val =3D readl_relaxed(base + USB_SUSP_CTRL);
> > > > > +     val &=3D ~UHSIC_PHY_ENABLE;
> > > > > +     writel_relaxed(val, base + USB_SUSP_CTRL);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > >  static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
> > > > >  {
> > > > >       int err =3D 0;
> > > > > @@ -828,6 +1042,10 @@ static int tegra_usb_phy_power_on(struct te=
gra_usb_phy *phy)
> > > > >               err =3D ulpi_phy_power_on(phy);
> > > > >               break;
> > > > >
> > > > > +     case USBPHY_INTERFACE_MODE_HSIC:
> > > > > +             err =3D uhsic_phy_power_on(phy);
> > > > > +             break;
> > > > > +
> > > > >       default:
> > > > >               break;
> > > > >       }
> > > > > @@ -859,6 +1077,10 @@ static int tegra_usb_phy_power_off(struct t=
egra_usb_phy *phy)
> > > > >               err =3D ulpi_phy_power_off(phy);
> > > > >               break;
> > > > >
> > > > > +     case USBPHY_INTERFACE_MODE_HSIC:
> > > > > +             err =3D uhsic_phy_power_off(phy);
> > > > > +             break;
> > > > > +
> > > > >       default:
> > > > >               break;
> > > > >       }
> > > > > @@ -1256,6 +1478,8 @@ static const struct tegra_phy_soc_config te=
gra20_soc_config =3D {
> > > > >       .requires_usbmode_setup =3D false,
> > > > >       .requires_extra_tuning_parameters =3D false,
> > > > >       .requires_pmc_ao_power_up =3D false,
> > > > > +     .uhsic_registers_shift =3D 0,
> > > > > +     .uhsic_tx_rtune =3D 0, /* 40 ohm */
> > > > >  };
> > > > >
> > > > >  static const struct tegra_phy_soc_config tegra30_soc_config =3D =
{
> > > > > @@ -1264,6 +1488,8 @@ static const struct tegra_phy_soc_config te=
gra30_soc_config =3D {
> > > > >       .requires_usbmode_setup =3D true,
> > > > >       .requires_extra_tuning_parameters =3D true,
> > > > >       .requires_pmc_ao_power_up =3D true,
> > > > > +     .uhsic_registers_shift =3D 0x400,
> > > > > +     .uhsic_tx_rtune =3D 8,  /* 50 ohm */
> > > > >  };
> > > > >
> > > > >  static const struct of_device_id tegra_usb_phy_id_table[] =3D {
> > > > > @@ -1360,6 +1586,7 @@ static int tegra_usb_phy_probe(struct platf=
orm_device *pdev)
> > > > >       tegra_phy->phy_type =3D of_usb_get_phy_mode(np);
> > > > >       switch (tegra_phy->phy_type) {
> > > > >       case USBPHY_INTERFACE_MODE_UTMI:
> > > > > +     case USBPHY_INTERFACE_MODE_HSIC:
> > > > >               err =3D utmi_phy_probe(tegra_phy, pdev);
> > > > >               if (err)
> > > > >                       return err;
> > > > > diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/us=
b/tegra_usb_phy.h
> > > > > index e394f4880b7e..4e79f1c2173a 100644
> > > > > --- a/include/linux/usb/tegra_usb_phy.h
> > > > > +++ b/include/linux/usb/tegra_usb_phy.h
> > > > > @@ -24,6 +24,9 @@ struct gpio_desc;
> > > > >   * requires_extra_tuning_parameters: true if xcvr_hsslew, hssque=
lch_level
> > > > >   *      and hsdiscon_level should be set for adequate signal qua=
lity
> > > > >   * requires_pmc_ao_power_up: true if USB AO is powered down by d=
efault
> > > > > + * uhsic_registers_shift: for Tegra30+ where HSIC registers were=
 shifted
> > > > > + *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMI=
P on PHY2
> > > > > + * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NM=
OS/PMOS driver
> > > > >   */
> > > > >
> > > > >  struct tegra_phy_soc_config {
> > > > > @@ -32,6 +35,8 @@ struct tegra_phy_soc_config {
> > > > >       bool requires_usbmode_setup;
> > > > >       bool requires_extra_tuning_parameters;
> > > > >       bool requires_pmc_ao_power_up;
> > > > > +     u32 uhsic_registers_shift;
> > > >
> > > > I would rather call this 'uhsic_registers_offset'. Shift first brin=
gs to mind bitshifts, and we often have fields in these config structs for =
bit shifts called '*_shift'.
> > > >
> > >
> > > Yes, offset seems more appropriate.
> > >
> > > > > +     u32 uhsic_tx_rtune;
> > > > >  };
> > > > >
> > > > >  struct tegra_utmip_config {
> > > > >
> > >
> > > Mikko, thank you for your review, since HSIC patches already were
> > > picked into linux/next I will prepare a few followup patches to
> > > address some of uncertainties.
> >
> > Thank you!
> >
> >
> >




