From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] usb: chipidea: tegra: Fix missed
 ci_hdrc_remove_device()
Date: Tue, 26 Feb 2019 16:21:44 +0100
Message-ID: <20190226152144.GA17948@kroah.com>
References: <20190224153622.8877-1-digetx@gmail.com>
 <VI1PR04MB5327FE97DC8C68B4D56DE0A98B7A0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20190225080715.4965810a@dimatab>
 <20190226105615.GA12397@kroah.com>
 <e7693387-9ac5-b2d8-0a0f-d507dfe05830@gmail.com>
 <20190226145857.GB26080@kroah.com>
 <d5e80295-977e-79b0-4f27-2134c52a6e6e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d5e80295-977e-79b0-4f27-2134c52a6e6e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, Peter Chen <peter.chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 26, 2019 at 06:08:17PM +0300, Dmitry Osipenko wrote:
> 26.02.2019 17:58, Greg Kroah-Hartman пишет:
> > On Tue, Feb 26, 2019 at 05:33:05PM +0300, Dmitry Osipenko wrote:
> >> 26.02.2019 13:56, Greg Kroah-Hartman пишет:
> >>> On Mon, Feb 25, 2019 at 08:07:15AM +0300, Dmitry Osipenko wrote:
> >>>> В Mon, 25 Feb 2019 02:27:19 +0000
> >>>> Peter Chen <peter.chen@nxp.com> пишет:
> >>>>
> >>>>>  
> >>>>>>
> >>>>>> Fixes: dfebb5f43a78827a ("usb: chipidea: Add support for
> >>>>>> Tegra20/30/114/124")  
> >>>>>
> >>>>> I suppose you need to apply at stable tree too, right?
> >>>>>
> >>>>
> >>>> It is enough to have the "Fixes" tag to get patch backported into all
> >>>> relevant kernel versions.
> >>>
> >>> No it is not.  My scripts do NOT trigger off of the fixes: tag, please
> >>> read:
> >>>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> >>> for how to do this properly.
> >>
> >> Okay, my bad then. Maybe this is something that could warned by checkpatch.. adding Joe and Andy to the thread.
> > 
> > Why?  It's allowed to put fixes: tags for a patch that does not belong
> > in a stable tree.  That happens all the time, and is encouraged.  Look
> > at some of the stuff in linux-next now, we have Fixes: for commits that
> > are still in linux-next as well, because we do not rebase our trees.
> > When they all merge into Linus's tree, all is good.
> > 
> > So this is not something that checkpatch needs to do anything about.
> 
> At least that might help in cases like this if maintainer is also oblivious.

If the maintainer is "oblivious", they are not going to be running
checkpatch :)

Remember, the "Fixes:" tag is a relatively new thing compared to the cc:
stable tag, which has been a documented requirement for over a decade.
Yes, some subsystems do not even do cc: stable, but that is because
those subsystem maintainers do not want to do it, or do not care.
Again, checkpatch is not going to help them.

checkpatch is not a panacea, people still have to use their brains.

greg k-h
