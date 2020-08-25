Return-Path: <SRS0=F6W0=CD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B07FC433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Aug 2020 05:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65BB1204FD
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Aug 2020 05:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="fmYwSvJG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbgHYFbZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Aug 2020 01:31:25 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9898 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728666AbgHYFbV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Aug 2020 01:31:21 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f44a1eb0001>; Mon, 24 Aug 2020 22:30:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 24 Aug 2020 22:31:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 22:31:21 -0700
Received: from [10.25.97.151] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 05:31:18 +0000
Subject: Re: [PATCH 0/2] Tegra HDA specific fixes
To:     Mohan Kumar <mkumard@nvidia.com>, <tiwai@suse.com>,
        <aplattner@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>
References: <20200825052415.20626-1-mkumard@nvidia.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <93744a6d-843a-0e8c-d0d1-d0d7e9a8458c@nvidia.com>
Date:   Tue, 25 Aug 2020 11:01:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825052415.20626-1-mkumard@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598333419; bh=1BROby4DFgEOnZO+X7W4iJVTRoHH6abe5JWVienKd/w=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=fmYwSvJGjPtEYF5C3cCrKfID+I/9d6nlOuFBHBU4SGlzw3RAeVcoc/8Yf6tSzFsjp
         4cwWyNg2VCLLPZ0Uu2BVVopbhqtO4A0VGhOm2FpnmCttNheK6KjPG6YoNCovDqtben
         olBwkgG13hOlBDV+XYWV2RSNtRteCqCSmkTyrpku+5dYN/frb4sQa0xxMKj0XmCpGJ
         AvG0XnrUxhIJxpREtl+9BW33TJg8aCFNjq04iFdCryB4V20kZU+I6uGVnR7NG5wB9o
         gVAURQ2+UOcKDBNCv0lewUQzpGxG/lemdbCkDhuVlepjqXK0hYhOBHlALg/BZ0xMWw
         DoY14Rbatkhrw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


> This series has the fix for
> - 2 Channel swapping issue for Tegra
> - WAKEEN programming to detect wake events.
>
> Mohan Kumar (2):
>    ALSA: hda: Fix 2 channel swapping for Tegra
>    ALSA: hda/tegra: Program WAKEEN register for Tegra
>
>   sound/pci/hda/hda_tegra.c  | 7 +++++++
>   sound/pci/hda/patch_hdmi.c | 5 +++++
>   2 files changed, 12 insertions(+)
>
Acked-by: Sameer Pujar <spujar@nvidia.com>

