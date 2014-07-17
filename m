From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Thu, 17 Jul 2014 12:01:56 +0300
Message-ID: <20140717090156.GR23218@tbergstrom-lnx.Nvidia.com>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <17053542.QUGvfkeRmc@wuerfel> <20140716151427.GA22027@ulmo>
 <6322144.IB6iKDb6TK@wuerfel> <20140716185715.GA4843@mithrandir>
 <20140717085308.GQ23218@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140717085308.GQ23218@tbergstrom-lnx.Nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 17, 2014 at 10:53:08AM +0200, Peter De Schrijver wrote:
> On Wed, Jul 16, 2014 at 08:57:16PM +0200, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> > 
> > On Wed, Jul 16, 2014 at 05:22:03PM +0200, Arnd Bergmann wrote:
> > > On Wednesday 16 July 2014 17:14:29 Thierry Reding wrote:
> > > > > 
> > > > > Ok, I'll have a look. I think when this becomes a separate driver, it
> > > > > should also have its own header file, so maybe you can in the meantime
> > > > > make it a local header file in mach-tegra until we have found a good
> > > > > place for it.
> > > > 
> > > > Why do you think it should be a separate header? We already have a
> > > > couple in include/linux and I'm not sure it's useful to add even more.
> > > > If anything I would've thought it made sense to move the content of the
> > > > other headers into tegra-soc.h.
> > > 
> > > I very much dislike the idea of having a per-vendor header file that
> > > everything gets crammed into. We should try to have proper subsystems
> > > and generic interfaces for these wherever possible.
> > 
> > I completely agree. However spreading the SoC-specific functions across
> > multiple header files isn't going to help. If we keep all the per-vendor
> > APIs in one file it makes it easier to see what could still be moved off
> > into a separate subsystem.
> > 
> > Now for PMC specifically, we've investigated converting the powergate
> > API to power domains. I don't think it will be possible to make that
> > work. The issue is that there's a defined sequence that needs to be
> > respected to make sure the device is powered up properly. That sequence
> > involves the primary clock and reset of the device. It's been proposed
> > to make these clocks available to the PMC driver so that it can control
> > them, but then we can't make sure that clocks are really off if they
> > need to be, since we have two drivers accessing them. The only way I see
> 
> resets do not have reference counts, so they can be controlled by a
> powerdomain driver without any problems. For clocks, there would only be
> a problem for the module clocks if the drivers don't use runtime PM. If
> we move all drivers to runtime PM, the clock control can move into the
> powerdomain code and runtime PM will ensure domains are not turned off
> with active modules.
> 
> > to make that work reliably is by moving complete control of the
> > powergate into drivers so that they can make sure clocks and resets are
> > in the correct states.
> > 
> 
> Which won't work if you have domains which contain several modules.

We also need to control the memory clients in the domains using
MC_CLIENT_HOTRESET_CTRL.

Cheers,

Peter.
