Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7CE2F83C1
	for <linux-tegra@vger.kernel.org>; Fri, 10 Oct 2025 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760108588; cv=none; b=XrLpi5MOJr4k31M9FTZ2rGFBQUSgUssTobQrbERGvKwLbM3VDgmCN8ad/VAzK2Tig425Y0Tlh8SB35itzG7nRvj6NHfUSpxfa0IKdJjTb6LhdQJNGmN4lb48gmhPKIvyplgdKN9MvPULtqY+/3mEDGEpQnrK9ICwSkZXXy+vo4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760108588; c=relaxed/simple;
	bh=QBfPEo2CsliQpFc48ARAArAhMAqF0amYhuUFGjijoyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKoze482B/S6wUKEDLtNmow0zbbVj7n1stbacHbNQ4otEy1CqceBcgLUxKZ6DG8MeS26btrTdmBWGH4vVqxe2OMFV2Rcvl5YPmSmMyZFZQxGtbARJxnbIyJau756jOL+KTnTLhKBk3tWlp1Z8sbS2xmvQBvqk65rIaDaX8dVpBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcgzY/nC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcgzY/nC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so1874319f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Oct 2025 08:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760108585; x=1760713385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzqW0UIxkLVwrnz5nO9iomry07WZvBjE99qijc6UKPY=;
        b=ZcgzY/nCZWLW9bRfwsHs388BIJdRHNw3nv8SjxwEXz1JqDMgC02cznakothLdY5TO5
         6wY4BqScstgp6cY8iBhVGGEjELp5+qtwoiMtWpKfmsl8nYsnT/nfqLZsqLz/IVXAsBVf
         A2N1QXzk8QsAbb5sJmzlGGDifVil06+7khZfN/88+/XUTNqJQ44I72Nsi4iOmnIuG5xa
         ZNM+awgxeRKIO7EPG1E5qngCziO5Ki9M8+ICrgNLoOpMMOttVKuyavSn+EdMDb43pBOj
         2jjT3lXkNlKu/coULOu5xKda7xK4Rj8mMdspQBFI/w0wvEEjI0DwzOy7fkH753mAYRyY
         b7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108585; x=1760713385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzqW0UIxkLVwrnz5nO9iomry07WZvBjE99qijc6UKPY=;
        b=fzue2D3YVpPH1FWfU8+SxinLIzjzlMRr5Q7cBpcYwj9Gm/0MSml9if6K5hQ0Tii8j8
         QnB9CzErHicLsBtMkFr4t2NlDXI8eWZVKGWC405T1S9LJLfBUkBMCq8MJNLPZQRitqYK
         WypKUDt1Ibx5V+PoWK7iq21thWWzK+0IcGiQ+FAlwy+sNbvvXjN3mcx3ivEYq7SQ/5/l
         zNTktgdbLuopj346ApvwTBilBU6Ticom5TOt3734TShba+OhvHkidPMCEipgFzQdWs/i
         WnFWXnkhsNNckcy7q3LMiMc1S3xs51A+XwZJMM4dv8wB9z3LbGRaEPiZcC9PGDQ/KIt9
         p9VA==
X-Forwarded-Encrypted: i=1; AJvYcCXDZjKLxuE8X/OwpTQNMNH8mBJivPT9gJk7XOELX5GgznbEr/WXTgzbZQLtY0qLfVU+fj8k75Rp64SyYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw514/O2hcxjZn5FVV9pF+dp07gR6hsRbwT+K16KSa5hiAV5rcR
	HmHQq0i0nT0AXwwx+3sxDT2UeQnL84Gvj31lILUkj4ginCxF/zxHd42w
X-Gm-Gg: ASbGncuKiJqgs0swMLeALCYbkHvBxoFpD84Z1gcuNOKtDd9l28oaU4FVTGuCZWl81dH
	u2VG841AOly1OR0L/2ONOpbiSpEghQKxdZxrHFGRuaTKey6qS2ZEtJi7RWqw2uDhS4Q1fYNcoWL
	O6X19raxo3G4idrWaIqJRFmQ91xVAk8GJPBN3Hm41fq5l/4NeR5d6Csj7YU3+FaUSYz6LkYtX6F
	PBseWUCaWondf8ykU/N0fCdal9mTLWRBR3cLxwXFep+jt9gmetTquQAl/fKzagPeXVnRpNIBfzc
	zTC9WQmzUCQTMpQeVQq/oINwAZlTPJmyxYY0dL09fQZFzBmadLcb2QeameqPbwRqe3XfGbrGSi/
	YxQFmh1zIqXJNn1ZS1w9C+rjGuy9XowKtmBP0CYMi/OBiM47u8Pq73b0tbPGcvBM/RePXtTBtjR
	2tuugT8nKXDDhslmkLtBr+WjEjhlh2
X-Google-Smtp-Source: AGHT+IEvrfkr4Hs8ezky5ByztyOWOZT//8TlXER1hkPoQxMLvS/Q90qX4bw9OAGlwL9NvM581MF52g==
X-Received: by 2002:a05:6000:186c:b0:3ec:c50c:715b with SMTP id ffacd0b85a97d-4266726d746mr7684721f8f.19.1760108584000;
        Fri, 10 Oct 2025 08:03:04 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57ccb1sm4665031f8f.8.2025.10.10.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:03:03 -0700 (PDT)
Date: Fri, 10 Oct 2025 17:03:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
Message-ID: <graeplkpsgbolpnnq2pndpdb7fymyy7zvm37osbdtre347tns2@mjbgzwterefv>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
 <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
 <86o6qgxayt.wl-maz@kernel.org>
 <86ms60x7w7.wl-maz@kernel.org>
 <us2hfdn7jpfepdmwk2p62w64p7xagaeoemg3hdt2vm54emtwlv@m6fkuti7hvfa>
 <86bjmeyh5m.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3cjwywdpcegtiyhc"
Content-Disposition: inline
In-Reply-To: <86bjmeyh5m.wl-maz@kernel.org>


--3cjwywdpcegtiyhc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: IRQ thread timeouts and affinity
MIME-Version: 1.0

On Fri, Oct 10, 2025 at 03:18:13PM +0100, Marc Zyngier wrote:
> On Fri, 10 Oct 2025 14:50:57 +0100,
> Thierry Reding <thierry.reding@gmail.com> wrote:
> >=20
> > On Thu, Oct 09, 2025 at 07:11:20PM +0100, Marc Zyngier wrote:
> > > On Thu, 09 Oct 2025 18:04:58 +0100,
> > > Marc Zyngier <maz@kernel.org> wrote:
> > > >=20
> > > > On Thu, 09 Oct 2025 17:05:15 +0100,
> > > > Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > >=20
> > > > > [1  <text/plain; us-ascii (quoted-printable)>]
> > > > > On Thu, Oct 09, 2025 at 03:30:56PM +0100, Marc Zyngier wrote:
> > > > > > Hi Thierry,
> > > > > >=20
> > > > > > On Thu, 09 Oct 2025 12:38:55 +0100,
> > > > > > Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > > > >=20
> > > > > > > Which brings me to the actual question: what is the right way=
 to solve
> > > > > > > this? I had, maybe naively, assumed that the default CPU affi=
nity, which
> > > > > > > includes all available CPUs, would be sufficient to have inte=
rrupts
> > > > > > > balanced across all of those CPUs, but that doesn't appear to=
 be the
> > > > > > > case. At least not with the GIC (v3) driver which selects one=
 CPU (CPU 0
> > > > > > > in this particular case) from the affinity mask to set the "e=
ffective
> > > > > > > affinity", which then dictates where IRQs are handled and whe=
re the
> > > > > > > corresponding IRQ thread function is run.
> > > > > >=20
> > > > > > There's a (GIC-specific) answer to that, and that's the "1 of N"
> > > > > > distribution model. The problem is that it is a massive headach=
e (it
> > > > > > completely breaks with per-CPU context).
> > > > >=20
> > > > > Heh, that started out as a very promising first paragraph but tur=
ned
> > > > > ugly very quickly... =3D)
> > > > >=20
> > > > > > We could try and hack this in somehow, but defining a reasonabl=
e API
> > > > > > is complicated. The set of CPUs receiving 1:N interrupts is a *=
global*
> > > > > > set, which means you cannot have one interrupt targeting CPUs 0=
-1, and
> > > > > > another targeting CPUs 2-3. You can only have a single set for =
all 1:N
> > > > > > interrupts. How would you define such a set in a platform agnos=
tic
> > > > > > manner so that a random driver could use this? I definitely don=
't want
> > > > > > to have a GIC-specific API.
> > > > >=20
> > > > > I see. I've been thinking that maybe the only way to solve this i=
s using
> > > > > some sort of policy. A very simple policy might be: use CPU 0 as =
the
> > > > > "default" interrupt (much like it is now) because like you said t=
here
> > > > > might be assumptions built-in that break when the interrupt is sc=
heduled
> > > > > elsewhere. But then let individual drivers opt into the 1:N set, =
which
> > > > > would perhaps span all available CPUs but the first one. From an =
API PoV
> > > > > this would just be a flag that's passed to request_irq() (or one =
of its
> > > > > derivatives).
> > > >=20
> > > > The $10k question is how do you pick the victim CPUs? I can't see h=
ow
> > > > to do it in a reasonable way unless we decide that interrupts that
> > > > have an affinity matching cpu_possible_mask are 1:N. And then we're
> > > > left with wondering what to do about CPU hotplug.
> > >=20
> > > For fun and giggles, here's the result of a 5 minute hack. It enables
> > > 1:N distribution on SPIs that have an "all cpus" affinity. It works on
> > > one machine, doesn't on another -- no idea why yet. YMMV.
> > >=20
> > > This is of course conditioned on your favourite HW supporting the 1:N
> > > feature, and it is likely that things will catch fire quickly. It will
> > > probably make your overall interrupt latency *worse*, but maybe less
> > > variable. Let me know.
> >=20
> > You might be onto something here. Mind you, I've only done very limited
> > testing, but the system does boot and the QSPI related timeouts are gone
> > completely.
>=20
> Hey, progress.
>=20
> > Here's some snippets from the boot log that might be interesting:
> >=20
> > [    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
> > [    0.000000] GIC: enabling workaround for GICv3: NVIDIA erratum T241-=
FABRIC-4
> > [    0.000000] GIC: enabling workaround for GICv3: ARM64 erratum 2941627
> > [    0.000000] GICv3: 960 SPIs implemented
> > [    0.000000] GICv3: 320 Extended SPIs implemented
> > [    0.000000] Root IRQ handler: gic_handle_irq
> > [    0.000000] GICv3: GICv3 features: 16 PPIs, 1:N
> > [    0.000000] GICv3: CPU0: found redistributor 20000 region 0:0x000000=
0022100000
> > [...]
> > [    0.000000] GICv3: using LPI property table @0x0000000101500000
> > [    0.000000] GICv3: CPU0: using allocated LPI pending table @0x000000=
0101540000
> > [...]
> >=20
> > There's a bunch of ITS info that I dropped, as well as the same
> > redistributor and LPI property table block for each of the 288 CPUs.
> >=20
> > /proc/interrupts is much too big to paste here, but it looks like the
> > QSPI interrupts now end up evenly distributed across the first 72 CPUs
> > in this system. Not sure why 72, but possibly because this is a 4 NUMA
> > node system with 72 CPUs each, so the CPU mask might've been restricted
> > to just the first node.
>=20
> It could well be that your firmware sets GICR_CTLR.DPG1NS on the 3
> other nodes, and the patch I gave you doesn't try to change that.
> Check with [1], which does the right thing on that front (it fixed a
> similar problem on my slightly more modest 12 CPU machine).
>=20
> > On the face of it this looks quite promising. Where do we go from here?
>=20
> For a start, you really should consider sending me one of these
> machines. I have plans for it ;-)

I'm quite happy with someone else hosting this device, I don't think the
electrical installation at home could handle it.

It has proven to be quite well suited for kernel builds...

> > Any areas that we need to test more exhaustively to see if this breaks?
>=20
> CPU hotplug is the main area of concern, and I'm pretty sure it breaks
> this distribution mechanism (or the other way around). Another thing
> is that if firmware isn't aware that 1:N interrupts can (or should)
> wake-up a CPU from sleep, bad things will happen. Given that nobody
> uses 1:N, you can bet that any bit of privileged SW (TF-A,
> hypervisors) is likely to be buggy (I've already spotted bugs in KVM
> around this).

Okay, I can find out if CPU hotplug is a common use-case on these
devices, or if we can run some tests with that.

> The other concern is the shape of the API we would expose to drivers,
> because I'm not sure we want this sort of "scatter-gun" approach for
> all SPIs, and I don't know how that translates to other architectures.
>=20
> Thomas should probably weight in here.

Yes, it would be interesting to understand how we can make use of this
in a more generic way.

Thierry

--3cjwywdpcegtiyhc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjpICUACgkQ3SOs138+
s6FDJw//Z8EjXFjdge1TNXnkHtxQK8LSe6eRlQEihBDapQ4FQ6BAOb8NAFUtFIXY
vxrW11tX8O5PayMJWl/D2Z6cetmE3/rMkCydpfDrtujbI4ZvtxypIP4c7bLqqtSp
DA5fCfzGW2CrAAZLKCt7kQUmFweJcMb/gn1uKOZfTmbveK59bO/08gTBb5FTvkfJ
Lptc7t0iuHsvAZThG6IdNKPlFjQRo7Y3fYrDOQODyr7k3vbnriVPb7d4VqfXShnv
ZpUXwLwieLxR5DtMTYucJ1rzlByUCRFRRKW/XFpi/AiZrgjRV5yX1URDq/eOSYRm
mJmfO2e15SwgsiQR0BDj2e0esxwTM1p4lsPvkS/tag7v9HchNXLVbaGWu1J1//Lb
9tIOnwA+YwEeu6b964cxcKWJ8Zal3H/wUTVzxOuyMmYFCl98AetlW22P/41IQIci
+1FkFb8NckVhkK7+WF+WuvXbJVpiDZuYhTK0gebLg8OjwF0iSCbDUht1mp88wIkF
M8hme8FQWI40P+9cTQZWiWHsrsWYVUY2f3jN5bJEroXH3yB/HYPhg338WXDUK2IE
wGLb63qfKxEEita5KJ0anMKIG0v9ka+FFRB4FNgeAi7oV78APjcRXGVcHN5LK5Jh
rIjE0ozAEbuF5FFfqaaTaAK/V3gYh/A1x8WylRwbHusveJzX8Aw=
=Pxmi
-----END PGP SIGNATURE-----

--3cjwywdpcegtiyhc--
