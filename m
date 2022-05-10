Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19581C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 10 May 2022 18:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242566AbiEJSkf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 May 2022 14:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344053AbiEJSkf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 May 2022 14:40:35 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 37B532A1500;
        Tue, 10 May 2022 11:40:33 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFFDE12FC;
        Tue, 10 May 2022 11:40:33 -0700 (PDT)
Received: from bogus (unknown [10.57.0.250])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F202A3F5A1;
        Tue, 10 May 2022 11:40:30 -0700 (PDT)
Date:   Tue, 10 May 2022 19:40:25 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Besar Wicaksono <bwicaksono@nvidia.com>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, catalin.marinas@arm.com,
        mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        thanu.rangarajan@arm.com, Michael.Williams@arm.com,
        treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 0/2] perf: ARM CoreSight PMU support
Message-ID: <20220510184025.iwgknfqe5ygz4jwn@bogus>
References: <20220509002810.12412-1-bwicaksono@nvidia.com>
 <20220509092843.GB26264@willie-the-truck>
 <2e5e09f9-b71b-d936-e291-db8f94554b18@arm.com>
 <20220510110742.ievkihggndpms3fn@bogus>
 <20220510111318.GD27557@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510111318.GD27557@willie-the-truck>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 10, 2022 at 12:13:19PM +0100, Will Deacon wrote:
> On Tue, May 10, 2022 at 12:07:42PM +0100, Sudeep Holla wrote:
> > On Mon, May 09, 2022 at 11:02:23AM +0100, Suzuki K Poulose wrote:
> > > Cc: Mike Williams, Mathieu Poirier
> > > On 09/05/2022 10:28, Will Deacon wrote:
> > > > On Sun, May 08, 2022 at 07:28:08PM -0500, Besar Wicaksono wrote:
> > > > >   arch/arm64/configs/defconfig                  |    1 +
> > > > >   drivers/perf/Kconfig                          |    2 +
> > > > >   drivers/perf/Makefile                         |    1 +
> > > > >   drivers/perf/coresight_pmu/Kconfig            |   10 +
> > > > >   drivers/perf/coresight_pmu/Makefile           |    7 +
> > > > >   .../perf/coresight_pmu/arm_coresight_pmu.c    | 1317 +++++++++++++++++
> > > > >   .../perf/coresight_pmu/arm_coresight_pmu.h    |  147 ++
> > > > >   .../coresight_pmu/arm_coresight_pmu_nvidia.c  |  300 ++++
> > > > >   .../coresight_pmu/arm_coresight_pmu_nvidia.h  |   17 +
> > > > >   9 files changed, 1802 insertions(+)
> > > > 
> > > > How does this interact with all the stuff we have under
> > > > drivers/hwtracing/coresight/?
> > > 
> > > Absolutely zero, except for the name. The standard
> > > is named "CoreSight PMU" which is a bit unfortunate,
> > > given the only link, AFAIU, with the "CoreSight" architecture
> > > is the Lock Access Register(LAR). For reference, the
> > > drivers/hwtracing/coresight/ is purely "CoreSight" self-hosted
> > > tracing and the PMU is called "cs_etm" (expands to coresight etm).
> > > Otherwise the standard doesn't have anything to do with what
> > > exists already in the kernel.
>
> That's... a poor naming choice! But good, if it's entirely separate then I
> don't have to worry about that. Just wanted to make sure we're not going to
> get tangled up in things like ROM tables and Coresight power domains for
> these things.
>

OK, now that triggered another question/thought.

1. Do you need to do active power management for these PMUs ? Or like
   CPU PMUs, do you reject entering low power states if there is active
   session in progress. If there is active session, runtime PM won't get
   triggered but if there is system wide suspend, how is that dealt with ?

2. Assuming you need some sort of PM, and since this is static table(which
   I really don't like/prefer but it is out there 🙁), how do you plan to
   get the power domain related information.

-- 
Regards,
Sudeep
