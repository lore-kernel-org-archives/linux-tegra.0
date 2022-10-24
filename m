Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E75EC38A2D
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Oct 2022 17:48:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbiJXRsd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Oct 2022 13:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbiJXRsS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Oct 2022 13:48:18 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F118287FB5;
        Mon, 24 Oct 2022 09:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBHuEOhU+KAjYcqdwW1n+yXlmLuTFkCJwShIROArMJ1dj7uwqllMG/7Jw7XnSIXIxj7aCxPTVNYLOCMd10oN6S3z+Zz90jZGdz1fUs8JK+MHjDOQR35nyfheNzYnP21GOCa9EcXjt58ti/vy5z78OfKOBQApSVXuLnagO57j+XQq9UJ8N4Dupg+RDhpH5KBYQbqhW4WOBZvkKCillprpKcXf52LQ/26sfQyfejGoeg8NJsy6v/Bx37jGVFCxo9wgEps2TgqgjbIJR+25FD+VfC3socoKDa78Ox6eIstRFAghTkazlDv8Cey4QIXlBoKOwA1N27u1jPmXujsgqFEwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrqHYP9BZdO40519lyI+U4xX0VrXdJ71tFGvZmpqcVU=;
 b=C8Hp5zIzXrvPdxtYH+bm71iOi0oZ43dCRHB4DdlpHXF7JbbNwtamVc9DDRpS9jPw95Vs+Vw1P1XAkSD5W1gmiXGE3eSZkMaw17SHjfsJ2E/1U0JJcmILOgjh8Cs0fSfs+ZhpdK0+4E50kaozgAJaGTvSrK3o5Ov/Mo6swFIGC6bfHU5QQGItuSmlh7OaI25T/zaleKhr1AjV0xsb5IIajTc3DJWQ7LhptvZ537rMY1nUcEgP4oEzS1bzoT0YvczpYKD7F1VorCphi7HCqRCGJVnipQuWCla58/16Zmq1AytzbVuTLNcYXwsd/m3FaRIDAxg69bHNHf8PYczF4+jIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrqHYP9BZdO40519lyI+U4xX0VrXdJ71tFGvZmpqcVU=;
 b=QF4m3tFt0W9N1MzCa+OO+ep3JSFn1LbWd6+aK6tz+/zPbLO4CtNXpd/mLGg9SssXbqyGXT0xaMqBPQeJZhnoYK7AHOxs2hScMn9ptn3tPKI+x3Mm1Afk2SJ9DxyzVX6iIj2EagDWi7bW+q7wIq9PyMGKLGaiDricQZidl6614Wwrcau+GsEBwYSOn06Rtw0qIv2XZVfBR/cGP1fy+oFSOQl6GjqLHB+HCAaShgith3AGrde1E6IlqkDBq1Zwu5gXPKoZDu6R3OSJKamSob/BwFVRIH+WI4eHFb0GHr1hDkTCWy6hTrzNI19zs1BRxIaoJceR0Ebtj8aCSoO7Rxp5+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 24 Oct
 2022 15:55:44 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%6]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 15:55:44 +0000
Message-ID: <04c4afd8-6892-e64f-9ed5-b58d17770e8b@nvidia.com>
Date:   Mon, 24 Oct 2022 16:55:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] arm64: tegra: Populate Tegra234 PWMs
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221019132903.157703-1-jonathanh@nvidia.com>
 <Y1aUS8KK4Uy8q/9E@orome>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y1aUS8KK4Uy8q/9E@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0330.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::11) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 64183708-0662-44a6-639f-08dab5d835a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKnYAIOYf1P8Iy04DPpYRnKKuS9T2ZCeBG1SmDDr8LufoLDt+mB2HullZfF6FO7Wg8a0i5svJOelTIVg/6b9hKvXEK43SJkPhRNTZvU6cKF+uM1ICKeCubmrWneF2ogFzcVIk8Z4bJtq4hPfz8wzDmHLj9OqtiVqLi73NfVvA8moaWBr39kCIA/aUheV5zKCeB1JjJvk1aRhpebGXxfvtvvj9t/RPUMnOFEjboI6xOVbdrTrWbXUxhvcaobRxdu1+Wo2ekf7DFB3RL7FZV2I0T+dEXImWC/b+7L4J/mEgGdjhFChs7nRnMZo5GYKVUxCreC4EbEZ5Bu455pOjqtVtoiWrEZ8uiQkhu4GTDhZTI0LeJ9AhZsivUOeMPEewto4Lsv2SC+JyCkZtMvwHrUraE+HxdKzu0BL6crCBjCO6y34IhdtrklJCyktfArE5L+ME+BXxXWURISkFih8nwXSf9h2fZPlvEa7enZtjxQXZ3aPne4ZMwL6j+FtA6supL7Nid6FEHNj+D2Geil2mjcUVZ5/4dq7UHTm+sDXlHRu8v4xO6VhPl6+qhINE/90UlZWz7lkxIcZZLZvynaJn0OImWzTeWVcmdR9vQEG/jBZlmPWvYNUYMbbv8mooZTptDJcwUDAaJKhdb5nv3/X/Rg0H8btuiJwhuiNdrpib2ILvPrFzkqXRxFr5J0SRGy38tzINPJ8gDMRyL1W4NhYKATFmbJ6bW3pTvK7xvyxKhZRYpB5rmuFlFh6h/O2LbfuN6PwrhbcdZsw71XGwhIqSxW7UHb8OhVrhVhDaDmYIpeU4W8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199015)(186003)(41300700001)(4744005)(5660300002)(2616005)(6512007)(8936002)(38100700002)(86362001)(31696002)(83380400001)(2906002)(36756003)(316002)(54906003)(6916009)(31686004)(66556008)(66476007)(8676002)(66946007)(478600001)(6486002)(4326008)(6506007)(53546011)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a21sREgvdW5CZG9VTUdPd0UzNG8zU1NhWVcwa1piNFoxSjIrU0tIYWpUdEZ1?=
 =?utf-8?B?bWwzQVU1cUxHd0xFeEVIeCtZMXZLaFBVUFhMemlRWXBJS1BaSTNpeVRaRWNQ?=
 =?utf-8?B?ZURsVk41UkpaL3hYZ2RudG9xUmM4bis3YktTc0NwSFBnMjZpblY4VWRsVUZp?=
 =?utf-8?B?NXd5YVpLcTdKN056cWhOREZwUVBpdFRJNmlNa1pJL3pIdmVnVzB1U3Q2UFlp?=
 =?utf-8?B?T21aVlpNRVN0b2dQTVZTZU9qejNXenZyd1R5dVRsbnJrV2RtWG5YUUtpSDVo?=
 =?utf-8?B?ZnhtemxmNkVHeEJWUHZ0MzBWeWZjUlVqbEgyb09KeDNUU3I5bXI0eHBKODBT?=
 =?utf-8?B?MDRRYVN3UW5PTThRNmJWcVhDOTNGN3VVbExXQkRJYXp5cTRuTXM3eFc4Zjd0?=
 =?utf-8?B?Yk1iWklJS1BnWmg1QW8vRm10dXJDeDRnb0ZXenJXSzI5dU1jb0wwM0hNSVZy?=
 =?utf-8?B?T0dIVHNsZDhJQlZ5QlgzaUlpd3Z6M1pvUjQ4alNFMEV1cytFU3UvQXEvNnNN?=
 =?utf-8?B?VlZpU1AvenRubmUvUGpDQkM0T2QxYmlxQU9adlBWbEt2S0l1cU54czA1c1Zr?=
 =?utf-8?B?ampoSTV2RWFpQ28vdXN1MGxLTG5EdWp5Z0o2Rmc3MVFOaDB1ZnI4dmFncG81?=
 =?utf-8?B?SkZDSTNVcjNSMldDbGFaVXRlelF5eVlkQVY5a3BlbUE2MjNTMEZmRElHQzVO?=
 =?utf-8?B?RmVHdWlHNHZ2RDFiUjZyTHZoeFYxTWt5RVA2RkRENXVJMTZnL1ZqOThiZ2lT?=
 =?utf-8?B?bUpPQmpuR0ZoRUt3blM5bmZiTmpkSlRRa3hEZkgrTUR6RXZOL0dBZnJyd3Zq?=
 =?utf-8?B?VjFPRkM3MFRPdWVaS1B3VFd2ZjUrUjlsUGdpUmtTUnpyeUgrblVCaG9vekFW?=
 =?utf-8?B?c0ZzTDl5OXNuenFqaCtpNW9qQUI3R3ZOaDMyUExJMXM4eFVBa3JuUW9qeGxW?=
 =?utf-8?B?NUp6MnY4VHJUWXVnakJSRHBzZHM1cDlFVUNkUmhyMHhRWHM2TmlOcnpqK2JB?=
 =?utf-8?B?OUpnWTl0dUF4QzR2bDlXdnJpbTlHQWc5MFE5MTJSdVdlU2QvWHo2Rm1HbFpP?=
 =?utf-8?B?V3VsM0Z1Yk5iQm9VbWduSzQvekFtTW9SR0R1djEvRTk2TXhKS3JqOWxCZmtE?=
 =?utf-8?B?L3lqM2pOazRHN2V1Tm4xMTNCdUMyRWg1MVQvZnpVMW9Fc3VtSFQrMEV4Y2ov?=
 =?utf-8?B?SlZoaXNVd0pNRHNKOTZXUjdNNnV6QU1oOTNTSTc1QzJDTlUvV004UEtDRDNF?=
 =?utf-8?B?Mk1pbXpRR0V6MTZQYnRSKzZNS05xdENyMXpndGhLcjNadmNNc2lIR1NzSnJs?=
 =?utf-8?B?Yyt2K3VxRWdaRVdWM284OGx1aXVoVndqNmd5SmZRWldOdDRtSlFMS1ZBOU5O?=
 =?utf-8?B?bWJUbnVWclNTbU5qaTFJOXdpVGk5cTB2aVFBZ2lMek5UT21wSGg5bnkyS042?=
 =?utf-8?B?dGU0ejdMSWZiVEtGYmVHamY5Z1RnK3FldjZyYzZocHcyZTYyOVExV1JSazFY?=
 =?utf-8?B?MEJsakx0Smw0Rm10aXVhN2xqV3Q2cWdrQmdRQmh2STdmbTcxYW91REpkUk5L?=
 =?utf-8?B?OGZKRUMyRlpOL0R1aHhNK3lxWlNiM09ncFlIcUt3ZlcxanN6Wk9KTUxQTmU4?=
 =?utf-8?B?bi9ZNVVTNmowMjI5ME1PMFM0VEZ6ekNrOUErVG1DSXZCNDdmNDdNVGtJeUN4?=
 =?utf-8?B?RU5zbENPSFcxamM1akhWRkNWeTI3SkJ5cDJPSXdWeGMvd3RvTklUSFNnd0J4?=
 =?utf-8?B?NTBOK0NGVHJlQnFPVGlHRE04alk5dkk1bDExeml6TW9WbTJBckZxRzFSVjNF?=
 =?utf-8?B?MnNuWEZZZVVkOTMxc2djSjVRNjh6Y29oMXV5NXZlcGFJQ2RwUERaSFlUZWl4?=
 =?utf-8?B?ZmNkVTlqRUVjczk3ZlN4WjJzMzR0dnRZRzJDWkk0MjExaFdQQWJob0JzcU4z?=
 =?utf-8?B?dnVUTjI3dFNUWFlvNGxDU05wSGtucS9velIra1JTTGFwUEpQRUMvZE9CWkM5?=
 =?utf-8?B?cHgvblo0SG9HYkRQbGJYcklSd0RMVWJpU2N5WHdKZm10dUZYMmtvRzhRSHJr?=
 =?utf-8?B?K1VoTkdTdzgrUDZzZ1ZJcUt1VVlwU0pJeExxUGdvZW1yNkF6ZFFMWXJYWDBw?=
 =?utf-8?B?aEJxM1lGdzk3enA5MnFCYThnRU83dFBmLzhsaG5hZm5OMGlCL3U5TEpacWlO?=
 =?utf-8?B?bm5tNWJJbWZMWHA1cGQ4bHlqWnN4TEZobVQ4NmVoT3pNb1RJMVBMYnEvM2p0?=
 =?utf-8?B?d25hS0NtcnA0VTdUV2VVVnAvNS9nPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64183708-0662-44a6-639f-08dab5d835a3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 15:55:44.6621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63QAdRlkLtZbtpz+UHWd6R3VbpmnBKsJtE013/X+Vm0MMYTykWQkZULuwQCtPoPUeIyXWBNbdD8XulQjCQIbYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 24/10/2022 14:34, Thierry Reding wrote:
> On Wed, Oct 19, 2022 at 02:29:02PM +0100, Jon Hunter wrote:
>> Populate all the PWM devices for Tegra234. Finally, update the
>> compatible string for the existing 'pwm1' node to just be 'tegra194-pwm'
>> and remove the fallback to 'tegra186-pwm', which aligns with the
>> binding documentation.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 80 +++++++++++++++++++++++-
>>   1 file changed, 78 insertions(+), 2 deletions(-)
> 
> Both patches applied, thanks.

Thanks. Looks like I forgot to enable pwm3 in patch 2/2. I will send an 
additional patch.

Jon

-- 
nvpublic
