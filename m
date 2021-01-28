Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637D0C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 11:26:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06C6364DDB
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 11:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhA1L0a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jan 2021 06:26:30 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14232 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbhA1LZc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jan 2021 06:25:32 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60129f030001>; Thu, 28 Jan 2021 03:24:51 -0800
Received: from [10.26.73.116] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 Jan
 2021 11:24:49 +0000
Subject: Re: [PATCH] clk: tegra: clk-dfll: Verify regulator vsel values are
 valid
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20210127171121.322765-1-jonathanh@nvidia.com>
 <YBGwMBxNeSlaPjuB@ulmo>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9534983d-7f1e-5bdd-6ab8-7f33ec77524d@nvidia.com>
Date:   Thu, 28 Jan 2021 11:24:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YBGwMBxNeSlaPjuB@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611833091; bh=ovuRBE83nN682Ash0cP7zUYV97yklv0+eI3xEmE1a9w=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=WWrbnYgBD0YpuxM2/9Ac51zzEyuhW53Q3oq6PQC2RXWv8od0ekOuju+/oGkrpkNP1
         6vJHS750PEztQKgYGbsbkH4HOC0ONr/AbU8VXYmSieHSxpqzs1eYOXkBn6+AH+wcbu
         zmPAehWY6rmYoL8uIDXDR+sQtNE2D14uNB7RFJrv+xiQK18/zxBRBzvH60S4T8XfVu
         9JIvgLaEbPvQVUeVnVZD5peCjelFveQDJwQPOUA2972whGZjw3kHS4QKJ+8AWSGjWE
         BpLWratLFxor6yc7v4uIZ3f2MmcdQC6iIEcZzxEONTIGgJcMmiPp4CYiN9LL6O+v00
         IciSyHlHGt0Yw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 27/01/2021 18:25, Thierry Reding wrote:
> On Wed, Jan 27, 2021 at 05:11:21PM +0000, Jon Hunter wrote:
>> The regulator function, regulator_list_hardware_vsel(), may return an
>> negative error code on failure. The Tegra DFLL driver does not check to
>> see if the value returned by this function is an error. Fix this by
>> updating the DFLL driver to check if the value returned by
>> regulator_list_hardware_vsel() is an error and if an error does occur
>> propagate the error.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-dfll.c | 32 ++++++++++++++++++++++++--------
>>  1 file changed, 24 insertions(+), 8 deletions(-)
> 
> Does this fix any particular issue? Do we want a Fixes: line for this?
> 
> In either case, this looks like a correct fix, so:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>


I have not seen any issue so far, but noticed that we were not checking
the return value as we should. I happened to notice this while looking
into this issue [0] and so thought we should make the code more robust.

We could add ...

Fixes: c4fe70ada40f ("clk: tegra: Add closed loop support for the DFLL")

Jon

[0] https://lkml.org/lkml/2020/11/24/278

-- 
nvpublic
