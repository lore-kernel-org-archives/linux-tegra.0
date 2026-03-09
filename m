Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A21C3D3007;
	Mon,  9 Mar 2026 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065821; cv=fail; b=LncgvW4sOUjxvfW6UEiQKzmJmyBvAO3j3QbFfvwv9/Yq21Vl04fmBNA6jMjYyXi1rnlAvppctnKVgqOanbF2N2qk8pKngqrZskeJyMuphp8dSwcKg2aONFufxhqcZ1WtYTM6KRzY1XF+VOO2GQh79xHXucA5niXV6M/IPHxD56w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065821; c=relaxed/simple;
	bh=C57kjSTLoZFvP+HYKNhZa21HQJsPkbQo7dydMSErCEg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nNUbczO/YWQU24W8M2hYyT3EZeXqlJMV6qAz70//dJshHDS5t5Bf9PPgTIpDlCVOEZxEIco6PPrv5Wu5LUELVo5KL4/UgF/2NIEQb3LHBX8B5bvt5WcEsMxYAWCQnqbyNBN9DTqDMjLNLhln+mqt+oD0NkykpNMN4edklKC8LCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L0P/6euS; arc=fail smtp.client-ip=52.101.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L0P/6euS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfzwzfNkEMCp2iQknQaZ5ENTp8XCHBjGZR2sHjgR6iThy3+7KXPzTVSlm8lt8k9sOHyygbWWRUvXJcbwuNWxUPNYw+y5Z0SDwd2k6AqmSBQbgxZyFDDWFpQfrCSCL/GufhEEW/XLYzwkDTwvVfRyGBguG57oAkBLeRM180kTNgnhpmrQNVBsfCCLyoNqp30ff+u0jISqgBO9Bc9OWNyk/w0sPkkW+eTYxYnlZBqct3kSfV+r1mFW6TACCajXp+BzpeG5+yES0SD70zT7dOyN95cOTAkPIZBmqTvSvwo1uHiXlunOkw/cr4awcQmvtpwQxiaKpXXXvzSTMUb3bFUCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLktzYDzLS9ZQpcThSYsZtnpNLj25LmkPv1zVw+lpBg=;
 b=QBhIL8Df1pw52btxkq76/h4Idre+19k/dQ/nGXF+pOQYSZLWr8S+kFns7pC+q22FI8L3uuNsjqBTnH02MnDbuWJJ3z2PaPWjBVlIPSj8PBljthlSoQFJ0rq8xwlAaYwvxF4qPbynmthaHqD8EAznyZXfH6Fq69nEVeJvbME7PB2FSHJzcy3DbMXZhFou/xhe1faCOfPmQcLJasYobxLjtOWbMjskWd0Axsm2LqRkWEFrCw9hdN3BtFK3SDwkcpGGJt/Zi5JYNcS6vpLVkYgzE/zamzCOHsf9mKB6mUMtEFFI6KCEKFJ2ANQzY0g7y1b6u0acjs7xT9Bd5WVZftjc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLktzYDzLS9ZQpcThSYsZtnpNLj25LmkPv1zVw+lpBg=;
 b=L0P/6euSrjKSSz0U+2urI6n3iqvmp6JuXwGQ7/xuhSlyg7kMY8Al/cr+vO87vHisR3P/3jh9iXOLHvvwuxAy9cvviQ4gwS7xoQn+70VftdwWriJb30m8mhC0VvFBTseJpclIFJKY9lJ+CRTST2EGYVbu9s7er9+ZFvAN3cZZcBhhaFhL3i1EtMGJNtzAuzwyJ0ApJcIsBm3Z7F51/LIoFCDGRMMoKgIMqiXRqMLd8mZgUa3MonVemK/oWVFbCnLljSbniNWzmiuA7i37EPUGDkGp7lpAkYxqnZu3/sa/lij5aKfeZGtdCR3BUWoYDxwbdXfGcTQPk2Fu2E1N0vEtVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by DS0PR12MB6438.namprd12.prod.outlook.com (2603:10b6:8:ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 14:16:55 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 14:16:55 +0000
Message-ID: <7f230f84-1f97-0177-aed7-5e2ab3e5d8f6@nvidia.com>
Date: Mon, 9 Mar 2026 19:46:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 0/6] memory: tegra: Add MC error logging support for
 Tegra264 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260226163115.1152181-1-ketanp@nvidia.com>
 <31fff84b-30d2-430e-8794-47b4ee7d5317@kernel.org>
From: Ketan Patil <ketanp@nvidia.com>
In-Reply-To: <31fff84b-30d2-430e-8794-47b4ee7d5317@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0306.namprd03.prod.outlook.com
 (2603:10b6:8:2b::14) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|DS0PR12MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff911d4-3f34-4b0f-ff05-08de7de6847a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	cOlcLX3cuMjioBe3jjOp5BGyh0QQQvkzsc39VPXVPmy+izNen4FtFvDwAC1Uerwga1s8ZyijVg4ijTUqNds/RKULal8lxLk3YbAjgzms8a/dg5NbFbHO3ntWw5qbS8Z4RxZw0+0LiPr73qgbLa7KGhpC8N8bQ4iRW2IHIzyV8DKGhdY5cJL9GM0f2fVBVnWbeyElblWE5iNEXEmzVl4FAP+tqeFRDJK4oT2Wl4Z8hh437CGMQzMCFEdfDREwSfipN3dZNhT6D5ECR3ga1uSkGCImngvdHg2sZ70dNfSs1LTRzlS6RXXyn+RfOB1Cr3gvUjN3zFyN9O6wIs3qg+2stnXBpi7TKMhZj9MR2AnIW/6ScEd/bnAeQRyUfTi2QBmG+qLjJ9CX/Qp13wd3e6c5SCWFDiZnh4uM5O6L3Sv8/TBJt5Ltf7M3x55ijm6n56ozpZ/qeoDR9uIW7Y0DsdwXRnS9T5T6J/amvzFU2vyEFRZYDMSzSwVF6nWMfeo0/+uVyMxKp+dhBIEYivy+mqUaJrZAxSugEOE1SPL3ehiPbRjidiphNAyFJZM/6ugtT5Huwnhb7ylGz3qt3jijHbjHf4r1k2vubP56nyLtpD6dsZ2Z3ln1U09Ci8aCGe3a5fmw+Fidqay/VXxG88uKR9iexgv48dcIri5S6MDrsN0+6VCoG9oEZs6FwmL/iMsbzqdQvg2y3jEd5EVIs0VB8T/9J0J50mk4qsw0KXwkmqvaZ0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXBaclpqUzZYVEJydzMyKzZxY0NNSDBMVXlpYWFZMzgvOVdsNG8vU2U1eFBu?=
 =?utf-8?B?Z092VkxZTjRlNkFmRFVtclYraE5HUjdhYzV2RklCeWllT2pCd1laWm1qcFk2?=
 =?utf-8?B?UGluSVB5OWVEdDdQNU9CYkN1NGVaME9MQVJNY0JKanJEV3lLbkpWRXcxSGZm?=
 =?utf-8?B?YTBvNlBNN29wRHl5THBZcnNDQXBpQnUydkg1cGtXQndGNEJ4R2FBbHA1OTgx?=
 =?utf-8?B?U3FaMlQ0Vy9iODNQU0FCQnFNOUtld1lncVlhRSs5aGFjeUNDb2V2a2QwWEVU?=
 =?utf-8?B?eGdEVWsyTjczTWI4NExSeEJPcnF4S2lVcXpRUElLbVUwTXV4YWg4clc2RHFv?=
 =?utf-8?B?ZlJLVmM3RVZOd3E4U0RNUmJFRVViZUpPSGtMN3BSOUREZk1tWUVRL3BQMmFB?=
 =?utf-8?B?ZVZHVnpnZXRXMGVOejJOU1hSdlhYalcxZDlIMnFLYmFudExtZ1RPdHUvWXdp?=
 =?utf-8?B?NE9lSWRIUUFCVXBYOFpCVm9LQjF4NzNtL2tGSkpSVWdMVzVORFQ3TlFFWEhG?=
 =?utf-8?B?YkszQ3lJY0YrOHNJTEpCUWp3b3VmNkIrYlQ1a0VLVGh3QzZOeVBzdzZBOVVW?=
 =?utf-8?B?NHptS0ZnZjIwUEpFWlQrbzRVM1V3VFNSOE5mcHFpNFN0NHVxSUFDWGdFNmFU?=
 =?utf-8?B?RnozN2NaUW1XVmo5TkpWUjErcVg1YzBZdjJueXBULzhEdzlrUkJqTWw2a1ZJ?=
 =?utf-8?B?NEdnb09xSjE4Q1pEKzVsZ2hLQS9qUEtIYXVYN09CSFduRWx2aFRkK04ydTB5?=
 =?utf-8?B?VWZZd0s0U1ZmUE43WmFmbjVRUnlTdDVRem1LeU43R3V0YVhEYndrYTNHWnZu?=
 =?utf-8?B?dkkrSlMrUGdzRnZ6eHpxdTZtb2Fncnc2cXU1YXVoeGlNLzI1NFloTzNtL2xz?=
 =?utf-8?B?blhKUmpHKzJqQm51cytsV1JXVFBiRDh4ZkcvbzZ5dU84ZDZnQnJOQk1HUm9x?=
 =?utf-8?B?WnBHd2Y2dlZNMXprdGx3OW14WDk4cFdCVHFrVk5sVWc0aEZ0dUF3WUFhZ3Iz?=
 =?utf-8?B?NEtBWVVGYVpoNHlZcUxIb0c5MnJnaGtEd2orOHRtWEt1TUlHWGJydEdzSEI3?=
 =?utf-8?B?Z2VBZXMwd1FZb3l2dlZpWEQrYzErN0ZobGJQd0xmU240dHozUWpyRlczTWty?=
 =?utf-8?B?T0xPM3duMklJZFMxbGhTa05VeHRiRktBMXF5OE5MUmJGS2tqVmZsK0F0ZEZk?=
 =?utf-8?B?UElTRjc0a2ZQUUZmZVlWRG5nN1RaZEFtVDdPRkJQWE1JaXhaNEYyVlA2dW9M?=
 =?utf-8?B?RmUyNVRLc0NBcXN1U3J4QnN5K2ZDeUUvSmxLRDZybFEzVlQ2T0hkVWpmVTdJ?=
 =?utf-8?B?Z01XYmRUcll1ZUduZ3N0TkFockQ1c251ZUZBRWI4Vm9MRXBMK0Vuanl6YnRO?=
 =?utf-8?B?MU00OFVERG1OOVhJM2oyeTFwSlFDL2Y4bTVvUkpNT1hRQkUxeUZTeDdkM2py?=
 =?utf-8?B?Yk9wR1lvb0FTdTJEeWYrZVp4VUhhOXhuV0dLQ0p2VERQS2dHK2dYYk5WMHJa?=
 =?utf-8?B?YVpHMHQ5SXo0cVBLZXFLVWk2NzFRcFJ6c0FKUERBQlYwdDdnSEpFSTBkcXVt?=
 =?utf-8?B?enJZazB6L3J5MEgxbTJweXoydGFJeG1rYnlQaWpnYXdhTGJCeGZwb3VrWERw?=
 =?utf-8?B?cnNCWFl3L1JWNW1DREVOZEY0Nml4TjI5NkREczRNajhtdDVRZ2ZHTHprdW5x?=
 =?utf-8?B?ZDJ5bk9kTi9CMmZEN20zOWkwN0ZJd05KQ2RkRHdMSk52STFRMWcrd0pLbUxk?=
 =?utf-8?B?bUc4KytmcXdhZGFnbGxpOEp3OVRqeWVHT05ZV3NoNHRjbmh0OWNoZkgzZmZs?=
 =?utf-8?B?dVN3ajlBYmVuYzVzSHp1bG1LVWE4RTdxd09Gd2xFNWdTczNJK0hoUFNhS1ZF?=
 =?utf-8?B?SUk2ZmtHVDJ0Q1Y2V1ZHeUNBelNQejVTcWhwNkdJSVl1Tlhpd24weDRCSFRq?=
 =?utf-8?B?WFBXSDNvazNVVW9oWFNDT3VBM1JlM3FrK3N5NlY3MlNNRDExTHhiZjhmalp3?=
 =?utf-8?B?YkdiVGtkQVYvU0YvNDAwcnhqaTZyNmh3cUVNWEtwSHROZW5GWEdiZ0UzVlAw?=
 =?utf-8?B?WXRrYVNma0ZJZlg5all4Vmpxak9HR2xZMHJqc3lrMjVPVHo3d1R3elpBOCtv?=
 =?utf-8?B?RG5HUTVFL2VnTzhkd0VQSU13QmttSGdMN3kvRFhFb0JYeEQzbEU3djVuU2NT?=
 =?utf-8?B?bkg4M3JPMTNPQ2ZEU2VSSWw5UzVQTysyVUo2RnBOeUMvNHU2WjByYkkvdDNo?=
 =?utf-8?B?Vm1GSTltdDBPWHNvLzQ5NFdFZ3AvVzk0YVorcFl6ZGhFOHNJcis5THlSRjV4?=
 =?utf-8?B?TTlqUXU4UlBTTElXYjlDU1haMUdZRXlvZXdKTksyaXA4Mk43bk5ldz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff911d4-3f34-4b0f-ff05-08de7de6847a
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:16:55.2975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4I/vmyrbZMFsxy5RYgiQO44W0rgBXa/WoeTgIy+hBjSLj7LUvewN5VkXq/upelPZ/Ql1XhpTo/ikmB922e/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6438


On 07/03/26 22:30, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
>
>
> On 26/02/2026 17:31, Ketan Patil wrote:
>> In Tegra264, different components from memory subsystems like Memory
>> Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
>> and MC Channels have different interrupt lines for receiving memory
>> controller error interrupts. This patch set includes changes to add
>> support and enable Memory Controller error logging for Tegra264.
>>
>> Ketan Patil (6):
>>    memory: tegra: Group error handling related registers
>>    memory: tegra: Group register and fields
>>    memory: tegra: Add support for multiple IRQs
>>    memory: tegra: Group SoC specific fields
>>    memory: tegra: Prepare for supporting multiple intmask registers
>>    memory: tegra: Add MC error logging support for Tegra264
>>
> Please use checkpatch. You should run it, not the maintainer.
>
> CHECK: Alignment should match open parenthesis
> CHECK: Please don't use multiple blank lines


Thanks Krzysztof for applying the patches.

Actually, I ran the checkpatch before sending the patches but did not 
see any issues. But, I did not run it with --strict option.

These errors are seen only with --strict option. I will make sure to use 
this option for any future patches.


>
> Best regards,
> Krzysztof
