Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C940271469
	for <linux-tegra@vger.kernel.org>; Fri, 23 Jan 2026 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194430; cv=pass; b=BActj5mDkLNtOd4JJW2JiaLgj5v6zMel8Bktb3S3rA3PBoK2YBc5vbaNnGSgGwlvyl4A3fIkCY8oQoAIpraQFN8hoUuTGzr0aIpMx2VIY+W7nkShqa4U8MLybCZ8tGKQ+ZqDlioNYrqXUbBONB3DyfQ73rPxU2zxRqalTkn/LH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194430; c=relaxed/simple;
	bh=y/it5pxGZqtD/TjHQ/Gj5QPeFIwtwWiMoLramQkGvM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pp0v66LkpE7RsjH7pilwZRZSvOsGyKkasKLsQ64JZf9xtkzYdf8LOAjQSuv8jD5th97pFxtPwHinedL2V8eZHdd8IheZnQzvdLw9V4PYXPahJvtLo/kMuUd4QauWjSp8gE447EaUQQbeOQVB8cEZHydfXnb5RVAWNlOISOPB9V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXjnScgw; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXjnScgw"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d148db5fdcso923549a34.3
        for <linux-tegra@vger.kernel.org>; Fri, 23 Jan 2026 10:53:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769194424; cv=none;
        d=google.com; s=arc-20240605;
        b=Pamj4b7egIdB9MODHaukpz2akj7IEyFIpbV7qcOBnZ2dDKs3A7H8iDyi+HGRU0Ji74
         ivU5UOFWLlV3U+AMX2sIo4LxQQfXAmyySW2d31KnALiOa+BJFWJCWYJKPsiYgMNB+fz8
         7NsOGEflB17hMGPA+UlcCIbBmJzRlwJ5JNRdPweyKlHmUc1tOrBLr0KDVinpShuICJdQ
         /ungcWwCKz/VL9TUSjo8LU3v9RPYp6XyhAr1hjxWiItJ8qYcns03dg/73wk/2GQUdGSs
         huw7eEjiq0dXTL7Ov2NMMKbO+0Gsnk83mInLn5RkuABVm0HSeabLx/h250Q5acjWNsxk
         F+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DmQ5z+LqVBahBxCcKUYVTp8FQq+wGxuiJbxV034+vUo=;
        fh=xRBlVUM0CcVHXnM1zHoNcQEFSmncB9BJQj+9bcXXp+k=;
        b=KjLSqGTmFueoxA4IDDzXZA8LFbbenN88qTBe5qfZ6kcrwskviWOtA9OVzsSf+QZaWH
         MYijLFYy+tM7mUUtv7pctqttL+n3krFCbccjdBSa1vUeUE2I/hDqbWOOZu4oI8lAHzNs
         /mGSKJsHqcZPk//mcWxI5vi/sqPg+CkPvsNzQI4aJNpcftf0/AYUfvp4FTtUkqYVxM00
         EwdfSV3nBfcdMVYea9jX3W5xMd74bwAHfjQ5ZneDEKPMvDbLOp0kw3eCLSJLTh5EFk33
         1/wI7pkH/uogBV2V52pxfeRC9nr69wEye0e3B3/USd5HXctyLvsHTdUPbyqTcSCY6JrU
         JRtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769194424; x=1769799224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmQ5z+LqVBahBxCcKUYVTp8FQq+wGxuiJbxV034+vUo=;
        b=NXjnScgw9kKFksvH6u5dRW84xsLf0BgdCDFUG273a0bq7xIyZgzo+tSpbkzHLqC/Uj
         pJhJHb0rEN7jA2svlqnvq+dKlCf9w/ARcshjROKc+ev9WNAZRKZDdTCQX4oropL6Q8hP
         uoROczr/Lhf2eLZlI2HJEZ5JTHvOeHKxgTB7VsDnM4kNdFsfcWKWZngyBeKlKE/e3+sC
         a/MPxQxfTQxzgFQk9GMSvuu1hGdpkimIkEOnl1QQ71C9bJObeEQ48cvG7z0+j3I/RMio
         OuIJaKn7ry3jQPoMKxrViVU15TZnPzZg4aCwz/rKbZWRv3IOSn40IlVndhv/UDAndpso
         wvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769194424; x=1769799224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmQ5z+LqVBahBxCcKUYVTp8FQq+wGxuiJbxV034+vUo=;
        b=TNYLn+HURR4i+hDpE2MeNrYozmKcZ8YuCiYzOj0fzXg/HE3+wyOCINqvoP0rT3bawc
         OScYBlPw2/gkXniLQVXrjHOgmP4XecpZhWZmpm33Imbse+Behz+3Ryg/Be6F8VXlonc3
         ZBxJisF7PEVy+r6/QhQv8n7BBT6eCQ0wvSbbjDN8NupZFIoY1zsGkkjJSnMK19Rd9cVK
         /eHiRZKx+RMnI0pixy0ter1qXYcU2O5xLSUJG/UTq3ac/8H0HjvAOxPyoyLUeh6E6ZBh
         Y4rl7x/gKlNn0y4fIfJzwiBRJDoroRfyTRK1meQiQtHqnQKU3ucQoEQo1sZ3AjeBjjq9
         x2bA==
X-Forwarded-Encrypted: i=1; AJvYcCVIB23dpt4rRaWvId42qaBk1Kf1PEb+zUg1RlR9oSSgQTFsoqUiH8J8ggB1Bw0H2S7B6XH3qDvoTIOXZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5Nbb+ZPN66sH2/9lus0J9BN8rVkuV//LN2pZWi6hS5PY3UVw
	I1NRrvGvrL4c6xRCcj3CXc0ReaNh1Rr3knOcc5be5DgoBsnw6W+zw7Bgp4ySoPjVVnUsoSisZwt
	5DPJza7VlBtkuNtNqepXbVUx0LUYXF6M=
X-Gm-Gg: AZuq6aJ26mCm6yfs9G98BTaT6eU+Ug2bqgGM2FHbvkJRg4cj7kotkrga14HzLg3JWZw
	9CIn9Ho6Rj9gJjNuJ9MM6tQCbp0bZihha5qMjnxJVgxKMxxwS7ISOdB67S6DD1cuO6Ibs7hzMgu
	rdMlWS5WVPZF9mrdPJivWQT+hjTxsTfkogTn915nVjYLZ6JboOId2J9XF5efUdf4Aflyhku+Pej
	VKvEKn0erSAnSdlKj0U7u5n3IePzxrLLlPcbCAGroEiSRVYTIn2IuYSd0hySWH1B2+M2Kdrw4N2
	ALgG/8b0Hz+g3rK0rMueYorDk2DFmqDxWbt6iVTAl4ogrVNdE8g4t7eUlocfbg==
X-Received: by 2002:a05:6830:6110:b0:7cf:dc6d:fc99 with SMTP id
 46e09a7af769-7d15a37b64dmr2047592a34.0.1769194424381; Fri, 23 Jan 2026
 10:53:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk> <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com>
 <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com> <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
 <DFULF717AOGG.GY8B9ET26KND@kernel.org> <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com>
 <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com>
 <DFVBKRQ35CC0.95P329BK5KZA@kernel.org> <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com>
 <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org> <2b7109c2-2275-4a38-a52f-f4f901a6d182@nvidia.com>
 <DFW11G0SNME0.3G28YPXH64DOT@kernel.org> <b3b0635c-657f-4869-bc88-06de9287a464@nvidia.com>
 <DFW4JJYIDC2O.3L1XXBT5MY9SI@kernel.org>
In-Reply-To: <DFW4JJYIDC2O.3L1XXBT5MY9SI@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Sat, 24 Jan 2026 02:53:32 +0800
X-Gm-Features: AZwV_QjBOhoZAKoJOtRtU7oPTfduI8RNTUjfwZgDbBpzn9YUGrsVEksWNMmzMO4
Message-ID: <CALbr=LZ4v7N=tO1vgOsyj9AS+XuNbn6kG-QcF+PacdMjSo0iyw@mail.gmail.com>
Subject: Re: [PATCH v5] driver core: enforce device_lock for driver_match_device()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mark Brown <broonie@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, 
	Qiu-ji Chen <chenqiuji666@gmail.com>, Aishwarya.TCV@arm.com, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 12:54=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Fri Jan 23, 2026 at 3:29 PM CET, Jon Hunter wrote:
> > I can fix this by either:
> >
> > 1. Reverting this patch.
> > 2. Disabling the QSPI driver.
> >
> > Now the QSPI driver has issues which need to be fixed which I am
> > wondering once fix will avoid this problem.
> >
> > However, I guess regardless of the QSPI issue, should this patch be
> > having such an impact?
>
> So, this patch by itself is correct, but it reveals when drivers do the w=
rong
> thing, that is register drivers from contexts where it neither makes sens=
e nor
> it is supported by the driver core.
>
> The deadlock happens when a driver (A) registers another driver (B) from =
a
> context where the device lock of the device bound to (A) is held, e.g. fr=
om bus
> callbacks, such as probe(). See also [1].
>
> While never valid, the deadlock does only occur when (A) and (B) are on t=
he same
> bus, e.g. when a platform driver registers another platform driver in its
> probe() callback.
>
> However, it is a bit more tricky than that: Let's say a platform driver
> registers an SPI controller, then spi_register_controller() might scan th=
e SPI
> bus and register SPI devices (not drivers), which are then probed as well=
. So
> far this is all fine, but if now in one of the SPI drivers probe() callba=
cks a
> platform driver is registered, you have a deadlock condition as well.
>
> So it seems that something of this kind is going on with
> drivers/spi/spi-tegra210-quad.c.
>
> I did already run quite thorough analysis throughout the whole kernel tre=
e with
> various static analyzers and also played around with LLMs for finding thi=
s
> pattern.
>
> The tools gave me two results:
>
>   (1) The IOMMU one I already fixed [2].
>   (2) The GPIO driver I posted a patch for in [3].
>
> I specifically also looked for all drivers that are required to run all t=
he
> peripherals in the tegra194-p3509-0000+p3668-0000.dts hierarchy, but coul=
dn't
> catch anything.
>
> (This is also why I asked about OOT, because there are quite some compati=
ble
> strings that are not supported by any upstream driver.)
>
> I think to really see what's going in with spi-tegra210-quad.c, we need t=
he
> dumps of the sysrq-triggers I provided in a previous mail.

It seems the issue is simpler than a recursive registration deadlock.
Looking at the logs, tegra_qspi_probe triggers a NULL pointer
dereference (Oops) while holding the device_lock. The mutex likely
remains marked as held/orphaned, blocking subsequent driver bindings
on the same bus.

This likely explains why lockdep was silent. Since this is not a lock
dependency cycle or a recursive locking violation, but rather a lock
remaining held by a terminated task, lockdep would not flag it as a
deadlock pattern.

This is indeed a side effect of enforcing the lock here=E2=80=94it amplifie=
s
the impact of a crash. However, an Oops while holding the device_lock
is generally catastrophic regardless.

Following up on our previous discussion [1], refactoring
driver_override would resolve this. We could move driver_override to
struct device and protect it with a dedicated lock (e.g.,
driver_override_lock). We would then replace driver_set_override with
dev_set_driver_override and add dev_access_driver_override with
internal lock assertions. This allows us to remove device_lock from
the 2 match paths, reducing contention and preventing a single crash
from stalling the whole bus.

However, this deviates from the current paradigm where device_lock
protects sysfs attributes (like waiting_for_supplier and
power/control). If other sysfs attributes are found to share similar
constraints or would benefit from finer-grained locking (which
requires further investigation), we might have a stronger argument for
introducing a more generic sysfs_lock to handle this class of
attributes. We would also need to carefully verify safety during
device removal.

Danilo, what are your thoughts on this refactoring plan? I am willing
to attempt it, but since it touches the driver core, documentation,
and 10+ bus drivers, and I haven't submitted such a large series
before, it may take me a few weeks to get an initial version out, and
additional time to iterate based on review feedback until it is ready
for merging. If you prefer to handle it yourself to expedite things,
please let me know so we don't duplicate efforts.

[1] https://lore.kernel.org/all/DFNI14L1K1I0.3FZ84OAWXY0LP@kernel.org/

Thanks.
