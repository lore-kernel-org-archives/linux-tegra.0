Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6B9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:51:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C39E6103B
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 17:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243335AbhJGRxi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 13:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242934AbhJGRxi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 13:53:38 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E94AC061570;
        Thu,  7 Oct 2021 10:51:44 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u18so21606595wrg.5;
        Thu, 07 Oct 2021 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qr9MDwBMzsyNipMpKSvmO1rGtnLhU3br6C9ogb2fBw8=;
        b=l0gf8IrjazvORWdZh1xkbtoa0c0CKoUv4AKMehcFzvJQheuGcGirYhPyuyx7+hNTgI
         s/7zGlnozqfQpeqd3vdzzNELUBwjwZVJwm23vLAT5AfQtTpys1t6Pu64Au9fq17Fvrds
         +cr2luV22MzghTXwbPilEE2wvhdgWwNvPSRbKYOgjdnju/617H1R1SfDTg8zdTZjPkL6
         zld5VpxrcX0+oY+gfbAStKRm/yjXp5GugPCK9xEAIggNMIaFuOOLlA99V1WvN7ibTnjB
         FoNjYUaGaqApga+RajhPFk5VpnfDb7hOMiSLU8TCP255JHX/m+r1DwZGlBW8VKlj3LdZ
         CTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qr9MDwBMzsyNipMpKSvmO1rGtnLhU3br6C9ogb2fBw8=;
        b=woyKso1HKShQTr/Le1DxEMvoUTSnra7Ai9bSYxMIsHWDmPiccqq0x5fud1XD7p5Yzp
         a+XRTXSr7dG5uhkJvn3JQo2mpdFga0erN+4lxgVK8rF93X7AUujJokG4tEXZ2CoNykit
         gH+9aapgwDk93vinGcUWMX3cHh3G/rUYArry7QiVWoc5OnuLKWlRqvgYlZBULkVk7uUq
         mEAFRbs9+XK3rWHylZvNg2J7F7rGAOYBaqZX2H00pKhdi9mGytCizaEXYtttHMbDV87f
         efw2Udc0J9ZBz5NFniXequqYcDD9ctoflXZX/VHk1zwPZXaeE/IPfHxuBK/t2aULAZm9
         t8Aw==
X-Gm-Message-State: AOAM530pWUJMeSDoxgt4BSjCBZ5zhq/NflHgveWvDHdmM7nmERpinlJ5
        PiKxz2B4UFy+PzwNRhbpXnuFXT7v1Cw=
X-Google-Smtp-Source: ABdhPJzGYc6hxjff2pYBQkacMQj+RBkk0ySzdS5FILQml6vO4E7nfSEeog+342kYjoBnnZFmyPmmRg==
X-Received: by 2002:a1c:1b89:: with SMTP id b131mr17756682wmb.71.1633629102798;
        Thu, 07 Oct 2021 10:51:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id b19sm7506386wmb.1.2021.10.07.10.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 10:51:41 -0700 (PDT)
Date:   Thu, 7 Oct 2021 19:51:39 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] host1x: bus.c: drop excess kernel-doc entry @key
Message-ID: <YV8zqwBiAhOFh9r0@orome.fritz.box>
References: <20211005053726.14738-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kXhwAqbeq5nO1IC+"
Content-Disposition: inline
In-Reply-To: <20211005053726.14738-1-rdunlap@infradead.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--kXhwAqbeq5nO1IC+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 10:37:26PM -0700, Randy Dunlap wrote:
> Fix kernel-doc warning in host1x:
>=20
> ../drivers/gpu/host1x/bus.c:774: warning: Excess function parameter 'key'=
 description in '__host1x_client_register'
>=20
> Fixes: 0cfe5a6e758f ("gpu: host1x: Split up client initalization and regi=
stration")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
> v2: rebase and resend
>=20
>  drivers/gpu/host1x/bus.c |    1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thierry

--kXhwAqbeq5nO1IC+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfM6kACgkQ3SOs138+
s6FAVA//cxr3VWWOyxBD5qYYXmO+ZdMi5MeIZUI7hR7+Ure9SOXLlzZ7BOCU6vvh
Mv2VxIUEExKVLlYrUEVlR4G/WfuQHCml/FQeR1PY9CE8uub2zNYorD/ct30hfTeK
nmdxlK8SeQWldwfKxmuK0bL6sw/3riCFj5c2QruEjWDe3qNoeSS9+BHw/3h4PeNf
bx9UdF8vdjnz6Vu4WfIHDTbEZYtpIPuFXvdVyqknGh7CA25yBHf4sdZANQnP45CU
XMtJSvCDV75qTQNuJj5fpFxbuFAAhLCPoCWWrE2IvUluU3Q0wICrq7e5IuhzGBn9
3+Ar6S46NL/VMfRUJuDLNYzNzqNr/APZqh1J9/D+oDvBP2HIkHTBN76nT0IwklKB
j+pfdcFKD8qa4k1yelMznTSFlf9n4pYER3x4xezdl6jqsQtU0BAK88hy5tUP1M08
fRlErL7N71P1KG2izQa8zbIH/slaYgNd4Rqm4pbLYvfel3rt0FHqPXv6JFQrACMY
8Oub0cvReNN5YrVz1Qo2M0IkdPqHlhSTdvnXc4y3YdMkBsDhzLEULrp9cy7cqw4/
olreNada5aP0ANRylBC5tidRK3wOoGFEhBxa7WNXfN8riW3TIcAC0jdoTlr0KYx2
9rmf/oo/MvjnlKrXtb45xeVlVOLrqpwBO01xUZI7keSMbc7m5cA=
=NJUt
-----END PGP SIGNATURE-----

--kXhwAqbeq5nO1IC+--
