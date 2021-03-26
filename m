Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FE7C433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 13:22:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6344261A18
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 13:22:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhCZNVq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 09:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhCZNVQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 09:21:16 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9345C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 06:21:15 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id w37so7595878lfu.13
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 06:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A6XtyG3Wn1a5AnO2KjSc1MQN2Z4quULAuafK+/TEggc=;
        b=HoMJE5A+7i7FjCQ/J7e5/mNmJCguJTxZQNLgzmZfCdv07gSnDvg6v6c8p0Guy7gISG
         a/vMooxlcZ16P5JoLPMxRxTJ4w1yNm7ksYCAIt2NInp+fh/NkeSc4tJeOhpxysROX6i0
         CT+4eX4Gxiq+cAifK8dxRfIXhFU9F+brsb34eF9Xy0JTsUF0QScb68kxONxotUNvS80P
         3/sqH5KHshtwsf2+t/ITVMYNjjR7WmmZPbIkQEWWJ9BJ0gjV+LhS7wGvuRFGIMgvVhlc
         aS0mGT0+tJZQPFYLhDJwDvDqEvXGeGEnnOPycbDjzXzk3vW2bzVg26q99oxv7pxc+C0r
         hHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A6XtyG3Wn1a5AnO2KjSc1MQN2Z4quULAuafK+/TEggc=;
        b=F8XSZRmG0erQZNkxAhS+BYlZwPNxuhI6zEYzzVdTCEA4RKs3+7uI+UGfXgP5JbYkyG
         U71EiAt19T+bWN/ygFw/ajwfyJ4Z2Vf72xY8Xge+Y47Xq5WAWVg8Cu353FaZD9mJRMzw
         qdQamaM3lq3gsUz5wGENMzwL6TGrK0Sk1hn39A7+sX5FGMLie2Ax+Tk/1IL+ZLkIcdmu
         +1auYJ5yUlIYi9WKfMy7WHeyU6YECwRqb2NNcYhEs2P5MqlOhvWNYGc7OiHj+8wIIRKZ
         6cFU+cHXvs/jPbUQ88yGOoYQ17Zc09ODsfNDGGfOmZLBImEgame9NXVs9x1HbZtLHubZ
         vp1A==
X-Gm-Message-State: AOAM530ut/ta0Dg08ZqKNMNr3zHhEcId9Jto9R+Js4VXz/lCTJbiV3aF
        86NK8++gQ3oh+tRbwwJyuGE=
X-Google-Smtp-Source: ABdhPJxlfVpm0M4G46VyhSui8CkG/ReEs3Bx03J69qCUEJ38QEw7RkNRwQora0kC214itkFb0gNcFQ==
X-Received: by 2002:ac2:5211:: with SMTP id a17mr8137499lfl.192.1616764874351;
        Fri, 26 Mar 2021 06:21:14 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:99a9:a10:76ff:fe69:21b6? ([2a00:1370:814d:99a9:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id x6sm873210lfn.11.2021.03.26.06.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 06:21:13 -0700 (PDT)
Subject: Re: [PATCH 1/9] memory: tegra: Move internal data structures into
 separate header
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        iommu@lists.linux-foundation.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-2-thierry.reding@gmail.com>
 <ca70b07a-608a-51b3-3c30-ff04bdf8bcc0@gmail.com>
 <YFyxtq6cwIJNr/Y5@orome.fritz.box>
 <4f1e0859-60b9-0ded-a4b8-70e06dd5a905@gmail.com>
Message-ID: <a2c0155e-23b7-db7c-7bf3-1203750edace@gmail.com>
Date:   Fri, 26 Mar 2021 16:21:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4f1e0859-60b9-0ded-a4b8-70e06dd5a905@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.03.2021 19:11, Dmitry Osipenko пишет:
> 25.03.2021 18:52, Thierry Reding пишет:
>> On Thu, Mar 25, 2021 at 06:12:51PM +0300, Dmitry Osipenko wrote:
>>> 25.03.2021 16:03, Thierry Reding пишет:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> From Tegra20 through Tegra210, either the GART or SMMU drivers need
>>>> access to the internals of the memory controller driver because they are
>>>> tightly coupled (in fact, the GART and SMMU are part of the memory
>>>> controller). On later chips, a separate hardware block implements the
>>>> SMMU functionality, so this is no longer needed. However, we still want
>>>> to reuse some of the existing infrastructure on later chips, so split
>>>> the memory controller internals into a separate header file to avoid
>>>> conflicts with the implementation on newer chips.
>>>>
>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>> ---
>>>>  drivers/iommu/tegra-gart.c      |  2 +-
>>>>  drivers/iommu/tegra-smmu.c      |  2 +-
>>>>  drivers/memory/tegra/mc.h       |  2 +-
>>>>  drivers/memory/tegra/tegra186.c | 12 ++++---
>>>>  include/soc/tegra/mc-internal.h | 62 +++++++++++++++++++++++++++++++++
>>>>  include/soc/tegra/mc.h          | 50 --------------------------
>>>>  6 files changed, 72 insertions(+), 58 deletions(-)
>>>>  create mode 100644 include/soc/tegra/mc-internal.h
>>>
>>> What about to make T186 to re-use the existing tegra_mc struct? Seems
>>> there is nothing special in that struct which doesn't fit for the newer
>>> SoCs. Please notice that both SMMU and GART are already optional and all
>>> the SoC differences are specified within the tegra_mc_soc. It looks to
>>> me that this could be a much nicer and cleaner variant.
>>
>> The problem is that much of the interesting bits in tegra_mc_soc are
>> basically incompatible between the two. For instance the tegra_mc_client
>> and tegra186_mc_client structures, while they have the same purpose,
>> have completely different content. I didn't see a way to unify that
>> without overly complicating things by making half of the fields
>> basically optional on one or the other SoC generation.
> 
> The additional fields aren't problem for T20, which doesn't need most of
> the fields. I'd try to go with the additional fields for now and see how
> it will look like, if it will be bothering too much, then we may
> consider to refactor the drivers more thoroughly (later on, in a
> separate series), with a better/nicer separation and taking into account
> a potential modularization support by the MC drivers.
> 
> Using a union for the exclusive fields also could work, although always
> need to be extra careful with the unions.
> 
>> Maybe one option would be to split tegra_mc into a tegra_mc_common and
>> then derive tegra_mc and tegra186_mc from that. That way we could share
>> the common bits while still letting the chip-specific differences be
>> handled separately.
> 
> But isn't tegra_mc already a superset of tegra186_mc? I think the
> tegra186_mc_client is the main difference here.
> 

Another thing we could do is to optimize the size of tegra_mc_client, but not sure whether it's worthwhile to care about extra ~3KB of data.

This slims down tegra_mc_client by two times:

 diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index edea9b2b406e..1d652bfc6b44 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -317,11 +317,11 @@ static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
 	/* write latency allowance defaults */
 	for (i = 0; i < mc->soc->num_clients; i++) {
 		const struct tegra_mc_la *la = &mc->soc->clients[i].la;
-		u32 value;
+		u32 value, la_mask = la->mask, la_def = la->def;
 
 		value = mc_readl(mc, la->reg);
-		value &= ~(la->mask << la->shift);
-		value |= (la->def & la->mask) << la->shift;
+		value &= ~(la_mask << la->shift);
+		value |= (la_def & la_mask) << la->shift;
 		mc_writel(mc, value, la->reg);
 	}
 
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index 46332fa82d10..ecf05484d656 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1157,7 +1157,7 @@ static void tegra30_mc_tune_client_latency(struct tegra_mc *mc,
 	u32 arb_tolerance_compensation_nsec, arb_tolerance_compensation_div;
 	const struct tegra_mc_la *la = &client->la;
 	unsigned int fifo_size = client->fifo_size;
-	u32 arb_nsec, la_ticks, value;
+	u32 arb_nsec, la_ticks, value, la_mask;
 
 	/* see 18.4.1 Client Configuration in Tegra3 TRM v03p */
 	if (bandwidth_mbytes_sec)
@@ -1214,11 +1214,12 @@ static void tegra30_mc_tune_client_latency(struct tegra_mc *mc,
 	 * client may wait in the EMEM arbiter before it becomes a high-priority
 	 * request.
 	 */
+	la_mask = la->mask;
 	la_ticks = arb_nsec / mc->tick;
-	la_ticks = min(la_ticks, la->mask);
+	la_ticks = min(la_ticks, la_mask);
 
 	value = mc_readl(mc, la->reg);
-	value &= ~(la->mask << la->shift);
+	value &= ~(la_mask << la->shift);
 	value |= la_ticks << la->shift;
 	mc_writel(mc, value, la->reg);
 }
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index d2fbe6a8b25b..e7a994d16c8e 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -18,8 +18,8 @@ struct device;
 struct page;
 
 struct tegra_smmu_enable {
-	unsigned int reg;
-	unsigned int bit;
+	u16 reg;
+	u8 bit;
 };
 
 struct tegra_mc_timing {
@@ -30,22 +30,22 @@ struct tegra_mc_timing {
 
 /* latency allowance */
 struct tegra_mc_la {
-	unsigned int reg;
-	unsigned int shift;
-	unsigned int mask;
-	unsigned int def;
+	u16 reg;
+	u8 shift;
+	u8 mask;
+	u8 def;
 };
 
 struct tegra_mc_client {
-	unsigned int id;
 	const char *name;
-	unsigned int swgroup;
 
-	unsigned int fifo_size;
+	u8 id;
+	u8 swgroup;
+	u16 fifo_size;
 
 	struct tegra_smmu_enable smmu;
 	struct tegra_mc_la la;
-};
+} __packed;
 
 struct tegra_smmu_swgroup {
 	const char *name;

