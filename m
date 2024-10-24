Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DF51FC7D2
	for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2024 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789879; cv=none; b=ZMuP4fNi6/dl4dQVF0jNXydEVsNHm1egZt0qRpX+iooES+eyDaZZWWXnjM9/1eNlWi5/3OvSrGzBMyObmXrmfIXqXEqu4feJpI/tYoz5dmuA0774pZJqJkERN3pP/PQuS/0qLGMpOEeWMTvjl3TzyqXX1+pgUeTaNWh1ctF9YQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789879; c=relaxed/simple;
	bh=BzN8xxsinAy6Fm8Uy4kVkL1II8d5jei3SXsIjIu8KrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ON/xPNWaCMDwiYRJGEtjX4oqz4Xmx+1btsFreAUSeJB/KzZLAYdivWA7/OGwa+8SxoI8xpXm3ym+y3Y1mEDSX/2wSuhumqI4YhONygNPbRTvwKI9R/C4NAG/+Pu/0XRrqNxYp/khunHt6IkPoKn43YQ4CyaIah9ro3gYdHAMMm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W5HV14cx; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W5HV14cx"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71ec997ad06so835604b3a.3
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2024 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729789876; x=1730394676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YK3+I7Jgd5XXSa3unm42LPbI33suHrYLHFxUgN4mi4=;
        b=W5HV14cxwhccE303TweqIVMc/1zOZGVCAE3q+EUPy8JLUM6qTZX17jPXvE+r1Nx75j
         1LL9tRoOLfEYrYUL6YJDJ7BESHpMd75SUnNpfs4hYXxFCujSzydmL8DcMxryx5mSG/v5
         84F1CMuOvvzjxxjCaPA6YM+yqOIhtB+L0gaM94m3sxzYJDg3euolTYk8Kss1FZ8jBGfs
         oHj5BEzYI8ewSyDU6P8mQ9mg0JG6VPp3119MS/Z9rGNgSlxzOepaUnNU1LVnkDzfpwA6
         5GbRjNcb44y9/dUapiWNqfdrAJHWr/BRdv0oL+1KbINps7H4rca3LtCHpH9fCO+8rASf
         9/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729789876; x=1730394676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YK3+I7Jgd5XXSa3unm42LPbI33suHrYLHFxUgN4mi4=;
        b=kGwjfMpiThJUIJVt7cTwfqOkRGDLx/02i1DaHTy+LqKkHSNM3KH4V2Bxru5/shbQe6
         0uHPZvcLqeo1371Drq3aJwAA43yc/2NNI4bS9cCka3y/F4B0uARYo6vJd4Fo3Jye7ITy
         gb6Fx7kgUDXbYZftbwxnT963L9OD4AXTlyss6gLkxZlRr/IeOzQXy4CsxBR3ZtOAomvO
         HlmNa1ZnCtjBDLp7Rwkykdq419mJCXTk4y/UtoKjPPxJfJ08pJEV4vWc6EuEkszmvX45
         RA0qohUuc9ZgSsW2ZecGGnuoxgFFsr+OyRtxjKvxohGsjwAPf/egyll4xLAAKP5q2ND6
         UGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2syb5HHkzaOqS2Ru/89nNy9XHBlabPNFHN/HtudW5hJwGf2Se16UWNLlzOk37HkJL5Cpd+l/TTshC1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc++4ihaAYuouywZvIf9yMoG/9qXqOwskme9/iQPBp0CMMz7N7
	5rBy5LmVtSO4li1ZYzOsTWs/HR8KNKFAiZVCPKn2kXO2Tn3siRmSGc784MusQ3VxJPZSkBNO/LY
	zA+Yiz348YuXYpIUNYWeS40i3C77pEX9RQszw6ptmPrt383cN2gXv
X-Google-Smtp-Source: AGHT+IEyfST8PQvqg8Zknha7UQ9NXHpn6cDK5g8CMKdsUYBf52gG/4FZBjZ7yfnuaPnHMh65tUODH+XrjIh3aAelqhw=
X-Received: by 2002:a05:6a00:6406:b0:720:36c5:b531 with SMTP id
 d2e1a72fcca58-72036c5b8damr6603527b3a.14.1729789875330; Thu, 24 Oct 2024
 10:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024091152-impound-salt-c748@gregkh> <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
 <2024091627-online-favored-7a9f@gregkh> <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
 <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
 <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com> <d9aadede-dfac-410a-b65b-e295c9a64951@notapiano>
 <CAGETcx-_z4hxyNSwT-D1MKNzAjOGSX+o7x5G8J0KkiUyy+RkDQ@mail.gmail.com>
 <8b4723ba-fffe-4616-8055-02a9cf6f2894@nvidia.com> <f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapiano>
 <4cevcdwbghn7nisyoetcgrentfu7zvxpzu4kl67exushjexbrv@6ialgl77ivlb>
In-Reply-To: <4cevcdwbghn7nisyoetcgrentfu7zvxpzu4kl67exushjexbrv@6ialgl77ivlb>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 24 Oct 2024 10:10:36 -0700
Message-ID: <CAGETcx8DV1VAO493X-X9h2cepK2i0Ok93EarT4-mnYyB8FMK2g@mail.gmail.com>
Subject: Re: [PATCH] driver core: Don't try to create links if they are not needed
To: Thierry Reding <thierry.reding@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 10:07=E2=80=AFAM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Wed, Oct 23, 2024 at 09:58:35AM -0400, N=C3=ADcolas F. R. A. Prado wro=
te:
> > On Wed, Oct 23, 2024 at 02:24:52PM +0100, Jon Hunter wrote:
> > >
> > > On 23/10/2024 02:00, Saravana Kannan wrote:
> > > > On Thu, Oct 3, 2024 at 7:59=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
> > > > <nfraprado@collabora.com> wrote:
> > > > >
> > > > > On Thu, Oct 03, 2024 at 11:25:22AM +0100, Jon Hunter wrote:
> > > > > >
> > > > > > On 02/10/2024 21:38, Saravana Kannan wrote:
> > > > > > > On Wed, Oct 2, 2024 at 11:30=E2=80=AFAM Jon Hunter <jonathanh=
@nvidia.com> wrote:
> > > > > > > >
> > > > > > > > Hi Greg,
> > > > > > > >
> > > > > > > > On 16/09/2024 18:49, Greg Kroah-Hartman wrote:
> > > > > > > > > On Mon, Sep 16, 2024 at 03:50:34PM +0100, Jon Hunter wrot=
e:
> > > > > > > > > >
> > > > > > > > > > On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
> > > > > > > > > > > On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter =
wrote:
> > > > > > > > > > > > The following error messages are observed on boot w=
ith the Tegra234
> > > > > > > > > > > > Jetson AGX Orin board ...
> > > > > > > > > > > >
> > > > > > > > > > > >      tegra-xusb-padctl 3520000.padctl: Failed to cr=
eate device link (0x180)
> > > > > > > > > > > >        with 1-0008
> > > > > > > > > > > >      tegra-xusb-padctl 3520000.padctl: Failed to cr=
eate device link (0x180)
> > > > > > > > > > > >        with 1-0008
> > > > > > > > > > > >      tegra-xusb-padctl 3520000.padctl: Failed to cr=
eate device link (0x180)
> > > > > > > > > > > >        with 1-0008
> > > > > > > > > > > >
> > > > > > > > > > > > In the above case, device_link_add() intentionally =
returns NULL because
> > > > > > > > > > > > these are SYNC_STATE_ONLY links and the device is a=
lready probed.
> > > > > > > > > > > > Therefore, the above messages are not actually erro=
rs. Fix this by
> > > > > > > > > > > > replicating the test from device_link_add() in the =
function
> > > > > > > > > > > > fw_devlink_create_devlink() and don't call device_l=
ink_add() if there
> > > > > > > > > > > > are no links to create.
> > > > > > > > > > > >
> > > > > > > > > > > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > > > > > > > > >
> > > > > > > > > > > What commit id does this fix?
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Hard to say exactly. The above error message was first =
added with commit
> > > > > > > > > > 3fb16866b51d ("driver core: fw_devlink: Make cycle dete=
ction more robust")
> > > > > > > > > > but at this time we did not have the support in place f=
or Tegra234 USB. I am
> > > > > > > > > > guessing we first started seeing this when I enabled su=
pport for the type-c
> > > > > > > > > > controller in commit 16744314ee57 ("arm64: tegra: Popul=
ate USB Type-C
> > > > > > > > > > Controller for Jetson AGX Orin"). I can confirm if that=
 is helpful?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > That helps, I'll look at this after -rc1 is out, thanks!
> > > > > > > >
> > > > > > > >
> > > > > > > > Let me know if there is anything else I can answer on this =
one.
> > > > > > >
> > > > > > > Hi Jon,
> > > > > > >
> > > > > > > See this.
> > > > > > > https://lore.kernel.org/all/c622df86-0372-450e-b3dd-ab93cd051=
d6f@notapiano/
> > > > > > >
> > > > > > > Ignore my point 1. My point 2 still stands. I got busy and fo=
rgot to
> > > > > > > reply to N=C3=ADcolas.
> > > > > > >
> > > > > > > I'm fine with either one of your patches as long as we define=
 a
> > > > > > > "useless link" function and use it in all the places.
> > > > > >
> > > > > >
> > > > > > Thanks! Yes I am also fine with Nicolas' fix too. I quite like =
the dev_dbg()
> > > > > > in Nicolas' version. I was wondering if we should define a func=
tion for this
> > > > > > check too.
> > > > > >
> > > > > > Nicolas do you want to update your patch with a 'useless link' =
function? I
> > > > > > will be happy to test on my side. Looks like you identified the=
 exact patch
> > > > > > that introduced this and have the appropriate fixes tag too.
> > > > >
> > > > > Hi Jon,
> > > > >
> > > > > I just sent a reply to that thread yesterday going a bit further =
down the rabbit
> > > > > hole to try and answer if there's an underlying issue there that =
the log
> > > > > messages are just exposing, but I still don't understand all the =
devlink details
> > > > > involved so was hoping for some feedback from Saravana.
> > > > >
> > > > > But if there's no feedback I can surely update the patch with the=
 commonized
> > > > > function to fix the immediate problem. I'll wait a couple days to=
 give Saravana
> > > > > (and others) some time to respond.
> > > >
> > > > Finally managed to squeeze in some time for Nicolas's issue. It was=
 a
> > > > real issue. Replied to the original thread from Nicolas.
> > > >
> > > > Jon, can you do an analysis similar to Nicolas? What consumer node =
did
> > > > fw_devlink try to create a link for and what consumer device did it
> > > > end up creating a device link with instead?
> > >
> > >
> > > I am not 100% sure what you want, but enabling the same debug message=
s
> > > as Nicolas I am seeing ...
> > >
> > > [    9.867969] i2c 3-0008: bus: 'i2c': __driver_probe_device: matched=
 device with driver ucsi_ccg
> > > [    9.868004] i2c 3-0008: bus: 'i2c': really_probe: probing driver u=
csi_ccg with device
> > > [    9.898834] ucsi_ccg 3-0008: driver: 'ucsi_ccg': driver_bound: bou=
nd to device
> > > [    9.898845] /bus@0/padctl@3520000/ports/usb3-0 Linked as a fwnode =
consumer to /bus@0/i2c@c240000/typec@8
> > > [    9.898858] /bus@0/padctl@3520000/ports/usb3-0 Dropping the fwnode=
 link to /bus@0/i2c@c240000/typec@8/connector@0
> > > [    9.898871] /bus@0/padctl@3520000/ports/usb2-1 Linked as a fwnode =
consumer to /bus@0/i2c@c240000/typec@8
> > > [    9.898881] /bus@0/padctl@3520000/ports/usb2-1 Dropping the fwnode=
 link to /bus@0/i2c@c240000/typec@8/connector@0
> > > [    9.898893] /bus@0/padctl@3520000/ports/usb3-1 Linked as a fwnode =
consumer to /bus@0/i2c@c240000/typec@8
> > > [    9.898899] /bus@0/padctl@3520000/ports/usb3-1 Dropping the fwnode=
 link to /bus@0/i2c@c240000/typec@8/connector@1
> > > [    9.898905] /bus@0/padctl@3520000/ports/usb2-0 Linked as a fwnode =
consumer to /bus@0/i2c@c240000/typec@8
> > > [    9.898910] /bus@0/padctl@3520000/ports/usb2-0 Dropping the fwnode=
 link to /bus@0/i2c@c240000/typec@8/connector@1
> > > [    9.898923] device: 'i2c:3-0008--usb_role:usb2-0-role-switch': dev=
ice_add
> > > [    9.898961] usb_role usb2-0-role-switch: Linked as a sync state on=
ly consumer to 3-0008
> > > [    9.898963] /bus@0/padctl@3520000/ports/usb2-0 Dropping the fwnode=
 link to /bus@0/i2c@c240000/typec@8
> > > [    9.898970] tegra-xusb-padctl 3520000.padctl: Failed to create dev=
ice link (0x180) with 3-0008
> > > [    9.907920] tegra-xusb-padctl 3520000.padctl: Failed to create dev=
ice link (0x180) with 3-0008
> > > [    9.916841] tegra-xusb-padctl 3520000.padctl: Failed to create dev=
ice link (0x180) with 3-0008
> > > [    9.925798] ucsi_ccg 3-0008: Dropping the link to usb2-0-role-swit=
ch
> > > [    9.925808] device: 'usb_role:usb2-0-role-switch--i2c:3-0008': dev=
ice_unregister
> > > [    9.925903] ucsi_ccg 3-0008: Dropping the link to 3520000.padctl
> > > [    9.925908] device: 'platform:3520000.padctl--i2c:3-0008': device_=
unregister
> > > [    9.926001] ucsi_ccg 3-0008: bus: 'i2c': really_probe: bound devic=
e to driver ucsi_ccg
> > > [    9.963266] device: 'platform:3520000.padctl--typec:port0': device=
_add
> > > [    9.963296] typec port0: Linked as a consumer to 3520000.padctl
> > > [    9.963298] /bus@0/i2c@c240000/typec@8/connector@0 Dropping the fw=
node link to /bus@0/padctl@3520000
> > > [   10.015196] device: 'platform:3520000.padctl--typec:port1': device=
_add
> > > [   10.015291] typec port1: Linked as a sync state only consumer to 3=
520000.padctl
> > > [   10.015302] /bus@0/i2c@c240000/typec@8/connector@1 Dropping the fw=
node link to /bus@0/padctl@35
> > >
> > > Let me know if there is anything else you need.
> >
> > I'm guessing a similar change to what Saravana suggested for the
> > of_dp_aux_populate_bus() helper is needed here:
> >
> > diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> > index cfdb54b6070a..0a2096085971 100644
> > --- a/drivers/phy/tegra/xusb.c
> > +++ b/drivers/phy/tegra/xusb.c
> > @@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_p=
ort *port,
> >
> >         device_initialize(&port->dev);
> >         port->dev.type =3D &tegra_xusb_port_type;
> > -       port->dev.of_node =3D of_node_get(np);
> > +       device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));
>
> Do we need the of_node_get() in there? The intention was to grab a
> reference to it before storing it in the port->dev.of_node, so that if
> we put it the reference stays balanced. Looking at it again, we never
> seem to do that cleanup, though probably we should. It's unlikely that
> these OF nodes will ever go away completely, so this is all a bit moot.
>
> Anyway, I guess we can leave this in. Worst case it's going to "leak"
> an OF node that's not ever going to go away anyway.

The helper function sets dev.of_node too. So this is not changing any
existing references. Just adding a new one. And I didn't want to
change any reference counting in this patch.

-Saravana
