Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3438C433F5
	for <linux-tegra@archiver.kernel.org>; Sat,  9 Oct 2021 04:45:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D0DF60F43
	for <linux-tegra@archiver.kernel.org>; Sat,  9 Oct 2021 04:45:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhJIErX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 9 Oct 2021 00:47:23 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:15445 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229596AbhJIErV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 9 Oct 2021 00:47:21 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4HRCD149mdzBD;
        Sat,  9 Oct 2021 06:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1633754722; bh=Al+d/dwu71Q5HoylR3UebWD0GQaPId+64C/tD/x2YQk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jFCkbVP0VfQ/BHVuHi9ZYoge27n8XkONTxxdvdPLzq8Gi/CcweU4F23N8GJq/1kI/
         n3sV9GAvGLOfnrz/j8pc0NI3jpV9MKyjvwPZR9I5knrvElk5HjcZ6HJ9nVOVKDGwrO
         shzhW1X6a/mBFG0MYNoDP6t0ICYexozbthxhFQW7dzVz8WcWkWMkpCQXuRIryU8gIy
         /dEK3n74/cpTr1p1hEZGDBhnbu6b6ybzyhgZwDW2EvOxfcJPHxnmwsoVgQ18UeIS0o
         WbJIkwTKRygjcjpbwbBh6XnnU86M4iv8Tqx4FAiCZtPFMEE7dASV3uOGhSDn5Ta2QB
         lf+v+zzxLSk4w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Sat, 9 Oct 2021 06:45:17 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/6] lib/scatterlist: Add contiguous DMA chunks helpers
Message-ID: <YWEeXZOPslG0v7N2@qmqm.qmqm.pl>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210916094404.888267-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 16, 2021 at 11:43:59AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add a few helpers to count the number of contiguous DMA chunks found in
> an SG table. This is useful to determine whether or not a mapping can be
> used by drivers whose devices need contiguous memory.
[...]

Is the counting of all blocks necessary if all to be checked is whether
there is more than one continuous block?

Best Regards
Micha³ Miros³aw
