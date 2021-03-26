Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22331C433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 07:37:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E330261A38
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 07:37:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhCZHhX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 03:37:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:41946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230164AbhCZHg6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 03:36:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0539D619D3;
        Fri, 26 Mar 2021 07:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616744218;
        bh=/Nr/At0k6iwfJorKVN37xh/uOmrukCDNegi3ej35b3I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nl7AzAkf7S4m2pr7ClivLds9oqgdqSBJQT3v5IHKM4AYwxhkwckMEQhLJaUi6gur6
         fMyaTam+WSiN5IMjo3G4SpVj+nKnGGLL5Yf9R4Vkr0WBPma9EwxTDLOJ/QtyS4dRaM
         bgEjcnGiwxmdTbrYlbBRCns81pE8KL8PC1UDQQW6RuXBzc9dYHBO73e9dwpLs8m1xa
         MzOBQ/e4q4QiS5Sl0EMB9qXCA6/xeFEj+tc8aEvrougrk34lNm0YWG9IbEGt2PS9Po
         H/deaovo05n9blLLUPeDn4rjt5Yr3WAIEL2Ki0ox0jkOZ79ovY6DWayxX4Mj0CMezo
         tvEK72z8NtzDw==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] memory: tegra20: Correct comment to MC_STAT registers writes
Date:   Fri, 26 Mar 2021 08:36:53 +0100
Message-Id: <161674420623.5944.7028475282352338247.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323210446.24867-1-digetx@gmail.com>
References: <20210323210446.24867-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 24 Mar 2021 00:04:45 +0300, Dmitry Osipenko wrote:
> The code was changed multiple times and the comment to MC_STAT
> registers writes became slightly outdated. The MC_STAT programming
> now isn't hardcoded to the "bandwidth" mode, let's clarify this in
> the comment.

Applied, thanks!

[1/2] memory: tegra20: Correct comment to MC_STAT registers writes
      (no commit info)
[2/2] memory: tegra20: Protect debug code with a lock
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
