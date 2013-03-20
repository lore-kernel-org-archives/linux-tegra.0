From: Venu Byravarasu <vbyravarasu@nvidia.com>
Subject: RE: [PATCH 2/7] ARM: tegra: update device trees for USB binding
 rework
Date: Wed, 20 Mar 2013 18:00:13 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E5092FFF4@BGMAIL02.nvidia.com>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com>
 <1363609781-4045-3-git-send-email-vbyravarasu@nvidia.com>
 <51499C29.6070405@ti.com>
 <D958900912E20642BCBC71664EFECE3E6E5092FFE7@BGMAIL02.nvidia.com>
 <20130320122454.GK29659@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130320122454.GK29659@arwen.pp.htv.fi>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "balbi@ti.com" <balbi@ti.com>
Cc: kishon <kishon@ti.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Felipe Balbi [mailto:balbi@ti.com]
> Sent: Wednesday, March 20, 2013 5:55 PM
> To: Venu Byravarasu
> Cc: kishon; gregkh@linuxfoundation.org; stern@rowland.harvard.edu;
> balbi@ti.com; linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org;
> swarren@wwwdotorg.org; linux-tegra@vger.kernel.org; devicetree-
> discuss@lists.ozlabs.org
> Subject: Re: [PATCH 2/7] ARM: tegra: update device trees for USB binding
> rework
> 
> * PGP Signed by an unknown key
> 
> On Wed, Mar 20, 2013 at 05:47:46PM +0530, Venu Byravarasu wrote:
> > > -----Original Message-----
> > > From: kishon [mailto:kishon@ti.com]
> > > Sent: Wednesday, March 20, 2013 4:53 PM
> > > To: Venu Byravarasu
> > > Cc: gregkh@linuxfoundation.org; stern@rowland.harvard.edu;
> > > balbi@ti.com; linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org;
> > > swarren@wwwdotorg.org; linux-tegra@vger.kernel.org; devicetree-
> > > discuss@lists.ozlabs.org
> > > Subject: Re: [PATCH 2/7] ARM: tegra: update device trees for USB binding
> > > rework
> > >
> > > Hi,
> > > >

> > > > +	usb-phy@c5004000 {
> > > This node doesn't have a *reg* property. So "@c5004000" is not needed.
> > > This comment applies to all the nodes which doesn't have *reg* property.
> >
> > Thanks Kishon for the comments.
> > As I've 3 usb-phy DT nodes, how to differentiate between them if I remove
> this @Address ?
> 
> then add reg property :-)

Thanks Felipe, for confirming. 

> 
> --
> balbi
> 
> * Unknown Key
> * 0x35CAA444
