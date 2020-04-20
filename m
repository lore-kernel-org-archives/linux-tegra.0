From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 4.19.113 0/3] Fix for long operation cmds busy detection
Date: Mon, 20 Apr 2020 09:01:35 +0200
Message-ID: <CAPDyKFrdCip_r0fq2=FswsR8iRtC-Gqv2gbvT6PqFXYcaZyBkw@mail.gmail.com>
References: <1587150844-12003-1-git-send-email-skomatineni@nvidia.com>
 <20200419072030.GB3544449@kroah.com> <6911ee08-1376-a515-9393-1ebc6cc6a255@nvidia.com>
 <20200419165204.GA3697430@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20200419165204.GA3697430@kroah.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, "(Exiting) Baolin Wang" <baolin.wang@linaro.org>, Kate Stewart <kstewart@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Bradley Bolen <bradleybolen@gmail.com>, Faiz Abbas <faiz_abbas@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, Aniruddha Tvs Rao <anrao@nvidia.com>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, 19 Apr 2020 at 18:52, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Apr 19, 2020 at 09:23:39AM -0700, Sowjanya Komatineni wrote:
> >
> > On 4/19/20 12:20 AM, Greg KH wrote:
> > > External email: Use caution opening links or attachments
> > >
> > >
> > > On Fri, Apr 17, 2020 at 12:14:01PM -0700, Sowjanya Komatineni wrote:
> > > > This series includes manually backported changes that implements Tegra
> > > > specific timeout callback to switch between finite and infinite HW busy
> > > > detection wait modes.
> > > >
> > > > sdhci-tegra driver patch implements set_timeout callback based on one of
> > > > the sdhci host driver patch that refactors sdhci_set_timeout and allows
> > > > drivers to call __sdhci_set_timeout with their timeout callback
> > > > implementation.
> > > >
> > > > Both of these patches are manually backported in this series.
> > > Is this a bugfix or a new feature?  I can't tell, but it feels like it's
> > > a new feature.  What's wrong with just using the 5.4.y kernel tree?
> > >
> > > thanks,
> > >
> > > greg k-h
> > Ulf recent patches for increased timeout adds capability
> > MMC_CAP_NEED_RSP_BUSY for sdhci-tegra as well.
> >
> > So, it will always use R1B for R1B type commands so there are no known bugs
> > or failures with mmc devices we use on our platforms.
>
> I have no idea what this means, sorry.
>
> > So, we can treat this patch as an improvement for long operation commands
> > where HW will wait as long as device is busy.
>
> Ok, so this isn't a regression and can't match the stable kernel rules,
> sorry.

Let me help to clarify. This isn't a regression, correct. However, the
patch fixes a long outstanding bug for sdhci-tegra.

For some SD/MMC commands, the mmc core may provide a long busy timeout
trusting the mmc host to cope with it. It has turned out that
sdhci-tegra didn't, thus it may report a cmd-timeout error, while in
fact it shouldn't.

I believe that is what the small series of patches should be addressing.

Kind regards
Uffe
