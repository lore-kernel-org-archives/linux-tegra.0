Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F4208D7;
	Fri,  5 Jan 2024 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcmqHkZZ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a28bf46ea11so59807766b.1;
        Fri, 05 Jan 2024 00:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704442292; x=1705047092; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDc3X/vTCrv9i8PxCPyqlLpcrg6iDYAL/aeEr+2xMyc=;
        b=WcmqHkZZGkfCtZYRe5WnKJlQNN0i8ae0vjADPUow1Mkzpwed9Z1MHjG+Gyk5pwKbOi
         tEiHjQbeuWh6PfsFj4t0SatNODGIrGXYtMW/DgyF6wq79TyaQygb4qF2H3raCzbcs1WM
         W4uvjtlIORwcd0EKYfaw0Vr8l2cecBY/PjIztjDb7LpzCPeQw6aVqLhWT/lA0pnK7tp8
         2qjZFBxzk6oWm9rtcSAeIQ1vk3lTjNVlcxd9JeAKNmlMZHeyOIyApsRimo2xcprFunF/
         FxCmuonPoEKudcUD1YeJi39Jg5cUHOiYoXpcvwMljr7or63KnWfnmuEanEKM5qKITCHl
         E9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704442292; x=1705047092;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDc3X/vTCrv9i8PxCPyqlLpcrg6iDYAL/aeEr+2xMyc=;
        b=PG81r9zh6RzGPhWx5mJqNv4b2EffiZRQ0UZtR/ZmK+oBs24oKiqL1WeYRFEqy75cZ1
         yWPpiNZzTJfLsUkySQi+CcCVuWKSPBWyUVvRhlrqObPr+xFtya34ceku8ZwV+YmhjPZX
         iufs7b+hw1FrifWkyZ3ET35ovfHsJ4DY6dD+9iH34wa+xFzi6dxo5JJhl8csRaZHRD+E
         JuCkosrnDGDCqUSd+w3sDfVHLRjDodsWyF/f3OqNtcvz/7I68EX9b2a9ubypyB4MhG53
         /rvk0AVxQSbAXVShAmxvJIiDBiF/C/0Np+wE27v37kMOnl0yD23JcSjdwRh+DbO6gKy3
         x5Pw==
X-Gm-Message-State: AOJu0Yyw3grXiWJvBbtfjNhG43q5Bfqpv1JThM2Yro/XPR5ewNhhqOZM
	GvdiVA5cn5hrMEjQo8ruwUI=
X-Google-Smtp-Source: AGHT+IEtSoG6+TQ5lp2vD5o78oLq7FNxPf6otoqjX5IdT3AGC6plY2CLaP4BqbV0ImHtO+r+DFIGtA==
X-Received: by 2002:a17:906:34d7:b0:a23:671c:2284 with SMTP id h23-20020a17090634d700b00a23671c2284mr1666245ejb.29.1704442291971;
        Fri, 05 Jan 2024 00:11:31 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r17-20020a170906551100b00a2356a7eafasm420985ejp.199.2024.01.05.00.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 00:11:30 -0800 (PST)
Date: Fri, 5 Jan 2024 09:11:29 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	devicetree@vger.kernel.org, robh+dt@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
Message-ID: <ZZe5sTNz005Tt4jk@orome.fritz.box>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
 <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
 <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eGTPasXYebqI3XK+"
Content-Disposition: inline
In-Reply-To: <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
User-Agent: Mutt/2.2.12 (2023-09-09)


--eGTPasXYebqI3XK+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 10:24:18AM +0530, Sameer Pujar wrote:
>=20
>=20
> On 04-01-2024 22:52, Mark Brown wrote:
> > On Thu, Jan 04, 2024 at 06:07:22PM +0100, Thierry Reding wrote:
> > > On Tue, Dec 26, 2023 at 09:58:02PM +0530, Sameer Pujar wrote:
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /-----> codec1 endpoint
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /
> > > > CPU endpoint \
> > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \-----> codec2 endpoint
> > > Can you describe the use-case? Is there a need to switch between code=
c1
> > > and codec2 endpoints or do they receive the same data in parallel all
> > > the time?
> > > Could this perhaps be described by adding multiple CPU ports with one
> > > endpoint each?
> > Don't know about the specific use case that Sameer is looking at but to
> > me this looks like a surround sound setup where multiple stereo (or
> > mono) DACs are wired in parallel, either with a TDM setup or with
> > multiple data lines.  There's multiple CODECs all taking input from a
> > single host controller.
>=20
> Yes, it is a TDM use case where the same clock and data line is shared wi=
th
> multiple CODECs. Each CODEC is expected to pickup data based on the allot=
ted
> TDM slot.
>=20
> It is possible to create multiple CPU dummy endpoints and use these in DT
> binding for each CODEC. I am not sure if this is the best way right now.
> There are few things to note here with dummy endpoints. First, it leads to
> bit of duplication of endpoint DAIs and DAI links for these. Please note
> that host controller pins are actually shared with external CODECs. So
> shouldn't DT provide a way to represent this connection? Second, ASoC
> provides a way to represent multiple CODECs on a single DAI link in the
> driver and my concern is to understand if present binding can be extended=
 to
> represent this scenario. Third, one of the user wanted to connect 6 CODECs
> and that is the maximum request I have seen so far. I can expose addition=
al
> dummy CPU DAIs keeping this maximum request in mind, but not sure if users
> would like to extend it further. The concern I have is, how can we make t=
his
> easily extendible and simpler to use?
>=20
> With custom DT bindings it may be simpler to resolve this, but Tegra audio
> presently relies on standard graph remote-endpoints binding. So I guess
> diverging from this may not be preferable?

This seems like a legitimate use-case for the graph bindings, but
perhaps one that nobody has run into yet. It might be worth looking into
extending the bindings to account for this.

I think there are two pieces for this. On one hand we have the DTC that
complains, which I think is what you were seeing. It's a bit tricky to
update because it checks for bidirectionality of the endpoints, which is
trivial to do with 1:1 but more complicated with 1:N relationships. I've
done some prototyping but not sure if my test DT is exactly what you
need. Can you send a snippet of what your DT looks like to test the DTC
changes against?

The other part is the DT schema which currently restricts the
remote-endpoint property to be a single phandle. We would want
phandle-array in this case with an updated description. Something like
this:

--- >8 ---
diff --git a/dtschema/schemas/graph.yaml b/dtschema/schemas/graph.yaml
index bca450514640..1459b88b9b77 100644
--- a/dtschema/schemas/graph.yaml
+++ b/dtschema/schemas/graph.yaml
@@ -42,8 +42,9 @@ $defs:
=20
       remote-endpoint:
         description: |
-          phandle to an 'endpoint' subnode of a remote device node.
-        $ref: /schemas/types.yaml#/definitions/phandle
+          A list of phandles to 'endpoint' subnodes of one or more remote
+          device node.
+        $ref: /schemas/types.yaml#/definitions/phandle-array
=20
   port-base:
     type: object
--- >8 ---

Thierry

--eGTPasXYebqI3XK+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmWXua4ACgkQ3SOs138+
s6Fx3Q//e7NFejG5s5nQFCW5feme6nEY++g6ZhvBaKWOn/i6PaC3cMLq+WB4tOXQ
l3x8Spxx/zbbfqMsd9ZbNWp2ayrPjpM3x0NOgdVEDkaX/mQOWskZbjI94rTOqV2O
qeUoeHivqjmidvel+cjFYMpmCRNGQDv3NQUvHdREbRB9OQu63RyIAiVousP1Y35y
meXii3XRc0dmp5o4fpb7eQcI0wYAQmJpNhGYSUepqSz5sKvHiBEJszz5Wy5u7ncu
uM5zdNlTRJGaWH20Tx1YfI5kI6XDvoVRGv9AfRTpZ6vLJplAWB0X1yOWzHNH/F/E
STMru2d/eq1MHss1aHk7w9l/vR0I6xbyaCjZv2N4xFjxxePMTybzAePDcYNDBFVq
7DSjCN4q0q715jBiSiFBsXTGJs2D8Ni8PstNdHBcM7QNP1gf22erSiqtvNADTo1v
wPd5iv0iRiCsiQcI5lJTAH+Ac5hte8Y+O9onaFtdIy8inhZP/5mpyZdrlIHotQef
oDQ9zXuSYCYqLNytrId+3QzvbaiV4A2v3l+WLMVDhym2fZ4zVnh3Lct7oG3GYfrG
VvSxeBX8+0C9ktrYWLYxoNf9KxuJ4pMxLtur79GXF/LxTAzkY0V2znfk0eWyBNtO
66Hx+c26rIiJOC7+lIAVn39TFH+iGAfH6e64ydz6thKdToeDhto=
=b9dE
-----END PGP SIGNATURE-----

--eGTPasXYebqI3XK+--
