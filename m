Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73F7C433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Apr 2021 18:24:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8767F6109D
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Apr 2021 18:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbhDOSZG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Apr 2021 14:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbhDOSZF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Apr 2021 14:25:05 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9357EC061574
        for <linux-tegra@vger.kernel.org>; Thu, 15 Apr 2021 11:24:40 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id sd23so29645725ejb.12
        for <linux-tegra@vger.kernel.org>; Thu, 15 Apr 2021 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5fPp08I3UlNyfyinSIhYDrffZ4XYOOztYLSyb/AqyAc=;
        b=W+B5Kn8bT1hXq8fQjIxUUJinHZr3LbUq2WUDoMixJlYwUwPCHXGNxMUa5qPRIEwRB4
         BdmpSW+DIy8vEwWUk2cOJbjdjaBXJ6fhrm9Y3mLwF6IqTjMsPRek8c2qIc8iS7/MY/uW
         j1dWf6w6/vzI0KuIMOnxBElby3nn5Ex+MQM5aPNJnBN6QIB3I97uC1DJAGlcjhmvkjL+
         tbLVE7WiazPt/GEaAYO5n0fF/UmX88zdGI28cL4HpBCUWkM8mUzb2yL+F1ZLKrISvHVY
         OFldOK3XJHaVSeGRKSlw2Rg+7SrkOfvR4ejTtNznSf5wFFhBB786/DJc6Mvep9srC38m
         xCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5fPp08I3UlNyfyinSIhYDrffZ4XYOOztYLSyb/AqyAc=;
        b=NZAxmqrJJGfT6Io/JV4fvDSaV6xpru4Mal/LqV1gp1bpHcvX30hECah8wBCZIzCiuV
         GMkjXnnoebSNgyGvHFwnfEPI+zzGXDCzI6C1o5+SR+4i9ZWik0GF6AuNzszrHvO1zpz3
         H40qOOeouV54NOaW0Mv1hAJoBN6HRkK3id7xuqRUZBQVwk73Zv0UVn+xM154AeIgOqce
         Sg/y5SkwzIh1gtHS0Y3TTcZc+kUJ/Wil4/2Ca834B9neHC8yKTfvNU5FdoP+B9JTJyy/
         9fOQ9cD1kEgPq0vSCmusXQ7vm9RhR0WUFC6aRYDxlXsSDivNjKMgpx2Ak0snYzGMg/TF
         inNg==
X-Gm-Message-State: AOAM532B6SZrs0beqonQ+JR/gfA8855KEjJGNGjy4GhHmvztrcIEU+q9
        lHG3L3cdOH8isckdre9Mr9g=
X-Google-Smtp-Source: ABdhPJyrzSbtECmicTM5U3LnlO0oFE+SdFJRbX1mrPMpYMlXvCzCKGepzuYhQB0KZQwQMF/6txWliQ==
X-Received: by 2002:a17:906:a51:: with SMTP id x17mr4824760ejf.25.1618511079365;
        Thu, 15 Apr 2021 11:24:39 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id br14sm2504035ejb.61.2021.04.15.11.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 11:24:38 -0700 (PDT)
Date:   Thu, 15 Apr 2021 20:25:21 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/14] ASoC: simple-card-utils: enable flexible
 CPU/Codec/Platform
Message-ID: <YHiFEUUfsn3ni/Uo@orome.fritz.box>
References: <87wntmod33.wl-kuninori.morimoto.gx@renesas.com>
 <87v996od2c.wl-kuninori.morimoto.gx@renesas.com>
 <YHh/Y5fXMxm91Ha3@orome.fritz.box>
 <20210415181450.GJ5514@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vTM7E1v7rfE0AEjm"
Content-Disposition: inline
In-Reply-To: <20210415181450.GJ5514@sirena.org.uk>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vTM7E1v7rfE0AEjm
Content-Type: multipart/mixed; boundary="9mA83Bn2jGPQcM5+"
Content-Disposition: inline


--9mA83Bn2jGPQcM5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 07:14:50PM +0100, Mark Brown wrote:
> On Thu, Apr 15, 2021 at 08:01:07PM +0200, Thierry Reding wrote:
>=20
> > This seems to break display support on a Jetson TX2 board for me, though
> > I admittedly don't quite understand how it would be related to display
> > at all. Reverting basically the whole series (because subsequent patches
> > depend on this on) on top of next-20210415, I get working display again.
>=20
> Given that we got an oops it's probably just memory corruption
> somewhere.
>=20
> > There's this in the log, which seems to be related:
>=20
> > [   14.671377] tegra-audio-graph-card sound: too many links
> > [   14.799645] tegra-audio-graph-card sound: too many links
>=20
> This looks like an issue?  Or perhaps it's just DPCM triggered...

Yeah, as I was looking into this a bit, I noticed that on Tegra186 and
later the number of links can go up to 72. I'm not sure why this is
wreaking havoc, since presumably the check is there to prevent the array
=66rom being overwritten, but apparently it's not. I suspect that the same
check might be missing somewhere else.

In any case, I came up with the attached. I don't know how good it is
because now the number of links exceeds SNDRV_MINOR_DEVICES, but perhaps
that's just irrelevant and that constant was used merely because it was
conveniently there.

The patch restores display on Jetson TX2. I can look around a bit if I
can find where the boundary checks might be missing so that we
gracefully fail rather than corrupting everything.

Thierry

--9mA83Bn2jGPQcM5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline;
	filename="0001-ASoC-simple-card-utils-Increase-maximum-number-of-li.patch"
Content-Transfer-Encoding: quoted-printable

=46rom ba07d30380492661c8fc2677155c9c6230bae2fe Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Thu, 15 Apr 2021 20:16:09 +0200
Subject: [PATCH] ASoC: simple-card-utils: Increase maximum number of links =
to
 128

On Tegra186 and later, the number of links can go up to 72, so bump the
maximum number of links to the next power of two (128).

Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Codec/Pl=
atform")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/sound/simple_card_utils.h    | 4 +++-
 sound/soc/generic/audio-graph-card.c | 4 ++--
 sound/soc/generic/simple-card.c      | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_=
utils.h
index fac3b832d982..e318a2d4ac44 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -115,10 +115,12 @@ struct asoc_simple_priv {
 		     ((codec) =3D simple_props_to_dai_codec(props, i));	\
 	     (i)++)
=20
+#define SNDRV_MAX_LINKS 128
+
 struct link_info {
 	int link; /* number of link */
 	int cpu;  /* turn for CPU / Codec */
-	struct prop_nums num[SNDRV_MINOR_DEVICES];
+	struct prop_nums num[SNDRV_MAX_LINKS];
 };
=20
 int asoc_simple_parse_daifmt(struct device *dev,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio=
-graph-card.c
index 0582fe296471..80d065935d9a 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -613,7 +613,7 @@ static int graph_count_noml(struct asoc_simple_priv *pr=
iv,
 {
 	struct device *dev =3D simple_priv_to_dev(priv);
=20
-	if (li->link >=3D SNDRV_MINOR_DEVICES) {
+	if (li->link >=3D SNDRV_MAX_LINKS) {
 		dev_err(dev, "too many links\n");
 		return -EINVAL;
 	}
@@ -636,7 +636,7 @@ static int graph_count_dpcm(struct asoc_simple_priv *pr=
iv,
 {
 	struct device *dev =3D simple_priv_to_dev(priv);
=20
-	if (li->link >=3D SNDRV_MINOR_DEVICES) {
+	if (li->link >=3D SNDRV_MAX_LINKS) {
 		dev_err(dev, "too many links\n");
 		return -EINVAL;
 	}
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-car=
d.c
index bf5ddf1ea65f..7ac64fef73c9 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -484,7 +484,7 @@ static int simple_count_noml(struct asoc_simple_priv *p=
riv,
 			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
 {
-	if (li->link >=3D SNDRV_MINOR_DEVICES) {
+	if (li->link >=3D SNDRV_MAX_LINKS) {
 		struct device *dev =3D simple_priv_to_dev(priv);
=20
 		dev_err(dev, "too many links\n");
@@ -505,7 +505,7 @@ static int simple_count_dpcm(struct asoc_simple_priv *p=
riv,
 			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
 {
-	if (li->link >=3D SNDRV_MINOR_DEVICES) {
+	if (li->link >=3D SNDRV_MAX_LINKS) {
 		struct device *dev =3D simple_priv_to_dev(priv);
=20
 		dev_err(dev, "too many links\n");
--=20
2.30.2


--9mA83Bn2jGPQcM5+--

--vTM7E1v7rfE0AEjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmB4hQ4ACgkQ3SOs138+
s6EKjxAAwK5EKxf9bunSxv7mPb4/K8JeCdF8BU72U5AmEymr3PiU1Vuh1oLYFRPq
z2pz+N/8NWFoXDQ4LG8h44u0Dj35sEoWCUCbuKLnjLPVRJPW+dK5b7mETZU9QXLS
khYwpnifmPNFuW3YOLEJQeWyQ9xbOkb2TLc85jJ2L+6u5Yuq1gdYd8uf3bnb5RcB
ms/M0G3twJ3Hoc3j+aa1V/g9zIy8UJV5F5jOFgsD7Rulb53kMfHj3WHr9wbgT9Xq
LH/nLie7U0gcdDEK2poUxLyDDXDqfq9l1Pt9OvXt6Fxto2K+9MfMcABh8jGzXD7J
WZAFcYyQStlLX6kGmjQf04cy9u4j18VCh96y1MUKdgEiLa4L2pYkToHvQdJ6elVQ
tAf3niC6rEK07xdBNpCb5AzwWvOllLTBpBucOWJd661j5oEpDWZe7r7zNqSNcXIp
ax/z45kS6rAArK9UOiteEtCnLBob8FmQppAV+BLInqqjo347+gwG1Yk+JNnBFFnI
P1h5/+mc2YL0i/Gc7Z6LAorw4cs2XHPatqWlsahDATeVADkvyQVWP0D7O+14VV2k
/JB80OPktmUNsWrKaiVjhI5Za1FStGKFbN4nZqCgcFpfWWOhwl+qJuJA7zRXEICY
OuRCjoxg+jfAqr6fUGVJu8TmYlmorlbWRUTC02SyuaV56s49ozA=
=0GRh
-----END PGP SIGNATURE-----

--vTM7E1v7rfE0AEjm--
