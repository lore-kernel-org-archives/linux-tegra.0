Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A58C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B5A32083B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdH0mqQy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgIQKdv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgIQKdu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:33:50 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1F0C06174A;
        Thu, 17 Sep 2020 03:33:50 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s12so1474465wrw.11;
        Thu, 17 Sep 2020 03:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eR704Y45+t40tYFD8fMVflpY0/eKLtlI4VY4OaRx8Ec=;
        b=YdH0mqQy6PZYpuVv5kVJrmMrfXEbAKG0hZRqvxBCN4yXtOXHxgF/qeDTbaClCDYUdf
         waQdLnPxaJZ6+Vo5WILPwhtJQol7zDIJBEaoatQLdrX3XzUYE1YNPTBcpwiXodOHAql5
         rmlT9GNJvwV2TEomZa/eRbaA0Rf7/AM9h1hi+AzGryL3L0zPTJgTQuE7DpcbbTOk5eZv
         JRmC0NY7gyDhSPbm2WcSnte3JNQSEa25iLFa3ELm6yIXPZIxL+/YsFMXUXVnOYdkx4ZH
         KuafVi76x/BGrwOppmNkhKKEi4nGCeqW8L3W1gvU3HtKD+mvJOXQ60Z0n0gbDGkgeF08
         1wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eR704Y45+t40tYFD8fMVflpY0/eKLtlI4VY4OaRx8Ec=;
        b=p9YWatsVvQeYOWlf/G9e5WLTZ1V5DhA18ncHeBr1ExXuhEdOGduyhCNnntvEeBEWuQ
         +UNEx/SQtYIufGvzOIsj0tnm/M3xS5YhunvsqRhKcudM9PJyzaCVLDIb9RrymTJUySjW
         KXvfA/xat+x/REOoj7vSPmstpLcDHtDqVdDkeh+v/iX4ykXRPrEPPloWHiry0NI+RRBD
         PUJA0hCMckFqz9MXp9//nysFSDWNs6OgqbTfIk0odRf6p+/XQAeak5dcQo5TqQNZ6P7F
         ahRezHbxWrahqJmx5ZjdAZ1m9V3N3n1Pxkif/EjsKfNtmLPWf7VJT6mgn7xZSa+ezh8f
         rU/Q==
X-Gm-Message-State: AOAM533/aB7/TlFyIqN9bGi69657tQh+zkaF3/xBk/COKcGTpZZoMm5J
        H6th+4SpfrWo3xELhbJFi8thzM+eOfW/KA==
X-Google-Smtp-Source: ABdhPJwC7vz3+45IXzNPRtaDG5ZmclmtgshM6x2tMINqaetHhe6C3I5o7FDe2dUE3C7UJ0i0GRs15A==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr32825728wrp.187.1600338829105;
        Thu, 17 Sep 2020 03:33:49 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t22sm12442228wmt.1.2020.09.17.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:33:47 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:33:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v10 0/4] Support DRM bridges on NVIDIA Tegra
Message-ID: <20200917103346.GG3515672@ulmo>
References: <20200813220656.30838-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WkfBGePaEyrk4zXB"
Content-Disposition: inline
In-Reply-To: <20200813220656.30838-1-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WkfBGePaEyrk4zXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 01:06:52AM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This series adds initial support for the DRM bridges to NVIDIA Tegra DRM
> driver. This is required by newer device-trees where we model the LVDS
> encoder bridge properly. In particular this series is needed in order to
> light up display panels of recently merged Acer A500 and Nexus 7 devices.
>=20
> Changelog:
>=20
> v10: - No changes. Patches missed v5.9 kernel, re-sending for v5.10.
>        @Thierry, please pick up this series into linux-next or let me
>        know what needs to be changed, thanks in advance!
>=20
> v9: - Dropped the of-graph/drm-of patches from this series because they
>       are now factored out into a standalone series [1].
>=20
>       [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=
=3D186813
>=20
>     - The "drm/panel-simple: Add missing connector type for some panels"
>       patch of v8 was already applied.
>=20
> v8: - The new of_graph_get_local_port() helper is replaced with the
>       of_graph_presents(), which simply checks the graph presence in a
>       given DT node. Thank to Laurent Pinchart for the suggestion!
>=20
>     - The of_graph_get_local_port() is still there, but now it isn't a pu=
blic
>       function anymore. In the review to v7 Laurent Pinchart suggested th=
at
>       the function's doc-comments and name could be improved and I implem=
ented
>       these suggestions in v8.
>=20
>     - A day ago I discovered that devm_drm_panel_bridge_add() requires
>       panel to have connector type to be properly set, otherwise function
>       rejects panels with the incomplete description. So, I checked what
>       LVDS panels are used on Tegra and fixed the missing connector types
>       in this new patch:
>=20
>         drm/panel-simple: Add missing connector type for some panels
>=20
> v7: - Removed the obscure unused structs (which GCC doesn't detect, but C=
LANG
>       does) in the patch "Wrap directly-connected panel into DRM bridge",
>       which was reported by kernel test robot for v6.
>=20
> v6: - Added r-b and acks from Rob Herring and Sam Ravnborg.
>=20
>     - Rebased on a recent linux-next, patches now apply without fuzz.
>=20
> v5: - Added new patches that make drm_of_find_panel_or_bridge() more usab=
le
>       if graph isn't defined in a device-tree:
>=20
>         of_graph: add of_graph_get_local_port()
>         drm/of: Make drm_of_find_panel_or_bridge() to check graph's prese=
nce
>=20
>     - Updated "Support DRM bridges" patch to use drm_of_find_panel_or_bri=
dge()
>       directly and added WARN_ON(output->panel || output->bridge) sanity-=
check.
>=20
>     - Added new "Wrap directly-connected panel into DRM bridge" patch, as
>       was suggested by Laurent Pinchart.
>=20
> v4: - Following review comments that were made by Laurent Pinchart to the=
 v3,
>       we now create and use the "bridge connector".
>=20
> v3: - Following recommendation from Sam Ravnborg, the new bridge attachme=
nt
>       model is now being used, i.e. we ask bridge to *not* create a conne=
ctor
>       using the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>=20
>     - The bridge is now created only for the RGB (LVDS) output, and only
>       when necessary. For now we don't need bridges for HDMI or DSI outpu=
ts.
>=20
>     - I noticed that we're leaking OF node in the panel's error code path,
>       this is fixed now by the new patch "Don't leak OF node on error".
>=20
> v2: - Added the new "rgb: Don't register connector if bridge is used"
>       patch, which hides the unused connector provided by the Tegra DRM
>       driver when bridge is used, since bridge provides its own connector
>       to us.
>=20
>=20
> Dmitry Osipenko (4):
>   drm/tegra: output: Don't leak OF node on error
>   drm/tegra: output: Support DRM bridges
>   drm/tegra: output: rgb: Support LVDS encoder bridge
>   drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge
>=20
>  drivers/gpu/drm/tegra/drm.h    |   2 +
>  drivers/gpu/drm/tegra/output.c |  21 +++++--
>  drivers/gpu/drm/tegra/rgb.c    | 102 +++++++++++++++++----------------
>  3 files changed, 72 insertions(+), 53 deletions(-)

Applied to drm/tegra/for-next, thanks.

Thierry

--WkfBGePaEyrk4zXB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jO4oACgkQ3SOs138+
s6HWbg//Z6Clq8+TmADrYJOapdadXAAoGBSCyRluJS9ZvqH6EMhCEWc6eUQV+1sR
nrCxeo4Rc0qBm1NOnZjmf7IyHBjiKPlSttO4UuNTK6KvF+izlXV51oTyoYmK8HfS
DgYS/fT1xQDRsksXzp3KaYDU0OVJwyzfbz35vLu2YWbI7pt4icf8XLRdiEfFkCvn
kLjmCWnlX+HKvzmxyRRqLjc56t+NTZ8nGI3kxcvrabehsQHI/LKbCYyGSen/bsf4
UoYNufZMm7CAf+Bx7TwqSjSXfA4oRxUwzNmwVWvDNt7Mnf+am1UAlw44cv/mTw2q
MaKeUi6Z1/0NChPuLpyTROb3fabZJ5fS6lut3k0ZUgg+rJov5gZfVOCrjlJAAc6U
optxnwtvwVokkCpu5tZFvR/TNO0DpIWvOgP9j6OELKYVYgWDwuthzND8/r8xH35f
y/hZlSR/VyYoKU0nouZEKafps4BsqH5qWC3u2guWCino2S4qde564i26e0ZJxYLu
rmmGo6FqEidLHkRfcmHuM+Z/F0xDoG+0LZ45OIJVRRx63U8MSyZONm2/qoqwsnEF
IDLwWYiNKJIFbx7K74L/TtNpuanxbvim1/QD4TaIIKmhQMYwagWw4vNBvbuF4TAM
xj56I8w2cMq2VGeZVFt8nUDrrfiS1XUez7IIRMctmifziP5BQf4=
=UWv+
-----END PGP SIGNATURE-----

--WkfBGePaEyrk4zXB--
