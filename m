Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2782CC4741F
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE9F1207D3
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 17:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7+4MMKf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgKJRjQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 12:39:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKJRjQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 12:39:16 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976D9C0613CF;
        Tue, 10 Nov 2020 09:39:15 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a65so3924706wme.1;
        Tue, 10 Nov 2020 09:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3j7jJsyWZ8Ub1lHC9hHb6D22psgRs0mO6ewqi6sqfU8=;
        b=X7+4MMKfLs01J5r2s0f+hUI9MKN3UCnjlGojTWp20EtXfp9QZsefXxjSrD0OlrXVvI
         e5k/AoYs6am5TkBsWMVCHIHLd+xlcpcOocBoF5JJ9xNK4Hl34woP75LGYJrq7/tQjLx0
         XHV9haJ4OxUAe6/8K5BpYQI4NNokVbMUJO1G3BFY6CP2rApEKP9P/IMFSk7E3rVx9kzc
         jbrTvXkxaX3Iw7vERUYuuoGlPb9hLv1la0SU4LrVxJWbnUj0lNDz4QApiGaF4Siur5hn
         h6GKTEoes5rUK09yL0JuNchUJLy0mAHOk+lpNeL9tfAZK8eWxK+xwiWMMQANZ4Q2XxFU
         5GpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3j7jJsyWZ8Ub1lHC9hHb6D22psgRs0mO6ewqi6sqfU8=;
        b=EAs3vX6ZSD/pJXmN+2ktpJXORWZ01X15tHW2kjFM3pRyyvSQsYG2+h78Eo3Dvg5iVi
         9NfFIRc2SeVbh6tilSTekQj4u5ZL/B6YdgZaXD2OF6mm8IMVJ5b4X6gc/G09+4xl/ydo
         nEhonyGkWZtSz9aj62/3v6IF4EFa5/+AlTJhWFQTXu2AufMzQ/zjSCsXtvBLIqlqBNb+
         hLSo/xrgb201TFVMRMOLEFVFSB8eNdUZ6lg+ZQFGMTHuV9AqI9BzmoTSQ0Aq57Rh6T3O
         CiQD2E9Igk3HGKHniOnrPQmTfwmQO6SSGIVUD/yfhOcFc6SmrVclz7yNZ515rWqa6v1g
         c6gA==
X-Gm-Message-State: AOAM531eTepYH09DY6XDbDavlsZBDkgj+oZhOF47kwwy2QM8l5wX+kKH
        yNoZX0Rz2pIY2/I7s2g7QTQ=
X-Google-Smtp-Source: ABdhPJwUQsXHWwDKfU7CmCQcultoJDQ2YkG6D0nUItF4uE4frQuwyxZEHXYGQ9uLe3pcVv/xYWe+xw==
X-Received: by 2002:a05:600c:2254:: with SMTP id a20mr176477wmm.117.1605029954340;
        Tue, 10 Nov 2020 09:39:14 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g17sm17959068wrw.37.2020.11.10.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:39:12 -0800 (PST)
Date:   Tue, 10 Nov 2020 18:39:11 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel-team@android.com
Subject: Re: [PATCH] arm64: tegra: Fix GIC400 missing GICH/GICV register
 regions
Message-ID: <20201110173911.GC2297135@ulmo>
References: <20201005133256.1390543-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline
In-Reply-To: <20201005133256.1390543-1-maz@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 02:32:56PM +0100, Marc Zyngier wrote:
> GIC400 has full support for virtualization, and yet the tegra186
> DT doesn't expose the GICH/GICV regions (despite exposing the
> maintenance interrupt that only makes sense for virtualization).
>=20
> Add the missing regions, based on the hunch that the HW doesn't
> use the CPU build-in interfaces, but instead the external ones
> provided by the GIC. KVM's virtual GIC now works with this change.
>=20
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q0D8ACgkQ3SOs138+
s6EAuA/9Gjy7dOhgu44LwHFzzy7JJqU6pWDrHAS5YKSF0Wux7V2rOHrtRRl71y9M
MuRLoEqYb1Okq10yZalUexL4ynJVZzQliLYxRow2w2wiA/+jq618N8dcDLCYa20v
BM556D6Rarn68hcbOiGAV5SYpCw0+5auRVrvrfU7oiz6o+4hY6YP6oiOK8PLwdfW
ZEw3PDVtPVcLWOCq+8Z6MwzcsJFlE3gMwjr7fM+nlEWdOfu5vfa8lBRd3UnKCBoT
om5dyZMN4Sn6C+u1sbQATithXK8QaFWrwsY+SvKNfghiuQgPaERPX6Wvvk/zSlU+
VqJoB2UKTXY95CqSpsfducbdyt9zqPdhZfS32DVyMjD2KKjTg0sDxSGm834v9VDP
ZokYzdF1ly2CMfM76AZ2pZiaUU7PARxQ0lNcteYZVRuJbSkGvNsb7O5XWApfIzdB
qX6UuRFLerbCz19dsR9igH9aLMrfA+zQTJszzAoEBkxOY78pfvAqSf4bD0nTnz61
jwz3AYwEkvr2hgPITnjU8rRWTUi151jdkIUMwapQqRqrAYDdc2bsNwqI75PL689H
4KrQHveqxvev76QphCoS0e8Q9KKKkgUsAsNRZQmIqrgmm2wPbS1HCQaJoP5CBX3L
kwVOyiy2MB6SwBDk776+JtPWVFaGAJOqi37M5nfU+HdYjFi5fNk=
=rMrB
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
