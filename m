Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896F8C761A6
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 11:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbjDDLCm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 07:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbjDDLCZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 07:02:25 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2759F420E;
        Tue,  4 Apr 2023 04:00:05 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id eg48so128760031edb.13;
        Tue, 04 Apr 2023 04:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680605958;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrKXR35KoHtvUamIb+vHWJmo5x1AYYK0s5Uldd+sEzw=;
        b=owPklgPZyLNELt55pjGvMeD1gDnqv/wx+ry7Te4RKyrUkJZhClfsiTFkw7i40Zt4fH
         lbPUl8AkFMlVhYiTzY/OYRunrw4dl7VJGFzY/37HDseaIUnJ0S2BWfbHXRtRagfnV80C
         GjBbFntScvpQ8I61l0PL2IJ9D2FZ9RKVPSA6uXOsRn/Nd8Tnga6c/pndAEoNSLGqyB/3
         aRZXC6QICaXhXAajDgfHOZuEXMWrSls+ty4YN4lgmcIj6VNhbd1L1sNJ1JlrG4os274L
         tmFlue+N9YKjg9epOkDyV+yH7PnUaULUOFgrHRw+WDstY6eqV/nRqUogAvsfmh7zBY7P
         FKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680605958;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrKXR35KoHtvUamIb+vHWJmo5x1AYYK0s5Uldd+sEzw=;
        b=fBehkvHB4Uj2f4bGkS9v+0Pvc3c6EWOYklXuibIyFhwNT1ELGb9Nh6mJrL/3ZJE24r
         VCO3X6pk3g95Hxwv/UD7fh4wJcS4AgB3fm83wsaWNarmNhuifj506TV/QLJsEmnoewRE
         CsFvpYqO7wAhOfeaHWli7d4Fs7H6qe/BvafbUQZKhVJQFQHr/rbIIVmYXasZjIy4Rl6s
         /adyjp4ro1uhTdscCEn294xo73jkas+v+VQDWQThSTMT6QDESugH6jf8358rnku6YGBY
         ddhSdyCrar+jQd/6MogNAIdyqYvGH9rNvPd4e6tko8mcvFRs1dTdmBylCHmZVzbWSVt7
         TplA==
X-Gm-Message-State: AAQBX9egmQAuOHcUkCVTXp6gdx9PQvqPpv3QOzwkW8Dl4SsrTmiqi97l
        PxnCVpghJAkDgKCanOMl46A=
X-Google-Smtp-Source: AKy350ba0gP0wHdbIZiFObFy3sXVGj4Jd8tB0wjRrqmFDiyTT5oAb30/doJAIvSJt4W1wm23Nz62aA==
X-Received: by 2002:a17:906:6a05:b0:937:9a24:370b with SMTP id qw5-20020a1709066a0500b009379a24370bmr2042773ejc.67.1680605958083;
        Tue, 04 Apr 2023 03:59:18 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id gh5-20020a170906e08500b009475bf82935sm5781228ejb.31.2023.04.04.03.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 03:59:17 -0700 (PDT)
Date:   Tue, 4 Apr 2023 12:59:16 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: tegra: Document Jetson Orin Nano
Message-ID: <ZCwDBO6317rGsAD4@orome>
References: <20230331163159.17145-1-thierry.reding@gmail.com>
 <20230331163159.17145-2-thierry.reding@gmail.com>
 <944bc557-7090-4b5a-e1bc-31b99fad06e5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="v/qc/BTVE1zVuUpT"
Content-Disposition: inline
In-Reply-To: <944bc557-7090-4b5a-e1bc-31b99fad06e5@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--v/qc/BTVE1zVuUpT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 10:20:16PM +0200, Krzysztof Kozlowski wrote:
> On 31/03/2023 18:31, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The Jetson Orin Nano is the little sibling of the Jetson Orin NX.
> > Document the corresponding compatible strings for these devices.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  Documentation/devicetree/bindings/arm/tegra.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documen=
tation/devicetree/bindings/arm/tegra.yaml
> > index 61e638c9cad7..60c151da5e06 100644
> > --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> > +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> > @@ -220,6 +220,13 @@ properties:
> >                - nvidia,p3767-0001
> >                - nvidia,p3767-0002
> >            - const: nvidia,tegra234
> > +      - description: Jetson Orin Nano
> > +        items:
> > +          - enum:
> > +              - nvidia,p3767-0003
> > +              - nvidia,p3767-0004
> > +              - nvidia,p3767-0005
>=20
> Similar questions as for patch #1. Where are the DTSes? Where are the
> differences? If we keep documenting every SKU which is the same from
> user/OS perspective, this list would grow crazy.

Most of the differences will be user-noticeable, even if they can be
runtime detected. Besides the mentioned differences in DRAM size, things
like the number of CPUs, GPU compute units or video encoders/decoders
can vary depending on the SKU. While the OS should certainly be able to
abstract all of that away as best as possible, on user may still end up
with SKU 3 and another with SKU 5 and it's important for people to know
what they have.

So I think we have to find a way to both keep things simple from a DTS
point of view (as I said, we should be able to make do with one DTS file
for the Jetson Orin NX and one for the Jetson Orin Nano with UEFI taking
care of fixing up the DTS per SKU), and not lying to users. If users get
a SKU 3, then that's what we should report instead of 3 (or whatever
ends up being the SKU that we use in the DTS).

So I want to be as complete as possible in documenting these so that
when people go look for the part numbers, they can at least find some
reference to them.

Thierry

--v/qc/BTVE1zVuUpT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQsAwEACgkQ3SOs138+
s6FgwhAAgom4wUL8V3MN6bhA7hBabbB7psKgeqcnxRi5vphiSFZlXQUyBzfTd2sv
jcida4FO3BA92UYBHI/4UNCdJ4W1kCg7+0lSl+YsxNxQPlBUPcBX0T6BcCbpihFP
oY7hsNteonwM2yGFSEoV20kFH36AVXf4YdXuTlD3S4C/a/WPxYFFrL6egywGXMy0
Yf4jDhNxrmRo8mNh5f+1TJ4shpxeRdBFkDzf3oREsR1LgY/y5Q7TT6+Bks6p7PET
1cxo2JCXC5uPze+afb6chHVES0tgjcexQ6kQuDkpncFp1yoHgLFBjokOWPsuupyT
FmvHLK7/hcBeI/cweyyjdFpSfFHEBTjZX75P4oJ3O7fUpulMC8qqC+p+2WWwrnm1
sBUD/N2FV0E5IShC3mCE4f+Ua+AK+BS6Xjcsopb4RRniTbR1yAjXSxTYUcneuUyO
HMJm1/EMIvh0x00gl5oEwHjv4gL6fhuUPrLdLwfF1B04BirvHWI6dOG1zOhdO0BZ
VMb8wAyUhwDbYt5YvVwIlNkw3aKwHUt2IseU0Kvt9q2wTN6NEjAEmVVf9P7YF+SE
plsg4VlSUVDvEN4Ic6nThpuaqLIV0GNKZHiyvYSobviQ/g0hsKVCNJVT9CxYm4In
p4BnlW5hQuvQKjIy5WxjQNnJYMonMKE4EAGXF/ymacr8Q+ots7U=
=CDdq
-----END PGP SIGNATURE-----

--v/qc/BTVE1zVuUpT--
