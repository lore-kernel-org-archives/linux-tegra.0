Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3990BC6FD1D
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Mar 2023 00:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjCOAnt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Mar 2023 20:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjCOAnt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Mar 2023 20:43:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA74E2211A;
        Tue, 14 Mar 2023 17:43:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51DEF61A8E;
        Wed, 15 Mar 2023 00:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994A6C433EF;
        Wed, 15 Mar 2023 00:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678840994;
        bh=XEsYJFIURCHeFn+PKpy9C5JpcMh7QgmvoLxU3pULUW4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ne1lPM/tDqm4oDVJoGW8avdUPdlf/qW4a206xiInAUVaC6wGz5GybRkyF5sAYOyk7
         OJ6PuuuXn1niUk2tMnlNEW3OYNfjD4ALBPQYkyrLxZyLE87r8lIo/e9vByjgAqziyN
         G5WqeloWNl39p0Wx2WRL7NEIdVKg0DLlQoTRjyxnZUyc6LMPqSw4l3Y/QL8P0MepaZ
         rvucbUMN/yUPolrKJDPXXeSceybxqAUvCxUQjLqc6OafQW6JpIm06l56IngSHRO7P4
         cUD8c9uUw+L60RhVfNAOzERegSv5pJO6dx2gRGjXXnvHH8VVipNMMvqwvme9aIIy0m
         HOsX9oJ/Z5auw==
Message-ID: <79f2ab41e79b5e2d0df72045768810a3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230314131718.27031-1-alfredo.carlon@gmail.com>
References: <20230314131718.27031-1-alfredo.carlon@gmail.com>
Subject: Re: [PATCH] clk/tegra/clk-tegra124-dfll-fcpu: Add check to 'regulator_list_voltage'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Alfredo Cruz <alfredo.carlon@gmail.com>
To:     Alfredo Cruz <alfredo.carlon@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, mturquette@baylibre.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com
Date:   Tue, 14 Mar 2023 17:43:12 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Alfredo Cruz (2023-03-14 06:17:18)
> Signed-off-by: Alfredo Cruz <alfredo.carlon@gmail.com>

Sorry, we can't apply this. It needs commit text. Please see
Documentation/process/submitting-patches.rst

> ---
> Hi,
> I'm not entirely sure if 'regulator_list_voltage(reg, 0)' will never retu=
rn less than 0.

Please find out.
