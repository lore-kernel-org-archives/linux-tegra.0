Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7633242C3
	for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764235516; cv=none; b=J54mueMplKfyhFy8dNPbJCQgoqTJgn85PfnaoA5bXv9DpI2uyiG2Ah9+3d6uYfzSxhcolgFb6D8xypJlz0Qn5yoHp/nCR+rMtRpcCQHdu34wZcUTEU5WnyOA/ZzNM2sg8m9DTdpy2gC6JcI+Viksum8Vt2BTI7zGR/UD/3YYU4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764235516; c=relaxed/simple;
	bh=97cehHV8E2B/yOICPg10wYDiBDFhsRbQSDrHOfbg2D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joCotRIqbyPkhOUDErR6ni4y/28ofIiN/dy7jNGyKUNMjEfo4TEyG9Fo8aBMiSwBDbn5B9N70fezYao17spr+XzdIMLa281YrPWnAzJ0CrD54o8UcF0f+qePkdthQUHGSl30Xvdl1Wy1HwpdK1l9P0CFRA6nxVRnzW9hjfmBhNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UixEnA0c; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UixEnA0c"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b32900c8bso415634f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 27 Nov 2025 01:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764235513; x=1764840313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+I8VCNVbIZb1Ga3KbW3HETLxJF16D1/QmoFMRdDEgiw=;
        b=UixEnA0c4x9hgAM28m0w001lBVQspxxTnIOUJOpGyAa++J/J2J+9+DqJMa2jNB1MG9
         idkUS7KHK/9R0hnhAjtcoBeKb9/ZlB7Sj8ASkS2+oYgP6sQcuwt24LBcLZ6VR92tp4z7
         DlMfpq3tX4+wHmRiacqSufXDQEroapXGvSNTt2+6BUqiy9Qj3klX/+i2zi27KG+0OVgy
         AoLS4h5m3cV4NWFHg+Uh9ZMLrgkbV6fhbOUogxkFJl5oXv6HNruk9yekFo+zJybWCPe6
         b+uhB3YeYy8nNhfYetS+oXNSdwsWTdDZfEK9srCLnL3c972RpAIYsRBVUF2JAA5+LsqT
         3dsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235513; x=1764840313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+I8VCNVbIZb1Ga3KbW3HETLxJF16D1/QmoFMRdDEgiw=;
        b=EjZXPCXDY1gQDhQpriUwZDD7MlF2R8qDtpKQQ6n9vulnraC4IemzuX0TsldLmNhsCD
         lp4AUm/PFFT4mzDZy37BVwKXvWFNEeygRLUJJcJ3WNjYqSSeYSUHA4XhzB15lyHZ5YBK
         t3fyYdVHd2NlxvRZWXoYHGftvuSwprQcRerY9gGHIq2P8bh5Ylz5C/CIDJFqZfCPC0fG
         mbzbbwH1Fjhl44kajTSphk6jv9XxGvAVfdP+XTmPT+B6jtfEix+nH00PQWDBVwdqB/dd
         6GrXwJxzkxVvRkhxfz2ijMv9nIin0s+/T00YJLLX68M+0EkLvEuXaS9lTW+FwV7sm6ig
         wbpg==
X-Forwarded-Encrypted: i=1; AJvYcCUwvZprtIdGCJxoUFsMlUbRIjOdHeQrVBQTlyZOutHMi1NvUapTZ2/2JodHQaJUSpULEKbZeDjnM87+bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIrnZHTksYGBPUygjyS2tZ3ja7VfzhjZ/zTZ/4Rp/mcFy4LmQj
	eH+no5m+QkiurDwR1NAvWRDW6/EQ51B+UCA20hyPKISb4PzSMxDseTwX
X-Gm-Gg: ASbGncvSxs0iBJnGQHu4vVi739no1WkUd5Dt756xHJpL4zE0ouaYirOEX/1tPGcb/5E
	PF6GpUDcVJgW9RZWcoPhS323uA0n+Uead2r7QHegjPZGcTKB58a4uWBKtnKxIPb8ANyb/WlXHBA
	PRZTHauBbeSCElL/1qfjlL80UuEo651n2C9SZ5kHf31hHiHcb6yZ7FjszpJu+uO/6W91u5PCf34
	kSb5oTDBTnADt1izyeDn58r7LcepjGZ2H/CGfKpjyPufAylkW/tqMgcpZhrEDhR0INPqmSw9TnW
	wfVlRHiExq5bU9482lHW490NgDQaESGy8FPI/WT+6JjD1O2LBiyJbVMw4cvoGqDh5s0Lj+UfUR0
	z7KrKxg+yTV/KznHpTv9t8zcx5+xezznU/AereqfJXoUAU2D4pqmPFXN+hbHHWn78NWisU82jdf
	v+jEdSfgTPyXvnOhfrQWQng65m5X9/sAIGivyvnNYP6U/nabtQr9nP0XrEKIAtbZkn7dJDMBzm9
	fjdqA==
X-Google-Smtp-Source: AGHT+IGG79mJOKFZfu8PTd7SjX8qZ9KCBSQoXmVphL0sY5PRAtFuYE03A4UTX8xfEMTJJauluUDvaQ==
X-Received: by 2002:a05:6000:401f:b0:42b:3bfc:d5cd with SMTP id ffacd0b85a97d-42cc1cd94f3mr25361718f8f.1.1764235512841;
        Thu, 27 Nov 2025 01:25:12 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1caa5d02sm2319380f8f.36.2025.11.27.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:25:11 -0800 (PST)
Date: Thu, 27 Nov 2025 10:25:09 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: vkoul@kernel.org, ldewangan@nvidia.com, jonathanh@nvidia.com, 
	dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: tegra-adma: Fix use-after-free
Message-ID: <ovxny5nhgn2lnfq2bespxwzntkug7l7pwfwhrn47nc42nvtn2h@6fqgpmvbxfla>
References: <20251110142445.3842036-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="phffro36367m2pq6"
Content-Disposition: inline
In-Reply-To: <20251110142445.3842036-1-sheetal@nvidia.com>


--phffro36367m2pq6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dmaengine: tegra-adma: Fix use-after-free
MIME-Version: 1.0

On Mon, Nov 10, 2025 at 07:54:45PM +0530, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
>=20
> A use-after-free bug exists in the Tegra ADMA driver when audio streams
> are terminated, particularly during XRUN conditions. The issue occurs
> when the DMA buffer is freed by tegra_adma_terminate_all() before the
> vchan completion tasklet finishes accessing it.
>=20
> The race condition follows this sequence:
>=20
>   1. DMA transfer completes, triggering an interrupt that schedules the
>      completion tasklet (tasklet has not executed yet)
>   2. Audio playback stops, calling tegra_adma_terminate_all() which
>      frees the DMA buffer memory via kfree()
>   3. The scheduled tasklet finally executes, calling vchan_complete()
>      which attempts to access the already-freed memory
>=20
> Since tasklets can execute at any time after being scheduled, there is
> no guarantee that the buffer will remain valid when vchan_complete()
> runs.
>=20
> Fix this by properly synchronizing the virtual channel completion:
>  - Calling vchan_terminate_vdesc() in tegra_adma_stop() to mark the
>    descriptors as terminated instead of freeing the descriptor.
>  - Add the callback tegra_adma_synchronize() that calls
>    vchan_synchronize() which kills any pending tasklets and frees any
>    terminated descriptors.
>=20
> Crash logs:
> [  337.427523] BUG: KASAN: use-after-free in vchan_complete+0x124/0x3b0
> [  337.427544] Read of size 8 at addr ffff000132055428 by task swapper/0/0
>=20
> [  337.427562] Call trace:
> [  337.427564]  dump_backtrace+0x0/0x320
> [  337.427571]  show_stack+0x20/0x30
> [  337.427575]  dump_stack_lvl+0x68/0x84
> [  337.427584]  print_address_description.constprop.0+0x74/0x2b8
> [  337.427590]  kasan_report+0x1f4/0x210
> [  337.427598]  __asan_load8+0xa0/0xd0
> [  337.427603]  vchan_complete+0x124/0x3b0
> [  337.427609]  tasklet_action_common.constprop.0+0x190/0x1d0
> [  337.427617]  tasklet_action+0x30/0x40
> [  337.427623]  __do_softirq+0x1a0/0x5c4
> [  337.427628]  irq_exit+0x110/0x140
> [  337.427633]  handle_domain_irq+0xa4/0xe0
> [  337.427640]  gic_handle_irq+0x64/0x160
> [  337.427644]  call_on_irq_stack+0x20/0x4c
> [  337.427649]  do_interrupt_handler+0x7c/0x90
> [  337.427654]  el1_interrupt+0x30/0x80
> [  337.427659]  el1h_64_irq_handler+0x18/0x30
> [  337.427663]  el1h_64_irq+0x7c/0x80
> [  337.427667]  cpuidle_enter_state+0xe4/0x540
> [  337.427674]  cpuidle_enter+0x54/0x80
> [  337.427679]  do_idle+0x2e0/0x380
> [  337.427685]  cpu_startup_entry+0x2c/0x70
> [  337.427690]  rest_init+0x114/0x130
> [  337.427695]  arch_call_rest_init+0x18/0x24
> [  337.427702]  start_kernel+0x380/0x3b4
> [  337.427706]  __primary_switched+0xc0/0xc8
>=20
> Fixes: f46b195799b5 ("dmaengine: tegra-adma: Add support for Tegra210 ADM=
A")
>=20
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>  drivers/dma/tegra210-adma.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Tiny nit-pick: there should be no blank line between the tags above
(i.e. between the Fixes: and Signed-off-by: lines).

Vinod, is that something you can fix up while applying, or do you want a
new patch for that?

In either case:

Acked-by: Thierry Reding <treding@nvidia.com>

--phffro36367m2pq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoGPUACgkQ3SOs138+
s6EN+A//eCaVnWWiwalvRfwGj0uFXrryZbhvplep4BUawxD2loC4f9SeEEUMUOMY
g0lWhqo3qp1ZZVq8xumXcxWEtGQh9cUct91Kot1Hz/H+uzYDwgwA5yVEF++uS0uT
2Y1cCLdXgFR6NyIfXLRDGFSDIgcUpY/qZVZ8dzoW7Pnq6fq2MW/tFoHseT2qvi+W
4qsvxd4VPUpvS9eEtO8YCXt0tW9gyTy9C4cZms5PWAICA+xPLWYFjyQGMmPaEFlt
ayJ5aC6BEgmcVtfi+5xsnNY8TvKmGTuxCsbtS+c22+LEUkzlluyGL/Tb6TjmlFxy
YBow4LxyaynmWbLTfOZ/oPoBWjvcCHVLh18lmfx/YfMNMrPvQ36TbYCX685Jlf/s
CdD3lcsbOYxmbVi1VwMRbZI9njZfMoufJNGSAuVOgyrSVG0OCsS6JgDPtPoUKp38
6KHEKWckTaxYVDX9+hNSgFdaOhHZ18z+YFCdVqP42QyDzhqoqkcWejPIlP2VFeSg
3nsjZBbp2ItA+5TSmP2/ipcx3BOK1E2w6Uz8UFE4TWB8vorB8sZMinXxKaZGhlk1
EDNm8/4O/6BgEzIo7gg3WYUT7hm2AHmI4RAK/ZIYbE/RH9NzoTx/WhNInusUL9Wz
+m3cXCI/E2BqGEeFp3dZ44stnPUG9H5DOsoF+SOPxX6gQ1rBizI=
=zX7p
-----END PGP SIGNATURE-----

--phffro36367m2pq6--
