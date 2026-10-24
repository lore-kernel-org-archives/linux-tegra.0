Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792830533;
	b=QfOoWOk370f5WZyPsowauUbEmDQwAuaI87qud3DwvuRnCNZ1Tc97X45e+lP+dRhttk3u
	 CeuBQwf2n9LYgHt0Tn5O31HPdTSNFCLixzyACySyl1jpdGWlaQe6ezqva9OAnHVARao2m
	 bgRxjP51AY4/mvjf88wwYElXKFaAddsnFVZSHOKznrV7pouONO0zDj0wVydi52vYYch4i
	 6V3CeQRwbGzTsokHsdebYHR1ao+yFo0MNc43qGPGYcQlpp1qvW8zKZ44Opk9QK1foKT59
	 evlwJsLDg0UP6Wg0BapGjohYFm5gj50WjhwEEm/14Fo38vWIdD++IFufpGXw6fIb1xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TV8aougv0HFFxEZHCD307mI1j0UTUQCx1/QXIS2xyiY=;
	b=TS1ENwIdK09vnBtXkkJjCU/Tet0jbEcS91PEE2Yp/EUpmkNL+rDOJuVGHsuXkjbc3Tv0
	 mAInpTukKV7PSZuAO9cYrDBsN1p7QaS71Z3Jz9ipATx6HNpf1Z7njqtNXQcK2awmQoBCf
	 MWUM/m6OlnizB3qU5Rox68iZGyAxPSx6O36SBqX9YEEAFhxSTd4P6SuBbT1CjKb3MGcqX
	 W8p8pAqaGC+DP84nqeBwnHsmZiKK0+QVP3pyo+1NKLFeIRoCzCsHV9640l59fOa7M9NYx
	 jsQJSbEkdzAgl95ELbIr1HGB0u+FXD20O1oEPWRvmNPdpN2ZT06tfsHssl20k4V/6MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pRpSXZU1;
	arc=fail smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9A606A31B
	for <linux-tegra@vger.kernel.org>; Sat, 24 Oct 2026 08:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB9A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pRpSXZU1
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917997ab0d9so18199596d6.3
        for <linux-tegra@vger.kernel.org>; Sat, 24 Oct 2026 01:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792830527; cv=none;
        d=google.com; s=arc-20260327;
        b=AT7vn5bF5o6J4d3Ts3CKKy0lBVpaDIdRM8C/5Pn8hG/Dsq1odOpG3rwACGqM7DeHZc
         nHgCbhLE6B+ZjlP5+bP/QmTk+E+DuWBNrm3eYMbJg+epSOYyyrFL3Pr8MDK/ttVAcFk8
         gV4v5h/0xlW2gNwXbPnRq5+9a9KqzstGhnyedUy4ItNdBhZJAlCQewyHA7IdK9lYuTPc
         eJw/hXNZqN/+zLFdTp7yf1WHThbDMe+fyjde4MoYbekMupBao6H4DEBWS/IeAFHUqiIt
         xVkv6d3FyqrWGQXBH2cSJtRn93LYYimAEXNJuwG8WJzEGun13GovKgIsP3sYwdNSivzD
         x+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TV8aougv0HFFxEZHCD307mI1j0UTUQCx1/QXIS2xyiY=;
        fh=L4CWUmCxMvQ3r/pJKzVEx3hLspSDUnABtit3tBSbX4o=;
        b=VaZ/pKEBmItWZaBYmBzsz77EJBhAVnxCFWISHA2Exnfqax64sn/hVMVRhDt26bS1Y/
         Y5xvJyJqHyuQMNFBbm6T2FRZBbQUpWMZs9TruJ/1K8lLzzkv2Ch0EUOYdDbPt7baxOKo
         cMrPKYaIs8tb9Q8xbTsCXI58TyFI26jhC6wX3Z7s8pOE/l3W8z1YphOgPO3zDYEt59ek
         nwCEbeFTrQHPGrrrGSYjGgGPTI2fIq9SnUB7+B25eyWeujBDKeeu13tM9AYvJLrT627T
         TBAI/fkwiug0GMiKl5mxBAYVIVh4GQsx2pZzmF6ZtlW6mYcVFAeDT1zVCMV42yHcSU9z
         QO5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792830527; x=1793435327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TV8aougv0HFFxEZHCD307mI1j0UTUQCx1/QXIS2xyiY=;
        b=pRpSXZU1yQT1y44daKHD3tUj3rHLXFVwuW/CQz8RSUdaCT6N4yQKBiyjJydRsWD0pW
         g28B1qLz2bwONEtegXVtN3jQk8kTIBJnXEvdb61iXJ6GOmdcdJzzfWoGPXJ8Zc3AAkIs
         WFhFWHFXD3GvhhjyB6SZ+UEZsDPVeUQXyFq7orv9RYQ4Ddy4yyleAD4+BKuksm118uF/
         0FReZdmVzFujp+6kBucxhZu4Ep8MI33EAFpewip65G9SfZGmv5piy6+j36vFaM/mAdIu
         19DXBjsISyvcXO6q06teRbNMfwFkw+dnbAyHZsBMvLQnln/PFxgnGeCCEnOQ1fHE+nej
         2bPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830527; x=1793435327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TV8aougv0HFFxEZHCD307mI1j0UTUQCx1/QXIS2xyiY=;
        b=S0jaD9R87mp72vP9ToO/aoYyRm7RLN74yP3e9ylikPjBo7EYuT0jJdfRD5bYOwHMRg
         DxlAjp3bQW+0Jv0hfFOvRw1C1L/EQWfgMzuFwgx+3f1/4y7FuktyPKHyqNIWT3f/TTUy
         Cx2U6QyEOjvX9yOybP4v1Ul1lKiFcpkE2fLaep80qWSh1GQ4Nm+xEwN8V9IjNoqhZk3U
         eklfmexTvsI1fWRVlYcG22P+Cu1LGebct//4qUsaKPEdvhDDoeJnGFy1pSoNkF4TnfBH
         MMcw0EVpekJGyOkOrWE82PmSlh8UKDmKWLMTct3DDJONYw4NrOY1nskI7ejRO+aOTSjN
         LWbw==
X-Forwarded-Encrypted: i=1; AKwUvBw0nXMFYklT5f7FkmwgE/qvwqx0W7e60UcU3c5muLGGP7CgIPfDa7Xx1KW6+7DkpscnCxw+m4Ioqb3PAg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIfMtg0YKA5Nbn9LpNwbt6XMWvsxW9fNTw0FzC9+0NpZIP1OTEA
	nqmTDh39+o9j5TaZexEENPYAdiZC4w32cHEbi5PFoYHqTx/lExxJI06McfRf0ZLVE0fcJkhSomz
	+z0kCxU76/wZRfuu7LyIAB5SNzfc00lA=
X-Gm-Gg: AYBFou3XV3mXqHkQ5xCJfJvvLuTHZpk3Zf8h/fbliWZJfo+wceW9m0qDdR8o2fm33y2
	mEvtN/BpWjLhB1p91l/vCIi3CRqhzeDCI1OUW8baNKfqYcC4KnsO6YASeVyTc2Kf7JV/woH3rND
	kyCyyqgQD0P9fchOfzvjeXNoyKkdbcJcLSV4r4oYAFwTjThET+6JZqC+LtPXUB62TXyefJDbs8A
	Ou3ePwOmRrBgQkmG8wYH3wEmO/5kolMS9TvFYs7fnxubnkYcD2AcCgW+pYybNVCCc8W/KVczozO
	0snsghVMGNE3sD+ZM8i8We6QBL8l+YL5n7aC9foX+dKHRmEZ3fRABI4roAbuFC1/+BDY80sXoAd
	32SH6xMoHsUED/s78RxH6RP0Jb/Lwu03sKgKrZqr9jY+i/VHKUQj9+JzSzN9Y1WVs//ijD1WWaB
	aafVEqvkgSOgHTHxD35KEjJ03CEoGSO2yhoyF24q8Wke4gIypYvOYV15jeEpyGUsZR2yVMTNWPm
	/zXTRfBNfnI1xfYUq0=
X-Received: by 2002:a05:620a:2a03:b0:93e:c12c:9dc6 with SMTP id
 af79cd13be357-940ef9c39f3mr186553985a.70.1792830527402; Sat, 24 Oct 2026
 01:28:47 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017065012.3063980-1-austin.linux@gmail.com> <n59f1S6wQICe5ZxgcNxb3w@nvidia.com>
In-Reply-To: <n59f1S6wQICe5ZxgcNxb3w@nvidia.com>
From: Austin Schuh <austin.linux@gmail.com>
Date: Sat, 24 Oct 2026 01:28:36 -0700
X-Gm-Features: AclHuK_tinEg57N73i4__wGq3AIgvdQZH-j58Q4vGTYODbuD3w6t9rMnKMeodvE
Message-ID: <CABsbf=Gvd8NGG=yafF5La-pW77QOMAXYkoyWU9y4-B8S2_0Ong@mail.gmail.com>
Subject: Re: [PATCH] firmware: tegra: bpmp: populate debugfs in the background
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, anrao@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 1:16=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
> Sashiko reports some hard to trigger but worth checking concurrency
> issues.

I couldn't find Sashiko's report, so I went looking myself and found
two, both fixed in v2:

 - The work could run across a system suspend.  Once suspend_noirq sets
   bpmp->suspended, its requests fail with -EAGAIN, and the error path
   removes the whole mirror.  v2 queues it on system_freezable_wq, so
   suspend waits for it.

 - With more than one BPMP, the populations used to run one after the
   other in their probes, and now run at once.  One failing could remove
   the shared root while the other was creating its directory in it.  v2
   holds bpmp_debugfs_root_lock across the whole population.

If you've got a link to Sashiko's report, that would be wonderful.

> This does seem a good idea, but I am a bit concerned about the change to
> what userspace sees. Ideally we'd be able to have userspace stall if the
> debugfs population was still in progress. If that's not possible, at the
> very least userspace should have a way to voluntarily wait for the full
> debugfs to be available.

debugfs has no way to stall a lookup, so v2 fills the mirror in as
.debug-populating and renames it to debug once it is complete.
Userspace either finds no debug directory or a complete one, and can
wait for it by waiting for debug to appear: polling, or inotify on the
parent, since the rename sends IN_MOVED_TO.  On the Orin Nano the rename
lands about 1.3 seconds after the initramfs starts, and before systemd
starts on the root filesystem.

If you'd rather have something explicit as well, I can add a file in
bpmp/ whose read blocks until population is done and returns its result.

> Just inline the work_struct inside tegra_bpmp. In any case the work
> should be synchronously cancelled if the bpmp driver instance is going
> to go away (not that that will happen, but good practice).

Done in v2: the work_struct is in struct tegra_bpmp, and a devm action
calls cancel_work_sync().

Thanks for the review!

Austin
