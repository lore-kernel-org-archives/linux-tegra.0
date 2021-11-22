Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E71C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Nov 2021 12:13:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238137AbhKVMQN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 22 Nov 2021 07:16:13 -0500
Received: from mail-mw2nam10on2056.outbound.protection.outlook.com ([40.107.94.56]:23264
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236711AbhKVMQN (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Nov 2021 07:16:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTg2yfUiuxyAraTv0w2HtxJhsTH6EY9g9VSZBdzAg5tFX+Kdnaz28IU49wmWmRmsyFgF5iGSc0H53urtwslpMmLWVfl9xtjFRoFcarKnHl/7M8XQG5gYnsvh0UlDTkKWIRIBFTeqhGHd1EBA19L0glHJ3pRfP+PNeo51dPWSv7cKptl5tufX3WDaPLQuO9Te/6Ip8yFxgjN3p9533J6vjenh6pIip1CKSyYx6OPTGcRPyCX2tW/EhqblopSDJ2CueQ8yx/EKEyb4eB5YmYiTioYbzWgIywQP5ztfH2w+yhWTIm+XbPd8F4jaDYmYV2tEU17PArRET5JU+T221rq3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QbfGlmxBQvO8egW8ve54DGmZh8Gq0ZdQtL/hNt+IvY=;
 b=Qwg4R/ypXatgejWhasA9uy/vCF5iPZEP+BziNptZYEGs672jWjOKR6X0FpW6HGBIWJ7R8eKlPm00IAxYOHoxklzO6iAmAGSR1uEO39FJPmDJJu1dgnPrxjRiBBjINc7Wx9V6kWmimku6kjbVP+A3b0VQRIXWigHx5vapqnsisot4V009VS0JgNNeTHyycGImwkwQ653Ba6VYcH7nRymfiHofTCdRkcSwUORHvVwgx7KMpfNQRVVv1J3LBv02k+XdX0dvHG46ZSSnebtYc2auzfttIsvB/pvsbDQ3075bpvOVqW+4Mdshvwtvq/LZGR7SxHvLYpWrhNzf0cBzY4djrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QbfGlmxBQvO8egW8ve54DGmZh8Gq0ZdQtL/hNt+IvY=;
 b=A4c5RVAjqZK5bKGxYjDBJBkRbcW3wQ4e53XI0RDaepc0UyqUVC7CQh3ddUh4btNgzTHv/QZn7GOwEN5BOIH8KHTfyq5Suz9t/4qLSzGPaeTFJkwCXGr2Pf4rMfRBB5vW730JXLgmDd1wiRZYQzsj5DIn2oNZV6C7O3eRzvBZLKXT8Cu8MG39ovCcvjMQi0UhBwRyItJFo7pxrGtj2i2XagszuRF4irqwapM3UnIry1dJE0Uucx/OdpnJGjLbaunU4Cm+8KE37dn7vHqCDOQGGNDfRuul0cx78xaDKXBVdb4oIiYeqIdfUms395mgSv/HA4qwt0EqkumIxEZxc2mNpQ==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5393.namprd12.prod.outlook.com (2603:10b6:5:356::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13; Mon, 22 Nov 2021 12:13:06 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%5]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 12:13:06 +0000
Subject: Re: [PATCH] soc/tegra: pmc: Add reboot notifier
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
References: <20211115113208.237296-1-jonathanh@nvidia.com>
 <b0274558-7ad3-bc56-01ea-eb9f89716c24@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5ae5e584-aa2e-8026-d941-d39849c91064@nvidia.com>
Date:   Mon, 22 Nov 2021 12:12:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b0274558-7ad3-bc56-01ea-eb9f89716c24@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0344.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::7) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
Received: from [IPv6:2a00:23c7:b086:2f00:ca0e:11c7:1b63:5702] (2a00:23c7:b086:2f00:ca0e:11c7:1b63:5702) by LO4P123CA0344.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18d::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 12:13:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb4103ce-93bf-4a43-2cdf-08d9adb17046
X-MS-TrafficTypeDiagnostic: CO6PR12MB5393:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5393537EECC8D79C66C0B34CD99F9@CO6PR12MB5393.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RTouZCt8HGsZtfMXSCuGnC+AmjnyG+i2A0c0vZaGEX24ZhjEXKFUy8JJxYCZJ5JTn96tZCUU4p2Q9U4z8lhHzCZ6V+gGD/7tUnSZNdReHe6z+ttA8spzJtmfHz3k8gFOA6ln+cdqJQq1H5HGJUEQBpnZQsUBwsSRQDJTDUqQWCWK1ABh0vM8um5V0m7qUZOBpaDo4UPMegKM0xDSl4PR1jX1D7kKDUgC+ojK7bCYV6hqX5FvMKAoCerJmEMV2sIRpH6ldXathncPg4hmn5CxDkcoo5MDTiORL3mcJWgMvO7SjxXcCobmsHXdwW/5EWHfYwGH6Zs0QrFtfRMCC4gXNhUx7i5UDetR/SU2qv0FZdwqGLDZOGUTWGlkZeCQEC/OzEaW53pQx0LjDrOWth1L5XRbr76m5JCJh7QhlvvNSHWp0KSyrmlyqf3maHEVTpW13AbauVXrU4HqEMbJwRvvgeWfnU/RQ2l2uyEBMpHvNjwBnt5xqg4Hhf2PwRN2Ezi29RQJqhYV6bUeRwPzUfXT5e2DB1gDK2nTDHp0ywpE5Kx7K7xBcvMddHYaB4EULB2CIurFm42Sp47KTGmHTNGcInNWZjb3lsCR0VBmnwt5d9ohoHQmVS2gGMAW8pKOALqfCRkt+lZfv+C62lRDMjLVJ+PRpvlzpgmUnyjG76m5T9LoaOhNTjL0dONlabJthu4mP4nkc82q+aD5xz5lJtdpVZDZJQ0IoQYHV/rtPjH6Zeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(83380400001)(31696002)(8936002)(2906002)(66946007)(86362001)(316002)(38100700002)(508600001)(66556008)(4326008)(66476007)(6666004)(4744005)(5660300002)(53546011)(186003)(31686004)(8676002)(2616005)(36756003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUVxZS9YbWtya1ZML3FFRG0rTFo3TFJxTU5ZN3RTMEI5cCsxVDRBZ2x5aEhT?=
 =?utf-8?B?R0ZQeEhjdmpOQiszdkVHd0t2VXo5V2llWk9BK1BOeklybzlyZjJZVkgxc001?=
 =?utf-8?B?U3pWV0VrWjRZUUhiOWE3WDBhM24zTEwyR0pUeTF3YWM1cTFWTDY1QmZhdVJo?=
 =?utf-8?B?L0c5bk9JblAzSXlmcmpHU3Nza1NDOXN4NGp3bHRSeVArYytDU2ZIbEVRbVFu?=
 =?utf-8?B?TElRWHZLeUp6Y054UDRtVlgxYmVTZWFsNmowMEl6WGgrbGtMWjE5WFZvTmJq?=
 =?utf-8?B?RlRzRnBOVVlNMDdqTmt4ejU4Uk1XRzBlbGNtb1JCVWhUUTF5cDc2YWtJUFU1?=
 =?utf-8?B?MmJ0SHI3cWF0MDZUeENJVC94YVNwQjFPaWloaGx0eTVlTmJsRFZTV2wyN1Zr?=
 =?utf-8?B?MGEyMWh3eXc2Z01JWXhzaUd2M1RkN1lvZ2o2MzN4dlYvNHJIemZJZUV3eEJU?=
 =?utf-8?B?Z2VuVkQ4SlU0TnVaOE1QcEpsN3NpTm1ET3ZoMWFxMVYzeVBrWVBXUTFCUFk4?=
 =?utf-8?B?eHJJeUx5YzhPZ2FaUFZNc3drVGluRlNUQ2VVUVRGbC92SmZxRG81aUl6SUhT?=
 =?utf-8?B?eDR5bXlRajJ4clBwTmtqbE9jZTRIdmJsMTd0NUtPK25WUW9OOWpoRVBGM0VU?=
 =?utf-8?B?c1UyL2NERUFpNEhCa2E0eW0ybDlHMjBCb3JLNWNOQkJMSllMRklJYmVzV0Fo?=
 =?utf-8?B?dzZZTWVyUE00U0JtSGRkTUliR1FsVWdIUjJVK1B0ak41M1hFNzFrSVFqSDZm?=
 =?utf-8?B?Yk10bUhEVlk5clhoMGF2UnFBOVVGU2F6OEFQTWVTeEo5c1hnTVN1N1lWV2dv?=
 =?utf-8?B?eEdaNlJRYlRDeU43UzF6ZHNrK0JWWm9pUDlCc0ZPNDk5SXhCWjM1OGF0MlBR?=
 =?utf-8?B?V0hYcTQrMWNsRmFMRFRWYzE2bFdsbnNlQngrQ3JlekJ4VndJWUsrK0xOa05H?=
 =?utf-8?B?N1B5VGh1enc2QlU5WEwyUlcwTm1McHBiamRsK0NkRXA0Um91YVpGcUtvWkZl?=
 =?utf-8?B?SVJabFhrb2JVN0hwb3pMcHdXQW9LMW0rRlJ6QWVyK3RyVzhuWHYzTERmaTNj?=
 =?utf-8?B?NHpmcjcreFMrdUFaREtrQXF3eEM5c3dXNmpaZDIrcGM0bGlFcjJWcEZoMFJp?=
 =?utf-8?B?NTBnZGJoM0p2YzljUGFoNWp4N2NGb3ZWVFBFSHU0TUsxR0NDeTQyUkpuTkhw?=
 =?utf-8?B?aGl4MHY1ZG1GVXpZeHBtZXdjVDRYWUQvS0ozL2hrd2F5djFPa2xYQzAwa2Y3?=
 =?utf-8?B?NnR5ME1BRWlGV080YWdQNkxoeFk3RDhtc2pReW80V0tTWkE3bWJvM25JR2pi?=
 =?utf-8?B?SGswdTRDM2RaSVRwM09JeGZjSzZIaXhtSkZuaWt4R3ZFdnNPU2pqSmRjVWp3?=
 =?utf-8?B?Ly9mQVVKekJuUXR1MUJ4RWVPcWRlcjJGbStLU3pqTUhkcTdOdVZma0QwWEZn?=
 =?utf-8?B?eS82OWc5ZzErbXZ1aTFDdjREa0t6WHpQSWFlNzVEVDQ5dXp6dkZjeE0vVnlF?=
 =?utf-8?B?ZEI3bEhVL2hpRm1XNmU0ME1MSm0zMUFjOUxrM3RuVm92WFA1cDRvT1NmQ2sz?=
 =?utf-8?B?T045MkNPZGo3MHNzQ0lhcTV3MWZxTjdKOVd5MmZEVnQxK01waDZCeUk3OWhq?=
 =?utf-8?B?Q3Q0K0pIWGVXSWo4dm56NUk3SklOaUFrV3lQT2VvOGtURGtBRFAzMTJUTGda?=
 =?utf-8?B?L29henRVd0Vka24rQkFISEExR211ZlFTbXVLRDZ5VzNEUFU3MGxIdGhHaDFQ?=
 =?utf-8?B?ckVVM2YzWW15V2xqTVV6WjExUWpqTlJjV0tJd0FkMDF5ZE1WOGkwZVVlTmVH?=
 =?utf-8?B?TWQveFRaS0F0RUhaWlhycHdvRlZSMldoclF5TWdsTmErSzFwM3pwbkxzWFFP?=
 =?utf-8?B?cTVvSjhaM0pmT3pYdHdSSzZXeE1POWk0bEFzWk5aSXhxK3g4ZFZvdGlVdXRj?=
 =?utf-8?B?RmZHbW12SktCc3dGN3lpWjFreTlQK2NHS3lNTHFJTUwrV3JXbE9oNk1xaEJV?=
 =?utf-8?B?MEwvdDU1b0pQblNnMVgyUHo2RWlWV1NMdVc3Skl0YkVLTjQ0aXFuREpSVUhl?=
 =?utf-8?B?Sm1nV29ZMldKUkdaZVVNK09xeTY1WGNWRUMrR0kzeFJGTE8yTGRqRm50NzRu?=
 =?utf-8?B?QmZyTW55bmRkdDU0UWZXbDJyV3RvU1B2c0V1MVFlTnhDZ0w1a3R1dHJSZ3hL?=
 =?utf-8?B?WFRRdkxwT0NlNXBPbmRNTFltZ1F1SGpmVkJDbDZ3V2dxQTVQQ1BGUDc1b095?=
 =?utf-8?Q?Hiw9pFQZYbCd+Z/Y3xn01d81U5xOh3p2RDz/0/SDqc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4103ce-93bf-4a43-2cdf-08d9adb17046
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 12:13:05.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thBTOprm2Xd5QdDaUSH0hYtSgE2sToiil8uiaSaammy3syGlFf8anSrBT4PbrD6+Khu6E6gEQz5vDLT9vFzSFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5393
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/11/2021 19:13, Dmitry Osipenko wrote:
> 15.11.2021 14:32, Jon Hunter пишет:
>> -static int tegra_pmc_restart_notify(struct notifier_block *this,
>> -				    unsigned long action, void *data)
>> +static void tegra_pmc_program_reboot_reason(const char *cmd)
>>   {
>> -	const char *cmd = data;
>>   	u32 value;
>>   
>> +	if (!cmd)
>> +		return;
> 
> There is no explanation of this change in the commit message. Previously
> scratch register was cleared if command is NULL, now it's not. Why?


No reason, just an oversight on my part. I can change this back to keep 
the behaviour the same.

Jon

-- 
nvpublic
