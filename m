Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E078C433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 17:58:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14B48619B8
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 17:58:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhCWR5n (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 13:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbhCWR50 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 13:57:26 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD7DC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 10:57:25 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ce10so28564249ejb.6
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 10:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oTH6DjKJpQwYDsX840hYxEEQR1ZNfVs8ErSn1bEXeKg=;
        b=aWBOGdciUqTMp128bvH8t8sNcnTZO8HYN4jFWswia6c8uhwMNT0MRo2kWsaoNynCtK
         JdRDZvpjeV3uO1T7oDjrNSFMEyEeX2U+4W/aa4iT0M7wMQEHsdRxMWOwAnEHy7/fGUKp
         BYTv35KMerdCVkZE0Tumnk8AZnvs+spEmKEqGV/aPPwh4ZUF+exRb6M6aHlUg5j5pYI4
         J+2F9oxhsK4rynSY+fsk+J2Piu/YhL7meqAywTnOaT/zcMAT1t392YGwHA7W4VKYhI4g
         UiFgzw8DJfuUgeSbXtY+EjAyqa/GD41rpvY+o28CljP27gKSTKssF+aAGtjBZsqpOZns
         f25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oTH6DjKJpQwYDsX840hYxEEQR1ZNfVs8ErSn1bEXeKg=;
        b=beciNxK5pG6UTJxWsVs1L3zwkK0emJ5+owTVG3J1m4hW5r8EW9Mbyki4wAQG4XqMjw
         0MDdvFxMlZzH6y0VkAXXNWNod1a/sD/ZamvlOGNIIBplUSuRWYtnwP4ASrpQssHFVrnh
         YlmHxS8EpUR2etMHqT2trN/Fa4dbqbT56AwH84+H4KFyuOQV15NKvximTfarazpzBsBf
         pVHfwLZnHhRKEJdkgKsCZTFDRoxXTZnVYPyFE1p2aXgTu8sSVSHnz8LPs+kx3epceNwZ
         bIw/T7TjZc3apCvzaohIiUJkuYA3v52uQX6E2jafrsXW8EoVM5oLp8GYc13xGX8o9cbF
         P6hA==
X-Gm-Message-State: AOAM531UStQptdB6628b0mbka0ZntK8M2UzcBWKFOGy6tYRZLG5yOYwf
        QOZOeo81fUdT2GQCC8BP3js=
X-Google-Smtp-Source: ABdhPJwbiEOcfy70DLMT/Smqz64BlOTrZKTvzD/8O+Db1hDSkuzITOQeTSWTye0E9MxbNP2TRTQ/ZQ==
X-Received: by 2002:a17:906:27c7:: with SMTP id k7mr6149995ejc.13.1616522244557;
        Tue, 23 Mar 2021 10:57:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l10sm13331266edr.87.2021.03.23.10.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 10:57:23 -0700 (PDT)
Date:   Tue, 23 Mar 2021 18:57:44 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
Message-ID: <YFosGApNtUz+M4tc@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
 <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
 <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
 <d76c465a-7f07-88c4-0dc3-4be3cb212fcf@kapsi.fi>
 <YFnfYsfYaKfSGhon@orome.fritz.box>
 <0cc2ec5c-f8aa-ed45-92b6-32f9eadbdc5a@gmail.com>
 <YFoa57HBFpDu119Y@orome.fritz.box>
 <c0c21556-1f98-4137-b9a0-568ef3a8c8ac@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QD8cId/F5KLCv9gt"
Content-Disposition: inline
In-Reply-To: <c0c21556-1f98-4137-b9a0-568ef3a8c8ac@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--QD8cId/F5KLCv9gt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 08:32:50PM +0300, Dmitry Osipenko wrote:
> 23.03.2021 19:44, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Mar 23, 2021 at 05:00:30PM +0300, Dmitry Osipenko wrote:
> >> 23.03.2021 15:30, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Thu, Jan 14, 2021 at 12:34:22PM +0200, Mikko Perttunen wrote:
> >>>> On 1/14/21 10:36 AM, Dmitry Osipenko wrote:
> >>>>> 13.01.2021 21:56, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>> On 1/13/21 8:14 PM, Dmitry Osipenko wrote:
> >>>>>>> 11.01.2021 16:00, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>>>> +struct drm_tegra_submit_buf {
> >>>>>>>> +=C2=A0=C2=A0=C2=A0 /**
> >>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @mapping_id: [in]
> >>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> >>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Identifier of the mapping to use in =
the submission.
> >>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>>>>>>> +=C2=A0=C2=A0=C2=A0 __u32 mapping_id;
> >>>>>>>
> >>>>>>> I'm now in process of trying out the UAPI using grate drivers and=
 this
> >>>>>>> becomes the first obstacle.
> >>>>>>>
> >>>>>>> Looks like this is not going to work well for older Tegra SoCs, in
> >>>>>>> particular for T20, which has a small GART.
> >>>>>>>
> >>>>>>> Given that the usefulness of the partial mapping feature is very
> >>>>>>> questionable until it will be proven with a real userspace, we sh=
ould
> >>>>>>> start with a dynamic mappings that are done at a time of job subm=
ission.
> >>>>>>>
> >>>>>>> DRM already should have everything necessary for creating and man=
aging
> >>>>>>> caches of mappings, grate kernel driver has been using drm_mm_sca=
n for a
> >>>>>>> long time now for that.
> >>>>>>>
> >>>>>>> It should be fine to support the static mapping feature, but it s=
hould
> >>>>>>> be done separately with the drm_mm integration, IMO.
> >>>>>>>
> >>>>>>> What do think?
> >>>>>>>
> >>>>>>
> >>>>>> Can you elaborate on the requirements to be able to use GART? Are =
there
> >>>>>> any other reasons this would not work on older chips?
> >>>>>
> >>>>> We have all DRM devices in a single address space on T30+, hence ha=
ving
> >>>>> duplicated mappings for each device should be a bit wasteful.
> >>>>
> >>>> I guess this should be pretty easy to change to only keep one mappin=
g per
> >>>> GEM object.
> >>>
> >>> The important point here is the semantics: this IOCTL establishes a
> >>> mapping for a given GEM object on a given channel. If the underlying
> >>> implementation is such that the mapping doesn't fit into the GART, th=
en
> >>> that's an implementation detail that the driver needs to take care of.
> >>> Similarly, if multiple devices share a single address space, that's
> >>> something the driver already knows and can take advantage of by simply
> >>> reusing an existing mapping if one already exists. In both cases the
> >>> semantics would be correctly implemented and that's really all that
> >>> matters.
> >>>
> >>> Overall this interface seems sound from a high-level point of view and
> >>> allows these mappings to be properly created even for the cases we ha=
ve
> >>> where each channel may have a separate address space. It may not be t=
he
> >>> optimal interface for all use-cases or any one individual case, but t=
he
> >>> very nature of these interfaces is to abstract away certain differenc=
es
> >>> in order to provide a unified interface to a common programming model.
> >>> So there will always be certain tradeoffs.
> >>
> >> For now this IOCTL isn't useful from a userspace perspective of older
> >> SoCs and I'll need to add a lot of code that won't do anything useful
> >> just to conform to the specific needs of the newer SoCs. Trying to uni=
fy
> >> everything into a single API doesn't sound like a good idea at this
> >> point and I already suggested to Mikko to try out variant with a
> >> separated per-SoC code paths in the next version, then the mappings
> >> could be handled separately by the T186+ paths.
> >=20
> > I'm not sure I understand what you're saying. Obviously the underlying
> > implementation of this might have to differ depending on SoC generation.
> > But it sounds like you're suggesting having different UAPIs depending on
> > SoC generation.
>=20
> I suggested that this IOCTL shouldn't be mandatory for older SoCs, which
> we should to have anyways for preserving the older UAPI. Yes, this makes
> UAPI different and I want to see how it will look like in the next
> version since the current variant was sub-optimal.

What exactly is sub-optimal about the current variant? And what would an
alternative look like? Like what we have in the old ABI where we pass in
GEM handles directly during submissions?

I can see how this new variant would be a bit more work than the
alternative, but even on older SoCs, wouldn't the explicit mapping be
much better for performance than having to constantly remap GEM objects
for every job?

In general I don't think it's useful to have separate UAPIs for what's
basically the same hardware. I mean from a high-level point of view what
we need to do for each job remains exactly the same whether the job is
executed on Tegra20 or Tegra194. We have to map a bunch of buffers so
that they can be accessed by hardware and then we have a command stream
that references the mappings and does something to the memory that they
represent. The only thing that's different between the SoC generations
is how these mappings are created.

The difference between the old UABI and this is that we create mappings
upfront, and I'm not sure I understand how that could be suboptimal. If
anything it should increase the efficiency of job submissions by
reducing per-submit overhead. It should be fairly easy to compare this
in terms of performance with implicit mappings by running tests against
the old UABI and the new one. If there's a significant impact we may
need to take a closer look.

Yes, this will require a bit of work in userspace to adapt to these
changes, but those are a one-time cost, so I don't think it's wise to
ignore potential performance improvements because we don't want to
update userspace.

In either case, I don't think we're quite done yet. There's still a bit
of work left to do on the userspace side to get a couple of use-cases up
with this new UABI and it's not entirely clear yet what the results will
be. However, we have to move forward somehow or this will end up being
yet another attempt that didn't go anywhere. We were in a similar place
a few years back and I vividly remember how frustrating that was for me
personally to spend all of that time working through this stuff and then
seeing it all go to waste.

So can we please keep going for a little longer while there's still
momentum?

Thierry

--QD8cId/F5KLCv9gt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaLBUACgkQ3SOs138+
s6H2hA//RHgqdKbIW2keJEhsQt39Z2WGadWQKPtaaYHYsbUtEFnTEfaNKwI9sV+L
zGTZfGZMMCY2JwGW52axtLD7YiiXRPf8ru7Mp8UYu0xabLJkFz/vA5u35GQA+ThJ
ecjGAmZaQz35C4/MIb0nHMnwOeFzyu42pSECg/mKqYLUxSIao3vc7Rnqsi8osxr6
UdJUXkxxV5RIvcjbaGiJCOIa6y2iHW36v9OmSNXGg7P53/7EEip0BU676ZPWu7Wn
iG+FRsCt+Rkw8f0+h7neSW+mkzCs2Y5czwaBe2KaNABv1bJMtq7NjoHlM1CWBuk1
czQ1konYzs3AQZ7sEvqT1bxlArgaFdFUYVxjfi8CUBriwidnxNmTLb+cANb6V2tG
EdR2onvOoHfmn+9QamBCtEYsZxqdfR2l4XBJrfVqXxzlGFp2+zAiJUT+WlxYTUkV
xXjTAswLfoXLQ0WUusdM5Ve/cyI7CGedTdJpO/I6e0RWp3zJR3dd6ca2pvVNGCpJ
DmMMWEB4PJAYuAqHss5cbKw2vPpkfofI6GyxLrxl2mkxNwZAyT6cKKtvQRquIMMO
Ju4Y/Xh6EJKDEhN6eJHMgPXA49gmUS9kb+B2DOXtv8Qpxi8oib9snd9FpVEV+AfK
+zx7Coh0ivDvrewXOiGzmY3ZQ8+fL/VVUHY1AOF3H9osPm4PZvg=
=fA7C
-----END PGP SIGNATURE-----

--QD8cId/F5KLCv9gt--
