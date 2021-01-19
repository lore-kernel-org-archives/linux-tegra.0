Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130E6C433E9
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:36:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E214022E01
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbhASXgy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 18:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395026AbhASOE4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 09:04:56 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983FBC061573;
        Tue, 19 Jan 2021 06:04:05 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id c7so21881127qke.1;
        Tue, 19 Jan 2021 06:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EDeK0lzTgoH/F/4wDr6SvtdsoHPqaLFNgf6XdA+ur08=;
        b=mXBWNhqE4/90NeQXsy/H9x94t4yJ2FiofbnRAcVcCoUHkHfII5ZSAq3LJ7rW9b4VId
         UsQ5WpozSto+hnbLJlqTyyVAO8l0fRfHFfiFggtjo/fNCqoEuESU+hrZN5dwaREwawKL
         ZS2uhSVh+Sw5C6pylIjA55AIP3yAzYDKSPoj6JROvHcOgGkLN2MuzsigCDDLBjaJyegz
         l30Qe3uRxCxBH4nBYh2Cs1V+fg4mNjV3J1JEXjPxB8dHAAvyuNr9bvVBfJvwxeOeVC0t
         Tfx5PgxhkzAEg5hCOK2Wc+EevWHTPbbntgo9kQ0t009N7aUg/Oa0w6xh/gleWlQL6a/G
         En/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EDeK0lzTgoH/F/4wDr6SvtdsoHPqaLFNgf6XdA+ur08=;
        b=dmQoBvg2z+/O6HuTW7yoGN3xcd4XcARyYHMEHnFIIyFwUybfOeYu8Afy4kmGFFK3uD
         XOPF2HS6a2k9PzmVXkQB98Mffp3U9cnqYM2DnhajrwhnGste5u8WDQetIVly03uny4dv
         zM4QIJMH8pOzTCxJcF53+1kQmif87VzFS1FmuEA8zjUQhsh597ZsXCITp5kDGv+hPhJD
         7jEYUQENYJKHT+bXuyPwyOGYG0S6lQJkjJ7+xubfxU+FhJvGI30k70ijYhNh8iGViRFG
         chpk427disbhpqoHk6DhmF42OdERuVd3TGkWAGPY9rMQ8rp2yA9MhvLpoKBHvv6Ph2Er
         En4w==
X-Gm-Message-State: AOAM530E9css3z3PftcVCTR5pWWsTgcsMkQXcCc9YCTwLCxbu2kja9qA
        9Vy9h/gOz+wC9dwkp/0y+NM=
X-Google-Smtp-Source: ABdhPJyokyoVbgPCCEuLApBDGnb/D0dHQEpI6NDrkAwHwHHCpLjaKTrln+enuDkwKhlqxhEiKUWJNw==
X-Received: by 2002:a37:4f4a:: with SMTP id d71mr4489426qkb.55.1611065044747;
        Tue, 19 Jan 2021 06:04:04 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k187sm13007651qkc.74.2021.01.19.06.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 06:04:02 -0800 (PST)
Date:   Tue, 19 Jan 2021 15:04:00 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v6 14/15] usb: host: xhci-tegra: Unlink power domain
 devices
Message-ID: <YAbm0ELbAiFIZ+9G@ulmo>
References: <20210119085546.725005-1-jckuo@nvidia.com>
 <20210119085546.725005-15-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9nt/UnHYaVisIkOl"
Content-Disposition: inline
In-Reply-To: <20210119085546.725005-15-jckuo@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9nt/UnHYaVisIkOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 04:55:45PM +0800, JC Kuo wrote:
> This commit unlinks xhci-tegra platform device with SS/host power
> domain devices. Reasons for this change is - at ELPG entry, PHY
> sleepwalk and wake configuration need to be done before powering
> down SS/host partitions, and PHY need be powered off after powering
> down SS/host partitions. Sequence looks like roughly below:
>=20
>   tegra_xusb_enter_elpg() -> xhci_suspend()
>                           -> enable PHY sleepwalk and wake if needed
>                           -> power down SS/host partitions
>                           -> power down PHY
>=20
> If SS/host power domains are linked to xhci-tegra platform device, we
> are not able to perform the sequence like above.
>=20
> This commit introduces:
>   1. tegra_xusb_unpowergate_partitions() to power up SS and host
>      partitions together. If SS/host power domain devices are
>      available, it invokes pm_runtime_get_sync() to request power
>      driver to power up partitions; If power domain devices are not
>      available, tegra_powergate_sequence_power_up() will be used to
>      power up partitions.
>=20
>   2. tegra_xusb_powergate_partitions() to power down SS and host
>      partitions together. If SS/host power domain devices are
>      available, it invokes pm_runtime_put_sync() to request power
>      driver to power down partitions; If power domain devices are not
>      available, tegra_powergate_power_off() will be used to power down
>      partitions.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>

Acked-by: Thierry Reding <treding@nvidia.com>

--9nt/UnHYaVisIkOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAG5tAACgkQ3SOs138+
s6HtZg//YATKR0XCFqPsQh+D3HoLvJv6I3p39ntPOPsmRwuP5GJj+Z3Jb1pKbTwH
Kkf1V5pqOoMCgViGa/HVvqOokgs9JffGHDg67oLQqXnZv7KFoh7r9xpsFZkF0anG
5RB7ygKIf9o7e6IZQDX9XWM25diE4dQ/lrfY/cKYEEcIXBNeEtbIDe9lxydUPWxW
zcL8qfW2woN8iq/Nl4po2h8fZb3BvPn4zZBVdQJP4FxQF5HGNJJABVXeh10yZzHL
/CmD0ekojMtRiNSQUtxr7AlD/Vq9YqPkVNgZc/prhoTVswlJPO9tSO3hVYPDRpU4
HIqro3nRsg5BjA6JQGAfO1qP2I3jyo+r5WIbVrBzVP0fRZxbtzTt7Y9juieqgc+l
9gEPhSqUMupHAXgs+x1V5WzxOVRh+h67uIYsxfFSWRrXlvUScefdZE2bMCcUgJxe
DDm5/39okjToZafBcvvC2R5Ky7i2qM+KW+3I7dNO93rIdDIzk9GmoXeq8SKCSDei
lLjHZD4OZWKWHh3j5tIUsIqPQvOd6Oqf8HbNDpj5aN8l+YHWH2Q5DalqL/BXLgdD
WFYPuQi9Azrj3z9dMm7E68w8VHAc0yNhpieLpYPihIJDfEGTnxV3Omvb72ZgFG7R
hoA5lXMMf2GN25yq3gYtWzNITEaTtnrpv+EuPkJ3gMSOROi7OH8=
=g0x5
-----END PGP SIGNATURE-----

--9nt/UnHYaVisIkOl--
