Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2F0FA3741
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Oct 2022 11:38:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbiJZLi4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Oct 2022 07:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbiJZLiw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Oct 2022 07:38:52 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D1ED4A07;
        Wed, 26 Oct 2022 04:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSzXEiWsNq5jyorC5crnPFX4hqNg8UGDyXOHlS53+n+vwruqKzTDqKaeg9dL6258biYvApXcmiUjaHQ9EgNhLl3MPE7WkwOEW6ydhriadsInO4wjHp2RCjT2p4zv9QmWYYY00tF5KxCs1Zjigp/z4+r691DJsiyKIZqQhZtwcxjFDgZwOf+DOaf98U6YWbKV4RLQOe6P1WakBf4DIzw+dnpzTh5ORuiuTQGVflc1yg8q0RLiDnYMCBXL5J8rXt8YGa5ggRSmgAfIpjcR2CuQa0FcTfxejNUie43M7dxa73jWF6zbeywb1Ykux/uiN5JgM7efhVvyfaedbtPkzbBgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUtvcawPMBxi5WM4QCBc/U4cdonRKBntTN0l0hChqn4=;
 b=iJC2fIAsy34ujarcvBo/6T7PjJDuEy/lX8oan2Xbrmr53XA8sl2KaAZvxmb7abjdkxKUigM4nag646I1ENvR4QglnTEWlgory7q0EbsYP1b2dtiErhN6iu0NliGFlBFRs9yVMaGX/I8vM3gI8ausofsuJyzBqoBB3zbv/Ba1r86yaR7nDTxKRcJpI6I299+GqpPFTad3BFsuYaLW1sjLBDOc3kssm76ZVeShxOCZiAchT1FdufXMhMgHYjcbjMTN9UVbbzyLAVvJZucg5zJXMag5IIbk7SrOVwzKGCgHlhnL19bREzNhQeQVSWy9WuQymek3G81+rW9jwVV0qoen6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUtvcawPMBxi5WM4QCBc/U4cdonRKBntTN0l0hChqn4=;
 b=l/fJ8188Uz9xNqpUWNP0oRhWQ3jWRQTx8ZNaXVbrDd1XTC0UQRrPQYcttI5VTvAkkw44OHv5bq0gIsKxd0JNEM/eXRwbmMY2OYb9jLqn/3WMKkrWUrsuY30ehyb3kuuAKd1G2C5jZH1kTF3flZPmUTgiXspBNb3mEzLQE34kASvoF3zuJaNuihCIf7humLIIzDNHPgXNON9Ns53WyCbh69bSWC1p7S3KY3BwxuD0rQmgTzt4ixtR1SCgTqJedtbn8eweUVphUE+btud/QYFIu25ZR+Q/l/wwL7NmCN9uvQm9SNlXKSSKq7TGCPC3C/DICieyIDoljjSB1VQihd0EbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) by
 CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Wed, 26 Oct 2022 11:37:56 +0000
Received: from DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::774:7ac5:2a7e:4255]) by DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::774:7ac5:2a7e:4255%5]) with mapi id 15.20.5746.023; Wed, 26 Oct 2022
 11:37:56 +0000
Date:   Wed, 26 Oct 2022 13:37:51 +0200
From:   Thierry Reding <treding@nvidia.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: tegra: support BPMP-FW ABI deny flags
Message-ID: <Y1kcD1zH74UUdsu2@orome>
References: <20221025093536.4143397-1-pdeschrijver@nvidia.com>
 <20221025093536.4143397-2-pdeschrijver@nvidia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZZWkYnYoRp+ETJPN"
Content-Disposition: inline
In-Reply-To: <20221025093536.4143397-2-pdeschrijver@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.2.7 (2022-08-07)
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To DM8PR12MB5413.namprd12.prod.outlook.com
 (2603:10b6:8:3b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5413:EE_|CY8PR12MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: cdd8194e-3708-4ae2-562a-08dab74686eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GdZnxB9oZEPSnCNmWD9Lngle6vNrTFzyjwgmE5HoDiDRhlIb+hhJSK7E/FDIjKlsthkkKJufjoWdBz2di7Y6QjRQQDVzky+wtLiKFT0JfjMG+pKAzgW8COphzfAXexhdxW6soTDIhxtYPfBRP0Oy1o3XI3aaul5gLBpIoiiUFxyfQ2IgstL/nW33FdnGd9HmdJY++2Ivw5gU+ebMtMA+U23YZvYi8pa0obxw9u+F9oSZ89Th/RNCgKgdCO+HGt6/S9Xx2TcyQt2MtePRaiUzM9KiBvU8lr0UvmtPEje4yM6xmshX95fFBVkDXSp8hTKWgF0ywpedIRg60cj4cBfujkFO45h42WIQzxxLJcVlbhWTDz5X7BbcjZJoxV2+VPXL3VeYHJzffWRCCVHB7BkeD067s65bBe+lvDpmhYIVNRRcJ0CPuwMhV7dDauOpVMcaAG1Y+hd+8TbgUWUDdCWnHnrlxnrrhLD9GTnB12JIWh7Z+yBn2e4dLg+lLf30aysZVKCSj1iH2JxhV4HC81cgNV2t/uTrjU+p7ofTt73AiQ0UIqIL0WmFYwOXXNr/LRiqecnDNNWzD0FPDQKxzoQgXANceEVI9H7zBXskCgWPa7DUE2TRvrz+37RkzJzrp3EQuamD8hh/rSFvByblw+DKUjkMXceejPcAlmufEjxca6PPEKFOjmZ7lH/fb8OEk4JnbZfMWXUiva8Y/XKVSRhA+Agn47+ku8PXxYmdGjATWPa95DBfW+38lzFfdDXEYUrXuM+DhSNyvrk1gvd1fTSpuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199015)(6636002)(8676002)(5660300002)(6506007)(66946007)(2906002)(316002)(66899015)(6486002)(44144004)(41300700001)(66556008)(6512007)(8936002)(6862004)(4326008)(186003)(66476007)(21480400003)(478600001)(9686003)(33716001)(450100002)(86362001)(6666004)(83380400001)(38100700002)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wc5dyR1Cyc7c7JFzoVvL4rfYbm0IY2R6NqGb0gJAD4sfW8tHfiIxWCD0960H?=
 =?us-ascii?Q?rwMSWlLrjZ6JGB71SktvtvhBs+kTdM+gBpNI/0tRXGDRK/zbOasaXbLWgtq4?=
 =?us-ascii?Q?Zb6R4oZmUlzJSMVmJJquqXKDtLHcjYvJQDh5dov1mf2Z5CU8nwhwVP7DudTO?=
 =?us-ascii?Q?WIfd7ibDX4UYgkzNuMS47HJdcUi0IovwSbBkvuKeQ4kpfoyDdxHE7NBvaB/i?=
 =?us-ascii?Q?creUlxP66DCPh5yiTGybzHrNUnBellqA9xuvymLMsKM+JX91VZ5/Zvd0U0Wl?=
 =?us-ascii?Q?6KbHUevzlDWjFT8vlAO2TN9SCXrQxwR8k2nvy3b344dd4aY+n9R6Eh9601B4?=
 =?us-ascii?Q?Km1RMqatPyuzYq+m3gkImbPgL6PG0O6yhbS9Rwnu7yBm9svw68q0WmsvAsog?=
 =?us-ascii?Q?RLiFnasZGGpeelxf12sAydotQragqy52Ib5lmnz0TQrsIW428uli0ZHlO2ds?=
 =?us-ascii?Q?f4M13QCnzblEd72uLxTkuY826HCdVVOIGTJ+KnNzSFdyMieB169e7QwP0EX1?=
 =?us-ascii?Q?NrNtDrw7OhHXeZ8H1wVNcXUOnwzhuAmsrYRbqKKhqJn87IfXObkTI6rOyOiK?=
 =?us-ascii?Q?9ewE27VnKCs1VmVARBYrH2BZE/fACb8pOWUgNMVw0hJck33Oq7FlDPDaMc79?=
 =?us-ascii?Q?EV1Bwqj0aOrHI6fWErIyv3Q/h7V2N/IBOSKbCwj5o9ZyO/r7yYbdvJSHRn1d?=
 =?us-ascii?Q?f/UkCRSentQbE1Ws0ICYu3s63+BB8ScrjmpblWaZ4SOQvF6x1RrDxEZ6bu2b?=
 =?us-ascii?Q?cDnkfADNbu8deHGwK+Qg4s0Yc5Kx/OqmxG1Sl6pau3hWyAzmLmhU5BHPnXQK?=
 =?us-ascii?Q?3C4A0xoeOL4jbdfMidVvj1BuoMhsHmzdsOHk2dGGzY+/3YGmilsYrXASDu0H?=
 =?us-ascii?Q?xtXUpXdzjLAlCRpdJqIA2BFsRXS1e9GEjkr2R9AZzPwvIWT8Va+bSq2dOoCm?=
 =?us-ascii?Q?QzNdEcsfVmyuKKcrb32B5nQ5iTf1Poz5s8OlwTkoqbmrcMnyfre306daXlDD?=
 =?us-ascii?Q?7T+Y/uIztmIvLjSDJG7pvSO7JT9u3j3LUq66vES7halWRqShZDJDa+C1N0jF?=
 =?us-ascii?Q?4m2QS51/LLh2gPzbdrylIjHFI1lovMv2d3JpElc2HgI2tOfUF0PcguWdpjk3?=
 =?us-ascii?Q?x6/QAikuzrf22uu9s5FOy2kara7Hewpe9WaqtyvGJ9FNDGrs8rJPOX2Rsxix?=
 =?us-ascii?Q?v9sTnhdnmZ1BYShUAe7dAWHJjyaDKxoU5ui6kbm55l4IsjsiJpfJMWLWxaKW?=
 =?us-ascii?Q?SXRqEOS3MCDj7FW9Wm5vSqWq7DnRrpnVOLtHbgaPnxGGlAix8d0x74qa6b/r?=
 =?us-ascii?Q?GDktbyJt2EOvq/BtafjhpSALqCKEG52cKdK1IQsfhKqCjLpiQbfp8hz1h7pT?=
 =?us-ascii?Q?L4oKnqImhhxSWUqZBdeDEofTwwN/rXnlV/SwtIRWg+TQoXzTZ25TjCyR4P8X?=
 =?us-ascii?Q?KfbojllDLsxOcocqDttXo8zlQotIzU6ybvjPz6U5yK69pLGroh9LhK9XrFNM?=
 =?us-ascii?Q?AJDgGw/4B/Bns5GEp0MtFg8xwPGNXKdHQb2SoI8vuOnS1+VNpptSNo7BnPgR?=
 =?us-ascii?Q?TLeZAZTbSYAUM/idxLzaEWDLWNGcXEGfnmiVSUdPZYGyr93ubEOi0mhJlkd8?=
 =?us-ascii?Q?eNbIZxzhhNuICt4McCXYTuVyOT4ig5n7DCZtiLymf4lY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd8194e-3708-4ae2-562a-08dab74686eb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 11:37:56.6760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHci9FySDhX8Yt2PXFDFCLGbqDoqFGgzQcIKoOE8+W7mu7jdHWmAUEAq4o9Q+sEmgcqter2qeBd8XH2Gk1jIhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--ZZWkYnYoRp+ETJPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2022 at 12:35:36PM +0300, Peter De Schrijver wrote:
> Support BPMP_CLK_STATE_CHANGE_DENIED by not populating state changing
> operations when the flag is set.
>=20
> Support BPMP_CLK_RATE_PARENT_CHANGE_DENIED by not populating rate or
> parent  changing operations when the flag is set.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-bpmp.c | 37 +++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)

This is missing a changelog. From a quick look it seems the only change
is the fix for the dev_warn() issue pointed out by the kernel test
robot.

>=20
> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> index d82a71f10c2c..c912c5f0d1eb 100644
> --- a/drivers/clk/tegra/clk-bpmp.c
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2016-2020 NVIDIA Corporation
> + * Copyright (C) 2016-2022 NVIDIA Corporation
>   */
> =20
>  #include <linux/clk-provider.h>
> @@ -310,6 +310,23 @@ static const struct clk_ops tegra_bpmp_clk_mux_rate_=
ops =3D {
>  	.set_rate =3D tegra_bpmp_clk_set_rate,
>  };
> =20
> +static const struct clk_ops tegra_bpmp_clk_mux_read_only_ops =3D {
> +	.get_parent =3D tegra_bpmp_clk_get_parent,
> +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> +};
> +
> +static const struct clk_ops tegra_bpmp_clk_read_only_ops =3D {
> +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> +};
> +
> +static const struct clk_ops tegra_bpmp_clk_gate_mux_read_only_ops =3D {
> +	.prepare =3D tegra_bpmp_clk_prepare,
> +	.unprepare =3D tegra_bpmp_clk_unprepare,
> +	.is_prepared =3D tegra_bpmp_clk_is_prepared,
> +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> +	.get_parent =3D tegra_bpmp_clk_get_parent,
> +};
> +
>  static int tegra_bpmp_clk_get_max_id(struct tegra_bpmp *bpmp)
>  {
>  	struct cmd_clk_get_max_clk_id_response response;
> @@ -510,8 +527,22 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
>  	memset(&init, 0, sizeof(init));
>  	init.name =3D info->name;
>  	clk->hw.init =3D &init;
> -
> -	if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
> +	if (info->flags & BPMP_CLK_STATE_CHANGE_DENIED) {
> +		if ((info->flags & BPMP_CLK_RATE_PARENT_CHANGE_DENIED) =3D=3D 0) {
> +			dev_warn(bpmp->dev,
> +				"clock %s does not allow state change but does allow rate/parent cha=
nge",
> +				 init.name);

It's not clear to me from the warning what exactly this means. Does it
mean the clock won't work? Does it mean that parent changes are not
allowed either even though the flag says otherwise.

Looking at the code, the latter is the case, but for users not looking
at the code this may be confusing. Originally this was in the format of
a WARN, though I think you had used dev_warn() which then caused the
robot to flag this. I think you could use dev_WARN() instead which may
be what you had intended. That would make it clearer that this is
something for developers to look at, rather than some sort of issue that
users would need to deal with.

My understanding is that the WARN splat would only occur if the BPMP
firmware was somehow faulty (because STATE_CHANGE_DENIED and
!RATE_PARENT_CHANGE_DENIED is not a valid combination), so that seems
more appropriate than dev_warn().

Thierry

> +		}
> +		if (info->flags & TEGRA_BPMP_CLK_HAS_MUX)
> +			init.ops =3D &tegra_bpmp_clk_mux_read_only_ops;
> +		else
> +			init.ops =3D &tegra_bpmp_clk_read_only_ops;
> +	} else if (info->flags & BPMP_CLK_RATE_PARENT_CHANGE_DENIED) {
> +		if (info->flags & TEGRA_BPMP_CLK_HAS_MUX)
> +			init.ops =3D &tegra_bpmp_clk_gate_mux_read_only_ops;
> +		else
> +			init.ops =3D &tegra_bpmp_clk_gate_ops;
> +	} else if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
>  		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE)
>  			init.ops =3D &tegra_bpmp_clk_mux_rate_ops;
>  		else
> --=20
> 2.34.1
>=20

--ZZWkYnYoRp+ETJPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNZHA0ACgkQ3SOs138+
s6GTvQ//efARcfBtjKqN8QPzA71bw5zSZvn/qaoFA8C+04M3wqfFgbIPS1YJO9hu
j8jKWUXwyCicVryZiFFSk1VJFNAVT8oyOLYRqeADHoL4jpnHlqLnaUgoJ5SD8d0o
/XMXdJyeCW2GPSOqWwtgiJXHdNHUzAlgEI8phOpq5LGjBTeaZUre+7GWLY/9+WDI
NMKIEriKwsW+ET0CFJFUX+rVER54Y1HtIkuZ1oyN3cTOWJWL0lANSHtWBmjAZUqb
wPFs2ahWiZbFNEoigmo8Q5pxwCAFu8FuZcAF1EmVdYQNXt8I7UmEKl7CAekAB7bY
YIhnfWvEfJrCPfkbpGAq5Irwf23orbdP0f2XF6IOj0CUoSPpN0Dsb/+SdIWdmSj9
nMXYBNdBZRrNzus3FiSYwZaqmv96aETM7xjEee0hvHLXfdJ5GxqpRsAZUtbJgISn
Nh5eGBNkHxTXNSUfzlq0+/UMIHADYo1niP3iZ3EpUJMhKcIsxG0nssVXWLYfAXuy
o3oLeDQAGNpCp7TV3XazgRwPm31pBxWxz3nt9TgvaFiqbjWWJt31LBCe4R7mxX3h
7dI/ry1GMJSXacdRbEOO9C4ebzuMQgycrodHS2htzbDKGyVQpDrw8zuuUB2MY3qj
kNauWBH4E8Udy6wstsg3sUTRV5k0eLRB2S+p8aXB9QQTyHvNZRY=
=FEnr
-----END PGP SIGNATURE-----

--ZZWkYnYoRp+ETJPN--
