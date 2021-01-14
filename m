Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98BCC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 11:35:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86EF6239FD
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 11:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbhANLfm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Jan 2021 06:35:42 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18548 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbhANLfm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Jan 2021 06:35:42 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60002c660001>; Thu, 14 Jan 2021 03:35:02 -0800
Received: from [10.26.73.78] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 11:34:56 +0000
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
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <17703ac8-2238-0b64-3c98-ddadc7ae8a36@nvidia.com>
Date:   Thu, 14 Jan 2021 11:34:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx8pdPnH1ndOCoi7Qyz8DDshCfMTzDLQM=oEaCjyds9reA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610624102; bh=+9rocMNGS2IbcQd0Pjmdcp5Lyh6Q40HsTyIJIyT/ung=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=VqU6jCvwZSflxUQmUwklTL8K3RVd/N8CLw1I+sil+4CW8uQW8+HnYMZEFkn6zIY00
         ntD/OFnB8K7z3UKaDO5VP/oTHUWG5+KcyHWMlTaJuViP/lv4GrP0+sWBWo5IIce2bF
         NtXbirmXOinZWj0dpsLmLlNQRoShoT0N2CYm9NROjcfCYZyHmFcvfr4rqxJHh5NTMH
         6aRB8oyEI5DPAHHpSIu9TC4GedOpkAkNW/btZINTE1zmxik1snw9tLJDwyIzZlRCHX
         KRZ1yPUQpDvTQ6vuHOXBrZZTe3ngAJDbb1N666dxW8VIy/kEbXUp+M8AjHaHvrheVj
         +bx+agCnQpPOQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/01/2021 21:29, Saravana Kannan wrote:

...

>> I am seeing the same problem on Tegra30 Cardhu A04 where several regulators
>> are continuously deferred and prevents the board from booting ...
>>
>> [    2.518334] platform panel: probe deferral - supplier regulator@11 not ready
>>
>> [    2.525503] platform regulator@1: probe deferral - supplier 4-002d not ready
>>
>> [    2.533141] platform regulator@3: probe deferral - supplier regulator@101 not ready
>>
>> [    2.540856] platform regulator@5: probe deferral - supplier regulator@101 not ready
>>
>> [    2.548589] platform regulator@6: probe deferral - supplier regulator@101 not ready
>>
>> [    2.556316] platform regulator@7: probe deferral - supplier regulator@101 not ready
>>
>> [    2.564041] platform regulator@8: probe deferral - supplier regulator@101 not ready
>>
>> [    2.571743] platform regulator@9: probe deferral - supplier regulator@101 not ready
>>
>> [    2.579463] platform regulator@10: probe deferral - supplier regulator@101 not ready
>>
>> [    2.587273] platform regulator@11: probe deferral - supplier regulator@101 not ready
>>
>> [    2.595088] platform regulator@12: probe deferral - supplier regulator@104 not ready
>>
>> [    2.603837] platform regulator@102: probe deferral - supplier regulator@104 not ready
>>
>> [    2.611726] platform regulator@103: probe deferral - supplier regulator@104 not ready
>>
>> [    2.620137] platform 3000.pcie: probe deferral - supplier regulator@5 not ready
> 
> Looks like this is not the whole log? Do you see any "wait for
> supplier" logs? That's what all these boot issues should boil down to.
> And as usual, pointer to DT for this board please.

Ah yes I see ...

 platform regulator@1: probe deferral - wait for supplier tps65911@2d

Yes the device-tree for this board can be found here [0]. Looks like
there is a circular dependency between the vddctrl_reg and vddcore_reg.
This is part of coupled regulators which have a two-way linkage [1]. So
this change appears to conflict with this.

Jon

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/tegra30-cardhu-a04.dts
[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/regulator.yaml#n129

-- 
nvpublic
