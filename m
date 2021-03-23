Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD4DC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 18:22:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACB8C619C5
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 18:22:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhCWSWO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 14:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbhCWSVr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 14:21:47 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A4DC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 11:21:46 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id b7so28694393ejv.1
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 11:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8rKTrvPrWUe8LXJ4SCmd9G3+IJGFtRH5zECn5Wek8XU=;
        b=EDFj9LyflOSOkBeci+mhSkxFF21IG5JpUq73PlC/dNGeBn5eJbC5PAfqJ7UvCbeQ2a
         keGbb/IWBddeJjOaPsFaw4LHAV8c6G5C69a08THjPqkCslQpNH/v1KbDCz/Cg1Sx24bL
         SYbZDVC3PVwcps8Da7bgm8eFYq2/h+2th4MO/7rvdywQKsRSsCe5zAc3QXCxmcN0gmWm
         ufhvGDj+CNYOo2OSe2COz6QknRdF4lT9UKI2dDtQ1kEW/yO9N6N4mORR7J9TZaZG105g
         4K3jAhN9fX2QNazWotUiEa+/A5IP08GbPBs0N7T+09IlsSZ7gLaGDStAimJUSOH56znd
         tt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8rKTrvPrWUe8LXJ4SCmd9G3+IJGFtRH5zECn5Wek8XU=;
        b=uY51mo+X8yKkO4+H2LcE6sf9k8gYkxVoqRZK2QDKoPJX61SjI4TKGN0nJxLT8taHwE
         dZmsVeb6G6xammrTu2VmxfryPNks83llEP21KDHXE3I6ktSaMRNxzVEBNah+0tjQxWpC
         ih5SNsEa/gN5LQsXOMze0iD9PgbUaCTQtGILpRw3EPQIOrAuPpcfyk2gBH1Xdgf6qxXI
         YN1iTDKKL4aPgyNmdGn1MBtxBprwYElUofp/lMtBeQmn8uPcw/8wF8R7phoPHNwxJdNI
         6xmLocNE9BuXsL23RrbrkVte5bcBnS7megRusgSGuX7bEDWrpOAUsZu3KU1H6503eSL6
         oUTQ==
X-Gm-Message-State: AOAM531BDaaNUt8IrGmtOfW0F6EpK1Bi3/xqFerl246Ky+o9VQmEmcOp
        YScTI5xr/Ko5mtrOvfHYOdk=
X-Google-Smtp-Source: ABdhPJz2pxx36cOVGzdCWwH9REXN1Bd/3nPg8BCtqP9MKaIaUOXMesyAcb2CiZdtuRNipSWqjZuuXg==
X-Received: by 2002:a17:906:814b:: with SMTP id z11mr6150484ejw.290.1616523705556;
        Tue, 23 Mar 2021 11:21:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id gj26sm11431324ejb.67.2021.03.23.11.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 11:21:37 -0700 (PDT)
Date:   Tue, 23 Mar 2021 19:21:58 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
Message-ID: <YFoxxiMGFcSg3kk+@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
 <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi>
 <YBLtPv/1mGXwtibX@ulmo>
 <1ff922b2-161d-c8b9-7b08-4454ff7329f8@gmail.com>
 <25248139-5487-a15b-8965-1a29a71eacd7@kapsi.fi>
 <6211ee04-ebd6-74d3-cb5b-955b17acff5b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bT23De0RLxIkDAxt"
Content-Disposition: inline
In-Reply-To: <6211ee04-ebd6-74d3-cb5b-955b17acff5b@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bT23De0RLxIkDAxt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 27, 2021 at 02:19:39PM +0300, Dmitry Osipenko wrote:
> 03.02.2021 14:18, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> I'll need more time to think about it.
> >>
> >=20
> > How about something like this:
> >=20
> > Turn the syncpt_incr field back into an array of structs like
> >=20
> > #define DRM_TEGRA_SUBMIT_SYNCPT_INCR_REPLACE_SYNCOBJ=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (1<<0)
> > #define DRM_TEGRA_SUBMIT_SYNCPT_INCR_PATCH_DYNAMIC_SYNCPT=C2=A0=C2=A0=
=C2=A0 (1<<1)
> >=20
> > struct drm_tegra_submit_syncpt_incr {
> > =C2=A0=C2=A0=C2=A0=C2=A0/* can be left as zero if using dynamic syncpt =
*/
> > =C2=A0=C2=A0=C2=A0=C2=A0__u32 syncpt_id;
> > =C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0struct {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 syncobj;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 value;
> > =C2=A0=C2=A0=C2=A0=C2=A0} fence;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0/* patch word as such:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * *word =3D *word | (s=
yncpt_id << shift)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0struct {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 gather_offset_words;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 shift;
> > =C2=A0=C2=A0=C2=A0=C2=A0} patch;
> > };
> >=20
> > So this will work similarly to the buffer reloc system; the kernel
> > driver will allocate a job syncpoint and patch in the syncpoint ID if
> > requested, and allows outputting syncobjs for each increment.
>=20
> I haven't got any great ideas so far, but it feels that will be easier
> and cleaner if we could have separate job paths (and job IOCTLS) based
> on hardware generation since the workloads a too different. The needs of
> a newer h/w are too obscure for me and absence of userspace code,
> firmware sources and full h/w documentation do not help.
>=20
> There still should be quite a lot to share, but things like
> mapping-to-channel and VM sync points are too far away from older h/w,
> IMO. This means that code path before drm-sched and path for job-timeout
> handling should be separate.
>=20
> Maybe later on it will become cleaner that we actually could unify it
> all nicely, but for now it doesn't look like a good idea to me.

Sorry for jumping in rather randomly here and elsewhere, but it's been a
long time since the discussion and I just want to share my thoughts on a
couple of topics in order to hopefully help move this forward somehow.

For UAPI, "unifying it later" doesn't really work. So I think the only
realistic option is to make a best attempt at getting the UABI right so
that it works for all existing use-cases and ideally perhaps even as of
yet unknown use-cases in the future. As with all APIs this means that
there's going to be a need to abstract away some of the hardware details
so that we don't have to deal with too many low-level details in
userspace, because otherwise the UAPI is just going to be a useless
mess.

I think a proposal such as the above to allow both implicit and explicit
syncpoints makes sense. For what it's worth, it's fairly similar to what
we had come up with last time we tried destaging the ABI, although back
at the time I'm not sure we had even considered explicit syncpoint usage
yet. I think where reasonably possible this kind of optional behaviour
is acceptable, but I don't think having two completely separate paths is
going to help in any way. If anything it's just going to make it more
difficult to maintain the code and get it to a usable state in the first
place.

Like I said elsewhere, the programming model for host1x hasn't changed
since Tegra20. It's rather evolved and gained a couple more features,
but that doesn't change anything about how userspace uses it.

Thierry

--bT23De0RLxIkDAxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaMcQACgkQ3SOs138+
s6FXMg/+OoxiDkzLNCWvfj4075ct69q562Xn3EfEzFu+x7RvJm0G0c+A0nPLk9xc
nQAxU8k8lxVTffvTtdHcdSROD2hX3gzB/o/IQay0bxH1CF2XaPqTWVzabCEO7xV8
5FLFhVz1Xlntk0WVHJmgX0zsdSxvZt8oxlpOiXTYCQzE8MWGnB5Nmt9lOAZn93WU
immLob8p5ku3121pMBufZ5oGcrTDYsR+zzjqntzug9jI0Jw0SAPZbnvQko2ZcH3f
Yfzo/5+RnI84lqy8zfrxRbLt92WJ1kAvkI4OT35GES421P3gp/B/0zSEaxMNNVUM
Ilx1JIRYn8rNaCX+Gg/DWGzHTq3Sj5AeoSPdmDb8HCWUcDlRIOKrWHtj/zK8Sh5X
eQZXBa7QrliiQA8SvjNkmuPjB72vLuevEbkLvlYiE6DzBmza6a5iqFoQdoDhKmjJ
U24CJlQF4ANDA9elkUuFZrUqw2crHSdAsL67jXDXiXGmICNaywzwd3xmEFQiFFsI
9N2UxY88J0uMWxFCq1tUkorcBKGb20X58sY9WPcV5vTUQxnT1ek1QvQHMlbkzaZw
X8bzwk6EA7Bxp9e8tGXnI3pzZjVo6IoB9MWrI6RSrQGv7noODRGkxC33LT6xVXOb
ye0aypnBMjflChz30IFpj7Z4DnA30f4YSwF9aOii4seP3xo2Ww0=
=5OHQ
-----END PGP SIGNATURE-----

--bT23De0RLxIkDAxt--
