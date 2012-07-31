From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC][PATCH v3 1/3] runtime interpreted power sequences
Date: Tue, 31 Jul 2012 15:23:14 +0100
Message-ID: <20120731142313.GU4468@opensource.wolfsonmicro.com>
References: <1343390750-3642-1-git-send-email-acourbot@nvidia.com>
 <1343390750-3642-2-git-send-email-acourbot@nvidia.com>
 <CAPnjgZ0H2xrJcL-ytMaX11iYrrhCg7LEM00u_NgEaveM4gHMPw@mail.gmail.com>
 <50179933.9090501@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <50179933.9090501@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: Simon Glass <sjg@chromium.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 31, 2012 at 05:37:07PM +0900, Alex Courbot wrote:
> On 07/30/2012 08:00 PM, Simon Glass wrote:

> >For the delay, I think milliseconds is reasonable. I suppose there is
> >no reasonable need for microseconds?

> I don't see any need for microseconds myself - anybody sees use for
> finer-grained delays?

Bouncing reset lines, often the time required for reset is down in the
microseconds.
