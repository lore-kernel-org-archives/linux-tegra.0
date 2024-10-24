Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF991F8EE5;
	Thu, 24 Oct 2024 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789670; cv=none; b=l9LAx8GGlxVg5DT3sWjtE7U6PLZPJjb6G0OHpyCd4R7uRvjavW+FpZM13JEDrU99LZukB7bKLzy/t+71SB2gZiK4ObnFN/5xLMGCGHPlKF4jaXqhsIOr6ELfL46fUZph3qckGpj2JPIj3jPeOBWOXYesP4grBmMFKPdH/xsKvo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789670; c=relaxed/simple;
	bh=mT8lga8w87tH0cn5TNcH2+5wImIavDSZt6lPgj78mEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZPEHdo4TnGb9OWWMKFQZpfJJPUAtWPaSbtq1Dif/Eb+2d5YXxRGiqaufmLD9QuKWqDJcAETcUmO7YDuFs9qK9iY4y+/HXRuTCByBWVZvTtz70oYZewvlH/+32rrwqwz6PqZ58Z7DRL7LTO7HXG4pHT2xnvP8A4vaZxgfWxL1Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UccMNSnd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UccMNSnd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so748413f8f.3;
        Thu, 24 Oct 2024 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729789665; x=1730394465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ImCIdrzzs/eADSKAsXDbIsPZmnu5kyGsJA88l99wNsM=;
        b=UccMNSndpoV3fG5wiAJTBzb8SSN4v+izseqR6d3qBWBLgrunsPlbHZLC341te6f/aJ
         ZOoqxeokSqb//pvHHuCenC5iwXvuaH8uTKkP9H5y4FbLk8A+CInrrdL9T6nLTZ7oy8zb
         HIcSJQ7gG7I5Wqv8h/GPK0NdKzlRkq+a5r95BXmby4yV6MCx1wel1kJiraKoCsJe5HsW
         JaKE8sW9eqbWHar795qpnxdofNHRDHgN86iCPaMdBhgF3zMf7L1AdoQ3+XQpSPh+SkEy
         cXsWspK9AwUmdnVIH8JAvjXtRnKfC/ilC0DAx/+XKNYlO4afhRWT0kh0L6JQeU0aFjLo
         CLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729789665; x=1730394465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImCIdrzzs/eADSKAsXDbIsPZmnu5kyGsJA88l99wNsM=;
        b=Du+4Udox5v8yv1+f7ksknA9NCwQAx//SyZ10RhU/BqAYM4SXuozRWhgD/+joS2RG0K
         J950Dc2LlAWnqGHsq83jZF6JEodG4Z1lW+8IP8KAanmEyWOHkBVbcHfJ+daNFq9zdPYj
         S5TPUtG0bgSmPBIcyP6Zz/naQ5QoumDg2ZeD4P72sljFHNxQhHDLgaT8XAsyR+RFJMdh
         wlosrt8ytRTTBGYw66ixKqMlOCPq5PRTPk95HxH/EFkswoFF0RciY2Ne4cROs9Mh8WBA
         YsvByJgduebgt6O0zpLzvyrTN4rU6tBe4k0rtLCxOF59rBDPMrHgpM08BzBuW3vAoFYy
         JJrA==
X-Forwarded-Encrypted: i=1; AJvYcCUgNPTGYHRN/VVwKY2zRy0NiuWd2aWxyKi2Ooi2dZY+PS/PFxQIHOpPYR739Tz5WHYd9dsphYod3kYNxoI=@vger.kernel.org, AJvYcCWtr7JAQHYoVHIJxuVLPCfMYGz5ZqvcGvhGHFfgMMyvrzZOahIaPA5abQTi7lDPkkc4pT1AXN1tTvrP76Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrS6ClZyBBvFGHBBMV6LKqcwsUO5SZplyzlX8lKqwtOPaIYRsx
	mVFiYvXc+AH6hQOFYsQ1FJHNTXZnDLJ54Yugbt1zrxnKitJVzQ4R
X-Google-Smtp-Source: AGHT+IGQLUOPdEyRcC0eRBAzuGgdv3NN9a46lNMDXgnrqf1ykZ+YNHaA5ZYbDbzhcr3E7NSKZdQjGA==
X-Received: by 2002:adf:e386:0:b0:37d:4ab2:9cdc with SMTP id ffacd0b85a97d-3803ac957f8mr2129872f8f.13.1729789665424;
        Thu, 24 Oct 2024 10:07:45 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37935sm11781810f8f.17.2024.10.24.10.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:07:44 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:07:43 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
Message-ID: <4cevcdwbghn7nisyoetcgrentfu7zvxpzu4kl67exushjexbrv@6ialgl77ivlb>
References: <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
 <2024091627-online-favored-7a9f@gregkh>
 <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
 <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
 <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com>
 <d9aadede-dfac-410a-b65b-e295c9a64951@notapiano>
 <CAGETcx-_z4hxyNSwT-D1MKNzAjOGSX+o7x5G8J0KkiUyy+RkDQ@mail.gmail.com>
 <8b4723ba-fffe-4616-8055-02a9cf6f2894@nvidia.com>
 <f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapiano>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a247za6f2lvaf6rv"
Content-Disposition: inline
In-Reply-To: <f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapiano>


--a247za6f2lvaf6rv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 09:58:35AM -0400, N=C3=ADcolas F. R. A. Prado wrote:
> On Wed, Oct 23, 2024 at 02:24:52PM +0100, Jon Hunter wrote:
> >=20
> > On 23/10/2024 02:00, Saravana Kannan wrote:
> > > On Thu, Oct 3, 2024 at 7:59=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
> > > <nfraprado@collabora.com> wrote:
> > > >=20
> > > > On Thu, Oct 03, 2024 at 11:25:22AM +0100, Jon Hunter wrote:
> > > > >=20
> > > > > On 02/10/2024 21:38, Saravana Kannan wrote:
> > > > > > On Wed, Oct 2, 2024 at 11:30=E2=80=AFAM Jon Hunter <jonathanh@n=
vidia.com> wrote:
> > > > > > >=20
> > > > > > > Hi Greg,
> > > > > > >=20
> > > > > > > On 16/09/2024 18:49, Greg Kroah-Hartman wrote:
> > > > > > > > On Mon, Sep 16, 2024 at 03:50:34PM +0100, Jon Hunter wrote:
> > > > > > > > >=20
> > > > > > > > > On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
> > > > > > > > > > On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wr=
ote:
> > > > > > > > > > > The following error messages are observed on boot wit=
h the Tegra234
> > > > > > > > > > > Jetson AGX Orin board ...
> > > > > > > > > > >=20
> > > > > > > > > > >      tegra-xusb-padctl 3520000.padctl: Failed to crea=
te device link (0x180)
> > > > > > > > > > >        with 1-0008
> > > > > > > > > > >      tegra-xusb-padctl 3520000.padctl: Failed to crea=
te device link (0x180)
> > > > > > > > > > >        with 1-0008
> > > > > > > > > > >      tegra-xusb-padctl 3520000.padctl: Failed to crea=
te device link (0x180)
> > > > > > > > > > >        with 1-0008
> > > > > > > > > > >=20
> > > > > > > > > > > In the above case, device_link_add() intentionally re=
turns NULL because
> > > > > > > > > > > these are SYNC_STATE_ONLY links and the device is alr=
eady probed.
> > > > > > > > > > > Therefore, the above messages are not actually errors=
=2E Fix this by
> > > > > > > > > > > replicating the test from device_link_add() in the fu=
nction
> > > > > > > > > > > fw_devlink_create_devlink() and don't call device_lin=
k_add() if there
> > > > > > > > > > > are no links to create.
> > > > > > > > > > >=20
> > > > > > > > > > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > > > > > > > >=20
> > > > > > > > > > What commit id does this fix?
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > Hard to say exactly. The above error message was first ad=
ded with commit
> > > > > > > > > 3fb16866b51d ("driver core: fw_devlink: Make cycle detect=
ion more robust")
> > > > > > > > > but at this time we did not have the support in place for=
 Tegra234 USB. I am
> > > > > > > > > guessing we first started seeing this when I enabled supp=
ort for the type-c
> > > > > > > > > controller in commit 16744314ee57 ("arm64: tegra: Populat=
e USB Type-C
> > > > > > > > > Controller for Jetson AGX Orin"). I can confirm if that i=
s helpful?
> > > > > > > > >=20
> > > > > > > >=20
> > > > > > > > That helps, I'll look at this after -rc1 is out, thanks!
> > > > > > >=20
> > > > > > >=20
> > > > > > > Let me know if there is anything else I can answer on this on=
e.
> > > > > >=20
> > > > > > Hi Jon,
> > > > > >=20
> > > > > > See this.
> > > > > > https://lore.kernel.org/all/c622df86-0372-450e-b3dd-ab93cd051d6=
f@notapiano/
> > > > > >=20
> > > > > > Ignore my point 1. My point 2 still stands. I got busy and forg=
ot to
> > > > > > reply to N=C3=ADcolas.
> > > > > >=20
> > > > > > I'm fine with either one of your patches as long as we define a
> > > > > > "useless link" function and use it in all the places.
> > > > >=20
> > > > >=20
> > > > > Thanks! Yes I am also fine with Nicolas' fix too. I quite like th=
e dev_dbg()
> > > > > in Nicolas' version. I was wondering if we should define a functi=
on for this
> > > > > check too.
> > > > >=20
> > > > > Nicolas do you want to update your patch with a 'useless link' fu=
nction? I
> > > > > will be happy to test on my side. Looks like you identified the e=
xact patch
> > > > > that introduced this and have the appropriate fixes tag too.
> > > >=20
> > > > Hi Jon,
> > > >=20
> > > > I just sent a reply to that thread yesterday going a bit further do=
wn the rabbit
> > > > hole to try and answer if there's an underlying issue there that th=
e log
> > > > messages are just exposing, but I still don't understand all the de=
vlink details
> > > > involved so was hoping for some feedback from Saravana.
> > > >=20
> > > > But if there's no feedback I can surely update the patch with the c=
ommonized
> > > > function to fix the immediate problem. I'll wait a couple days to g=
ive Saravana
> > > > (and others) some time to respond.
> > >=20
> > > Finally managed to squeeze in some time for Nicolas's issue. It was a
> > > real issue. Replied to the original thread from Nicolas.
> > >=20
> > > Jon, can you do an analysis similar to Nicolas? What consumer node did
> > > fw_devlink try to create a link for and what consumer device did it
> > > end up creating a device link with instead?
> >=20
> >=20
> > I am not 100% sure what you want, but enabling the same debug messages
> > as Nicolas I am seeing ...
> >=20
> > [    9.867969] i2c 3-0008: bus: 'i2c': __driver_probe_device: matched d=
evice with driver ucsi_ccg
> > [    9.868004] i2c 3-0008: bus: 'i2c': really_probe: probing driver ucs=
i_ccg with device
> > [    9.898834] ucsi_ccg 3-0008: driver: 'ucsi_ccg': driver_bound: bound=
 to device
> > [    9.898845] /bus@0/padctl@3520000/ports/usb3-0 Linked as a fwnode co=
nsumer to /bus@0/i2c@c240000/typec@8
> > [    9.898858] /bus@0/padctl@3520000/ports/usb3-0 Dropping the fwnode l=
ink to /bus@0/i2c@c240000/typec@8/connector@0
> > [    9.898871] /bus@0/padctl@3520000/ports/usb2-1 Linked as a fwnode co=
nsumer to /bus@0/i2c@c240000/typec@8
> > [    9.898881] /bus@0/padctl@3520000/ports/usb2-1 Dropping the fwnode l=
ink to /bus@0/i2c@c240000/typec@8/connector@0
> > [    9.898893] /bus@0/padctl@3520000/ports/usb3-1 Linked as a fwnode co=
nsumer to /bus@0/i2c@c240000/typec@8
> > [    9.898899] /bus@0/padctl@3520000/ports/usb3-1 Dropping the fwnode l=
ink to /bus@0/i2c@c240000/typec@8/connector@1
> > [    9.898905] /bus@0/padctl@3520000/ports/usb2-0 Linked as a fwnode co=
nsumer to /bus@0/i2c@c240000/typec@8
> > [    9.898910] /bus@0/padctl@3520000/ports/usb2-0 Dropping the fwnode l=
ink to /bus@0/i2c@c240000/typec@8/connector@1
> > [    9.898923] device: 'i2c:3-0008--usb_role:usb2-0-role-switch': devic=
e_add
> > [    9.898961] usb_role usb2-0-role-switch: Linked as a sync state only=
 consumer to 3-0008
> > [    9.898963] /bus@0/padctl@3520000/ports/usb2-0 Dropping the fwnode l=
ink to /bus@0/i2c@c240000/typec@8
> > [    9.898970] tegra-xusb-padctl 3520000.padctl: Failed to create devic=
e link (0x180) with 3-0008
> > [    9.907920] tegra-xusb-padctl 3520000.padctl: Failed to create devic=
e link (0x180) with 3-0008
> > [    9.916841] tegra-xusb-padctl 3520000.padctl: Failed to create devic=
e link (0x180) with 3-0008
> > [    9.925798] ucsi_ccg 3-0008: Dropping the link to usb2-0-role-switch
> > [    9.925808] device: 'usb_role:usb2-0-role-switch--i2c:3-0008': devic=
e_unregister
> > [    9.925903] ucsi_ccg 3-0008: Dropping the link to 3520000.padctl
> > [    9.925908] device: 'platform:3520000.padctl--i2c:3-0008': device_un=
register
> > [    9.926001] ucsi_ccg 3-0008: bus: 'i2c': really_probe: bound device =
to driver ucsi_ccg
> > [    9.963266] device: 'platform:3520000.padctl--typec:port0': device_a=
dd
> > [    9.963296] typec port0: Linked as a consumer to 3520000.padctl
> > [    9.963298] /bus@0/i2c@c240000/typec@8/connector@0 Dropping the fwno=
de link to /bus@0/padctl@3520000
> > [   10.015196] device: 'platform:3520000.padctl--typec:port1': device_a=
dd
> > [   10.015291] typec port1: Linked as a sync state only consumer to 352=
0000.padctl
> > [   10.015302] /bus@0/i2c@c240000/typec@8/connector@1 Dropping the fwno=
de link to /bus@0/padctl@35
> >=20
> > Let me know if there is anything else you need.
>=20
> I'm guessing a similar change to what Saravana suggested for the
> of_dp_aux_populate_bus() helper is needed here:
>=20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index cfdb54b6070a..0a2096085971 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_por=
t *port,
>=20
>         device_initialize(&port->dev);
>         port->dev.type =3D &tegra_xusb_port_type;
> -       port->dev.of_node =3D of_node_get(np);
> +       device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));

Do we need the of_node_get() in there? The intention was to grab a
reference to it before storing it in the port->dev.of_node, so that if
we put it the reference stays balanced. Looking at it again, we never
seem to do that cleanup, though probably we should. It's unlikely that
these OF nodes will ever go away completely, so this is all a bit moot.

Anyway, I guess we can leave this in. Worst case it's going to "leak"
an OF node that's not ever going to go away anyway.

Thierry

--a247za6f2lvaf6rv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcaftwACgkQ3SOs138+
s6GMYw/8Coqp7OqdhOIakt6+N4DCl2iDF/Ivnsqd48+APfKsKmQcuMBte7hcX8xD
4APeHQeRmvpdukFGxAmxNFpD991Zxvv2KjuTWsX2ZeQ+j19gUk2l19hr9MkPwiF8
YeDrHxBdlmI9afw5xczn8T5aBGrHpMCDH+bw5NGYS+cvuc5Qvl0kbNeQriQ5m0/w
eVCK4gCRW3ZduCU9sCG5MU9lxw+TCu2LFCST8s1Ij6ZLcDHhh4CH3ar1g6gFFyrs
EkPxFtmCQTl2lYKFrV2hvwM4LrstaT50YQFHSqv8nFYCOO6PBrXWNDIbjvobRjtm
oAdgbtzMf3HRoLa1HyN5rnUWegNMwawiIktMCmIak7K4u1LLwgqZxb7ZtoYKXWzh
CUlk0wg60/3kwWdAw59jBt2dv9i6Hc+eoNPwkE1QEQkP850VDDaTeuJsghqMI1+m
TI1pa9Ccfk4IYPIkPOAUWPN0Y+jL/y+VYLYqBk/qAI41tjn4rXRs/VGfNdW3CNTo
3Xn7r1MUqQHWXhiq9fTLI6k8KJiAHzE1e0sYEMItWrEdaWsSVNODuS6FrrGkX4IC
gRjmyeijCEUbCeU8MIaRWTFQdEctv4D73/SbbwKe9hTwOwcg7rVdVfvSi15+H/zQ
M9+x8EtCGW8NEqQPeOWwpiqTw37AaeRyKFUe8/jp+f40VoTp2iw=
=J+fZ
-----END PGP SIGNATURE-----

--a247za6f2lvaf6rv--
