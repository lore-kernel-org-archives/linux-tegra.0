Return-Path: <SRS0=jT6+=BD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C845DC433EA
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 14:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4985206D8
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 14:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="vo7kht33"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgGXOG7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jul 2020 10:06:59 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45884 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXOG7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 10:06:59 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06OE6fox040220;
        Fri, 24 Jul 2020 14:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=piyJMklUvGrOxfEEo6YnsSt/7VRBdBHr9hNQZ8FNOXU=;
 b=vo7kht33Vk2EFW16FUxCfVNcw+VchfCqjbOrW0M5NiLeAOSRJb8jxYwUzBv1MSz9YDQ5
 vC2cJjJlgLSUlZIpHeMqR8v95ur/rOhUwW08gAFmmWOusblIgzqpzkL0mCoiVR/q3fwe
 RlC8mfYIIB9lR+cU2HV7mWwWy/Om46TioRj3hqqZkOJbJJ8af2DbSorkuYCtAage19u4
 wFblbUJSMGQvjjk+W3S9BqLIKwOS9AurDCoYYVGBPha5QrMdKt+38QTJPSiLvv7bTbJC
 qqydMBxfazPPbRDma9PlkYxX8EptkqkBzfde1xWNOkKWOQ/7KVcR12Dv2l1uLCrwb6wN UA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 32brgryakj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Jul 2020 14:06:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06OE6FBn151955;
        Fri, 24 Jul 2020 14:06:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 32ft2vahme-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jul 2020 14:06:41 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06OE6Iro007443;
        Fri, 24 Jul 2020 14:06:19 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 24 Jul 2020 07:06:18 -0700
Date:   Fri, 24 Jul 2020 17:06:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     marvin24@gmx.de, gregkh@linuxfoundation.org,
        p.zabel@pengutronix.de, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, ac100@lists.launchpad.net
Subject: Re: [PATCH] change slave occurence to secondary everywhere
Message-ID: <20200724140611.GU2549@kadam>
References: <20200723145811.21109-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723145811.21109-1-bharadwaj.rohit8@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9691 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007240108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9691 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007240108
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jul 23, 2020 at 08:28:11PM +0530, Rohit K Bharadwaj wrote:
> @@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> -static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
> +static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
>  {
>  	disable_irq(nvec->irq);
>  	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
> @@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, nvec);
>  	nvec->dev = dev;
>  
> -	if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) {
> +	if (of_property_read_u32(dev->of_node, "secondary-addr", &nvec->i2c_addr)) {

This change will break the driver.

regards,
dan carpenter

