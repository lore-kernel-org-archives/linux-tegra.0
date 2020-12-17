Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F076DC4361B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:26:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B81AA2395A
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgLQN0c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 08:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgLQN0b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 08:26:31 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716D8C061794;
        Thu, 17 Dec 2020 05:25:51 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id a6so5548855wmc.2;
        Thu, 17 Dec 2020 05:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VxmIaKeX0QRH/GLpWOoJZuJpj+c6sglXfsSrXyWfRgk=;
        b=k7NgoQJFsf5DaAePoDcZ8epqBz4trcc4ULLDK1ja4IVQM7rtg5AL5eQ0xMFYPrgv6w
         mwwAzCSlDOy9fc61sQg/ODC3qAh2ijDsvUdAZmOghYrrjEAJwzwvQzGhwrbhRmPjrK2R
         +bt2b0qv2COuPNffSpBiqKbMcuqDaYdAT0P0vKJtPa3z7MxMXqBzcFi9se7/rurDrDfv
         UwjcvfVo89OjVyIzWITa7u3T66jxI1ozBRcgg0phosCv6bCTxTHG6motjzLmsFJGZ4n/
         MeXn0+fwLr1q+n+kUAyb50R3b/6GtRDIVg2A1KW39W7ZngqeYnoLHhGbqiUsuqleTYB0
         V6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VxmIaKeX0QRH/GLpWOoJZuJpj+c6sglXfsSrXyWfRgk=;
        b=ScJQG1EN8L5HLlhyhn3Lo59hqywZ6F2pP6j/JQVghJ7WENo/rAlsrtMmUvP2I03qqK
         5apw/qN2CkshDcIwxFW+uL84lFcFxGGgLgoNOVObVHWCcYqpezc8Xl00IJ0VxZNvV5DA
         Ubr6F90QuoJ+o3TzjQJxhuSlZ/rxwnj88Mm/m21C2uAx+aj3LMoDj6qWhEZbzZ9sXxwX
         bT14zHdNaudJ6vIeOT+WjOnWwT6USDGMCdnfrmIKXtOb0MUYVOaDSamaAIai1Irl0VqW
         1OUh+890yGx8IBdwlKHrKsZqwjvUx0n3RhetMHu/Aq6vKrQyP6TXH46QG6V0aTQX76mu
         VF0Q==
X-Gm-Message-State: AOAM533h62XUlUyv86mNDJ2UlTHRF1WsEvoJa+ATYnkm+fK8v8sti8KK
        yQ9T573etYYVVv+bqZvsrhg=
X-Google-Smtp-Source: ABdhPJyWrrk7NR5yOR8w64DJkuYTSSpbbTwDm20val5U/kVr37DE9gvNWOoZnSAYg1oZ+2sv3vczWQ==
X-Received: by 2002:a1c:1bcd:: with SMTP id b196mr8513752wmb.70.1608211550206;
        Thu, 17 Dec 2020 05:25:50 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f7sm14358332wmc.1.2020.12.17.05.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 05:25:48 -0800 (PST)
Date:   Thu, 17 Dec 2020 14:25:47 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] usb: phy: tegra: Add delay after power up
Message-ID: <X9tcW+kKOimoOrOl@ulmo>
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BZZ09Xl/0fjfNMW1"
Content-Disposition: inline
In-Reply-To: <20201217094007.19336-2-digetx@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--BZZ09Xl/0fjfNMW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:40:00PM +0300, Dmitry Osipenko wrote:
> The PHY hardware needs the delay of 2ms after power up, otherwise initial
> interrupt may be lost if USB controller is accessed before PHY is settled
> down. Previously this issue was masked by implicit delays, but now it pops
> up after squashing the older ehci-tegra driver into the ChipIdea driver.
>=20
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--BZZ09Xl/0fjfNMW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/bXFgACgkQ3SOs138+
s6FdtA//YIZ435A4qXh1cy4i9l/fCvnBXkdMcU8Fy0iK1dk1geWwuNsvwks2nLh9
uG6iH4kzVXvEK781Lv51oOoPrDP4glHdl0JHwlvLfRQaoPvFyloA03zV37nhLaIn
g1IqNKrG7iY6Jf0pt2MwTU6Pj6eR2sYUI6pi5c52/yxlurU3Lo6+E/JcN3kuwZUl
YPBlJUUzeVIDL9xXjIFDIUj4pUaQjcs3j1RT6kWJdzXp75Wh5LGp3zASuCpTPrqf
445kjXkUb8ub/yb2W4qGKDKfKf5mW2hMYyUX67sUYih5oLIFnt05r+Bi4sd0NZEQ
tiSx9L7BL8fn8cGrf4ap9py7x4SZyUluw/oEFEUOkm3AHVXN4yiqXTni9Lpi1ww7
1zpEKLn/UUjs2vQ72abhrNtavtrFRpvj+YYXoxG3ZtZ6lKtSMiSajH3leu4FxoQU
8+MG2fxw0uUNAdHhtNvbUYblOt+MSaMl737fJkf5ajSB1VnNPe5DYEeDzDkIOLI3
xFggYt6gBVEE2J67105aqZy8T1g3Fm5o2AYy8Vz/n0FHE/hxQiSdKrR/JkyZzus6
43v7nlTHVhxmJGQH6/uMebg3H2sbnEHS1d2bl6kgEHSo+/qaSNwopgXHF+OaRnYJ
9zZzg2RehVfhKfnZOx1py1a7agDL6xvqOOzLvJGYjd5aeXjfQWU=
=9QML
-----END PGP SIGNATURE-----

--BZZ09Xl/0fjfNMW1--
