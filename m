Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938C3C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 10:02:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 779C761076
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 10:02:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239838AbhHYKDC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 06:03:02 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14576 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239851AbhHYKDC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 06:03:02 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17P9UJV6025080;
        Wed, 25 Aug 2021 10:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=9oCcYGrmjcsCc1kUVXnxhiXx5bpyPNUb6if1hAX9Fhc=;
 b=fFjSKxytXGq0rG/LXJeVbcPCKt5VIbTVIUDY7Qedmf3ppmKKODQ1fkOshtbhUt8ILZaz
 ALA0x3rAt/jp6bvXv0othLJ5hzVKVFS9UOE0LOsp8KMNbwlc54sU8usey4UXjmWHIqpf
 PXq3uE+gqV+0/adD0wwZHVbmbzKyHGpCSAN3tGH/H6CZZBQzTNIlc7Ei6Wtsju2iKVM3
 VCwn35udb7/Stwo8zMcDZKzfXeQMxOWCI3601RPMAK5++S0Mm7OfteJJZpUOaiWsAmsl
 nr1+t9ioa1DxSg83TApROnaRtD+dhUnil6rnGTig9olm0RMfGborrh2X7m8F4XqMoG2x dA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=9oCcYGrmjcsCc1kUVXnxhiXx5bpyPNUb6if1hAX9Fhc=;
 b=CqnimefKRYJWdF+DLsOf0F7QszEMdJp1B1dOipI8e01rtRdyxcY10EVX9GFfKabrOKoO
 +KVxJREAiA5eNvOTMhx3LQybY+93KomiAuBnDGhjGUNRNNz+T3JCmDPliKYH9MhMHtk2
 urKDPBldNdhUGNYXwiLXHltjOsqqM86gpNT3NpAaRUI/WVcCUe8VWXp62Tfis+MQGCVP
 LDd6hoEmcVwwZI+X7lrGKSYC0aBYTAr5kKXl4jrfq8eSbGhOAXFYT3ADUt7c1UF0Vb36
 90zS7UX6HFk7UW26Yl2zWFxfKcgsO7zBYorLpz3HRCj8ANwq0Z7dlwf8AdaLMTE3CTQw 9Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3amu7vugwe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Aug 2021 10:02:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17PA1cLf192078;
        Wed, 25 Aug 2021 10:02:10 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
        by userp3030.oracle.com with ESMTP id 3ajpm03uw5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Aug 2021 10:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsg1g8Gxs8UKB7zFRyW4PZNahjlIcYakerHNGhKg5TF7oi9HPBfvvj4DY8QKfUjfiJbjPnjhZ0PZKD5DQf38gDyvkk2G3tF3jmBYQ2Qk88b6icj9/qd3FiYUIZ/K3pa+j2ld3bS2pFhTBFIy33bBZ24p8gJpjlTEwCj6N4DEPuxjxFP8Aojq/SwJFzB6O4nuKrARq1Gf4oVtpDzZ9ctOwHXSv9zcq7pfrW3IL4qHHJ/nipaokidJSaSJoqxDB50DgSCUogsGK+9QgeJUmb3cG5Rmy8PvKEJ7ti+hzWIVp38sQnG7jAy+rL4mrt0DheDc+SHcGftLKZhBU6c5hQ2+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oCcYGrmjcsCc1kUVXnxhiXx5bpyPNUb6if1hAX9Fhc=;
 b=bc9nINR1p7hKDFVMJKpAMffqRepjkzeQ8ovye9ohKqScTi9W71JOLmtEsNGx3syT08AWW6TyChCK4IYpfkkGjrflS0vMwUmyHIxrH1howERGQ7Az/+rgj5SjTDt81B9YU89qx1ZjtchkLyaBG1xfhaCh08ZmlqKcxV0S3qGqyI+QL6BV3zfzZI/nQMwm74G3EJuVfq9RPw7z05tEdgbIHBFX+l9YvJL3ukmWAXpC709qNzE4TJl/61rANwjyNCakBa1jt4KHAAAHec66tvJPIjredBUiJy5TovPsIM8Jdvh1v/BudO8RUQ1RqI7EGjoYuEgy8yBw7YomK/VrSpEdvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oCcYGrmjcsCc1kUVXnxhiXx5bpyPNUb6if1hAX9Fhc=;
 b=pEVz6kmcDzre8jBE0WBLASlgtLcZqQ9im91ZRnH9fSbgD1KNfbJF9n+/cl5Lsm2ewMw4OQyenN5+aPyc1QYE0/YSuuA1mud3vaCeKCTpAoQ/fw3ByA7reZ+KdeVs1DpOclyQXU3Lb2anvIscivd6+2UA00LesU6Jd/7kQV3irkY=
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2253.namprd10.prod.outlook.com
 (2603:10b6:301:30::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 10:02:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.018; Wed, 25 Aug 2021
 10:02:08 +0000
Date:   Wed, 25 Aug 2021 13:01:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     CGEL <cgel.zte@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jing Yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] memory:tegra210-emc-core: replace
 DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <20210825100149.GR7722@kadam>
References: <20210825063739.70260-1-deng.changcheng@zte.com.cn>
 <344b7b12-4134-883c-1e0a-cdab7800067f@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <344b7b12-4134-883c-1e0a-cdab7800067f@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0066.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::10)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNAP275CA0066.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 10:02:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b952d53-d681-47f7-4e3c-08d967af660f
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2253:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2253D69B50D409F36CD5F8EE8EC69@MWHPR1001MB2253.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SgPmongDrJFsR5oXvH6uH1xmfCOL64xTFzbC7Md/h/W2oE5+nO9z+vEJqMVPoccVeduBmJW0bhe4vE9MG9fuCPFenFxv1VsFUxOZW8cQPEVdGqPg4MJotCI/ktqrLIdeDyIXp5ZuafNmWBPnGlvmjSheb86bssA4CObdZOSFpzETkO5Dsut1fUKKvMJYE4tnzYTNeKzDVzz+VdYXr0mUuqYhFAbHLc5oNQZzLVCVBewKnF8s18W48JWO5/U+TIpEpfgKAwsCSoqcynoolE/3Lxd6jiXEXO642i3/NAGOQ0EgsMXZCZSa4g+qUmi8M8lO1nZhKhVo873WEPJOEJ6MfEp60IW0/QaPb9elctDWepsdJ92cxZIzdA8I9NYZ/0Zfb9r0xF/XFEZwxl8hhbetAFP3A70c1Zy+C/tSrjeTFFvUpYl93aqRzvtOuhQPtR8hRD16PstteOHyN24BCzKzLsZdGHzqADxRFm/AA3Ee6lJ9zPAYd062/jB8FQU2kEjLoi+ZC93xFGNgT1ZiwVpw6zKJaA0+zwjVaJXMeo+zayfCmnuJcXXwfTpMhGdVe7WIqqRqaEVy0Ilv/UMQb5HxgmAB2ogxuKrJ064F5ZeYkoSZutqf9vYzIKgfC4h5RVt6LBnn4tLmJONVo675IXKRdzkccsILZK51fFpOYR6gFzKllZoFUimrtglhiVtnTS0J8AYI+hQWz5D+nA4rGgUfvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(396003)(39860400002)(346002)(38100700002)(83380400001)(86362001)(38350700002)(8676002)(66946007)(66556008)(66476007)(33716001)(1076003)(186003)(52116002)(26005)(478600001)(6496006)(53546011)(6666004)(6916009)(44832011)(55016002)(956004)(54906003)(4326008)(5660300002)(9576002)(2906002)(8936002)(33656002)(316002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XG/+GsUNxnN19WGEQS7jHta8Us5lwmTp9mBODmg4Ownkrvt3YNESOPOTf5iq?=
 =?us-ascii?Q?3jLm3m3uFtqSNO99t66RY9MRgd1xcxP35tT4m2en4qhDuPw5hbn1HIAQWrML?=
 =?us-ascii?Q?bVDYOxnpEuCuM7XdyzRjIk0sFJz6YpZqQyEd4JQzNKp6V0/R4+vqF14SZSfH?=
 =?us-ascii?Q?oi4XppxFGzvDcgOK02rmA9KcEpZZtbRj2r41oWyBhr5rb4lIfjsCf0WnDl+M?=
 =?us-ascii?Q?tTDKO7J952MB2jgW+aRxdN+HPb7CZrDegbB2XLdzmMMxzyv0JKZIWCS+ZMjP?=
 =?us-ascii?Q?OyW9iPohpsDMgxRLP5i5gqkp3JXp8+Pja2jWsH0jRp7K/hB9V76st79cBLLo?=
 =?us-ascii?Q?om7ww09emq3OUtPKdkIlMuu8nYEoAodw+E4FntQKhYgBbjq85NnIuv+yWUcD?=
 =?us-ascii?Q?n4fkutDmVizJQ+sfr+MnC91fz+NrqueKjg4YiQWfLgpEcdoZlVBEmSfArtMi?=
 =?us-ascii?Q?k34Xgp/FI74eqF1a8dazthPWv3wqMaq2W+08p+080rhhH1eUjIDHiuYrsbeu?=
 =?us-ascii?Q?pF0FnA1658gSczhhduyMfIbZqbhoG0jsFyJrkxozbOaVP4T1KsGYLl5mgCDT?=
 =?us-ascii?Q?GMwxr6OGZq7R9zrOEPwh6KUY7UVXCECO+7p7YsLkff7uB2RtW8YhWG8FraYM?=
 =?us-ascii?Q?mCGrqhQVYBIKLBShWpQd/HPt2UbG79Y7FfZyMn61EOfkvDjnr7pEgs7j1rlM?=
 =?us-ascii?Q?YShNtcDHhK0hXiiDs/prGMY3BjzuGIvX4wLpvV+/cKRvC1O4puf3LxK3lc+a?=
 =?us-ascii?Q?gU7xw/AG6FLZ6HcfybjCIUVAwPJmD/OljdiEWHZm9kOkZ/HNlJ6AuP2wtKCH?=
 =?us-ascii?Q?8fiJsqNGotjfa94c+aLdYXnLR9bbEU3wOrN4sYheH3WqmniOCo7f/deB74p+?=
 =?us-ascii?Q?Ie+GhDoJfh9bfw6XfJ3RKNaK8SJeoqrdtjAcD3uc/I6uFDRxph4PhwyXF3b+?=
 =?us-ascii?Q?vVsBtaAZ6x5R9PMrfpnq7tUYgeYTk35us0tOuIyEIt+ivdHJDeo92gByLlOw?=
 =?us-ascii?Q?9sTOoo2Gc8HjlYPMZBCsy37dosHgxrXC2l5IWf/p9+bUbuYSwVEnDcYFumIN?=
 =?us-ascii?Q?B9FjaD2f/j/Ojx+HH5pkkapBoSQ/Yl4zrjvYN3UzWrxfXmPzVhqVI+AovHCl?=
 =?us-ascii?Q?nhasg2I7h7dyg7JJO0gzrywBTf+s0ZgtUGc8Oq7Vbgd8r73sMjCdDDnlc0uP?=
 =?us-ascii?Q?IjOALsnBPm5coLXDWofVXPUakHUGI4LoAqPD5LlPCAwTiGt/1sL0I716wmW0?=
 =?us-ascii?Q?lJaC0YAgQ2S58Y2ddi9/cXIAUKKx/g0ywIMPxTlg1pbLdaH62ZPU8lSz+QLU?=
 =?us-ascii?Q?YpFV4GPJzgtB+t2nPGQYC3uH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b952d53-d681-47f7-4e3c-08d967af660f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 10:02:08.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5EL/jsOhgddF5cxMXPGMO/vuxEj2eWS9xR6Cu+gzNbuaRRG7x2yctJUyEz6jbBtj35MOoid2GkbNShn6BdHlwio/oFeR64Hdq8FCS0mVk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2253
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10086 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=837 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250059
X-Proofpoint-GUID: hSElOh6LXxIefpGRvcIlxkcUd0W2JhXG
X-Proofpoint-ORIG-GUID: hSElOh6LXxIefpGRvcIlxkcUd0W2JhXG
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 25, 2021 at 11:45:58AM +0200, Krzysztof Kozlowski wrote:
> On 25/08/2021 08:37, CGEL wrote:
> > From: Jing Yangyang <jing.yangyang@zte.com.cn>
> > 
> > Fix the following coccicheck warning:
> > ./drivers/memory/tegra/tegra210-emc-core.c:1665:0-23:WARNING
> > tegra210_emc_debug_min_rate_fops should be defined
> >  with DEFINE_DEBUGFS_ATTRIBUTE
> > ./drivers/memory/tegra/tegra210-emc-core.c:1726:0-23:WARNING
> > tegra210_emc_debug_temperature_fops should be defined
> >  with DEFINE_DEBUGFS_ATTRIBUTE
> 
> Thanks for the patch.
> 
> One error message is enough. They are the same.
> 
> > 
> > Reported-by: Zeal Robot <zealci@zte.com.cn>
> 
> Where is the report? We work here in a public, so if there is a report I
> assume we can reach it? In case the report does not exist, anyone can
> run checkpatch, coccinelle, smatch and sparse, so how does this differs
> from me running checkpatch?

Someone asked for these tags when it was Huawei sending patches from
the Hulk Robot so no everyone adds them and Hulk Robot is the #1 bug
reporter.  Hulk Robot just crossed the 2000 tag mark recently.

regards,
dan carpenter

