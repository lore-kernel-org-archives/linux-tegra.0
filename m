Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B39FC433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 11:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4008B61A23
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 11:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhCYLT2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:19:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhCYLTM (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 07:19:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53A4861A23;
        Thu, 25 Mar 2021 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616671152;
        bh=F4az6keRu8dHjgjKyxlJfL/xOF5s8ykWjZ6nhddtwVw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l+wV1t/71lxpBa0r8TKPItZ0v0WisMF4JdWBBmmg5MJ9+hekOPLH0swpH4EF+7uMf
         +Sj5NMLcRFetWXt4IS20zQaFUM9N8cSi7+tR86YboaYDiKMrDJX2vFGbtSSj40xPHh
         wcYi7IiMDjOhMPs1XJD7S0gyQ76991IN4WvhCUT8H4KMWHmZ5qB/ap7ygq0+jvZkHU
         eK6I2gYRluFLuMj8SqugU6DHzUiOC43+7nG7e7RmA+p/kxSSMGE803yv+8w4b2cqKC
         hXNk9Dg4eHSR3lPVDUY6w5qnjUqtNzwc8QAKjhu15h2Z8yrVjw7gq5nrpjsfHfSZeA
         tenoxOnPbcRcg==
From:   Will Deacon <will@kernel.org>
To:     Rich Wiley <rwiley@nvidia.com>, catalin.marinas@arm.com
Cc:     kernel-team@android.com, Will Deacon <will@kernel.org>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] arm64: kernel: disable CNP on Carmel
Date:   Thu, 25 Mar 2021 11:19:04 +0000
Message-Id: <161666594391.223463.996446144212506291.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324002809.30271-1-rwiley@nvidia.com>
References: <20210324002809.30271-1-rwiley@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 23 Mar 2021 17:28:09 -0700, Rich Wiley wrote:
> On NVIDIA Carmel cores, CNP behaves differently than it does on standard
> ARM cores. On Carmel, if two cores have CNP enabled and share an L2 TLB
> entry created by core0 for a specific ASID, a non-shareable TLBI from
> core1 may still see the shared entry. On standard ARM cores, that TLBI
> will invalidate the shared entry as well.
> 
> This causes issues with patchsets that attempt to do local TLBIs based
> on cpumasks instead of broadcast TLBIs. Avoid these issues by disabling
> CNP support for NVIDIA Carmel cores.

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: kernel: disable CNP on Carmel
      https://git.kernel.org/arm64/c/20109a859a9b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
