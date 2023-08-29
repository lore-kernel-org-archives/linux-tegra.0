Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B8EC83F19
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Aug 2023 12:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235605AbjH2MxM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Aug 2023 08:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235797AbjH2Mw7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Aug 2023 08:52:59 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62FA1BD;
        Tue, 29 Aug 2023 05:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfZVwBVYsIEVH++KgArJ7PEM0I61NxJeJ0lFU1GqLfuEoM/3MgGyLQ6UHW39NVEVcsVxOxv3Ji4n8zu/FwXnioqLRK1qdNm5RKAElxeF4suLSCiTsKW89pvGjJ9rVOsHoLHMjbaqjfTY2WgswRuW3Lv3pM0LkwSEpktywaRg2BC3jMAEbKXDb3KM9rRgDQC1PR7y9b0u9ejIzd9o3cbXSS6OmNTZov80C7ypnFQ9gOugFyBWHv/avgmSytYt1BG6QkxxQQSF+3nZb8u/fk8IVWvxKURVzyR9e6ohfJOsnR4BalpqDBV06S2y65J7bXrgRBS2Yl5e5dM72qxXlG3uVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KuH1X/ijEDlVCUydDWQzNtfL8rNA5T1aHw3XUL1lW8=;
 b=lnL+YHGgGBO1sQ506EZCWaictYWijI3pM3+AzYbnLs1d4ujfrXNjHin7ePdacVzYs+UXuwUzI4wnd+6QBEeVhAmCyHwJmPILEJmeRE6HU7xAswEbVEAb5iXBgIfyt+XSmOHUIDudNFsua41PNdIS4INVvpNqeC8L7a/aDanV2iFlBKMTKdZODGntvcq+DHPbcw/obcreJ0CvlqZLZ4ij5NMLaECMYT8ojM/fHTC/o3mQ+hagEXVEQuPS5H35Mut5pA6+tm9t0C9Jf4E0jowAqpOGWnk1Xz/wAXfu4vBk12xe+suVuPbzr7pZ9CseRCbSVtXBSGYF0EaGr8vtKxR8ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KuH1X/ijEDlVCUydDWQzNtfL8rNA5T1aHw3XUL1lW8=;
 b=bJZ/q1OV0xCbE+0n+U6nt7ozYsG72p7ZnjEJ0zFnMKXztmk9O9MjBJUaYD+3KMf6+7hshfr8Or6m8WR0cQG+/y820VqOkG9mptDBvR/ovLHsLlVIQpUntY+k4YzEc2HYu0ndUg1df3xfKJf6XczG44MCKX+R3NJwf2aFUREEuq55d1kXKX2TsuyjtYhMFnEQ3frHRs43bmjqoHKm2uEkso1b3QaiXlNttEQGGBeOn8uUw/u7nD8aw0+PmpoPqYu8++sYOnow6sNo6EVwXLtnKpXgsjHEp145kgZvQeYC9+cx5DOOGN7W8yH/5kxJI6K5btMIEwki3tqBvu8abLT8VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA3PR12MB9227.namprd12.prod.outlook.com (2603:10b6:806:398::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 12:52:51 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865%4]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 12:52:51 +0000
Message-ID: <b6ca9be7-49b2-f72e-b51f-b778786e0646@nvidia.com>
Date:   Tue, 29 Aug 2023 13:52:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 0/4] hwmon: ina3221: Add selective summation support
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Ninad Malwade <nmalwade@nvidia.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <482ac044-e163-478c-8e67-5f03d7dc7820@roeck-us.net>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <482ac044-e163-478c-8e67-5f03d7dc7820@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA3PR12MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f4b545-78cc-46da-45cd-08dba88edaa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+ntCnvRSEFJLymuMG9FPgyn0qr4DEGLrzIGdYQTO4l8lbCUM/me7/DuVVHDi5v/HfHMYIIICH2VgAhNtkNTgqDyApt0v/nEIz2mVrZUf7BNAU9S69YDpksol89v/RR1edhfe4rowCaM8xdL526kojdJ25pnUTTTFC0JHpELcUje2TrvukJ5qaORhPFmgTlsBZT7nvVY0ahHLQ1o4RgjfcHb01RJ0tz6I2tJTrzGtox41o4BWXJJAa0eH0GGI5JAablLpGXw/6gH3t8doPgg8EBmzeO3xxvLJgA0oVSJrapqGf8TPIR1eMMO8/ROVoS2yIDYtm82Xx0pyZ7uAUB8VvfI8u4PfxjRK0QQdchoAiOEjt6SSjhXyLhS2v+RlGpaehZlzSGVC9CcCGX1oW9OXmKkWe8Td5z2hYT+zJoxpdlzgtUHeeBMRQ73YkbXPfMXRt3Y326GG6i0X90MQvRhaFq3wqRja3ICJPL33mLEndbXmu2Qv9wsjQDSmd9tLzl6P5sInDahkNasr0DvUVo/spH9XHdJ73KvKZ3FJ3cMo+teXpW+TzpJuTB+pU5IZA72ELxWGDsRSY5CXe1OqdS48Z9DjD+USLwnvn5DqftKzymKa2Je5iXMrHqlCGnEJq1F3ikZjLSbPTAcqGZW4uWq5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(1800799009)(451199024)(186009)(478600001)(83380400001)(31686004)(26005)(2616005)(6486002)(6512007)(53546011)(55236004)(6506007)(6666004)(31696002)(86362001)(2906002)(4744005)(316002)(110136005)(6636002)(8936002)(5660300002)(66946007)(38100700002)(4326008)(8676002)(66556008)(41300700001)(36756003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3pOKzNCU1lpd2Vkdm5XNTNoSGhnWlhFNVJlVkN3U0ZMc1ZnQThzZS9vVEp5?=
 =?utf-8?B?K3BXcHNoZHpaMmdMdkg1dlVldkpLTWlLR28yaXR6anBzL1BnZVFyQ0dzbTVp?=
 =?utf-8?B?aHIrWmhOajZuQUF6RGVVMWJqRzJVMHAwejNJb0lmVlBJMTBnRTg1K3ZXcnFI?=
 =?utf-8?B?Q0RlZnc3R0pjTFVJaWYwdTBybG9Db1Z4d2RKQnAydUlUR2NPVjdlWmZ5WTJF?=
 =?utf-8?B?bWJuUkJkOHBvRGhCTXF5dEN3UTM3SHk1SUhNRE8ydktQbWpheTB2c2F0aVl1?=
 =?utf-8?B?SmZ1TEZKcU9GZHRENExCcEluOWlMWWRZZlU2bGNIYU9ZM2t3WFZWbUxNT3E1?=
 =?utf-8?B?dXA1a3NqYnRLSEYwZG1adnA4Uy9wYzlRTzJkV3Vpd3paamIzZEtqR21NQi95?=
 =?utf-8?B?QWJzS1VERGtyM2JzQ0xuWWw4bHZnc3ZBOUZiNWNOWERnUkNEU2QwN1c1aW5X?=
 =?utf-8?B?UFIyeEIvVld6eVpyNWMzcUw1WGVUS2FpM2Z1cVl4L3cwUnVnbklUYU1ySndu?=
 =?utf-8?B?eU1uWXdVTXNFVTBINHZac1JFRGJoNU53NDA1anhSWlRFeVpMREdpdVB1OElo?=
 =?utf-8?B?T0lZVmFFQkRIWkdPd1I1Uk1kNVBERGQxQ2VqNFh6U2VQcmFzdTM1d2pVWVpM?=
 =?utf-8?B?Z0EvMnUvcUpyK2xxV1FST0E5WGl4Q2hTVmt3MG51WjJHYnFxSHJRQkczTHFr?=
 =?utf-8?B?RkNFb01yeVQ2K0taTWRwZGJXVDBZR0FPNFgyVUZWNTlKMHQxYkZoeG9NR0pw?=
 =?utf-8?B?cWdqQWM2cU9SU2pLcWpWZWNQVmxDSnBLd3NLb1R3bjE3UUl3cTBrMzdTTkFv?=
 =?utf-8?B?K0Y5cFgwYXJsSlNOZ2phTTkzVmpZTFhTT2QvVXJlb0lMM0F6RkNuMmZ0ZUhl?=
 =?utf-8?B?aDBUWVZUamVXWTRpK3hTTnMxYWZraGtUQjNxbk44N0Z6bWo4QUFKakZFcTIw?=
 =?utf-8?B?SzExQnpTVDdBTzFnUHREWEFHaHJXekJ3bHFzTzQ1UmgwM3FucHIzTXVwN2ww?=
 =?utf-8?B?Rnl0OEtrbEpuUDI1a29UenJDOG0rNUFSbnZaY21qazFBNXhDWWovMjJBeXFC?=
 =?utf-8?B?bmZ1b0Era1pWN0w4NCsxUXZZWGsyOTVFTE11L2FwR2pQQ3JTeWdtZjZlS1ZU?=
 =?utf-8?B?V1BzU3pQaTMxelBQcC9hazl2UUhJRkVMV0R4WWVTanZIaDlJNkRQRHFIRzZ1?=
 =?utf-8?B?OEZId09ZVEhIVm5Tc3hCaFFGcm9qNmhTWWI3ZUVBT2FCaEN3TnRCc2ZrajZ6?=
 =?utf-8?B?eGZ2U0tOWUh6RHJVdzQ5NzJsUFBxT01nZUREV29lK2J1TEpyL3lQS0dTa2xz?=
 =?utf-8?B?SmgxUmRFdHZFTzk2MXBTbFdBOFlORUJXaG5QMFdtbm5yK2lSRk92QlFjTndQ?=
 =?utf-8?B?MFVkT1hiWlBwYUpPV0RLdXphTG56ZTdDR1pmZ1RURXVqczMxcVV4ZE1pRnVI?=
 =?utf-8?B?RWVpNUxBTzFHcEVoNzAvN1kraE1lZUNwZ2x5NjRsR1BZTkxveU9DODZmRG0r?=
 =?utf-8?B?anR5dXdBWjd3ajl2N015QXphekszZFpYSW56Q2VJWEJFZFRGUVBuNUwxUHRG?=
 =?utf-8?B?MVhjMlhRMVV2ZkFOczBHc1dBNGRJdkZzYjQ5UzZ0N3ArOFlrQ1o5MGgvNDBz?=
 =?utf-8?B?SkpuMlpEMWtScForaWpuVjNYU0wzZkJzWVFGMFBSUXo5ekdWUXBsRW1HQ29X?=
 =?utf-8?B?S3dRMVVJdmRjblVhbEFhNmZzSys5d2ZpNXJMTEFhcEVXbGlKaTlHZEc1VkRH?=
 =?utf-8?B?dW5aNWxuWGpZcnRRN3NzUFRPMk1BRk9hUmc2TzJKdTFWK1VBNGJwOE9Vd21m?=
 =?utf-8?B?Y2ozY3FtZ3RidW56N2c1YlVRY3lqbGRtUzVKQVBpREZFVXNsSXFlQUZsbExF?=
 =?utf-8?B?VUsvVFdRQ1NKVEpKWjNBcFVTUFp1aXdFeFE1c0xTZUxnZCtyT2dGTXBKOEkv?=
 =?utf-8?B?cnBqQU80TVRLVFVoUUN2MlhuZUN0UFZ5RWY0c3UzSWRKUDI1WGNGeU1WeGdR?=
 =?utf-8?B?L0REUUcyVThCOUliV3BkcTVhMnd4TnlvWDlZM2kzdU5FMzVjNXcvSmdPMk9O?=
 =?utf-8?B?N1UwcStDT21GZFRNaUdNUStJNlFkUDQrSzZwZk0xMHZKdm9wYUFZbWxXWGRZ?=
 =?utf-8?B?a3FOamNOaUdwQml4RXhrdjlRNktjUXdnV2MxWGN0M0F4R3doMjRKSGI5R1pj?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f4b545-78cc-46da-45cd-08dba88edaa0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 12:52:51.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9TycDvc1+Wgf6bhDppCYu8vYWXeGAjecIps7WWLQK+VYqwO2v64Ogts7RiC8bF+/IzHm1B6cpiwK2CdRLi2Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9227
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 25/08/2023 18:11, Guenter Roeck wrote:
> On Sat, Aug 26, 2023 at 12:42:45AM +0800, Ninad Malwade wrote:
>> The current INA3221 driver always sums the shunt voltage for all enabled
>> channels regardless of the shunt-resistor used for each channel. Summing
>> the shunt-voltage for channels is only meaningful if the shunt resistor
>> is the same for each channel. This series adds device-tree support to
>> allow which channels are summed in device-tree.
>>
> 
> V2, but no change log. I am not going to review this series.

Sorry about that the changelog is ...

Changes since V1:
- Added patch to convert dt-binding to json
- Added patch to add new dt property for bypassing/disabling summation
   support for a channel
- Added patch to populate ina3221 devices for Tegra234 boards
- Updated summation bypass patch to display summation status via sysfs

Jon

-- 
nvpublic
