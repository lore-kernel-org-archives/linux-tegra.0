Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298D6C00A5A
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 12:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjASMWT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 07:22:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjASMWP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 07:22:15 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5139648606;
        Thu, 19 Jan 2023 04:22:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtZVpDmUNdPtZoTH8KZQ9zc5P8ruvvlh8IndUZ/ACyzdQ2gmjO/M2YnRnDDlCq+ZAlgJYYU0kRVOMcIvofDjuBQ5SHWzHGvgpdpghsinjR3HmD1nTOtwIvuG3zBmvjyeuU7s47EcbW9MQgHt/+EjT118YfZKcin0excaIghscJu+CgHzvk73OCaQbeo57p4QXGBiAPFZvw6KOh+zkXljLoEWACRUqIMjKDwuBohQ2kB4k4u+fPBwe7iI5C/hn/nW5e6rdVvVmgHk3F+pIZISHfAMJ3nrrddtFiqk73GQLNuH7N7Ai6kughfyBaGwoaWycbltlP7DeOagZ2aj29MsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzOVMbymP86EMPeUAjSF+VVGVT4yqSjwtSmj2toYNVI=;
 b=GlS6Yd4h4ag3sKZhMb1Q4NmlUJ9RyspI4U24nHM71cyBnTRXmhcfdHzwTLa2RqdNjAN9zMcKq7e+/BJp1QMWANz3D3JVB6RKIcWFordGRKLIU7tb3ZR7bvHVnFwDvh4wvKg+5I/Nlj9X+IRB/nfOlrvZhoDDCDVOoG3X6rDnM8lCjGfIv/4MsiH49AKlsNrgmwaw4w08jokNCxIEFjTjiuei1rkDdy+zJxKxEY82kvMqQYuvIK1sIwVJXAadmWgLPNyl3PpjWACsYdFYkVQLdvKI2rPXv6K2rzOjnll3rGz6tbXXY7KS5ljzRoSLAOc5doNZQHt+e4fixHW/lpdMsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzOVMbymP86EMPeUAjSF+VVGVT4yqSjwtSmj2toYNVI=;
 b=JIms+fcBsI7t+oWdJuTGDSO/O7aEl9RR3w97TDaCoVIY19im120TeWIeFuLaJB1yTV5gKeRLSnhunXjLSiW2WAVzRt9spJFa5gMVHhrJ2RmiaoH9E9i7F0hxjiEbGBC4wZUoU6dgMdq1Jp6YDzJ7fXp2rba2Ryaf9zFg9beqM6fiLgaeZfpBqpGtz479jkykDl/Fn69KPXOPw+gnRXxAMEm+qlB7O5qte0MAXkT5hbTQu5BwgdPr3ozziOgy3Ux/mMA1vNpyV7JGQFb2mGBDRmlviLI3yy+iQwcPN7fBFfOXKuOQeEFWC/DavsWe7TbLv2LUf5fhTe7IOlkzeb5oJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Thu, 19 Jan 2023 12:22:10 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%7]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 12:22:10 +0000
Message-ID: <870ab041-4e39-cc82-7e2a-7c320aa1d0f3@nvidia.com>
Date:   Thu, 19 Jan 2023 12:17:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V5 0/6] Add device-tree support for Cypress CYPD4226
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230119111741.33901-1-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230119111741.33901-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0657.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b56e140-ed05-4d2d-e2a4-08dafa17c9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 64BI4pCry4l4v93wKGsE8K6tPKLud4H8LavFvcg9Q/+R6a5eb3qiKA5e8n70nhivLTpQ4MNyzpLfs5dZquIhjIpZUbOewm0YW3+gLB3fCkgjQsKPZsTlWfTFRecezTwfSuaUMQymzo+52YkcmR/MSZdPD6uEs6gJ226S9Lixx9PsabtsBcK3vj0G82LIFsD7vNoTipXsMODhjYypJr0j7XLK//DmVx/LhshwvJXMLCKQB9/PuDySMGwq/35UwaA1nK8JAMtZMV14q590qQ/TbtJO0ypffOfSMmlCKrR6rEwfnd8vlKuAkcSYr6PGctCIy5p8qGFVGsA4okGpzkbVWFRLwVIOx7Wqd3VnV83BOiL0SQNKVGFNKzjv2Y/E1a7q/k9BERCFAlq/PCMZ5i1BoM2im91sOXr3tC4aw3iD5s1Hx/ocrsavo22+mDuiFBITzHovnjMkeLRrzBjydaGOtEr14mRZvG18J3GfQk9bCCfA78Ghky0Hj2bMTL5RmilzKDuLbhxOw6Hz5KF+CMl/XBgnrsgTn5EeJ1yM8ohO62VJFWKLChfhVhw/qvlQchOcA9bwANWwo1X75D8/I2WoqlvY1jL9FcyoNQ8TzBSl2tj7LHHUB+kvOTXCYclwX4h1zw5c6qA7CL0Q4XPgKoZvqkVTWotnw+f7k9vg3S8auEQB7qruk2Wp46XkordSC2NmrH+XnpuFwml0hY23/9dm0rRvAcSTF7XAKWz9IygrB/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(31686004)(8936002)(5660300002)(86362001)(107886003)(316002)(55236004)(6486002)(36756003)(6666004)(478600001)(53546011)(6506007)(31696002)(2906002)(2616005)(110136005)(66556008)(66946007)(38100700002)(8676002)(4326008)(66476007)(4744005)(186003)(6512007)(26005)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHQzM2Q1b2FjNGJDVHRwWnVOY3hGcWlkWjhiU1FSWUZQVm9USktZbTdzdFQ5?=
 =?utf-8?B?SHNRcktGVEp3UXdIMnozV1FENjFKOEh2OTRnSW16YnNJenY1VHBkNkhjaWd2?=
 =?utf-8?B?VHhwdWk0SkVQbTF1Q2lSaEkySnpFUG9EUmNVNE4yTTJsZ3ZUdzNwM1E0bkFq?=
 =?utf-8?B?clRHT1VsMEJMSGpSTFdMOTNBdHlhaVBFOTVMK0MvNUVEMzg4Yno5N3JxMWl6?=
 =?utf-8?B?OXFUcGorSjVKZXl0dGNmRnlKOFFYaTI1Sy9QQkJlS3VlSnMvTTZxQ1hXd3or?=
 =?utf-8?B?L0VSQWVvQitUQldaN2pGVUp3bjl0TXdVRGRIZy9ickZSNnpQNHpDUTljS0t4?=
 =?utf-8?B?WnBxUVNKY213eHdpL2NHZzNsWkRwZlduTUtuUm1lcjhNNEdtRUdkd3VnTUR1?=
 =?utf-8?B?ZUlZajZ3bllwR2l0dlR1dGVVZTlXNXpVQkI3NnIxaWI1YmJsNVVKckFWb2Er?=
 =?utf-8?B?SytGRWZER2hFZ09qbFdjM3JZdjdFd29TTWFESUFTTjNnNUJQZm5IOTEwSngy?=
 =?utf-8?B?cnNablRycndRVFMwR0J6ZlppbEM5Sk93TUFVQnNKRHM2UWFkWmlMMjJKc0lu?=
 =?utf-8?B?bU5LV2c3OG9weFFKZmxXckJyaUZ2bEJuQlU4ZFlkUGo4NVhYbW40bU5aUXFp?=
 =?utf-8?B?cWNBU0xkSmFDSjZYNGt3MzlLemZINDlFd28waHhqdlh3aE9WU3E0Nm45bGVM?=
 =?utf-8?B?YXNIYkxERjFVK2RmaUFMdGhsSTRSeVVNL3BjZHFtZ0tLUXFxcHJCdjZvQk1a?=
 =?utf-8?B?cUFtcW95Z0NhclIvZGZSdk03ajBmTXFRZHQ3eHhja2pjQ3NYNXpOZUFSVHRp?=
 =?utf-8?B?UVlDQnV6NDBJTFlCdTJRdnlaeVRoKzJEQkxRNDRidStLV1hVenZ3ZDVrbGlO?=
 =?utf-8?B?Y1ZaK1JzYUVXU1pULzMzWjVuOGRORVoxb1Q0ZGpwMDFWK25hKzNmZXF6b1Nw?=
 =?utf-8?B?Zk5QcXpLTk5ZZWM1ZERMMThKZHRzbU95eGZkQlczRGZoclp4SnJPdWZSd09K?=
 =?utf-8?B?Q01mT2pyUksxWFFEc1JVYlIvSnY3QWl2ZkxicmV0Tk40U1lzSXUvbWcyNnFh?=
 =?utf-8?B?Q0JOWUk5Ukswc1N0ZDdKYnk0RGd6dGFrY0lDTFdVaEtPa1lMN1J5aHNoU1lE?=
 =?utf-8?B?T3ZJOHlHNVFQT3A2QzVxRHJUOTNqZ1Q3bi9nb1pJOHYyZWY0M2orSU5PS0My?=
 =?utf-8?B?MlBUZXI2a1M0NXBkMENuTVJDN0Rzd3dkb2piL29IdzREYXpzTDNWRE5NNTJn?=
 =?utf-8?B?azRZV0hnaytYazJHcXVvVVlkLzZ3ZnRtMGJHb1YvRHZZYWxORmJzL1VQdnBy?=
 =?utf-8?B?VEpsWmRZQXNubEhqTG1oRjBiemV4b1VYc1pxbjdKVmltME9oUjQyRGcxWFR5?=
 =?utf-8?B?UE5wVXU5TzJVMXF4L3UzOHlDcm9oSDkwZmdJeVBPWC9zYmdleTJpeXZjWDJO?=
 =?utf-8?B?bENyaTViemlIUWF6RU1EMTYxdU9sUXJFbXM2anBLekJHWTBlenJlWnJYQzEx?=
 =?utf-8?B?YzhibEZTNExiOXVxOXNkYWNETk5CMkE1eVpNZ215YWlhZytkRkhxM25WdmJk?=
 =?utf-8?B?dnNPZWkra1hreW52RlRmQ3d2OE5PeVlhL0Nyd25UYittZWNiTWpsR1RiQm9l?=
 =?utf-8?B?cW1hTWdySXdGNXh6YS9rME9zUm1VTXBKdUxjWmJrUEhjcEdSbnpCcWpVYmZt?=
 =?utf-8?B?M1NidGdUNGpuZU5NK0kxQWtiNVF5bmN5b1R4UmNLOTlsSWdQMXo3c0hIUlFl?=
 =?utf-8?B?QTdxN012Y2g4NEx0V2ZNUTY4L2hnMFg4QkRYNmhWMER3N0J2KzhjNEpjbHRE?=
 =?utf-8?B?QUIwN01tR2t4aklvUTBoK2dlWlcwdTZrdHA4amFvMVRrU1ZmZUllUmJESmIx?=
 =?utf-8?B?RmtZazdVaUtKTGx0YzdpYjdFeGxhRDJhNTdRQzhIU0ZaUW43eWJDN29BSFEy?=
 =?utf-8?B?REpWdklydG5GME05eHpmU2s1c3JNeEZIR0ZPcmdDb3dqbVlnUDJDbUdSZFlt?=
 =?utf-8?B?ZUN0Wms1My9wUmNDY01ZSjlOUjZPZmpoemU4RHQrUjlMZzBkZVVlRGZDbDYv?=
 =?utf-8?B?MGFEVVROYTVKNndyZ1lHeG93ZGJTdCtpOTdndExERnFEeTVBRS9qcjJRM1RQ?=
 =?utf-8?B?Sy93dFJrbzllMjEyMXkrcE44SlNZR1NrajI2YnJ1ZmR1ZStReWRTV05NKzFn?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b56e140-ed05-4d2d-e2a4-08dafa17c9c5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:22:10.5987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQ1OruTi4N9CtZZwtQYf59cP66039CcT2AR6VKWYJ487QKOSHxKz15dp97titehUB/Je8v9Gu4YKwpjxhHffJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 19/01/2023 11:17, Jon Hunter wrote:
> Add device-tree support for Cypress CYPD4226 Type-C controller and
> enable for the Jetson AGX Orin board. This series is derived from the
> series to enable USB host and device support for Jetson AGX Orin [0].
> I have split this out from that series because it was getting quite
> big.

Please ignore this revision. I have posted a V6 to fix a trivial 
compilation issue I had introduced.

-- 
nvpublic
