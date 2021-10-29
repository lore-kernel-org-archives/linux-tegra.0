Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DC3C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 15:22:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE58360F9B
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 15:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhJ2PYo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Oct 2021 11:24:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:43392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229641AbhJ2PYm (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Oct 2021 11:24:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B48B60F55;
        Fri, 29 Oct 2021 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635520934;
        bh=K3N5Az/gCC0BKAsrlVXDoRH6GnWNwjX21xmwxUaiu4k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tBBp5TysnpZ7a3l8x+KecThcE6UPsz1Yy5AaHXezyrazZv6bk1dm0HM47XK1rv/B+
         R4bGIYF0UGrY0f9OpnZZAKztniaDQ6e51sYkwXAcvLvoL/SDZT8a0bjoXfxK/mZUHn
         /A/yqMQV2oopFAEAPiesebYEL1DQQIYDTDGKOuabxBbO6lyQqQKge1IHNtDXiPW03o
         b+pZoU/1o0HdiVIJpJbQox7Hm0jJ0zifortCdbj53jjcdP027cg7Gg+TKQQQckd3pf
         kF2G3swH+3BcQmsSE+lpjxz9QaM4WIH8RZ0aVOVbq89eKuJBDG5wJkxAq6mp59G4OB
         edUELgF64F0ug==
Date:   Fri, 29 Oct 2021 16:22:09 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, lgirdwood@gmail.com,
        tiwai@suse.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tegra: Add master volume/mute control support
Message-ID: <YXwRoWPF+ctNJRyp@sirena.org.uk>
References: <1635159976-17355-1-git-send-email-spujar@nvidia.com>
 <79541c76-2c2b-fd4b-60c8-67ee6b8ea3fa@perex.cz>
 <8cb777f9-b73b-136c-f560-de4c31af931e@nvidia.com>
 <18b61046-ac0b-0fb3-669c-6524a03eecf0@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FzXysqnWhsplUAtn"
Content-Disposition: inline
In-Reply-To: <18b61046-ac0b-0fb3-669c-6524a03eecf0@nvidia.com>
X-Cookie: "Just the facts, Ma'am"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--FzXysqnWhsplUAtn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 29, 2021 at 08:38:54PM +0530, Sameer Pujar wrote:
> On 10/26/2021 11:53 AM, Sameer Pujar wrote:
> > On 10/25/2021 6:28 PM, Jaroslav Kysela wrote:

> > > It's a bit unrelated comment to this change, but it may be worth to
> > > verify all
> > > kcontrol put callbacks in the tegra code. Ensure that value 1 is
> > > returned only
> > > when something was really changed in hardware.

> There are cases when the mixer control update is not immediately written to
> HW, instead the update is ACKed (stored in variable) and writen to HW at a
> later point of time. Do these cases qualify for "return 1" as well?

What matters is the user visible effect.  It doesn't matter when the
change gets written to the hardware, the important thing is that an
applicaton will read back a new value and users will observe whatver
change the control change caused.

--FzXysqnWhsplUAtn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF8EaAACgkQJNaLcl1U
h9AF8wf6Au6TOBbNtZfeRJ7HMsQ6sHTIYNis+bR/zS8cVSqlPF4sFhOLkx1Vk921
mFw6qqrRgTXdq5mJSUXqgQwgl1KFxfFiJyzI2b8j7sz+AEhTzcx51ZFD+teKzejw
QWoiOHtK6cS7fq9PAXVMaLnq0zA1EPCTU7sMDPb0xaJS1G+sFBULEEXnucT4UFPi
+aoQQ4SY8C1OCdT5MOFjhr79jeH0WTUa6RgkmhE5/mdqUF+6+yg7TTSwVETcaMk9
3muMn/+qPURk/qT7wZ6KxQVkut5/5hhPHh23MuusFzM+SkAchrIgeho+nvrsKWDZ
Zb3dE2wfxyWISHnG+Bo0iIepB8PrwA==
=QxNz
-----END PGP SIGNATURE-----

--FzXysqnWhsplUAtn--
