Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4580DC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240374AbhLMQCY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:02:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240313AbhLMQCX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:02:23 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA81C061751
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:02:23 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v11so27843888wrw.10
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6SCihdNtzvxe3I4lI8LQAKRwYxjD4Zvlj+BibXShN5s=;
        b=Ij0VsSt5zkdwif1r92L4oFk+fAxgTnmMPngjle91tQGz0zqWF70UiBDqgRX/cqJi4A
         2ZlaI/g3PkbOsOHfrEZlBwEl6xejrpLqppKZKdouicxUea4Wq6V0IJt4kk0ajrxeG8Tz
         1sBBL3Y31f0kJpmsRvxQeXZrCg+lz925iJXh4lu2ZLk9+i8gd1CD/tyhM65qk3iVLiuV
         OIkzGGD276xY88JMn66Ay7Cn9YppMy6p4RW9ukTOm7Wi4C2ns7OVtD6hUOCJ8NXbq7Z7
         MxbIT7zl3HGPUhqwYlmnplQZo/kwRO/f/jqZOVcIXv7ge7G8xhWBzogRcqTqpyaW5Un+
         5unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6SCihdNtzvxe3I4lI8LQAKRwYxjD4Zvlj+BibXShN5s=;
        b=pQvcdrnpLmstMcgdF2XkYmZkP2mrJvEE1X1kJums9vtcGxt4YUW0fRT1VGodqqZz2R
         GuLKwJW3iQr1GfUrlrtaytWSVHFmC6fWT+cUR5OYGu9MzyN0AIbq9JK6Ye3RNDMuqnwV
         6lmjwrtbRrFDdnONoI/E0tKlR4lK7Y70KtvO77q29KUnsBNPTkyapEn1AA+XNNyCn6YJ
         5MNwirEg/Jntm1qKSUeDyZGp8J/wGtEm519JFq57oDLswziFfFXBoU127QnO0Le6gODN
         iwUvXHFckv+u5jf59AWdRCdrB8FXiVWRaoubMeYAzKTqrf8i48WjXlmtdim2I1v8J8T2
         r+jw==
X-Gm-Message-State: AOAM533upzulOzU9wZ5y/Ntpq+Oct1rm1jCcoavJgPNEC9SSd7zuYGDc
        Z3Tep1YByf/eK+l05o22hVU=
X-Google-Smtp-Source: ABdhPJyNatW/UUtSuy3ti3BhwKIBbi+P3xSVg69JaamZmACDGzu0w/yvH5JoBdfsrlWtAs6FjEMrDA==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr32957988wrr.508.1639411339454;
        Mon, 13 Dec 2021 08:02:19 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id e8sm11132634wrr.26.2021.12.13.08.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 08:02:18 -0800 (PST)
Date:   Mon, 13 Dec 2021 17:02:15 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/25] ARM: tegra: Rename top-level clocks
Message-ID: <Ybduh/k/UFES5IzE@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-5-thierry.reding@gmail.com>
 <d545f269-7d99-f126-0ace-b1a5cffe3ab2@gmail.com>
 <YbNNs+H05YZxA2ex@orome>
 <b2499ff2-78cf-8f97-eb00-3380f651c4d8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AQmE1a2OsY7SB5FH"
Content-Disposition: inline
In-Reply-To: <b2499ff2-78cf-8f97-eb00-3380f651c4d8@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--AQmE1a2OsY7SB5FH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 11, 2021 at 07:45:11PM +0300, Dmitry Osipenko wrote:
> 10.12.2021 15:53, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Dec 09, 2021 at 09:27:01PM +0300, Dmitry Osipenko wrote:
> >> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Clocks defined at the top level in device tree are no longer part of a
> >>> simple bus and therefore don't have a reg property. Nodes without a r=
eg
> >>> property shouldn't have a unit-address either, so drop the unit addre=
ss
> >>> from the node names. To ensure nodes aren't duplicated (in which case
> >>> they would end up merged in the final DTB), append the name of the cl=
ock
> >>> to the node name.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  arch/arm/boot/dts/tegra114-dalmore.dts                    | 2 +-
> >>>  arch/arm/boot/dts/tegra114-roth.dts                       | 2 +-
> >>>  arch/arm/boot/dts/tegra114-tn7.dts                        | 2 +-
> >>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 +-
> >>>  arch/arm/boot/dts/tegra124-nyan.dtsi                      | 2 +-
> >>>  arch/arm/boot/dts/tegra124-venice2.dts                    | 2 +-
> >>>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts           | 4 ++--
> >>>  arch/arm/boot/dts/tegra20-harmony.dts                     | 2 +-
> >>>  arch/arm/boot/dts/tegra20-paz00.dts                       | 2 +-
> >>>  arch/arm/boot/dts/tegra20-seaboard.dts                    | 2 +-
> >>>  arch/arm/boot/dts/tegra20-tamonten.dtsi                   | 2 +-
> >>>  arch/arm/boot/dts/tegra20-trimslice.dts                   | 2 +-
> >>>  arch/arm/boot/dts/tegra20-ventana.dts                     | 2 +-
> >>>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 +-
> >>>  arch/arm/boot/dts/tegra30-beaver.dts                      | 2 +-
> >>>  arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
> >>>  16 files changed, 17 insertions(+), 17 deletions(-)
> >>
> >> This and the next patch duplicate the preexisting patch [1] that you s=
aw
> >> and skipped previously. It looks odd that you redoing it on your own
> >> now. This is not okay to me unless you talked to David and he is aware
> >> about it.
> >=20
> > I had completely forgotten about it. I'll substitute David's authorship
> > for mine, but I'd prefer to keep the two changes in separate patches.
>=20
> I'll better separate David's patch and give you credit for that. David's
> patch was well tested and improved over couple months in grate kernel,
> while yours not.

It's pretty much the same thing. There are slight differences in the
names, but other than that there should be no functional difference.

Thierry

--AQmE1a2OsY7SB5FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG3boUACgkQ3SOs138+
s6FXlQ/9G6jffk4hkegnuLxABZArfLIvAh1ysbBFgAhgnchxMV55N4EbLcx1HW7K
RoEyeLd9IYwW4w3DC0641pQIIzvSYim/QW8FcNIGYtTazgL9MIbJ2gRynn11qqmS
5Xn+oouS/xc8Lo9jwdlQLuJEWnOl3IVTB3DUT4IngpZKssIoGIAff/a6eGBQyIz1
6HcTo3tNrP0JacJkc9BeuV8VJ9mIxnAesjJCl6rLzm8E4StCTw9kpY6FdgC985Zo
iLGXuQIFyYYGfYl1kqnCaCn8Cq9mbes3DkY2h7p/0Al0SujTQv08MnV2yPft15hc
9nJpcASNZH18ip8sfUP96xRKh6HtlBK0WcLKXvCIqyjFlWzDVN0vVU0DhaoPuEmy
rqlmHSonrl0PxHDQwnIaDU9aGU9ejP+qhXBj9WwtBQq3ToCgAbK8zIF5syR4Fp2A
it6hVg3RsPn/OawOSJ3ZasSyMA10zKb14+n0vKvDO4Vrmab7l1xOCBMS/uRgGmZM
INKPU0vjVl7Q8U8SrVS6VaIay6OHErOqhQlBnhbNGIqZAlW26nmhpEDfSiENwHi3
U1YkA4KiwX6KikZ6RMphAdBkxP+4fo/1b6mNjqh3M/JSYmOm3bFL5V+f2tSwDiK5
5C+kjCI6cvsDosO3m74CSkFnCPvwBlHzQpOOiLP2zSw5Kj9Irmc=
=jmhZ
-----END PGP SIGNATURE-----

--AQmE1a2OsY7SB5FH--
