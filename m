Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E217C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Apr 2022 11:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbiDMLX4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Apr 2022 07:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235068AbiDMLXx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Apr 2022 07:23:53 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F1640932
        for <linux-tegra@vger.kernel.org>; Wed, 13 Apr 2022 04:21:32 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DA87mF012645;
        Wed, 13 Apr 2022 11:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=4V5eS4e4Ml+1pxYZSyDrmH0dtcsLBDHrH3uUQOyQeKY=;
 b=gvvzOSQLeL42siEzN0oyAi6/ogYR3nkw4wqTyZZzo8ZXmJ6txU1twDDPDPnNC9hpIgpz
 rQ1Nb9DAkx1iE9H1TedEiWiRb8fjb8/zzQLnPKHD6FQ5EpauhBdq/d4fMUOCtsxg96m7
 QLTOLgqZRHt4Jn58NmDiFUUF9bRJi1wvxVdXMmK0JeVcpWh4Zf4/a5on4B7PNE7jlt8p
 GKbgdmedJGpvRBeMNTD20AAlotDA/ySgxQLkrZ5WmQN0amcyUQ3H9kyvJRSxS4678XoB
 s0KuMEFPZ/BHO99PZQutTZOiEFSkds6sKl+6pXT23tB5Y3ixik2SfqpQxSKabzSJzgkW 1Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com with ESMTP id 3fb2pu1sjy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Apr 2022 11:21:30 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23DB6PfJ036205;
        Wed, 13 Apr 2022 11:21:28 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fck13t7e5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Apr 2022 11:21:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYnxYqhiKulUjrOd/Ud6uyFdXvceHLzJKKR/TSL1h/eZIesci66PZBgiMrzeP4iDatr2Nd9wJdC7pcWFu3XSO3AOoj1m4ll69C/+zPqUmLoVL3pXTWUo3c5z27vakuGbniofg03UJK7O8eJ1VwuzAFDDJq3KkijZLijFSkaQTXGdQKgvfnLKXnMoCQAFQsnFvX8i8Q3J5f+/NfQUobPgRjrJRvZ96xL/R3DAFHd+KqkOjCGrlHFk4nUJlYSBdLI1As3ScUm83vzeDGQnNNzwb5wLRht6FOi5zKWHwcv+ujUr/8Q2wMPCiU3zqOe36GEh8uWfvMKo/R6FlRwOW/Ao/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4V5eS4e4Ml+1pxYZSyDrmH0dtcsLBDHrH3uUQOyQeKY=;
 b=edUdDUuaBniaU3SMHfjlJKow1X/UK7IgqNM8Vl4Wo+fy8R9g4OEMt//2AKncXmt7bgS1AdFBXSBegQKGvX6/zRa8dAKiLqol9d2oyCT6YlCoCndn0038g+EGyNIjd3NK27iVqK72y0Iy/HDTkEoP9FGzPiAztWBBP/71RuE44Roq76U52atffzN9x5/l2jP1ggYPRC7VX5bdqtd/rJlMKjzll0WQ+8Fv5Rk7kRzg//CvXeYbhDX44L/lGejQXz7zVQz99Q/G+CAr3pqPxPpXfPk7EX8rgbvCGq/f4PsW/+wguzMYwXsz0WpXt+A8KlfKchwy1xniZUxGp/qGkc8Gzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4V5eS4e4Ml+1pxYZSyDrmH0dtcsLBDHrH3uUQOyQeKY=;
 b=hiNdB+nqzwBaTSFFSeAmF7DErPSeeEYymqRB7TabvGVEu3Uhq4cnN6EfyihFM638NuXwz2u0xDwfnY1StZvq87fGKHHb6eXL5tWZJpuYDKef0Oaa2vMpu9P/F6TV8uGBqbikEq4SVD/Zp1xWjl/ZQJq5XExRrWl2rs4uWi9w8qU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB5365.namprd10.prod.outlook.com
 (2603:10b6:408:117::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 11:21:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Wed, 13 Apr 2022
 11:21:26 +0000
Date:   Wed, 13 Apr 2022 14:21:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     akhilrajeev@nvidia.com
Cc:     linux-tegra@vger.kernel.org
Subject: [bug report] dmaengine: tegra: Add tegra gpcdma driver
Message-ID: <20220413112117.GA21070@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0133.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77ded4b3-3cc3-44a1-c61a-08da1d3fbfa7
X-MS-TrafficTypeDiagnostic: BN0PR10MB5365:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB53650E6A51BE03BFC046416F8EEC9@BN0PR10MB5365.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MbArUMcAN/BIcnu98TpxLiwemgbjTthjlFctHNvSBmy8tgknFsJPPMX1ivzYTfyNeE2CTK7YeYE0leLl6/76oRsUysLUNanf7/N48ZmSEq4YYg3Ehd1+IOG+PvBWDLgVvR+6tymiq2qUcHf+Ym9TQut/OPgW9BqbJ0v/NDvsNGVs+kiLpSV8jVzncoh7H10LocE2oZ6Z+rIVIu5bAZhvophMa7ZGRhTmDg3O8JImDRAmG11CVumYIT3ufWergoHqjsFULE4tfo47aOoGlI/+rn89W/6osKyDMm9DPtFfZ3lmyQKOpyfLXeqIVv9X7ODwS3um/deUI7mAGEW9qtFPlOvh9ipz5YtrLmhPfJoefsNV4/sFs1zSYLeIGa01T5RrGmavJbD2qvCPZ7AltKpJDXDtrDmbupRZHZl5xqRnvBUdaC5TnIoa1e8Li8QBYTo+eyDRTXXH59WWYtDqv8V98dnzJWpE4Bej84n2peotbQ3gKpPxn2FxVlnYATmeMva/lFGtkZdeSIN/KpbsPrfWfeHi0M2jqmQd6wn/NQ5LbIyHK6Q/GvfnScHNdJEJKuFg1W9ZYCFdwg6/ixw7NvIoLj9P5OSsvkXEJMB0Ji8jfrS3e6RwMhWb9VgtEDdkjSUeoAdu6lyqv+v6kKGkvlF1+0SDrBvaEU2srKWud1u60VTFUD6Wsck9PYBneshzJKXDgak4fGqOXrjSO9s5PZ00xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(52116002)(1076003)(508600001)(8676002)(38100700002)(4326008)(6506007)(316002)(5660300002)(86362001)(44832011)(6512007)(186003)(26005)(83380400001)(6666004)(2906002)(66946007)(38350700002)(9686003)(6486002)(66476007)(33716001)(6916009)(66556008)(8936002)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wR3NmnExLpCe+3nQsBocQFvZ9SOAxifzwinZ/a7Tg/uZsdxS2O83J2w3VYFG?=
 =?us-ascii?Q?/sG9xh4h8kBEamHS4R9n8Qe1oprcKZxh9DChyvNOaUr+qsQVr85pq0P+gqNO?=
 =?us-ascii?Q?kg21qnEMWUuKCEBADiFERfoOXzM2uHb1aqT8NoSXj+fsy/x4x2UMDP7xwmSG?=
 =?us-ascii?Q?XFqnMj4b3UBEN3oBE+OFHznaKU8S3rLF5x61yf+YJHzfmu+kACyGevdGHrMr?=
 =?us-ascii?Q?gvCiFnI0r+ztLayR6xxnAnlOH26+AxYyl+5enPuUhCjqRQImW1Hb3Llb+clx?=
 =?us-ascii?Q?fvkPoxkdJeNhAP05DDreyDcecRzX2Rs8sOmKRg4WWf8X+sarbiGJeQCZCTMn?=
 =?us-ascii?Q?LKauG4tgMU5Zef1KGc18gMqDVJ2CILiAK6dKxdR/BpsExn+wFXKwjaUDbr/+?=
 =?us-ascii?Q?WZq9TXIiewImW+7W0NV/vYyykk5mcsN4EdLSgHP4LY37qcPy8quL3xzeJgEH?=
 =?us-ascii?Q?FxoO7tzqxWXZxpjF/5nTJ79AMArMSQYPOwEc+Np/bmg8rLTDFiSLJQJW7m7/?=
 =?us-ascii?Q?cw+ctdTAVOEPes9Coos+7RSE149GO7baowhpDVcG9NcHcZEE9GXcbl9NkxDy?=
 =?us-ascii?Q?Vq96c+wuRQdiCf2/SHfati+mJW8yM9DaEit2VHWUPPsz0Zk2e5tzIExTvN+e?=
 =?us-ascii?Q?KrSrE042fxL5VdpG3zbHXAKuRhk+sFGEw0zPTBBAUd5uPkZKiSHTrNSnqeH2?=
 =?us-ascii?Q?vzrL61KEuFahHi/gqRHKF+ImkW41O1NxJ/dqNU5ES0QXaqPxTPKfY7Zz40v2?=
 =?us-ascii?Q?27YPiDo0AzA+hRlZ6kQhHNwDkQIAvq7YLVzFVckTkg3fVshqgbQ069RSwlBW?=
 =?us-ascii?Q?I/eetvDqNl310JEZGB2Dddq5oRsM1pGEk0b36ZRGI9imPJ+qshFAdmHE0RY4?=
 =?us-ascii?Q?Ae/lkvc333SnzQ1FDGewiiPnJXYPxxnzBUSIgmiF1MWUzWwSkYCpd3/YY+RH?=
 =?us-ascii?Q?hZQDyYgToQKZNuzQu302m+gdRodm0LAM5w1kR+C++cu+vtHHhkI0vt+MbLOC?=
 =?us-ascii?Q?4ThQHCW6Qbdd4y0bVDB1qevSMqf7BAJ6Jo10/K1mj54NsLQGXZHvEeZNuGde?=
 =?us-ascii?Q?7IGGO/yQDCr7OS4fb2gG5qjCQt8ERx7iCEy5D40LOVfc+hA2R8k7XLzpTLdA?=
 =?us-ascii?Q?LzJdPykWo3JE/M80v4Q3L7lYpQHQuQ7farx2G6EkLSr+ZvBrx63bFOMdCMWP?=
 =?us-ascii?Q?tMWRtvq5XicXLM8nKhPLJf13UGijrs5R4RkcV/6Ei19cmiDk5Ge8CEl8vyf4?=
 =?us-ascii?Q?FDIlIFCQTBcuQXBflyCEqcHShoPfMjrq0nIusvx1Z+XPX8HJCj96y49jxlYQ?=
 =?us-ascii?Q?i+oF9EtB+PeE/8yEJOFlU1FoAxYZzjcrFScLDYbPDp2Pz76Mi1kOSAT5zuAL?=
 =?us-ascii?Q?7tg6ZVpyzMA8zIFw2WKelvZikHmyeYXdBWmLHZjPZxe5i5ojC9WdGl2oxKLt?=
 =?us-ascii?Q?U7zOSML/vEwdlYHruao4BLoAE3E+7KwJJAZcOc400c/7Sl55rDENN9nHEV+0?=
 =?us-ascii?Q?aSVz1/p41i4B2e3tg9IktNuRCqT19C8Q8RY42GDjjYPCaFz6RZKvV+Sh/fFZ?=
 =?us-ascii?Q?2O/IuoNFfZ7mKM8FE18Gr2BGx67UrhFbmsZ4EdZVrUn53Wg8uEHitpRFHO7x?=
 =?us-ascii?Q?VMXc5qe1kGrNkYEczKrLdKbq103dy8BwOJTbGtaThPIFPfwPA3LNDeXxYHcc?=
 =?us-ascii?Q?u0RRf88XKJHgIH7FtfxMAbcz3vfE/j4JFDIwWJewy7UaA1yOQuhOcLsCjd3h?=
 =?us-ascii?Q?TCpf3XjWTKYpBasTPw6w893MFjTnvGo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ded4b3-3cc3-44a1-c61a-08da1d3fbfa7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 11:21:26.2716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfBJt6IxIU9HC6c/THCyKLWZZG8UyX0lFKjqxQr0XEY73hIZMuYp7uCRXmhDKqty3A/sYb4piZG9r5r3FyySGQZBJOqlQUcBXQctF/hyFR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5365
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-13_01:2022-04-11,2022-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204130062
X-Proofpoint-ORIG-GUID: caTnTDtSc_VP3wIms_GcS4J7yJ-tKNIG
X-Proofpoint-GUID: caTnTDtSc_VP3wIms_GcS4J7yJ-tKNIG
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Akhil R,

The patch ee17028009d4: "dmaengine: tegra: Add tegra gpcdma driver"
from Feb 25, 2022, leads to the following Smatch static checker
warning:

	drivers/dma/tegra186-gpc-dma.c:1071 tegra_dma_prep_slave_sg()
	error: uninitialized symbol 'slave_bw'.

drivers/dma/tegra186-gpc-dma.c
    981 static struct dma_async_tx_descriptor *
    982 tegra_dma_prep_slave_sg(struct dma_chan *dc, struct scatterlist *sgl,
    983                         unsigned int sg_len, enum dma_transfer_direction direction,
    984                         unsigned long flags, void *context)
    985 {
    986         struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
    987         unsigned int max_dma_count = tdc->tdma->chip_data->max_dma_count;
    988         u32 csr, mc_seq, apb_ptr = 0, mmio_seq = 0;
    989         enum dma_slave_buswidth slave_bw;
    990         struct tegra_dma_sg_req *sg_req;
    991         struct tegra_dma_desc *dma_desc;
    992         struct scatterlist *sg;
    993         u32 burst_size;
    994         unsigned int i;
    995         int ret;
    996 
    997         if (!tdc->config_init) {
    998                 dev_err(tdc2dev(tdc), "DMA channel is not configured\n");
    999                 return NULL;
    1000         }
    1001         if (sg_len < 1) {
    1002                 dev_err(tdc2dev(tdc), "Invalid segment length %d\n", sg_len);
    1003                 return NULL;
    1004         }
    1005 
    1006         ret = tegra_dma_sid_reserve(tdc, direction);
    1007         if (ret)
    1008                 return NULL;
    1009 
    1010         ret = get_transfer_param(tdc, direction, &apb_ptr, &mmio_seq, &csr,
    1011                                  &burst_size, &slave_bw);

*slave_bw is not set fro the DMA_MEM_TO_MEM case.

    1012         if (ret < 0)
    1013                 return NULL;
    1014 
    1015         /* Enable once or continuous mode */
    1016         csr |= TEGRA_GPCDMA_CSR_ONCE;
    1017         /* Program the slave id in requestor select */
    1018         csr |= FIELD_PREP(TEGRA_GPCDMA_CSR_REQ_SEL_MASK, tdc->slave_id);
    1019         /* Enable IRQ mask */
    1020         csr |= TEGRA_GPCDMA_CSR_IRQ_MASK;
    1021         /* Configure default priority weight for the channel*/
    1022         csr |= FIELD_PREP(TEGRA_GPCDMA_CSR_WEIGHT, 1);
    1023 
    1024         /* Enable the DMA interrupt */
    1025         if (flags & DMA_PREP_INTERRUPT)
    1026                 csr |= TEGRA_GPCDMA_CSR_IE_EOC;
    1027 
    1028         mc_seq =  tdc_read(tdc, TEGRA_GPCDMA_CHAN_MCSEQ);
    1029         /* retain stream-id and clean rest */
    1030         mc_seq &= TEGRA_GPCDMA_MCSEQ_STREAM_ID0_MASK;
    1031 
    1032         /* Set the address wrapping on both MC and MMIO side */
    1033 
    1034         mc_seq |= FIELD_PREP(TEGRA_GPCDMA_MCSEQ_WRAP0,
    1035                              TEGRA_GPCDMA_MCSEQ_WRAP_NONE);
    1036         mc_seq |= FIELD_PREP(TEGRA_GPCDMA_MCSEQ_WRAP1,
    1037                              TEGRA_GPCDMA_MCSEQ_WRAP_NONE);
    1038         mmio_seq |= FIELD_PREP(TEGRA_GPCDMA_MMIOSEQ_WRAP_WORD, 1);
    1039 
    1040         /* Program 2 MC outstanding requests by default. */
    1041         mc_seq |= FIELD_PREP(TEGRA_GPCDMA_MCSEQ_REQ_COUNT, 1);
    1042 
    1043         /* Setting MC burst size depending on MMIO burst size */
    1044         if (burst_size == 64)
    1045                 mc_seq |= TEGRA_GPCDMA_MCSEQ_BURST_16;
    1046         else
    1047                 mc_seq |= TEGRA_GPCDMA_MCSEQ_BURST_2;
    1048 
    1049         dma_desc = kzalloc(struct_size(dma_desc, sg_req, sg_len), GFP_NOWAIT);
    1050         if (!dma_desc)
    1051                 return NULL;
    1052 
    1053         dma_desc->sg_count = sg_len;
    1054         sg_req = dma_desc->sg_req;
    1055 
    1056         /* Make transfer requests */
    1057         for_each_sg(sgl, sg, sg_len, i) {
    1058                 u32 len;
    1059                 dma_addr_t mem;
    1060 
    1061                 mem = sg_dma_address(sg);
    1062                 len = sg_dma_len(sg);
    1063 
    1064                 if ((len & 3) || (mem & 3) || len > max_dma_count) {
    1065                         dev_err(tdc2dev(tdc),
    1066                                 "DMA length/memory address is not supported\n");
    1067                         kfree(dma_desc);
    1068                         return NULL;
    1069                 }
    1070 
--> 1071                 mmio_seq |= get_burst_size(tdc, burst_size, slave_bw, len);
                                                                     ^^^^^^^^
used here.

    1072                 dma_desc->bytes_req += len;
    1073 
    1074                 if (direction == DMA_MEM_TO_DEV) {
    1075                         sg_req[i].ch_regs.src_ptr = mem;
    1076                         sg_req[i].ch_regs.dst_ptr = apb_ptr;
    1077                         sg_req[i].ch_regs.high_addr_ptr =
    1078                                 FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_SRC_PTR, (mem >> 32));
    1079                 } else if (direction == DMA_DEV_TO_MEM) {
    1080                         sg_req[i].ch_regs.src_ptr = apb_ptr;
    1081                         sg_req[i].ch_regs.dst_ptr = mem;
    1082                         sg_req[i].ch_regs.high_addr_ptr =
    1083                                 FIELD_PREP(TEGRA_GPCDMA_HIGH_ADDR_DST_PTR, (mem >> 32));
    1084                 }
    1085 
    1086                 /*
    1087                  * Word count register takes input in words. Writing a value
    1088                  * of N into word count register means a req of (N+1) words.
    1089                  */
    1090                 sg_req[i].ch_regs.wcount = ((len - 4) >> 2);
    1091                 sg_req[i].ch_regs.csr = csr;
    1092                 sg_req[i].ch_regs.mmio_seq = mmio_seq;
    1093                 sg_req[i].ch_regs.mc_seq = mc_seq;
    1094                 sg_req[i].len = len;
    1095         }
    1096 
    1097         dma_desc->cyclic = false;
    1098         return vchan_tx_prep(&tdc->vc, &dma_desc->vd, flags);
    1099 }

regards,
dan carpenter
