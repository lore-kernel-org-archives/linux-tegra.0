Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C68C38142
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Jan 2023 15:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbjAWPVA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:21:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbjAWPUs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Jan 2023 10:20:48 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8E62B616;
        Mon, 23 Jan 2023 07:20:10 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id ud5so31425072ejc.4;
        Mon, 23 Jan 2023 07:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcQHb+Xis0HFaF9zQWyFF2vDw/LddSgp/iWOO9NEfRo=;
        b=gGOOXtlyfKqU+9EL6K4/Qk3WMyw/wSj7x2rjpLhe7qFrdNh0i8iQfSR11N5rSts5KF
         ihlXDNpuLZQTMD+o1q+wP0UecKRdglEsXeJk+7YCkJaPcvtpstA8uvSRQlQr/XFBlKRX
         MK6cttRj9naxZzIa5VyswIEaHjtAU/Ab4NF9bPqWGg/6VGhDyyUAtM7A9St1i1rvyY3f
         rrBVk6z+QgwSBgUIJ6ZuYCgXjkugah9VLq43O98BY72YlvikmfexdcFEWlZLc8rLe5F9
         1tV7p1nJnB05jxhu2vhzFdwzHx/K4wnXobecGcEIbkgi7eMGj0vS18zBwqUSV/FPlek/
         fZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcQHb+Xis0HFaF9zQWyFF2vDw/LddSgp/iWOO9NEfRo=;
        b=kw3WvZqKY+h82TttXBKoaM4XG/dTbPjDzO1BSCgswox/RGFePsXJcVf0APAGRjengl
         RrL59PbTs0cjaJ4G8z+SQLqRB/jheLa3ENDbpoXZKNjDDFMxohkh1ljddE3ZZX3Z3ZC6
         8EdAhi/3M38J1ktheuI/VLhqYUIbjVnVZl8B9UUc7SZcpNvHo6sjgTiEJ6mbyvpTGq7M
         Mex2SRQi872lvYpV96lu3URLhQ2YHt6XMmNQMz918Dpr+3jhWScv2+dCoaySTDtarx9A
         Hcak0xS9nsXlbnXVLMIhFesH69EfIWMQGLrhphD9nHO7CBxIHeCcbORZPFZjB0uJuRqt
         J/3Q==
X-Gm-Message-State: AFqh2krQdDMQwh02sG74aUz/lodRaJeIOOAXxtY9mkke/crsmUQJ+mbx
        WtNmmXhcJUPrY5mr+wKBHWw=
X-Google-Smtp-Source: AMrXdXv/sGl698DWK4gVf5kM7ZasaqHiJ6vQc3QuHpwPFZpSnClicyeQDanLVHMbjK2j1+bIUUkVFA==
X-Received: by 2002:a17:906:1995:b0:871:32e7:79ac with SMTP id g21-20020a170906199500b0087132e779acmr24352244ejd.5.1674487164889;
        Mon, 23 Jan 2023 07:19:24 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906318900b0080c433a9eeesm22225943ejy.182.2023.01.23.07.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:19:24 -0800 (PST)
Date:   Mon, 23 Jan 2023 16:19:22 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v4 7/8] drm/simpledrm: Support the XB24/AB24 format
Message-ID: <Y86lemXHHRt1x6UR@orome>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
 <20230120173103.4002342-8-thierry.reding@gmail.com>
 <1f372af0-9220-9a98-3495-08dca7729e7e@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZKjs7fCUe5qcsz+4"
Content-Disposition: inline
In-Reply-To: <1f372af0-9220-9a98-3495-08dca7729e7e@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ZKjs7fCUe5qcsz+4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 10:16:55AM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 20.01.23 um 18:31 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add XB24 and AB24 to the list of supported formats. The format helpers
> > support conversion to these formats and they are documented in the
> > simple-framebuffer device tree bindings.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks. This was the last missing Reviewed-by and builds are successful,
so I've pushed patches 1-7 to drm-misc-next.

Thierry

--ZKjs7fCUe5qcsz+4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPOpXoACgkQ3SOs138+
s6Hf4Q//Xm5JbfMl+psy+M/odlkdHkfzrSjjbNnIrjxHkcrxgFNr34apRKlEJhgj
Hhm7e5QYa1uhWoftt8QqeSuUKurbC6Vp8hG0V8uakOZK64iw9L9vZ0gjmHmjX4JR
FHc3eyiqp7fg+9SpJNW2PLyXh2JUZSNBWEzMM4h94JVTDsx2JvFqSt1Zm4/mxV0x
klhg+abyXrrVwYeZxrOY7gDXv0FrXIE1UKe/zAunNMEplop3nqcy5WG4pzc2z9OS
ExAqNkenx0nRINoa3xan8DukIG8pOzALYJNDac5Eoc/D0kRpPjqrDFl/JNv7LsuX
LuGz9U8HdXzTAw8RO/diJ3CEp/CmsW8SHneGS/u1snA9uo5hLGUWpNsIphVJTsIG
OabipmnbmcC6WPMDZPMbgbKh7kqSN43PbKw/JkQkBsJuWLeCiUsrOmitUGsnITJA
8QO2ndHnQlStDIYQoPZnZ4qzx1dIS0AZixnhzQ0omJ62pJ+EUVEh1MuIM+/iWI6f
TROFExQIR1uH4VkmmjOenMYtw+5Ltt1lUyR7toTcinhrKjPtZ2Pv6TNgCYF4Fm0h
0UD7usn18oH8lYJqvLRzcmOA6sVq44Wy6+TlBDAz9A++G18txWf3fasOprik47jq
9Ls8efy6CsGtm0P1CGm8P/s9Euo1pl6DEcYpPT//kU0cj4lkK2k=
=VSHR
-----END PGP SIGNATURE-----

--ZKjs7fCUe5qcsz+4--
