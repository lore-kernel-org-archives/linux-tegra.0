Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7C6C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 11:43:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F22D619C0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 11:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhCWLnI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 07:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhCWLnC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 07:43:02 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1267C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 04:43:01 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id u9so26553242ejj.7
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VaxC2sCz35SELYarA1nVbhlcYnmw1I0wgdU0rKr1+Bo=;
        b=SZFCvTjocNToYKrMlzves30KQn/4ugHEhypte9Wgnpc6Mz4M5KGTAgqXZQ5IopHSu5
         1X53U4E1w5+v579M4QVD6+pjhRINaY7y4CZ0kABEUFMIpXd+P/HP0WL6I3wFtQVRldXB
         X8zrp1cFaivGxRMP97zDorEi6B79B+ezgmH15bTn8XqgsUIVE9hEW3UWxcHEpFC9caVH
         AnWbst59tYUVWgxzyUGDT+tUYSYiZOWOWPgD9+h0AAKBDTml3qi2kzZhRKonM7A3iKFe
         +vdlDqPUYxGOmlixkidL8aNWixVeyecJsUynf9ALcp4WJzw2fPJpoEn4LJG9uGr7cPor
         0FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VaxC2sCz35SELYarA1nVbhlcYnmw1I0wgdU0rKr1+Bo=;
        b=PHom5PSb8DfdI2+oUWEum1e8+L0Pz1jKsRTsDn2BZGEDd37xRtzaXjxZvcd8QuJT8L
         mR43CLTv1ny4kFsGSt4ih7IPXdPUNFainq6c3QLeZ3vyDpeAaDgH6UWMzBqpiYup+shC
         kBzNKEtVtalgTBqxyRFPlA2a4yRRDx7O/IzSyw6lW+Xjc0wDjnekNEsrbgxHkT08DXEI
         c/eLOumyT5A9j/RfIqWBOCdPDf7qde4PCEYOvYzLpitCJygKqp1V0aaaiDQiXeW5L/7T
         WlZdm579P9QSjHyQGzkOl27ZfifEtqvLh21NAogLWkHx1wjo2MNyqo437gN3vcO7DWft
         lLMQ==
X-Gm-Message-State: AOAM531HDKCH607Ss8jsaGDDV6e7NKNpM3CSZjy70I7bnr+2nrOrpFPK
        UWJc88dfbVAUw+fl68Y0fVo=
X-Google-Smtp-Source: ABdhPJxYie+1JqR5XcEK9u9R0ru43ikw86kGloCOE3hKdl6HvWD/1yB2QptgTwB1DLNpxZcVtKWelw==
X-Received: by 2002:a17:906:151a:: with SMTP id b26mr4526305ejd.492.1616499780582;
        Tue, 23 Mar 2021 04:43:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u15sm12959386eds.6.2021.03.23.04.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 04:42:55 -0700 (PDT)
Date:   Tue, 23 Mar 2021 12:43:15 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        digetx@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
Subject: Re: [PATCH v5 07/21] gpu: host1x: Introduce UAPI header
Message-ID: <YFnUU0gZE0zVMevp@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-8-mperttunen@nvidia.com>
 <YFnIef+dDuqLv5Ek@orome.fritz.box>
 <47840607-8e7c-cc02-bf9b-e001c91f7354@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mQZPLCGLWiRYvdYR"
Content-Disposition: inline
In-Reply-To: <47840607-8e7c-cc02-bf9b-e001c91f7354@kapsi.fi>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--mQZPLCGLWiRYvdYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 01:12:36PM +0200, Mikko Perttunen wrote:
> On 3/23/21 12:52 PM, Thierry Reding wrote:
> > On Mon, Jan 11, 2021 at 03:00:05PM +0200, Mikko Perttunen wrote:
[...]
> > > +struct host1x_fence_extract_fence {
> > > +	__u32 id;
> > > +	__u32 threshold;
> > > +};
> > > +
> > > +struct host1x_fence_extract {
> > > +	/**
> > > +	 * @fence_fd: [in]
> > > +	 *
> > > +	 * sync_file file descriptor
> > > +	 */
> > > +	__s32 fence_fd;
> > > +
> > > +	/**
> > > +	 * @num_fences: [in,out]
> > > +	 *
> > > +	 * In: size of the `fences_ptr` array counted in elements.
> > > +	 * Out: required size of the `fences_ptr` array counted in elements.
> > > +	 */
> > > +	__u32 num_fences;
> > > +
> > > +	/**
> > > +	 * @fences_ptr: [in]
> > > +	 *
> > > +	 * Pointer to array of `struct host1x_fence_extract_fence`.
> > > +	 */
> > > +	__u64 fences_ptr;
> > > +
> > > +	__u32 reserved[2];
> > > +};
> >=20
> > For the others it's pretty clear to me what the purpose is, but I'm at a
> > complete loss with this one. What's the use-case for this?
>=20
> This is needed to process incoming prefences for userspace-programmed
> engines -- mainly, the GPU with usermode submit enabled.

I'm not sure what GPU usermode submit is. The name would imply that it's
somehow a mechanism to submit work to the GPU without getting the kernel
involved at all. That's something we'd have to clarify with the Nouveau
team to see if it's something they'd consider implementing, or implement
it ourselves.

Currently there's no interoperation at the syncpoint level between
Nouveau and Tegra DRM, so Nouveau on Tegra doesn't use any syncpoints at
all and hence there's currently no use at all for this kind of API.

> To align with other upstream code, I've been thinking of removing this wh=
ole
> UAPI; moving the syncpoint allocation part to the DRM UAPI, and dropping =
the
> sync_file stuff altogether (if we have support for job submission outputt=
ing
> syncobjs, those could still be converted into sync_files). This doesn't
> support usecases like GPU usermode submit, so for downstream we'll have to
> add it back in, though. Would like to hear your opinion on it as well.

That certainly sounds like a much easier sell because we have use-cases
for all of that. Along with your patches for NVDEC, the existing
userspace for VIC and your work-in-progress NVDEC userspace, this should
cover all the requirements.

Long story short, I think we have some ground to cover before we can
start thinking about how to do GPU usermode submits in an upstream
stack. As such we have no clear idea of what this is going to look like
in the end, or if it's going to be supported at all, so I think it'd be
best to move forward with your alternate proposal and move the syncpoint
functionality into Tegra DRM so that it can be used for VIC, NVDEC and
potentially other engines. If we ever get to the point of having to
support GPU usermode submit, we can take another look at how best to
support it.

Thierry

--mQZPLCGLWiRYvdYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZ1FEACgkQ3SOs138+
s6FF9w/7BCBU2eODWHNrSVuxMU5iRLCDhOz+GSdLuhUD/oBZyRQksOk9+RFNEdJw
mHcPLcIjgcJfsgOTwYNneLCLCCoeuMd7S4U16lzNFojXYjmPw6kPTG2oRX/TzDrJ
3mrA2F1hmjlgCLbeq+hEffaCgo731OM/hzBE+EAPjTv9ch77zjUehw0BV6iQ8tGy
fbnDVmQsQeBPVdnZkx0s+wSM839+B2qPNAtjb8kV5DF2+tbb1DXhtNKzanABlX6f
AFlasqj8EdcNjPvC2j/W0g7BMh8haIUCzeSShdXCOGiEHg2V36eKfkuc+UOv7JgQ
zknqZOkGKcxYzaGQA7w60DYlSjke8HPKDid2XGU2+O+Yh7rKR2sb6fFpWi/qh7VC
eRZK4p8iToVAweGrZj2xSuOjQZ7kFAsYDROEHhaOygafQRl8z7nJ2H8c9fGKLRHH
m7+gvPngNCn4hl0dFz5/AQW+tMPAB8wfHsb1fbTeFmf8VpluoEK+lTuW9WIvXeN2
NAn0EZFrW8ZizedktTlT/EbshsiwACjic/m+6XQgVsH/f+C5EvLjuXgDwegCZucH
t7rQSYnXt9jyhA2JdE3kjskJAoriDJ3EcByfnmQiez30/Q/U7DJ3IgxKKrgmulE/
MiYe482KjgT5aX5V+2ueV/qhPk04DPWfCKogfit8/Tt80xx5uh0=
=+6T0
-----END PGP SIGNATURE-----

--mQZPLCGLWiRYvdYR--
