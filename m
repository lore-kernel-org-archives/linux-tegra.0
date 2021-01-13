Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD91C43381
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 15:28:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10CB723436
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 15:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbhAMP1w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jan 2021 10:27:52 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16313 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbhAMP1v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jan 2021 10:27:51 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fff114f0002>; Wed, 13 Jan 2021 07:27:11 -0800
Received: from [10.26.73.78] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 15:27:06 +0000
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
To:     Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
CC:     "Rafael J. Wysocki" <rafael@kernel.org>, <kernel-team@android.com>,
        <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20201218031703.3053753-1-saravanak@google.com>
 <X/dpkgTnUk+inKHK@kroah.com> <e28e1f38d87c12a3c714a6573beba6e1@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ba2fcbfb-d714-2f73-3bd0-962f49363b62@nvidia.com>
Date:   Wed, 13 Jan 2021 15:27:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e28e1f38d87c12a3c714a6573beba6e1@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610551631; bh=vWvbfeQs/eOznYq1ghflo7/4ihY6xIq1d7AfKE+C1Ko=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=i6358Wm2qF7iHgC5O3/ZZVseUz7ouGggNJgySQQ70iNyfWKIWkx8/GVhsN5YJ885g
         ZzE4vMoMUOWFd9UjhOoENpNbUx7c7Rk/VBLLBi5ESjHHGMMGn7Ok8hw6J08fpauYA4
         LcQ2u8yC7f+mU1h2QkSPuu8BcAhw2/Pnmqc7tfjtDS9Uk4YzvjnbEOJhyYH3Hzlin1
         +tHHtn62RbW1QYpQ747bdk3HvM8R3GsBAHmjey39yvcaOgoTH3msS3RNSL1Y8nIH63
         GrC9bk1Np3pJaBzTtSYDNEtqvJ6AqI/5TdltQbUGvXi4geEqVT+KHHKXmMPChPzvC7
         UxNBIgCttvILg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/01/2021 11:11, Marc Zyngier wrote:
> On 2021-01-07 20:05, Greg Kroah-Hartman wrote:
>> On Thu, Dec 17, 2020 at 07:16:58PM -0800, Saravana Kannan wrote:
>>> As discussed in LPC 2020, cyclic dependencies in firmware that couldn't
>>> be broken using logic was one of the last remaining reasons
>>> fw_devlink=3Don couldn't be set by default.
>>>
>>> This series changes fw_devlink so that when a cyclic dependency is foun=
d
>>> in firmware, the links between those devices fallback to permissive mod=
e
>>> behavior. This way, the rest of the system still benefits from
>>> fw_devlink, but the ambiguous cases fallback to permissive mode.
>>>
>>> Setting fw_devlink=3Don by default brings a bunch of benefits (currentl=
y,
>>> only for systems with device tree firmware):
>>> * Significantly cuts down deferred probes.
>>> * Device probe is effectively attempted in graph order.
>>> * Makes it much easier to load drivers as modules without having to
>>> =C2=A0 worry about functional dependencies between modules (depmod is s=
till
>>> =C2=A0 needed for symbol dependencies).
>>>
>>> Greg/Rafael,
>>>
>>> Can we get this pulled into 5.11-rc1 or -rc2 soon please? I expect to
>>> see some issues due to device drivers that aren't following best
>>> practices (they don't expose the device to driver core). Want to
>>> identify those early on and try to have them fixed before 5.11 release.
>>> See [1] for an example of such a case.
>>
>> Now queued up in my tree, will show up in linux-next in a few days,
>> let's see what breaks!=C2=A0 :)
>>
>> And it is scheduled for 5.12-rc1, not 5.11, sorry.
>=20
> For the record, this breaks my rk3399 board, (NanoPC-T4) as no mass
> storage can be discovered (it lives on PCIe):
>=20
> (initramfs) find /sys -name 'waiting_for_supplier'| xargs grep .| egrep
> -v ':0$'
> /sys/devices/platform/ff3d0000.i2c/i2c-4/4-0022/waiting_for_supplier:1
> /sys/devices/platform/f8000000.pcie/waiting_for_supplier:1
> /sys/devices/platform/fe320000.mmc/waiting_for_supplier:1
> /sys/devices/platform/sdio-pwrseq/waiting_for_supplier:1
> /sys/devices/platform/ff3c0000.i2c/i2c-0/0-001b/waiting_for_supplier:1
>=20
> Enabling the debug prints in device_links_check_suppliers(), I end up wit=
h
> the dump below (apologies for the size).


I am seeing the same problem on Tegra30 Cardhu A04 where several regulators
are continuously deferred and prevents the board from booting ...

[    2.518334] platform panel: probe deferral - supplier regulator@11 not r=
eady

[    2.525503] platform regulator@1: probe deferral - supplier 4-002d not r=
eady

[    2.533141] platform regulator@3: probe deferral - supplier regulator@10=
1 not ready

[    2.540856] platform regulator@5: probe deferral - supplier regulator@10=
1 not ready

[    2.548589] platform regulator@6: probe deferral - supplier regulator@10=
1 not ready

[    2.556316] platform regulator@7: probe deferral - supplier regulator@10=
1 not ready

[    2.564041] platform regulator@8: probe deferral - supplier regulator@10=
1 not ready

[    2.571743] platform regulator@9: probe deferral - supplier regulator@10=
1 not ready

[    2.579463] platform regulator@10: probe deferral - supplier regulator@1=
01 not ready

[    2.587273] platform regulator@11: probe deferral - supplier regulator@1=
01 not ready

[    2.595088] platform regulator@12: probe deferral - supplier regulator@1=
04 not ready

[    2.603837] platform regulator@102: probe deferral - supplier regulator@=
104 not ready

[    2.611726] platform regulator@103: probe deferral - supplier regulator@=
104 not ready

[    2.620137] platform 3000.pcie: probe deferral - supplier regulator@5 no=
t ready


Cheers
Jon

--=20
nvpublic
