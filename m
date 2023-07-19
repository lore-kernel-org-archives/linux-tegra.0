Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439D8C001B0
	for <linux-tegra@archiver.kernel.org>; Wed, 19 Jul 2023 18:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjGSSae (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 Jul 2023 14:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjGSSad (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Jul 2023 14:30:33 -0400
X-Greylist: delayed 477 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 19 Jul 2023 11:30:32 PDT
Received: from out-48.mta0.migadu.com (out-48.mta0.migadu.com [91.218.175.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D790BB6
        for <linux-tegra@vger.kernel.org>; Wed, 19 Jul 2023 11:30:32 -0700 (PDT)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1689790953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U+h7nF3iHJyXPGTjQCGPc4jOSdU2SFBb4VhoriSzvmw=;
        b=Mbu00FFURdQu9G26tCptH/9qN208NliBSpa/YWw7dlECzT5NyEOnLR7wUuD0kg/NU2XbvU
        4OAlFJTZF4XaJaWu1rVQdLU/t3+h53J2M/H0op2r3NCU1RryfiTvW7JEidUC+ZAHzW+7bM
        eOSoidOQ+eINfYGKuGPARqi9urbNJw0=
Date:   Wed, 19 Jul 2023 18:22:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   "Konstantin Ryabitsev" <konstantin.ryabitsev@linux.dev>
Message-ID: <58d0c47502218fd689c5ecd100ba0d5d02d89926@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v7 5/5] mfd: tps6586x: register restart handler
To:     "Benjamin Bara" <bbara93@gmail.com>, dmitry.osipenko@collabora.com,
        konstantin@linuxfoundation.org
Cc:     bbara93@gmail.com, benjamin.bara@skidata.com, jonathanh@nvidia.com,
        lee@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        peterz@infradead.org, rafael.j.wysocki@intel.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org
In-Reply-To: <20230719082251.3501424-1-bbara93@gmail.com>
References: <20230719082251.3501424-1-bbara93@gmail.com>
 <215679f1-a866-1e92-1bab-9c80918927a6@collabora.com>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

July 19, 2023 at 4:22 AM, "Benjamin Bara" <bbara93@gmail.com> wrote:=20
>=20@Konstantin:
> Do you think it makes sense to print a warning when adding "non-standar=
d
> trailers" during running "b4 trailers -u", maybe around the
> find_trailers() checks? I could provide a RFC, if considered useful.

With b4 being used for other projects than just the Linux kernel, I don't=
 think it makes sense for us to track what is a valid and what is an inva=
lid "person-trailer". I know that we could make it configurable, but I do=
n't think this will actually improve the situation.

One goal for b4 is to allow defining validation tests and requiring them =
prior to "b4 send", so I think this is a better mechanism for dealing wit=
h such situations.

-K
