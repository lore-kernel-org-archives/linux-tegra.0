Return-Path: <SRS0=wvja=DN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE4AC41604
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 12:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FB50206F7
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 12:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbUZ41dD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgJFMj5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Oct 2020 08:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgJFMj4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Oct 2020 08:39:56 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59CB4C061755;
        Tue,  6 Oct 2020 05:39:56 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id i5so367984edr.5;
        Tue, 06 Oct 2020 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PDfjNNuI8ntPGAI87RSMywylXAzVcUt7MXvjlFqM91Q=;
        b=hbUZ41dDHeSJJ1OpfyoiOxv14aL1baBaXpNOm0OWS/pY+RKg6VeYeHAK45rNFNO0PN
         VmOoztHUfQo7oz6PfLM81R1WybntMdsWHzRoqbvTAadLfuIiW7yo+qUqV3lb2qcpx/yf
         TddGLsKlgvLHnzktKgxAkBcueCsMPNr0S7WoE1HC74/RQKVcCO+JFwTcsWWJbjZ5/bzS
         TlhlnWxRPJzmBt2vifDFL5Mpso47zmSjVXcVB2yAE/5WrRGzq3cowKymFS427MnDprTq
         hf2NwjTypMwN9dyUfuLKM2Ih9i+AREPiVRwmv8i4JSl1SQy1NInHeUZYlrFTOTd4SprT
         ijFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PDfjNNuI8ntPGAI87RSMywylXAzVcUt7MXvjlFqM91Q=;
        b=tPxoIcchBxXupTZetHsMH3rB8vLPwqf0EdXvu6nHIQzd+v49q9F+UhO+/NK8mlHFK/
         qdL/gQANm4I/Y/Ysu3bKT/SFI1DADsJHt6aNeR+0ovylexDFD9CRty/Cuog/ciSkh+/w
         5Opu1XlNhjZgyKxLVuye0ndKjuOHPjxmh8JZZlRd1dbgso8KHts0whfY3CtkDQYaU9ai
         yI4tMLc/D9OREPJZ4FYm1XJvsqGf6InKnsHJ1UNBCHMsBCwxK21ErqzpwKcVxLyk5wzg
         ydI4zc3Dvawz86vwbUQzWEA4pKYqp1gWJOxqjYB0wesJSv+V5jPhMjSe4EuZ2jna9gZP
         WKgA==
X-Gm-Message-State: AOAM530SyqrX6oeX2Yx33LTy0bYwodEq+8RjddjrNc2tSrIfuuKu+i1n
        tXlQSWGMa1CWbQObKf2eM1avSRkZ9lo=
X-Google-Smtp-Source: ABdhPJxK3ZxagNcu+hHEkHxPDu92CO2yjszW+SvKx1HIN4XtNALCQ0STGkdQSXejAqzk8Bwd+fYrWw==
X-Received: by 2002:a05:6402:18d:: with SMTP id r13mr5073298edv.267.1601987995071;
        Tue, 06 Oct 2020 05:39:55 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id r27sm2301228edx.33.2020.10.06.05.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 05:39:53 -0700 (PDT)
Date:   Tue, 6 Oct 2020 14:39:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: Re: [PATCH v2 0/4] soc/tegra: Prevent the PMC driver from corrupting
 interrupt routing
Message-ID: <20201006123949.GA1888126@ulmo>
References: <20201006101137.1393797-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20201006101137.1393797-1-maz@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 11:11:33AM +0100, Marc Zyngier wrote:
> This is a respin of the initial version posted at [1] (the cover
> letter describes the rational for doing this).
>=20
> Jon, Thierry: I haven't applied your TB tags as the series has changed
> significantly. Please let me know if they are still valid.
>=20
> If everybody is OK with this, I'll stick it in irq/irqchip-next.

Looks good to me, still booting fine and waking up from suspend via wake-
events, albeit still with the unrelated issues:

Tested-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl98ZYcACgkQ3SOs138+
s6GTMw//cIY//y1C9HqaPcgfu3lg0bX29BmpzKpeELWhURu0S9JfLpRLmYY/R+z5
2lV+/2nRXdGTMwn2hhVDjmZz9CyUSlzr2jb0yaBDS9XvcxAaiW5dEDs7HmCsiZaM
ZVpGH9BGCW0cIBPpCwnVVPK3Z0r01PWZuZHE/T6X0jZA5F0pKcdeaQxad/Cphpt7
L26lzSxNewNks7e20Nb8h+aTc2gv+IiHZzIck9Pfk2ikG/9pLRq8T2HVCyA4BPmq
0tTyINmmyKUJaYvElj9S47GIueTJ7PKalpjH3nujYp28YGuSZPVVjbhFMEuFcBYm
gZj4lbzOAORGqv6ezbxTqQxC2UAaOi5Faxuy03t9JaMyhKmuer9/9AUAvE/+kGA4
4jsvkpxfUXOFOpsVjGcfYgpblrDBeuTitIIyNG2Ux9SYrZTFK5O2GKp1bE8ZABmU
dHbOFymNESXcdV6YVNzxSo5So7YpAVKQivUM7bt9BgTeFXyJzUhmDo0DaW19KKNN
m/Y35jUUkaO1QymewTDQzub4ik6f4Mvvt3G1hBlT+G8kZKdpH54VuHJBVzg7biIT
pkczprNwvu5T5KlgVgz4hcJW/GxkEh3ZzvxJV56hSMpVpQaztAaNYTDPFtPZSBM5
3DHE0utiDveEsJFsMAIOWRefdEayzlgg7UfxEwFu1M3XbRn+yEk=
=PK80
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
