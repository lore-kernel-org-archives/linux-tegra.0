Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E95C4646C
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:28:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CD9920706
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731586AbhASRQx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 12:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387730AbhASRQf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 12:16:35 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E62EC061573;
        Tue, 19 Jan 2021 09:15:55 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id v126so22514781qkd.11;
        Tue, 19 Jan 2021 09:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Wq4qZjE/3PIn7FnaG2ZyC5WlhiHEngk1+PS8fgItLE=;
        b=JFx2kpR6qED4GlcB1JBdL5pzb/N3debM49RiAn3r7cD6kOxykr8h2jV+oZtcfVmtDv
         bl/NyyyYuuaeH/1X5rZ+hzMOFCj1R3DC5fRote5OwHhGCh+6sXR0tLGauMdV/2ZMJLZg
         XlM1/CS1QvD/r1jDrwt/QRyvGdBkp4eXu44ypOEoLpwsKKgZyxZyDWzI/GdmzIdyvml4
         3sU6NxKqDlAJvEfceK2wGe/Tp1i+BKjl6vt2y8i+IXD0z8Se2skSl36xrWsLyr65k6Z4
         h4uVH0458HyM/qP9HCFsQJseKhbIEkeuBIILcLiE1SJGlfIjGkqHkazxbKE775/8sZZ+
         wj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/Wq4qZjE/3PIn7FnaG2ZyC5WlhiHEngk1+PS8fgItLE=;
        b=K9jbTilpQDcr0W5ZTOPHalY4IPpkbCBirZlyvgzZV1KfntJtMul61U2M35v9snN2av
         CqYVaRIJcgyQGbSc0nT74RkrwWSSLL64fStPqQ75sV0HnDq0iWtrEAD/FLzRlHXKGsIs
         dD7eQfQHKxjr1apKqYUHD8wEHzc5S5NipNsBID7iy/6p8+Gkcu26wUKjwYJnP7KAimdU
         87eT1HPGBOPYUI2bdIbnD1nlrFJoRn9St5L4gbh7T0SlkVnMAfUct9GshaVXRFz+Dy27
         6XhNjp90tiUjJ4cwerAeUjW9kz6E8XZWLUd6eymxBegdyTSWJVxb6NagyrHpX8i0xP/Y
         WMbw==
X-Gm-Message-State: AOAM530M56Om7A7i0k8vFbJyaDJSaeTFMzzRcZQV+VcU+ZrIXFjpIeO5
        ba9bilxS+CNPVNco9aMeDBmR/d/67Uw=
X-Google-Smtp-Source: ABdhPJycqx06CLHOtr8yYwKPAeyRnNsWmzo5DsVRoLEFQGnY+lx39eEbN/524ikbpYu5IHC3qNi4Kw==
X-Received: by 2002:a05:620a:12ed:: with SMTP id f13mr5362033qkl.497.1611076554637;
        Tue, 19 Jan 2021 09:15:54 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k64sm13500696qkc.110.2021.01.19.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:15:53 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:15:51 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com
Subject: Re: [RESEND PATCH v6 5/6] arm64: tegra: Audio graph header for
 Tegra210
Message-ID: <YAcTxxyogVgfN1uw@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-6-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="V/me9ht3Hy4FdSi0"
Content-Disposition: inline
In-Reply-To: <1611048496-24650-6-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--V/me9ht3Hy4FdSi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 02:58:15PM +0530, Sameer Pujar wrote:
> Expose a header which describes DT bindings required to use audio-graph
> based sound card. All Tegra210 based platforms can include this header
> and add platform specific information. Currently, from SoC point of view,
> all links are exposed for ADMAIF, AHUB, I2S and DMIC components.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 +++++++++++++++=
++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi

I prefer keeping everything in tegra210.dtsi, but I can do that merge
when I apply, after the DT bindings have been acked, so no need to
resend just because of that.

Thierry

--V/me9ht3Hy4FdSi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHE8QACgkQ3SOs138+
s6HyRRAAr5aaieN+iwicZO0lllDEMbxrMSPQLW5lRPP/IsqHcVcSaInc2Xuoyeks
Q36vwKPpeHV4mWLwAPgunERnusPLI705z88oTVJnV1mXMiduyW2yfyBHdd6tpMZS
KX2rPHf1AoiBrvh170nem+ZCxjfqcMR4+YL58JjIpyXaPbfJ2qwnOuBDFKLU2uiS
yG3k6wyYsBBJWsS41rOya4dqNi+YpzGaQ7IE7r5YP3R0Or9RiEhwjE8xgXiLPVhM
YilIjWyv3Csc9yPsliO1WCriNboKL+BgClNQ4YELltr+mYbsSZwIzqXrApRwXJP3
6tuZA67Cmhmk9ghCxI2dljX+fkEks5lEIVpChT4GmF6vSbfF0kp8Sc+sIiGtkCRH
wx+30v+iqYLXN407FCL5gqiqzZPfIeAAKJ1pv7vDL+p4kqdiFHF0UTCvZoZKG4R5
FCsmesbdBCk8VjgfoHG2oFZ764r7uMdhrO1sTOryYEzqaUpEPh4dfHGye8OM9vYd
JvvEtllWM2nNLQ32sSKbvYZaRLVpqP3njGXp8qvTZ+TGkYDpTuHqYI2jpQmciq5f
gYN6k2z12Za8D82/QzEDwtgyLYayRmbFFIuaX7+eAjQBYSH6j2nEgwY4aOAUyXZF
Zmuw02HfH1lGSwdKNvQ60ynTniWrIfqxSlUVZQ9emj56wlkz8WE=
=if1e
-----END PGP SIGNATURE-----

--V/me9ht3Hy4FdSi0--
