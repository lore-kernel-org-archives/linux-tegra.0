Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A8EC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 15:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235696AbhLJPdI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 10:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbhLJPdI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 10:33:08 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF70C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:29:32 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id p8so14302415ljo.5
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BEmnjZhIzdMYBY2npIbHfjbW8aieepomwnHxPOBHoUo=;
        b=TP693Ff2MPuG8h9Bu+np1htkSl77T+jySNM8jK0ob0oIzK8tsx3jOg52a1J7yEyESN
         4X3lTG8SuedfukEdozdFZ6BSwAnI4VNnJCHs9u5zTegpSPZ7+oPBoa6u0/PRwAwP5dzC
         CgCuBBItf+r+GLjffsJnuCc+M6Z+qqbo0JoI4QXkNKKotzgg9CkEzpJvV3Oi3rH6gKvT
         NBRT2y7vVpW8ODexd9E/HrYomcp0jqxfVyt2nzKYzKzdEPDKpRU0yQW7s2wKI9J9eZgq
         g2Vb7mQrGnjhB8/ECh56WpdD5KzktYAK3necn3tMYYfAkrVqyByrtjiFox/++gGjBSF6
         tKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BEmnjZhIzdMYBY2npIbHfjbW8aieepomwnHxPOBHoUo=;
        b=msIA20YuynaQ5v2rtYCD1/uuK7hXOBV8qDbFNX2jBI9JcXguazwlJmdyIpTKF49peR
         KnuMPdqP4lVI4wJpQlP9Q0kyH8BbI4+Whw+eUYFfOgDxPkNUBJ/OLnh/xFzH1r1te/Fd
         91NhQBen4nAzg08t6kinmw5Dl+DtAEim3yZODaSgxKoXBXdB9w4F4I3gRvK9D3p4X/AT
         Hg5rU4uVtdt702b/dowO5lfkWcSOv17KE8Xtf73DF6quox4mGdGGfK0hqIKvSnDcaWUv
         X49HQnIvfXS0EaqUlsx0545sX6R8UsTMKptumcXeZh4+xUglka3zvOT0nS2NaL1EJhmd
         Sh9Q==
X-Gm-Message-State: AOAM532yv12lJOsg6VUJpff8MddXoAyspxxarXj/CODVCVuz6re2WPfj
        ssG6bwbtYBvjvNhaorC8yJ4hJt1xqWw=
X-Google-Smtp-Source: ABdhPJyprhOYYnfvwJDOoqhYfF3vIFtiDasoBCw35e8kZ9FKlHKxZ9A9X5hBMkfut2XSKBry81o0mQ==
X-Received: by 2002:a2e:2410:: with SMTP id k16mr13531906ljk.441.1639150170836;
        Fri, 10 Dec 2021 07:29:30 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id i10sm337743ljn.13.2021.12.10.07.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 07:29:30 -0800 (PST)
Subject: Re: [PATCH 11/25] ARM: tegra: Rename thermal zone nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-12-thierry.reding@gmail.com>
 <ca6f962a-6ea4-2a4c-cddd-a49bf482be9f@gmail.com> <YbNfxvRBaoAHyL6+@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cebbd654-2155-69cd-8f75-d78335c07cfe@gmail.com>
Date:   Fri, 10 Dec 2021 18:29:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbNfxvRBaoAHyL6+@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2021 17:10, Thierry Reding пишет:
> On Thu, Dec 09, 2021 at 11:06:30PM +0300, Dmitry Osipenko wrote:
>> 09.12.2021 20:33, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The DT schema requires that nodes representing thermal zones include a
>>> "-thermal" suffix in their name.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 6 +++---
>>>  arch/arm/boot/dts/tegra124-apalis.dtsi      | 6 +++---
>>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts   | 6 +++---
>>>  arch/arm/boot/dts/tegra124.dtsi             | 8 ++++----
>>>  4 files changed, 13 insertions(+), 13 deletions(-)
>>
>> Won't this break the soctherm driver? Looks like it relies on those
>> names. Have you tested this?
> 
> No, as far as I can tell this is matched based on the sensor ID. The
> name that is specified in the driver is only used in kernel messages
> but has no impact on how the nodes are matched, so this patch should
> have no impact on functionality at all.
> 
> I've just tested this on Jetson TK1 and indeed all of the thermal
> zones are still properly accounted for:
> 
> 	# ls /sys/class/thermal/thermal_zone*
> 	/sys/class/thermal/thermal_zone0:
> 	available_policies  k_d   offset     sustainable_power  trip_point_1_hyst
> 	cdev0               k_i   policy     temp               trip_point_1_temp
> 	cdev0_trip_point    k_po  power      trip_point_0_hyst  trip_point_1_type
> 	cdev0_weight        k_pu  slope      trip_point_0_temp  type
> 	integral_cutoff     mode  subsystem  trip_point_0_type  uevent
> 
> 	/sys/class/thermal/thermal_zone1:
> 	available_policies  k_pu    slope              trip_point_0_temp  type
> 	integral_cutoff     mode    subsystem          trip_point_0_type  uevent
> 	k_d                 offset  sustainable_power  trip_point_1_hyst
> 	k_i                 policy  temp               trip_point_1_temp
> 	k_po                power   trip_point_0_hyst  trip_point_1_type
> 
> 	/sys/class/thermal/thermal_zone2:
> 	available_policies  k_d   offset     sustainable_power  trip_point_1_hyst
> 	cdev0               k_i   policy     temp               trip_point_1_temp
> 	cdev0_trip_point    k_po  power      trip_point_0_hyst  trip_point_1_type
> 	cdev0_weight        k_pu  slope      trip_point_0_temp  type
> 	integral_cutoff     mode  subsystem  trip_point_0_type  uevent
> 
> 	/sys/class/thermal/thermal_zone3:
> 	available_policies  k_pu    slope              trip_point_0_temp  type
> 	integral_cutoff     mode    subsystem          trip_point_0_type  uevent
> 	k_d                 offset  sustainable_power  trip_point_1_hyst
> 	k_i                 policy  temp               trip_point_1_temp
> 	k_po                power   trip_point_0_hyst  trip_point_1_type
> 
> The only difference, as far as I can tell, is that the "type" attribute
> now reflects the new name, but that seems harmless enough.

Alright
