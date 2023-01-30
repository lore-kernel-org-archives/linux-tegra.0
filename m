Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9CEC636D3
	for <linux-tegra@archiver.kernel.org>; Mon, 30 Jan 2023 21:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbjA3VKw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 30 Jan 2023 16:10:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjA3VKv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Jan 2023 16:10:51 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2084.outbound.protection.outlook.com [40.107.96.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD5713D6D;
        Mon, 30 Jan 2023 13:10:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnjEHziBV2rLyvrcIyKVIff1cpWoMLCkMmtTaoJG7TgnoGep9Kp7oroZqRAgsMjbjbsndg0JhAB6ymURC/5F2CnlcJ8Ir+B2bofmrLQFsCghER+k8hJEo3b+bCe+j6W2edHsBpAKZuc8NG2IQtwqh2EM/HUmkLav3jIPHS3PmLLkRQeLgfTVsQOtjLXANIgPzOFzAuZzHjy6SSYyF5Jt/gElKovzYTmGS3gVT8UP+30+ob8aJM19Td/YyUCY0sHIa5zzW+6QvNY6WeZhLKygPgWJS+R614UxeoBqXL9Cls4MKy4SmzXlAWnbIILQo1wxZ59S1DpjcpeHUqcvRanHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WluLwYqQ5Wl8oJW5gg+XnAk9SlzJqW8LZTyuvrbC1QY=;
 b=PWKWEsO4IIYU5hRDNIQ3bMqw2c2V/+zWYlLPJcBwUE+2gRbCsdQgJSa6jbdux57B7cIiEbqRuRQ7TmMGbADNYWcHjtnLaDA2N9f1bU4tFmPKByRWX1Ga5o+w0W6Qdx5N3/KpKy3vgs4MhP92efYXNvD1UVnmRGME+U7F6cjaQouYotr71UTISj2YRpAFu7Tu9Zl0NToWFc5ENSjnjK9ib3gC/jAlrnx/Tr0z2kJmjQFE5csvbcmdyU7bAHzX6kcLbynJIpgNSjFYs/pqVQZ8j/sOwBsDOHnEdiytwQ6aF3x9kIDUXwD/HWJNOejVEfrL5Rc/aUBY2b+dXTg88vAVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WluLwYqQ5Wl8oJW5gg+XnAk9SlzJqW8LZTyuvrbC1QY=;
 b=V52YL3Ufw2tQVivVXjB74zYNaqRgxEe6sNvqtvKE4qWjbRTD7JCmvELQ0Q7eANvFtyNt9Ke+GVIFTAcnJHQq45nPVq5ww/Wqq6k4BMZ7vVvztcqZLApwb3gjyiBXqye4DHmmIDPEKvCbluqFf0+YaFtN7gLujPIQy4oPs+uwwsC2dJnGSitKk14KU4Id4ElwDYTBjGLpkKCYaf/ynPYduQBMaOlGJDNW9ETkblLSuQShUhs0pc8x3qhcsAk9FXlOkHfgWC7LMTyrEmeaiBd2bjVuFyfJwpyR2tpRbKp+9NYrZZEBj2QvX9D3+47pEybVjaITrTXsFWvKfmduoWQQ0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA1PR12MB7152.namprd12.prod.outlook.com (2603:10b6:806:2b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 21:10:45 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 21:10:45 +0000
Message-ID: <9708e6a5-1cde-425a-d463-61d82ccae232@nvidia.com>
Date:   Mon, 30 Jan 2023 21:10:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V9 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
 <20230127151041.65751-2-jonathanh@nvidia.com>
 <be2a9eaa-d049-c249-0c1b-d0eb50b25c3d@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <be2a9eaa-d049-c249-0c1b-d0eb50b25c3d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0654.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::12) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA1PR12MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d7acfb-3400-4372-9133-08db03067414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l/nx5nOYDqa723eUTHBH3blgiJvDUMMIHuMxQADbQTNyBt81M4VdbJULkruxQlqgWpxSuJadzMIBWFEDZt37Ek7fLbSVtE6UNbpZi6ce07yYX/PbYn/Dy+fBtLqCbAJsnPUH3QODhHJ3GQ5p8b+XRSrcspDDj6lWAJ2dhE6ORsYXvgC+yFV6V2Yigq4s17LKqy8CQNOgX9/Cx1OvS6rbYGTEffNb3k8CAdtq7IkoMX8nvEV+NlxXUY2XkU6hJZmPggQhi+K7WprLQqdbI5xtdqbgk3ShK28jkCQgqslO4UOgfD3YBofs1zVLTz1/XZLpBKUevfb6FLJElDPKX77Gfzm41mv/3cQWc956PpViKRwKp1bVJnuAucJQpXQgBZt1nBNkBNaxvscxUHfn6p9uMLf+BTwNoM3/18QLe4CSj2TN5FL0t5fQj8yZYg6vXemOIbUZcwG9sIxfsnPwMWdUJxfrCcO1b1mSIXEuKZBTqOSmnil2ug8/tIUHVzFw3r78GMC9pT0UOC9BMbn2ZiflmsDpHk0Jo16xYsWSj309pPI7q5Q9zJ5Bh2+iPnzoZExZjPVcv510HHTslUX3gzsF6TTHuPTpoeAvzWzEbLm8tc8vgnuQHoognxENRNWvryv59Yx6++Etox4HkWNlgAVMwsXhBJmUi7f9pLdlwzO7xavLy7+t5Olih3/EZMmomW0T7lB6cGeJSDdhTSfNYmRyd/KY9mMin3WGbYxgE+WK024=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199018)(66946007)(66476007)(66556008)(2616005)(4326008)(38100700002)(36756003)(86362001)(4744005)(110136005)(31696002)(5660300002)(316002)(2906002)(83380400001)(8936002)(41300700001)(6512007)(478600001)(6486002)(8676002)(31686004)(53546011)(186003)(6506007)(6666004)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZzZDV2L05kUitVTm9CZC9Ba1ZjV3Jncm0rOTl6by9uTjZKN0t1TjNNSnBr?=
 =?utf-8?B?czZGbjI0TGhkTkFaaG8yeDh5UjQyUVNaZVRlUVc1R1A3ZExaTUtUcFNmOGM4?=
 =?utf-8?B?dm5wcnYrSnZ1NmlYK1FtWlBqOXltelBNQ3pabkg0YjdsandIN2QxRGJWQTBB?=
 =?utf-8?B?ZTBFOUxtS2EwNlVRQjlRUXZFMEVwVzdMWFZSMHFxWEt6REF1eTJVR1ptT3F5?=
 =?utf-8?B?TWpmSHZvcEZabENFb0wzMEdvTy9idzdWbnUwdG1Tdnh5ZmExdGkrV2QrWUhF?=
 =?utf-8?B?anJidmUrNlZYWElkYXFpZDcvRnA2N0FjcjNncHhKWmdaMlFjeGFXUjZGdHJ1?=
 =?utf-8?B?OWd2RmcyVDR3UEFsMGRxSGlLcDdJVW8ySThidmdpVjdYYjNjL0syTnVyZHZQ?=
 =?utf-8?B?Rnk1WHErbEVzNnVvSi9US0NqUlljOWZ3NXF6U2ZuNDJ4cXU1QXBsSFhPdy9F?=
 =?utf-8?B?UGxtT3g0SlhHWlBRalc1VXhaOHpNVkM1ckNraFJVOHNLQmNiN1daUjV5WGNL?=
 =?utf-8?B?eVFrbzl6WDRVbkNEc210aTErNGF3dld6dDhySGFsWXovZ1ViVmVzU3NTK3BZ?=
 =?utf-8?B?UzNSVDU3QXdTWVBxS3dOR2QycVZUblYrbklLR2ltNkZVM0s4YnBzQ2F4ZTFM?=
 =?utf-8?B?VDZuK2Z6cXJZWVFKU05PSStvTWhMOEM1c1kwaEFXQXBCdHhNTEF5Vlc5MzFj?=
 =?utf-8?B?YkM4S2ZlZWRNNjdlUGI4Z3JkRitVU0lFMGFWWHlMOFBnckk2U3RweWZYVmt1?=
 =?utf-8?B?SCtVUXZjL2k5cHVOOTczQmlZS0JNWWdJNndxaWlqMzNzVUZROTgyNGdTM0Jy?=
 =?utf-8?B?VHhVeU4vaXhFMGd4VFhMVTZ6NGRwV3k4RGJzSjZNOXRLL1B0aXUzbEl1akJp?=
 =?utf-8?B?S25UeWRqUUVCMUhaMjZSSkRGOVU5QXo4bWRLTU5sWElXYmJGM09XcjJJVW1p?=
 =?utf-8?B?QUlWZ2ltTWxKWjh0cTE4U1hOSkJEY0I3aUV6c2xTTnpjNU1udzRTWWJKYmVW?=
 =?utf-8?B?eDJPMnFxcVRJb21QYTU3VWo3UXhjcFcwV1E2OVVxMVQ1T1Z4dy8yc0tiWWs2?=
 =?utf-8?B?N0htK2h4dlZXQ2JTQkx5T0xpM1lvR0lUR2dnR0NYRWZHVWRPVVVQYWM3RUJ3?=
 =?utf-8?B?dEsxZGJhbWJQWnU4eWxtTkpaTUtOMHBWOE9GQWRrNTlmYWZLTFVLcUdkQVhC?=
 =?utf-8?B?STdva3FPdDRIZjl5QnZkV3ZkNGU1U04wdFowZHJzd0ZGUU9KdEFHeGhKQ2Zl?=
 =?utf-8?B?dzNBTXN5RVpFNDRsa3VPVVRxUjB4eHROaEtKeCtua0RrUnEwQjZ5ZklZaENw?=
 =?utf-8?B?RmlwTSt3R0NYWFppbHM5VnREMDlJbTZ4UHJjRnRUQnBaT3F4QVVKV1BKZDc1?=
 =?utf-8?B?cDRROWhqQ0kyemtTSittYVdaSjBPWFZlZjVZY1FzQ2k5QjlnQWh6YVpycUpU?=
 =?utf-8?B?d3lOMkJxOTF1K3pBZkJzMDBuOFZBNllWVXhsS3hBVC9wdUdCNFEzR2tib3Qz?=
 =?utf-8?B?dSsxc29tU202QmhqdE5nVlVQN2Fjb0xaVmFRK3RlcGhIL3J3SzVDNkNtNW52?=
 =?utf-8?B?U1ZERWhVb1pWL1JjZjR4Sm56ZmVRWjFINzFKemRSaHhJU1N2ZVhxWEZScWtX?=
 =?utf-8?B?bi9jd1pHYkxtTldvVXE3b3Y0aW9RNVdsdGhsVTJDVm40dUErR3lRR2VKQzRX?=
 =?utf-8?B?aWRXNlpkMHFVYlFQTXlPVEcxNjliUmpRSFBvSDJoZlN3STFYV1dqbHFuVnhL?=
 =?utf-8?B?SktHU3pXM0l4VjhsTUxtcUg0K1VXdWhveVJkaEJJQUlmY0l3dDMrYWFlRXg4?=
 =?utf-8?B?azRrY0x0TUJWTGYxQXBNeHRxeFRtZlovcjVRQTN6QnlHYXVUdEpwd1J0aSs3?=
 =?utf-8?B?TVlmSlFjUC8xMFN3Ukp0SmZVSlY2c3BqVDQ3Vi9GMWtRbFFsdTVtQWtYZzNa?=
 =?utf-8?B?N2FDS3cvZnRaaHRZbmRaVXAyeHA2S0tweHh0MlNFNkoyRFpwWlMxZG9yZWpQ?=
 =?utf-8?B?eG9NUlRiSHllZW1DSXhCUm1ON0c4QnBLMFV3aWRtUTBFcFhKRXNsODR4UVJi?=
 =?utf-8?B?bkl4NUlDS3dQLzhPU2RVSXlTWENVcFF1V3F1emIra1A4WThieThMbzRRZzNm?=
 =?utf-8?B?RVlsMmRNZmdISXFyOWRGaE84d3VmTk16OXgzREY0NmtvcmNxUHZ5OGtlWFlu?=
 =?utf-8?B?UlJab2p3VmQ5WmMwODNYdjFMQUJQRlc0bXB3SWF5OW91L2F6VlFXOVovWWg1?=
 =?utf-8?B?OTVvTGYrYXFlVzRpanVQMUFweVF3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d7acfb-3400-4372-9133-08db03067414
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 21:10:45.7904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfKOrOiTUJlLTnzdIjL5MNKUVgdXeJ4k0cymU2fkP72L/A69Jd2Rg0iFjYuXtvTbEa6fcaguKZ2QvUxrl579Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7152
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 28/01/2023 10:29, Krzysztof Kozlowski wrote:

...

>> +    $ref: /schemas/connector/usb-connector.yaml#
>> +    unevaluatedProperties: false
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
> 
> I would assume that at least one connector is required (oneOf: required:).


I have been looking at this and wondered if we need the 'oneOf' in this 
case? Shouldn't we just add 'connector@0' to the required properties?

At first I added ...

oneOf:
     - required:
         - connector@0
     - required:
         - connector@1

But this is not correct, because the above will cause warnings if both 
connector@0 and connector@1 are present.

Jon

-- 
nvpublic
