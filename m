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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0732C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:13:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACD63238EF
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 16:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbhAOQNi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:13:38 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17173 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727383AbhAOQNi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 11:13:38 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6001bf090000>; Fri, 15 Jan 2021 08:12:57 -0800
Received: from [10.26.73.78] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Jan
 2021 16:12:54 +0000
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
CC:     Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20201218031703.3053753-1-saravanak@google.com>
 <X/dpkgTnUk+inKHK@kroah.com> <e28e1f38d87c12a3c714a6573beba6e1@kernel.org>
 <ba2fcbfb-d714-2f73-3bd0-962f49363b62@nvidia.com>
 <CAGETcx8pdPnH1ndOCoi7Qyz8DDshCfMTzDLQM=oEaCjyds9reA@mail.gmail.com>
 <17703ac8-2238-0b64-3c98-ddadc7ae8a36@nvidia.com>
 <CAGETcx-=y4Ps41Lb0b_MTCbNTC_ah0cJTmPP+GajywFBc7kEfw@mail.gmail.com>
 <f0240065-a4a0-d985-a696-eba4d42ea580@nvidia.com>
 <CAGETcx_QmbOcof5T8Wo_zFXKB+qswPN3Cbwz5a6A+m+VrnWg0A@mail.gmail.com>
 <a38c0566-a58e-aaf7-ef57-dc294c4e71b4@nvidia.com>
 <CAGETcx9szf-=JjFNp0p-0LmOfOU1MWE3QqDNe-bAn2wXPH9pEQ@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f3683601-66db-ffe3-9066-ac94a9372727@nvidia.com>
Date:   Fri, 15 Jan 2021 16:12:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx9szf-=JjFNp0p-0LmOfOU1MWE3QqDNe-bAn2wXPH9pEQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610727177; bh=c2f56oAIuPvnccFuxorIRvCzWCtWaZTs/1xK7y8H1i4=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=NuuOySC3OSfMOloaTwT4aAgns9+FMrdwL9TfphWEKU9N7wnEpNkT47/MO2DmQA8r0
         mnI/86Pvua6nDgisyLZmty9PEsj41w7Q0/qT6NywBNgSXZQMCFMXPr/idFNvlwgyOK
         ASjwp8jAgnA3RjD9HbiV5AzgTuCoKvfA9Rj00H3ucYMVJltUWBHIe2n/12t8tBfCCU
         JEepgXxBPCJmLptfcsE6qW20R9suKTuSmplSndy0ioNyncrebbj2S6cF9JP5Kx233t
         qEuGC9iN9X5JXcXj9iSc6J5b21D8MFBSbTBN3TgBbT5yECLnBudUnj8saluRTGHljm
         A/c6hPditQqIg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 14/01/2021 21:50, Saravana Kannan wrote:
> On Thu, Jan 14, 2021 at 10:55 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 14/01/2021 16:52, Saravana Kannan wrote:
>>
>> ...
>>
>>> Thanks! I think you forgot to enable those logs though. Also, while
>>> you are at it, maybe enable the logs in device_link_add() too please?
>>
>>
>> Sorry try this one.
>>
>> Cheers
>> Jon
> 
> Phew! That took almost 4 hours to debug on the side! I think I figured
> it out. Can you try this patch? If it works or improves things, I'll
> explain why it helps.
> 
> -Saravana
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 5f9eed79a8aa..1c8c65c4a887 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1258,6 +1258,8 @@ DEFINE_SIMPLE_PROP(pinctrl5, "pinctrl-5", NULL)
>  DEFINE_SIMPLE_PROP(pinctrl6, "pinctrl-6", NULL)
>  DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
>  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
> +DEFINE_SIMPLE_PROP(gpio_compat, "gpio", "#gpio-cells")
> +DEFINE_SIMPLE_PROP(gpios_compat, "gpios", "#gpio-cells")
>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>  DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
> @@ -1296,6 +1298,8 @@ static const struct supplier_bindings
> of_supplier_bindings[] = {
>         { .parse_prop = parse_pinctrl6, },
>         { .parse_prop = parse_pinctrl7, },
>         { .parse_prop = parse_pinctrl8, },
> +       { .parse_prop = parse_gpio_compat, },
> +       { .parse_prop = parse_gpios_compat, },
>         { .parse_prop = parse_regulators, },
>         { .parse_prop = parse_gpio, },
>         { .parse_prop = parse_gpios, },
> 

Thanks, that worked!

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for digging into that one. Would have taken me more than 4 hours!

Jon

-- 
nvpublic
