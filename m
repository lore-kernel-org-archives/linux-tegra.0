Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36395C43467
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 16:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3AE820874
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602866582;
	bh=jr84u8hTDw7KLKrQ9vFJzO0wHhG/H9Q/V0cChZLCaO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1+XFXjTFth+ZOecoqHpOxZx1Z+ljxVeoVnl6gMZ0Z+WnCckMgeijHaRqtyguLnrr3
	 2ofSYI6QQdK++K7XRP/W03EN0o3ArqwR3pYMPvOVGlNMHEpQl6AXDI3IYajmu2wCA1
	 c/etzVRZb2UUG8tlkXKU6GAWF+3dg1PS6YqqpHsY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409168AbgJPQm6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 12:42:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:52472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405198AbgJPQm6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 12:42:58 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D995820848;
        Fri, 16 Oct 2020 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602866578;
        bh=jr84u8hTDw7KLKrQ9vFJzO0wHhG/H9Q/V0cChZLCaO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i7kJtcFX1rlebxCP8OvS8KDC6rnqrJMllH/Ff9YX8pj76Dt61+nzSr2JzXKEgE5b3
         nbWsuJxtsl8TAivQIiG8DJzZSW0KXNH8qJToutOcvptVIJ9ujOxaWvaAvLyvqFLfNR
         CHpL4M5S6Vy8KfW5S/suGkcTyXLXZ5cSOwkemrSU=
Date:   Fri, 16 Oct 2020 17:42:50 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     Rob Herring <robh@kernel.org>, lgirdwood@gmail.com,
        kuninori.morimoto.gx@renesas.com,
        pierre-louis.bossart@linux.intel.com, perex@perex.cz,
        tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com,
        rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com,
        nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com
Subject: Re: [PATCH v3 09/13] ASoC: dt-bindings: tegra: Add schema for audio
 graph card
Message-ID: <20201016164250.GK5274@sirena.org.uk>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-10-git-send-email-spujar@nvidia.com>
 <20201006203433.GA2786434@bogus>
 <a5bc07d8-fb2e-e86e-f0d3-be19166ad7bb@nvidia.com>
 <acbcd136-a933-e5e0-863b-f435dafe1697@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vbzKE9fGfpHIBC6T"
Content-Disposition: inline
In-Reply-To: <acbcd136-a933-e5e0-863b-f435dafe1697@nvidia.com>
X-Cookie: Pournelle must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vbzKE9fGfpHIBC6T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2020 at 10:44:15AM +0530, Sameer Pujar wrote:

> > I am looking to reference the bindings used in below doc which is not
> > yet in YAML format. Only additional properties I listed here.
> > {LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.txt

> > Should I keep this doc to *.txt format as well and later move to YAML or
> > is there a way to reference *.txt doc here?

> The dependency here is like below,
> Tegra audio graph card -> generic audio graph card (audio-graph-card.txt) ->
> graph (graph.txt)

> I plan to convert dependencies to json-schema in next revision and then
> refer these for Tegra audio graph card.

Yeah, unfortunately you need to do it that way around - you can't
reference text bindings from YAML ones as the tooling can't parse the
text bindings for validation.

--vbzKE9fGfpHIBC6T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+JzYkACgkQJNaLcl1U
h9DbqAf8DYA4YLlsLe3VZcZ+MHzvpMsnsHwATSDyKbIzcuVEyS5py0YVyaL9jfsN
wCv986CR6B7LLmAIo6TRfbbk7kDdHAgLDqFz6be5ypPoDkBrPk+PnQP/rPxZXMX3
K5Vq4oZDL3vjdJ5I0K4OLw2xXVnSny/Y/GcKNytTbrb7uKmbl8AWFXF7WUq2sivV
crmj6BSiKwt+pIrxeUDfWW5KdtatTanevhOx+d8lClG+mzCg0oGuUVjBzA8ZMGu8
EfPRMTAqnrEo9xaAMEIxdVvsntV+ibFSqT8o5dXozhL7+nw86FH8DFEOIRzDBLYM
hC5VtDA4CObZ/gwHIFkasu0/KOS1ew==
=/9Pr
-----END PGP SIGNATURE-----

--vbzKE9fGfpHIBC6T--
