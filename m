Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF33D3E49DC
	for <linux-tegra@vger.kernel.org>; Tue,  4 Aug 2026 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785834491; cv=none; b=j45g+WraMDaWj4tgEgN9mJD2lOV5wqCCtOhDX0QE5DXLma52DpkzpNWjMKq0/xEuVYYIwzD7CmPuoog9qY3CnIl6vTSWEL9HMgZQZ+kIHxScgvexM4mAIimCEiBMLWloQmIbCIevwhaaYOegetwTbN20VVVLCnFrPn0sNPjR+Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785834491; c=relaxed/simple;
	bh=CEGGzqKBN57KRzH6ISgWjm4SmaThU3nbfkNv09LopH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGPY/AsacY0yFe/SiaEfWm9jcs2BF4Qq0EnTt3WhITLrFnaeCfJdR/rG4wf20CYKU4xzOmm7pZVVsWRrgEHEObIYoridl+TmTMTwTL+ghrOZZyKa0xIKG5VcIgN6dyoP9c5rE1qwHnlnrDM/h8+iLwp5Ux2IQUB5lGrVpeqOexo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-96723c7151eso1105974241.2
        for <linux-tegra@vger.kernel.org>; Tue, 04 Aug 2026 02:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785834487; x=1786439287;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tOv5bZo9Op0KGuR4P2o8R2YUQOyL+65z/H44Za0zUBM=;
        b=R1AZ55kXkAHH7/ZJwUdsfkrXiLHEh5vAkOWLixusgqqrhOJmWqYsdnT6GxuBVLq1h7
         I3fwOUaHLe0x3ZYvHoZ1OK3K+kDSEqUc6nSwVRxmPxKMgnhRGR98bmQnaWzJIJ0kA4Rw
         AQ/CNvgUd4tKNRoM1rkIYE8ioyCHJJfE4S/rq+FzpbFgMXTtO1I4J0vd2XauSpiDu+6l
         JarImbxnn/J5YZKc4HYYqheNAdls3QYdp5Wf6I0JkezwEpm3z8AEe37vXXouXDAAcDmt
         JAG/ujRSnA+7PEFmSGILomV1SvEA9Km/h2KiZCzUzqKFeSGfMYSjnjOe8vL59KxUbNZx
         JtYA==
X-Forwarded-Encrypted: i=1; AHgh+RodiXSvY8XNY5lPlUqmreBM9lTJnXpC59zUgM3+AuU9IR8RsQpNqalrKBYbK7Q14mm7RdXJOQMqc6fLUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuuSmGjx82i2mMaTWEB3AUFXw4YVsxp7MeKHVsuhZPCxYUMA+z
	xOf1ZLVhWzdcz0aolrX0BL6CjAxHatUspvLH+kWeujF2IWF+zqxC9t7/65eV9V6r
X-Gm-Gg: AR+sD12dtwmCGZemviXbdXUnYjrnP4/NPCVE/RqDDXRmK9gTNbe9hzKYM4o0aI8DjAE
	DtwbQqP5DBAXKbye472+8ML5ooXVCOHc/hwpNrIO37rjFr6fVT99cd9hQS0Mh84sollnIanoFSf
	6/9/2IkuwkenmGbRhmHKr8ChxPSzSngB6aObOzKlhqN4R4LjeIX01nh+uCQ/LR4+3JcYki+jwDP
	23MopBV2jMQcs1O8Z9jRdO11MAOMtZk/I2PuTnH4EQ8eIg/l0ZuKsgNnukW14ASkI3XDPFGWNgR
	emrJO/R4mAGZ2x5cs03uSm1eijBvKkskFHI2hpiCfgv5D2/6NH0Jmq5ez6CYe47W2VauXH8Qu0m
	Xt4GgU33Tw15l8Qtrrr5MQCPCPd6NsJo8kXOkVssmvnmMY1h1imCQI6EqiPH0k8kGDqvv6oBuVN
	F2BkUhacwWVeiLwGrV2fNqE2aXk4Az0dXvqIFYHcjmZc25akZoDNgYYCsB4E6z0ZkEB/1p6rKeJ
	TJRa21ctWySPN51KCneZ+XBKA==
X-Received: by 2002:a05:6102:54a6:b0:740:2717:a2d5 with SMTP id ada2fe7eead31-75b22556e2cmr8876994137.6.1785834487152;
        Tue, 04 Aug 2026 02:08:07 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-760450312a1sm146700137.2.2026.08.04.02.08.05
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 02:08:06 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9692373e0b1so1106096241.3
        for <linux-tegra@vger.kernel.org>; Tue, 04 Aug 2026 02:08:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpzIBEeF6WC4ECfQ4TaCZOfIpk/uTkiKt0Y8DafFzE0vDWQF/sa+7xkL+jZT/8vDErG0GmgXPjlM3dBog==@vger.kernel.org
X-Received: by 2002:a05:6102:6893:b0:74a:b5e3:e96f with SMTP id
 ada2fe7eead31-75b22661bb0mr8022779137.7.1785834485554; Tue, 04 Aug 2026
 02:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526181700.25310-1-leandro.ribeiro@collabora.com>
 <20260526181700.25310-3-leandro.ribeiro@collabora.com> <20260721234802.GA439272@ax162>
 <126e8bdb-9c39-4fbd-ae8a-26a61dd4f3d6@nvidia.com>
In-Reply-To: <126e8bdb-9c39-4fbd-ae8a-26a61dd4f3d6@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Aug 2026 11:07:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXbPUkyOy0R0s58ayBK0mFFjZa4BKMUBwsnwr-oCQ08Q@mail.gmail.com>
X-Gm-Features: AUfX_mwSlmcVBCWNW55tO8uYYwlx8mnEjjrIqIaC97jtl2OBGsfuVpnzc0Yxtps
Message-ID: <CAMuHMdXXbPUkyOy0R0s58ayBK0mFFjZa4BKMUBwsnwr-oCQ08Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm: ensure blend mode supported if pixel format
 with alpha exposed
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Leandro Ribeiro <leandro.ribeiro@collabora.com>, 
	Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org, airlied@gmail.com, 
	daniels@collabora.com, jani.nikula@linux.intel.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	pekka.paalanen@collabora.com, simona@ffwll.ch, ville.syrjala@linux.intel.com, 
	linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 14:08, Jon Hunter <jonathanh@nvidia.com> wrote:
> On 22/07/2026 00:48, Nathan Chancellor wrote:
> > On Tue, May 26, 2026 at 03:17:00PM -0300, Leandro Ribeiro wrote:
> >> Before "drm/drm_blend: allow blend mode property without PREMULTI",
> >> userspace would have to assume that only PREMULTI was supported by
> >> drivers that didn't expose the blend mode property. But now userspace
> >> shouldn't rely on that, as they can't count with drivers always
> >> supporting PREMULTI.
> >>
> >> Warn if a driver exposes pixel formats with alpha but doesn't expose the
> >> blend mode property. This way userspace doesn't have to guess. Drivers
> >> triggering this warning must be fixed.
> >>
> >> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> >> ---
> >>   drivers/gpu/drm/drm_mode_config.c | 21 +++++++++++++++++++++
> >>   1 file changed, 21 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> >> index 66f7dc37b597..8cca1dea3b3d 100644
> >> --- a/drivers/gpu/drm/drm_mode_config.c
> >> +++ b/drivers/gpu/drm/drm_mode_config.c
> >> @@ -674,6 +674,25 @@ static void validate_encoder_possible_crtcs(struct drm_encoder *encoder)
> >>           encoder->possible_crtcs, crtc_mask);
> >>   }
> >>
> >> +static void validate_blend_mode_for_alpha_formats(struct drm_plane *plane)
> >> +{
> >> +    const struct drm_format_info *fmt;
> >> +    u32 i;
> >> +
> >> +    /* blend mode property supported, no need to check anything */
> >> +    if (plane->blend_mode_property)
> >> +            return;
> >> +
> >> +    for (i = 0; i < plane->format_count; i++) {
> >> +            fmt = drm_format_info(plane->format_types[i]);
> >> +            if (fmt->has_alpha) {
> >> +                    WARN(1, "[PLANE:%d:%s] pixel format with alpha exposed but "
> >> +                         "blend mode not setup", plane->base.id, plane->name);
> >
> > I am seeing this warning trigger on a few of my machines in -next. A
> > couple of those use amdgpu, which I see has already been reported in a
> > separate thread. Another one uses ast, which I do not see reported
> > (apologies if I missed it).
> >
> >    [  +0.000137] ------------[ cut here ]------------
> >    [  +0.000004] [PLANE:37:plane-1] pixel format with alpha exposed but blend mode not setup
> >    [  +0.000019] WARNING: drivers/gpu/drm/drm_mode_config.c:873 at drm_mode_config_validate+0xa24/0xad0, CPU#0: kworker/0:2/507
> >    [  +0.000010] Modules linked in: ghash_ce gf128mul nvme ast(+) nvme_core sbsa_gwdt i2c_algo_bit nvme_keyring nvme_auth xgene_hwmon gpio_dwapb fuse scsi_dh_alua scsi_dh_rdac i2c_dev scsi_dh_emc
> >    [  +0.000014] CPU: 0 UID: 0 PID: 507 Comm: kworker/0:2 Not tainted 7.2.0-rc4-next-20260721-00002-g17fa9b81f4c4 #1 PREEMPT(lazy)
> >    [  +0.000003] Hardware name: To be filled by O.E.M Ampere Altra Developer Platform/Ampere Altra Developer Platform, BIOS TianoCore 2.10.100.02 (SYS: 2.10.20
> >    [  +0.000002] Workqueue: sync_wq local_pci_probe_callback
> >    [  +0.000004] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >    [  +0.000003] pc : drm_mode_config_validate+0xa24/0xad0
> >    [  +0.000002] lr : drm_mode_config_validate+0xa24/0xad0
> >    [  +0.000002] sp : ffff800082df3c30
> >    [  +0.000001] x29: ffff800082df3c60 x28: ffffde7ac3633fc2 x27: 0000000000000001
> >    [  +0.000004] x26: 0000000000000001 x25: 0000000000000002 x24: 0000000000000000
> >    [  +0.000003] x23: ffff07ffb54b0290 x22: ffff07ffb54b0be0 x21: ffffde7ac36ebb13
> >    [  +0.000003] x20: 0000000000000001 x19: ffff07ffb54b0000 x18: ffff800082dd5038
> >    [  +0.000003] x17: 00000000d949c370 x16: 00000000d949c370 x15: ffffde7ac358f156
> >    [  +0.000002] x14: 0000000000000386 x13: ffff081eeebf2850 x12: 0000000000000000
> >    [  +0.000003] x11: 0000000000000000 x10: ffffde7ac44b5850 x9 : 738b2a5f3c615c00
> >    [  +0.000003] x8 : 738b2a5f3c615c00 x7 : 0000000000000000 x6 : 206c65786970205d
> >    [  +0.000003] x5 : ffff081f6fcc917b x4 : ffffde7ac36ebb59 x3 : ffffffffffff0a00
> >    [  +0.000002] x2 : 0000000000000001 x1 : 0000000000000000 x0 : 000000000000004b
> >    [  +0.000003] Call trace:
> >    [  +0.000001]  drm_mode_config_validate+0xa24/0xad0 (P)
> >    [  +0.000003]  drm_dev_register+0x44/0x3d8
> >    [  +0.000004]  ast_pci_probe+0x330/0x354 [ast]
> >    [  +0.000016]  local_pci_probe_callback+0x68/0xc0
> >    [  +0.000002]  process_scheduled_works+0x23c/0x668
> >    [  +0.000003]  worker_thread+0x218/0x324
> >    [  +0.000003]  kthread+0x130/0x180
> >    [  +0.000002]  ret_from_fork+0x10/0x20
> >    [  +0.000004] ---[ end trace 0000000000000000 ]---
>
> I am also seeing the same warning on -next for Tegra194 based devices.
>
> > If there is any other information I can provide or patches I can test, I
> > am more than happy to do so.
>
> Same. Happy to provide any more information or test any other changes.

Same on R-Car Gen2 (R-Car DU without VSP).

I don't see the warning on R-Car Gen3 and Gen4, but I don't have
a display connecting to those boards (meh), and rcar_du_vsp.c does
call drm_plane_create_blend_mode_property() (yup ;-).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
