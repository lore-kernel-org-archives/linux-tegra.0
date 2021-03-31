Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D3EC43460
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 16:52:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04E3961042
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 16:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234400AbhCaQwP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 12:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234283AbhCaQwI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 12:52:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EC7C061574;
        Wed, 31 Mar 2021 09:52:06 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id e7so23076067edu.10;
        Wed, 31 Mar 2021 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QI61i+YGQZg/rOGur7W2OQBCKZffoB8fKnSvTJNTWio=;
        b=dEbfrdtC/bd2hbGbCet/rWeOhyg9c8Bq7nocWWyIMwNFj4EwLM32nC/gRkwidH5mYq
         Vz5xe8LJTKFCMd0zwYwbn6UorQxl8ZgGBNowd8e8xHEU1XfU0JvSiPhAqUkcLah/qv1h
         z2DgKEJFXI1+QxtVWzP9v1keN9dUCJGV1xFMQ/RZZDcMP1Wp34KhWeqWlaDjVUpJBADk
         6gUUIkmq5YJgAKT9Dp9exGWEiWEvIYFHTGvPg+fygScTtjTMDNveJA3NDOhfARYEz1Wh
         Oy18CY5HeW38M4k4nKb5jiVtBSWslARGSVnC8+jmjq+qE/2Y6KXDeJoSYBrDejoP3MEO
         cenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QI61i+YGQZg/rOGur7W2OQBCKZffoB8fKnSvTJNTWio=;
        b=h3n9imnRHfDf5QZHGseE2a6w+pH7fZ4dx/kxJKRPu/SyEP3de0qwR+pMYNCQzI+2ha
         wBjci8ERnpwSip/ucVjQPyZSg9EpDmEeMQrslzBRqhWEA9AhqoYNWk+/Pb5YUq5sWJpu
         4psW/jLka9Z/ARTlq84fPMo2zFp3c8VVhrsZxvK20RgbhLg0TPWcCW/i2ujeAsC6HAfE
         1BFY2MzxMGGiA/0sNmdtmW7uha6o7d5naZix7M6Xbaf3CIGFKdD8qFTm7JUuK1FWqIg3
         cS6L5GUcDu1oJjlEP4OgTn4wOl7OQPZHWoYr1WxPYr+0ZPxv9c3i5jZrnN8VAWF7o/Ih
         0PHw==
X-Gm-Message-State: AOAM531IEoYNNKQnx1Kmxn48EUiA9uS5anF2fdAKFP5nJhDzQW7GSbAK
        6NvEGUmvWx/rdeCcXrbQ2c4=
X-Google-Smtp-Source: ABdhPJy1SfH3I7WnDBejP2YIkk5cIL8Hn5SZ3RJXK7eYsvFJiY/7k87Ee6t9pbfHnaSVVB2VLp1vKw==
X-Received: by 2002:a05:6402:3075:: with SMTP id bs21mr4937264edb.274.1617209524762;
        Wed, 31 Mar 2021 09:52:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m9sm1501878ejo.65.2021.03.31.09.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 09:52:03 -0700 (PDT)
Date:   Wed, 31 Mar 2021 18:52:30 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 06/13] phy: tegra: xusb: Add sleepwalk and
 suspend/resume
Message-ID: <YGSozqyWuDQnxJoc@orome.fritz.box>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-7-thierry.reding@gmail.com>
 <YGM0ZOroZolJ9zEC@vkoul-mobl.Dlink>
 <YGSlj85/3kkfoDiH@orome.fritz.box>
 <YGSnJRlY4+RzjR7b@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oz7Uv6hgLjOVeWjW"
Content-Disposition: inline
In-Reply-To: <YGSnJRlY4+RzjR7b@orome.fritz.box>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--oz7Uv6hgLjOVeWjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 06:45:25PM +0200, Thierry Reding wrote:
> On Wed, Mar 31, 2021 at 06:38:39PM +0200, Thierry Reding wrote:
> > On Tue, Mar 30, 2021 at 07:53:32PM +0530, Vinod Koul wrote:
> > > On 25-03-21, 17:40, Thierry Reding wrote:
> > > > From: JC Kuo <jckuo@nvidia.com>
> > > >=20
> > > > This commit adds sleepwalk/wake and suspend/resume interfaces
> > > > to Tegra XUSB PHY driver.
> > > >=20
> > > > Tegra XUSB host controller driver makes use of sleepwalk functions
> > > > to enable/disable sleepwalk circuit which is in always-on partition
> > > > and can respond to USB resume signals when controller is not powere=
d.
> > > > Sleepwalk can be enabled/disabled for any USB UPHY individually.
> > > >=20
> > > >   - tegra_xusb_padctl_enable_phy_sleepwalk()
> > > >   - tegra_xusb_padctl_disable_phy_sleepwalk()
> > > >=20
> > > > Tegra XUSB host controller driver makes use of wake functions to
> > > > enable/disable/query wake circuit which is in always-on partition
> > > > can wake system up when USB resume happens.
> > > > Wake circuit can be enabled/disabled for any USB PHY individually.
> > > >=20
> > > >   - tegra_xusb_padctl_enable_phy_wake()
> > > >   - tegra_xusb_padctl_disable_phy_wake()
> > > >   - tegra_xusb_padctl_remote_wake_detected()
> > > >=20
> > > > This commit also adds two system suspend stubs that can be used to
> > > > save and restore XUSB PADCTL context during system suspend and
> > > > resume.
> > > >   - tegra_xusb_padctl_suspend_noirq()
> > > >   - tegra_xusb_padctl_resume_noirq()
> > >=20
> > > Acked-By: Vinod Koul <vkoul@kernel.org>
> >=20
> > Thanks. I didn't see an Acked-by on patches 7-9. Did I miss them or did
> > you not get around to that yet?
>=20
> Patch 10 is also missing an Acked-by, I think.

Hang on, I've mixed these up. Patches 7 and 8 were for soc/tegra and
dt-bindings, respectively. Patches 9-11 were for the PHY subsystem, so
you may have missed them because they were not contiguous within the
series. The reason is that patch 9 depends on patch 7, though in
retrospect it might have been clearer to put 7 and 8 before the whole
set of the PHY patches.

Apologies for that. Could you take a look at 9 through 11? 9 and 11 are
pretty big, but it's really just the Tegra210 and Tegra186 specific
implementations of the functionality introduced in this patch.

I've also fixed up the modular build error that Nathan had pointed out
on patch 9. Let me know if you want me to resend that.

Thierry

--oz7Uv6hgLjOVeWjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBkqM4ACgkQ3SOs138+
s6Ggcg/+PEk5uTnt53AIaPASPXvcYZBQnuTclyF2LZMMtT/EHpJyH171HQFICwlg
xvsBhbe9jvzIEf4zS03Kodgb4PsvyvY0yY44RRW+GMOG4WcWkxgSO+aWWfL0cOhI
Rf/3EJ9uBVhUzxWNymKVG4D2mCwv5Q31j/HTXv3OLqJq5j/xUcrQruv2QqENiYEE
kyAKeCekPGuipAIzJZKv6o82BA2b3hGxjEjbpFt94uXMfOy6JoDPhBzP0W+kYOY+
LN7qpB1PIS4SIv6OFhGNyNpQWijL+LQkQPpAnWbmEZj1UHKAvJLpBpAgmeh6MhSt
QQS8Q8TSijqcXLvYFdaKgWXl2hC6wVOGA9CX0QU4w4Rke0Y2YGhEKb7NjyEnMUfN
K6nAz/oJno8VAeeKGdOuJefpDE8ztClMgxrBBP7zAtVfQHtEXS2vcJa+sF8HoPkH
hm0go0rhrDbQX4qJJDTrsS0xvl57keuhUjsxLXCgczUz/NIeHqFJNvX691lf99RO
V/vUvmK0gdg3MJRoVruWZb/4PbLhnaGb2opvptgmSJqpLL5FGD76ONLE/74CS+Kw
b1qyHPwWF7tQBzHJXRl1buIdaAdKn7GQmPI5hiaHB9dF+Q/2lNnO6vGZlNw8U/z5
Y6hqGCF4ytslmlsyM9X7nZGQU1AC13XIL0g+KVKdCkn+K5qhGME=
=A3Pf
-----END PGP SIGNATURE-----

--oz7Uv6hgLjOVeWjW--
