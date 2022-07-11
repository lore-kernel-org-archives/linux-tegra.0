Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF75C43334
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jul 2022 15:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiGKPnG convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiGKPnG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 11:43:06 -0400
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 11 Jul 2022 08:43:05 PDT
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 113F461B17
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jul 2022 08:43:04 -0700 (PDT)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2113.outbound.protection.outlook.com [104.47.22.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-vYrKE5AhONKr8MP4wL5PEQ-1; Mon, 11 Jul 2022 17:36:46 +0200
X-MC-Unique: vYrKE5AhONKr8MP4wL5PEQ-1
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GVAP278MB0262.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:37::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.17; Mon, 11 Jul 2022 15:36:45 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95%7]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 15:36:45 +0000
Date:   Mon, 11 Jul 2022 17:36:43 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/5] dt-bindings: arm: tegra: Add missing compatible
 strings
Message-ID: <20220711153643.GA212710@francesco-nb.int.toradex.com>
References: <20220711152020.688461-1-thierry.reding@gmail.com>
 <20220711152020.688461-5-thierry.reding@gmail.com>
In-Reply-To: <20220711152020.688461-5-thierry.reding@gmail.com>
X-ClientProxiedBy: MR2P264CA0183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::22)
 To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a44b7948-7641-491b-7011-08da63532942
X-MS-TrafficTypeDiagnostic: GVAP278MB0262:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: avNG52FAFZppjq0zW0dI9HMyHO2q7xWAVxXmUZT8sqS+ZxRUixJiVS1A8M67obXg5vHNkPnVQfVSajTPumwplLv2EzD7/TE8SYPVHjV0lwuzLzVlcH0sYpL16IOy3nA+XX8e5vMg/A9eVfe0N+pCF8zrjv+BH44dcsaS+omWklgw52kCSQT9YkjXzdbYo8XIK5QuEKPsRNiSuNh16AxnpFmRB1VvtV6wXA230QAyObXUtzluF6NrB8WNNJFDqvykgTEgJziWj7qUmn+TPxmrrN71wapUHMB7KirPQgWd8n3HVcD15ZO5FCJpeTNkgx64M4NILQ0u6149F5wpgKc/d2kWGgHMpGOtE0lkhByjTA/Z1g5muyH5EejrjiDWbBAJyIELaA/D1R49uETf8o+tFCMCpK/E8A3EJ/q1tvZ8jUUzcnyEBua5NtoSGUvWnizW3H21Nv6SvWpjg8xluYjN6c316UdtoGZ2t1PdeQcMxYkS5qT1YKpUDmo4ROpwEdujU6cREbbCfpAtBItKW4iwyBCJ8d/61lcl+mEMClcFkmMJy+UC2H9rrq4Jd9WMpW0lAKfGqVoiI2hIZk4bE1dgHtTFnRgIWQhQUbghqZaF1DNKnsFXbefasp/9QsGOvx4yeEbTwcqZ504mg1ptP22IrT6JgSfjSyA3+PYa8I8/DhPa7i3aGoFJqFlUwb4MZcpldVZ7Tj3+6im3vDvIWqIP2N7+nYWpU7/TlaafJKG7eY2i1nlZxlSGLhKqsJCiUZapeDTArHd0W1A62l9oyvid7yfrDQXz4dKI1ZR4n7LA/vQQ4o85p1NvSfD1hEiRvXYP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66556008)(478600001)(2906002)(41300700001)(66476007)(4326008)(8676002)(54906003)(6486002)(186003)(6916009)(33656002)(86362001)(66946007)(6506007)(26005)(6512007)(52116002)(316002)(38100700002)(38350700002)(44832011)(4744005)(8936002)(5660300002)(1076003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jkxsbGrnQmZB5Oe5wqF1epiKjlnjQ7k/xDpsocs/uURM8uiWW3ew8gNFVBHN?=
 =?us-ascii?Q?PR2Q45GanL29JPQl4GqIpAfzIFWPy/5YyYyzeJ+YDa3dXLsE1ILXNVz+PHIP?=
 =?us-ascii?Q?a+nsHib3gT10+mNnwbE+t5upx+WgEdOKwKtS5VNp2gwCQJ5qaON+THv42qm8?=
 =?us-ascii?Q?2wlVFsJVvB4IgtRQuTZI3MZDpWS16ObmK3tdXmsUEf8vOPO8sZ7wdCHqcgxm?=
 =?us-ascii?Q?dU9wiEW4UaIBqHNaOApmaUd1dptGar1g7M7C/Ivg/gBJRx513DyEU4ntzYH1?=
 =?us-ascii?Q?dyVhoF3W60UqYS37zWundJUWzlk/kMrqT9GFhgzgr1uELk3n5iuPGVGrbghf?=
 =?us-ascii?Q?eU8b2YVV3IteLP3c8Pc6IpQCVHZ3CKcmAMh4PBD/gcOH6P7dZp3UDyX+vPcu?=
 =?us-ascii?Q?EQXs3DoWRqwJtwQIhNBA8B/ya3Ysjf+8Zbll+zorcASTe+y8VS34X5/Lguv8?=
 =?us-ascii?Q?tvQ182vqXhqIpdObWEN9vlahLGjJaI8A9sFJmMXULUNiBqSQ490JWPgv24CO?=
 =?us-ascii?Q?NSyctM05OfRVC+IrD6AM9JBnUi5jsvDN2X0oqRsEtMRy0LReJ3/pC3xjws/o?=
 =?us-ascii?Q?6Pdw/WY7fq9+OwGQUNqms+lBya2h1GmhgJjr1WBFnMY0b6IG8Goj/Kq0ulEu?=
 =?us-ascii?Q?EhbR24KNIfFUgT4zedfJAF6I44XFDyp/c/6ZGEgNRyMruPi9KNk9HPmEL7tp?=
 =?us-ascii?Q?7XDC1AQYg+lfWXcLFfQRxSnrzzP7RrDTcWOkDZMaoC/2OrV6gkT41gfYqnRM?=
 =?us-ascii?Q?8zmdbcfkgVHpFLv5PMk2qle9QjrwWMqSWxW2CMWBEwkssa783ouugRJKYHtL?=
 =?us-ascii?Q?xGOgzZ2nJjxAtZ2pdqN7U7d1AWz831+4M3yUDA5bBjYezes1TDurqjCZv0YH?=
 =?us-ascii?Q?BK8cW6Q7RXMfhzYlmOgVc8vGOtYWOrAYxUiEb5gmLRmAaGOtmJnYgmPLJRt4?=
 =?us-ascii?Q?OBz0scBNpbSlVXjneDCr8UI4W/vAK8dvEvcC6qYbZJn0MHSZ+5zbmuiwzva2?=
 =?us-ascii?Q?xzM8nAsu3rZ6krR5wcPmUe6xwdhQbBN4pNXhjAbElvuHZ46WZQ5dzoQ4YOUI?=
 =?us-ascii?Q?ocJYvjezBVSw1/ihNUBScVfWbhR/lEdMJkMTqil5OyvKePi8SPsK1eaN06OG?=
 =?us-ascii?Q?E4t7BdpLq9u/WJt+gHpQIz2tO0dKupIZa820U/PU7KfxpbJOzhdSEBnRgC+t?=
 =?us-ascii?Q?QnDOp70VopZQGc5dnFCpKzIbrP9Kc2fmEcb3te90uhxxCtETK2ni8DlycEUS?=
 =?us-ascii?Q?pqUoP91NpqOXKiPG1qghHJ7AwR6ONdpkUZ/UhuVyn15KkfYnkjEUl+PjBTox?=
 =?us-ascii?Q?LLQCvf3jYJgqGcrLeul2QGLxpcboWMTR3uNRoV/GUAxTGGQBSHSN4c/Fl6f7?=
 =?us-ascii?Q?lE75qP27ZjkX9kv7kAVjJf8Q0i4WZIJCaCV0GVjuyiJKRZ5h+ZCt2Xa7MTeK?=
 =?us-ascii?Q?d38lIAjqISMK3Yz1WzAqeO7suU2sb4oH97IByQYRyJvNKSy0SSjzKxveSssd?=
 =?us-ascii?Q?UvVgm33/31E0gO+pJnt3KOMxjaTCMLiVEVC1FJESaDAKc9N8ma8veZyNVnBj?=
 =?us-ascii?Q?7pLGRf/0j991QPhM5OBQls6QadRpk3pnPFl5yhBANTmSmJAyuvcEkY3TkFFv?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44b7948-7641-491b-7011-08da63532942
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 15:36:45.4969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymdMPpyTrEd0aSmHXXNzPDWSq5bbBJ67cAeqw1x9GlOD3i4BOKknrzxiOP7m5Grgs43B6wGgCCwF/4Ld0fRNYvkKsRjOAdZTgj0XOtyn0DQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0262
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CDE13A77 smtp.mailfrom=francesco.dolcini@toradex.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Thierry

On Mon, Jul 11, 2022 at 05:20:20PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> While at it, also fix a typo in the compatible string for Apalis Tegra30
> v1.1 evaluation board.

Appreciated! Maybe you can double check the Apalis change? I cannot see any
related change in the patch.

Francesco

