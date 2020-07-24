Return-Path: <SRS0=jT6+=BD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC91C433E5
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 14:12:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AD0F2063A
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 14:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rbVKa7CB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXOML (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jul 2020 10:12:11 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:50494 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXOMK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 10:12:10 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06OE6a4O040064;
        Fri, 24 Jul 2020 14:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=luNOSejEoIgK8S6y4yOxUCk+a6tKCZ0mVEaQYImWMHY=;
 b=rbVKa7CBc8VYmUVAj0KwBMJCTF6LaHSNDivpKaVAK3LVYZNiMm6Bd7oac/9rQ7O7X0tP
 4bT9TA/zEs+k8+koYvGNxjiYG+UuMO2EFF5591PBbypGCIvRlDmjJwzLNsZgHagAFGvz
 6oq7tep6ZOuMZPW9kRPpzFqIKoCw5MANP+9jyniZOXUrcSlJMhNZGn2cBkOOz0PjUaWO
 2fF1ZpxqSbvlEpoTDJpWuYEgtqMYUURaoS9hkBOnhvM0rlu25Wv3E5rDpDNhR99EFO0y
 cPowH7T7e4NPDb83ZyLSo/Y7/PgexX1dzHS0blbVhxgd8p8v2EWp83Zdi0qGifHtE3rS jg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 32brgrybr0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Jul 2020 14:12:01 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06OE4OHC178469;
        Fri, 24 Jul 2020 14:10:01 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 32fswsjhc1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jul 2020 14:10:01 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06OE9w0H003704;
        Fri, 24 Jul 2020 14:09:59 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 24 Jul 2020 14:09:54 +0000
Date:   Fri, 24 Jul 2020 17:09:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     marvin24@gmx.de, gregkh@linuxfoundation.org,
        p.zabel@pengutronix.de, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, ac100@lists.launchpad.net
Subject: Re: [PATCH v3] staging: nvec: change usage of slave to secondary
Message-ID: <20200724140947.GW2549@kadam>
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
 <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9691 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9691 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007240108
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 24, 2020 at 10:06:34AM +0530, Rohit K Bharadwaj wrote:
> @@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, nvec);
>  	nvec->dev = dev;
>  
> -	if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) {
> +	if (of_property_read_u32(dev->of_node, "secondary-addr", &nvec->i2c_addr)) {

Sorry, I should have looked for v3 at the start to reply to it.  This
line will break the driver.

regards,
dan carpenter

