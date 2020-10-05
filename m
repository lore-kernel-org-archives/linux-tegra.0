Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819CDC4363D
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C3D120795
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:22:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWQ9OpWC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgJELWX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 07:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJELWX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 07:22:23 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86ACC0613CE;
        Mon,  5 Oct 2020 04:22:22 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a3so11331363ejy.11;
        Mon, 05 Oct 2020 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NsdUCswjhW44/iq+GI3UE4jIjVZSP9jaXt8a3GxLGA8=;
        b=kWQ9OpWCPZNUQl7LkDs1yidP4lBZ0OMI2WCMsdl2wEz2KQ71P6e9mQQAbe2J+j8vH/
         wTEyS93teuKf85nLdF6WQZjjNw7uj9fDrA2vrnNS6mvMgdiuiqtNOZJRTexg0vfI/j06
         f/GhrM6Y8IlZzeSd6lQEtYPvVIDe48bCiO5Bpai1nItnK1ZDUew3uxf4n3LVEqk+vkxr
         A0dM7fmtVD/iF1PwH+qRLUmJwNnkgmAC+lBQJDRLFUG+Y09SbBi+HF3f4XKSKM/+g32G
         2yAbw3/42Etyc8/YZ9+M4AYOg2bBxsQ0AdwONnNAslUNfTDHrsRLEbRxVpUuPB0okJ+x
         RTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NsdUCswjhW44/iq+GI3UE4jIjVZSP9jaXt8a3GxLGA8=;
        b=Lvyqy2S1HlTTMNDa4zPmaqWopeSjaHNkS5ausF0BQKArhfM1BNYs/NK5Dq8gt4BHii
         CBYPyanDI9iL1xgtiBeMPeZXYhmBMQrQkH4nfLFR61mbSIWA/vO5WixqP2jhyovinEqD
         fOaajiMOaTSCTfY/K9ip6hM/ohS6dtnkNd3OBWfNCSLvKAJWAWBaavcR8/2GAhGnS+0b
         FytDVqkKQCUk+caMlc5O9/pk8oKMRn5eB2JOyndI/Zmdb+vl/CGJ3yfp9NDhuiB1F+xU
         KePqsImkk2R19d22Gc0d2hSwaUFZvEMNsPM9Y/oOR7c6vfrWZBPUN6jfxBN02l/Ws+Jh
         enXg==
X-Gm-Message-State: AOAM53113qi5N1FJmBIZOV3vd2QyA3FGY90SpggcfOei0ckqQ1Ch77Ei
        5l0lUiLOoCqaVg/rIOY0Obs=
X-Google-Smtp-Source: ABdhPJy9i1JlcLDglDslyS4/0ckb5SKZhrPPgkc1X+WR24MMXjQ+sYtzPjMFjnY3pqnRpTT6hji7CA==
X-Received: by 2002:a17:906:5596:: with SMTP id y22mr5110034ejp.189.1601896941243;
        Mon, 05 Oct 2020 04:22:21 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id x12sm8531314edq.77.2020.10.05.04.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 04:22:19 -0700 (PDT)
Date:   Mon, 5 Oct 2020 13:22:17 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: Re: [PATCH 0/3] soc/tegra: Prevent the PMC driver from corrupting
 interrupt routing
Message-ID: <20201005112217.GR425362@ulmo>
References: <20201005111443.1390096-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="im83/wVv0jiGQj4J"
Content-Disposition: inline
In-Reply-To: <20201005111443.1390096-1-maz@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--im83/wVv0jiGQj4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 12:14:40PM +0100, Marc Zyngier wrote:
> Jon recently reported that one of the Tegra systems (Jetson TX2, aka
> tegra186) stopped booting with the introduction of the "IPI as IRQs"
> series. After a few weeks of head scratching and complete puzzlement,
> I obtained a board and started looking at what was happening.
>=20
> The interrupt hierarchy looks like this:
>=20
> 	[DEVICE] -A-> [PMC] -B-> [GIC]
>=20
> which seems simple enough. However, not all the devices attached to
> the PMC follow this hierarchy, and in some cases, the 'B' link isn't
> present in the HW. In other cases, neither 'A' nor 'B' are present.
> And yet the PMC driver creates such linkages using random hwirq values
> for the non-existent links, potentially overriding existing mappings
> in the process. "What could possibly go wrong?"

Yes, that would've been my fault. It seemed like the right thing to do
at the time, but the way you describe it makes it obvious that it was
not. I can't say I understand why this would've worked prior to the
rework that made this surface, though.

> It turns out that for the 'B' link, the PMC driver uses hwirq 0, which
> is SGI0 for the GIC, and used as the rescheduling IPI. Obviously, this
> doesn't go very well, nor very far, as the IPI gets routed to random
> drivers. Also, as the handling flow has been overridden, this
> interrupt never gets deactivated and can't fire anymore. Yes, this is
> bad.
>=20
> The 'A' link is less problematic, but the hwirq value is still out of
> the irqdomain range, and gets remapped every time a new 'A'-less
> driver comes up.
>=20
> Instead, let's trim the unused hierarchy levels as needed. This
> requires some checks in the upper levels of the hierarchy as we now
> have optional levels, but this looks a lot saner than what we
> currently have. With this, tegra186 is back booting on -next.
>=20
> I haven't tested any wake-up stuff, nor any other nvidia system (this
> is the only one I have). If people agree to these changes, I can take
> them via the irqchip tree so that they make it into the next merge
> window.

Yeah, it sounds like this needs to go in ideally before the rework that
caused this to surface in order to preserve bisectibility. But if it
goes in afterwards that's probably fine as well.

Let Jon and myself do a bit of testing with this to verify that the wake
up paths are still working.

Thierry

--im83/wVv0jiGQj4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl97AegACgkQ3SOs138+
s6HyKg/8Cek1NtVtscx+fCy+FWQp795Utmrqx+Pv2MkGCpcHjVzg4lBU23UJ4uLT
k0UDV2dr9nHYW+mAmCNhRe1ncClqbGNXJxdF+P0IBXvJvUSVksEee64YolGMkoQR
LmDvK7cr2EV4++uy3tQA+xXcSoXQNJR8PBVNFC9TQ+Y8i9zrQngRfs06wXILo8Hg
nOvkVHHEA/tSMq+YUOK8XGx4QDyTVXGPDP+5IutWhPeasoDZrZvsWYJKxmGgmnFN
+qmDNkX+SVMBB8cikGZpr9scf+eDpJyFEROHdHPJ+jQOH44z95jMJlS8tMvIWFqi
6cU9T/1kr3aetu1gsWM5NgDvuiE6tqx+Zv027u9tBJxM/UBuJ3exPcae3cvukhZX
2LMt6Hy+0o4bpvWL6etoY9wO5A2XB05iR1y9zpaojWN2mtnHktxu7xmyyWjxhm+/
6FV/Z6U3HpMRZunjz/2UW5pBXw93JQBB+uDYnXqz2V2iXMfmr9V/LW78iswbqw8I
LGoyVKYEK5+JQYXAxbaER0t6FlQbelSo9Lxx9fespnfImSEzm8RQFXOVkRQMdzvk
yySHtuDZXoxMw+UifVwoBOhclqmSMwYm6LPxVTfJAlfEqp9XTiSrMp5EcZnmDOXm
sVJWISicsEzdLtu8oMEdWlbHg3Sw/pi2V4e30aHri72+MKGVJ7Y=
=I+ap
-----END PGP SIGNATURE-----

--im83/wVv0jiGQj4J--
