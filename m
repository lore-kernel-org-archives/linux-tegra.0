From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [Patch V10 0/8] Tegra XUSB gadget driver support
Date: Tue, 15 Oct 2019 19:58:20 +0200
Message-ID: <20191015175820.GC1072965@kroah.com>
References: <1569227152-3030-1-git-send-email-nkristam@nvidia.com>
 <20191014100257.GB419598@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014100257.GB419598@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Nagarjuna Kristam <nkristam@nvidia.com>, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 14, 2019 at 12:02:57PM +0200, Thierry Reding wrote:
> On Mon, Sep 23, 2019 at 01:55:44PM +0530, Nagarjuna Kristam wrote:
> > Patches 1-3 are phy driver changes to add support for device
> > mode.
> > Patches 4-7 are changes related to XUSB device mode
> > controller driver.
> > Patch 8 is to enable drivers for XUDC support in defconfig
> > 
> > Test Steps(USB 2.0):
> > - Enable "USB Gadget precomposed configurations" in defconfig
> > - Build, flash and boot Jetson TX1
> > - Connect Jetson TX1 and Ubuntu device using USB A to Micro B
> >   cable
> > - After boot on Jetson TX1 terminal usb0 network device should be
> >   enumerated
> > - Assign static ip to usb0 on Jetson TX1 and corresponding net
> >   device on ubuntu
> > - Run ping test and transfer test(used scp) to check data transfer
> >   communication
> 
> Hi Felipe, Kishon, Greg,
> 
> Patches 1-3 provide new API that is required by patch 7, so I think
> patches 1, 2, 3, 4 and 7 should probably all go through a single tree to
> avoid having to model the dependencies using stable branches.
> 
> Kishon, patches 1-3 have gone through several rounds of review already,
> but do you have any remaining concerns on them? If not, it'd be great if
> you could ack them. Felipe and Greg could then pick them up along with
> patches 4 and 7 into the USB tree.
> 
> Felipe, Greg, does that sound like a reasonable plan?

Fine with me.

> I should also mention that while waiting for review, Nagarjuna has been
> able to extend support for the XUDC driver to Tegra186 but has so far
> been holding back on sending them out so as to not needlessly hold up
> progress on this series. However, given the interdependencies, I've come
> to think that it may be preferable to merge everything in one go instead
> of revisiting this in a couple of weeks.
> 
> If you guys prefer, Nagarjuna could send out v11 of the series and
> integrate Tegra186 support.

That's also fine.

thanks,

greg k-h
