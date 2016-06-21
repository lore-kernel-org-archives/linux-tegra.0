From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v2] arm: tegra124: remove commas from unit addresses
Date: Tue, 21 Jun 2016 07:56:41 +0000
Message-ID: <1466495800.4742.1.camel@toradex.com>
References: <1466298275-15753-1-git-send-email-marcel.ziswiler@toradex.com>
 <576810C2.1030401@wwwdotorg.org> <20160620164057.GD6175@ulmo.ba.sec>
 <57681DC3.9090801@wwwdotorg.org> <20160620171124.GA6333@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160620171124.GA6333@ulmo.ba.sec>
Content-Language: en-US
Content-ID: <792C77FF8362D14FA983F57CB1E94295@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2016-06-20 at 19:11 +0200, Thierry Reding wrote:
> On Mon, Jun 20, 2016 at 10:45:55AM -0600, Stephen Warren wrote:
> > 
> > On 06/20/2016 10:40 AM, Thierry Reding wrote:
> > > 
> > > On Mon, Jun 20, 2016 at 09:50:26AM -0600, Stephen Warren wrote:
> > > > 
> > > > On 06/18/2016 07:04 PM, Marcel Ziswiler wrote:
> > > > > 
> > > > > Remove commas from unit addresses as suggested by Rob Herring
> > > > > upon me
> > > > > posting initial Apalis TK1 support:
> > > > > 
> > > > > http://article.gmane.org/gmane.linux.ports.tegra/26608
> > > > Acked-by: Stephen Warren <swarren@nvidia.com>
> > > I'm confused now. I posted almost exactly the same patch a while
> > > ago and
> > > we agreed that we couldn't do this because the node names were to
> > > be
> > > considered part of the ABI.
> > > 
> > > Is it or is it not?
> > The particular case where it matters is the GPU node, which U-Boot
> > manipulates. This revised patch version no longer renames the GPU
> > node and
> > so in practice avoids any issues that I'm aware of.
> > 
> > If there's a more general rule that node names are part of the ABI,
> > then
> > indeed we shouldn't take this patch.
> I'm somewhat uncomfortable with this notion. Just because we don't
> know
> of any other cases doesn't mean there aren't any. My understanding is
> that it's fairly common to look up device tree nodes by name, however
> brittle that may be.
> 
> There's also the matter of consistency to consider here. I suspect
> that
> if we make this change somebody will notice the odd one out and send
> patches to "fix it up". So if we get confirmation about this change
> being okay, I'd request that a comment be added to the GPU node as to
> why it is not converted.

Sure, let me add such a comment in a v3 that it is crystal clear why we
did so.

> Thierry


Thanks Thierry.

Cheers

Marcel
