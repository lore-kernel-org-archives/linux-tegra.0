From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 01/28] ARM: tegra: apalis_t30: enable broken-hpi on emmc
Date: Tue, 24 Jul 2018 17:55:14 +0300
Message-ID: <3879609.rmqHIZXFHx@dimapc>
References: <20180722164936.20581-1-marcel@ziswiler.com> <1992775.WBgY65Ajyy@dimapc> <1532442416.6124.28.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532442416.6124.28.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday, 24 July 2018 17:26:58 MSK Marcel Ziswiler wrote:
> On Tue, 2018-07-24 at 17:03 +0300, Dmitry Osipenko wrote:
> 
> > On Sunday, 22 July 2018 19:49:09 MSK Marcel Ziswiler wrote:
> > 
> > > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > > 
> > > Avoid eMMC issues by specifying broken-hpi.
> > > 
> > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > > 
> > > ---
> > 
> > 
> > Is it a specific eMMC card model that has broken HPI or it is a host 
> > controller bug?
> 
> 
> That is a very good question. So far we only have confirmation that at
> least some eMMCs from Hynix resp. SKHynix definitely do have bad
> firmware. I also found out that ASUS resp. Google did disable HPI on
> their Nexus 7 tablet. Therefore, we also disabled HPI quite a while ago
> in our downstream BSPs which we successfully validated & verified doing
> power cuts and running stress tests in our temperature chambers. I
> guess we would have to run more extensive tests with mainline with and
> without this setting to be able to really answer your question. For now
> I just successfully run a few Apalis T30 and Colibri T30 modules with
> this setting over the weekend doing both hdparm -t as well as dding
> some urandom files to the eMMC in a loop without seeing any issues.

The broken-hpi quirk was added for the Hynix cards specifically in [0]. Maybe 
you should just extend the mmc_ext_csd_fixups list in [1] with another OEM ID?

[0] https://patchwork.kernel.org/patch/9168455/
[1] drivers/mmc/core/quirks.h
