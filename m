Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3314CC4743C
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Jun 2021 06:44:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CB3761358
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Jun 2021 06:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhFWGq3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Jun 2021 02:46:29 -0400
Received: from mail-eopbgr60053.outbound.protection.outlook.com ([40.107.6.53]:38981
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229660AbhFWGq3 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Jun 2021 02:46:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmRuA1wtKdaa93/qa1pkc5o3Th7OzFDdoNNToGhyNwps8ffN/adEXal56gyPo2bFa2ktttfiKgOodp7udjB1EnEUqDNBy9m25KLbwYtjLN2s0fFpLPef7WqjrZwWzLCI3hwkMxnHA/pVEG0y0eHjT/nf/qvTO0lydQw8dXlegPIYGxcaFNHzicciSitV0ZT6wzFr8Qx+Os3cwlmEowb6iDVTJwyk8myVOa/nWXoaRUo5DXaUIYkRNjjQmIOdZACyJVlYpuhnPM6ksp6QDxvXHHw9042YKZzM8mH/Apkn0ceqGF81JOVsORnLpDzFGzVptThS3NP6lTy3eO3ozoqm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTaUa13910xDlQjqgNL//BhpGf3jJvczln3OKNN6nYM=;
 b=JnKXykLH9U7PxAmIZBHL0BQi2NM7yBO+IxXwdZ1X/hVpkAp/zohtJYVa/i7G6zPIbdY5btlRHPGeDFOa/iKep+lo0UTr73E4oz+mvRe00ORoTIJLdG8uSBJGJI8XLyrbnMuObj//9T6a3PBB9PDOlWJix1iZ3a0+d7fNGXB7tvjlUMulQgFWlnyI7NNmWlk9fVm1RmocYg0H0+4BNdWOdSgTAi0fqaVyHuO6e1OYZJwYiwrRyOKa5LXf4Mk8qcKY0D6+rk/4OkJKNR6Sevg+whgrS0KLLYPRZuNvCUPNWJ7U8gMBzMCdt4GTzhFCqgmKzyCs23anNub9tPsCXVuDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTaUa13910xDlQjqgNL//BhpGf3jJvczln3OKNN6nYM=;
 b=jAV07663zIxellWWwv4HPl+bfXKtvU3hzqjCXTrD/Yt2d7VLbVTQfTvDJ9vWzRcuF46HInnspX/mIZSHt7Kf1loHlBGcsKtEHzg/2vudwlHwBAfl6yk3yHXxnnTVyJs6hDjBLEQ23Qokf2qzOfS/AeyCobacv/5/ebt7OJoGGr0=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4094.eurprd04.prod.outlook.com
 (2603:10a6:803:43::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 06:44:07 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::54c5:2184:1aa:7e51]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::54c5:2184:1aa:7e51%3]) with mapi id 15.20.4242.023; Wed, 23 Jun 2021
 06:44:05 +0000
Date:   Wed, 23 Jun 2021 09:43:58 +0300
From:   Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, liviu.dudau@arm.com,
        mihail.atanassov@arm.com, brian.starkey@arm.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
        tiantao6@hisilicon.com, john.stultz@linaro.org,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        l.stach@pengutronix.de, p.zabel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, chunkuang.hu@kernel.org,
        matthias.bgg@gmail.com, bskeggs@redhat.com, tomba@kernel.org,
        hjc@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org,
        yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        wens@csie.org, jernej.skrabec@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 09/22] drm/imx: Don't set struct drm_device.irq_enabled
Message-ID: <20210623064358.u2acxvz5z52l7h7l@fsr-ub1664-121.ea.freescale.net>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-10-tzimmermann@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-10-tzimmermann@suse.de>
User-Agent: NeoMutt/20171215
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM8P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::11) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-121.ea.freescale.net (83.217.231.2) by AM8P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 06:44:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d312c4-75b9-4cd3-3eeb-08d936124b77
X-MS-TrafficTypeDiagnostic: VI1PR04MB4094:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4094753F025F4787861E156EBE089@VI1PR04MB4094.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fh9dsYEknwRMMWbSx2DJCzutlhUuCpxHs7AMAK1zbjrUxc9XIzEAHGDfBTpU0AIAsAbyaFH5HZxd/IGz/jPcjozA5a0mmwkKu2yousAeAMwyKY/KRC0j2TEl+C9d3Ujbk8rsnCxncO6TS5I+iXxKq4P1SoHAqe8anQle/431NW6nnRnajKd+YfYcjCd16vXCmmGaduaP+EY9qIlpQFEpj6ddCINiSRIHg7xFLvk322YUUJMtH/EKkinXQwUFEntxekHNPoFlJdslsBoWuJ+uiAPN9bsCkvxptFs0BksB7zoSTNvmoFxqbo+LEU2m+QCxYGugmdekZCaKnp0kcA/ZR5/wj2iTIdGzNRG+fgPnNFObtpEi+ZJXo9TR4kbyJc5QbZIn/l/P3kw5TjqqDE3of7mrTGOC2nQmjGj5ZVyKNx9f4E1xjXAOmoIl62taRpMkUFZhdaSKroopUI0N5AcFjcdavUjpffW1Vyp6MjJvzxYd7nCH0KLhPrM5SX9KLx5TPBfqQZheG1NRuR03/ZYMyjg+inaQufy9EkGs7nMfcub9RhAgA+QuWy+gDEr6gW+uz7ksk89ooM9XVuDfKeSD+bIPEJ9xy94sLSEV+SP9l4Ub7zMsxj/JdsvXJD5R8LYGc0cUYUCZkj5bcSRBEE3e1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3902.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(7696005)(6666004)(52116002)(26005)(6506007)(8936002)(38100700002)(9686003)(8676002)(1076003)(2906002)(86362001)(38350700002)(83380400001)(55016002)(186003)(66946007)(316002)(16526019)(5660300002)(7416002)(7366002)(4326008)(7406005)(44832011)(478600001)(66556008)(66476007)(6916009)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pxGOlG/MowBLaCmVSMd6AgjHjTzTJT2BSx+jI4bpHEzZM4dtn3OcuRz1SQsU?=
 =?us-ascii?Q?pDNwC8tVHdL2h07HjjuhM/M+HUP6leC+1+l5LEVeU3qtS3DXnDk3KkQqXBFE?=
 =?us-ascii?Q?b5tVvei/maTJnwuVNSjy7pjLDehGdb3sIfa5Q15Or6C3z/SegjhP02QiErzh?=
 =?us-ascii?Q?2cKoG0xsmvB2LK3cbxg3D/Y3iZEgnYuU062bTPJXLXX0UysA6rUhjt5T6LNE?=
 =?us-ascii?Q?VlIypXy+u4iJ0HN4iLPvm/As7txbwpn8KIU7iSeRg/Hgkp4VLxbc3hzm3efb?=
 =?us-ascii?Q?dVpupTejNukJDUfiuTtuv9UvvLczgcJbhpgi2Y6+0+5U8EhwIFdd8wXAG4CR?=
 =?us-ascii?Q?Lh3fq2sK1FfraBQbaoxt6IrzlNqqdSzdsBAe3uZAz5kBp/8XmdlyJQ/8OFol?=
 =?us-ascii?Q?P7GzywVrViiKBbSQ5ATxoiW3z4p7VO77yfcMNU3u76c5bypjISXIwbRrCl5G?=
 =?us-ascii?Q?YbSuYtPeE6aQDAkba1XZ2NuXHMhFQpDQa/9Fv9WLs69SnFqLV6MfJ272Tzkj?=
 =?us-ascii?Q?BsfUt+YfK4eXi0pMbgOMV5QUX2Pb/ngftF77++fIFM9L5XSPG1CZV3fQeEP1?=
 =?us-ascii?Q?yxmQeikFKmqmlbKiTh3tRfmgIF5qjRIVIkbE96YAbgtzynRyVu49sJBnVOOb?=
 =?us-ascii?Q?KHMs+4MnsF7T2UOWnfzPY/XG02mWsB6ULfG/NGU7o5+4MsWX01R6TSyLpzim?=
 =?us-ascii?Q?hbg3/qfiW/dSNbfFhcupTUTwdcN3K5JVmTVVKDgD5FS56OQDO/Y6fjh9XOZP?=
 =?us-ascii?Q?wIbDmR3CC0pOmer4coSQTKPbHFS+UWX4l61BW7brMh/u5DLVhh/vPSsicYNT?=
 =?us-ascii?Q?dEOtOa44FBRQPAnI/xNf8fYi8hNlm9mSK7verYznEd5GW+86ni8SxVhU/YHi?=
 =?us-ascii?Q?Bl+ewLVaB7cp7bMpMnypLUn7kpxxskCppTiZ2y+IllqKWrDJ3F2FHV7XvoQi?=
 =?us-ascii?Q?23pQgUzrDxDdxGuYktyzkAC/ylTL9Q7AIzb8C0fkuPwsW3PbT70IEU17KNNs?=
 =?us-ascii?Q?G2fV/X+RnScygD0xXul7UaL5UNBapQVGsqe40Rp+LGK23BPka8RXnXFQGC/b?=
 =?us-ascii?Q?4EYoaQLj/950i50p3n4/yp8+2nSfGFquxJ34XB5/gTuqHpKUiQ2u1KU9sqOT?=
 =?us-ascii?Q?/t+bSP/Ys6983ttArvYGM9Yx5ZDKaP/mOFruvVJ8eVQ657sHpYc8DXE9AAGS?=
 =?us-ascii?Q?KJCB/nWJdSTOKujAaJ414NUTlfRP4I8ymAKkXDw68FNGYjKbSl1wTw2wzQ0A?=
 =?us-ascii?Q?g2Gt/l7VmKSkSg17A9lg0XPPk1slwcFiPqi9F6pYCgaWKshLOCWGng8+VldF?=
 =?us-ascii?Q?0Z9jRlOn3NAq/+lqK+o8ZnOr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d312c4-75b9-4cd3-3eeb-08d936124b77
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 06:44:05.6671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1vwPnN0/4Y6EwTEAemvNjcsC17/VSE27OX70t/q5jm1UEAFiAmZNDZH2cs2YBc+tHfYkNWv14cG+rLZ25IV4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4094
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thomas,

On Tue, Jun 22, 2021 at 04:09:49PM +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in imx.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-kms.c |  3 ---

Not sure if it's worth the effort but, since DCSS is a completely
self-contained driver, maybe it would be good to split this patch in 2
as well.

Anyway, for DCSS bit:

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
laurentiu

>  drivers/gpu/drm/imx/imx-drm-core.c  | 11 -----------
>  2 files changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> index 37ae68a7fba5..917834b1c80e 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -133,8 +133,6 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
>  	if (ret)
>  		goto cleanup_mode_config;
>  
> -	drm->irq_enabled = true;
> -
>  	ret = dcss_kms_bridge_connector_init(kms);
>  	if (ret)
>  		goto cleanup_mode_config;
> @@ -178,7 +176,6 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
>  	drm_kms_helper_poll_fini(drm);
>  	drm_atomic_helper_shutdown(drm);
>  	drm_crtc_vblank_off(&kms->crtc.base);
> -	drm->irq_enabled = false;
>  	drm_mode_config_cleanup(drm);
>  	dcss_crtc_deinit(&kms->crtc, drm);
>  	drm->dev_private = NULL;
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> index 76819a8ac37f..9558e9e1b431 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -207,17 +207,6 @@ static int imx_drm_bind(struct device *dev)
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
>  
> -	/*
> -	 * enable drm irq mode.
> -	 * - with irq_enabled = true, we can use the vblank feature.
> -	 *
> -	 * P.S. note that we wouldn't use drm irq handler but
> -	 *      just specific driver own one instead because
> -	 *      drm framework supports only one irq handler and
> -	 *      drivers can well take care of their interrupts
> -	 */
> -	drm->irq_enabled = true;
> -
>  	/*
>  	 * set max width and height as default value(4096x4096).
>  	 * this value would be used to check framebuffer size limitation
> -- 
> 2.32.0
> 
