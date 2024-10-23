Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC17159583;
	Wed, 23 Oct 2024 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729691922; cv=none; b=MWAihWn6kewlMtsPoY+Cc78FUMt8aAGwRSSbycS0M5qCYxlRUAmmJQ12oGcXwni7YbGbhvbvZ6AmVVfRL8DuFnE4HUVN8Y7G4KElLjs35Qv0s2JKwVdR7thgwxTyo9fT1Nc4/T1XzoVn5QSAv7F39qu8Ru9oB66vcJsXckzCDLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729691922; c=relaxed/simple;
	bh=soonveSV1WQMSfvcN6aQqdwl29BLqe79anw7pnTAu6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DENZejaKfOoCB7IbLQK2SLk+yLksFalQIKfwQcUpHk9QJZ4mTfzJQBJJ9e+SW60M2FOQ8+fTs5i9wlBTgUnSF6nDodj4mSsc6a+CDGOfXOd/fQHu9js//ZpDTQK8MK3laIuZnmgHXgyLLRGt0qNxfp1NNUFjNzNkwMxp6mbgqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V/s48tX1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V/s48tX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729691918;
	bh=soonveSV1WQMSfvcN6aQqdwl29BLqe79anw7pnTAu6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/s48tX1yUnCdYieOscUt+AfVlrQsSA65NtawtNA6R6D3ZP9lJ86SP3Dz9n9Lt8rG
	 D8d1OV1fBPjzyxN1R1NDqJex6f8CJtia83dir1dkxU55ZCcuywrkI9LnRY+1VmjtqD
	 bkY4WC1zea7aNXENRVdiQkzIHZp7yGIDz/McpYVdU9It+qMmwj/SzOL9PoYVHvnXG4
	 xItA4/BEVPQT3tTx6HR5V+FOutzxPQBXtuq0lk7UU03kb04OUeYr8Vr+fNytNVcNwt
	 cMmJ6ahow8mHb524KRBLovZ4m2lM69VnPJm/Yp7/tsLT45wjKvg9ye54bYfb+28qVs
	 2HThv0MuNLLDw==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9805817E3624;
	Wed, 23 Oct 2024 15:58:37 +0200 (CEST)
Date: Wed, 23 Oct 2024 09:58:35 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
Message-ID: <f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapiano>
References: <20240910130019.35081-1-jonathanh@nvidia.com>
 <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
 <2024091627-online-favored-7a9f@gregkh>
 <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
 <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
 <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com>
 <d9aadede-dfac-410a-b65b-e295c9a64951@notapiano>
 <CAGETcx-_z4hxyNSwT-D1MKNzAjOGSX+o7x5G8J0KkiUyy+RkDQ@mail.gmail.com>
 <8b4723ba-fffe-4616-8055-02a9cf6f2894@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b4723ba-fffe-4616-8055-02a9cf6f2894@nvidia.com>

On Wed, Oct 23, 2024 at 02:24:52PM +0100, Jon Hunter wrote:
> 
> On 23/10/2024 02:00, Saravana Kannan wrote:
> > On Thu, Oct 3, 2024 at 7:59 AM Nícolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > > 
> > > On Thu, Oct 03, 2024 at 11:25:22AM +0100, Jon Hunter wrote:
> > > > 
> > > > On 02/10/2024 21:38, Saravana Kannan wrote:
> > > > > On Wed, Oct 2, 2024 at 11:30 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> > > > > > 
> > > > > > Hi Greg,
> > > > > > 
> > > > > > On 16/09/2024 18:49, Greg Kroah-Hartman wrote:
> > > > > > > On Mon, Sep 16, 2024 at 03:50:34PM +0100, Jon Hunter wrote:
> > > > > > > > 
> > > > > > > > On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
> > > > > > > > > On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wrote:
> > > > > > > > > > The following error messages are observed on boot with the Tegra234
> > > > > > > > > > Jetson AGX Orin board ...
> > > > > > > > > > 
> > > > > > > > > >      tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
> > > > > > > > > >        with 1-0008
> > > > > > > > > >      tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
> > > > > > > > > >        with 1-0008
> > > > > > > > > >      tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
> > > > > > > > > >        with 1-0008
> > > > > > > > > > 
> > > > > > > > > > In the above case, device_link_add() intentionally returns NULL because
> > > > > > > > > > these are SYNC_STATE_ONLY links and the device is already probed.
> > > > > > > > > > Therefore, the above messages are not actually errors. Fix this by
> > > > > > > > > > replicating the test from device_link_add() in the function
> > > > > > > > > > fw_devlink_create_devlink() and don't call device_link_add() if there
> > > > > > > > > > are no links to create.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > > > > > > > 
> > > > > > > > > What commit id does this fix?
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Hard to say exactly. The above error message was first added with commit
> > > > > > > > 3fb16866b51d ("driver core: fw_devlink: Make cycle detection more robust")
> > > > > > > > but at this time we did not have the support in place for Tegra234 USB. I am
> > > > > > > > guessing we first started seeing this when I enabled support for the type-c
> > > > > > > > controller in commit 16744314ee57 ("arm64: tegra: Populate USB Type-C
> > > > > > > > Controller for Jetson AGX Orin"). I can confirm if that is helpful?
> > > > > > > > 
> > > > > > > 
> > > > > > > That helps, I'll look at this after -rc1 is out, thanks!
> > > > > > 
> > > > > > 
> > > > > > Let me know if there is anything else I can answer on this one.
> > > > > 
> > > > > Hi Jon,
> > > > > 
> > > > > See this.
> > > > > https://lore.kernel.org/all/c622df86-0372-450e-b3dd-ab93cd051d6f@notapiano/
> > > > > 
> > > > > Ignore my point 1. My point 2 still stands. I got busy and forgot to
> > > > > reply to Nícolas.
> > > > > 
> > > > > I'm fine with either one of your patches as long as we define a
> > > > > "useless link" function and use it in all the places.
> > > > 
> > > > 
> > > > Thanks! Yes I am also fine with Nicolas' fix too. I quite like the dev_dbg()
> > > > in Nicolas' version. I was wondering if we should define a function for this
> > > > check too.
> > > > 
> > > > Nicolas do you want to update your patch with a 'useless link' function? I
> > > > will be happy to test on my side. Looks like you identified the exact patch
> > > > that introduced this and have the appropriate fixes tag too.
> > > 
> > > Hi Jon,
> > > 
> > > I just sent a reply to that thread yesterday going a bit further down the rabbit
> > > hole to try and answer if there's an underlying issue there that the log
> > > messages are just exposing, but I still don't understand all the devlink details
> > > involved so was hoping for some feedback from Saravana.
> > > 
> > > But if there's no feedback I can surely update the patch with the commonized
> > > function to fix the immediate problem. I'll wait a couple days to give Saravana
> > > (and others) some time to respond.
> > 
> > Finally managed to squeeze in some time for Nicolas's issue. It was a
> > real issue. Replied to the original thread from Nicolas.
> > 
> > Jon, can you do an analysis similar to Nicolas? What consumer node did
> > fw_devlink try to create a link for and what consumer device did it
> > end up creating a device link with instead?
> 
> 
> I am not 100% sure what you want, but enabling the same debug messages
> as Nicolas I am seeing ...
> 
> [    9.867969] i2c 3-0008: bus: 'i2c': __driver_probe_device: matched device with driver ucsi_ccg
> [    9.868004] i2c 3-0008: bus: 'i2c': really_probe: probing driver ucsi_ccg with device
> [    9.898834] ucsi_ccg 3-0008: driver: 'ucsi_ccg': driver_bound: bound to device
> [    9.898845] /bus@0/padctl@3520000/ports/usb3-0 Linked as a fwnode consumer to /bus@0/i2c@c240000/typec@8
> [    9.898858] /bus@0/padctl@3520000/ports/usb3-0 Dropping the fwnode link to /bus@0/i2c@c240000/typec@8/connector@0
> [    9.898871] /bus@0/padctl@3520000/ports/usb2-1 Linked as a fwnode consumer to /bus@0/i2c@c240000/typec@8
> [    9.898881] /bus@0/padctl@3520000/ports/usb2-1 Dropping the fwnode link to /bus@0/i2c@c240000/typec@8/connector@0
> [    9.898893] /bus@0/padctl@3520000/ports/usb3-1 Linked as a fwnode consumer to /bus@0/i2c@c240000/typec@8
> [    9.898899] /bus@0/padctl@3520000/ports/usb3-1 Dropping the fwnode link to /bus@0/i2c@c240000/typec@8/connector@1
> [    9.898905] /bus@0/padctl@3520000/ports/usb2-0 Linked as a fwnode consumer to /bus@0/i2c@c240000/typec@8
> [    9.898910] /bus@0/padctl@3520000/ports/usb2-0 Dropping the fwnode link to /bus@0/i2c@c240000/typec@8/connector@1
> [    9.898923] device: 'i2c:3-0008--usb_role:usb2-0-role-switch': device_add
> [    9.898961] usb_role usb2-0-role-switch: Linked as a sync state only consumer to 3-0008
> [    9.898963] /bus@0/padctl@3520000/ports/usb2-0 Dropping the fwnode link to /bus@0/i2c@c240000/typec@8
> [    9.898970] tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with 3-0008
> [    9.907920] tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with 3-0008
> [    9.916841] tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with 3-0008
> [    9.925798] ucsi_ccg 3-0008: Dropping the link to usb2-0-role-switch
> [    9.925808] device: 'usb_role:usb2-0-role-switch--i2c:3-0008': device_unregister
> [    9.925903] ucsi_ccg 3-0008: Dropping the link to 3520000.padctl
> [    9.925908] device: 'platform:3520000.padctl--i2c:3-0008': device_unregister
> [    9.926001] ucsi_ccg 3-0008: bus: 'i2c': really_probe: bound device to driver ucsi_ccg
> [    9.963266] device: 'platform:3520000.padctl--typec:port0': device_add
> [    9.963296] typec port0: Linked as a consumer to 3520000.padctl
> [    9.963298] /bus@0/i2c@c240000/typec@8/connector@0 Dropping the fwnode link to /bus@0/padctl@3520000
> [   10.015196] device: 'platform:3520000.padctl--typec:port1': device_add
> [   10.015291] typec port1: Linked as a sync state only consumer to 3520000.padctl
> [   10.015302] /bus@0/i2c@c240000/typec@8/connector@1 Dropping the fwnode link to /bus@0/padctl@35
> 
> Let me know if there is anything else you need.

I'm guessing a similar change to what Saravana suggested for the
of_dp_aux_populate_bus() helper is needed here:

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index cfdb54b6070a..0a2096085971 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,

        device_initialize(&port->dev);
        port->dev.type = &tegra_xusb_port_type;
-       port->dev.of_node = of_node_get(np);
+       device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));
        port->dev.parent = padctl->dev;

        err = dev_set_name(&port->dev, "%s-%u", name, index);


As a side note, I wonder if it would be possible to detect these mistakes... But
I'm guessing there are legitimate situations where there's no fwnode.

Thanks,
Nícolas
