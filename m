Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DC5C4167B
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Dec 2020 12:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B98E22AB0
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Dec 2020 12:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbgLDM60 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 4 Dec 2020 07:58:26 -0500
Received: from retiisi.eu ([95.216.213.190]:51378 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbgLDM6Z (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 4 Dec 2020 07:58:25 -0500
X-Greylist: delayed 457 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Dec 2020 07:58:25 EST
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 511E1634C24;
        Fri,  4 Dec 2020 14:48:48 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1klAW0-0003Ou-Pn; Fri, 04 Dec 2020 14:48:48 +0200
Date:   Fri, 4 Dec 2020 14:48:48 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, hverkuil@xs4all.nl,
        robh+dt@kernel.org, bparrot@ti.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/13] media: v4l2-fwnode: Update
 V4L2_FWNODE_CSI2_MAX_DATA_LANES to 8
Message-ID: <20201204124848.GK4351@valkosipuli.retiisi.org.uk>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
 <1607022002-26575-11-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607022002-26575-11-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 03, 2020 at 10:59:59AM -0800, Sowjanya Komatineni wrote:
> Some CSI2 receivers support 8 data lanes.
> 
> So, this patch updates CSI2 maximum data lanes to be 8.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
