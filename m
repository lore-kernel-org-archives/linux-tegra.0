Return-Path: <SRS0=KKuN=C6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C99EC4346A
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 13:27:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1978C21789
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 13:27:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjQfWOUG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgIUN1a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 09:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727216AbgIUN12 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 09:27:28 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A54C061755;
        Mon, 21 Sep 2020 06:27:28 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so12787494wrn.0;
        Mon, 21 Sep 2020 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HKuU7JpLVU1PBj0jVIiCYxaLdFW/3Q4BrrvDHD/vFoM=;
        b=OjQfWOUGvS8vKD9rbIR3dJ08HDqYyREm1W/mAagKqnDl5qbkExQCWwYZwcwFzhW65d
         g+Krd0TSRSxmSrLmG6cwCGyArGhLNgVenAI6YgNEnXNPtw23BOsaJO0VC7UU2Y5zSUdU
         rHAXp2SzBL1sypBzEQA4T1xshK4AyA/D+UrLvtXtSaA+uzbKNY73Su/HeflR8CA84G90
         VfCB6s0zz4KPl0Cwl9UwkuWJqvZyf9D7xEVBidkz+JvQp/0NyCZYzCiB9lUdCN6iuhkn
         g+xG6BlS2ZsJgg1brj/iE8PJSnzt0f4pXsxdNx1aw7OLlUkVYqNxlSjmj4PgaX39GVhd
         SOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HKuU7JpLVU1PBj0jVIiCYxaLdFW/3Q4BrrvDHD/vFoM=;
        b=WM6ZkhfXkphrGL26Wy1325y2cuZf5bMisM53JjCPOBpkbpie2U+p8eVhKMaO9VUm7j
         1mbrh7pZ35kR5/h8vmEkPhSFD2r38Zu0+hZlYcns6tjnagnsUE948bQ7xIYDwaH//B4+
         HhNykLP9aKy8fpQWl7+jwCrJogwXOZwO1iNG2t+PMDN6Hx2TmShjcw+hB5TKdDSdiiaL
         +9z11oLGpNXxDfbl5ylLJ29DhpmqjdQfV33pYPNjX/MiGTh8Yc7u7vWMX5hc7mEvEPh/
         9bmVwYL9MM6KQOSM5ZFSELWmNgUO4idb4u5QJZ+i2eAua8n9j/68qvQR6WPAsMGB51hp
         D7KA==
X-Gm-Message-State: AOAM5332KvjTlVLIXx/yrWr0nqKp9zZOnWDiml3Bin5Peov3ZTvu3n8v
        ro04Z01rj+RyZ9ePyFhk+ucL0jPOOAg=
X-Google-Smtp-Source: ABdhPJwJAX4uVUX9aZ28FDXcSgA2gQ7vMBWi02ddoeec32uIkuLkE6NsU4P9DPevFlyqPCzJ83M1gw==
X-Received: by 2002:adf:e690:: with SMTP id r16mr52023767wrm.15.1600694847222;
        Mon, 21 Sep 2020 06:27:27 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g14sm21591201wrv.25.2020.09.21.06.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 06:27:25 -0700 (PDT)
Date:   Mon, 21 Sep 2020 15:27:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Qinglang Miao <miaoqinglang@huawei.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] gpu: host1x: simplify the return expression of
 host1x_cdma_init()
Message-ID: <20200921132724.GC3955907@ulmo>
References: <20200921131032.91972-1-miaoqinglang@huawei.com>
 <4378d69a-2338-779f-ab4d-3c64fbf7dfd3@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline
In-Reply-To: <4378d69a-2338-779f-ab4d-3c64fbf7dfd3@kapsi.fi>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 04:12:20PM +0300, Mikko Perttunen wrote:
> On 9/21/20 4:10 PM, Qinglang Miao wrote:
> > Simplify the return expression.
> >=20
> > Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> > ---
> >   drivers/gpu/host1x/cdma.c | 8 +-------
> >   1 file changed, 1 insertion(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
> > index e8d3fda91..08a0f9e10 100644
> > --- a/drivers/gpu/host1x/cdma.c
> > +++ b/drivers/gpu/host1x/cdma.c
> > @@ -448,8 +448,6 @@ void host1x_cdma_update_sync_queue(struct host1x_cd=
ma *cdma,
> >    */
> >   int host1x_cdma_init(struct host1x_cdma *cdma)
> >   {
> > -	int err;
> > -
> >   	mutex_init(&cdma->lock);
> >   	init_completion(&cdma->complete);
> > @@ -459,11 +457,7 @@ int host1x_cdma_init(struct host1x_cdma *cdma)
> >   	cdma->running =3D false;
> >   	cdma->torndown =3D false;
> > -	err =3D host1x_pushbuffer_init(&cdma->push_buffer);
> > -	if (err)
> > -		return err;
> > -
> > -	return 0;
> > +	return host1x_pushbuffer_init(&cdma->push_buffer);
>=20
> IMHO, this makes it less readable since now it kind of looks like
> host1x_pushbuffer_init is returning some meaningful value, instead of the
> code just handling error values in a sequence.

Agreed. Collapsing the error handling like this also makes adding code
to the bottom of this function more complicated than necessary.

Thierry

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9oqjoACgkQ3SOs138+
s6G9VBAAwKVijJXmqtUarO6foeE0wYjzdiAw+S3cuykrlg/Ji+72FwUlyjGRympc
NEzmcqnFQkYFQjNoNQNToHEni79t2WL2XmhUzElTmrkYxR5xAgwC149EOuLQXLnl
c+FLhNe6udpnt4DHTtqcL1AZRWRA+JZ02lPpObT5MzQj/t5XN8/cjgtamZbH1FHN
moaFT24SQ1V1D1wlCBan1aze4ruCppchbklRpuChNSS11loqp/Ywb3pnKlz5y+2J
xL0pVwAezOefXyJjk0TfRjYD1KvO+htYOhDJ8R71z04VpgT0vv9dlfWvzA4GUsBB
Su6w0ndEaFqw4dStkIuVFyF5jBS+idCw5r8B4GUSgBgpMxa41xmHRfVwVaD6Zab1
mX3dAswkmq9g6Z5lsXswI23BCb7v6vdh4zsvpU3dlG6CgE237cnZSZgfo2oPtsNZ
+DhjSxo4ZbnWFjU8U9MTxWi0kEXC7yZMmkw2RLCx+LDFMSAKOqNFXESfHSQoutQD
rpOedKlY1YIamxTeUD8jT0qvKR4mufH/O4XNUZTU2TPdI0ONMiIA+23McNr6RmrF
zOHwgWQUn8lYFhlgw7WtN6RXzR2Cr6Za/ekMPeAJRLwIGV9w0H6ZgmJYcA+ii4FX
fNZQHGdlivmzHPOcXFATqQgFEaAR8pUBSdnGu5CrWhXq4BpcpSk=
=SQV7
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
