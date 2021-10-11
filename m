Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FA3C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Oct 2021 23:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 516D860F22
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Oct 2021 23:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235668AbhJKX1Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Oct 2021 19:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235583AbhJKX1P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Oct 2021 19:27:15 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1169EC061570;
        Mon, 11 Oct 2021 16:25:15 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x27so79674007lfa.9;
        Mon, 11 Oct 2021 16:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N3HcVRkt2qXB/rqH6SM+oiBx156PKAvxGuJmThzW5lg=;
        b=PylXWvUDbhk8vPjHREbuDTn0CSpLBOTJp37e+wxb3choCU3PWx+FhWZnd7uGiVdeMq
         EETtyJE3KDDOm4wOMQ9C8pb3WBxHioJyB/63lssZYEfgryU59vsnNloi2IP3bA9LI0DM
         NuKeKtNScgzSyAWJZSTphLEMocSCmDDgzqR/PAAUHZiWi1cMXDOpNBYudQCO1Xn62IBU
         nynPLSCooYja7RCL6kMlTtfl3uKpXh8XU1V9swZ1IlRO+Hm68rX4y9Ibo/fCCViRPPs6
         O8O6kB2vRf6W9XYQmHbqCAhE3HHrXOi9sb8I4ue7NnZjhZgEE//X4o0DW9CFbCTaWkDq
         16Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N3HcVRkt2qXB/rqH6SM+oiBx156PKAvxGuJmThzW5lg=;
        b=yootKJei4YY6yTd9/ziro9HnQSlO49SUQHje6Pw7z2xFYi2cVpgULV6YmjXGS/rVQo
         Qa6yHY03zy/Oz7Ccl8L+SdgRwY0C2RLHpO2IVxkv0voJHarXDGFtdSknUeXZ7Uos+irc
         m63ywSHqnAjsmSvhEfkRazRvXfwZhK2M+bNAsBOc6GAv1DIaW61cJ6pNSmGC3g/sjunb
         qKUSn5JtRW7vFcF4IxBo20/dNci1wuII2rryZRQOqrcKQpCwWKZG9jODJV5pHN8fMXqM
         2FfJEvMvBx2P2tpOnNxX4WrTjf0AMS6Wd2Xkuvf/TiJWyn0Wn280gFiDhDO57Xk/mGuS
         tnWw==
X-Gm-Message-State: AOAM533h0oNs3uqSSTgEboEouEC7vpmIO/Rx6BMCYdKq3p9PtwZcRLEA
        amzMXlycqgkB8oxwfu63xpjMDtWMzIo=
X-Google-Smtp-Source: ABdhPJzkLmFoRH8hukY+9X+MqeNzriUds4GWxpYakbwi1lHd75mruGbLWv/FsdXhMmNaOKZMqsjg9Q==
X-Received: by 2002:a05:6512:b81:: with SMTP id b1mr30356228lfv.301.1633994713208;
        Mon, 11 Oct 2021 16:25:13 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-181.dynamic.spd-mgts.ru. [94.29.10.181])
        by smtp.googlemail.com with ESMTPSA id d4sm985076ljl.98.2021.10.11.16.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 16:25:12 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] iommu/tegra-smmu: Support managed domains
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-6-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9b0f1fd2-887b-d685-f1b9-5848f392b8b8@gmail.com>
Date:   Tue, 12 Oct 2021 02:25:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210423163234.3651547-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.04.2021 19:32, Thierry Reding пишет:
> From: Navneet Kumar <navneetk@nvidia.com>
> 
> Allow creating identity and DMA API compatible IOMMU domains. When
> creating a DMA API compatible domain, make sure to also create the
> required cookie.

IOMMU_DOMAIN_DMA should be a disaster. It shouldn't work without
preparing DRM and VDE drivers at first. We discussed this briefly in the
past.
