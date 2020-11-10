Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32693C4741F
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 18:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1F9C20797
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 18:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4EPEKIe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730959AbgKJSIf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 13:08:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:56684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731259AbgKJSIe (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 13:08:34 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9F1A20797;
        Tue, 10 Nov 2020 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605031713;
        bh=Nz7W27yNGmMjfytfPBBLE46dVYliFnn5Y64uNGZmuIM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=i4EPEKIegCG7mQAYOmGbseMNaM7wnCzfEd0iU8/20Aa4pJOncA8X8DeXrXwY83Svn
         t4TZmh34jIHFlzzBC6ekXO/YQdD+VmlrujLZxAQL2FhKQtzqtv4FrSwymf4yOUVjjb
         X68VAgDfJkOW4vcNM0uJ8ayY6jAZLNdM8G5doyjU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kcY4F-009Wjq-M6; Tue, 10 Nov 2020 18:08:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Nov 2020 18:08:31 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra186: Add missing CPU PMUs
In-Reply-To: <20201110173601.GA2297135@ulmo>
References: <20201013095851.311478-1-maz@kernel.org>
 <20201110173601.GA2297135@ulmo>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <3da5c9b1f93699634aad997b77536a92@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com, nkristam@nvidia.com, skomatineni@nvidia.com, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-11-10 17:36, Thierry Reding wrote:
> On Tue, Oct 13, 2020 at 10:58:51AM +0100, Marc Zyngier wrote:
>> Add the description of CPU PMUs for both the Denver and A57 clusters,
>> which enables the perf subsystem.
>> 
>> Signed-off-by: Marc Zyngier <maz@kernel.org>

[...]

>> 
>> +	pmu_denver {
>> +		compatible = "nvidia,denver-pmu", "arm,armv8-pmuv3";
> 
> checkpatch complains that this isn't documented. Did I miss the DT
> bindings patch or do we not have one for this?

We don't. But I don't think adding a compatible string for each
and every micro-architecture makes much sense unless we have something
useful to add to that compatible string. Such as a full description
of the implementation specific events.

Thanks,

         M.
