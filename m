Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832DC4502F;
	Fri, 19 Dec 2025 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766141984; cv=fail; b=Grbp/kJYfKz24iuuPZQO8P6lNVsv0Ej1ZEalsINcQrKuCUqaMOyZNQshtUqq74mTV1Jz10v88es+Og99Hz3h6ND3HmCwVpIvdcrHntNAq5XPcLu9GTgq3rnGwU3ims6IIZtbvC6Z0OjID3bpEbngEiG41cBSEq2paR2OvPvmcY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766141984; c=relaxed/simple;
	bh=Bh+ip+1IzGvD33zGqNg2e2FziyETzD3KQsbEJKrXXcw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AooeudzwGbGjgLYqRqUaxMIX6Z0iB85qJy1eUyREyqYUmuyY3oxFgQEgxmE7RkAdudq22ldgLp14Wfi9gdi/4/KrvipZzRiqlu53xoAyFJaOGLsNd4H3uY1DXOtmn1oGOjjhs0Azh2fUzxHRsgcQ4j76Wr7aKJgCFIH5WK5wTM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WqEOTRIM; arc=fail smtp.client-ip=52.101.48.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WqEOTRIM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FT6rgt7388sEwDd78HfDLyfyxqKHMDqRJ4gfKZ2BLZ32HMzcch0rYIeWTriY1HWTksM/BGY0aQAUoJVNYRWb1J5p/4poGsGpyGF5i9m8Q2McBcTxAeHYN4ixU106aq1/fV4wPSMXaPqgkaS4mE+w4WKrmlOvWtLBCm3j4y9ctQZT4F2ef1aLxEsM0Dx7XXzZxuUlwZoub8ieg7zaQHSCPrdsALn3OPvfCa0+04EbsfjrLmTVafUKKDByhlGLOZ7fmzgP4jYkLwbXsAMlY3PVs3cK/Wf3w5Q/lbN6U1G35AHhGI/brsOmW9C1MYtl1VRgZqC/Hzuv+R/zu5OmO4aLog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVGREEnA+q1IlC/5aWi1qT/vsaTLoyZXGw1GsKjDW38=;
 b=hRguJ99EE9FDFHorbgN8Dr4RVLwleOqjpB0VbxLfZ0rvgvMYdlfLA7rYmYyOpALAJVoob4dMwKnz5eYu+PSof0rOBpeiVItONCgtE5IjPYUwlrDQkqW+PsNRby324J5wbuIhb9mVejkzBluJAlz6o0pHGL+JUTBEHRj0tgtavBRnrLJN63GQK+1B+0D1voQfPlGXcLlrsf8HEVmprPZ52z7GBJLUd3SQzgKO49gLUEcjuCOqmLY0HXgxlaMad6Lu+s6EeDctfdEkFRjr6YrJ8odsUqHR0dZVaaDWAQDLejWAjLjzEzd1ROIp2sG4sjFs/3/VTB95aOJkn2B7f676Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVGREEnA+q1IlC/5aWi1qT/vsaTLoyZXGw1GsKjDW38=;
 b=WqEOTRIMXyFEtzt1zfsOaDDGpEvCpjMDoSugXHlTcY6JTuAlkIne9JYBhn5ifuaFGVOACvmG+5nKqtqqzL5B/4V6/35ol0u9vKzh4JiRtdYLYy3XpFlGV72i1anIcRJY8BAkMOjBjQ4CHRp8WUHS8bGOiPCGDaPimiMNlZ0rrnbUtipFGs6gkGIBRqZ3L/AY2GHQmxQN/1g85xa3fmU43zqYOxTVufiGG+zSsf18pXw+klZ0/+4Fkb0+tgbCmrKVUHLwh4W/6O26EtzJMArIY/rxdrFWLuZPR2gtnRAbgfk+06XA5qjsGd7rpbz6lqaiWJFgX5V0A0JyVe6yEeAPPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SN7PR12MB8129.namprd12.prod.outlook.com (2603:10b6:806:323::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 10:59:39 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 10:59:39 +0000
Message-ID: <0ed3d270-b0be-4431-8a46-a7eea29598f4@nvidia.com>
Date: Fri, 19 Dec 2025 10:59:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
To: Aaron Kling <webgeek1234@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251217104744.184153-1-jonathanh@nvidia.com>
 <CALHNRZ8syS6F9W1ovw2Y-jkspQafCnLy0ynocn0sMLurShHnbA@mail.gmail.com>
 <CALHNRZ_vkw6Ns=PMa+x0SY64+Ov0FeA5tMKJr+-tY9_OasKUog@mail.gmail.com>
 <aUPsDeFmxAJ09Tk7@orome>
 <CALHNRZ_vjSy+A8ZW7E1A4B5yQJ=GgvbNmafU7gjtGv-xjdfhPg@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ_vjSy+A8ZW7E1A4B5yQJ=GgvbNmafU7gjtGv-xjdfhPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::8) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SN7PR12MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: f939a178-8acd-4b72-9b51-08de3eedb47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFZ2S1o2TzNucmpJZHExYmJhRU9vc3g3bzFPRTdNUGhSVEtuZE1BaVRCSUIz?=
 =?utf-8?B?SXJSTkc3a2ljZzFwT3B6bFNjbytyNS9pTEVMU09DR2JjeGpIaWNIL3JEK3ho?=
 =?utf-8?B?T1diUU9nRzU1LzRWS1FXRTFhbU1hazFFQjV5NmZueHN5c3RtUFlMVzFPRzk1?=
 =?utf-8?B?aGROb0NLbGxLbkhBK2FDam1RM2k3ck41a2hBS2dZT0RuM1pDWkNFei9tT3lF?=
 =?utf-8?B?Nk5RRzhlai9remEzNTd4elpGU2orUXZYNUpSRWN3VThTUjBRRVNrUVdMbHdz?=
 =?utf-8?B?Rk1iZG5VZ0FuZVJtWmR6enNLaVFkREtHRllRZXVtTHFvZzNpTDFCeStScDR0?=
 =?utf-8?B?LzM2bVFjMW1ocXZEMW1HS1pjTFIyelVqN0hZdU5nTEZ4VFdRZHQ0R1NoZ0U0?=
 =?utf-8?B?WjlGYW1aTXpSNHRjUnpFaWVKS3p2eW1NTXpBRHI4aU5jS29wT0xtWXphUDJH?=
 =?utf-8?B?ekEvVWl4ckxpaEpLVnN1bzF2a08xa2VnVzNXdUNKUVY1VkhwWWF2cnZLOGU1?=
 =?utf-8?B?bDAwRlJUUHAraVMwTnJsREhqTFYrN3NRdk1Tc3lRWmp0QUcxQngwamcrWkU1?=
 =?utf-8?B?SUdqaExHOVc5WEpaRkp0VDdCY1BaS0t0dnlocFluTFpvZ293MnJYUDNvNHZx?=
 =?utf-8?B?NGw3bG03aklYUVJIdk9Sbkw4ME1hekxKYnRycW5WMDU5U2pkNG9MOVNQSWdI?=
 =?utf-8?B?OG9YckJFMmtJd2dxdWc1QjB0T2ZlejVPdVBUYS90OVFKbWVjSHJqdnFqTWhV?=
 =?utf-8?B?U2NZVVJYeFdJNFdGTStLby93V1RZMXB6L0FaeWtsTUJpcDk2cDJ4blNFREZH?=
 =?utf-8?B?M3RwbXdUWHBKMUtpcG9DdHJHK3BTbmtTY01KM0ZsSGJNQkRwa2g1anFUVlJ2?=
 =?utf-8?B?ZG1qL21mUFBxTVdtVFpBTjBwQU9TYUZOT1FLVTFSY0p6aFlpTkd0bnJVU1BW?=
 =?utf-8?B?c25VYjdna1BNM2o4REZKTS8vZTkrZjYxQTMyYnZvdFhPYVhvZFRpaXNnb3RT?=
 =?utf-8?B?MDRudXArYVducFBZOXRQOS9ZcWFFQjJGZ3ZydFNpYkVlVnJKRWluYmxIYS9a?=
 =?utf-8?B?WHE0ZVp4ekpKUVlxMXowVWx4NjNGQU9QUUEyVlgwSVZQSWp1aW50UndxMkhH?=
 =?utf-8?B?WmRPZjRSNXdLVmdNTHcwUlhIcm1QLzlycGx6aFVmNUZWaGtIS1JuZkRoaVJp?=
 =?utf-8?B?a2MrTGJwNXhIYTMveTNwZW5ldVFFVkNLRkl6WG5YQm5QREZ5b1crZC9lSVM1?=
 =?utf-8?B?Nkt4N1JTamtiY0Y0WG1jN1luV2ZBY01rOTZGalJiOWw1RUFVYkowNVppR09h?=
 =?utf-8?B?VUIweUYrenpnbXJkVFhVVkpTcXEwQkJiSXZnMGI2cjFZZi8wRTFaNFF1UEs3?=
 =?utf-8?B?TEJ0MldmSGt1TTRyR2daQW1FVkJEYllNUEs3QmlRUjFzMFk4MVlFaE1HdUdT?=
 =?utf-8?B?djVNcEZCeUpZSkgzeEFZUnN0NzhkMUxoVytxbmQrT2V0Tnl5Uy93SEQ3YnVS?=
 =?utf-8?B?b0NUakEyS1NFdVdXbExmc0hIV01MaHN5YktrSDUrcHhKWnVlUkxBR1hpY3R2?=
 =?utf-8?B?ZVN6aTNiTXNLU013TERKVldtK3VxcXB2ZjBrSm1FQ2xEdFhKZTR1Q2JDWU1M?=
 =?utf-8?B?dXlEL3ZmZjZFOGxOK2Z0c0JGT0M1aW9GaTMyQjhWdVlSaStybXVkdEU4MUlY?=
 =?utf-8?B?ZXlYTVFmZFB6cGdSWEpqUkd4RmlkanBKN0t0Ti9NUHRPK3JqNHNsRzRUWmpL?=
 =?utf-8?B?T0dLeFFXeDUyTE54QkVnM3dxQllEak5BaGR0eXBwQWV1VGtmcUwwVmhnQUlL?=
 =?utf-8?B?eDZRZERwQ3RnakRPU250anBaaVhHdG1KUXQ5ZGZtTlhjeU9kMzEyRHBzRWlj?=
 =?utf-8?B?d2JnNHZHcWw4WFZiVElDYXIrTFpGVWZVRjV4ZHBWUmpEWTNkbi81MVNpYTd5?=
 =?utf-8?B?Nm5xMXEwTlh1Q2RzMjhKaDJMWWN4VzJ2R1lwUHhtOWd3NzYzcWJJWVVzbUFF?=
 =?utf-8?B?b1lUSSszb1RRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bldzYStVRnlCUXlZanJ2V0Z3Ti94N2s3QmMyVWdjaVJSQXhaaCtzRXZmZE5O?=
 =?utf-8?B?N2M0OFBsRDZOWEszMk1zVmZ6MElBU1JXL1ZueEd5OGRQcTBaQUh6bkFRWXdP?=
 =?utf-8?B?WGZsZ2Z0NzgzcW8wQjY5WmVOWG94K0pmeUJZeklCcGRibHJkMnFmNFBCYVRU?=
 =?utf-8?B?UWZDaGhHTGQyanU5eXJwdW5HR21XTGNZbksva2lSTWsvNVYyUG5pTzVpTmF5?=
 =?utf-8?B?amNYNmd1T0FVT1JRTmxVRHdqTmx0b0ZDZ241MjVsV0FZMFVoRGJzT0JxYVVj?=
 =?utf-8?B?RERieEhSK2kwQUJkekZLNjhTVEpPNFpwSmh2dWlUQmpXS1hVVXFUS2hrbnk2?=
 =?utf-8?B?K09KbHNqOWpRd1dJVTYxWFRyZEtNWkIwRmowRURua1hFSmQzaU5VN3hTSnNj?=
 =?utf-8?B?Rm10aXEyS1pnenhPamYxZ3Vham01NTl1RW9Gbk1XdDM1Y0VwK3BaOENnbmxi?=
 =?utf-8?B?QzJQOUt6TlErY3cwUkRrMGVOcmJvdnpvbnhsQ09KRU9BK2xZaTllcDV3ZnlW?=
 =?utf-8?B?U2FUMUlPa1d4VFZzQVdsWWVZbm1VdFFuN2UyQ0ZzTlErQXU1amhrVWluWU1G?=
 =?utf-8?B?cTh0a2VTOTVvNk5KVkhqcTRHMG8zRE5BY0E1V01heFhBZTlkUCs2OTlrcDVs?=
 =?utf-8?B?VUUra3F2b0dEWVU1TnA0ZzNjUFI3cEVtbmxjY2c3WEQ3eTNUY2RZaWJ1WHVt?=
 =?utf-8?B?UE9pRTF4YkRCelNydm9IakdjeFh0WVAxZjZMY3pOTDJTdDJQQWk2N3k3MUtH?=
 =?utf-8?B?WmhoVkZLOTdiMEVPM1JBWVZDMzNrU0I4ODdnZmRTMHdBbGdhWkxjNHdYYjFC?=
 =?utf-8?B?Y2VacXNUVnEvZzduQ2tGY2VwUFlUQjZCb3BnbjhlbDQ0RUliS1NJejBNdEVF?=
 =?utf-8?B?R2hXbGNNYyszdkRSRHg0cmJlWmVrNjl5YTlwUFpXc1puaTZvN3VZaXpKNlZs?=
 =?utf-8?B?Wml5am9JRDZtOW1uQ2NsSThIYURTbExNMy84bnhUcmt0cDJwdUpnc3h6ZEty?=
 =?utf-8?B?bUVtRzBFR2MwbEhXcnFKV0orcENuWktzckF5NnhkMlFaeWpjUDdXa3hEc2dV?=
 =?utf-8?B?V1FsTEVjeXN5VGpDYm9KRll0cjdLWEVIeXJFa1E5eDRGOFVOMVRYOEVDMiti?=
 =?utf-8?B?aWNCSFZ6STAvaHJ1UUtZVE9wREo0TFU0SWVzTEpYRmZCRXNnL0p0dENNYktZ?=
 =?utf-8?B?RnNaUHpCcElwUmFKM0Rlb3Nmb3I3dUlYbHA5WktGazhiVXcvWlB4YTRCQ1Zv?=
 =?utf-8?B?RzJiZWtiUjllRzUrMHNoa2F4NTRYNEFaT0traEVKSTNhcmxoZ1Zsbi9SQlY4?=
 =?utf-8?B?eGg5MHhRQi9XSmdEcmEzWFZva0Uxc3N5WnhEcG10c0psWTMrdXg5SWR0ajFT?=
 =?utf-8?B?VVl6RXZxNU53SEVObjhkUllWaXVwU1FFa2taUDRCOGtJNlc1T2dwMkJQZ2tu?=
 =?utf-8?B?L2R2TjZFRWI3OWFTU3A3Wk01ZGM2dkhGeTFmWFNOQTJSUEd3ZTIzNEQ0QWlU?=
 =?utf-8?B?SEthdW16bUNPR0lWdU90Zy9kZjlLb3NaNUVvaXhhLzgvdlhvNDdLUG9oYi9u?=
 =?utf-8?B?d1VBTnlsSVFmc0pmRWJUSGtjWFFsbDBhbEVHazNtMTRaNjRsSmZBYmZuYlhD?=
 =?utf-8?B?ZlZiS1BRSWNyTWl6QjJLUXQrNktwbS9uNjN6ZXovZ3plQUNtMEljWm9oUU11?=
 =?utf-8?B?cm5wNEdqWlFzSk1RMERQYm0yRmdVNEtFSGFFS0pOL1l3MlhQbTM3bUQ5QXRJ?=
 =?utf-8?B?ajhqSWlnU1N4N0FiUERrTHJJaVN0c0dyc2ZmVTlOelZsYlNGRUsrUTJYQXVj?=
 =?utf-8?B?K1IvSk9qS2JhMC9ONXBaVzdUS2MzL1dqY210QXZWUjQrS0d3VUt2cnFUZ1Rz?=
 =?utf-8?B?ZkJobVFHK2tHTDErM2ZqMXNZTTlnUTZMQzVaMHdvZ1g4ejFBbkFVaDQ1eXZo?=
 =?utf-8?B?MTZoV3VPdzUxR3hmSm1IVmxaVFl1em4vdzQyTlJtbFFPcWs3YjZNczJTT2xM?=
 =?utf-8?B?TlVmQmp0SisxYzU5ZmY5eWx4L2VLcER5MEZ3b1lYSTdJTmltYi9HcDBBNHg1?=
 =?utf-8?B?MHJxVEJiWmMxY1Brb2FzTHFybEJRM2dsK1pId0lZbDZkdEljN3gzRzBWU3ZQ?=
 =?utf-8?B?T01TRkpvRG8wRGFXZEpSV251S0Jza095dHRBbHBxb2gzVHV0dk04aEFTTjRw?=
 =?utf-8?B?bXFBaDhzY3dkdmtaNWxvQ25rNFBzK25Jelp0OVEvWHFkUzlYZ0x2NkN1Y1Yz?=
 =?utf-8?B?SU5uTWtqdlBOdTVBNlZISzVNbkN3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f939a178-8acd-4b72-9b51-08de3eedb47a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 10:59:39.1601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdZA4K+2huuqx21uQG06rOz5gZcbjnC8fN7aTDJxel8knEJIXucJr42hO0F7j6Uxjass4u0K0qfoLWlWTEDrjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8129



On 18/12/2025 19:07, Aaron Kling wrote:
> On Thu, Dec 18, 2025 at 6:00 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>
>> On Wed, Dec 17, 2025 at 02:42:58PM -0600, Aaron Kling wrote:
>>> On Wed, Dec 17, 2025 at 12:20 PM Aaron Kling <webgeek1234@gmail.com> wrote:
>>>>
>>>> On Wed, Dec 17, 2025 at 4:48 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>>>
>>>>> Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
>>>>> Tegra210") populated interconnect properties for Tegra210 and this is
>>>>> preventing the Tegra DRM driver from probing successfully. The following
>>>>> error is observed on boot ...
>>>>>
>>>>>   drm drm: failed to initialize 54240000.dc: -517
>>>>>
>>>>> For now revert this change, until a fix is available.
>>>>>
>>>>> Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for Tegra210")
>>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ------------------------
>>>>>   1 file changed, 24 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> index 709da31d5785..137aa8375257 100644
>>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>>> @@ -202,19 +202,6 @@ dc@54200000 {
>>>>>
>>>>>                          nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
>>>>>                          nvidia,head = <0>;
>>>>> -
>>>>> -                       interconnects = <&mc TEGRA210_MC_DISPLAY0A &emc>,
>>>>> -                                       <&mc TEGRA210_MC_DISPLAY0B &emc>,
>>>>> -                                       <&mc TEGRA210_MC_DISPLAY0C &emc>,
>>>>> -                                       <&mc TEGRA210_MC_DISPLAYHC &emc>,
>>>>> -                                       <&mc TEGRA210_MC_DISPLAYD &emc>,
>>>>> -                                       <&mc TEGRA210_MC_DISPLAYT &emc>;
>>>>> -                       interconnect-names = "wina",
>>>>> -                                            "winb",
>>>>> -                                            "winc",
>>>>> -                                            "cursor",
>>>>> -                                            "wind",
>>>>> -                                            "wint";
>>>>>                  };
>>>>>
>>>>>                  dc@54240000 {
>>>>> @@ -230,15 +217,6 @@ dc@54240000 {
>>>>>
>>>>>                          nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
>>>>>                          nvidia,head = <1>;
>>>>> -
>>>>> -                       interconnects = <&mc TEGRA210_MC_DISPLAY0AB &emc>,
>>>>> -                                       <&mc TEGRA210_MC_DISPLAY0BB &emc>,
>>>>> -                                       <&mc TEGRA210_MC_DISPLAY0CB &emc>,
>>>>> -                                       <&mc TEGRA210_MC_DISPLAYHCB &emc>;
>>>>> -                       interconnect-names = "wina",
>>>>> -                                            "winb",
>>>>> -                                            "winc",
>>>>> -                                            "cursor";
>>>>>                  };
>>>>>
>>>>>                  dsia: dsi@54300000 {
>>>>> @@ -1052,7 +1030,6 @@ mc: memory-controller@70019000 {
>>>>>
>>>>>                  #iommu-cells = <1>;
>>>>>                  #reset-cells = <1>;
>>>>> -               #interconnect-cells = <1>;
>>>>>          };
>>>>>
>>>>>          emc: external-memory-controller@7001b000 {
>>>>> @@ -1066,7 +1043,6 @@ emc: external-memory-controller@7001b000 {
>>>>>                  nvidia,memory-controller = <&mc>;
>>>>>                  operating-points-v2 = <&emc_icc_dvfs_opp_table>;
>>>>>
>>>>> -               #interconnect-cells = <0>;
>>>>>                  #cooling-cells = <2>;
>>>>>          };
>>>>>
>>>>> --
>>>>> 2.43.0
>>>>>
>>>>
>>>> A little bit of documentation on this, should someone read the list to
>>>> see what happened. The original report of the failure is here [0] and
>>>> only occurred when the tegra210-emc driver fails to probe. After this
>>>> report, the related code change [1] to tegra210-emc which registers
>>>> the driver to icc was silently dropped from -next, but these dt
>>>> changes remained. So now these interconnect routes do cause tegra-drm
>>>> to universally fail on tegra210.
>>>>
>>>> Aaron
>>>>
>>>> [0] https://lore.kernel.org/all/56aed0ec-b104-4612-8901-3f6f95e0afab@nvidia.com/
>>>> [1] https://lore.kernel.org/all/20251027-t210-actmon-p2-v6-1-1c4bd227d676@gmail.com/
>>>
>>> There may be another option here. I'm beginning to think there will
>>> not be any way to set the icc routes for the dc's while the emc driver
>>> can fail to probe. The next best thing looks to be just dropping the
>>> interconnect nodes from the dc nodes and leaving the rest of the
>>> original commit in place. Then reland the tegra210-emc driver change.
>>> This should put the no-emc case back to where it was, while allowing
>>> actmon to do its scaling when emc is available. And I will move to the
>>> dc icc routes to downstream dt's, where I tightly control that emc is
>>> available.
>>>
>>> Does this sound reasonable? If so, I will go stage the changes and
>>> verify that it works as intended.
>>
>> Let's go with the revert for now, since that clearly documents where
>> things go wrong and it can be easily reapplied once the root cause has
>> been resolved.
>>
>> It's a bit unfortunate that we don't have a way of making these
>> interconnect properties optional. If EMC fails to probe for whatever
>> reason, I think the assumption should be that it doesn't do any dynamic
>> scaling of the EMC frequency and hence the entire ICC stuff isn't needed
>> and should just be no-ops.
>>
>> On the other hand, other than the patches getting reverted, there's
>> really no good reason for the EMC driver to fail to provide them, hence
>> I think once that's been restored we can apply this again and then that
>> should be the end of it.
> 
> Except that the tegra210-emc driver fails to probe at all if the
> bootloader does not copy reserved-memory table node? Which per Jon,
> the Nvidia regression bench does not do. And neither will a normal L4T
> install using a mainline kernel and dt via extlinux or u-boot. I have
> to put the mainline kernel on DTB and use a kernel in an android boot
> image, which causes nvtboot-cpu to set the dt table reserved memory
> node directly. Which is perfectly fine for my android use case, but
> not so much for anyone just trying to boot a Linux distro.

I am lost. I was not able to follow the above. Our current testing 
simply boots the upstream kernel + upstream DTB.

> I have wondered how the reserved memory dt tables were verified when
> that support was initially added. And if the regression bench can be
> set up like that. Because right now, emc fails to probe there, meaning
> there's no test coverage for the driver.

We have limited testing, but it is better than nothing. We are always 
open to more testing. I avoid the downstream device-trees because of 
compatibility issues. And avoid the bootloader making modifications to 
the upstream device-tree. I understand that might limit some features, 
but as you can see those have not been supported upstream yet.

Jon

-- 
nvpublic

